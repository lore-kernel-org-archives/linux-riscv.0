Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4538F606A69B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nuItA0cR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LIxG2thy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hxQTxlqWzvJujuVMV/2qowX0ZmplALpbjxKO1+sPcGU=; b=nuItA0cR4e6DvJsmiFcxVdsA0G
	Hn27XR4eOy9T2TmYssKCxH0j/yGW5pR2jP22jtxQKa/Efjhpt0IWKSe7OJVKisY73N56ucK4+dGOH
	ssvQxT/kwjeyh60Wyno9WjxWHo0q+l3+Dhs3uuNbLX7vLEZDRrzUspJL0VED7wzIF3vR1X8dUeBTF
	7/Cj9MTz2MAVBu0wVyZYyBvWLZ+2/Sq1lxWxWCJDWMskdGpVAuk1xgBTYIbmv3aNJpLri4JmUcGQ+
	hh6fajMb2U8FHsAPjanGW4zqHRftirkJbFsoxgYhFo1nhkUnTb/AqS2uwG9XsrCtcB/LSdZCLVhAH
	oU+IEXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW75a-00000008nec-3VQS;
	Wed, 25 Nov 2026 07:06:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW75N-00000008nOD-3ikg;
	Wed, 25 Nov 2026 07:06:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A19EB407AE;
	Wed, 25 Nov 2026 07:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F044B1F000F2;
	Wed, 25 Nov 2026 07:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590393;
	bh=VTt6zMI2ZGQuNoT+pwSmNZDKDB0qjlMH2g2+jbHu2XY=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=LIxG2thye0IyoCFQLznqiCsfloMK+HyPBWcMhmtvKlkCCTAGM516w86ppow7+t0Wi
	 S8tEgxGpmuywrn3dtFQq2+/sfaxq9M0jtPi62cPTdDfmVUBKNjXdXDSzePHicx2EAl
	 gP9miaHBZYG/gPtS1Urf7+69ATVVqe1mdFnLhGfDodGry/LRKM//nrxgDpwFXGZhAC
	 TCGUFIN1jnDQFwlw7JLPbKVbnG237L4wNmWS251n98BEOeXzDdf+tgFKIzLNkVffY0
	 ZSQpA0DOcxS357Np5CD/2tPYtzD7yEvWKEwxumpPX/fRC8XigC0wdgdWd88omgSqOU
	 BW7CpLaYqd0BA==
Content-Type: multipart/mixed; boundary="===============7460090708809915497=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <81b431617bdfcaad9c3627e79a5bf34391a223ab5ba8135ef4996642e56673e2@mail.kernel.org>
In-Reply-To: <20261125061523.1540234-6-irogers@google.com>
References: <20261125061523.1540234-6-irogers@google.com>
Subject: Re: [RFC PATCH v2 05/30] scripts: Add min_eh_frame build-time .eh_frame minifier
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,llvm@lists.linux.dev,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yongho
 ng.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 25 Nov 2026 07:06:28 +0000 (UTC)
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

--===============7460090708809915497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> scripts: Add min_eh_frame build-time .eh_frame minifier

TL;DR: Nits only, none described as bugs, in scripts/min_eh_frame.c: use a
named enum instead of bare rule numbers (which differ from the kernel's), and
share the duplicated register-rule and cleanup code.

> diff --git a/scripts/min_eh_frame.c b/scripts/min_eh_frame.c
> new file mode 100644
> index 000000000000..55b07b11c635
> --- /dev/null
> +++ b/scripts/min_eh_frame.c

[ ... ]

> +static bool rows_equal(const struct min_row *a, const struct min_row *b)
> +{

[ ... ]

> +	if ((a->fp_rule == 1 || a->fp_rule == 2 || a->fp_rule == 4) &&
> +	    a->fp_off != b->fp_off)
> +		return false;
> +	if ((a->ra_rule == 1 || a->ra_rule == 4) &&
> +	    a->ra_off != b->ra_off)
> +		return false;

This isn't a bug, but would a small local enum for the rule and CFA-kind
codes make rows_equal() and the restore paths easier to check?

struct min_row documents fp_rule as 0=same, 1=cfa_off, 2=fp_off, 3=undef,
4=sp_off, and these bare numbers are tested about 38 times in the file.

The kernel interpreter in include/linux/unwind_dwarf_cfi.h numbers the same
concepts differently (DWARF_CFI_RULE_SP_OFFSET is 3 and
DWARF_CFI_RULE_UNDEFINED is 4), so "fp_rule == 4" means different things on
each side.  Matching the dwarf_cfi_rule numbering would avoid that.

[ ... ]

> +				if (reg == arch->fp_reg) {
> +					row.fp_rule = 1;
> +					row.fp_off = off;
> +				} else if (reg == cie->ra_reg) {
> +					row.ra_rule = 1;
> +					row.ra_off = off;
> +				} else {
> +					row.sp_rule = 1;
> +					row.sp_off = off;
> +				}

This isn't a bug, but could these fp/ra/sp assignment blocks share a small
helper, along the lines of cfi_apply_reg_rule() in kernel/unwind/dwarf_cfi.c?

The same ladder appears in minify_insns() for DW_CFA_offset_extended,
DW_CFA_offset_extended_sf, DW_CFA_GNU_negative_offset_extended,
DW_CFA_undefined and DW_CFA_same_value, differing only in the rule value
and offset.  The restore paths (DW_CFA_restore and DW_CFA_restore_extended)
repeat a similar three-way copy from cie_base, which cfi_restore_reg() covers
on the kernel side.

[ ... ]

> +	free(anchors.data);
> +	free(cies);
> +	free(sorted_relas);
> +	free(out_eh.data);
> +	free(out_relas);
> +	return 0;
> +
> +bail:
> +	/* Leave unusual/hand-crafted .eh_frame untouched rather than failing build */
> +	free(anchors.data);
> +	free(cies);
> +	free(sorted_relas);
> +	free(out_eh.data);
> +	free(out_relas);
> +	return 0;

This isn't a bug, but since the success path and bail: free the same buffers
and both return 0, could the success path fall through to a single cleanup
label, with a ret variable for the -1 case, as minify_insns() does?

process_elf64() has a third copy of the same five frees in the record-length
error path, which returns -1.  The FDE branch also repeats
"free(rmaps); free(min_fde_insns.data); free(fde_rec.data); goto bail;" three
times.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45561209846
--===============7460090708809915497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7460090708809915497==--

