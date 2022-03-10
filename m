Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A761C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VWg50g5MYffBT36igb9mpHVjYNHbJqJhN1KkQA5JpGM=; b=NZfRSt/BkK7NGSCfUiSSh+aZA7
	ctlgXf51GZGpu6i3BgiikpA88nhCDZ+iqNjVl5MU0BGY9B8JKXo1zOQXu9UNFC8Ul8WFpM9e5sKR1
	RuEGWMmRW4kBP5Rz01ZQTazL/F6NGTRztIWNRu8rTk2M9PzaR6S1pkVxQ0q/4C0ytuH83Uvv94ws8
	Xaqho+JZJF0JKeQwYlVvSjfDORJ4kU2LwUWBjwWaKPoqrAjltYd6dsLOGo+4wudUM/sn5TSYyjpzv
	5ooIcakmPgKkORb2PBMzJK0kv5EWoyCzbvGRmsb27jnkV0aPTRjtRGPg1qTfnbQJxNHbB63epvwEL
	hCqg119g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSP42-00Dvr1-F7; Thu, 10 Mar 2022 20:07:10 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSP3y-00Dvp6-8S
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 20:07:08 +0000
Received: by mail-pg1-x532.google.com with SMTP id o23so5592919pgk.13
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 12:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PYweMQPrL7uEAHG8rV7QHiZlJFz7RCkoOfajbH3ejo4=;
 b=EaJ5VTOfsIEU87Iy0ZVt55RTUVB0cMXSbNW6P0EtF5ra8YSURsBXkLmPsG63tKssyj
 xozJKYjE+mukDiYG42m+pn1tTdBbIMZRl4+he0S4Ryamh2gMJOrs/WLWRpk0ZTALQOuJ
 Ge81sf7oZJvRo3UzpXsF7kBKcn172plFfqSoNYEHJX5y0hSgP/ueF66Uy4P9hpgAEijQ
 bHJIwzORRCVSInnMBjGuI7hrQJj/CTSDwF9MxeUUyAKz4VGIPAtcajHZ/WEPLUD03BMR
 uFVLEEEimap9cpJlWuolvMqnP1sV0Y0PlekhBvk6XE1nersNmub0pp9UXrt5DgnZ7GsO
 bFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PYweMQPrL7uEAHG8rV7QHiZlJFz7RCkoOfajbH3ejo4=;
 b=JlUtDYX1jC/MHcDqKMwelemaAFD6Km34VjX3jQGiYmrPvQYzOlkOzZGn048NzT6G5g
 0LRyRYTyxczwNtbUduTdZfpA6XBbSn9t1OTO/XsQZchkkUGpf9dfeObZd/4WrGstw6eC
 lJwpKRNpsv2Tttw2ffrYIlHjbLb2E1zS9Ix5pKGYhBLsMInwg1HX/zoAesVgNCLUSJ3n
 TTgreAVXOjkYaBpN+GZHSPnE3SqpALPLayzP+AC5eJRZT3D2ey3kT7So+2SaxHRDGxKL
 gqpLPCgFlT56/6xi4wYppt0afPlCMgKzKFURjUmFKvufaamW7z7nBWEP+BiYwOET0STg
 2sFA==
X-Gm-Message-State: AOAM5326ARk8qnV41nEIisEjjnn0KpFlNNVZgfb2lwukPf8Lio5h8o7W
 fKIdRymWWECVNx6/9j5S8aR2NQ==
X-Google-Smtp-Source: ABdhPJzhOXoW6OwvM2FHUtGIvUxdf+sz2sxEB7RpLjE2gpOfme94+fw0tQUiz26yM3o/MnPHDrqAZw==
X-Received: by 2002:a63:2d8:0:b0:37c:4e75:302c with SMTP id
 207-20020a6302d8000000b0037c4e75302cmr5642507pgc.580.1646942824907; 
 Thu, 10 Mar 2022 12:07:04 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 f2-20020a056a0022c200b004f7649f78dbsm5654302pfj.139.2022.03.10.12.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:07:04 -0800 (PST)
Date: Thu, 10 Mar 2022 12:07:04 -0800 (PST)
X-Google-Original-Date: Thu, 10 Mar 2022 12:06:08 PST (-0800)
Subject: Re: [PATCH v6] riscv: Fixed misaligned memory access. Fixed pointer
 comparison.
In-Reply-To: <20220308010321.6123-1-michael@michaelkloos.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 michael@michaelkloos.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: michael@michaelkloos.com
Message-ID: <mhng-30aeea98-312c-4e7c-b135-6ae7a77f0f8b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_120706_342958_ED810288 
X-CRM114-Status: GOOD (  63.43  )
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

On Mon, 07 Mar 2022 17:03:21 PST (-0800), michael@michaelkloos.com wrote:
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
>
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
> [v6]
>
> I have reverted to alphanumeric labels for easier reading per
> the request of Palmer Dabbelt.  My idea in using numbers was to
> minimize polution of the symbol tables in the kernel elf file.
> But that really doesn't matter much and this makes debugging and
> code reading easier when viewing an objdump of the kernel elf.
>
> I have also made one additial minor optimization.  I changed the
> forward src index counter from register a3 to register a1.  This
> means that we don't have to copy the value from a1 to a3 in the
> start of this implementation.  I put it off until the end because
> it only removed 1 one-time-use instruction at the cost of
> decreased readability.

I think I said I put the v5 on for-next, but it looks like I dropped the 
ball and had only put it on my staging branch.  I usually like to avoid 
rebasing for-next when possible, but given that one never actually 
landed I'm going to just take this one instead.

