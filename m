Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468CCC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  2 May 2022 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pozNv/b4jxkaylaBRHlyqzy1q/43C5SwZgswgDzFeec=; b=Ln4xKqh983LAKe
	y2yGUsQulCpQ4kIo/79vmtRGeFgxMCtcyjDYC+Q7jpiCaKrcT+t+twZYFl903WOZQxAl+mcgH9yOt
	/jUYaQqVfMe+M8l/Dc6huDeqja4uyi/Olobo4yeT5PIGdu1MrDbsHvK5bkU1a5kR0lJEVVjjQ68B2
	J1if+IfZGg76Fkz3gqYDAtbht6NJLih4s61aRx1otb7BTrLhczFo9cNUnxKhG8FUnO/xvRT85xGl6
	rmC7ptUJbfm9pJfU/SkvAAM1Fi5H7WPwMfdM7itlPCrMNkvmRkgTeNcIWPHx9ma2nTiKsjRR4HIaz
	A8xECwWlBjn0ZldIq7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlVd4-001CEP-G9; Mon, 02 May 2022 12:58:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlVd0-001CBf-JN
 for linux-riscv@lists.infradead.org; Mon, 02 May 2022 12:58:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id t6so19505386wra.4
 for <linux-riscv@lists.infradead.org>; Mon, 02 May 2022 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LGTpKyhSR7OzEqxyLhvzEvcqb2OZLN4taRRVLhqfpFA=;
 b=kaFAgp8VAqMt4byoj/r82wU0Wb5c3RcJvQM/f81UlrLowfA24Q54JVX0oyKcfNVPC9
 uqbXja7VyulwmaXkV0om/o8tq7MDoHhMQJgLZrOKHC2rLUrlw8RmFzVj8ZII7ALHOfk+
 YbJ9OUpzHaFG8SZXRFHvj8h7aKqlvhY7C09lKbQiCFEUAdCvz6UqIbJQ8/AgSG68iULD
 Hglr2xUxCqn1sg4Wa2aQzaGM+7ZeZkjZs6/0L/V/ghUQrpMb4YffVBBogKh+xjuQ5Rb7
 2Z1hKHoWcFr2BLcLNg0aMwvvRBpQMXufPDygty+A4/83wcRL2uaCKxwFnxSUxWcdMNbc
 sXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LGTpKyhSR7OzEqxyLhvzEvcqb2OZLN4taRRVLhqfpFA=;
 b=kKJ+f+7huYYkoXH3JOqSCQ0ghVYh34TUTHkiYPg6Qd6EyR16Hu6MHvakhIzRvROSsy
 7Q/dPa1heJ6yZNkjxSzdRso0QZ1QhMp0B9me3dCoUCnHaZmM7MTR+x65uifq3joQJtPj
 9TeEYfUANy9P+UNREkRLO6b6q1e4XpvYB6amTvWrQjOuzMsJ0e9jM776JTfkjl/EKGwd
 YkmS/obRw2TpNxySiY47sbJ9crq6MvKu+q0mqmg65AJLzQYxdJyU4PbiFJ7IEkO3w0Th
 WEAH2K0J/Ctk2x7G3gLvpsj9ITJKXttSOBZFV90loOcp5jOVc/xv0v87zhVtOTl0eHMs
 vWgQ==
X-Gm-Message-State: AOAM533CWsAF2Tg++mvL0k25dJ0bChYJj56dQ3slu+NGnmM3Sy1wAfG6
 8Q23EtRP2roSufq2iLBknG5sMRBNB5GblOttpzlr3Q==
X-Google-Smtp-Source: ABdhPJzgRZaZslgwPVZ/ses9J+LKKtlj3nMYfxqKjEpqYuRD5INOsLa9/EHdJRwdFF4nt8DypKGsgBzs+HoAHf3sxdY=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr9295283wrz.690.1651496288984; Mon, 02
 May 2022 05:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220502125015.1345312-1-niklas.cassel@wdc.com>
 <20220502125015.1345312-3-niklas.cassel@wdc.com>
In-Reply-To: <20220502125015.1345312-3-niklas.cassel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 May 2022 18:27:57 +0530
Message-ID: <CAAhSdy10S3M+EySUBfq13TVqv3N2B5ihYE50tbNWz3NmH0XzUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: Don't output a bogus mmu-type on a no MMU
 kernel
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_055814_764294_4B534033 
X-CRM114-Status: GOOD (  21.71  )
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

On Mon, May 2, 2022 at 6:20 PM Niklas Cassel <niklas.cassel@wdc.com> wrote:
>
> Currently on a 64-bit kernel built without CONFIG_MMU, /proc/cpuinfo will
> show the current MMU mode as sv57.
>
> While the device tree property "mmu-type" does have a value "riscv,none" to
> describe a CPU without a MMU, since commit 73c7c8f68e72 ("riscv: Use
> pgtable_l4_enabled to output mmu_type in cpuinfo"), we no longer rely on
> device tree to output the MMU mode. (Not even for CONFIG_32BIT.)
>
> Therefore, instead of readding code to look at the "mmu-type" device tree
> property, let's continue with the existing convention to use fixed values
> for configurations where we don't determine the MMU mode at runtime.
>
> Add a new fixed value for !CONFIG_MMU in order to output the correct
> MMU mode in cpuinfo.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index ccb617791e56..ecfb3e85ffb2 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -138,6 +138,7 @@ static void print_mmu(struct seq_file *f)
>  {
>         char sv_type[16];
>
> +#ifdef CONFIG_MMU
>  #if defined(CONFIG_32BIT)
>         strncpy(sv_type, "sv32", 5);
>  #elif defined(CONFIG_64BIT)
> @@ -148,6 +149,9 @@ static void print_mmu(struct seq_file *f)
>         else
>                 strncpy(sv_type, "sv39", 5);
>  #endif
> +#else
> +       strncpy(sv_type, "none", 5);
> +#endif /* CONFIG_MMU */
>         seq_printf(f, "mmu\t\t: %s\n", sv_type);
>  }
>
> --
> 2.35.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
