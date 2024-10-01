Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3AACF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWD6yiXpdFazJ7cEqw9STlZec0/gpjI2w4gCZAnAcao=; b=EHJpfbmt0xu3Nn
	jj8BLKD/fYWa+xG1JpuF9oNX0jkyIdJgoXfAHbC9TRwpx9olspUX3vvbBd5mgmTafKtIOxTgJPfhP
	nQDFmyjOy1V0BW26Kr2PhdlV5d+JtNQ7N4wbyflKXXol/s1Az+usF3OimEKKW3WO2V1X8qk5vpKrW
	qzYDvh2NfY485hf+pfbIgxte22Xny0A430cRtFCIjGpz9DQrm/cxSXcrT3T9ABVIKGqOeG3qr2+AO
	+B8eXU6Dd/01g1XUSNLrtyveAO4T/BHbM4yJxGWzqITilYMlLyu7d6K8Cb4kide21oll8mPGgQZq6
	zMIlyo/JJz8dfqXs/66w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svlt8-00000004Gzx-0AG1;
	Tue, 01 Oct 2024 23:02:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlqh-00000004FzQ-29vX;
	Tue, 01 Oct 2024 23:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A516D5C045A;
	Tue,  1 Oct 2024 23:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFD2C4CED1;
	Tue,  1 Oct 2024 22:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823606;
	bh=K6nXwRRi2N2p9O+dRh8Gd4JwgstifXi9hk/l+K5hCjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M+LrQCFIkopMYl/E2s9vQPe6T8H19H1rdI2PzELpSbH2tZkMTJWHtSl+2EYi/ah1z
	 3gNvAjxtNi3aQt9efZ4PcX2fWFLMJpiHM6uEbuX2C0HVtRXPZfw9PLqQgsv/DpZwhx
	 ko+d6ciuvCQ2Zi3pSHmuUbMhyDPPM+bDSzAeeA5DZn/uPvk6y62lYnl1c44ewkXSNh
	 69leE+uXUVW8w6BP9hlKmk21rT5UvHvm4x9Wtdw/GlWeev+yKsYzQPcLqMEEXGqF5o
	 1w9V84sUajw3M7/wnS3UK+I7TJGkE9yKVWCqZC3+iND5qOE75MQlBXH3YYnAtQBGfo
	 T38SzvAc2yohQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:58:40 +0100
Subject: [PATCH v13 01/40] mm: Introduce ARCH_HAS_USER_SHADOW_STACK
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-1-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>, 
 David Hildenbrand <david@redhat.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=2413; i=broonie@kernel.org;
 h=from:subject:message-id; bh=K6nXwRRi2N2p9O+dRh8Gd4JwgstifXi9hk/l+K5hCjY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7EyB0QhviIMb2LVkfpk1zMQNJtqgP10cwGbREj
 CBtA0z6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+xAAKCRAk1otyXVSH0Lr8B/
 wNnePEP19hP37w0wQd3K+wIDCK/eEBuzpFZ7aYnELX+hjYVtc6/ns8JF6kdNukQYwFNws8ICPJiOp9
 CvrEFl08K+lcDS1kc4uaRH+/kWfRTSTzicv0EplBPJT8M+3/QZyreAfUpJbOKHeRlZxVq/cJGAk+Jj
 /Ywx3NloAY4Yh3F9TPLeMJGiEC5fpNt7QIqwIY4AJPZEN7B1f1jMU68VoYJRLD577RcfZOX0ZKAs2o
 ccw9CicbZxRRybL8cEyTNUK1ukKmeTV3+s8mwttHVX+soNQu/jI1GrT00svFE2+Fk6OVpNPgCD7itC
 81KlVxmfhyeTIRfwIaiO5gkLbBEjnZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160007_685798_8BAA6368 
X-CRM114-Status: GOOD (  12.93  )
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

Since multiple architectures have support for shadow stacks and we need to
select support for this feature in several places in the generic code
provide a generic config option that the architectures can select.

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Kees Cook <kees@kernel.org>
Tested-by: Kees Cook <kees@kernel.org>
Acked-by: Shuah Khan <skhan@linuxfoundation.org>
Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/x86/Kconfig   | 1 +
 fs/proc/task_mmu.c | 2 +-
 mm/Kconfig         | 6 ++++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2852fcd82cbd..8ccae77d40f7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1954,6 +1954,7 @@ config X86_USER_SHADOW_STACK
 	depends on AS_WRUSS
 	depends on X86_64
 	select ARCH_USES_HIGH_VMA_FLAGS
+	select ARCH_HAS_USER_SHADOW_STACK
 	select X86_CET
 	help
 	  Shadow stack protection is a hardware feature that detects function
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 72f14fd59c2d..23f875e78eae 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -971,7 +971,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
 		[ilog2(VM_UFFD_MINOR)]	= "ui",
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 #if defined(CONFIG_64BIT) || defined(CONFIG_PPC32)
diff --git a/mm/Kconfig b/mm/Kconfig
index 4c9f5ea13271..4b2a1ef9a161 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1296,6 +1296,12 @@ config NUMA_EMU
 	  into virtual nodes when booted with "numa=fake=N", where N is the
 	  number of nodes. This is only useful for debugging.
 
+config ARCH_HAS_USER_SHADOW_STACK
+	bool
+	help
+	  The architecture has hardware support for userspace shadow call
+          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
+
 source "mm/damon/Kconfig"
 
 endmenu

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
