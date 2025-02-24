Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5967DC021BF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzG3youu4JcvtqF5YolHv3I9eLKGRLunJ0vYUpIakRk=; b=zAXhJ5465uIIvX
	AAFOAXscaJauDCq+pt7NBrfcYKpi8K0mIflKmgdFgK13qyH4bBtl9bzPz0A//E+Mc2WIRJ0cblsfw
	ZWXcwVh9oS4TMxSBvArecJFLJjon5iHN3l3fBG2jCxUzB+dTLCkFgbwL+3SgQMmQVF3SsOZToKFAl
	ENAvSklvwbY8wSYXLNNU8hS9tces/Fpnr7oP4trrl5ZM2OBko7guDoEDxFyjVU3XzcYIerm3HntsR
	deebkGPd8Rk7Px4KoPt2oM/oPMzSFERNOVu8uqRaUoSzgYrh/DYm48sf3oH7u3fnSegLMWhQDUL6q
	K3/6ah8oyehaF+KlbW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHJ-0000000Dn1U-0bm6;
	Mon, 24 Feb 2025 13:13:45 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWWQ-0000000DKmT-3amS
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 11:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740396074;
	bh=x+JZ0bZh6o31FzL/bWs2L2enB0qu5OHjl9gf7Goj11o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k3VDnIYouVr0xuGpeuELmGYMzdWobg9FRDuC7C9Ezp9heZVLghfX8FkRtu2F7dDHT
	 Kkkq7HbrnLxWRaK/eMZiQsJyjeG6FRUei2AEg/LnV7gQrdulTn+JnyRv/tFHXSOAk8
	 Dl81KF6d1PcEAr5VfpGYtWbDbzhEzWuGwV+nG0ho=
Received: from stargazer.. (unknown [IPv6:240e:358:1110:6100:dc73:854d:832e:7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 44E931A40EF;
	Mon, 24 Feb 2025 06:21:08 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fangrui Song <i@maskray.me>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH 3/3] LoongArch: vDSO: Remove --hash-style=sysv
Date: Mon, 24 Feb 2025 19:20:42 +0800
Message-ID: <20250224112042.60282-4-xry111@xry111.site>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224112042.60282-1-xry111@xry111.site>
References: <20250224112042.60282-1-xry111@xry111.site>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_032114_919255_8618FDF9 
X-CRM114-Status: UNSURE (   9.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

glibc added support for .gnu.hash in 2006 and .hash has been obsoleted
far before the first LoongArch CPU was taped.  Using
--hash-style=sysv might imply unaddressed issues and confuse readers.

Some architectures use an explicit --hash-style=both here, but
DT_GNU_HASH has already been supported by Glibc and Musl and become the
de-facto standard of the distros when the first LoongArch CPU was taped.
So DT_HASH seems just wasting storage space for LoongArch.

Just drop the option and rely on the linker default, which is likely
"gnu" (Arch, Debian, Gentoo, LFS) on all LoongArch distros (confirmed on
Arch, Debian, Gentoo, and LFS; AOSC now defaults to "both" but it seems
just an oversight).

Following the logic of commit 48f6430505c0
("arm64/vdso: Remove --hash-style=sysv").

Link: https://github.com/AOSC-Dev/aosc-os-abbs/pull/9796
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index fdde1bcd4e26..abaf87c58f9d 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -37,7 +37,7 @@ endif
 # VDSO linker flags.
 ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
 	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
-	--hash-style=sysv --build-id -T
+	--build-id -T
 
 #
 # Shared build commands.
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
