Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA85D606A327
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 06:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TmW+6N6x;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RGD2OyfZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y/Dwc3+NBmSVYvdvmzl3J13xJXjZemDFzrw4+AT4Y/Y=; b=TmW+6N6xNxDFWjVx1qGpa3KYro
	k3eDD+/JXQymX+asNgPT4eZqx2glmAqKGIu17qGWBcA9fu48Bbfh7r5DOejIIEIG5ISiFOeVg4kjL
	Sq+X+S09yhXsxPtwJf6Gpo+IP670IOPp9k/jPBAu67xWbz5RGxT8mgOc2z2+ca776upXIK0dV9IUA
	P1VG3mVZpmoBXm4GEdyrsXDonPrKKpqMy3T2/isdLjptQrDjCAaLWFyfugBIse8PQmKv4VyU28v4j
	yZ9LASlfEn/tlUBzfDt6b7XKVvFG77d/M5kDI2lAKYjPNLxYEzww9pJP44bwHLbXu5sC028su4qOD
	4/PU/0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6nW-00000008kBH-37o9;
	Wed, 25 Nov 2026 06:48:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6nS-00000008kAf-3SvS;
	Wed, 25 Nov 2026 06:48:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 304BA433D9;
	Wed, 25 Nov 2026 06:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B72A1F000C6;
	Wed, 25 Nov 2026 06:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795589281;
	bh=w/FTXqrH5AIrzUuo8YH2Y9Z6F/zJk24rjcjm0U0HEHw=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=RGD2OyfZOoXrJx6S4zQf9OrP6dpeguJeek9JYgL019ncKwNu3vVCRtpWDD1PVCyjH
	 XGIiho4GvZQoNZDuGevBp+EdPfLyYnYBKxPYhI3VwGdOgdK+bWzvAHSM/CNeK406f7
	 TmzV2LP8jrZy6nkvCbZuAwuWLkM7SYmVX6wmIu5tPdC2MBLMxztD5HB/cEmVBcFq9j
	 QGm0OEgsUIqrWfLnEgHSGubLihKCRqAMN8vwCGfz5tjr+LPwWp0T2a6x/X04cNqxDv
	 UVjUV9xvfT8hCmcg64r+XQoR+0gazgtCATLmvOzMBF+K6Igq+1vn67kLjJGMdMv5X4
	 dj1EETaUgvHPQ==
Content-Type: multipart/mixed; boundary="===============6730931518485205145=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <c5a12d8c446ae04259b5ff4edbcccd0326d5476575d18cdaa5050d57a50b9c51@mail.kernel.org>
In-Reply-To: <20261125061523.1540234-5-irogers@google.com>
References: <20261125061523.1540234-5-irogers@google.com>
Subject: Re: [RFC PATCH v2 04/30] x86: unwind_user: Support Minimal DWARF CFI user unwinding
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,llvm@lists.linux.dev,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yongho
 ng.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 25 Nov 2026 06:47:56 +0000 (UTC)
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6730931518485205145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> x86: unwind_user: Support Minimal DWARF CFI user unwinding

TL;DR: Nit only: unrelated comment additions in this x86 CFI patch aren't in
the changelog; suggests moving them to a separate documentation patch.

> diff --git a/arch/x86/include/asm/unwind_user.h b/arch/x86/include/asm/unwind_user.h
> --- a/arch/x86/include/asm/unwind_user.h
> +++ b/arch/x86/include/asm/unwind_user.h

[ ... ]

> +/**
> + * unwind_user_word_size() - Return the user-space word size in bytes on x86
> + * @regs: User-mode register state.
> + *
> + * Return: 8 for 64-bit user mode, 4 for 32-bit IA-32/compat mode, or 0 for
> + * VM86 mode stacks which cannot be unwound.
> + */
>  static inline int unwind_user_word_size(struct pt_regs *regs)

[ ... ]

> +/* Standard x86 frame record: {saved_bp, ret_addr} at [bp, bp + 2 * ws). */
>  #define ARCH_INIT_USER_FP_FRAME(ws)			\

[ ... ]

> +/* At function entry before push %rbp: return address is at [sp, sp + ws). */
>  #define ARCH_INIT_USER_FP_ENTRY_FRAME(ws)		\

[ ... ]

> +/**
> + * unwind_user_at_function_start() - Check if @regs is at a function entry point
> + * @regs: User-mode register state.
> + *
> + * Return: true if stopped on an entry uprobe before the frame prologue ran.
> + */
>  static inline bool unwind_user_at_function_start(struct pt_regs *regs)

This isn't a bug, but the new comments on unwind_user_word_size(), the
ARCH_INIT_USER_FP_* macros and unwind_user_at_function_start() don't look
related to adding CFI support, and the changelog doesn't mention them.

Would they fit better in a separate documentation patch, so this one only
carries the x86 CFI register mapping and the Kconfig select?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45561209846
--===============6730931518485205145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6730931518485205145==--