This time in's really actually or for-next, though, so please send 
anything else as a follow-on.

Thanks!

>
> Signed-off-by: Michael T. Kloos <michael@michaelkloos.com>
> ---
>  arch/riscv/lib/memmove.S | 368 +++++++++++++++++++++++++++++++++------
>  1 file changed, 310 insertions(+), 58 deletions(-)
>
> diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
> index 07d1d2152ba5..e0609e1f0864 100644
> --- a/arch/riscv/lib/memmove.S
> +++ b/arch/riscv/lib/memmove.S
> @@ -1,64 +1,316 @@
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
>
> +	/* Return if nothing to do */
> +	beq a0, a1, return_from_memmove
> +	beqz a2, return_from_memmove
> +
> +	/*
> +	 * Register Uses
> +	 *      Forward Copy: a1 - Index counter of src
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
> +	mv   t3, a0
> +	add  t4, a0, a2
> +	add  a4, a1, a2
> +
> +	/*
> +	 * Byte copy if copying less than (2 * SZREG) bytes. This can
> +	 * cause problems with the bulk copy implementation and is
> +	 * small enough not to bother.
> +	 */
> +	andi t0, a2, -(2 * SZREG)
> +	beqz t0, byte_copy
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
> +	beqz t1, coaligned_copy
> +	/* Fall through to misaligned fixup copy */
> +
> +misaligned_fixup_copy:
> +	bltu a1, a0, misaligned_fixup_copy_reverse
> +
> +misaligned_fixup_copy_forward:
> +	jal  t0, byte_copy_until_aligned_forward
> +
> +	andi a5, a1, (SZREG - 1) /* Find the alignment offset of src (a1) */
> +	slli a6, a5, 3 /* Multiply by 8 to convert that to bits to shift */
> +	sub  a5, a1, t3 /* Find the difference between src and dest */
> +	andi a1, a1, -SZREG /* Align the src pointer */
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
> +
> +	REG_L t0, (0 * SZREG)(a1)
> +	1:
> +	REG_L t1, (1 * SZREG)(a1)
> +	addi  t3, t3, (2 * SZREG)
> +	srl   t0, t0, a6
> +	sll   t2, t1, a7
> +	or    t2, t0, t2
> +	REG_S t2, ((0 * SZREG) - (2 * SZREG))(t3)
> +
> +	beq   t3, a2, 2f
> +
> +	REG_L t0, (2 * SZREG)(a1)
> +	addi  a1, a1, (2 * SZREG)
> +	srl   t1, t1, a6
> +	sll   t2, t0, a7
> +	or    t2, t1, t2
> +	REG_S t2, ((1 * SZREG) - (2 * SZREG))(t3)
> +
> +	bne   t3, t6, 1b
> +	2:
> +	mv    t3, t6 /* Fix the dest pointer in case the loop was broken */
> +
> +	add  a1, t3, a5 /* Restore the src pointer */
> +	j byte_copy_forward /* Copy any remaining bytes */
> +
> +misaligned_fixup_copy_reverse:
> +	jal  t0, byte_copy_until_aligned_reverse
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
> +
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
> +	j byte_copy_reverse /* Copy any remaining bytes */
> +
> +/*
> + * Simple copy loops for SZREG co-aligned memory locations.
> + * These also make calls to do byte copies for any unaligned
> + * data at their terminations.
> + */
> +coaligned_copy:
> +	bltu a1, a0, coaligned_copy_reverse
> +
> +coaligned_copy_forward:
> +	jal t0, byte_copy_until_aligned_forward
> +
> +	1:
> +	REG_L t1, ( 0 * SZREG)(a1)
> +	addi  a1, a1, SZREG
> +	addi  t3, t3, SZREG
> +	REG_S t1, (-1 * SZREG)(t3)
> +	bne   t3, t6, 1b
> +
> +	j byte_copy_forward /* Copy any remaining bytes */
> +
> +coaligned_copy_reverse:
> +	jal t0, byte_copy_until_aligned_reverse
> +
> +	1:
> +	REG_L t1, (-1 * SZREG)(a4)
> +	addi  a4, a4, -SZREG
> +	addi  t4, t4, -SZREG
> +	REG_S t1, ( 0 * SZREG)(t4)
> +	bne   t4, t5, 1b
> +
> +	j byte_copy_reverse /* Copy any remaining bytes */
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
> +byte_copy_until_aligned_forward:
> +	beq  t3, t5, 2f
> +	1:
> +	lb   t1,  0(a1)
> +	addi a1, a1, 1
> +	addi t3, t3, 1
> +	sb   t1, -1(t3)
> +	bne  t3, t5, 1b
> +	2:
> +	jalr zero, 0x0(t0) /* Return to multibyte copy loop */
> +
> +byte_copy_until_aligned_reverse:
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
>  byte_copy:
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
> +	bltu a1, a0, byte_copy_reverse
> +
> +byte_copy_forward:
> +	beq  t3, t4, 2f
> +	1:
> +	lb   t1,  0(a1)
> +	addi a1, a1, 1
> +	addi t3, t3, 1
> +	sb   t1, -1(t3)
> +	bne  t3, t4, 1b
> +	2:
> +	ret
> +
> +byte_copy_reverse:
> +	beq  t4, t3, 2f
> +	1:
> +	lb   t1, -1(a4)
> +	addi a4, a4, -1
> +	addi t4, t4, -1
> +	sb   t1,  0(t4)
> +	bne  t4, t3, 1b
> +	2:
> +
> +return_from_memmove:
> +	ret
> +
> +SYM_FUNC_END(memmove)
> +SYM_FUNC_END(__memmove)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
