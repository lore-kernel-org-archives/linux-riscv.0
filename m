Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C54C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ac7j4kmeU9DNmf+8PAVt4ZZKp3GdINnkD+hdLdez4GA=; b=cfHadmBhAizedn
	dVWMVmEjBE4OoVoO4OP3Dieatvnz2RlaSES9jTCgMmXL7LVy8iwP4NKgT4sQo8HHOptgbM60Rsyo2
	6mEKmkXAzz8XsOOQ9n9n5G4KCx4vM20wP3EkAC9V1qTEwKVkZhWaEXHSnMz4tnIVFtcFq86cjCrFn
	8U6pmuGVcTxnAscHhNizel4XyHX1d9ehjJVmcDKgi9JoPAQHdLYQV+kuMKP+rumebhfcLZe+8XxGt
	HoPXCuD7rKmd4V10UXoIhG+dJobriaWvmubZwqQm3boMdG1fX9rgD5Jg5t8anvf5IJaO5d4NMd9b8
	Z4UaFQy3qZgWJdOxY+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVPL-00000005JFN-0C9B;
	Thu, 01 Aug 2024 12:59:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVNF-00000005HpX-1Dos;
	Thu, 01 Aug 2024 12:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB80E62767;
	Thu,  1 Aug 2024 12:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC12C32786;
	Thu,  1 Aug 2024 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517060;
	bh=2jWl08+8re+Jbyu9WlYwMAOos2oJrw5SQjRGnUXuA4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k9EWh0gXg6rjx7kV1lB1Gmt38FbXgl6/I7ewuvHjZKZKsi0Ra/eNEDb4+nkaWeebY
	 5fo+KHzl2gVZT5y4QEi94AFCr3yy8q0Y3qfsKo4MUU8ZvEpLuaXTE+gJP1/QJAFy6b
	 ZFESzXLHeTvuf0gbP+smJF5PdWb79uTbdLNbHoM7qIVEW52ay89XQq3Sh1JchzEOGn
	 vJeZOlSSSY5GbPB2qtoVLFB9VX16JELscHgpRYVwyYdxXfoIRQv+2ArLna84PZ0pA/
	 DxpPvqcJ3zRpN1CX47iKOu5nvE+8eTswjAlK6Uc34hqiDr+Esbw3xgOrUR21qH2t9A
	 3O+OwqSvPl7qg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:30 +0100
Subject: [PATCH v10 03/40] mman: Add map_shadow_stack() flags
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-3-699e2bd2190b@kernel.org>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
In-Reply-To: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2jWl08+8re+Jbyu9WlYwMAOos2oJrw5SQjRGnUXuA4U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YID0+m+ZzdQpJGH0gtPDP+bAsXULUCyyq8/y2t
 MduEdEmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGCAAKCRAk1otyXVSH0Ot1B/
 4jaebyV1tIrvOIYxQh5wDbypCmbpdfYnw84eR5kyJZqQIRjZ+dK0lQJngqeHe4n89q7hMI4OUDMfSr
 Otel0Z609ebmO09EfOX6sKZzZ2/uru4+YnSoeGjvRZZsYsr1B+7FWG3o5mVY91e4Sdd+6ukU+qHmzS
 axuQgqxevf/x3L67X0UZGMdmC5B8jQ2x6Gu99RAzuYELIUE2nPQ1wCneKnvlyC+FPrLbjWdkIDKVN8
 wmGHe42BNZh62DU3scRZYxWf6RdwGbFcR9PlKRfpI7Ocuez5/KqBYFTD1YXpI3HGD35BhAYcpFTswG
 yKHazykP6dg1NzH0pTMC7LYphwlbfE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055741_451182_76702CE7 
X-CRM114-Status: GOOD (  13.76  )
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

In preparation for adding arm64 GCS support make the map_shadow_stack()
SHADOW_STACK_SET_TOKEN flag generic and add _SET_MARKER. The existing
flag indicats that a token usable for stack switch should be added to
the top of the newly mapped GCS region while the new flag indicates that
a top of stack marker suitable for use by unwinders should be added
above that.

For arm64 the top of stack marker is all bits 0.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/x86/include/uapi/asm/mman.h | 3 ---
 include/uapi/asm-generic/mman.h  | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/uapi/asm/mman.h b/arch/x86/include/uapi/asm/mman.h
index 46cdc941f958..ac1e6277212b 100644
--- a/arch/x86/include/uapi/asm/mman.h
+++ b/arch/x86/include/uapi/asm/mman.h
@@ -5,9 +5,6 @@
 #define MAP_32BIT	0x40		/* only give out 32bit addresses */
 #define MAP_ABOVE4G	0x80		/* only map above 4GB */
 
-/* Flags for map_shadow_stack(2) */
-#define SHADOW_STACK_SET_TOKEN	(1ULL << 0)	/* Set up a restore token in the shadow stack */
-
 #include <asm-generic/mman.h>
 
 #endif /* _ASM_X86_MMAN_H */
diff --git a/include/uapi/asm-generic/mman.h b/include/uapi/asm-generic/mman.h
index 57e8195d0b53..d6a282687af5 100644
--- a/include/uapi/asm-generic/mman.h
+++ b/include/uapi/asm-generic/mman.h
@@ -19,4 +19,8 @@
 #define MCL_FUTURE	2		/* lock all future mappings */
 #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
 
+#define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token in the shadow stack */
+#define SHADOW_STACK_SET_MARKER (1ULL << 1)     /* Set up a top of stack merker in the shadow stack */
+
+
 #endif /* __ASM_GENERIC_MMAN_H */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
