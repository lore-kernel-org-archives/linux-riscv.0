Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39636C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 08:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvYBu1v5GRePQOUcz/OjxXgg0/rRytC3JkhAlA/dz3w=; b=gpDz3t83qHCfRx
	RzO9fZtK5GHuFDEgeVe851CgpPKh5bvC90dwOxzj5Z2CVgGM0TC+k0fCeN7cXZAhCdFQs6ebAmTCx
	Zdt1mHirERnzsEjur74Dh2W/NdFc7zQya53fUupeC4x61vaYJT7QEXKXPhjLyfPWyvHplmjtU2OYi
	ZN/doF3Vdp+bWBkmx25FIOxH+HoaujLhVCejvM/DYh+1XRXCexnRX3G3jx+XbmPRID9KliKO3wUJk
	XrMCLzUdcgn3H0otjeiWdUBUHYMiQW25yQHuAZWgARTTXJtmFkvwmfqFYC1T5qzbsHyYQbsfHW5dH
	+oxUWnw2m1MxYdEi+wPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD0Su-00El3F-4p; Thu, 27 Jan 2022 08:49:12 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD0Sp-00El0b-Jz
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 08:49:10 +0000
Received: by mail-ua1-f46.google.com with SMTP id n15so3438582uaq.5
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 00:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tiYQ03BGYl3eFh9sLWDt0ZrzOmKrMYMSVnNiMqCKOig=;
 b=uGcpZn8LU6XAKnhRIzumPAnuVkUyNhc1NsF/i8orxl5/Lppcp8O9CONHijU6+fZmOv
 0ARskPjl4djPlWXc1nIgtd0arQqFf0fVoevMdKBbGthprQGvek8TL98xDfav4KWnslN8
 hdhBVxHRxxcOKaqOOZ9aFBlVyngdkWuP9j1egQGFR8z0sfKvN1aFDYONR6ehsoqISR9R
 f4Cuhv6Y7GM4Sm0odbgzmJZrFAr7rZI29VT2ed2+1VNyg7PGZhpAdA+3Vx8/Tq369d24
 nF1Oo/xsxbx/W4Tr2sYoDSgFaY2A4nkNnlSJ0rVxL4rtOAmBjXsF8NKbBxoOcjSoRuom
 ktZg==
X-Gm-Message-State: AOAM5307T+yR/Pn89suYEne2EgBiZjDp51wbNwiOkfDpioWyL3hfLR3C
 MxtCwbVc7o4HMUJS+TXDe9Kqbkhx8/XB1sBY
X-Google-Smtp-Source: ABdhPJyKvuKhBkNPL6Gox0FS1DuAv3VXBfjjNZnMQAtr9gK4nNTq/OkwQRygH54cfZrtMLcykx7nxQ==
X-Received: by 2002:a67:c802:: with SMTP id u2mr1130765vsk.52.1643273345928;
 Thu, 27 Jan 2022 00:49:05 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id n8sm442186vke.24.2022.01.27.00.49.04
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 00:49:05 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id w206so1373896vkd.10
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 00:49:04 -0800 (PST)
X-Received: by 2002:a1f:5d84:: with SMTP id r126mr1015757vkb.33.1643273344756; 
 Thu, 27 Jan 2022 00:49:04 -0800 (PST)
MIME-Version: 1.0
References: <20220120090918.2646626-1-atishp@rivosinc.com>
 <20220120090918.2646626-7-atishp@rivosinc.com>
 <1AA3005C-E9C8-4E4B-900D-DD48B37CEA41@jrtc27.com>
 <CAOnJCUKJmHv2Rs3=FR3LjiZqvM5uxcVeZ3D5xRSbEeDFCeS9=Q@mail.gmail.com>
 <CAMuHMdW+ZO0=Qc8NCWujZUq=L-LZJpcd7oZo4MxRFYMmcURXVQ@mail.gmail.com>
 <CAMuHMdXq7OQJL6H7=JRnDTR6p+AD0o2Ctjn806XZQZ9PYjvepg@mail.gmail.com>
 <CAOnJCU+AVS5Js4ZXmUubTqwU5Ye-9_z8onEE1mwhvCsOXchFBg@mail.gmail.com>
 <CAMuHMdWsX-Pg3B1=KRf9hz1JrPAbydBrANTXg4q5CFJCqHJAoA@mail.gmail.com>
