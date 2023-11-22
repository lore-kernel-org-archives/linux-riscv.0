Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E52C61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ee66nZE6nmR9N7C4uCOZ4Fyil6EBspgPHWxts055bS8=; b=j6os8B1A/Rpj8K
	ublVbe0apANSwVLSK/EHijrywn6+EAhbjvKhUVZ7uDTvhtjoo/oexyoNI1P5zTVz6vyxifctn8Lk7
	HVL61DevwJGQ1w41xaiKKDMu0n8MYGJl7U+2mgJvNtAfkNw1o7NsaRKdVuZ2SklwjB6NGStHuxY2Q
	lz3PzYW0Sub6+gK61OsoRs030Hi75wdlKJywY8Mnw+7Tlbz2cyL1yl+6qVSZ7+MmxpmQQQLt64BOW
	IuO3v+hmXYcpJTK00qIVkeXaNlXzDvPxcj/r+bpL9htEvjdqwOqtlaflG4wLI467FS+2iZhCml0pt
	zS8q498wBYzsMHF7vh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jlR-001FHP-1u;
	Wed, 22 Nov 2023 09:43:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jlN-001FD2-21;
	Wed, 22 Nov 2023 09:43:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 999C5B8117B;
	Wed, 22 Nov 2023 09:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB115C433C7;
	Wed, 22 Nov 2023 09:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646195;
	bh=EkyJ2sjNqguwXqxmxIIfJqgpolmeU80tDQ1mr2D5TfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VS4V1mmE0ZeLoutxYILjpbDNn60e5Tw0OcoSbTasgmO/VejZ//vSk5A4xO+WKFwqr
	 Vt+kO1vC6TXvQBTVbFHHuAp1E9yemr98c7HwHxCb8pBTuq2ba5qEzAzV28dH5jUvlU
	 zMV7HFvQUN1V1bnbNkCq15iyICNQRqCvaWVMvZx4cPo7LnC/W6QUANmM/9t8FXhwrZ
	 eQ+p2PRpxpv2DgKFpKGxSozrGbwpYTwkR7GsL9szoTE6zP6Poc7ZZozJj+u3Frk+Ot
	 uAG2FJIIdF6HfISncjYll7FQ2wapnt8Bc+ndxxZBDEI5t7GlqrUHlXf3Jwmo1mtA3k
	 w60pzdRod63Lw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:13 +0000
Subject: [PATCH v7 03/39] mman: Add map_shadow_stack() flags
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-3-201c483bd775@kernel.org>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
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
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EkyJ2sjNqguwXqxmxIIfJqgpolmeU80tDQ1mr2D5TfQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXcz5ctjongA13l+3s8rDr6lCcYzCiV/EZ+w01
 Sjq0p1+agmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3M+QAKCRAk1otyXVSH
 0BmeB/0fdILWv3xnmoh3iIUnb+EGSP88bn3NvTdnqSR6EOCHL4XrJPUgwQteJL4EkrLBwM7IXDO
 phEWSI0/nmWusNr3v9UW6kZ1NmYF+253MWc4v54TjgzG9k4mafDzYYfcZzuGeMZK6JCCAWkGLr0
 wv9DrCEa/2jyyNb5n2y+K8nYdNHuJuRrS+1Upl0ZSZ1w9M1JxGUsJgLvnPmoIDgcox7Wg6uxeHf
 BzbRTK0693utYKeBvr3gTPU/c80PO0X47jTSfpB+WRA2FLQW9FCrDBwc3Z6WFvN2+z7guWL/86q
 nFREV+64zb5OuzopYwcn7fjb3cADnfSnvSBqlAmHmHfk5T6+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014317_960035_5036367F 
X-CRM114-Status: GOOD (  13.34  )
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
