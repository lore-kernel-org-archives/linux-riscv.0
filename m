Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D73C606A31D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 00:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RtcMd1vl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eXu0A6R7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zrAcfpb5SNFo0n8ll6fwPeZ4dHMGHNmiiuoP0hjg28A=; b=RtcMd1vlrXFTrxtMn6w6OQHP0P
	HCavhwaHqJjUW2J6ALXUnuKJp+29tZT2/LeV0B9A3mGha8v7B6sluhHHxo441FVU2+z9Ner/4Yuj0
	cRvdJOGsibDrswivc7p8bBkdlOEgUNxXSvKzu/LtEeONO+iF7PBzOr0HLVczTEGtrpb0v372mcNA1
	+7kZR2EgcHwblFXQZBnBldDzaPYiAR/WYV8Mh+kzgR3rt+NmwTTD+pFNoSKQ0OT8jE4mtSDdJEPwT
	5e8ZYgtpdtMpLiIyCywYmevOwHneKhgY8tvH5r2OaODGO5EQF51QbjIgVUjHjhCTXDiuzxkp0BB62
	iCsrgaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI6C-00000001zFU-2Adx;
	Mon, 23 Nov 2026 00:40:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI69-00000001zDM-2kOJ;
	Mon, 23 Nov 2026 00:39:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8D646190B;
	Mon, 23 Nov 2026 00:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3BC1F000D2;
	Mon, 23 Nov 2026 00:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795394396;
	bh=RBkBbIxvUmPmgmAeGozZ8G7ZaO5s7Km5XwtalhsB76o=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=eXu0A6R7U8nEAgmnsi8Y0tj8BMRDUB1+PEdIGFnwvjv3mR01lUYV9YvKMRDdZ7WiE
	 UZG+jBntGeisIyQAPF4vmTjbCCVwg8jGzg3gN/FlRcDj3mjgWB+M/KmaH2+WwNjB5P
	 O7Th3YIFc6kMbAvJo0vR45fZMnjvy+7mxYUbJdILLE/wHdXUllhUSFmg7j2lC25fvO
	 9MB61LTBaHLGmCaQpl4iyTflI02VizOQp3rHqkr4YbN9bCsXN8OlHlG3gRBR/1OdEG
	 VpPqjlqwYyaB8wFaSDkmC7qyvc3XWWf0L10+Puu9z1m1wJY/HoNmJ+Ij0KkGaUvjQ1
	 fqAhVXfe/i7nA==
Content-Type: multipart/mixed; boundary="===============8106485338973967917=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <d8fcb9b5b9334c3c37dbab4a5cb139a3a651b371378953b9573fba8667db547b@mail.kernel.org>
In-Reply-To: <20261122235757.3456048-12-irogers@google.com>
References: <20261122235757.3456048-12-irogers@google.com>
Subject: Re: [RFC PATCH v1 11/11] scripts: Add eh_frame_min.py .eh_frame coverage and size analyzer
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mas
 on@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 23 Nov 2026 00:39:51 +0000 (UTC)
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

--===============8106485338973967917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> scripts: Add eh_frame_min.py .eh_frame coverage and size analyzer

TL;DR:
- eh_frame_min.py may abort with a traceback on a valid truncated-looking CFA
  expression, skipping later files
- i386 DRAP registers look wrong, skewing coverage
- combined savings figure for .o/.ko compares unlike sizes
- dead variable and stale comment (nits)

> diff --git a/scripts/eh_frame_min.py b/scripts/eh_frame_min.py
> new file mode 100755
> --- /dev/null
> +++ b/scripts/eh_frame_min.py

[ ... ]

