Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD029EF8FF7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tY1v/eALZfL+IVMWowjFysmpDT3Q77w+nDGxkwkbwo=; b=WYdiIpkpVf2N+a
	W678TBQ/Vv18xJGmfDb0MkGQb7LSsjepq96Ibx61x2argOGH1XW4TmBCP2lOJLINBgZokn8wKgDXg
	OEZfZ7SCnechssjV+PhBWdqTC2LOOi3O+/Vg7Gj0dvWAN3WMJfV7eBpMcZldyPdDweILTNHmY4s4I
	KgLYwXFTb2s4zjbNbtwYksmyCO9xJFJEpLFunkRY4KnukdicjfClVjtHfxBp+6VfBv++cBiKMfmv5
	/RxkMcBTFBCW2XLdyBmjdaq8jWOpUju7XcD70ctzGCBQQj15wLw7BL4vYHYOF6lliFZ/r7Xs/edoI
	Z+gp5tqoL37g3SbYim4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxo7J-0000000HXgY-3lxk;
	Wed, 04 Mar 2026 15:26:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxo7I-0000000HXeH-1FBy
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Mar 2026 15:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=aUYUflWYXCNMFkVZDsoHMMnLEv02bLTB8mbRpGNIxfo=; b=LsBaluQjLEVxZwsE5y5hszOSrB
	88GDpwTQcG9fpsibgK9xa/3djLYH6Fg20/81Ea3bAfdrJ/L3upVLquLGqegxk+KQXSyqQPfhlwdKi
	1cBZGIgMO8Q/zuU1s+AhO1XhykkZvU4if2q5JXSfqtqL1Fc1S9AEWdCGTAq+r/zOcqyvrftzeEsIc
	qJ2b/VFTEPt1ZWYJpEGILRisWXZbIH+y19dZhnv3VGMnD2VDrKgOZ4Cb/g+LuKBae+lrVBqfM6AZk
	PuBKbqoqZYO6gkHBCR5XyBiNc+8X5PrfXmkec5KVF7JueOYF8+/xXpJvwmaCcZuyVV90JEwsxozjY
	T5CvF03A==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxo7E-0000000DUED-1fAl
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 15:26:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C2866C143D8;
	Wed,  4 Mar 2026 15:26:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AB195FF5C;
	Wed,  4 Mar 2026 15:26:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 911AF103697E4;
	Wed,  4 Mar 2026 16:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772637967; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aUYUflWYXCNMFkVZDsoHMMnLEv02bLTB8mbRpGNIxfo=;
	b=fvEixSgPh+wmeIwxTOTWk0UkHCQQ14mL8Ua9emqzFTOsvxQuyQDMLkrkERag9FRzpXKS3T
	85WhYnpR8TT8Ghm6L+7+rWdJxtUjr1BTYUfRYHWDMOLa95/1AS9EEORuAbK4geHJTD2AGI
	JSQgakN3YRYKyPgt+1FYZXpEl2MHR4m1W0h2CKztZKV9tydRSWa0ntsyL+3d4JOHOyp3IP
	dz1n38S3jtV85TSQc2jn6D/JY+XFMQT0LUlLYkxeaBfmRcHNzpQJ3ACAYLdVkWl7OzZsbs
	Lh3YGOgZRDkkw83yM7Y8fBXLO+2/eD7h5JZ97A6ozZycx/ZlRUEQ6zOKIb/knw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 04 Mar 2026 16:25:19 +0100
Subject: [PATCH v4 05/10] clk: eyeq: Prefix the PLL registers with the PLL
 type
MIME-Version: 1.0
Message-Id: <20260304-clk-eyeq7-v4-5-9d6bd9d24bec@bootlin.com>
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
X-CRM114-CacheID: sfid-20260304_152624_525283_6133D867 
X-CRM114-Status: GOOD (  14.59  )
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

