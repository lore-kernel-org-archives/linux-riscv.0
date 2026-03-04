Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53168EF8FF5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnD+CR/gUnDcEun9hJWJm1jlojRnq2g0s/kUNi6FGIE=; b=nDsH2Hycz85zxB
	L7SJcAmzKzEKNBCWXXiQlXmMGq5yHqeWGeIwND5cnEAHn6H8Y5KqizfP4kSg+jyT4dgGsYqXM2hCe
	kvoNhapEHkhMB/hBrXWKGKAkwYFQAPNMAHB7tqhI+6KRzBQvm0lYEqc3w1iPVwJRTILe9f/vAYgwy
	suDOwBpd0WvyPNJkru/YUbsLb1H8tBlzZNr1VPnDy60+aJHTR4AtB4rzZWEdwNyTfAWSacqkrquBH
	CGqQwltPzm+gyfCkzFPv1x/dQcLeCrioraPh+au2KVamQeevJggW+nFcvEo3wHY6St25fIhiElmGi
	Unork5WDOuPezclpkvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxo7H-0000000HXeR-43oQ;
	Wed, 04 Mar 2026 15:26:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxo7G-0000000HXcy-13kF
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Mar 2026 15:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=vH580k/DvZMtChBfmdwtMbkilqnSWSOYibv55mMkZ4Y=; b=GwU1r7/MIfSzDSOyGkjnSR33Xn
	18sFQR/zwtQFYc0IVgOvIj4WIc1oJGFt+EVi5aG2QHZDqxcJrpcmCcWPW26ViAHpF5/YqaFMBA9v6
	HS5IgaQi2jMAB2GpJmHLhgMA3D80xaiGgO/xyDteGWEzy+CdmGXTgvBd8lB1+GsLgwiPcaHassYaa
	HliG/UWkkDv1T6WM+/PHqsOkdWQRYeC/s5BekNVVHTUgSGosi0tnjJzaVzx3IhuGUskJFYeudxMOV
	NJQcmLQM4ZcMNEBAZfg1QHnrynXEErp8tT1CatIudIrBZgEdnYr6AEseE0P1irDgjC2S+D1I/DTRh
	m4qEV3Xw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxo7D-0000000DUDw-0L4e
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 15:26:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 620C51A2CA0;
	Wed,  4 Mar 2026 15:26:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38F085FF5C;
	Wed,  4 Mar 2026 15:26:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AD69103697E6;
	Wed,  4 Mar 2026 16:26:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772637963; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vH580k/DvZMtChBfmdwtMbkilqnSWSOYibv55mMkZ4Y=;
	b=1yTnsEm/ay1oM2Ofe4ZLICJhB1C2YJ4MFgMIK+LN/gV2RuLypzC6BhylHje+Vj8gJlYHOi
	nmqRtvp5lzsx4Anw3LPghlIc0OUuyPYj9RzUNy2mgec4g21aVud7R/+3o3j8Xg0k5vpQ0L
	ovhNnmQMbUfAM4RwcqbELdxtqx5bv1etY5nYm7HY5TJUSm+ODQkOJP/Ro2T6vQzt9wQ/OP
	PzcWZ7GyOm0Av/Re2lr3jByaOsEgzIXnZ9ZyPFkrXzJgQ7oGw5waZt6TaGL86i4eAUhsfc
	9KAAc0KtQZynv9hVm3UHoIreioZ55Lb0tWlnvlp7lnzTOn2jFzK+bXnZ+BUxjQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 04 Mar 2026 16:25:17 +0100
Subject: [PATCH v4 03/10] clk: fixed-factor: Rework initialization with
 parent clocks
MIME-Version: 1.0
Message-Id: <20260304-clk-eyeq7-v4-3-9d6bd9d24bec@bootlin.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
In-Reply-To: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
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
X-CRM114-CacheID: sfid-20260304_152623_512488_B0ECB76C 
X-CRM114-Status: GOOD (  13.90  )
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
b3IuYwppbmRleCA4NTBlOGI5NWYzNTIuLjM1OWU5MTQ0MWM3NCAxMDA2NDQKLS0tIGEvZHJpdmVy
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
ZXZtX2Nsa19od19yZWdpc3Rlcl9maXhlZF9mYWN0b3IpOwogCgotLSAKMi41My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