In-Reply-To: <CAMuHMdWsX-Pg3B1=KRf9hz1JrPAbydBrANTXg4q5CFJCqHJAoA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jan 2022 09:48:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4VPY4KTV+0zwxUqgObGk9gj=D-aMNsTTvAFqV+67zwg@mail.gmail.com>
Message-ID: <CAMuHMdX4VPY4KTV+0zwxUqgObGk9gj=D-aMNsTTvAFqV+67zwg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220127_004907_692011_7F0AC0D3 
X-CRM114-Status: GOOD (  36.95  )
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

On Thu, Jan 27, 2022 at 9:48 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Jan 27, 2022 at 2:02 AM Atish Patra <atishp@atishpatra.org> wrote:
> > On Wed, Jan 26, 2022 at 1:10 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, Jan 26, 2022 at 9:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Wed, Jan 26, 2022 at 3:21 AM Atish Patra <atishp@atishpatra.org> wrote:
> > > > > On Tue, Jan 25, 2022 at 2:26 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> > > > > > On 20 Jan 2022, at 09:09, Atish Patra <atishp@rivosinc.com> wrote:
> > > > > > > Currently, SBI APIs accept a hartmask that is generated from struct
> > > > > > > cpumask. Cpumask data structure can hold upto NR_CPUs value. Thus, it
> > > > > > > is not the correct data structure for hartids as it can be higher
> > > > > > > than NR_CPUs for platforms with sparse or discontguous hartids.
> > > > > > >
> > > > > > > Remove all association between hartid mask and struct cpumask.
> > > > > > >
> > > > > > > Reviewed-by: Anup Patel <anup@brainfault.org> (For Linux RISC-V changes)
> > > > > > > Acked-by: Anup Patel <anup@brainfault.org> (For KVM RISC-V changes)
> > > > > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > >
> > > > > I am yet to reproduce it on my end.
> > > > > @Geert Uytterhoeven: can you please try the below diff on your end.
> > > >
> > > > Unfortunately it doesn't fix the issue for me.
> > > >
> > > > /me debugging...
> > >
> > > Found it: after this commit, the SBI_EXT_RFENCE_REMOTE_FENCE_I and
> > > SBI_EXT_RFENCE_REMOTE_SFENCE_VMA ecalls are now called with
> > > hmask = 0x8000000000000001 and hbase = 1 instead of hmask = 3 and
> > > hbase = 0.
> > >
> > > cpuid 1 maps to  hartid 0
> > > cpuid 0 maps to hartid 1
> > >
> > >     __sbi_rfence_v02:364: cpuid 1 hartid 0
> > >     __sbi_rfence_v02:377: hartid 0 hbase 1
> > >     hmask |= 1UL << (hartid - hbase);
> > >
> > > oops
> > >
> > >     __sbi_rfence_v02_call:303: SBI_EXT_RFENCE_REMOTE_FENCE_I hmask
> > > 8000000000000001 hbase 1
> > >
> >
> > Ahh yes. hmask will be incorrect if the bootcpu(cpu 0) is a higher
> > hartid and it is trying to do a remote tlb flush/IPI
> > to lower the hartid. We should generate the hartid array before the loop.
> >
> > Can you try this diff ? It seems to work for me during multiple boot
> > cycle on the unleashed.
> >
> > You can find the patch here as well
> > https://github.com/atishp04/linux/commits/v5.17-rc1
>
> Thanks, that fixes the issue for me.

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
