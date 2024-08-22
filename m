Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5683AC52D6F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UecOpwcO5BwluEpdHjmYB6uOnSrjljWhDb7kZRqzgw=; b=SpE0Gce98Zw2oZ
	7wVn7MMpQW1RFiPQqekxYG0MbIvVZNzFc/kUWi8kpaaQ7wxrC/vty+HfGR4qgUcz9aBczjvWu1W2a
	/3GJv2avjrD8O0cN6QsFSWtN2VE1p/cQGyX0OqR+ZjM3RauMc8B8UHL+XYS/wJoorl+aCu9W4oydr
	bMsC6qAVb1nfr1VUJsdqqQh3TPqQ5CAxPTq3E4RlH1xKFd/cIrgp5M/+vnr3xzPCGK+UFhrmV9i29
	3706V/duGm1oktjnkVb0DnRbfF4lGnHuvBV6zoxP/up4XfD/IXo1t/LqrYyngkSEXOrm5ObgPG5cW
	0+j2Wo/giwt/3f8zyvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwUc-0000000AsWW-37OA;
	Thu, 22 Aug 2024 01:20:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwRZ-0000000AqzH-4866;
	Thu, 22 Aug 2024 01:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 628E9611C2;
	Thu, 22 Aug 2024 01:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6297C32781;
	Thu, 22 Aug 2024 01:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289413;
	bh=/QxGsZ7kGu5gcX/2Pir/IdpixOHnIz8YHhHUjvvkxmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LGNDWsFlzxJpsLAVIpOQEC5kb6i5ctYSjTkS7zqKfYjDO4HeXm79/cVdBPJvmur9S
	 od8xZNlqIyVK5T1bqkMmjcHzbj6a0klUysAlpQi2Yhgih8mzhbij+KdMseAm/FdQaF
	 qZTBLHdveQuXmpCBhljTF9L8u25KyBQ3UkEXKwWG7h9HTFhHMq/8EFjSAASEO69fhU
	 Rha2NJPqhAg6/O6D/yn51jj4yM7pVQ00gtqctq6vmIsGxMeZC4BVUrbCVpCVEvt/v1
	 72uY1RjlmTcQPUSdvy9x3LJE8vZby6RTH8pn89jlq3aBz6DUaszeHlYh35wZz71MjV
	 TIllZc2KTvXAg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:07 +0100
Subject: [PATCH v11 04/39] mman: Add map_shadow_stack() flags
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-4-41b81947ecb5@kernel.org>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
In-Reply-To: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=1882; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/QxGsZ7kGu5gcX/2Pir/IdpixOHnIz8YHhHUjvvkxmA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpEm5kN/wk9/KZfcaloebeKbxKmUlgdTlw1GvdtV
 QGljy32JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaRJgAKCRAk1otyXVSH0G6bB/
 4oIpOZVu8Yo9IDRGCq6U5tCs4LXytwZCRgOuYex97b7Nkcj7jMWi4RhwitRZSfcpV0DbYlyYd+iWWW
 PXiCwTyXg40ZxbW3FSHAb0/7l1IC7zergq6B7kZ8GwyGAdYoI2VWcL668YXJJoQLkv2B67vBzFAWxA
 0aJoPCixyep42bVyjfHhbxUWuUVTm6Azfs8smOLro0yiE3SO1sDbg9IHXUv8KRtBB+liDWGGcGlCR9
 8cZ/Ui5XrZeRA2H2ClhqE8XtfVPG0YL24APKug6j9UtK+9QI38fi43WAWS9vEmgkxaxk8WN+QMdAyj
 N6cNfGTWdiZ/qqkbem1568AQ3f+9wl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_181654_215288_3003F0A5 
X-CRM114-Status: GOOD (  13.31  )
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
flag indicates that a token usable for stack switch should be added to
the top of the newly mapped GCS region while the new flag indicates that
a top of stack marker suitable for use by unwinders should be added
above that.

For arm64 the top of stack marker is all bits 0.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
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
index 57e8195d0b53..5e3d61ddbd8c 100644
--- a/include/uapi/asm-generic/mman.h
+++ b/include/uapi/asm-generic/mman.h
@@ -19,4 +19,8 @@
 #define MCL_FUTURE	2		/* lock all future mappings */
 #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
 
+#define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token in the shadow stack */
+#define SHADOW_STACK_SET_MARKER (1ULL << 1)     /* Set up a top of stack marker in the shadow stack */
+
+
 #endif /* __ASM_GENERIC_MMAN_H */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
