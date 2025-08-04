Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F193DC87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8h60mEhTSvuRmYknp06m8OTZHRBrdaWwxdTcmyxG258=; b=zV8qlDgcsLJZNS
	cPqr/+62AtY0S6kAOCJeztdwkpT/yBIzIrRo0yCx2+8Hk93hMLkdvuHaJmr69XzOeErCr9MGU9WEw
	rvwoDzkANzmLM2UzsCwG2/FFstQmME98W1DTI/spncdd3sbVhx2+ANI7kd+Bee9QuwQ74sc6avZRa
	4bmKrQf018l278fPPd2e0JrhpdlYdi2M9ETneTFGrMtrH5uSyMV27Th0XtUFLjCoCL4V7ADC57+Ib
	Qylu5Py7+/u/p/I0RIonBowgwqLa0KjvL4j/8jH/NnLz0OxpBE/BBgc98Z3A9/ciu1rGRH1FfJSQY
	LOWgY7k7yCPlfujaU00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKZ-0000000B10Z-2mE3;
	Mon, 04 Aug 2025 16:46:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyIP-0000000B02A-2veL
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 16:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC74545E9C;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0DBC4AF10;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=qBtLAFX1ElqeAeYMLqY5b/htKgZsKDyJ9FsgsyXOP0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kp6LgWvaC+JEEdzd/Dg6N32Ddbu8okhan2FNusfuPzb/+mtKpY00kgSWLtUB4lxZ1
	 agtCgKlv4oPcKNTUENwcnN6oQnfWaK/BRy+DAFo22YYX44R2rTwP1fiKy6SCrbsb29
	 EoH8nLBo3UHb53nqW0BCFrF5MIJ1VL7X8xHr0PRPBwAGzOPvBlVtBYlONnhLX0NU/R
	 cK2lZhvuTQErOUUkr8caoNuFPryzEl5+oaCkyeDKm5zxVDNUriO3vJeouVSjaZvAln
	 bH9HkpexT8y9oby0emLBvnqwbpd3PL7GU/mNyh1h70wfClsRQO3uTF05s6DLQjTWLl
	 ZFTlkXCUPL+YA==
From: Kees Cook <kees@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 16/17] sparc: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:12 -0700
Message-Id: <20250804164417.1612371-16-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=kees@kernel.org; h=from:subject; bh=qBtLAFX1ElqeAeYMLqY5b/htKgZsKDyJ9FsgsyXOP0Y=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHsdU/+bmO7Fhxa1ih00tOXKbpp0476zeIfi8Yf2pN V/3MW9O6yhlYRDjYpAVU2QJsnOPc/F42x7uPlcRZg4rE8gQBi5OAZiI0H2G/5UJfWucumQV/e+3 bQ+5Mrn3SsqlxOfneU8K1R0s3fBtqwkjw+5N+nqci535gz/LNFgwPl81b+K/bhn9NKvtdwS9tVa L8AMA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_094421_810073_85222F9A 
X-CRM114-Status: UNSURE (   9.98  )
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

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute__const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

Add missing __attribute_const__ annotations to sparc64's implementations
of ffs(), __ffs(), fls(), and __fls() functions. These are pure
mathematical functions that always return the same result for the
same input with no side effects, making them eligible for compiler
optimization.

Build tested ARCH=sparc defconfig with GCC sparc64-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/sparc/include/asm/bitops_64.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/include/asm/bitops_64.h b/arch/sparc/include/asm/bitops_64.h
index 005a8ae858f1..2c7d33b3ec2e 100644
--- a/arch/sparc/include/asm/bitops_64.h
+++ b/arch/sparc/include/asm/bitops_64.h
@@ -23,8 +23,8 @@ void set_bit(unsigned long nr, volatile unsigned long *addr);
 void clear_bit(unsigned long nr, volatile unsigned long *addr);
 void change_bit(unsigned long nr, volatile unsigned long *addr);
 
-int fls(unsigned int word);
-int __fls(unsigned long word);
+int __attribute_const__ fls(unsigned int word);
+int __attribute_const__ __fls(unsigned long word);
 
 #include <asm-generic/bitops/non-atomic.h>
 
@@ -32,8 +32,8 @@ int __fls(unsigned long word);
 
 #ifdef __KERNEL__
 
-int ffs(int x);
-unsigned long __ffs(unsigned long);
+int __attribute_const__ ffs(int x);
+unsigned long __attribute_const__ __ffs(unsigned long);
 
 #include <asm-generic/bitops/ffz.h>
 #include <asm-generic/bitops/sched.h>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
