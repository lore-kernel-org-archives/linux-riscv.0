Return-Path: <SRS0=iJWH=NH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE680C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 18:10:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 675DA60F41
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 18:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 675DA60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=fmiPdL0DtT9i2/8dO6v1Pn3jF48Hy4rT5PqDELMp6LY=; b=KHf3f04vdQ4uI40OKNE26Erpbi
	xTGGbMKk+5VLcL/LITKVsPajrUZWYEY28lGvgababHy6vyRdfvGdgPV8d9dJNetKFKsbE0CQ2S9fW
	1LOGWweiYti3jKY7t4LEaXp1dnSo9/MoY/M20SLN4Rv3kAnrfNN7y7QS2/wxiiZezC3kq2jyI+VxM
	dfTZLhFAHJwB4zgsCtN/hLA2R+8RS3Ph7oDmEHjH70Rl5rkUwXP+p3lWN+Vqp+ZQUVYj2kJk9+e4s
	WSz6YFc4c2DVFswMPi8/6ayUrlnAIqMF51dZyazek0vC9Ab7VbWr0kqQRqfaAQJMcdDj5c1LnJuus
	5bs8hYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFh3Y-00HYxW-DP; Mon, 16 Aug 2021 18:09:52 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFh3U-00HYx6-MI
 for linux-riscv@lists.infradead.org; Mon, 16 Aug 2021 18:09:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id c17so16322361plz.2
 for <linux-riscv@lists.infradead.org>; Mon, 16 Aug 2021 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=p2bkqWFEC2gR2YtuFUx6Fm7qYd1zZdWbBWhk55kWfPA=;
 b=a2tVNda0WPfrJUw66HIu72ovJiFEENcVs4kaBBZ++kllMOZqV2QLrtqOxDWz3czrbp
 WfSp55yY9ZysyKQW9q5/bm++/rWkAz4/buGG4G1HLv3QwcC2UALa3b5E9XK84NVBwXC/
 FTYyqS2F106horA2gZpCs1tPa47BJf71yM0gmITYiFBWgF2dUknhn+zZ46lsMja6ZTKL
 Dlj0r4xQEKt4ABoGbVRDjroXAnV3Mqx6hSJazfcczijWk/PfPURd92RomCfOyQnTWDbY
 068hp5vjXluNF9B3R6p4JCN0Fl8WYuYtXMJVL7rxHX+1U2rNPk3VeOYtBXyZj2ajuWOW
 DlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=p2bkqWFEC2gR2YtuFUx6Fm7qYd1zZdWbBWhk55kWfPA=;
 b=Q+p6AZKT9pGj6EAtpcksHuVAyRfO8wSa5PEFkxVyINUgEQ7XCyzaE/Nf1mgCrLrarN
 LwZTFJgn1RRF+c+tIciIl1t/tto/QsW3Kinnv59YGlPdtHqkONpi9BYHfcwN9qAuS00l
 ZVyRsPpQ7boDy/YIDumcfNX9htHOkCLpRrtW1bhPpgVeSevIRX0zgnP9J5wrMMwXL0xh
 aK/wi8YDiisBV8uPgzLW4JJ5i+u1Hc/be5XeaYXFcidtYL54HBnDU5tnkPLryIYgbmmy
 TQtwDfOeMPaRSJXPhj3JzdGg3CW33X4qpBuXtu7mNgmbK/Ze4lZ0zv6ct6rMsFj29j2v
 cRgQ==
X-Gm-Message-State: AOAM532u/zJtE7KxkSSioxNseFOx2vrMTd9XYLx9IW7FL92JT8Mn/a2j
 CZo/D1drd/MN46GQW7/gMYwNAQ==
X-Google-Smtp-Source: ABdhPJx6qk04s9V+PiQeWIf6lJD6Fodj3Tj/KvxstJ8AiEsyYECec+zhqFGWJCp6Zb+C5CUk4VwmRQ==
X-Received: by 2002:a65:4307:: with SMTP id j7mr58100pgq.387.1629137386557;
 Mon, 16 Aug 2021 11:09:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gd14sm165849pjb.4.2021.08.16.11.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 11:09:45 -0700 (PDT)
Date: Mon, 16 Aug 2021 11:09:45 -0700 (PDT)
X-Google-Original-Date: Mon, 16 Aug 2021 11:09:43 PDT (-0700)
Subject: Re: [PATCH 1/1] riscv: __asm_copy_to-from_user: Improve using word
 copy if size < 9*SZREG
In-Reply-To: <e3e9fb3a-40b1-50f3-23cc-50bfa53baa8d@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux@roeck-us.net,
 geert@linux-m68k.org, qiuwenbo@kylinos.com.cn, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: akira.tsukamoto@gmail.com
Message-ID: <mhng-f83b1d51-c006-4b01-830a-0f827f0c56a1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_110948_827471_B89EDE77 
X-CRM114-Status: GOOD (  25.68  )
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

