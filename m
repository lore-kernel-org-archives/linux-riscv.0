Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D44C19F2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 22:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/7DPFcwEFf1Vl7GLEOIKvb91fHemD9ClMaSlHRjiPY=; b=OxPgiEV0WdZAKm
	t8P5S7o5cXcagizUVvRQ9nJNewk5NEzTWZXZlnEjiGZ9iF0XtWqDLgDwOhl38254G585+UELs5zBK
	YkGHHtns+7OjN3MFZIiyv3NXjgfrqEdPGDzsmM/L2uEEipbozUr5STg3OBoW3AGg+e1757ESywpmn
	YSCxLiW6sxP9B5SGB6iSbJyFpfL4OrUIzSzBqcNhgzjfcI9uic2BVfVdCE9im2Y8D8rCnvWPNJXDP
	ja58eBbbIbh2LdalJEF9B8EP8y4zAm8Jz37YdxGaigp+dEBeGOBHO8dwULZT+6IsgRwZ3nMVJdk4V
	2ZI1ZtN8at+W8lTgJ9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKpAL-003ca2-BQ; Sun, 07 Aug 2022 22:54:38 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKpAA-003cR4-8u
	for linux-riscv@lists.infradead.org; Sun, 07 Aug 2022 22:54:34 +0000
Received: by mail-pf1-x430.google.com with SMTP id g12so6714197pfb.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 Aug 2022 15:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=43oYjQak69cnmr5Xx/vXh1gHTmr9iNtXaxQK+muUYYU=;
        b=KvGN2K7swFbeuQIbSlviMmEPo0nwIHFD4it3ZK1jHFkL0Hq7cdFXkOEHPdj3Gy/yl8
         phNJh/j1405m7JNK9/v5VOk3DZxrjx7No0EGyeakivCVhb/FOI0d4JV4urRhlJ/kpwtp
         yy6KTPOejyJ38gZhPwQie2JXLr/JI99v2uyDNMUCGeEu3mV7f/+qlUC1n1aCqTEIBuy0
         e7+tdH5q1vcg3cIUQwHWVxNS56/jwiweKiOcdfcC69xVeJ61ht0D61FTEvqAA13H1bXY
         uc5UafhTmvgW6T1N/nwERpzfSGKOELu77y54x7wRtVNaQl1FmbX6y1fIz5Owu3EvmUyF
         znwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=43oYjQak69cnmr5Xx/vXh1gHTmr9iNtXaxQK+muUYYU=;
        b=qIUXTECtVIbSAynysFzh8S7Y0N/Hu0cGzcwSv2HwtZYrD4NMyXWsjt2iv/LoeeCDQe
         tyr9amrn3iozxFFDwiaELzLPF00DbRcl34tmZCkEPcvjXcuKk+pMM0ZuGY4/O3/8B15t
         bkoyxeBnJ9mJ3PdaMdCqRR+Qc/x6ZL6ANMTFR2YN3xt782FO8PB48cqns75GFoqki3er
         R84EOl7iw8R2loBlrbN15XO9t7lVrQaLNEg+H+zYSFke9oPevWsHCtQOIIa/LPB+NVm0
         yYiSLCr1MSumzcVc3U6QVASZB8S5fIBN+OflssXmpDujUwzuJoy5jhjfecCA+pWzzTtV
         Og3A==
X-Gm-Message-State: ACgBeo2AWyQVwh7AJvI1cu+7RYEKVLyUCurmEZk+KJ7oqJWw8DK4gz9z
	3Ws7bH87bfgkBK7OAEBCZAmkkOV+Exa8mR5ZR28=
X-Google-Smtp-Source: AA6agR6iKY1N6dLXfYAISVMIhHFtzbZ3dlNMytM1cpy71UCmt3XYEGVW8tQ5poHoTcvWnRwLpiSnWnmX+aqjc1X6auA=
X-Received: by 2002:a63:5f49:0:b0:41d:85a1:c4da with SMTP id
 t70-20020a635f49000000b0041d85a1c4damr1729915pgb.366.1659912864354; Sun, 07
 Aug 2022 15:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220805155405.1504081-1-mail@conchuod.ie> <20220805155405.1504081-2-mail@conchuod.ie>
In-Reply-To: <20220805155405.1504081-2-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 08:53:58 +1000
Message-ID: <CAKmqyKOORP+ciE0ZybCbtqFV5N4g6B8J2JwSrn0fen0zd9RfUg@mail.gmail.com>
Subject: Re: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_155426_508037_20C1380B 
X-CRM114-Status: GOOD (  20.17  )
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

On Sat, Aug 6, 2022 at 2:08 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Palmer Dabbelt <palmer@sifive.com>
>
> The ISA strings we're providing from QEMU aren't actually legal RISC-V
> ISA strings, as both S and U cannot exist as single-letter extensions
> and must instead be multi-letter strings.  We're still using the ISA
> strings inside QEMU to track the availiable extensions, so just strip
> out the S and U extensions when formatting ISA strings.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> [Conor: rebased on 7.1.0-rc1 & slightly tweaked the commit message]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  target/riscv/cpu.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac6f82ebd0..95fdc03b3d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1122,7 +1122,23 @@ char *riscv_isa_string(RISCVCPU *cpu)
>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
>      for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
>          if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
> -            *p++ = qemu_tolower(riscv_single_letter_exts[i]);

riscv_single_letter_exts doesn't contain S or U, is this patch still required?

Alistair

> +            char lower = qemu_tolower(riscv_single_letter_exts[i]);
> +            switch (lower) {
> +                case 's':
> +                case 'u':
> +                    /*
> +                    * The 's' and 'u' letters shouldn't show up in ISA strings as
> +                    * they're not extensions, but they should show up in MISA.
> +                    * Since we use these letters interally as a pseudo ISA string
> +                    * to set MISA it's easier to just strip them out when
> +                    * formatting the ISA string.
> +                    */
> +                    break;
> +
> +                default:
> +                    *p++ = lower;
> +                    break;
> +            }
>          }
>      }
>      *p = '\0';
> --
> 2.37.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
