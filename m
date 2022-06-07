Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C402FC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 13:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMkw4TCMu0D94LpuwsDIIRXiblMGd5GWtwvdC25HayI=; b=XNqm/HaQDYXpWM
	y/ShWnbPir/Kh+XDOa/Th//56ltobmF6aSiBU3Go77JwXAvEBv0hkTK5llWDmIxthj7CgiIC9fPdv
	JhldvCWKhh2JZTCi0rXgrxElCsb6bc93dYJxPAA8x3/+VTKmZLMRV1pjhfQiuDLnMCh7UUPdNCaD9
	sMMIHeBxMsq1fV2KDphpvcDdAopf4As6x5CNzCy8F0z/5IimFmMmtVdfklNwJYGSAbrzn2jKsP/xe
	TkAFPT9iBOLdsgAQRIGrb8D7ihaqDgcVjrOk6VmwVYKFOAwo8M9sYXFEAnTTzSIS60ZCdy2/vGUb0
	B54RkKORUs15VWQbf+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZ5k-007cwS-D3; Tue, 07 Jun 2022 13:17:52 +0000
Received: from forward501o.mail.yandex.net ([2a02:6b8:0:1a2d::611])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZ5H-007cXS-RX; Tue, 07 Jun 2022 13:17:26 +0000
Received: from myt6-26f37b5fec36.qloud-c.yandex.net (myt6-26f37b5fec36.qloud-c.yandex.net [IPv6:2a02:6b8:c12:5527:0:640:26f3:7b5f])
	by forward501o.mail.yandex.net (Yandex) with ESMTP id 5183B45C4E6C;
	Tue,  7 Jun 2022 16:16:56 +0300 (MSK)
Received: from myt6-654ec0a0ab93.qloud-c.yandex.net (myt6-654ec0a0ab93.qloud-c.yandex.net [2a02:6b8:c12:1d80:0:640:654e:c0a0])
	by myt6-26f37b5fec36.qloud-c.yandex.net (mxback/Yandex) with ESMTP id smaqJmKSH2-GtfeQLwf;
	Tue, 07 Jun 2022 16:16:56 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1654607816;
	bh=JvNF2tl4VACbLjlnTM0H4TIIrNNoBngMOz0q/FiVjZc=;
	h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
	b=GwKizgbQ3nskMntGKiwqljCR4wdHj/+4vKGtzccxpe1C/zu43jeu6N0Z3YY5QLCNE
	 uWEItwdNbsgAJmICe+XDiErcvn3CS65MmNoFUGN0PfOcQSFjUzRzFl72WtYX3ApqD+
	 camc4PT2YMpr77TN4A0atwWhVWkaHMLY0zq6/QmQ=
Authentication-Results: myt6-26f37b5fec36.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt6-654ec0a0ab93.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id sOXgg17Zrk-GrM4PiLo;
	Tue, 07 Jun 2022 16:16:53 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PMU PROFILING AND DEBUGGING)
Subject: [PATCH v3 1/4] RISC-V: Create unique identification for SoC PMU
Date: Tue,  7 Jun 2022 16:16:44 +0300
Message-Id: <20220607131648.29439-2-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607131648.29439-1-nikita.shubin@maquefel.me>
References: <20220607131648.29439-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_061724_367808_1B1DBC6B 
X-CRM114-Status: GOOD (  15.54  )
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

