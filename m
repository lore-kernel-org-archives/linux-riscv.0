Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC90606A6AE
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GeIeBwup;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvnhU81u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1ZfNXwNz33ErA7ofs8bn4iAeiO+x4V9DrNSWRYUchvc=; b=GeIeBwupEDb55E2AlKvQWF6BxC
	qefixj0jK54YDqCdQwhDz+uxFGpxYvNm03SLxQ7MuZVVLxEYGrtEr2+gLMzROEvigCWIGhW0ErlXT
	+KRWDSZeE97HUhEK1I2LP/7ZODwdycAe9oPb+w+cSHQ/VeOef11ukiR7OjJ4ka4vL68bG4uMsU1ZI
	FZkEKXz9Be+vLvhCiW7K7x5yu/y3VK2KCxgvX0THRs6nTuxZCjfTldzuhT/UK8eVaY+JrXLsZbtiu
	NOGD4CM85SlZLQ49h8/A6DTHdrLkdy1vJSODQNbRmGrazPeW4dR9GkVQ75tfnWY/X7ROdodEFxmvu
	QaZUj3HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW75i-00000008npc-3ZvS;
	Wed, 25 Nov 2026 07:06:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW75c-00000008ngV-1HOu;
	Wed, 25 Nov 2026 07:06:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B9586620F3;
	Wed, 25 Nov 2026 07:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3E01F01565;
	Wed, 25 Nov 2026 07:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590407;
	bh=n3MLBtiYeIpiEnkA99VPmmYVKGU+MSxkyWa6TupOZME=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=mvnhU81ukFk5RPexZr6HPjyrO1NfEQODZo2ujvLPl5ecmACid33CViEQj0CTeM3A6
	 G7xz5xJ3DxrsPpb/57zI4thfMa3tDOJS+8LVmhNci+avMsmh2ATVH+bdbBUhMZxcuU
	 yNUzBMz0DyDAUR0Thk0LBJUgwRAqzg85tg8eLRoYvyUUM9PcTpmVvtAZ2eZXO0nZNE
	 b3IM9zN4uBaGh1t9SQ2cN660rMzMBVr/I5/FVsI+a1nxl09rKrPZ7cgTtvvotfMNE9
	 TQMsxHAgK9a/kJVpCqfFoazhonhLnVPDfP8yk3o+6Slox6XWt8NgIVePklvnM23Gt8
	 rROh2bXY1AMQQ==
Content-Type: multipart/mixed; boundary="===============2007885903183298956=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <b0d84d31f548d5426a26b626146b21ffacaeae455c7dac4353fe4955536a3c2c@mail.kernel.org>
In-Reply-To: <20261125061523.1540234-20-irogers@google.com>
References: <20261125061523.1540234-20-irogers@google.com>
Subject: Re: [RFC PATCH v2 19/30] riscv/unwind: Add Minimal DWARF CFI kernel unwinder
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,llvm@lists.linux.dev,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yongho
 ng.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 25 Nov 2026 07:06:42 +0000 (UTC)
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

--===============2007885903183298956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> riscv/unwind: Add Minimal DWARF CFI kernel unwinder

TL;DR: Without KEEP(), GNU ld --gc-sections (LD_DEAD_CODE_DATA_ELIMINATION)
may discard the core kernel .eh_frame in vmlinux.lds.S, so the DWARF CFI
unwinder would fail silently for every kernel PC and degrade stack traces.

> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S

[ ... ]

> @@ -125,6 +125,19 @@ SECTIONS
>  		*(.srodata*)
>  	}
>  
> +#ifdef CONFIG_UNWINDER_DWARF_CFI
> +	.eh_frame_hdr : ALIGN(4) {
> +		__start_eh_frame_hdr = .;
> +		*(.eh_frame_hdr)
> +		__stop_eh_frame_hdr = .;
> +	}
> +	.eh_frame : ALIGN(8) {
> +		__start_eh_frame = .;
> +		*(.eh_frame)
> +		__stop_eh_frame = .;
> +	}
> +#endif

Can the core kernel .eh_frame be discarded here when linking with GNU ld
and CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y?

riscv selects HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD, and the
top-level Makefile then adds --gc-sections to LDFLAGS_vmlinux.
UNWINDER_DWARF_CFI in arch/riscv/Kconfig.debug does not exclude that
option.

Nothing references the .eh_frame input sections, and the
__start_eh_frame/__stop_eh_frame assignments do not keep them alive, so
without KEEP() the garbage collector would be free to drop them.

If that happens, .eh_frame_hdr would have no FDE table and
dwarf_cfi_unwind_eh_frame_hdr() would return -EINVAL for every core
kernel PC.  Oops, WARN and perf/BPF callchains would then shrink to the
heuristic fallbacks, and arch_stack_walk_reliable() would always return
-EINVAL, with no build or runtime warning.

The other sections in this file that nothing references use KEEP, for
example .alternative and __soc_early_init_table, and the riscv vDSO
script uses:

    .eh_frame : { KEEP (*(.eh_frame)) }

Should this be KEEP(*(.eh_frame)), or should UNWINDER_DWARF_CFI depend
on !LD_DEAD_CODE_DATA_ELIMINATION?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45561209846
--===============2007885903183298956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2007885903183298956==--

