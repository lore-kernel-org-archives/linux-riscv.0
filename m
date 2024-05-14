Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BBEC25B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWdyAorKwgcQFWin6r587AoXu8ljMUIq51iQhF+6ZkM=; b=BHSnstti+S6gKc
	GGA4RA56X7NRF9BGxZhiJDMKLa22FqHFIW30o4SelP0JxYnPl9LBVUHBUvrEmm8wVeiiJijHYKSaL
	tL1Aqy61Z7P9MbcL8TMOpyMhHVzszG/5du7V9gmqvOBSKPIU1JKYPwObSL2A/uswwnuelFs82TcN9
	EZQ93sLONtddW7MsKQSOLNt1DTh41X+kIcHts1FTiig9f/O3l0+uJ4W18fDud2QiKKgIaSEafvT1h
	6bFYcoWgW+6J7Ojxf3LDwMDiKy8iBl4vJYPZI/CJ9FhouRR9iYhRLDMx96/kh//moTNe+Td5yGJQs
	oJufmHXhhS5bXVnTb8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sml-0000000G7mI-3SXB;
	Tue, 14 May 2024 14:05:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sme-0000000G7fX-2YKG
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B05FBCE127B;
	Tue, 14 May 2024 14:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D16C32781;
	Tue, 14 May 2024 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715695531;
	bh=0+IP68HpeOuix87ttHx6QCBPaROV37lTjVVbI88agM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T0t8ZY/krMImQEE1pbX37Lqd9otojKaCNU52Jdf+6IsnQPuwbjYf/17i4Dfm9wU/N
	 cG8ZVIKuEChYfl+ArN6nlpcBLN94ethBeWZaRLHF2O26wOR/YjsM4iypPJlep2EOIs
	 WnQduiMtRTX6HihYJYNGu+Zvx4ZfY6kifpj7mrb3c0qzOXrMObRZ+pyv1Di+53Y4BR
	 yVzogJGugSULHDBgRoPYVq0AQf3NMvV11V+DCtVicxdz9nCIPrBc3BZjkQibvEOlkP
	 LsDeyAlUKQ2u6jbtG/qyTzE50IDMatmyZSG5pDBfnCFVFZOhVoq3W+Su/3lVcXaMJx
	 OvCy8N0USQs3Q==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 6/8] riscv: Enable memory hotplugging for RISC-V
Date: Tue, 14 May 2024 16:04:44 +0200
Message-Id: <20240514140446.538622-7-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240514140446.538622-1-bjorn@kernel.org>
References: <20240514140446.538622-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_070536_964966_2832F481 
X-CRM114-Status: UNSURE (   7.90  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKRW5hYmxlIEFSQ0hfRU5B
QkxFX01FTU9SWV9IT1RQTFVHIGFuZCBBUkNIX0VOQUJMRV9NRU1PUllfSE9UUkVNT1ZFIGZvcgpS
SVNDLVYuCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+
Ci0tLQogYXJjaC9yaXNjdi9LY29uZmlnIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZwppbmRleCA2YmVjMWJjZTY1ODYuLmI5Mzk4YjY0YmI2OSAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMTYsNiArMTYsOCBAQCBj
b25maWcgUklTQ1YKIAlzZWxlY3QgQUNQSV9SRURVQ0VEX0hBUkRXQVJFX09OTFkgaWYgQUNQSQog
CXNlbGVjdCBBUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UCiAJc2VsZWN0IEFSQ0hfRU5BQkxFX0hV
R0VQQUdFX01JR1JBVElPTiBpZiBIVUdFVExCX1BBR0UgJiYgTUlHUkFUSU9OCisJc2VsZWN0IEFS
Q0hfRU5BQkxFX01FTU9SWV9IT1RQTFVHIGlmIFNQQVJTRU1FTSAmJiA2NEJJVCAmJiBNTVUKKwlz
ZWxlY3QgQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFJFTU9WRSBpZiBNRU1PUllfSE9UUExVRwogCXNl
bGVjdCBBUkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLIGlmIFBHVEFCTEVfTEVWRUxTID4gMgog
CXNlbGVjdCBBUkNIX0VOQUJMRV9USFBfTUlHUkFUSU9OIGlmIFRSQU5TUEFSRU5UX0hVR0VQQUdF
CiAJc2VsZWN0IEFSQ0hfSEFTX0JJTkZNVF9GTEFUCi0tIAoyLjQwLjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
