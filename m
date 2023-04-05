Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D54C76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=duhlQOoB4m1V5p3W1ZtMcGQNgIXrZ/JLJlkuXQHLh+E=; b=zo42LfSnAUzuP9
	lHNkIOK5N1qwSsv/OrZGIJ8I5+Htgawi/DHwjGrSEcvck3PFTUSxLK3/Mu5TuayUGTb1s25CFl6SY
	cr28c8Iu2/kF6bvhTy2CJGPr41ZHYncU2DDDBR8npTeX+RmWyDqDLaZFvH+jyrLl1uf3lvoX7odr4
	Du7d3c37vlRzOeaYlN1OncONpVodEDAscB3xm67LAsqgpM9EQTTJWMYWkqBJXXpun4UPOL351QCdm
	wuIHbZVVirjNPncQ/PqHl4weMaP4Vs/0A+K/CpkZ7PXdXkBpRmG6Z9BxWSMefhpEKVhllCMtgRcZ7
	EML2byQZYYbM9GGZ8DoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3qN-004cWk-2P;
	Wed, 05 Apr 2023 14:10:35 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3qL-004cUd-0O
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 14:10:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q6-0003FA-5Y; Wed, 05 Apr 2023 16:10:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q3-009AbX-JG; Wed, 05 Apr 2023 16:10:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pk3q2-00AmTj-If; Wed, 05 Apr 2023 16:10:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-usb@vger.kernel.org,
	kernel@pengutronix.de,
	linux-mips@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 00/10] usb: musb: Convert to platform remove callback returning void
Date: Wed,  5 Apr 2023 16:09:59 +0200
Message-Id: <20230405141009.3400693-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=y5P77BkcrdOtb/jU7g30i0OmKFgbBK/VXLhzJ7hsVXY=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhTdRn1L4VMMF7t5Ctkm2O4pe/vUrsfKRt9EMbCBXYvpZ 3b/7a2djMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAEyE5Sz7/4qp33SjuSouaNRP UuliYeFZvCvTrLZIsOyg1qGT1+VuVcu6/zGWndV/ItrbIkzW8kntxSLvdQ4rrtiHqfY+89CcNKP 3xZpz8ytrS51+ia9bJ7LA4XLlH1bX3RMPztzuE8NXXt+xYWLk5eApPwQCHr1J/P59mWGe7bagWQ /M1BeFeX/1UFgUNcNly6lNAvNvF70MKrOz1d7jZak0rYqpZnfe+1Ma5+V9xPrOGs6pk1g4Z23Ai VMWB40F0ji2JL169jc2W+mTZ8dy5cCuB8UOZqGnJAU0/b/1JXscqeyx8OZ3TIm9cKHjt9essnt8 2TN2TpXoVNgZ3pkTddNQ90LqdzaJevknxjFcu5LKPCoA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_071033_163516_F12E2F85 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgp0aGlzIHBhdGNoIHNlcmllcyBhZGFwdHMgdGhlIHBsYXRmb3JtIGRyaXZlcnMgYmVs
b3cgZHJpdmVycy91c2IvbXVzYgp0byB1c2UgdGhlIC5yZW1vdmVfbmV3KCkgY2FsbGJhY2suIENv
bXBhcmVkIHRvIHRoZSB0cmFkaXRpb25hbCAucmVtb3ZlKCkKY2FsbGJhY2sgLnJlbW92ZV9uZXco
KSByZXR1cm5zIG5vIHZhbHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlCnRoZSBkcml2
ZXIgY29yZSBkb2Vzbid0IChhbmQgY2Fubm90KSBjb3BlIGZvciBlcnJvcnMgZHVyaW5nIHJlbW92
ZS4gVGhlCm9ubHkgZWZmZWN0IG9mIGEgbm9uLXplcm8gcmV0dXJuIHZhbHVlIGluIC5yZW1vdmUo
KSBpcyB0aGF0IHRoZSBkcml2ZXIKY29yZSBlbWl0cyBhIHdhcm5pbmcuIFRoZSBkZXZpY2UgaXMg
cmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybgpmcm9tIC5yZW1vdmUoKSB1c3VhbGx5
IHlpZWxkcyBhIHJlc291cmNlIGxlYWsuCgpCeSBjaGFuZ2luZyB0aGUgcmVtb3ZlIGNhbGxiYWNr
IHRvIHJldHVybiB2b2lkIGRyaXZlciBhdXRob3JzIGNhbm5vdApyZWFzb25hYmx5IGFzc3VtZSBh
bnkgbW9yZSB0aGF0IHRoZXJlIGlzIHNvbWUga2luZCBvZiBjbGVhbnVwIGxhdGVyLgoKQWxsIGRy
aXZlcnMgdG91Y2hlZCBoZXJlIHJldHVybmVkIHplcm8gdW5jb25kaXRpb25hbGx5IGluIHRoZWly
IHJlbW92ZQpjYWxsYmFjaywgc28gdGhleSBjb3VsZCBhbGwgYmUgY29udmVydGVkIHRyaXZpYWxs
eSB0byAucmVtb3ZlX25ldygpLgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcg
KDEwKToKICB1c2I6IG11c2I6IGRhOHh4OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZAogIHVzYjogbXVzYjogano0NzQwOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHVzYjogbXVzYjogbWVkaWF0ZWs6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgdXNi
OiBtdXNiOiBtcGZzOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZAogIHVzYjogbXVzYjogbXVzYl9jb3JlOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHVzYjogbXVzYjogbXVzYl9kc3BzOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHVzYjogbXVzYjog
b21hcDI0MzA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkCiAgdXNiOiBtdXNiOiBzdW54aTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKICB1c2I6IG11c2I6IHR1c2I2MDEwOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHVzYjogbXVzYjogdXg1MDA6IENv
bnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCgogZHJpdmVy
cy91c2IvbXVzYi9kYTh4eC5jICAgICB8IDYgKystLS0tCiBkcml2ZXJzL3VzYi9tdXNiL2p6NDc0
MC5jICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvdXNiL211c2IvbWVkaWF0ZWsuYyAgfCA2ICsrLS0t
LQogZHJpdmVycy91c2IvbXVzYi9tcGZzLmMgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL3VzYi9t
dXNiL211c2JfY29yZS5jIHwgNSArKy0tLQogZHJpdmVycy91c2IvbXVzYi9tdXNiX2RzcHMuYyB8
IDYgKystLS0tCiBkcml2ZXJzL3VzYi9tdXNiL29tYXAyNDMwLmMgIHwgNiArKy0tLS0KIGRyaXZl
cnMvdXNiL211c2Ivc3VueGkuYyAgICAgfCA2ICsrLS0tLQogZHJpdmVycy91c2IvbXVzYi90dXNi
NjAxMC5jICB8IDYgKystLS0tCiBkcml2ZXJzL3VzYi9tdXNiL3V4NTAwLmMgICAgIHwgNiArKy0t
LS0KIDEwIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQoK
YmFzZS1jb21taXQ6IGZlMTVjMjZlZTI2ZWZhMTE3NDFhN2I2MzJlOWYyM2IwMWFjYTRjYzYKLS0g
CjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