RnJvbTogSm/Do28gTcOhcmlvIERvbWluZ29zIDxqb2FvLm1hcmlvQHRlY25pY28udWxpc2JvYS5w
dD4KClRoZSBTQkkgUE1VIHBsYXRmb3JtIGRyaXZlciBkaWQgbm90IHByb3ZpZGUgYW55IGlkZW50
aWZpY2F0aW9uIGZvcgpwZXJmIGV2ZW50cyBtYXRjaGluZy4gVGhpcyBwYXRjaCBpbnRyb2R1Y2Vz
IGEgbmV3IHN5c2ZzIGZpbGUgaW5zaWRlIHRoZQpwbGF0Zm9ybSBkZXZpY2UgKHNvYzpwbXUvaWQp
IGZvciBwbXUgaWRlbnRpZmljYXRpb24uCgpUaGUgaWRlbnRpZmljYXRpb24gaXMgYSA2NC1iaXQg
dmFsdWUgZ2VuZXJhdGVkIGFzOgpbNjMtMzJdOiBtdmVuZG9yaWQ7ClszMV06IG1hcmNoaWRbTVNC
XTsKWzMwLTE2XTogbWFyY2hpZFsxNS0wXTsKWzE1LTBdOiBtaW1waWRbMTVNU0JzXTsKClRoZSBD
U1JzIGFyZSBkZXRhaWxlZCBpbiB0aGUgUklTQy1WIHByaXZpbGVnZWQgc3BlYyBbMV0uClRoZSBt
YXJjaGlkIGlzIHNwbGl0IGluIE1TQiArIDE1TFNCcywgZHVlIHRvIHRoZSBNU0IgYmVpbmcgdXNl
ZCBmb3IKb3Blbi1zb3VyY2UgYXJjaGl0ZWN0dXJlIGlkZW50aWZpY2F0aW9uLgoKWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsCgpTaWduZWQtb2ZmLWJ5OiBKb8Oj
byBNw6FyaW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0PgpUZXN0ZWQt
Ynk6IE5pa2l0YSBTaHViaW4gPG4uc2h1YmluQHlhZHJvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tl
cm5lbC9zYmkuYyAgICAgIHwgIDMgKysrCiBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwg
NDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDUwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCmluZGV4IDc3NWQzMzIyYjQyMi4uNTBkZDliNmVjYzll
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zYmkuYwpAQCAtNjI3LDE2ICs2MjcsMTkgQEAgbG9uZyBzYmlfZ2V0X212ZW5kb3JpZCh2
b2lkKQogewogCXJldHVybiBfX3NiaV9iYXNlX2VjYWxsKFNCSV9FWFRfQkFTRV9HRVRfTVZFTkRP
UklEKTsKIH0KK0VYUE9SVF9TWU1CT0woc2JpX2dldF9tdmVuZG9yaWQpOwogCiBsb25nIHNiaV9n
ZXRfbWFyY2hpZCh2b2lkKQogewogCXJldHVybiBfX3NiaV9iYXNlX2VjYWxsKFNCSV9FWFRfQkFT
RV9HRVRfTUFSQ0hJRCk7CiB9CitFWFBPUlRfU1lNQk9MKHNiaV9nZXRfbWFyY2hpZCk7CiAKIGxv
bmcgc2JpX2dldF9taW1waWQodm9pZCkKIHsKIAlyZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklf
RVhUX0JBU0VfR0VUX01JTVBJRCk7CiB9CitFWFBPUlRfU1lNQk9MKHNiaV9nZXRfbWltcGlkKTsK
IAogc3RhdGljIHZvaWQgc2JpX3NlbmRfY3B1bWFza19pcGkoY29uc3Qgc3RydWN0IGNwdW1hc2sg
KnRhcmdldCkKIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9k
cml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCmluZGV4IGExMzE3YTQ4MzUxMi4uMTVhYjNkYzY4
ZTdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCisrKyBiL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKQEAgLTY5Myw2ICs2OTMsNDYgQEAgc3RhdGljIGludCBw
bXVfc2JpX3NldHVwX2lycXMoc3RydWN0IHJpc2N2X3BtdSAqcG11LCBzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGUKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHVpbnQ2NF90IHBtdV9zYmlfZ2V0
X3BtdV9pZCh2b2lkKQoreworCXVuaW9uIHNiaV9wbXVfaWQgeworCQl1aW50NjRfdCB2YWx1ZTsK
KwkJc3RydWN0IHsKKwkJCXVpbnQxNl90IGltcDoxNjsKKwkJCXVpbnQxNl90IGFyY2g6MTY7CisJ
CQl1aW50MzJfdCB2ZW5kb3I6MzI7CisJCX07CisJfSBwbXVpZDsKKworCXBtdWlkLnZhbHVlID0g
MDsKKwlwbXVpZC52ZW5kb3IgPSAodWludDMyX3QpIHNiaV9nZXRfbXZlbmRvcmlkKCk7CisJcG11
aWQuYXJjaCA9IChzYmlfZ2V0X21hcmNoaWQoKSA+PiAoNjMgLSAxNSkgJiAoMSA8PCAxNSkpIHwg
KHNiaV9nZXRfbWFyY2hpZCgpICYgMHg3RkZGKTsKKwlwbXVpZC5pbXAgPSAoc2JpX2dldF9taW1w
aWQoKSA+PiAxNik7CisKKwlyZXR1cm4gcG11aWQudmFsdWU7Cit9CisKK3N0YXRpYyBzc2l6ZV90
IHBtdV9zYmlfaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCXN0cnVjdCBkZXZpY2VfYXR0
cmlidXRlICphdHRyLCBjaGFyICpidWYpCit7CisJaW50IGxlbjsKKworCWxlbiA9IHNwcmludGYo
YnVmLCAiMHglbGx4XG4iLCBwbXVfc2JpX2dldF9wbXVfaWQoKSk7CisJaWYgKGxlbiA8PSAwKQor
CQlkZXZfZXJyKGRldiwgIm15ZHJ2OiBJbnZhbGlkIHNwcmludGYgbGVuOiAlZG4iLCBsZW4pOwor
CisJcmV0dXJuIGxlbjsKK30KKworc3RhdGljIERFVklDRV9BVFRSKGlkLCBTX0lSVUdPIHwgU19J
V1VTUiwgcG11X3NiaV9pZF9zaG93LCAwKTsKKworc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKnBt
dV9zYmlfYXR0cnNbXSA9IHsKKwkmZGV2X2F0dHJfaWQuYXR0ciwKKwlOVUxMCit9OworCitBVFRS
SUJVVEVfR1JPVVBTKHBtdV9zYmkpOworCiBzdGF0aWMgaW50IHBtdV9zYmlfZGV2aWNlX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHJpc2N2X3BtdSAqcG11
ID0gTlVMTDsKQEAgLTcyOSw2ICs3NjksMTMgQEAgc3RhdGljIGludCBwbXVfc2JpX2RldmljZV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXBtdS0+Y3RyX2NsZWFyX2lkeCA9
IHBtdV9zYmlfY3RyX2NsZWFyX2lkeDsKIAlwbXUtPmN0cl9yZWFkID0gcG11X3NiaV9jdHJfcmVh
ZDsKIAorCXJldCA9IHN5c2ZzX2NyZWF0ZV9ncm91cCgmcGRldi0+ZGV2LmtvYmosICZwbXVfc2Jp
X2dyb3VwKTsKKwlpZiAocmV0KSB7CisJCWRldl9lcnIoJnBkZXYtPmRldiwgInN5c2ZzIGNyZWF0
aW9uIGZhaWxlZFxuIik7CisJCXJldHVybiByZXQ7CisJfQorCXBkZXYtPmRldi5ncm91cHMgPSBw
bXVfc2JpX2dyb3VwczsKKwogCXJldCA9IGNwdWhwX3N0YXRlX2FkZF9pbnN0YW5jZShDUFVIUF9B
UF9QRVJGX1JJU0NWX1NUQVJUSU5HLCAmcG11LT5ub2RlKTsKIAlpZiAocmV0KQogCQlyZXR1cm4g
cmV0OwotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
