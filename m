Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585F4C6FA81
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 06:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58dw5S49jD054ImgpVCgdEPQlxdJ6Ixr1cO/Z41vkrI=; b=xuXBRAXxJNxjzg
	33YCfaQuFbwG3kVzMx1RIzVmp/VuzJpCUVP4iO5wyLAm/W3CqlwetrlSR3lUxSigsJ47LmlNlXulM
	M+vc4f+2zk5UV+yvk3sQi8V52bfvbbHsuyscQIi3dUMp2rvAAlngp7KGD3B4ArrQq3ka4NrrJiyvk
	7qekn7IsaLnez+PGPZ2wkfTBXmCCmYAy3XBzyrTpT6XOxRJsfQnf32FaEfL03zjZQHFUmhF1NYEY0
	VCRj119YhyzAU+Wqvhg56iuA3o4bPnbSHFF204J4orUx9pC2Icjflc3MD5DzU8SNmwJIJjMaRZsMa
	B70mL4h0jlOh6BZVQAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0XL-0010Vb-AE; Fri, 02 Sep 2022 06:52:19 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0XH-0010Gx-T8
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 06:52:17 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id t184so1886824yba.4
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 23:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Wj7rwDEHIUvAdD/PS9G4uEt058e/aJElYMpCPRmWxnM=;
        b=RMhDjLH+q4GyBtGrIfOWZsxarTb9p5zBL9PM/I9+xMA5VAtX+q2vhDdUkUSKnIaVId
         VCHctB2fPYv7J3jYEcRYYXdKw/3TeOcHGoxwm2IaZC/2hsoA0wveaM0/vS4pKUgA4DUM
         E6uHOSqsNZ8o9r+P1kJoNIgo7lHE7M2Vx7KkJ5yrGLFBGlYL4qO4109aEfvWeV/72HEg
         sWR2j5XVJSaAw2IBRdtn22+nFqv9HX5Touf66IldvpyxaIO5SG2Betz+VmIZlFKNe5Aw
         6dkjdUVBRio+ypOXZYV2+Rr20PZ8pdWqR8uXRxS5LyBuy79XaAc50YB1GipRlwx6642r
         3Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Wj7rwDEHIUvAdD/PS9G4uEt058e/aJElYMpCPRmWxnM=;
        b=liBN8OCFJbLCndGwHqG0e6Y4kmXZpXKVlGhUO5qHkPsz1sDz2n4F4lEjg5IxuBJoTi
         K2cvJyAL74rIGYnfVWx3eW4J5sousIMpEEoM4/da2njcF9y8aRIGuR/gXCHfMa6lxq0E
         V91KKAUy18d8bcEc8F1v8RdQm3FNIE9+Z1BSXHan08AA7q04eYCKKKEQIdkA+znUXGiy
         CAFR7wWj9jeJ3k1ys6wABt0wqt+74AgaWosECxoD4q+opd7+9Qd2H9RXIjwj+tUsstrq
         EBuhgMkApz3TO4JAFHDLH2LzBIfi9PV3rA4TcmcRE0WnxpyFBTsnBUhO/cLkYjyTP59R
         RQaQ==
X-Gm-Message-State: ACgBeo1oI4rRXhBym34w3yi0a9G549EVtr151z29xwcesar3f+g2PJSR
	TilPtQUgP9096fKNOubF+48AVIGlfNpeyQa/wS96JA==
X-Google-Smtp-Source: AA6agR53rFA7+dY6Kz/imFK+JQbciKfQA4yj9Jc5MOpmzuX76XzyuEfGQeVQS7WAdjNCqpORZpW5fGDY6Qbkp/St3/Q=
X-Received: by 2002:a25:234a:0:b0:696:435f:df06 with SMTP id
 j71-20020a25234a000000b00696435fdf06mr21647862ybj.180.1662101521591; Thu, 01
 Sep 2022 23:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220831172500.752195-1-ajones@ventanamicro.com> <20220831172500.752195-2-ajones@ventanamicro.com>
In-Reply-To: <20220831172500.752195-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Sep 2022 12:21:49 +0530
Message-ID: <CAAhSdy2uVFr7-hrxC9DbrSLSytnZLTs4D4j1s=cdmaqwo-Jq8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: Add X register names to gpr-nums
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, mchitale@ventanamicro.com, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_235215_957553_1680275F 
X-CRM114-Status: GOOD (  16.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 31, 2022 at 10:55 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When encoding instructions it's sometimes necessary to set a
> register field to a precise number. This is easiest to do using
> the x<num> naming.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

I have queued this patch for Linux-6.1

Thanks,
Anup

> ---
>  arch/riscv/include/asm/gpr-num.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/include/asm/gpr-num.h b/arch/riscv/include/asm/gpr-num.h
> index dfee2829fc7c..efeb5edf8a3a 100644
> --- a/arch/riscv/include/asm/gpr-num.h
> +++ b/arch/riscv/include/asm/gpr-num.h
> @@ -3,6 +3,11 @@
>  #define __ASM_GPR_NUM_H
>
>  #ifdef __ASSEMBLY__
> +
> +       .irp    num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
> +       .equ    .L__gpr_num_x\num, \num
> +       .endr
> +
>         .equ    .L__gpr_num_zero,       0
>         .equ    .L__gpr_num_ra,         1
>         .equ    .L__gpr_num_sp,         2
> @@ -39,6 +44,9 @@
>  #else /* __ASSEMBLY__ */
>
>  #define __DEFINE_ASM_GPR_NUMS                                  \
> +"      .irp    num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31\n" \
> +"      .equ    .L__gpr_num_x\\num, \\num\n"                    \
> +"      .endr\n"                                                \
>  "      .equ    .L__gpr_num_zero,       0\n"                    \
>  "      .equ    .L__gpr_num_ra,         1\n"                    \
>  "      .equ    .L__gpr_num_sp,         2\n"                    \
> --
> 2.37.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
