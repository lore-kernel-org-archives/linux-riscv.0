Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A7CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iODxxhSNK9w4AU4JJUnYPma5wDIUZU/QH5nLryt2osc=; b=yQC2wY6pMdB5bF7A9EWiRk/B5g
	KaBw2nH7HApPX0SW4NTHE0lmpF8O5vdcg/jw6V6eIxlaZT05Notq4iY+2Ae/MJ4nU7VgkYM/Pv2U8
	vHEQVuhs/RR1ckOtAnrrdw5ZFY7K7rhL1Aq5BFbiBcYaBhWR8DqNjO2SE6EHVK9rwU/DLbrHIRAbf
	BO83W6pJ86nWwjmDu7cNnQh38QPAdEF4POOfaUOHNnwYX4Dd1IvnVfncxLVSAJ8Z62GWW50OMovSi
	vhHimZ084gF/8zGYIgFcA6ZqeInVvX8QjRQaqM94vAzW/6wor95rCTJisLQ7Yj5h/+iKJu2TzZzgy
	msrpmyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPs3b-007jFV-Oq; Thu, 03 Mar 2022 20:28:15 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPs3Y-007jEh-29
 for linux-riscv@lists.infradead.org; Thu, 03 Mar 2022 20:28:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id c9so5840948pll.0
 for <linux-riscv@lists.infradead.org>; Thu, 03 Mar 2022 12:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dxQGam/t6s6b7fyoP73MYWkn8QnJAxQkYCoPdM6nL1I=;
 b=mPBjfGaGlGhRRdJGhI6p5OroKbDOEcqib9GoJ2PlxZDhT4pFxW3b6cS2YLoTnVqFeb
 i02pLujN9hcrJPpnjZfW9eggE/3CknB0Y2hGV0oX7AYXoCBk9kSL50RkjIpxZFvkDuBw
 PjD8VU3dIgJMmpj0TE+RkVJnkxV6dO9yDxzFvH3SOEX4KgnzNUcwL9reSH4+jMW5VEv0
 0VShAwL49gXTwBWUSzPTTqKl+mbx1xuzQXBF4TkprxP4P2n8H8YAfjla4bVVjT+tXi1o
 8fqCELe0+aNm1y8KmzsikCr9A+IspH83hc8BDfVSyDcdrb1H36ONlxkguTyENDJDaT80
 6DhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dxQGam/t6s6b7fyoP73MYWkn8QnJAxQkYCoPdM6nL1I=;
 b=VcRMwZUA/k26Lp+/CeWuSGfUTmCifnfdIbJzVwjPdn5HSdEbk8pDHyoL36ilzs+X/r
 F8p1F3XxO6og7mruWoPOJCYfcS9KynAZleT/0k5pbi0G4xBG65rhX08m1a9xMwZTYKnK
 hdVhDVrsuDZxYLE2El6JaCndjEoDcT3SOdC5tJh2hkojOuFfWTzUm89CyduFhCNtfHkf
 ISQlZStuBTq4KU4jvJRTsec7m9GF3KJc285jub0FnC5Pf5I8xuppOsl4IKYtd+JPPPtX
 e93K189y0bPOXKECkw1c6uFkkmwK1ld69BTHKs3mowK+fv1ztN/CxfczBdSdtfu6Uqa9
 qZsQ==
X-Gm-Message-State: AOAM532s6fj958rR0/Z2w5wufUAtfz404yh4RZXfe2m66f50RW2r9HWv
 NrpGAMXXwBvvupNNMDzVdsij6eJUxQQ2lA==
X-Google-Smtp-Source: ABdhPJxaoqhOe82A5rqnneKWXe4JLCj4fg/KB6YUFRoSxqXKWauw/Pl+vEv8f2UvTO9NEYdDsddl5A==
X-Received: by 2002:a17:902:bd89:b0:14d:93b4:71a9 with SMTP id
 q9-20020a170902bd8900b0014d93b471a9mr38036752pls.98.1646339289990; 
 Thu, 03 Mar 2022 12:28:09 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 d17-20020a056a00245100b004c283dcbbccsm3558932pfj.176.2022.03.03.12.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:28:09 -0800 (PST)
Date: Thu, 03 Mar 2022 12:28:09 -0800 (PST)
X-Google-Original-Date: Thu, 03 Mar 2022 12:27:22 PST (-0800)
Subject: Re: [PATCH v5] riscv: Fixed misaligned memory access. Fixed pointer
 comparison.
