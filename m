Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFB8606A6A3
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 00:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ntRBdvxe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsuO784/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JiCgwtgqOtM+UQhA4K9FvdthIzi+d6runNEFrdLlzxI=; b=ntRBdvxexSEcumd/7XwHIWZpab
	uzPRBcZ1IvY6G1Cqq8wIzgf/uJX9pJpJ/jpa9VpO3fWVyQgEZhSxLnUUBM6cYpxUDx4GYk6y6VPXJ
	s9g1O2D6ZZYTh0kNfaZuuCI+t03pgaPjbPMDRtpij1jHwXfIZV58WGBE+herPEhaNmM8ThfKJiP6j
	MKBvXLP6HJLSOGuNGBFWll/TEkBxOnUsNjbhlxmWwRkwETg7AgqWNzVygRytcL1/chA5KXTtoL1h8
	3c4pWhgGh+AX7Ap0wAmhis+pCuyeSmjjlbEx+7ZdPdp3OYdKbX8ye9piYgQ5FKHDJATbJZPblSmba
	s6A6E+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI6O-00000001zOH-29hv;
	Mon, 23 Nov 2026 00:40:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI6M-00000001zM1-3WzF;
	Mon, 23 Nov 2026 00:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D1D361B18;
	Mon, 23 Nov 2026 00:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCE51F00A3E;
	Mon, 23 Nov 2026 00:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795394409;
	bh=rn7IabGaHoTbWx9JVW48ctmfx16V/sOjILaI4aPpBiM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=KsuO784/EseuAdUgosN37IvTJsBoS2oje4fAhdhuJ+ihYBo9wHt9Ng+f5FTnBvsWd
	 MIG8AKvKK7zaGggxVDASK5N8fPhW3FqVdorblh9nQLx+7GtaNxYdkTv2/HymiZnygY
	 mCcTs/USerzy8JmAjkuVVd3rpSKCLzwCG7k/xcWX211LqF0IpegCH1CPxVweXkBVlS
	 82HFJZ2Ld0CWBQzYUetPJKtWulsBTTDtSiumdD3+uTkf5wtElrgoErM2pIvtiy4gPM
	 BXntW1SNy+j6z/E82xdUcSeB25UDxWv9Ipp1Xjq0hyBzAFrrfXPQTz25ffFQE+K0FT
	 JDC01iYuGfH/A==
Content-Type: multipart/mixed; boundary="===============7444458104267244636=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <ae9f6920367468ad5848713b80ca3ef4f69737410a76794809e4071d15c3c23f@mail.kernel.org>
In-Reply-To: <20261122235757.3456048-2-irogers@google.com>
References: <20261122235757.3456048-2-irogers@google.com>
Subject: Re: [RFC PATCH v1 01/11] unwind: Add Minimal DWARF CFI bytecode interpreter and KUnit tests
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mas
 on@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 23 Nov 2026 00:40:05 +0000 (UTC)
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

--===============7444458104267244636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> unwind: Add Minimal DWARF CFI bytecode interpreter and KUnit tests

TL;DR:
- Disabling KMSAN for dwarf_cfi.o may cause false uninit-value reports on
  returned rows
- Commit message and header misdescribe indirect-encoding rejection
- Kernel-doc claims test use of module indexing helpers that tests never call

> diff --git a/kernel/unwind/Makefile b/kernel/unwind/Makefile
> --- a/kernel/unwind/Makefile
> +++ b/kernel/unwind/Makefile
> @@ -1 +1,12 @@
> +ifdef CONFIG_FUNCTION_TRACER
> +CFLAGS_REMOVE_dwarf_cfi.o = $(CC_FLAGS_FTRACE)
> +endif
> +KASAN_SANITIZE_dwarf_cfi.o := n
> +KCSAN_SANITIZE_dwarf_cfi.o := n
> +UBSAN_SANITIZE_dwarf_cfi.o := n
> +KMSAN_SANITIZE_dwarf_cfi.o := n
> +KCOV_INSTRUMENT_dwarf_cfi.o := n

