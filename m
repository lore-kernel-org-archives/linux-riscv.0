Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0506D31A3C
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMxIk12DJSFBmvMHdSdVbbaJv54goV2RcXfYSCwYucw=; b=0FkBvhITCLaLDZ
	4rE+uxr3QhE2nxUDUuVPJabRqxY6YQpRRvXl3gsXTPreMPV6PJ/NwEi4/akd/OvIlipswo5AcpURP
	iaSmFFdXdy5D/eZv6i8PdoYxgKwVuQHcbjCSjE92CxTTVCLnPCfLu3cTqWnToLVDoYQfuF/otSxgb
	lj6wP0rMPiKbRpG6G9aE1YcwDu9G6Zny0tfCWDW+ZMGHZ5F6ONqX3kA3C+oLoBh2NLDtkLN0BHJDm
	vp2zYqm52i1SZCjDj3KDoy4JO5ZCkFt5gFE7R0oAabnwuDSB/A6mvmetrtNnKXCg12+lDiWmFnTRD
	YQg9kupLuEuMrFKYc99g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxlA-00000008fTN-0S4c;
	Wed, 14 Jan 2026 10:05:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxkw-00000008fN3-3zzl
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 10:05:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 915EB1A285D;
	Wed, 14 Jan 2026 10:05:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65BD56074A;
	Wed, 14 Jan 2026 10:05:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C775103C895C;
	Wed, 14 Jan 2026 11:05:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768385136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N7RyILljdMQfZkiQ7TRm3/JaE4XCEFcEURo9J0hqJe8=;
	b=i1MoCC9wXljtm5S02Ax+xfBD3bfZ4TrezEHmOvOLo9mfIuPMRqvz8iqGJpIH1J+z8DXMMJ
	hFyGiHG1raFGDTyLEe3bHL42a1xFXVaprDtkV1I4Wz5gTwQEZe9wr0kX3DrvHE/3IFqUc3
	totiopnATIOMatGUZbCFi5b8Rp4iTWmxYXDkdoPfwAx1Xj94jK0IHSPu7wkC50ZSF1b5h7
	kHVNNvywdEQzrDJEv/8eZNRv4oB/ge1PVAopvBq0OpfX0mUHvM52W5C0WLJzhjJyAlc+LW
	aPYQpKFggZFxBcopMhB4Bjo8gMg0p/y9r5HGLufvM47sMAdkHbZYZmrS8vEkRA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 14 Jan 2026 11:05:07 +0100
Subject: [PATCH v3 03/10] clk: fixed-factor: Rework initialization with
 parent clocks
MIME-Version: 1.0
Message-Id: <20260114-clk-eyeq7-v3-3-8ebdba7b0133@bootlin.com>
References: <20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com>
In-Reply-To: <20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020540_418707_4DDBDD95 
X-CRM114-Status: GOOD (  13.14  )
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