> +# DWARF register numbers per ELF e_machine (drap = transient stack-realign scratch regs)
> +ARCH_REGS = {
> +    62: {"name": "x86_64", "sp": 7, "fp": 6, "ra": 16, "drap": {1, 2, 5, 10, 13}},  # EM_X86_64
> +    3:  {"name": "i386",   "sp": 4, "fp": 5, "ra": 8,  "drap": {1, 2}},              # EM_386

In i386 DWARF numbering 1 is %ecx and 2 is %edx.  GCC's i386 DRAP register
is %ecx, or %edi (DWARF 7) when the function emits tail calls, needs a
static chain, or uses regparm 3 as the i386 kernel does.  %edx is never the
DRAP register.  The set {1, 2} looks like the x86_64 numbers reused without
renumbering.

When a stack-realigning function uses %edi as DRAP, the script sees
"DW_CFA_def_cfa: r7 ofs 0", records "def_cfa non-SP/FP reg=7" and counts
the FDE as unsupported, and --minify leaves it out.  The same prologue
using %ecx is counted as supported.

The kernel interpreter (cfi_set_cfa_reg() in kernel/unwind/dwarf_cfi.c) and
scripts/min_eh_frame.c accept either register, so the reported coverage for
i386 inputs differs from what the minifier would keep.  Should the i386
entry be {1, 7}?

[ ... ]

> +    has_indirect = False

This isn't a bug, but parse_cie() sets has_indirect to True in the 'L', 'P'
and 'R' augmentation branches and nothing ever reads it.  The returned dict
derives the flag the caller uses independently:

    "has_indirect_fde": bool(fde_enc & DW_EH_PE_indirect),

Could the variable and its assignments be removed?  The "offset", "version",
"aug" and "lsda_enc" entries of the same dict also appear to have no
consumer in analyze_elf() or decode_and_minify_insns().

[ ... ]

> +    # Stream of abstract events: ("adv", delta_units) or ("op", raw_bytes, new_row_snapshot)

Is the comment accurate?  emit_op() appends only 2-tuples:

    events.append(("op", raw_bytes))

and the rest of decode_and_minify_insns() relies on that form, for example
the "for kind, payload in events:" loop and the restore_state elision that
compares against ("op", bytes([DW_CFA_remember_state])).  Row snapshots are
kept in state_stack.  Should the comment describe ("op", raw_bytes)?

[ ... ]

> +        elif op == DW_CFA_def_cfa_expression:
> +            expr_len, pos = read_uleb128(insns, pos, end)
> +            expr = insns[pos : pos + expr_len]
> +            pos += expr_len
> +            # Fixed DRAP / sigframe pattern: DW_OP_breg(FP|SP) <sleb128>, DW_OP_deref
> +            if (len(expr) >= 3 and expr[-1] == 0x06 and
> +                expr[0] in (0x70 + fp_reg, 0x70 + sp_reg)):
> +                soff, epos = read_sleb128(expr, 1, len(expr) - 1)

Can this read_sleb128() call raise an uncaught ValueError?  It raises
"Truncated SLEB128" when no terminating byte appears before the end.  A
valid expression whose SLEB128 operand ends in 0x06 with no DW_OP_deref
after it hits this, for example on x86_64:

    DW_CFA_def_cfa_expression 3: DW_OP_breg7 0x80 0x06

Here expr[0] == 0x70 + sp_reg and expr[-1] == 0x06, so the guard passes and
read_sleb128(expr, 1, 2) reads 0x80 with the continuation bit set and runs
off the end.

Nothing catches the exception in decode_and_minify_insns(), analyze_elf() or
main(), so the script aborts with a traceback, later files on the command
line are not analyzed, and --minify writes no output.

The kernel parser treats the same bytes as an unsupported FDE
(cfi_parse_indirect_cfa_expr() returns -EINVAL), and scripts/min_eh_frame.c
does likewise.  Should the analyzer append the opcode name to reasons and
mark the FDE unsupported instead?  The script is aimed at arbitrary
user-space binaries and shared libraries, so the input is not controlled.

[ ... ]

> +    min_eh_hdr_size = 12 + supported_fdes * 8
[ ... ]
> +    orig_total = eh_size + eh_hdr_size
> +    min_total = len(min_eh_stream) + min_eh_hdr_size
> +    savings_pct = (100.0 * (1.0 - len(min_eh_stream) / eh_size)) if eh_size else 0.0
> +    total_savings_pct = (100.0 * (1.0 - min_total / orig_total)) if orig_total else 0.0
[ ... ]
> +    print(f"  Minified + .eh_frame_hdr: {min_total:10,d} B  (-{total_savings_pct:.1f}% combined)")

Is the combined figure comparing like with like?  The minified side adds a
simulated .eh_frame_hdr of 12 + 8 bytes per supported FDE, while the
original side uses the input's real .eh_frame_hdr.  Relocatable inputs (.o
and .ko, as in the commit message examples) have no .eh_frame_hdr, so
eh_hdr_size is 0 and only the minified side is charged for the lookup table.

Since minification barely shrinks .eh_frame, total_savings_pct comes out
around -20% for every object or module.

The sign also looks wrong, because the format string prints a literal '-'
before the value, so a negative percentage renders as something like
"(--24.0% combined)".

Could the original side simulate 12 + 8 * total_fdes when the input has no
.eh_frame_hdr, or could the simulated header be skipped when eh_hdr_size is
0, with the sign taken from the value?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45087188604
--===============8106485338973967917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8106485338973967917==--

