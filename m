Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01944C25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 11:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NlZ+kpfCeX8nteDe/NXQ3f0T5NWCqhhcWXMmZbCoGZc=; b=FgJH8qkUgQ9uGZ
	ZA3bpeSiMCJiuvQh9iaoC226NZPPo+7bHpteDdqw93QLpDb9LexKxYUhRpYfjWUAEHS606ofUm4d9
	G5AkxYISmmnZ1mKexVqpinlcUvVxNPdXwYXJslG+NJuV5T8R2s4sWfweljDOXh6EaBNC7/3+PviQn
	Q8pYLNjwCS4jhZCubuQ1QfSGsfpkrRfhR7Nam/blQaUY+F3nYAJ1FAcMtzzkCYEjdVYbi7C7N0oOH
	iiU0Q85WtUl0bdYMmLCB5bHM3OXLexcJm11SOaH84ga4JLF0zhz95eYeMkDJ7Bz2DwIvZjG7lQCTh
	yvtJ8ks6YS0EfJ5KuuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Nzd-0000000HKpn-0AwX;
	Tue, 21 May 2024 11:49:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NzY-0000000HKm4-2rns
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 11:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20AB662213;
	Tue, 21 May 2024 11:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3296AC4AF0E;
	Tue, 21 May 2024 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716292155;
	bh=i0Ih+w27uGb8ApwJcyy8K/wXBEe5AomGLiW94Z7779U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UEzghIrA4Xj8E+KJcv5rV4Fg3OTCWpAUwdbjYoPWT7gVOSRV6SQWe8m/tqWm/Z9j5
	 LOq8iVVDdA9rPeFRqn06kyALX/Y+uzSJpXu3xND6BGYItuRbp/7eyMzvWoJ0sru44g
	 x4d1w6d0UF1SDAapeQK/4zR5j4SC+2FuKlwzMgObcR/47F8hL81htaSV4Rnu0ZDg4e
	 fEo46pfirWJf5acsZojEOXkrupLGS8O0Hsh4ukXb9lgUJXlztR8hWESUBNwCG8lIb8
	 KgEaYeUmtF8QkqoLyQKmF8kJUAICzjbt8epkz2evCCZ1IFxRnNAHVmemOu17uDk2yJ
	 LmoRZmxGAxPhQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 7/9] riscv: Enable memory hotplugging for RISC-V
Date: Tue, 21 May 2024 13:48:28 +0200
Message-Id: <20240521114830.841660-8-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521114830.841660-1-bjorn@kernel.org>
References: <20240521114830.841660-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_044916_840690_44E88B0C 
X-CRM114-Status: UNSURE (   8.00  )
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
SVNDLVYuCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+
Ci0tLQogYXJjaC9yaXNjdi9LY29uZmlnIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZwppbmRleCBmZTUyODEzOTg1NDMuLjI3MjRkYzJhZjI5ZiAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMTYsNiArMTYsOCBAQCBj
b25maWcgUklTQ1YKIAlzZWxlY3QgQUNQSV9SRURVQ0VEX0hBUkRXQVJFX09OTFkgaWYgQUNQSQog
CXNlbGVjdCBBUkNIX0RNQV9ERUZBVUxUX0NPSEVSRU5UCiAJc2VsZWN0IEFSQ0hfRU5BQkxFX0hV
R0VQQUdFX01JR1JBVElPTiBpZiBIVUdFVExCX1BBR0UgJiYgTUlHUkFUSU9OCisJc2VsZWN0IEFS
Q0hfRU5BQkxFX01FTU9SWV9IT1RQTFVHIGlmIFNQQVJTRU1FTV9WTUVNTUFQICYmIDY0QklUICYm
IE1NVQorCXNlbGVjdCBBUkNIX0VOQUJMRV9NRU1PUllfSE9UUkVNT1ZFIGlmIE1FTU9SWV9IT1RQ
TFVHCiAJc2VsZWN0IEFSQ0hfRU5BQkxFX1NQTElUX1BNRF9QVExPQ0sgaWYgUEdUQUJMRV9MRVZF
TFMgPiAyCiAJc2VsZWN0IEFSQ0hfRU5BQkxFX1RIUF9NSUdSQVRJT04gaWYgVFJBTlNQQVJFTlRf
SFVHRVBBR0UKIAlzZWxlY3QgQVJDSF9IQVNfQklORk1UX0ZMQVQKLS0gCjIuNDAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