VXNlIHRoZSBzYW1lIHNlcXVlbmNlIGFzIGNsay1kaXZpZGVyLCBjbGstZ2F0ZSBhbmQgb3RoZXIg
dG8gc2V0IHRoZQpwYXJlbnRfbmFtZXMsIHBhcmVudF9od3MgYW5kIHBhcmVudF9kYXRhIGluIHRo
ZSBpbml0IHN0cnVjdCB3aGVuCnJlZ2lzdGVyaW5nIGEgZml4ZWQtZmFjdG9yIGNsb2NrLiBUaGUg
bnVtYmVyIG9mIHBhcmVudCBjbG9ja3MgaXMgbm93Cm9ubHkgc2V0IHRvIG9uZSBpZiBhIHBhcmVu
dCBjbG9jayBpcyBwcm92aWRlZC4KClByZXZpb3VzbHkgdGhlIG51bWJlciBvZiBwYXJlbnQgY2xv
Y2tzIHdhcyBhbHdheXMgb25lLCBmb3JjaW5nIGNhbGxlcnMKb2YgX19jbGtfaHdfcmVnaXN0ZXJf
Zml4ZWRfZmFjdG9yKCkgdG8gcHJvdmlkZSBhIGR1bW15IHBhcmVudF9kYXRhCnN0cnVjdCB3aXRo
IGFuIGludmFsaWQgY2xvY2sgaW5kZXggaW4gY2FzZSB0aGV5IHdlcmUgbm90IHByb3ZpZGVkIHdp
dGgKYSBub24tTlVMTCBwYXJlbnRfbmFtZSBvciBwYXJlbnRfaHcuIERyb3AgdGhpcyBkdW1teSBw
YXJlbnRfZGF0YSBhcyBpcwpub3QgbmVjZXNzYXJ5IGFueW1vcmUuCgpUaGlzIGNoYW5nZSBvbmx5
IGhhcyBhIHNtYWxsIGltcGFjdCBvbiBtaXMtY29uZmlndXJlZCBmaXhlZC1mYWN0b3IuIE5vdyBh
CmNhbGwgdG8gY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3RvcigpIHdpdGggYSBOVUxMIHBhcmVu
dCB3aWxsIHJlZ2lzdGVyCmEgZml4ZWQtZmFjdG9yIHdpdGggemVybyBwYXJlbnQgd2hpbGUgcHJl
dmlvdXNseSBpdCB3YXMgcmVnaXN0ZXJlZCB3aXRoCm9uZSBpbnZhbGlkIHBhcmVudC4gSW4gYm90
aCBjYXNlcyB0aGUgcmF0ZSBvZiB0aGUgZml4ZWQtZmFjdG9yIGlzIDBIegpidXQgaXQgaXMgbm8g
bG9uZ2VyIHNob3duIGFzIG9ycGhhbmVkLgoKVGhpcyBoYXMgbm8gaW1wYWN0IG9uIHByb3Blcmx5
IGNvbmZpZ3VyZWQgZml4ZWQtZmFjdG9ycyBjbG9ja3MuCgpTaWduZWQtb2ZmLWJ5OiBCZW5vw650
IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9jbGsvY2xrLWZp
eGVkLWZhY3Rvci5jIHwgMjggKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL2Nsay1maXhlZC1mYWN0b3IuYyBiL2RyaXZlcnMvY2xrL2Nsay1maXhlZC1mYWN0
b3IuYwppbmRleCBkZTY1OGM5ZTRjNTMuLjYzMDgyMTE1ZmQyNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9jbGsvY2xrLWZpeGVkLWZhY3Rvci5jCisrKyBiL2RyaXZlcnMvY2xrL2Nsay1maXhlZC1mYWN0
b3IuYwpAQCAtMTI0LDEzICsxMjQsMTMgQEAgX19jbGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9y
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpucCwKIAlpbml0Lm5hbWUg
PSBuYW1lOwogCWluaXQub3BzID0gJmNsa19maXhlZF9mYWN0b3Jfb3BzOwogCWluaXQuZmxhZ3Mg
PSBmbGFnczsKLQlpZiAocGFyZW50X25hbWUpCi0JCWluaXQucGFyZW50X25hbWVzID0gJnBhcmVu
dF9uYW1lOwotCWVsc2UgaWYgKHBhcmVudF9odykKLQkJaW5pdC5wYXJlbnRfaHdzID0gJnBhcmVu
dF9odzsKKwlpbml0LnBhcmVudF9uYW1lcyA9IHBhcmVudF9uYW1lID8gJnBhcmVudF9uYW1lIDog
TlVMTDsKKwlpbml0LnBhcmVudF9od3MgPSBwYXJlbnRfaHcgPyAmcGFyZW50X2h3IDogTlVMTDsK
Kwlpbml0LnBhcmVudF9kYXRhID0gcGRhdGE7CisJaWYgKHBhcmVudF9uYW1lIHx8IHBhcmVudF9o
dyB8fCBwZGF0YSkKKwkJaW5pdC5udW1fcGFyZW50cyA9IDE7CiAJZWxzZQotCQlpbml0LnBhcmVu
dF9kYXRhID0gcGRhdGE7Ci0JaW5pdC5udW1fcGFyZW50cyA9IDE7CisJCWluaXQubnVtX3BhcmVu
dHMgPSAwOwogCiAJaHcgPSAmZml4LT5odzsKIAlpZiAoZGV2KQpAQCAtMTkwLDEwICsxOTAsOCBA
QCBzdHJ1Y3QgY2xrX2h3ICpkZXZtX2Nsa19od19yZWdpc3Rlcl9maXhlZF9mYWN0b3JfcGFyZW50
X2h3KHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJY29uc3QgY2hhciAqbmFtZSwgY29uc3Qgc3RydWN0
IGNsa19odyAqcGFyZW50X2h3LAogCQl1bnNpZ25lZCBsb25nIGZsYWdzLCB1bnNpZ25lZCBpbnQg
bXVsdCwgdW5zaWduZWQgaW50IGRpdikKIHsKLQljb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRh
IHBkYXRhID0geyAuaW5kZXggPSAtMSB9OwotCiAJcmV0dXJuIF9fY2xrX2h3X3JlZ2lzdGVyX2Zp
eGVkX2ZhY3RvcihkZXYsIE5VTEwsIG5hbWUsIE5VTEwsIHBhcmVudF9odywKLQkJCQkJICAgICAg
JnBkYXRhLCBmbGFncywgbXVsdCwgZGl2LCAwLCAwLCB0cnVlKTsKKwkJCQkJICAgICAgTlVMTCwg
ZmxhZ3MsIG11bHQsIGRpdiwgMCwgMCwgdHJ1ZSk7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChkZXZt
X2Nsa19od19yZWdpc3Rlcl9maXhlZF9mYWN0b3JfcGFyZW50X2h3KTsKIApAQCAtMjAxLDEwICsx
OTksOCBAQCBzdHJ1Y3QgY2xrX2h3ICpjbGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9yX3BhcmVu
dF9odyhzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCWNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IHN0cnVj
dCBjbGtfaHcgKnBhcmVudF9odywKIAkJdW5zaWduZWQgbG9uZyBmbGFncywgdW5zaWduZWQgaW50
IG11bHQsIHVuc2lnbmVkIGludCBkaXYpCiB7Ci0JY29uc3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0
YSBwZGF0YSA9IHsgLmluZGV4ID0gLTEgfTsKLQogCXJldHVybiBfX2Nsa19od19yZWdpc3Rlcl9m
aXhlZF9mYWN0b3IoZGV2LCBOVUxMLCBuYW1lLCBOVUxMLCBwYXJlbnRfaHcsCi0JCQkJCSAgICAg
ICZwZGF0YSwgZmxhZ3MsIG11bHQsIGRpdiwgMCwgMCwgZmFsc2UpOworCQkJCQkgICAgICBOVUxM
LCBmbGFncywgbXVsdCwgZGl2LCAwLCAwLCBmYWxzZSk7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChj
bGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9yX3BhcmVudF9odyk7CiAKQEAgLTIxMiwxMCArMjA4
LDggQEAgc3RydWN0IGNsa19odyAqY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3RvcihzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCiAJCWNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKnBhcmVudF9uYW1l
LCB1bnNpZ25lZCBsb25nIGZsYWdzLAogCQl1bnNpZ25lZCBpbnQgbXVsdCwgdW5zaWduZWQgaW50
IGRpdikKIHsKLQljb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIHBkYXRhID0geyAuaW5kZXgg
PSAtMSB9OwotCiAJcmV0dXJuIF9fY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3RvcihkZXYsIE5V
TEwsIG5hbWUsIHBhcmVudF9uYW1lLCBOVUxMLAotCQkJCQkgICAgICAmcGRhdGEsIGZsYWdzLCBt
dWx0LCBkaXYsIDAsIDAsIGZhbHNlKTsKKwkJCQkJICAgICAgTlVMTCwgZmxhZ3MsIG11bHQsIGRp
diwgMCwgMCwgZmFsc2UpOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoY2xrX2h3X3JlZ2lzdGVyX2Zp
eGVkX2ZhY3Rvcik7CiAKQEAgLTI5NiwxMCArMjkwLDggQEAgc3RydWN0IGNsa19odyAqZGV2bV9j
bGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9yKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJY29uc3Qg
Y2hhciAqbmFtZSwgY29uc3QgY2hhciAqcGFyZW50X25hbWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3Ms
CiAJCXVuc2lnbmVkIGludCBtdWx0LCB1bnNpZ25lZCBpbnQgZGl2KQogewotCWNvbnN0IHN0cnVj
dCBjbGtfcGFyZW50X2RhdGEgcGRhdGEgPSB7IC5pbmRleCA9IC0xIH07Ci0KIAlyZXR1cm4gX19j
bGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9yKGRldiwgTlVMTCwgbmFtZSwgcGFyZW50X25hbWUs
IE5VTEwsCi0JCQkmcGRhdGEsIGZsYWdzLCBtdWx0LCBkaXYsIDAsIDAsIHRydWUpOworCQkJTlVM
TCwgZmxhZ3MsIG11bHQsIGRpdiwgMCwgMCwgdHJ1ZSk7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChk
ZXZtX2Nsa19od19yZWdpc3Rlcl9maXhlZF9mYWN0b3IpOwogCgotLSAKMi41Mi4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
