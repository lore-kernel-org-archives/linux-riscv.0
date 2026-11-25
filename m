Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642A9606A6B6
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eFfE2drZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvKoL5qI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3GCYsEMLUS1SVNEn2TjNXlg9/KBSnuPFtpUrYSdEt6c=; b=eFfE2drZcOmEy1fzofi9azA6dZ
	BKwTlJ//e26ZOO49uEbMJzF+ITTb1ptYGCV9Ab2SRUMxMm3c0w8K9F8pUxOxTTAV81lPpLRVHdCUq
	UX48XxpSqF8RhiCvDChHbF6B3nnt6kcB07QVUroj7j0ps6vw87/JZfDBGknHT62++GyjZu/VQ2Ftt
	BBRS6l820Irw8QGcWvSgthbM/Cf8xKIIlCCn6n2N1vOVbqcdY4syKJ/5vjHVOSQHZLrllR+KoOYjs
	TQImbefGa7v74DTbbbOJW6LZU0UXfXg3FoP7QTkma9xXjPaT7366Br0xSc/6ZOGTDmZmNCVSIvqzv
	XxblLqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW74z-00000008n2k-1NXM;
	Wed, 25 Nov 2026 07:06:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW74x-00000008n0W-0uG2;
	Wed, 25 Nov 2026 07:06:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A58616226F;
	Wed, 25 Nov 2026 07:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3591F00ACF;
	Wed, 25 Nov 2026 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590366;
	bh=hyUGVDmprxQhAj50WjzUk1/vaaBy//3iaYrzXIMA2eA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=YvKoL5qIpzrIqVi7SNh+5Muu2JJaxW1V9tBNRWWqZ+I8zV3a4XkLT0APhVQMuzBC7
	 JHOmVjUtZeiGIuu5ektu1FulpCUXEf8IfpQoN2m4eUuI0JVKjHalBp7/CIxGzLzFsy
	 D46UXprCgwAbAB018ecPrxILDJBi+k1/Xmp0yBXLaOf5xTRwG2BDx1DWs8f9XR44CT
	 QMuNBRSsFiNcNr9Fibud2FK6wGSHzp/eg/0iLkGpOMewZX5u0IocDHL4FMK0Aqilql
	 VWLgBU/m0lwdvo+h4mDIdYtGNGyDN4dlaBAfrwmIfZ8AVUjtu3fqqEeb2U+uwzpYCz
	 QgWWeupD1rSUQ==
Content-Type: multipart/mixed; boundary="===============5092901143825754910=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <3bd046e1156b06c06b0a3c90eddace99d419b20b620d8980538ce47b314272a9@mail.kernel.org>
In-Reply-To: <20261125061523.1540234-19-irogers@google.com>
References: <20261125061523.1540234-19-irogers@google.com>
Subject: Re: [RFC PATCH v2 18/30] riscv: Add DWARF CFI annotations to entry, ftrace, rethook, and BPF JIT
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,llvm@lists.linux.dev,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yongho
 ng.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 25 Nov 2026 07:06:01 +0000 (UTC)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5092901143825754910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> riscv: Add DWARF CFI annotations to entry, ftrace, rethook, and BPF JIT

TL;DR: Commit message only: it says the return_to_handler() rewrite in riscv
mcount.S is under CONFIG_UNWINDER_DWARF_CFI, but part of it is unconditional.
The code looks functionally correct.

> riscv: Add DWARF CFI annotations to entry, ftrace, rethook, and BPF JIT
>
> Prepare RISC-V assembly, probe trampolines, and RV64 BPF JIT prologues
> for runtime Minimal DWARF CFI kernel unwinding:
>  - Export end labels for ret_from_fork_user_asm, call_on_irq_stack, and
>    ftrace_caller save/restore boundaries, and save s0 in ftrace_caller
>    under CONFIG_UNWINDER_DWARF_CFI.
>  - Annotate return_to_handler() and arch_rethook_trampoline() with
>    .cfi_* directives and key rethook shadow stacks on entry SP (CFA)
>    under CONFIG_UNWINDER_DWARF_CFI.
>  - Save RV_REG_RA unconditionally in RV64 BPF JIT prologues under
>    CONFIG_UNWINDER_DWARF_CFI so leaf BPF programs unwind into frameless C
>    callers.
>
> Signed-off-by: Ian Rogers <irogers@google.com>

The commit message describes the return_to_handler() changes as being
under CONFIG_UNWINDER_DWARF_CFI, but part of that rewrite is not config
gated:

arch/riscv/kernel/mcount.S:
 	call	ftrace_return_to_handler
-	mv	a2, a0
+	mv	ra, a0
 ...
-	jalr	a2
+	ret

and RESTORE_RET_ABI_STATE no longer does:

-	REG_L	ra, FREGS_RA(sp)

This applies to every riscv kernel with CONFIG_FUNCTION_GRAPH_TRACER,
including builds that never enable the new unwinder.  On return, ra now
holds the real return address instead of a value inside return_to_handler,
a2 is no longer written, and ret replaces an indirect jalr.

The new sequence looks functionally correct, but should the commit message
say that this part is unconditional and explain why it is needed (the
.cfi_same_value ra over the final instructions), so riscv and ftrace
maintainers can review it as such?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45561209846
--===============5092901143825754910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5092901143825754910==--