Can KMSAN_SANITIZE_dwarf_cfi.o := n cause false uninit-value reports?

Every public entry point in dwarf_cfi.c returns its result by storing into
a struct dwarf_cfi_row supplied by the caller:

    dwarf_cfi_eval_fde_streams():
        *out_row = row;

Without KMSAN instrumentation these stores do not update the shadow, while
the callers are instrumented and keep the row on their stack, where KMSAN
has poisoned it on function entry.  The caller would then see row as
uninitialized as soon as it branches on a field, for example in the later
user unwinder:

    unwind_user_next_cfi():
        struct dwarf_cfi_row row;
        ...
        err = dwarf_cfi_unwind_user_eh_frame_hdr(hdr_uaddr, hdr_size,
                                                 lookup_ip, &arch, &row);
        ...
        if (row.ra_rule == DWARF_CFI_RULE_UNDEFINED) {

The same applies to the KUnit tests in this patch, which read row.cfa_base
and other fields after dwarf_cfi_eval_fde_kmem(), and to the x86 kernel
unwinder added later in the series.

Documentation/dev-tools/kmsan.rst warns that disabling instrumentation
produces wrong shadow and false positives, and other code that returns
data from uninstrumented code calls kmsan_unpoison_memory() on the output.
dwarf_cfi.c only reads .eh_frame data and memory obtained through
copy_from_user(), which unpoisons its destination, so would
KMSAN_ENABLE_CHECKS_dwarf_cfi.o := n (or no KMSAN switch at all) be enough
here while keeping shadow propagation for out_row?

[ ... ]

> diff --git a/kernel/unwind/dwarf_cfi.c b/kernel/unwind/dwarf_cfi.c
> --- /dev/null
> +++ b/kernel/unwind/dwarf_cfi.c

[ ... ]

> +			case 'P':
> +				/* Personality encoding + pointer; skipped without deref */
> +				err = cfi_read_u8(s, &enc);
> +				if (err)
> +					return err;
> +				psize = cfi_encoded_ptr_size(enc & ~DW_EH_PE_indirect,
> +							     arch->ws);

This isn't a bug, but the commit message says:

> DW_EH_PE_indirect pointer encodings are unconditionally rejected with
> -EINVAL.

and the file header comment says "expressions and indirect pointer
encodings are rejected".

dwarf_cfi_parse_cie() masks DW_EH_PE_indirect off the 'P' personality
encoding and accepts it, and the 'L' LSDA encoding byte is accepted
whatever its value.  Only the 'R' FDE encoding and cfi_read_encoded_ptr()
reject DW_EH_PE_indirect.

Skipping the personality pointer without dereferencing it looks correct,
and the function's own kernel-doc describes that accurately.  Could the
commit message and the file header say that indirect encodings are
rejected for pointers that are decoded (FDE initial_location/range and
.eh_frame_hdr fields), and that personality/LSDA pointers are skipped
without being dereferenced?

[ ... ]

> + * @out_count: Output number of valid FDEs discovered in [@eh_start, +@eh_size).
> + *
> + * Used at module load time (and in tests) to construct a binary-search FDE
> + * lookup table when the linker has not emitted a separate .eh_frame_hdr.

This isn't a bug, but the kernel-doc says dwarf_cfi_scan_eh_frame_kmem() is
used "in tests".  kernel/unwind/dwarf_cfi_kunit.c never references
dwarf_cfi_scan_eh_frame_kmem(), dwarf_cfi_mod_alloc(),
dwarf_cfi_mod_eval() or dwarf_cfi_unwind_user_eh_frame_hdr(), and the only
caller of dwarf_cfi_scan_eh_frame_kmem() is dwarf_cfi_mod_alloc().

Should the comment drop "(and in tests)", or should a test be added that
indexes a small .eh_frame blob through dwarf_cfi_mod_alloc() and
dwarf_cfi_mod_eval()?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45087188604
--===============7444458104267244636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7444458104267244636==--