In-Reply-To: <20220206235022.1133995-1-michael@michaelkloos.com>
CC: David.Laight@ACULAB.COM, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, michael@michaelkloos.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: michael@michaelkloos.com
Message-ID: <mhng-e0014632-5c08-4a6a-be8f-fe040b52a95e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_122812_184654_3242BB06 
X-CRM114-Status: GOOD (  56.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 06 Feb 2022 15:50:22 PST (-0800), michael@michaelkloos.com wrote:
> Rewrote the RISC-V memmove() assembly implementation.  The
> previous implementation did not check memory alignment and it
> compared 2 pointers with a signed comparison.  The misaligned
> memory access would cause the kernel to crash on systems that
> did not emulate it in firmware and did not support it in hardware.
> Firmware emulation is slow and may not exist.  The RISC-V spec
> does not guarantee that support for misaligned memory accesses
> will exist.  It should not be depended on.
>
> This patch now checks for XLEN granularity of co-alignment between
> the pointers.  Failing that, copying is done by loading from the 2
> contiguous and naturally aligned XLEN memory locations containing
> the overlapping XLEN sized data to be copied.  The data is shifted
> into the correct place and binary or'ed together on each
> iteration.  The result is then stored into the corresponding
> naturally aligned XLEN sized location in the destination.  For
> unaligned data at the terminations of the regions to be copied
> or for copies less than (2 * XLEN) in size, byte copy is used.
>
> This patch also now uses unsigned comparison for the pointers and
> migrates to the newer assembler annotations from the now deprecated
> ones.
>
> [v3]
>
> Fixed the build issue reported by the test robot.  Changed the
> copy implementation based on the suggestion by David Laight.
>
> One change that could potentially still be made is to roll one
> of the values loaded in the copy loop into the next iteration
> of the fixup loop, rather than reloading both values from memory
> on each iteration.  It would require some more logic and I'm
> really not sure that it is worth it.  It could be added in a
> later patch.  For now, this fixes the issues I set out to fix.

Another good cleanup would to be moving to alphanumeric labels, as 
sticking to just numbers makes this hard to track (though there's some 
comments which help).  This stuff is always a work in progess through, 
so this is good enough for me.

This is on for-next.

Thanks!

> [v4]
>
> I could not resist implementing the optimization I mentioned in
> my v3 notes.  I have implemented the roll over of data by cpu
> register in the misaligned fixup copy loops.  Now, only one load
> from memory is required per iteration of the loop.
>
> [v5]
>
> Optimized copy loops by replacing the unconditional jumps to
> conditional branches with conditional branches themselves,
> spaced loads and the use of the loaded data to minimize pipeline
> stalling on in-order CPUs, and unrolled the misaligned copy loop
> by one iteration.
>
> Signed-off-by: Michael T. Kloos <michael@michaelkloos.com>
> ---
>  arch/riscv/lib/memmove.S | 369 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 309 insertions(+), 60 deletions(-)
>
> diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
> index 07d1d2152ba5..598a3f214ef8 100644
> --- a/arch/riscv/lib/memmove.S
> +++ b/arch/riscv/lib/memmove.S
> @@ -1,64 +1,313 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2022 Michael T. Kloos <michael@michaelkloos.com>
> + */
>
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
>
> -ENTRY(__memmove)
> -WEAK(memmove)
> -        move    t0, a0
> -        move    t1, a1
> -
> -        beq     a0, a1, exit_memcpy
> -        beqz    a2, exit_memcpy
> -        srli    t2, a2, 0x2
> -
> -        slt     t3, a0, a1
> -        beqz    t3, do_reverse
> -
> -        andi    a2, a2, 0x3
> -        li      t4, 1
> -        beqz    t2, byte_copy
> -
> -word_copy:
> -        lw      t3, 0(a1)
> -        addi    t2, t2, -1
> -        addi    a1, a1, 4
> -        sw      t3, 0(a0)
> -        addi    a0, a0, 4
> -        bnez    t2, word_copy
> -        beqz    a2, exit_memcpy
> -        j       byte_copy
> -
> -do_reverse:
> -        add     a0, a0, a2
> -        add     a1, a1, a2
> -        andi    a2, a2, 0x3
> -        li      t4, -1
> -        beqz    t2, reverse_byte_copy
> -
> -reverse_word_copy:
> -        addi    a1, a1, -4
> -        addi    t2, t2, -1
> -        lw      t3, 0(a1)
> -        addi    a0, a0, -4
> -        sw      t3, 0(a0)
> -        bnez    t2, reverse_word_copy
> -        beqz    a2, exit_memcpy
> -
> -reverse_byte_copy:
> -        addi    a0, a0, -1
> -        addi    a1, a1, -1
> -
> -byte_copy:
> -        lb      t3, 0(a1)
> -        addi    a2, a2, -1
> -        sb      t3, 0(a0)
> -        add     a1, a1, t4
> -        add     a0, a0, t4
> -        bnez    a2, byte_copy
> -
> -exit_memcpy:
> -        move a0, t0
> -        move a1, t1
> -        ret
> -END(__memmove)
> +SYM_FUNC_START(__memmove)
> +SYM_FUNC_START_WEAK(memmove)
> +	/*
> +	 * Returns
> +	 *   a0 - dest
> +	 *
> +	 * Parameters
> +	 *   a0 - Inclusive first byte of dest
> +	 *   a1 - Inclusive first byte of src
> +	 *   a2 - Length of copy n
> +	 *
> +	 * Because the return matches the parameter register a0,
> +	 * we will not clobber or modify that register.
> +	 *
> +	 * Note: This currently only works on little-endian.
> +	 * To port to big-endian, reverse the direction of shifts
> +	 * in the 2 misaligned fixup copy loops.
> +	 */
> +
> +	/* Return if nothing to do */
> +	beq a0, a1, 20f /* Return from memmove */
> +	beqz a2, 20f /* Return from memmove */
> +
> +	/*
> +	 * Register Uses
> +	 *      Forward Copy: a3 - Index counter of src
> +	 *      Reverse Copy: a4 - Index counter of src
> +	 *      Forward Copy: t3 - Index counter of dest
> +	 *      Reverse Copy: t4 - Index counter of dest
> +	 *   Both Copy Modes: t5 - Inclusive first multibyte/aligned of dest
> +	 *   Both Copy Modes: t6 - Non-Inclusive last multibyte/aligned of dest
> +	 *   Both Copy Modes: t0 - Link / Temporary for load-store
> +	 *   Both Copy Modes: t1 - Temporary for load-store
> +	 *   Both Copy Modes: t2 - Temporary for load-store
> +	 *   Both Copy Modes: a5 - dest to src alignment offset
> +	 *   Both Copy Modes: a6 - Shift ammount
> +	 *   Both Copy Modes: a7 - Inverse Shift ammount
> +	 *   Both Copy Modes: a2 - Alternate breakpoint for unrolled loops
> +	 */
> +
> +	/*
> +	 * Solve for some register values now.
> +	 * Byte copy does not need t5 or t6.
> +	 */
> +	add  t3, a0, zero
> +	add  t4, a0, a2
> +	add  a3, a1, zero
> +	add  a4, a1, a2
> +
> +	/*
> +	 * Byte copy if copying less than (2 * SZREG) bytes. This can
> +	 * cause problems with the bulk copy implementation and is
> +	 * small enough not to bother.
> +	 */
> +	andi t0, a2, -(2 * SZREG)
> +	beqz t0, 21f
> +
> +	/*
> +	 * Now solve for t5 and t6.
> +	 */
> +	andi t5, t3, -SZREG
> +	andi t6, t4, -SZREG
> +	/*
> +	 * If dest(Register t3) rounded down to the nearest naturally
> +	 * aligned SZREG address, does not equal dest, then add SZREG
> +	 * to find the low-bound of SZREG alignment in the dest memory
> +	 * region.  Note that this could overshoot the dest memory
> +	 * region if n is less than SZREG.  This is one reason why
> +	 * we always byte copy if n is less than SZREG.
> +	 * Otherwise, dest is already naturally aligned to SZREG.
> +	 */
> +	beq  t5, t3, 1f
> +		addi t5, t5, SZREG
> +	1:
> +
> +	/*
> +	 * If the dest and src are co-aligned to SZREG, then there is
> +	 * no need for the full rigmarole of a full misaligned fixup copy.
> +	 * Instead, do a simpler co-aligned copy.
> +	 */
> +	xor  t0, a0, a1
> +	andi t1, t0, (SZREG - 1)
> +	beqz t1, 26f
> +	/* Fall through to misaligned fixup copy */
> +
> +1: /* Misaligned fixup copy */
> +	bltu a1, a0, 4f /* Misaligned fixup copy: Reverse */
> +
> +3: /* Misaligned fixup copy: Forward */
> +	jal  t0, 24f /* Byte copy until aligned: Forward */
> +
> +	andi a5, a3, (SZREG - 1) /* Find the alignment offset of src (a3) */
> +	slli a6, a5, 3 /* Multiply by 8 to convert that to bits to shift */
> +	sub  a5, a3, t3 /* Find the difference between src and dest */
> +	andi a3, a3, -SZREG /* Align the src pointer */
> +	addi a2, t6, SZREG /* The other breakpoint for the unrolled loop*/
> +
> +	/*
> +	 * Compute The Inverse Shift
> +	 * a7 = XLEN - a6 = XLEN + -a6
> +	 * 2s complement negation to find the negative: -a6 = ~a6 + 1
> +	 * Add that to XLEN.  XLEN = SZREG * 8.
> +	 */
> +	not  a7, a6
> +	addi a7, a7, (SZREG * 8 + 1)
> +
> +	/*
> +	 * Fix Misalignment Copy Loop - Forward
> +	 * load_val0 = load_ptr[0];
> +	 * do {
> +	 * 	load_val1 = load_ptr[1];
> +	 * 	store_ptr += 2;
> +	 * 	store_ptr[0 - 2] = (load_val0 >> {a6}) | (load_val1 << {a7});
> +	 *
> +	 * 	if (store_ptr == {a2})
> +	 * 		break;
> +	 *
> +	 * 	load_val0 = load_ptr[2];
> +	 * 	load_ptr += 2;
> +	 * 	store_ptr[1 - 2] = (load_val1 >> {a6}) | (load_val0 << {a7});
> +	 *
> +	 * } while (store_ptr != store_ptr_end);
> +	 * store_ptr = store_ptr_end;
> +	 */
> +	REG_L t0, (0 * SZREG)(a3)
> +	1:
> +	REG_L t1, (1 * SZREG)(a3)
> +	addi  t3, t3, (2 * SZREG)
> +	srl   t0, t0, a6
> +	sll   t2, t1, a7
> +	or    t2, t0, t2
> +	REG_S t2, ((0 * SZREG) - (2 * SZREG))(t3)
> +
> +	beq   t3, a2, 2f
> +
> +	REG_L t0, (2 * SZREG)(a3)
> +	addi  a3, a3, (2 * SZREG)
> +	srl   t1, t1, a6
> +	sll   t2, t0, a7
> +	or    t2, t1, t2
> +	REG_S t2, ((1 * SZREG) - (2 * SZREG))(t3)
> +
> +	bne   t3, t6, 1b
> +	2:
> +	mv    t3, t6 /* Fix the dest pointer in case the loop was broken */
> +
> +	add  a3, t3, a5 /* Restore the src pointer */
> +	j 22f /* Byte copy: Forward */ /* Copy any remaining bytes */
> +
> +4: /* Misaligned fixup copy: Reverse */
> +	jal  t0, 25f /* Byte copy until aligned: Reverse */
> +
> +	andi a5, a4, (SZREG - 1) /* Find the alignment offset of src (a4) */
> +	slli a6, a5, 3 /* Multiply by 8 to convert that to bits to shift */
> +	sub  a5, a4, t4 /* Find the difference between src and dest */
> +	andi a4, a4, -SZREG /* Align the src pointer */
> +	addi a2, t5, -SZREG /* The other breakpoint for the unrolled loop*/
> +
> +	/*
> +	 * Compute The Inverse Shift
> +	 * a7 = XLEN - a6 = XLEN + -a6
> +	 * 2s complement negation to find the negative: -a6 = ~a6 + 1
> +	 * Add that to XLEN.  XLEN = SZREG * 8.
> +	 */
> +	not  a7, a6
> +	addi a7, a7, (SZREG * 8 + 1)
> +
> +	/*
> +	 * Fix Misalignment Copy Loop - Reverse
> +	 * load_val1 = load_ptr[0];
> +	 * do {
> +	 * 	load_val0 = load_ptr[-1];
> +	 * 	store_ptr -= 2;
> +	 * 	store_ptr[1] = (load_val0 >> {a6}) | (load_val1 << {a7});
> +	 *
> +	 * 	if (store_ptr == {a2})
> +	 * 		break;
> +	 *
> +	 * 	load_val1 = load_ptr[-2];
> +	 * 	load_ptr -= 2;
> +	 * 	store_ptr[0] = (load_val1 >> {a6}) | (load_val0 << {a7});
> +	 *
> +	 * } while (store_ptr != store_ptr_end);
> +	 * store_ptr = store_ptr_end;
> +	 */
> +	REG_L t1, ( 0 * SZREG)(a4)
> +	1:
> +	REG_L t0, (-1 * SZREG)(a4)
> +	addi  t4, t4, (-2 * SZREG)
> +	sll   t1, t1, a7
> +	srl   t2, t0, a6
> +	or    t2, t1, t2
> +	REG_S t2, ( 1 * SZREG)(t4)
> +
> +	beq   t4, a2, 2f
> +
> +	REG_L t1, (-2 * SZREG)(a4)
> +	addi  a4, a4, (-2 * SZREG)
> +	sll   t0, t0, a7
> +	srl   t2, t1, a6
> +	or    t2, t0, t2
> +	REG_S t2, ( 0 * SZREG)(t4)
> +
> +	bne   t4, t5, 1b
> +	2:
> +	mv    t4, t5 /* Fix the dest pointer in case the loop was broken */
> +
> +	add  a4, t4, a5 /* Restore the src pointer */
> +	j 23f /* Byte copy: Reverse */ /* Copy any remaining bytes */
> +
> +/*
> + * Simple copy loops for SZREG co-aligned memory locations.
> + * These also make calls to do byte copies for any unaligned
> + * data at their terminations.
> + */
> +26: /* Co-Aligned copy */
> +	bltu a1, a0, 3f /* Co-Aligned copy: Reverse */
> +
> +2: /* Co-Aligned copy: Forward */
> +	jal t0, 24f /* Byte copy until aligned: Forward */
> +
> +	1:
> +	REG_L t1, ( 0 * SZREG)(a3)
> +	addi  a3, a3, SZREG
> +	addi  t3, t3, SZREG
> +	REG_S t1, (-1 * SZREG)(t3)
> +	bne   t3, t6, 1b
> +	j 22f /* Byte copy: Forward */
> +
> +3: /* Co-Aligned copy: Reverse */
> +	jal t0, 25f /* Byte copy until aligned: Reverse */
> +
> +	1:
> +	REG_L t1, (-1 * SZREG)(a4)
> +	addi  a4, a4, -SZREG
> +	addi  t4, t4, -SZREG
> +	REG_S t1, ( 0 * SZREG)(t4)
> +	bne   t4, t5, 1b
> +	j 23f /* Byte copy: Reverse */
> +
> +/*
> + * These are basically sub-functions within the function.  They
> + * are used to byte copy until the dest pointer is in alignment.
> + * At which point, a bulk copy method can be used by the
> + * calling code.  These work on the same registers as the bulk
> + * copy loops.  Therefore, the register values can be picked
> + * up from where they were left and we avoid code duplication
> + * without any overhead except the call in and return jumps.
> + */
> +24: /* Byte copy until aligned: Forward */
> +	beq  t3, t5, 2f
> +	1:
> +	lb   t1,  0(a3)
> +	addi a3, a3, 1
> +	addi t3, t3, 1
> +	sb   t1, -1(t3)
> +	bne  t3, t5, 1b
> +	2:
> +	jalr zero, 0x0(t0) /* Return to multibyte copy loop */
> +
> +25: /* Byte copy until aligned: Reverse */
> +	beq  t4, t6, 2f
> +	1:
> +	lb   t1, -1(a4)
> +	addi a4, a4, -1
> +	addi t4, t4, -1
> +	sb   t1,  0(t4)
> +	bne  t4, t6, 1b
> +	2:
> +	jalr zero, 0x0(t0) /* Return to multibyte copy loop */
> +
> +/*
> + * Simple byte copy loops.
> + * These will byte copy until they reach the end of data to copy.
> + * At that point, they will call to return from memmove.
> + */
> +21: /* Byte copy */
> +	bltu a1, a0, 23f /* Byte copy: Reverse */
> +
> +22: /* Byte copy: Forward */
> +	beq  t3, t4, 2f
> +	1:
> +	lb   t1,  0(a3)
> +	addi a3, a3, 1
> +	addi t3, t3, 1
> +	sb   t1, -1(t3)
> +	bne  t3, t4, 1b
> +	2:
> +	ret
> +
> +23: /* Byte copy: Reverse */
> +	beq  t4, t3, 2f
> +	1:
> +	lb   t1, -1(a4)
> +	addi a4, a4, -1
> +	addi t4, t4, -1
> +	sb   t1,  0(t4)
> +	bne  t4, t3, 1b
> +	2:
> +
> +20: /* Return from memmove */
> +	ret
> +
> +SYM_FUNC_END(memmove)
> +SYM_FUNC_END(__memmove)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
