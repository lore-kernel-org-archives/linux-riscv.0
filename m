Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585D3C10DCE
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOLHprrmQIvRIJTNFaFtnzZ1+eCEqjeTc/DgdIq9Ec4=; b=pooOMHyt2fgiz6
	nk7qtidpqTwzbd9CMemkOEsbGFTQelOPnBb3WGEcMhQittQBnP8AcNPG0c+XlwsnHGWXtPA2Pfqiw
	0MpTThTLhsw2UIiaPUo5rWUXiMXR3JaaCov0Y5WiVjDnFdXA1IqyufDX1gRD+WkINZVvfzOMQNkKk
	T9DUNlFg9ELas0erj049yr01LirOT+awqPzEZuSDVpbi6VETpf7fymbOwpnsV4BOSt8onGKPda0eU
	YQtsThV1z2G78N7Bh/cOY8dYnjVVn9/mdDParP+4LD1XXrdJKFTLTowt0T/TdW2m2nolKPxMzj1ju
	NrCwWhbRdFZf7YjobnzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqPn-00A7g6-2k;
	Wed, 06 Dec 2023 11:50:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([185.203.201.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqOO-00A6HK-26
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 11:48:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOK-00076B-8s; Wed, 06 Dec 2023 12:48:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOH-00Dww5-4V; Wed, 06 Dec 2023 12:48:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOG-00FR1V-RY; Wed, 06 Dec 2023 12:48:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@pengutronix.de,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH v4 076/115] pwm: microchip-core: Make use of devm_pwmchip_alloc() function
Date: Wed,  6 Dec 2023 12:44:30 +0100
Message-ID: <2dda818b8bbbe8ba4b9df5ab54f960ff4a4f1ab5.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2673; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=O91DAufZtIdpecS5GjcVtAu43YTifjp2DD84oKMoiQ4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF7w02HcUkYomobV9EpgiVKZNLKi9HhzNAK8u 6PTGLIc66aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBe8AAKCRCPgPtYfRL+ TvlTB/43dhCjkvfOwxLcHlj5eVH8cQihuwWD6HipskzoY6wOBTk/4OfgHuXBW3qLUqGQATKfEqQ Biw70nce8bXSYYTw1sSc4FzKrcBDeyC1lz+mhpJ8rBLmRRrgQ/iHw/YRf0S6CZKeuUVKBe/Juic ZgXNy3g7ysBnNJeEPQGwD/PvejSlq41ALzzA0I3OgcRlL2FMaT19jBGiO85/XII53Hu4QauNJLI hBDWlgJ54AQJ5o4ec4DtAARiIf+jWxfk5zHKsT+jz0q0WmRL+Lwx9LFodc0KVvKhMaEfT2l358w QUrrNUdt3D0HEGvukxh+HclDHLvfNq5GJvNEbqpUYMMQsWpC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_034840_724103_AB59271F 
X-CRM114-Status: GOOD (  13.68  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBwcmVwYXJlcyB0aGUgcHdtLW1pY3JvY2hpcC1jb3JlIGRyaXZlciB0byBmdXJ0aGVyIGNo
YW5nZXMgb2YgdGhlIHB3bSBjb3JlCm91dGxpbmVkIGluIHRoZSBjb21taXQgaW50cm9kdWNpbmcg
ZGV2bV9wd21jaGlwX2FsbG9jKCkuIFRoZXJlIGlzIG5vCmludGVuZGVkIHNlbWFudGljYWwgY2hh
bmdlIGFuZCB0aGUgZHJpdmVyIHNob3VsZCBiZWhhdmUgYXMgYmVmb3JlLgoKQWNrZWQtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9wd20vcHdtLW1pY3JvY2hpcC1jb3JlLmMgfCAxNyArKysrKysrKy0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3B3bS9wd20tbWljcm9jaGlwLWNvcmUuYyBiL2RyaXZlcnMvcHdtL3B3bS1taWNy
b2NoaXAtY29yZS5jCmluZGV4IGMwYzUzOTY4ZjNlOS4uYzFmMjI4N2I4ZTk3IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3B3bS9wd20tbWljcm9jaGlwLWNvcmUuYworKysgYi9kcml2ZXJzL3B3bS9wd20t
bWljcm9jaGlwLWNvcmUuYwpAQCAtNTQsNyArNTQsNiBAQAogI2RlZmluZSBNQ0hQQ09SRVBXTV9U
SU1FT1VUX01TCTEwMHUKIAogc3RydWN0IG1jaHBfY29yZV9wd21fY2hpcCB7Ci0Jc3RydWN0IHB3
bV9jaGlwIGNoaXA7CiAJc3RydWN0IGNsayAqY2xrOwogCXZvaWQgX19pb21lbSAqYmFzZTsKIAlz
dHJ1Y3QgbXV0ZXggbG9jazsgLyogcHJvdGVjdHMgdGhlIHNoYXJlZCBwZXJpb2QgKi8KQEAgLTY1
LDcgKzY0LDcgQEAgc3RydWN0IG1jaHBfY29yZV9wd21fY2hpcCB7CiAKIHN0YXRpYyBpbmxpbmUg
c3RydWN0IG1jaHBfY29yZV9wd21fY2hpcCAqdG9fbWNocF9jb3JlX3B3bShzdHJ1Y3QgcHdtX2No
aXAgKmNoaXApCiB7Ci0JcmV0dXJuIGNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QgbWNocF9jb3Jl
X3B3bV9jaGlwLCBjaGlwKTsKKwlyZXR1cm4gcHdtY2hpcF9nZXRfZHJ2ZGF0YShjaGlwKTsKIH0K
IAogc3RhdGljIHZvaWQgbWNocF9jb3JlX3B3bV9lbmFibGUoc3RydWN0IHB3bV9jaGlwICpjaGlw
LCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLApAQCAtNDQ3LDEzICs0NDYsMTUgQEAgTU9EVUxFX0RF
VklDRV9UQUJMRShvZiwgbWNocF9jb3JlX29mX21hdGNoKTsKIAogc3RhdGljIGludCBtY2hwX2Nv
cmVfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CisJc3RydWN0IHB3
bV9jaGlwICpjaGlwOwogCXN0cnVjdCBtY2hwX2NvcmVfcHdtX2NoaXAgKm1jaHBfY29yZV9wd207
CiAJc3RydWN0IHJlc291cmNlICpyZWdzOwogCWludCByZXQ7CiAKLQltY2hwX2NvcmVfcHdtID0g
ZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqbWNocF9jb3JlX3B3bSksIEdGUF9LRVJO
RUwpOwotCWlmICghbWNocF9jb3JlX3B3bSkKLQkJcmV0dXJuIC1FTk9NRU07CisJY2hpcCA9IGRl
dm1fcHdtY2hpcF9hbGxvYygmcGRldi0+ZGV2LCAxNiwgc2l6ZW9mKCptY2hwX2NvcmVfcHdtKSk7
CisJaWYgKElTX0VSUihjaGlwKSkKKwkJcmV0dXJuIFBUUl9FUlIoY2hpcCk7CisJbWNocF9jb3Jl
X3B3bSA9IHRvX21jaHBfY29yZV9wd20oY2hpcCk7CiAKIAltY2hwX2NvcmVfcHdtLT5iYXNlID0g
ZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCwgJnJlZ3MpOwog
CWlmIChJU19FUlIobWNocF9jb3JlX3B3bS0+YmFzZSkpCkBAIC00NzAsOSArNDcxLDcgQEAgc3Rh
dGljIGludCBtY2hwX2NvcmVfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAKIAltdXRleF9pbml0KCZtY2hwX2NvcmVfcHdtLT5sb2NrKTsKIAotCW1jaHBfY29yZV9wd20t
PmNoaXAuZGV2ID0gJnBkZXYtPmRldjsKLQltY2hwX2NvcmVfcHdtLT5jaGlwLm9wcyA9ICZtY2hw
X2NvcmVfcHdtX29wczsKLQltY2hwX2NvcmVfcHdtLT5jaGlwLm5wd20gPSAxNjsKKwljaGlwLT5v
cHMgPSAmbWNocF9jb3JlX3B3bV9vcHM7CiAKIAltY2hwX2NvcmVfcHdtLT5jaGFubmVsX2VuYWJs
ZWQgPSByZWFkYl9yZWxheGVkKG1jaHBfY29yZV9wd20tPmJhc2UgKyBNQ0hQQ09SRVBXTV9FTigw
KSk7CiAJbWNocF9jb3JlX3B3bS0+Y2hhbm5lbF9lbmFibGVkIHw9CkBAIC00ODUsNyArNDg0LDcg
QEAgc3RhdGljIGludCBtY2hwX2NvcmVfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJd3JpdGVsX3JlbGF4ZWQoMVUsIG1jaHBfY29yZV9wd20tPmJhc2UgKyBNQ0hQQ09S
RVBXTV9TWU5DX1VQRCk7CiAJbWNocF9jb3JlX3B3bS0+dXBkYXRlX3RpbWVzdGFtcCA9IGt0aW1l
X2dldCgpOwogCi0JcmV0ID0gZGV2bV9wd21jaGlwX2FkZCgmcGRldi0+ZGV2LCAmbWNocF9jb3Jl
X3B3bS0+Y2hpcCk7CisJcmV0ID0gZGV2bV9wd21jaGlwX2FkZCgmcGRldi0+ZGV2LCBjaGlwKTsK
IAlpZiAocmV0KQogCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsICJGYWls
ZWQgdG8gYWRkIHB3bWNoaXBcbiIpOwogCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
