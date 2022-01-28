Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B55EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 08:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5d1HlYtBuIL+qxRQiWQ5vzbV2hiZP+uBXYbat2Tw1k=; b=deADKfSPX4qzLQ
	A0JynnOZFnoKwWWUP8Nf/MIf9Jb+cd6rNYqDLmhSnU+eDpgvpy1TDiSQSG1+bLUZhb3XujrkMhqUB
	BI1i7BMp79SrMgWxCp5isZnduWPNsnWCztvqKMpBzRrr8eXKhsxryIFXIiJMfDuZiq6+PVKMsUe1/
	vZqFPUtg+mg8Pf7Z8pTp6K8ClRdkasQ7yIW2J0325lBRX4I98dbLYNjU0rGrclA2gUO8MMI05EBXK
	czSiXhjE+8DTh6DP2EPKnHfGYarBzSWFd9CYoUZshZnqgrQois80s8LdGVtDIzh4xBlqlHcvshnIv
	4Gf4KPvkjSqZyo7TZ03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDN2n-0015ZD-OR; Fri, 28 Jan 2022 08:55:45 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDN2k-0015XN-K5
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 08:55:43 +0000
Received: by mail-vs1-f42.google.com with SMTP id a7so2163513vsc.6
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 00:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uy2MrDkccIj156ALaICyk+fvYR4qhgIfiYRgdsCeDKk=;
 b=TgnyskZfE8CahJxrCfgtdRDpIp2m5DM3Tx+K6y6tNIyPuninYfJ+FV11o4LhNF16Lk
 C7Qz3iacFo1LSEDtnViONvlNYplOdWC+Hn1snzbFiqGa5o58gr7vW1dphgtLtmRrz6UE
 owln/Hngbm/rtKe/V2lcfuF74UnFSfUYiw/4lYcZAwuuTEHRBImzwatqmndy4DAJSgAb
 rvZElRYabmoUuO1M0jVJiRPovPSpHYIIucdOkXj9BtDTkRzNyhm3HM6DYw5XmRZQQv+w
 Rjp5JxQFJmnlRjgE/TEJ/fXHJLLU68Hb5EMnB5X/kHdXNqyCcBRk3sYftbkkaslORwR6
 MREw==
X-Gm-Message-State: AOAM532hEQdCa3wfVdksMUhOkjiPxcvCTryD+oMqqG4McvM+xbB8XVuh
 CDhtSJhcS69gS4jPeV9iabGaRsUmrDJcG6W/
X-Google-Smtp-Source: ABdhPJw7NyXS11V7edXfpPQn+il4o4yowFCuq1vaZr5P+S5JLX5O7hl3+5wwvmUDDD2abDT0WIPgTQ==
X-Received: by 2002:a05:6102:18d:: with SMTP id
 r13mr3711979vsq.67.1643360140471; 
 Fri, 28 Jan 2022 00:55:40 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id z10sm2014074uap.14.2022.01.28.00.55.39
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 00:55:39 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id a7so2163463vsc.6
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 00:55:39 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr3329515vse.38.1643360139371;
 Fri, 28 Jan 2022 00:55:39 -0800 (PST)
MIME-Version: 1.0
References: <20220120090918.2646626-1-atishp@rivosinc.com>
 <20220120090918.2646626-7-atishp@rivosinc.com>
 <1AA3005C-E9C8-4E4B-900D-DD48B37CEA41@jrtc27.com>
 <CAOnJCUKJmHv2Rs3=FR3LjiZqvM5uxcVeZ3D5xRSbEeDFCeS9=Q@mail.gmail.com>
 <CAMuHMdW+ZO0=Qc8NCWujZUq=L-LZJpcd7oZo4MxRFYMmcURXVQ@mail.gmail.com>
 <CAMuHMdXq7OQJL6H7=JRnDTR6p+AD0o2Ctjn806XZQZ9PYjvepg@mail.gmail.com>
 <CAOnJCU+AVS5Js4ZXmUubTqwU5Ye-9_z8onEE1mwhvCsOXchFBg@mail.gmail.com>
 <CAMuHMdWsX-Pg3B1=KRf9hz1JrPAbydBrANTXg4q5CFJCqHJAoA@mail.gmail.com>
 <CAOnJCU+U0xmw-_yTEUo9ZXO5pvoJ6VCGu+jjU-Sa2MnhcAha6Q@mail.gmail.com>
 <CAMuHMdXLjjgD7j_5cm8qdL63m1SoB90O9j7YMYYrpXaH79hwJQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXLjjgD7j_5cm8qdL63m1SoB90O9j7YMYYrpXaH79hwJQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jan 2022 09:55:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWgReJmBsZtY7mamnD7FkxaVX0uV2NgJNO1cFcUf8u3HA@mail.gmail.com>
Message-ID: <CAMuHMdWgReJmBsZtY7mamnD7FkxaVX0uV2NgJNO1cFcUf8u3HA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] RISC-V: Do not use cpumask data structure for
 hartid bitmap
To: Atish Patra <atishp@atishpatra.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Atish Patra <atishp@rivosinc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@wdc.com>, 
 devicetree <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_005542_702588_1BF4AF5E 
X-CRM114-Status: GOOD (  28.53  )
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

On Fri, Jan 28, 2022 at 9:39 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Jan 28, 2022 at 1:13 AM Atish Patra <atishp@atishpatra.org> wrote:
> > On Thu, Jan 27, 2022 at 12:48 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> What about shifting hmask and adjusting hbase if a hartid is
> >> lower than the current hbase?
> >
> > That will probably work for current systems but it will fail when we have hartid > 64.
> > The below logic as it assumes that the hartids are in order. We can have a situation
> > where a two consecutive cpuid belong to hartids that require two invocations of sbi call
> > because the number of harts exceeds BITS_PER_LONG.
>
> If the number of harts exceeds BITS_PER_LONG, you always need multiple
> calls, right?
>
> I think the below (gmail-whitespace-damaged diff) should work:
>
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -249,7 +249,7 @@ static void __sbi_set_timer_v02(uint64_t stime_value)
>
>  static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
>  {
> -       unsigned long hartid, cpuid, hmask = 0, hbase = 0;
> +       unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
>         struct sbiret ret = {0};
>         int result;
>
> @@ -258,16 +258,27 @@ static int __sbi_send_ipi_v02(const struct
> cpumask *cpu_mask)
>
>         for_each_cpu(cpuid, cpu_mask) {
>                 hartid = cpuid_to_hartid_map(cpuid);
> -               if (hmask &&
> -                   (hartid < hbase || hartid >= hbase + BITS_PER_LONG)) {

Oops, I actually sent the diff against the simpler solution below,
not against the current code, but I guess you get the idea.
I can send a proper patch when agreed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
