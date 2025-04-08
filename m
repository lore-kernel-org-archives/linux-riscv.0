Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726AFC369A2
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWh3CLVaEpYcanavzvnqeBjtdBOrSlF9BR3/YVQ7Zu8=; b=OFqC8/24/bk9ck
	AGtpv4iHqck2IinBOfhQW2QRZN6AEIJ5vTIl4byoCoPdo9TNeOtPflCIQNRyj68q1qENzpmsGy4WT
	Qny4S4t8dzm8P2LJkqX/oMzSYXEU8GEo//yHjVmtcCRFnOtoxsezxRn0XzZ4hDsMQQzdB1Z6y8IRD
	DT+AXMi5EfK0BQ4MdlZvC9/lciZ/xjNqxWa+mgqoh+FdM0Jf2GgVcbc0+PlQ9hc7pFqhwE46JxiNT
	LuD83cDauecnUhnEhR31MKt4AFWR8fXOxN3Lh8iW2hjR4e5gEpv9GdAkhxrTx8oxkFemPm8+nilpW
	QKMnbIMbj4KRan2pzZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2AyC-00000004dwv-2BBL;
	Tue, 08 Apr 2025 15:34:36 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2AwS-00000004ddn-495L
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 15:32:50 +0000
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5f720c717so688910985a.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 08:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126366; x=1744731166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWauuTJeBzaymof//eJXjaRWpKnp1jf/EjofEIpiwYM=;
        b=jhRnOTgAT1LHHZ1OtzfHvykaixj8jy0vq6wSo+Ftw/2gcS1v3BzNzOV+UFm66o9SYz
         TZhRdwnbQ2Ji9P4zWQdfFIAVwyLcZSsnWCs7o5RiIplkDCXK2gXqJ9alRWPSittURcUL
         9TYhNxs23Dn7meQuBdh191vVzivez+0voThr2hRuWqHwEpkOA/adr21PHpwZLhCQQjwB
         0H+q6tg6IpvtFaP8F31F5QGsgDvI1o5j3QuyfOC6ar1he6BX41Hm7rH8AnKzBqzc6V0g
         sGFC46RyruJbCX1+KzpKLJjaZtcrXBo2vWqVGIJEoP7CsQaz9utFMvreyV9QaW9Q0Eu2
         azFg==
X-Gm-Message-State: AOJu0Yzv5XOMs5tvw17suAIS+atLv4G7vVJFR8k4a2r9f4+6RRd9HIaF
	74yVwzqVFH8GFnMR4Qw3ShIn/Ue8Tk7+H4K7uZrLPm6ve18gkMUrI9f+pbqX
X-Gm-Gg: ASbGnctfdGu/s6O9t7KXVD3JXuflNqbc9eJ5RFW7bwXmFxpBp64dvl1Z5XbIvZgqYUp
	XHhAhOvljkGhbyK5fXk7epB9eSV/rE5fUsFv7ZJkpicJZbc3xJlG3htGgBZdFDoGvneQNo9WokT
	4BgIpixb11X3I7hFLBqbapDfdnbOj1Y2UqWJjB71wZuxZ9P1qI/ntSkgVtlg0gtTm1dt4vnpnnd
	fuGD80VGq4v7r0ASXTGkOtGh9neRPcnMDymsrxVfWPmy2PUI9JUep6CkfTBowIqnVIib27EnUW2
	XmxzDZoWKnnsNteCDEtQKg8/6lRA/Qa5wQvlQA3vKtUUHa1KdzqdcsET949l0b3IfNwOl5fsH1a
	kVWmj6l7uoGerOFEfUej3Eg==
X-Google-Smtp-Source: AGHT+IHOGvE0ZkLqiYPllwQDJt+YjTzcJOMxFC6olrjWWyTs09Ej5IitlJCdrpmUxLh7NnUmB9rmfg==
X-Received: by 2002:a05:620a:3188:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c794058078mr516147985a.4.1744126365825;
        Tue, 08 Apr 2025 08:32:45 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76eab1667sm768198985a.117.2025.04.08.08.32.45
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:32:45 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c592764e24so609768685a.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 08:32:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:7b1:7508:9f38 with SMTP id
 af79cd13be357-7c79408f423mr535672885a.16.1744126365206; Tue, 08 Apr 2025
 08:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com> <CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com>
 <20250408-f3b5934a901bd24c1c800c8d@orel>
In-Reply-To: <20250408-f3b5934a901bd24c1c800c8d@orel>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 17:32:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8DBfGNVkeY6qLv-eN=mjRKW3qUbXvEn7sLdA61QRfcA@mail.gmail.com>
X-Gm-Features: ATxdqUEIXkJ1UlfuGjCURKEaeAQ-DRYOLV6RZU-cgg5H0QCozGCmtM1pj04if88
Message-ID: <CAMuHMdW8DBfGNVkeY6qLv-eN=mjRKW3qUbXvEn7sLdA61QRfcA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed tests
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr, 
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_083249_024427_788E8DD4 
X-CRM114-Status: GOOD (  30.76  )
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

Hi Andrew,

On Tue, 8 Apr 2025 at 15:03, Andrew Jones <ajones@ventanamicro.com> wrote:
> On Tue, Apr 08, 2025 at 02:25:12PM +0200, Geert Uytterhoeven wrote:
> > On Tue, 4 Mar 2025 at 13:02, Andrew Jones <ajones@ventanamicro.com> wrote:
> > > Allow skipping scalar and vector unaligned access speed tests. This
> > > is useful for testing alternative code paths and to skip the tests in
> > > environments where they run too slowly. All CPUs must have the same
> > > unaligned access speed.
> > >
> > > The code movement is because we now need the scalar cpu hotplug
> > > callback to always run, so we need to bring it and its supporting
> > > functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >
> > > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> >
> > >  static int __init check_unaligned_access_all_cpus(void)
> > >  {
> > >         int cpu;
> > >
> > > -       if (!check_unaligned_access_emulated_all_cpus())
> > > +       if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> > > +           !check_unaligned_access_emulated_all_cpus()) {
> > >                 check_unaligned_access_speed_all_cpus();
> > > -
> > > -       if (!has_vector()) {
> > > +       } else {
> > > +               pr_info("scalar unaligned access speed set to '%s' by command line\n",
> > > +                       speed_str[unaligned_scalar_speed_param]);
> > >                 for_each_online_cpu(cpu)
> > > -                       per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > > -       } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> > > -                  IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> > > +                       per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> > > +       }
> > > +
> > > +       if (!has_vector())
> > > +               unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > > +
> > > +       if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> > > +           !check_vector_unaligned_access_emulated_all_cpus() &&
> > > +           IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> > >                 kthread_run(vec_check_unaligned_access_speed_all_cpus,
> > >                             NULL, "vec_check_unaligned_access_speed_all_cpus");
> > > +       } else {
> > > +               pr_info("vector unaligned access speed set to '%s' by command line\n",
> > > +                       speed_str[unaligned_vector_speed_param]);
> >
> > On SiPEED MAiXBiT, unaligned_scalar_speed_param is zero, and it prints:
> >
> >     scalar unaligned access speed set to '(null)' by command line
>
> Thanks, Geert. I think unaligned_scalar_speed_param is likely 1 in this
> case and we should be printing 'emulated', but I neglected to add that
> string to speed_str[].

No, the value of unaligned_scalar_speed_param is zero.

> I'll fix this too.

Thanks!

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
