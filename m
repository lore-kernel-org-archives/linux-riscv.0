Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EC2C27C5E
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 11:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJf4HEuLTmPNncIknc1x9v55R6nIJBIeS6s38HXh1A4=; b=cmqQIkvoYQIDKk
	JTMfLXzT8DkmvWuA+1eoGsfVSMZpWrlJ5Nyt4CkPh67R+/gs+y6T2eSBzhIyJ5yQesP11+4kP0Sui
	Hsw0W2AHK7AJ1Bhe3sRhpjDaomx3kEyRzAVqIZxegNSKEfTqvTwDpd6k8jsD60FmBRF+rsuvcYQBi
	5eqAjgOgSNasEBd9Hvdq8axUBem/3wxf8W4jzpetiah4THRY2vZKGbUkz8VNVF5ixdV8AnnoKtVuZ
	myqdvWKgrNnzgQhqoIVJVo3gG9ocFFOORz0ymp+QOkV1bwNpdgGumsNbysirBQFCBWAFmP5uA9WDU
	r8XYkLKzh8eiQXP4FKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1g-00000005kBT-3RvI;
	Wed, 05 Jun 2024 11:41:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1d-00000005k8Y-3loW
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 11:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5040A61828;
	Wed,  5 Jun 2024 11:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9B2C4AF09;
	Wed,  5 Jun 2024 11:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587713;
	bh=L6J14KqpfXLFzLpqo0wTWwklGSKZlK82ek5ghR0epQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nB+tpFCKWoin2Io1tYNh/CpS+b2KOE96Igf2M+PajeAiqjcAwFpQdkIQ1roxi2gFS
	 ybrJ6R3VNsPGfwYETuovRb8MmTUuzJYXMZkdk5PkklSmzl/mvUssCtdc8sq6Nn+608
	 Msnb1PAycmOOBfXZz9FDQCndMLunP+YGOi1F1+qIlP3WKOUwv5u+jFCiovPNw7bR/f
	 mDZYBsTyIzCYUGva5g5QSNHBpM7IOMr7msMbj2JmcxdV3QiHfU6VxtsKG0bPV/tDWi
	 hYQBxxJxkhebALDI+e5GZRgBFT6W8RxUwONIgOVjjb2cDwx5omNGuOKTPYICI4q2OY
	 63QpUaPxQzQfw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 08/11] riscv: Enable memory hotplugging for RISC-V
Date: Wed,  5 Jun 2024 13:40:51 +0200
Message-ID: <20240605114100.315918-9-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114100.315918-1-bjorn@kernel.org>
References: <20240605114100.315918-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_044154_034813_14B26948 
X-CRM114-Status: UNSURE (   7.43  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKRW5hYmxlIEFSQ0hfRU5B
QkxFX01FTU9SWV9IT1RQTFVHIGFuZCBBUkNIX0VOQUJMRV9NRU1PUllfSE9UUkVNT1ZFIGZvcgpS
SVNDLVYuCgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0t
LQogYXJjaC9yaXNjdi9LY29uZmlnIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25m
aWcKaW5kZXggMDUyNWVlMmQ2M2M3Li44ZDg2MGFkM2IxNzEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTE2LDYgKzE2LDggQEAgY29u
ZmlnIFJJU0NWCiAJc2VsZWN0IEFDUElfUkVEVUNFRF9IQVJEV0FSRV9PTkxZIGlmIEFDUEkKIAlz
ZWxlY3QgQVJDSF9ETUFfREVGQVVMVF9DT0hFUkVOVAogCXNlbGVjdCBBUkNIX0VOQUJMRV9IVUdF
UEFHRV9NSUdSQVRJT04gaWYgSFVHRVRMQl9QQUdFICYmIE1JR1JBVElPTgorCXNlbGVjdCBBUkNI
X0VOQUJMRV9NRU1PUllfSE9UUExVRyBpZiBTUEFSU0VNRU1fVk1FTU1BUAorCXNlbGVjdCBBUkNI
X0VOQUJMRV9NRU1PUllfSE9UUkVNT1ZFIGlmIE1FTU9SWV9IT1RQTFVHCiAJc2VsZWN0IEFSQ0hf
RU5BQkxFX1NQTElUX1BNRF9QVExPQ0sgaWYgUEdUQUJMRV9MRVZFTFMgPiAyCiAJc2VsZWN0IEFS
Q0hfRU5BQkxFX1RIUF9NSUdSQVRJT04gaWYgVFJBTlNQQVJFTlRfSFVHRVBBR0UKIAlzZWxlY3Qg
QVJDSF9IQVNfQklORk1UX0ZMQVQKQEAgLTQ2LDYgKzQ4LDcgQEAgY29uZmlnIFJJU0NWCiAJc2Vs
ZWN0IEFSQ0hfSEFTX1VCU0FOCiAJc2VsZWN0IEFSQ0hfSEFTX1ZEU09fREFUQQogCXNlbGVjdCBB
UkNIX0tFRVBfTUVNQkxPQ0sgaWYgQUNQSQorCXNlbGVjdCBBUkNIX01IUF9NRU1NQVBfT05fTUVN
T1JZX0VOQUJMRQlpZiA2NEJJVCAmJiBNTVUKIAlzZWxlY3QgQVJDSF9PUFRJT05BTF9LRVJORUxf
UldYIGlmIEFSQ0hfSEFTX1NUUklDVF9LRVJORUxfUldYCiAJc2VsZWN0IEFSQ0hfT1BUSU9OQUxf
S0VSTkVMX1JXWF9ERUZBVUxUCiAJc2VsZWN0IEFSQ0hfU1RBQ0tXQUxLCi0tIAoyLjQzLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
