Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4A2C71150
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uqk7hfiaTkkhgJAVQsSBejlQKJ3RD/blrRSJtp4G1rw=; b=Stk9Txeonlfnca
	NcMlfAy6T7Hgoh7z7E+SixF8zFx1+mZ17SNb0EqUrsRHAbRy2dKf7YHNXDL/dOhjoatTYLMLrA5FL
	a7CyT9QEQQdyL43eUKXj7uOMuAbrYnsfc5XdpXVf+b6WK4t2tku1RDZmlTU2EE+FGkvqwNc6YAR32
	retW8OYvCn2PD9bgZ26ieB/o71PTM+C+/ei4cX5OyKdowRbo5f5ciQ1hSWluHlzvdpVb9riShuHT5
	ilbxs9y7+ezrZUrTdR+I4QXGzIXGBqgejuxsysjk62BlGXOAJgmoMIRNs3s80nbB+aTzImu/YW1TC
	3lok/NaLzWhu/Ju2OHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSC5-0000000HOnO-0OGt;
	Wed, 28 Aug 2024 23:35:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS6I-0000000HLwb-0UnI;
	Wed, 28 Aug 2024 23:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43C28CE1708;
	Wed, 28 Aug 2024 23:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A3DC4CEC8;
	Wed, 28 Aug 2024 23:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887755;
	bh=sDJ3u3Z9GTgD+BJMCVvapSr5AVC498rBoFZEsxgxj+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DX1mD46P2pPRS1C2iCppJXqv0IYEI+EK6i9kX3ZrSVUX+Zk1uLKwfB+5bX9fekHNP
	 /gooG06oOD+plp5RCyJsxxqa1ZgYXvbfU85IGJ5L2qcmOShO6pogn/JK9TtGvp3912
	 C+zMCvW669ckcb9xmfupvJ/Bplc/3QGWaArNW3Sew5xG74wBGG6bR8x5YKuO3Adwxx
	 B5b6I1cncaLhZhY53NuSAcmEMvSDoGyS42sXd1St2xBOjiDgM7UeaKoEVdzKG3N7dW
	 RwuD0tvejKCQXAZAtV8WLGUl/JsWkEj+BHOppLG3EZfdeSx6XBzKGt85hMyfnFA8uz
	 9YuKfOkytt4nw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:22 +0100
Subject: [PATCH v12 06/39] arm64/gcs: Document the ABI for Guarded Control
 Stacks
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-6-42fec947436a@kernel.org>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
In-Reply-To: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10608; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sDJ3u3Z9GTgD+BJMCVvapSr5AVC498rBoFZEsxgxj+8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7J9lqOuUcvIfYj36g8oaBcHLkKY4AC+Qd8MRoeW
 zkpcvpmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yfQAKCRAk1otyXVSH0MZzB/
 9wMWeHg2mwMGmgw+KIetNIZaZdOLE/Z+97rwP71eGcKsLsXoqOlTP2r3v1RLancsZKCKFURSObPzeW
 18PvbCD34ZjmbfwVNR+cqzkc2IwnERrDyI9Hf+1q+Dd6ufvamTbF1+DApezrild3ey5sz6RSZ2tcwI
 9iezgv5Nlvxph7D4Sy31cMg8lBDMQpxW2v9lyKewl5BHBxn4dNnrSfVIuYO1rPQrCLoVcP+VnGDGOR
 yCqNnuYKQuKJVDckLLoUvnhbjC0fyvZv/paYguP223fpE6A4NtXhj4oOXWD7FnbTY4XjYLR89Y6gYs
 WO7QkRwdSGuiNTsP82h+2rCrRE0GT2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_162918_556498_6E9CE64C 
X-CRM114-Status: GOOD (  40.19  )
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

Add some documentation of the userspace ABI for Guarded Control Stacks.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/gcs.rst   | 230 +++++++++++++++++++++++++++++++++++++
 Documentation/arch/arm64/index.rst |   1 +
 2 files changed, 231 insertions(+)

