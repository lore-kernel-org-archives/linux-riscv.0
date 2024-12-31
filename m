Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665E7E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Dec 2024 16:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FaRRZh1U49d44Od/SaZAF0hwQYsE7kLDS898viCO8es=; b=UN7e3anaPwle6j
	GAjihb8lwShD0/rHa2Y5ltx4/Mbv5Q+cZu9OPDna76YfO1DcCASAV6lMKTsMxWduNsv0If3nSHrMS
	s7EiPyomBvNdhT1cf1yOnKT15Ji3doJOukL10fvMQqdxZN7u6M6OcAGbqe2BxMyyWF3p5bq0rvguB
	jjVWrM3gDZlfj6VL+bw5XBKuBWz/IhxW9VRSY6pAOfvH2KKt6GaHfmq40yiwMvi8plHbHvJDkaYd0
	NnWTKec9k6MaQWn8wCcOtQWix0NUOPtbT8x5Y+WorfZAQ24FjFqR+pIjLaSNxF+XfyTOkKI1q6zA+
	5B1jgc+EQb5Xzez1u8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSet5-00000007RwM-1p4o;
	Tue, 31 Dec 2024 16:14:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSest-00000007RtB-2qjM
	for linux-riscv@lists.infradead.org;
	Tue, 31 Dec 2024 16:14:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B67725C0163;
	Tue, 31 Dec 2024 16:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF8BC4CED2;
	Tue, 31 Dec 2024 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735661657;
	bh=J7KTir/8KIL3JI4HLaHABhUNLhSy8/fxpv+djk8Rlkk=;
	h=From:To:Cc:Subject:Date:From;
	b=icnYUcHuMLeyd4PXcYn/Pu7xsZrrdR6OAJH0w7pvBJJpILtsxIc8UTWQXtTC0lWgE
	 GYZPV2cfuWVNaLtyrLbWlPLxv9uAjDWrbIGvHXOurRVZLO4Ry6CwPG/3SMCw3nxzjG
	 P5jBuLMx+AqlD29n5mKgg9HaXFbGnOTJcedBskLT3cNf8aDWJyUX/qMV21DKu6eG2/
	 EKfkcam6ZMn7KcSPAcf58LAyE5HWhqb/YXd6BSEv3sOIQX1eC4jl9Oy+1aRlogvEl6
	 Wj2JZyJl3kpZPLKHrOF9+8LhXtfUPGuVVuNK5Ti9V1p/xiSUIYJ9kR2ofJB4spnInZ
	 IqRKiP+iVYlFw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2] riscv: cacheinfo: Use of_property_present() for non-boolean properties
Date: Tue, 31 Dec 2024 10:13:59 -0600
Message-ID: <20241231161400.214307-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_081419_758299_A4F90662 
X-CRM114-Status: UNSURE (   7.67  )
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

VGhlIHVzZSBvZiBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woKSBmb3Igbm9uLWJvb2xlYW4gcHJvcGVy
dGllcyBpcwpkZXByZWNhdGVkIGluIGZhdm9yIG9mIG9mX3Byb3BlcnR5X3ByZXNlbnQoKSB3aGVu
IHRlc3RpbmcgZm9yIHByb3BlcnR5CnByZXNlbmNlLgoKUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgKEFy
bSkgPHJvYmhAa2VybmVsLm9yZz4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyB8
IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCmluZGV4IDJkNDA3MzZmYzM3Yy4uMjZiMDg1ZGJk
ZDA3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYwpAQCAtMTA4LDExICsxMDgsMTEgQEAgaW50IHBvcHVs
YXRlX2NhY2hlX2xlYXZlcyh1bnNpZ25lZCBpbnQgY3B1KQogCWlmICghbnApCiAJCXJldHVybiAt
RU5PRU5UOwogCi0JaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImNhY2hlLXNpemUiKSkK
KwlpZiAob2ZfcHJvcGVydHlfcHJlc2VudChucCwgImNhY2hlLXNpemUiKSkKIAkJY2lfbGVhZl9p
bml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX1VOSUZJRUQsIGxldmVsKTsKLQlpZiAob2ZfcHJv
cGVydHlfcmVhZF9ib29sKG5wLCAiaS1jYWNoZS1zaXplIikpCisJaWYgKG9mX3Byb3BlcnR5X3By
ZXNlbnQobnAsICJpLWNhY2hlLXNpemUiKSkKIAkJY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBD
QUNIRV9UWVBFX0lOU1QsIGxldmVsKTsKLQlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAi
ZC1jYWNoZS1zaXplIikpCisJaWYgKG9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJkLWNhY2hlLXNp
emUiKSkKIAkJY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX0RBVEEsIGxldmVs
KTsKIAogCXByZXYgPSBucDsKQEAgLTEyNSwxMSArMTI1LDExIEBAIGludCBwb3B1bGF0ZV9jYWNo
ZV9sZWF2ZXModW5zaWduZWQgaW50IGNwdSkKIAkJCWJyZWFrOwogCQlpZiAobGV2ZWwgPD0gbGV2
ZWxzKQogCQkJYnJlYWs7Ci0JCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJjYWNoZS1z
aXplIikpCisJCWlmIChvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAiY2FjaGUtc2l6ZSIpKQogCQkJ
Y2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX1VOSUZJRUQsIGxldmVsKTsKLQkJ
aWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImktY2FjaGUtc2l6ZSIpKQorCQlpZiAob2Zf
cHJvcGVydHlfcHJlc2VudChucCwgImktY2FjaGUtc2l6ZSIpKQogCQkJY2lfbGVhZl9pbml0KHRo
aXNfbGVhZisrLCBDQUNIRV9UWVBFX0lOU1QsIGxldmVsKTsKLQkJaWYgKG9mX3Byb3BlcnR5X3Jl
YWRfYm9vbChucCwgImQtY2FjaGUtc2l6ZSIpKQorCQlpZiAob2ZfcHJvcGVydHlfcHJlc2VudChu
cCwgImQtY2FjaGUtc2l6ZSIpKQogCQkJY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9U
WVBFX0RBVEEsIGxldmVsKTsKIAkJbGV2ZWxzID0gbGV2ZWw7CiAJfQotLSAKMi40NS4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
