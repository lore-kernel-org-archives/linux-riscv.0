Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9711606A6AE
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WfdHBsEn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iGrkgCi5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QHJme94EgEYM5CReEm1s9qVv9+Jf6J6OyxriO339yXs=; b=WfdHBsEnIGoD7lOASTgVznJSbR
	/3O4WoFqgdSvwX5vxdEqRISlU5OnBv7xi/yK07h3WdIZmM6FWicUtah3iYb2kmSK3Vy9lLjKkq7Wq
	Wlxrkaimpf0MZ3gf2VUCtuWLP6BCk0tnVfur+cHpVArQgO+LYtsT7arRzONQjiGurXgnmAz9AjJff
	pNQqqed5VE3+B1dqn31GvINxZLh3X1v3hzK/3gLLSIxXLv6Ml2+WsUJB8DOUYOtiM/AW14/WRIc7f
	Nebpvg7JVghbWh+iGPQXyIhFmqHrMfSej8AfC38XRLEGmp6AalT9XlUJw45yyL7tUFzuMG8RCDudM
	3bm0aM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW75h-00000008nmY-0HD2;
	Wed, 25 Nov 2026 07:06:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW75U-00000008nVF-44t5;
	Wed, 25 Nov 2026 07:06:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B3C3B40A41;
	Wed, 25 Nov 2026 07:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078671F008B2;
	Wed, 25 Nov 2026 07:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590400;
	bh=HKNn4jNazmFqiSV3L8j2VorjtfabCulT82MAwWRHOlA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=iGrkgCi5dJbcikKJbxNIr/uSG60Ar4OQjXwvqpPYppMItQaNQ67d0WrZnyxJ1aliN
	 L6mzl2LicNyjT6M4ODiXcVfV7e1A7Rf+uwMfJhmuCsV/GL7xA/ADnkCBdjjTUoRIgV
	 6wSEIDhTK1qikHmTfSHUh6eNoBSpiPdRVJkrqtggmsrWdOHQwNqvr6VNZuwu0M5ilI
	 1oZGXqKFjZaZtZs/xjgnBrgbmyenwI86XP0+HYBIrN4LxavF6YSCNEOlnGgBhKixNJ
	 uuBiPVNYMAtyXnk3iWQLXyckixoj3l28f0NZ8sRgwhbS+q8UBFA6l/3vH9M9TJZ/YF
	 /UZUsRliiaJhQ==
Content-Type: multipart/mixed; boundary="===============8283234434561668137=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <90cc5dff45dcf69975704a288d8b264113adff52b3d7d70a3ba6727e192b1d7b@mail.kernel.org>
In-Reply-To: <20261125061523.1540234-13-irogers@google.com>
References: <20261125061523.1540234-13-irogers@google.com>
Subject: Re: [RFC PATCH v2 12/30] x86/unwind: Add Minimal DWARF CFI kernel unwinder
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,llvm@lists.linux.dev,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yongho
 ng.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 25 Nov 2026 07:06:35 +0000 (UTC)
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

--===============8283234434561668137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> x86/unwind: Add Minimal DWARF CFI kernel unwinder

TL;DR: Nits only in the DWARF CFI unwinder: unwind_module_init() is reused
with NULL/0 placeholders, where a dedicated init hook may be cleaner, and the
get_scratch_reg() prev_regs fallback looks unreachable.

> diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
> --- a/arch/x86/kernel/module.c
> +++ b/arch/x86/kernel/module.c

[ ... ]

> @@ -299,14 +301,19 @@ int module_finalize(const Elf_Ehdr *hdr,
> -	if (orc && orc_ip)
> +	if (IS_ENABLED(CONFIG_UNWINDER_ORC) && orc && orc_ip)
>  		unwind_module_init(me, (void *)orc_ip->sh_addr, orc_ip->sh_size,
>  				   (void *)orc->sh_addr, orc->sh_size);
> +	if (IS_ENABLED(CONFIG_UNWINDER_DWARF_CFI) && eh_frame &&
> +	    (eh_frame->sh_flags & SHF_ALLOC) && eh_frame->sh_addr)
> +		unwind_module_init(me, /*orc_ip=*/NULL, /*orc_ip_size=*/0,
> +				   (void *)eh_frame->sh_addr, eh_frame->sh_size);

this isn't a bug, but the DWARF path reuses the ORC prototype of
unwind_module_init(), so it passes NULL/0 placeholders for orc_ip and
orc_ip_size and hands .eh_frame in through the parameters named orc and
orc_size.

The two branches are already separate IS_ENABLED() tests, so the shared
prototype doesn't save anything at the call site.

Could the DWARF path get its own init hook, for example one taking (mod,
eh_frame, eh_frame_size), alongside the new unwind_module_cleanup()?

[ ... ]

> diff --git a/arch/x86/kernel/unwind_dwarf.c b/arch/x86/kernel/unwind_dwarf.c
> --- /dev/null
> +++ b/arch/x86/kernel/unwind_dwarf.c

[ ... ]

> +static bool get_scratch_reg(struct unwind_state *state, u8 dwarf_reg,
> +			    unsigned long *val)
> +{
> +	struct pt_regs *regs = state->full_regs ? state->regs : state->prev_regs;

this isn't a bug, but is the state->prev_regs fallback in get_scratch_reg()
reachable?

Nothing in unwind_dwarf.c sets prev_regs to anything other than NULL
(__unwind_start() memsets the state, and unwind_next_frame() only stores
NULL into it), and full_regs is only set where state->regs is also set.

Could this use state->full_regs ? state->regs : NULL and drop the
prev_regs = NULL stores in unwind_next_frame()?  The kernel-doc also says
the register is recovered "from full pt_regs", which doesn't match the
prev_regs fallback.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45561209846
--===============8283234434561668137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8283234434561668137==--

