Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CC8C4828D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFumZkqg8tb66t+eovwR89g7nu0I+5DqdwjRAdyTSYA=; b=stjss0UgbbB8HY
	MQ3FzfQHpWg1V9ezAx/DkUFUv4wOjfRGfeuBarMemwEstZd6a1UAGhKtaTn3TFUkl66V6zlcYx+I9
	uTl4QxeECfjPDjZ+MeFkC70y20/2/OoXp6OCY+Rj2LMamLgpWCLQq5dRbS4jYtIMpIdvT00qQ0cMo
	omGPXFbRaLI045Vs+aKCPoZRdCjJZX1aB23Db3asYzCxWLX+igJfdy7OfbM2n92LnY1bh6ZlA6anw
	787tSljRG74H5g6uQ1G0/v595M+rimRxUQRl852xerqdKmU+w35QRSdeOIAuYxoFHZ4h9fL/NxnZn
	L+fVVjeZYeHCgrW3UcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWF7i-0000000GHgf-1XG7;
	Sat, 03 Feb 2024 12:27:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWF7e-0000000GHe0-18e0;
	Sat, 03 Feb 2024 12:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A28A860A13;
	Sat,  3 Feb 2024 12:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76937C433F1;
	Sat,  3 Feb 2024 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963269;
	bh=uElqfQr2KtEKDlB4Anquq4cFfJfq+1aLsyIKGyzwTJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s313WgbkOz6vbnCBve0R1yHwDF1pK5mK+UYPA+OD99GziD3jcKqQKnySBTBGi4duj
	 vqr/SmLkHLF4Lk3ruhNzm4cJmmH3yq67ODVpGPJa204lWf5JGzspt5wcs+jVeTqQ3S
	 xhGc67JCzmdfCFdtsQj0eD1MNq802vjS85i8oJ77UsbyUsgJU3LC/razYzQhP82fOZ
	 yUEt8OsHLWgjE5yCQS9U678Dqz4m0U/3+3XD3cpVQmlStDup2yznD4F1i3uy552aa2
	 ph8TrgcsHHnR/DdeZgxHiKuE4/CWD9hXMRVY4GM5fwosCA8s0HuS3SOZeZGavv+/d9
	 AJIcyVewnHvvA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:29 +0000
Subject: [PATCH v8 03/38] mman: Add map_shadow_stack() flags
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-3-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uElqfQr2KtEKDlB4Anquq4cFfJfq+1aLsyIKGyzwTJE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDTUIBdLAQcWP64eMtOa1tBhyxd3vT1/dabcKsI
 J03ruPGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w0wAKCRAk1otyXVSH0H1sB/
 48Yjm/fTfaRFnrNWPL9rLUxz1LhV7ouhYI4uPWpceW/ximquDLxZHEc/zFA3kWQprsk3kgF3Ek+H4h
 sJ6pKh0M9pJjZAaoKYLHUs725T3HFZXBH+EY+nMbrwxH0LDhcfEZLPfhdYFuRJJf43IjfuPzYjQF44
 RFh4W9ZcVujZWePceJLCoClhHmUjxLuT2mjx+h0DBhjLu7LU6hT0wiXmkntjXRiS99AUMr2o7qNyms
 aaPTUAlLc0njj8DVRSzXsIP/EhochXn1l2v8kaUwkKB6RZSxGLBAWOqK9emNUOuONlL5xtKPyqXGqA
 OIJpJdP//0DLv8SNxwE5R86ch2Uq66
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_042750_485055_48285667 
X-CRM114-Status: GOOD (  12.89  )
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