UmVuYW1lIHRoZSBQTEwgcmVnaXN0ZXJzIHRvIG1ha2Ugcm9vbSBmb3Igb3RoZXIgUExMIHR5cGVz
IHRoYXQgYXJlCnByZXNlbnQgaW4gdGhlIGV5ZVE3SC4KCk1vdmUgdGhlIGFjY2VzcyB0byB0aGUg
UExMIHJlZ2lzdGVyIGluc2lkZSB0aGUgZnVuY3Rpb24gcGFyc2luZyBpdAphcyBib3RoIGNhbGwg
c2l0ZXMgd2VyZSBkb2luZyB0aGUgc2FtZSB0aGluZy4KClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQg
TW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9jbGstZXll
cS5jIHwgNzYgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstZXllcS5jIGIvZHJpdmVycy9jbGsvY2xrLWV5ZXEu
YwppbmRleCBkOTMwM2MyYzdhYTUuLmU0ZTY5MGExMmEyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9j
bGsvY2xrLWV5ZXEuYworKysgYi9kcml2ZXJzL2Nsay9jbGstZXllcS5jCkBAIC00OCwyOCArNDgs
MjggQEAKICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9tb2JpbGV5ZSxleWVxNmxwbHVzLWNs
ay5oPgogCiAvKiBJbiBmcmFjIG1vZGUsIGl0IGVuYWJsZXMgZnJhY3Rpb25hbCBub2lzZSBjYW5j
ZWxpbmcgREFDLiBFbHNlLCBubyBmdW5jdGlvbi4gKi8KLSNkZWZpbmUgUENTUjBfREFDX0VOCQkJ
QklUKDApCisjZGVmaW5lIEZSQUNHX1BDU1IwX0RBQ19FTgkJCUJJVCgwKQogLyogRnJhY3Rpb25h
bCBvciBpbnRlZ2VyIG1vZGUgKi8KLSNkZWZpbmUgUENTUjBfRFNNX0VOCQkJQklUKDEpCi0jZGVm
aW5lIFBDU1IwX1BMTF9FTgkJCUJJVCgyKQorI2RlZmluZSBGUkFDR19QQ1NSMF9EU01fRU4JCQlC
SVQoMSkKKyNkZWZpbmUgRlJBQ0dfUENTUjBfUExMX0VOCQkJQklUKDIpCiAvKiBBbGwgY2xvY2tz
IG91dHB1dCBoZWxkIGF0IDAgKi8KLSNkZWZpbmUgUENTUjBfRk9VVFBPU1RESVZfRU4JCUJJVCgz
KQotI2RlZmluZSBQQ1NSMF9QT1NUX0RJVjEJCQlHRU5NQVNLKDYsIDQpCi0jZGVmaW5lIFBDU1Iw
X1BPU1RfRElWMgkJCUdFTk1BU0soOSwgNykKLSNkZWZpbmUgUENTUjBfUkVGX0RJVgkJCUdFTk1B
U0soMTUsIDEwKQotI2RlZmluZSBQQ1NSMF9JTlRJTgkJCUdFTk1BU0soMjcsIDE2KQotI2RlZmlu
ZSBQQ1NSMF9CWVBBU1MJCQlCSVQoMjgpCisjZGVmaW5lIEZSQUNHX1BDU1IwX0ZPVVRQT1NURElW
X0VOCQlCSVQoMykKKyNkZWZpbmUgRlJBQ0dfUENTUjBfUE9TVF9ESVYxCQkJR0VOTUFTSyg2LCA0
KQorI2RlZmluZSBGUkFDR19QQ1NSMF9QT1NUX0RJVjIJCQlHRU5NQVNLKDksIDcpCisjZGVmaW5l
IEZSQUNHX1BDU1IwX1JFRl9ESVYJCQlHRU5NQVNLKDE1LCAxMCkKKyNkZWZpbmUgRlJBQ0dfUENT
UjBfSU5USU4JCQlHRU5NQVNLKDI3LCAxNikKKyNkZWZpbmUgRlJBQ0dfUENTUjBfQllQQVNTCQkJ
QklUKDI4KQogLyogQml0cyAzMC4uMjkgYXJlIHJlc2VydmVkICovCi0jZGVmaW5lIFBDU1IwX1BM
TF9MT0NLRUQJCUJJVCgzMSkKKyNkZWZpbmUgRlJBQ0dfUENTUjBfUExMX0xPQ0tFRAkJCUJJVCgz
MSkKIAotI2RlZmluZSBQQ1NSMV9SRVNFVAkJCUJJVCgwKQotI2RlZmluZSBQQ1NSMV9TU0dDX0RJ
VgkJCUdFTk1BU0soNCwgMSkKKyNkZWZpbmUgRlJBQ0dfUENTUjFfUkVTRVQJCQlCSVQoMCkKKyNk
ZWZpbmUgRlJBQ0dfUENTUjFfU1NHQ19ESVYJCQlHRU5NQVNLKDQsIDEpCiAvKiBTcHJlYWQgYW1w
bGl0dWRlICglID0gMC4xICogU1BSRUFEWzQ6MF0pICovCi0jZGVmaW5lIFBDU1IxX1NQUkVBRAkJ
CUdFTk1BU0soOSwgNSkKLSNkZWZpbmUgUENTUjFfRElTX1NTQ0cJCQlCSVQoMTApCisjZGVmaW5l
IEZSQUNHX1BDU1IxX1NQUkVBRAkJCUdFTk1BU0soOSwgNSkKKyNkZWZpbmUgRlJBQ0dfUENTUjFf
RElTX1NTQ0cJCQlCSVQoMTApCiAvKiBEb3duLXNwcmVhZCBvciBjZW50ZXItc3ByZWFkICovCi0j
ZGVmaW5lIFBDU1IxX0RPV05fU1BSRUFECQlCSVQoMTEpCi0jZGVmaW5lIFBDU1IxX0ZSQUNfSU4J
CQlHRU5NQVNLKDMxLCAxMikKKyNkZWZpbmUgRlJBQ0dfUENTUjFfRE9XTl9TUFJFQUQJCQlCSVQo
MTEpCisjZGVmaW5lIEZSQUNHX1BDU1IxX0ZSQUNfSU4JCQlHRU5NQVNLKDMxLCAxMikKIAogc3Ry
dWN0IGVxY19wbGwgewogCXVuc2lnbmVkIGludAlpbmRleDsKQEAgLTE2MiwzNCArMTYyLDQwIEBA
IHN0YXRpYyB2b2lkIGVxY19wbGxfZG93bnNoaWZ0X2ZhY3RvcnModW5zaWduZWQgbG9uZyAqbXVs
dCwgdW5zaWduZWQgbG9uZyAqZGl2KQogCSpkaXYgPj49IHNoaWZ0OwogfQogCi1zdGF0aWMgaW50
IGVxY19wbGxfcGFyc2VfcmVnaXN0ZXJzKHUzMiByMCwgdTMyIHIxLCB1bnNpZ25lZCBsb25nICpt
dWx0LAotCQkJCSAgIHVuc2lnbmVkIGxvbmcgKmRpdiwgdW5zaWduZWQgbG9uZyAqYWNjKQorc3Rh
dGljIGludCBlcWNfcGxsX3BhcnNlX2ZyYWNnKHZvaWQgX19pb21lbSAqYmFzZSwgdW5zaWduZWQg
bG9uZyAqbXVsdCwKKwkJCSAgICAgICB1bnNpZ25lZCBsb25nICpkaXYsIHVuc2lnbmVkIGxvbmcg
KmFjYykKIHsKIAl1bnNpZ25lZCBsb25nIHNwcmVhZDsKKwl1MzIgcjAsIHIxOworCXU2NCB2YWw7
CiAKLQlpZiAocjAgJiBQQ1NSMF9CWVBBU1MpIHsKKwl2YWwgPSByZWFkcShiYXNlKTsKKwlyMCA9
IHZhbDsKKwlyMSA9IHZhbCA+PiAzMjsKKworCWlmIChyMCAmIEZSQUNHX1BDU1IwX0JZUEFTUykg
ewogCQkqbXVsdCA9IDE7CiAJCSpkaXYgPSAxOwogCQkqYWNjID0gMDsKIAkJcmV0dXJuIDA7CiAJ
fQogCi0JaWYgKCEocjAgJiBQQ1NSMF9QTExfTE9DS0VEKSkKKwlpZiAoIShyMCAmIEZSQUNHX1BD
U1IwX1BMTF9MT0NLRUQpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCSptdWx0ID0gRklFTERfR0VU
KFBDU1IwX0lOVElOLCByMCk7Ci0JKmRpdiA9IEZJRUxEX0dFVChQQ1NSMF9SRUZfRElWLCByMCk7
CisJKm11bHQgPSBGSUVMRF9HRVQoRlJBQ0dfUENTUjBfSU5USU4sIHIwKTsKKwkqZGl2ID0gRklF
TERfR0VUKEZSQUNHX1BDU1IwX1JFRl9ESVYsIHIwKTsKIAogCS8qIEZyYWN0aW9uYWwgbW9kZSwg
aW4gMl4yMCAoMHgxMDAwMDApIHBhcnRzLiAqLwotCWlmIChyMCAmIFBDU1IwX0RTTV9FTikgewor
CWlmIChyMCAmIEZSQUNHX1BDU1IwX0RTTV9FTikgewogCQkqZGl2ICo9ICgxVUxMIDw8IDIwKTsK
LQkJKm11bHQgPSAqbXVsdCAqICgxVUxMIDw8IDIwKSArIEZJRUxEX0dFVChQQ1NSMV9GUkFDX0lO
LCByMSk7CisJCSptdWx0ID0gKm11bHQgKiAoMVVMTCA8PCAyMCkgKyBGSUVMRF9HRVQoRlJBQ0df
UENTUjFfRlJBQ19JTiwgcjEpOwogCX0KIAogCWlmICghKm11bHQgfHwgISpkaXYpCiAJCXJldHVy
biAtRUlOVkFMOwogCi0JaWYgKHIxICYgKFBDU1IxX1JFU0VUIHwgUENTUjFfRElTX1NTQ0cpKSB7
CisJaWYgKHIxICYgKEZSQUNHX1BDU1IxX1JFU0VUIHwgRlJBQ0dfUENTUjFfRElTX1NTQ0cpKSB7
CiAJCSphY2MgPSAwOwogCQlyZXR1cm4gMDsKIAl9CkBAIC0yMDQsMTAgKzIxMCwxMCBAQCBzdGF0
aWMgaW50IGVxY19wbGxfcGFyc2VfcmVnaXN0ZXJzKHUzMiByMCwgdTMyIHIxLCB1bnNpZ25lZCBs
b25nICptdWx0LAogCSAqCiAJICogQ2FyZSBpcyB0YWtlbiB0byBhdm9pZCBvdmVyZmxvd2luZyBv
ciBsb3NpbmcgcHJlY2lzaW9uLgogCSAqLwotCXNwcmVhZCA9IEZJRUxEX0dFVChQQ1NSMV9TUFJF
QUQsIHIxKTsKKwlzcHJlYWQgPSBGSUVMRF9HRVQoRlJBQ0dfUENTUjFfU1BSRUFELCByMSk7CiAJ
KmFjYyA9IERJVl9ST1VORF9DTE9TRVNUKHNwcmVhZCAqIDEwMDAwMDAwMDAsIDEwMjQgKiAyKTsK
IAotCWlmIChyMSAmIFBDU1IxX0RPV05fU1BSRUFEKSB7CisJaWYgKHIxICYgRlJBQ0dfUENTUjFf
RE9XTl9TUFJFQUQpIHsKIAkJLyoKIAkJICogRG93bnNwcmVhZGluZzogdGhlIGNlbnRyYWwgZnJl
cXVlbmN5IGlzIGhhbGYgYQogCQkgKiBzcHJlYWQgbG93ZXIuCkBAIC0yMzIsMTggKzIzOCwxMiBA
QCBzdGF0aWMgdm9pZCBlcWNfcHJvYmVfaW5pdF9wbGxzKHN0cnVjdCBkZXZpY2UgKmRldiwgY29u
c3Qgc3RydWN0IGVxY19tYXRjaF9kYXRhCiAJY29uc3Qgc3RydWN0IGVxY19wbGwgKnBsbDsKIAlz
dHJ1Y3QgY2xrX2h3ICpodzsKIAl1bnNpZ25lZCBpbnQgaTsKLQl1MzIgcjAsIHIxOwotCXU2NCB2
YWw7CiAJaW50IHJldDsKIAogCWZvciAoaSA9IDA7IGkgPCBkYXRhLT5wbGxfY291bnQ7IGkrKykg
ewogCQlwbGwgPSAmZGF0YS0+cGxsc1tpXTsKIAotCQl2YWwgPSByZWFkcShiYXNlICsgcGxsLT5y
ZWc2NCk7Ci0JCXIwID0gdmFsOwotCQlyMSA9IHZhbCA+PiAzMjsKLQotCQlyZXQgPSBlcWNfcGxs
X3BhcnNlX3JlZ2lzdGVycyhyMCwgcjEsICZtdWx0LCAmZGl2LCAmYWNjKTsKKwkJcmV0ID0gZXFj
X3BsbF9wYXJzZV9mcmFjZyhiYXNlICsgcGxsLT5yZWc2NCwgJm11bHQsICZkaXYsICZhY2MpOwog
CQlpZiAocmV0KSB7CiAJCQlkZXZfd2FybihkZXYsICJmYWlsZWQgcGFyc2luZyBzdGF0ZSBvZiAl
c1xuIiwgcGxsLT5uYW1lKTsKIAkJCWNlbGxzLT5od3NbcGxsLT5pbmRleF0gPSBFUlJfUFRSKHJl
dCk7CkBAIC03OTksMTQgKzc5OSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlcWNfZWFybHlfaW5p
dChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAogCQljb25zdCBzdHJ1Y3QgZXFjX3BsbCAqcGxsID0g
JmVhcmx5X2RhdGEtPmVhcmx5X3BsbHNbaV07CiAJCXVuc2lnbmVkIGxvbmcgbXVsdCwgZGl2LCBh
Y2M7CiAJCXN0cnVjdCBjbGtfaHcgKmh3OwotCQl1MzIgcjAsIHIxOwotCQl1NjQgdmFsOwogCi0J
CXZhbCA9IHJlYWRxKGJhc2UgKyBwbGwtPnJlZzY0KTsKLQkJcjAgPSB2YWw7Ci0JCXIxID0gdmFs
ID4+IDMyOwotCi0JCXJldCA9IGVxY19wbGxfcGFyc2VfcmVnaXN0ZXJzKHIwLCByMSwgJm11bHQs
ICZkaXYsICZhY2MpOworCQlyZXQgPSBlcWNfcGxsX3BhcnNlX2ZyYWNnKGJhc2UgKyBwbGwtPnJl
ZzY0LCAmbXVsdCwgJmRpdiwgJmFjYyk7CiAJCWlmIChyZXQpIHsKIAkJCXByX2VycigiZmFpbGVk
IHBhcnNpbmcgc3RhdGUgb2YgJXNcbiIsIHBsbC0+bmFtZSk7CiAJCQlnb3RvIGVycjsKCi0tIAoy
LjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
