Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0F0C369C9
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 18:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/TDiS92Z+b1i5aVRYGX6DZyzJ3/lYXi9F1aFyy7ukg=; b=b7Q6WtsW+vof1H
	nLW23hG7aGg848h2giIMmizEEF9SYFwiVpbnwe3rtkczfooQAvw1BLgZZFV1CIyRr2n2SMILg3bNB
	aC2BA3Tdue5UU2aOVWKmEIXI4k63p2XPI0SO8iNiC1dGcxsqQW8h4d010fdt+wmOLouJTsozL1P6+
	EHrdlyIORxqOSctf1qFOs0Sr8QahzRzStgLd2OpN6tN8EZnHgmsKkVpchoLM8Mi+puza7H70Ovhbv
	s6fxa8wOu5ioQOO22FVbZ4x3SY0g/eOwf4MA9YYyRQIGQUVj86SDYFFzDFvDpmE3Al5kUbOll5uE0
	+E91nUGhKlNAJoGMjuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5U6h-0000000E4bS-2yuI;
	Thu, 17 Apr 2025 18:37:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Tx8-0000000E2IG-1OXl;
	Thu, 17 Apr 2025 18:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C89925C5891;
	Thu, 17 Apr 2025 18:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4896C4CEEA;
	Thu, 17 Apr 2025 18:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914429;
	bh=HKEB5CqVerYhbkmnvqnNR7Xh56F9rN2hh/iDbljsXuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AFhVlWouUAmT3oifbDC+56pvMoGbq3FY6auILxK/3y+GGXU9nFHxZj0X5SEwDgEEk
	 T+ccHR5spJaee/HwVRv1dOo83XOvLhiSwFu/ZyfvGtx9Cav2juDd7HX7GikHSe/ccP
	 hWmKDT8BcVhVOxFN4YDpxwXLQcPC7eScDGK+7l9ukCTpZCMlK2y2KGjIEHXUe0X9VR
	 jrxGnVNXY2YNjK/wyvvl8J0QkBQ+pmwDf1g5Zy9dHi61wXTC62p1hrLvCW9e1L7kid
	 OjBfoPqlDrgy0LarysHtGUVrGcRRgnaapoSgW3grxNYCCNKc7CS83yehP469AttXlm
	 O/mSVmlUaBuFQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 04/15] crypto: loongarch - source arch/loongarch/crypto/Kconfig without CRYPTO
Date: Thu, 17 Apr 2025 11:26:12 -0700
Message-ID: <20250417182623.67808-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_112710_413507_32DE908B 
X-CRM114-Status: UNSURE (   8.13  )
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

From: Eric Biggers <ebiggers@google.com>

Source arch/loongarch/crypto/Kconfig regardless of CRYPTO, so that if
library functions are ever added to there they can be built without
pulling in the generic crypto infrastructure.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/loongarch/Kconfig | 1 +
 crypto/Kconfig         | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 067c0b994648..8ad6cbd8676f 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -737,6 +737,7 @@ source "kernel/power/Kconfig"
 source "drivers/acpi/Kconfig"
 source "drivers/cpufreq/Kconfig"
 
 endmenu
 
+source "arch/loongarch/crypto/Kconfig"
 source "arch/loongarch/kvm/Kconfig"
diff --git a/crypto/Kconfig b/crypto/Kconfig
index a5225c6d0488..de71e9c9f2ad 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if LOONGARCH
-source "arch/loongarch/crypto/Kconfig"
-endif
 if MIPS
 source "arch/mips/crypto/Kconfig"
 endif
 if PPC
 source "arch/powerpc/crypto/Kconfig"
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