On Fri, 30 Jul 2021 06:52:44 PDT (-0700), akira.tsukamoto@gmail.com wrote:
> Reduce the number of slow byte_copy when the size is in between
> 2*SZREG to 9*SZREG by using none unrolled word_copy.
>
> Without it any size smaller than 9*SZREG will be using slow byte_copy
> instead of none unrolled word_copy.
>
> Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
> ---
>  arch/riscv/lib/uaccess.S | 46 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 63bc691cff91..6a80d5517afc 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -34,8 +34,10 @@ ENTRY(__asm_copy_from_user)
>  	/*
>  	 * Use byte copy only if too small.
>  	 * SZREG holds 4 for RV32 and 8 for RV64
> +	 * a3 - 2*SZREG is minimum size for word_copy
> +	 *      1*SZREG for aligning dst + 1*SZREG for word_copy
>  	 */
> -	li	a3, 9*SZREG /* size must be larger than size in word_copy */
> +	li	a3, 2*SZREG
>  	bltu	a2, a3, .Lbyte_copy_tail
>
>  	/*
> @@ -66,9 +68,40 @@ ENTRY(__asm_copy_from_user)
>  	andi	a3, a1, SZREG-1
>  	bnez	a3, .Lshift_copy
>
> +.Lcheck_size_bulk:
> +	/*
> +	 * Evaluate the size if possible to use unrolled.
> +	 * The word_copy_unlrolled requires larger than 8*SZREG
> +	 */
> +	li	a3, 8*SZREG
> +	add	a4, a0, a3
> +	bltu	a4, t0, .Lword_copy_unlrolled
> +
>  .Lword_copy:
> -        /*
> -	 * Both src and dst are aligned, unrolled word copy
> +	/*
> +	 * Both src and dst are aligned
> +	 * None unrolled word copy with every 1*SZREG iteration
> +	 *
> +	 * a0 - start of aligned dst
> +	 * a1 - start of aligned src
> +	 * t0 - end of aligned dst
> +	 */
> +	bgeu	a0, t0, .Lbyte_copy_tail /* check if end of copy */
> +	addi	t0, t0, -(SZREG) /* not to over run */
> +1:
> +	REG_L	a5, 0(a1)
> +	addi	a1, a1, SZREG
> +	REG_S	a5, 0(a0)
> +	addi	a0, a0, SZREG
> +	bltu	a0, t0, 1b
> +
> +	addi	t0, t0, SZREG /* revert to original value */
> +	j	.Lbyte_copy_tail
> +
> +.Lword_copy_unlrolled:
> +	/*
> +	 * Both src and dst are aligned
> +	 * Unrolled word copy with every 8*SZREG iteration
>  	 *
>  	 * a0 - start of aligned dst
>  	 * a1 - start of aligned src
> @@ -97,7 +130,12 @@ ENTRY(__asm_copy_from_user)
>  	bltu	a0, t0, 2b
>
>  	addi	t0, t0, 8*SZREG /* revert to original value */
> -	j	.Lbyte_copy_tail
> +
> +	/*
> +	 * Remaining might large enough for word_copy to reduce slow byte
> +	 * copy
> +	 */
> +	j	.Lcheck_size_bulk
>
>  .Lshift_copy:

I'm still not convinced that going all the way to such a large unrolling 
factor is a net win, but this at least provides a much smoother cost 
curve.

That said, this is causing my 32-bit configs to hang.  There were a few 
conflicts so I may have messed something up, but nothing is jumping out 
at me.  I've put what I ended up with on a branch, if you have time to 
look that'd be great but if not then I'll take another shot at this when 
I get back around to it.

    https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=wip-word_user_copy

Here's the backtrace, though that's probably not all that useful:

[    0.703694] Unable to handle kernel NULL pointer dereference at virtual address 000005a8
[    0.704194] Oops [#1]
[    0.704301] Modules linked in:[    0.704463] CPU: 2 PID: 1 Comm: init Not tainted 5.14.0-rc1-00016-g59461ddb9dbd #5
[    0.704660] Hardware name: riscv-virtio,qemu (DT)
[    0.704802] epc : walk_stackframe+0xac/0xc2[    0.704941]  ra : dump_backtrace+0x1a/0x22
[    0.705074] epc : c0004558 ra : c0004588 sp : c1c5fe10
[    0.705216]  gp : c18b41c8 tp : c1cd8000 t0 : 00000000[    0.705357]  t1 : ffffffff t2 : 00000000 s0 : c1c5fe40
[    0.705506]  s1 : c11313dc a0 : 00000000 a1 : 00000000
[    0.705647]  a2 : c06fd2c2 a3 : c11313dc a4 : c084292d[    0.705787]  a5 : 00000000 a6 : c1864cb8 a7 : 3fffffff
[    0.705926]  s2 : 00000000 s3 : c1123e88 s4 : 00000000
[    0.706066]  s5 : c11313dc s6 : c06fd2c2 s7 : 00000001[    0.706206]  s8 : 00000000 s9 : 95af6e28 s10: 00000000
[    0.706345]  s11: 00000001 t3 : 00000000 t4 : 00000000
[    0.706482]  t5 : 00000001 t6 : 00000000[    0.706594] status: 00000100 badaddr: 000005a8 cause: 0000000d
[    0.706809] [<c0004558>] walk_stackframe+0xac/0xc2
[    0.707019] [<c0004588>] dump_backtrace+0x1a/0x22[    0.707149] [<c06fd312>] show_stack+0x2c/0x38
[    0.707271] [<c06ffba4>] dump_stack_lvl+0x40/0x58
[    0.707400] [<c06ffbce>] dump_stack+0x12/0x1a[    0.707521] [<c06fd4f6>] panic+0xfa/0x2a6
[    0.707632] [<c000e2f4>] do_exit+0x7a8/0x7ac
[    0.707749] [<c000eefa>] do_group_exit+0x2a/0x7e[    0.707872] [<c000ef60>] __wake_up_parent+0x0/0x20
[    0.707999] [<c0003020>] ret_from_syscall+0x0/0x2
[    0.708385] ---[ end trace 260976561a3770d1 ]---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