diff --git a/Documentation/arch/arm64/gcs.rst b/Documentation/arch/arm64/gcs.rst
new file mode 100644
index 000000000000..421c953a0ffc
--- /dev/null
+++ b/Documentation/arch/arm64/gcs.rst
@@ -0,0 +1,230 @@
+===============================================
+Guarded Control Stack support for AArch64 Linux
+===============================================
+
+This document outlines briefly the interface provided to userspace by Linux in
+order to support use of the ARM Guarded Control Stack (GCS) feature.
+
+This is an outline of the most important features and issues only and not
+intended to be exhaustive.
+
+
+
+1.  General
+-----------
+
+* GCS is an architecture feature intended to provide greater protection
+  against return oriented programming (ROP) attacks and to simplify the
+  implementation of features that need to collect stack traces such as
+  profiling.
+
+* When GCS is enabled a separate guarded control stack is maintained by the
+  PE which is writeable only through specific GCS operations.  This
+  stores the call stack only, when a procedure call instruction is
+  performed the current PC is pushed onto the GCS and on RET the
+  address in the LR is verified against that on the top of the GCS.
+
+* When active the current GCS pointer is stored in the system register
+  GCSPR_EL0.  This is readable by userspace but can only be updated
+  via specific GCS instructions.
+
+* The architecture provides instructions for switching between guarded
+  control stacks with checks to ensure that the new stack is a valid
+  target for switching.
+
+* The functionality of GCS is similar to that provided by the x86 Shadow
+  Stack feature, due to sharing of userspace interfaces the ABI refers to
+  shadow stacks rather than GCS.
+
+* Support for GCS is reported to userspace via HWCAP2_GCS in the aux vector
+  AT_HWCAP2 entry.
+
+* GCS is enabled per thread.  While there is support for disabling GCS
+  at runtime this should be done with great care.
+
+* GCS memory access faults are reported as normal memory access faults.
+
+* GCS specific errors (those reported with EC 0x2d) will be reported as
+  SIGSEGV with a si_code of SEGV_CPERR (control protection error).
+
+* GCS is supported only for AArch64.
+
+* On systems where GCS is supported GCSPR_EL0 is always readable by EL0
+  regardless of the GCS configuration for the thread.
+
+* The architecture supports enabling GCS without verifying that return values
+  in LR match those in the GCS, the LR will be ignored.  This is not supported
+  by Linux.
+
+
+
+2.  Enabling and disabling Guarded Control Stacks
+-------------------------------------------------
+
+* GCS is enabled and disabled for a thread via the PR_SET_SHADOW_STACK_STATUS
+  prctl(), this takes a single flags argument specifying which GCS features
+  should be used.
+
+* When set PR_SHADOW_STACK_ENABLE flag allocates a Guarded Control Stack
+  and enables GCS for the thread, enabling the functionality controlled by
+  GCSCRE0_EL1.{nTR, RVCHKEN, PCRSEL}.
+
+* When set the PR_SHADOW_STACK_PUSH flag enables the functionality controlled
+  by GCSCRE0_EL1.PUSHMEn, allowing explicit GCS pushes.
+
+* When set the PR_SHADOW_STACK_WRITE flag enables the functionality controlled
+  by GCSCRE0_EL1.STREn, allowing explicit stores to the Guarded Control Stack.
+
+* Any unknown flags will cause PR_SET_SHADOW_STACK_STATUS to return -EINVAL.
+
+* PR_LOCK_SHADOW_STACK_STATUS is passed a bitmask of features with the same
+  values as used for PR_SET_SHADOW_STACK_STATUS.  Any future changes to the
+  status of the specified GCS mode bits will be rejected.
+
+* PR_LOCK_SHADOW_STACK_STATUS allows any bit to be locked, this allows
+  userspace to prevent changes to any future features.
+
+* There is no support for a process to remove a lock that has been set for
+  it.
+
+* PR_SET_SHADOW_STACK_STATUS and PR_LOCK_SHADOW_STACK_STATUS affect only the
+  thread that called them, any other running threads will be unaffected.
+
+* New threads inherit the GCS configuration of the thread that created them.
+
+* GCS is disabled on exec().
+
+* The current GCS configuration for a thread may be read with the
+  PR_GET_SHADOW_STACK_STATUS prctl(), this returns the same flags that
+  are passed to PR_SET_SHADOW_STACK_STATUS.
+
+* If GCS is disabled for a thread after having previously been enabled then
+  the stack will remain allocated for the lifetime of the thread.  At present
+  any attempt to reenable GCS for the thread will be rejected, this may be
+  revisited in future.
+
+* It should be noted that since enabling GCS will result in GCS becoming
+  active immediately it is not normally possible to return from the function
+  that invoked the prctl() that enabled GCS.  It is expected that the normal
+  usage will be that GCS is enabled very early in execution of a program.
+
+
+
+3.  Allocation of Guarded Control Stacks
+----------------------------------------
+
+* When GCS is enabled for a thread a new Guarded Control Stack will be
+  allocated for it of half the standard stack size or 2 gigabytes,
+  whichever is smaller.
+
+* When a new thread is created by a thread which has GCS enabled then a
+  new Guarded Control Stack will be allocated for the new thread with
+  half the size of the standard stack.
+
+* When a stack is allocated by enabling GCS or during thread creation then
+  the top 8 bytes of the stack will be initialised to 0 and GCSPR_EL0 will
+  be set to point to the address of this 0 value, this can be used to
+  detect the top of the stack.
+
+* Additional Guarded Control Stacks can be allocated using the
+  map_shadow_stack() system call.
+
+* Stacks allocated using map_shadow_stack() can optionally have an end of
+  stack marker and cap placed at the top of the stack.  If the flag
+  SHADOW_STACK_SET_TOKEN is specified a cap will be placed on the stack,
+  if SHADOW_STACK_SET_MARKER is not specified the cap will be the top 8
+  bytes of the stack and if it is specified then the cap will be the next
+  8 bytes.  While specifying just SHADOW_STACK_SET_MARKER by itself is
+  valid since the marker is all bits 0 it has no observable effect.
+
+* Stacks allocated using map_shadow_stack() must have a size which is a
+  multiple of 8 bytes larger than 8 bytes and must be 8 bytes aligned.
+
+* An address can be specified to map_shadow_stack(), if one is provided then
+  it must be aligned to a page boundary.
+
+* When a thread is freed the Guarded Control Stack initially allocated for
+  that thread will be freed.  Note carefully that if the stack has been
+  switched this may not be the stack currently in use by the thread.
+
+
+4.  Signal handling
+--------------------
+
+* A new signal frame record gcs_context encodes the current GCS mode and
+  pointer for the interrupted context on signal delivery.  This will always
+  be present on systems that support GCS.
+
+* The record contains a flag field which reports the current GCS configuration
+  for the interrupted context as PR_GET_SHADOW_STACK_STATUS would.
+
+* The signal handler is run with the same GCS configuration as the interrupted
+  context.
+
+* When GCS is enabled for the interrupted thread a signal handling specific
+  GCS cap token will be written to the GCS, this is an architectural GCS cap
+  with the token type (bits 0..11) all clear.  The GCSPR_EL0 reported in the
+  signal frame will point to this cap token.
+
+* The signal handler will use the same GCS as the interrupted context.
+
+* When GCS is enabled on signal entry a frame with the address of the signal
+  return handler will be pushed onto the GCS, allowing return from the signal
+  handler via RET as normal.  This will not be reported in the gcs_context in
+  the signal frame.
+
+
+5.  Signal return
+-----------------
+
+When returning from a signal handler:
+
+* If there is a gcs_context record in the signal frame then the GCS flags
+  and GCSPR_EL0 will be restored from that context prior to further
+  validation.
+
+* If there is no gcs_context record in the signal frame then the GCS
+  configuration will be unchanged.
+
+* If GCS is enabled on return from a signal handler then GCSPR_EL0 must
+  point to a valid GCS signal cap record, this will be popped from the
+  GCS prior to signal return.
+
+* If the GCS configuration is locked when returning from a signal then any
+  attempt to change the GCS configuration will be treated as an error.  This
+  is true even if GCS was not enabled prior to signal entry.
+
+* GCS may be disabled via signal return but any attempt to enable GCS via
+  signal return will be rejected.
+
+
+6.  ptrace extensions
+---------------------
+
+* A new regset NT_ARM_GCS is defined for use with PTRACE_GETREGSET and
+  PTRACE_SETREGSET.
+
+* Due to the complexity surrounding allocation and deallocation of stacks and
+  lack of practical application it is not possible to enable GCS via ptrace.
+  GCS may be disabled via the ptrace interface.
+
+* Other GCS modes may be configured via ptrace.
+
+* Configuration via ptrace ignores locking of GCS mode bits.
+
+
+7.  ELF coredump extensions
+---------------------------
+
+* NT_ARM_GCS notes will be added to each coredump for each thread of the
+  dumped process.  The contents will be equivalent to the data that would
+  have been read if a PTRACE_GETREGSET of the corresponding type were
+  executed for each thread when the coredump was generated.
+
+
+
+8.  /proc extensions
+--------------------
+
+* Guarded Control Stack pages will include "ss" in their VmFlags in
+  /proc/<pid>/smaps.
diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
index 78544de0a8a9..056f6a739d25 100644
--- a/Documentation/arch/arm64/index.rst
+++ b/Documentation/arch/arm64/index.rst
@@ -15,6 +15,7 @@ ARM64 Architecture
     cpu-feature-registers
     cpu-hotplug
     elf_hwcaps
+    gcs
     hugetlbpage
     kdump
     legacy_instructions

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
