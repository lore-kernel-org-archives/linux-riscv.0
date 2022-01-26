Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825B1C28CF5
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqJNyxkaaXCz3TEeOLyqz1+BxZ650F4Mi7W5V6b1yig=; b=x1wwyGP0p9K+EF
	bZcWa6FkiUR/eJT9CYeTskuEsBPoChdI6G65jbj9bBEeqEr0Las/APPXyPImoCdzSnx7Ys4kSP1+f
	+EDD6aubBzOzW5bnBsPr/IHsij5j6DkC06n2rBxJUSEHf4EHdkTsvqrLjjlpxd98ElfAlTsPZSswo
	cg2YVLTQeR5bOgPtU7cjCu/EgWqmzWsSpd9h6NebPRrz1gFBmbTPrCj7Ly7NRYVb1jJwDXZiDvTcx
	Guj1eHC/gl7cf5wpib39rs9wcxUt1l+H8IXhT1lPVZCyttzhdphoayQAy3ElnpUqUVpWGDUN1iDYX
	EeDNMRRFoHxieBC2KmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCeK3-00As3n-1Y; Wed, 26 Jan 2022 09:10:35 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCeK0-00As1z-KH
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 09:10:33 +0000
Received: by mail-vk1-f180.google.com with SMTP id b77so13939675vka.11
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 01:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmTPz9PmKhTaX5wyRQ+ebsEt337fwh+gbpdxl24qCZk=;
 b=3Vza4FpvkYOoPXKRgKsvFgyBWnVhKDucdl2Xm0pFmBCJoCzKCBmYqS8P/r3Zhm31oZ
 ra/NThHch7mfLUEmar2JTEnfLYmtRQGHjCUrcLajoBkbTu47tsEktnhDvsjZskuTMvTE
 4JqMs+m+IozZNxolbMULi778ML5iGqwpSZ5XTp5QOarMhpa3GLx7oarfguSVyRTwRc4E
 3SykK+b6qurvMfTkz/9ksZ2blVzGZeSh2LFZDH469JoCHlN0k5eYgtGSxSY8IbM/wNHF
 /z+2d3H2yYW0UmpkN5nKimEx5+E4DcD7lsUccMTHmXbpS8wDkg5vi7QWXdeyrEIdzt26
 4gLw==
X-Gm-Message-State: AOAM530k0grKbSxaisvftgGksrrAObf5H3wfOye2VWsA8hcX0hJ7KWuS
 iFFaRMDO6m1S2Rk9Ff1vvZTcSuTw8b07os8D
X-Google-Smtp-Source: ABdhPJz5NHVT6G/N8Y2z19T9ObGFeQUxNQiT2hmuOp0q6rdyOeuWYDcH1THBA01JU6mME+ZNVK61ZA==
X-Received: by 2002:a05:6122:916:: with SMTP id
 j22mr795921vka.20.1643188229787; 
 Wed, 26 Jan 2022 01:10:29 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id k204sm4192634vkk.0.2022.01.26.01.10.29
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 01:10:29 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id y4so42226048uad.1
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 01:10:29 -0800 (PST)
X-Received: by 2002:a67:b009:: with SMTP id z9mr5917064vse.57.1643188229085;
 Wed, 26 Jan 2022 01:10:29 -0800 (PST)
MIME-Version: 1.0
References: <20220120090918.2646626-1-atishp@rivosinc.com>
 <20220120090918.2646626-7-atishp@rivosinc.com>
 <1AA3005C-E9C8-4E4B-900D-DD48B37CEA41@jrtc27.com>
 <CAOnJCUKJmHv2Rs3=FR3LjiZqvM5uxcVeZ3D5xRSbEeDFCeS9=Q@mail.gmail.com>
 <CAMuHMdW+ZO0=Qc8NCWujZUq=L-LZJpcd7oZo4MxRFYMmcURXVQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW+ZO0=Qc8NCWujZUq=L-LZJpcd7oZo4MxRFYMmcURXVQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jan 2022 10:10:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXq7OQJL6H7=JRnDTR6p+AD0o2Ctjn806XZQZ9PYjvepg@mail.gmail.com>
Message-ID: <CAMuHMdXq7OQJL6H7=JRnDTR6p+AD0o2Ctjn806XZQZ9PYjvepg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220126_011032_685776_D5AD79BF 
X-CRM114-Status: GOOD (  27.89  )
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

Hi Atish,

On Wed, Jan 26, 2022 at 9:28 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jan 26, 2022 at 3:21 AM Atish Patra <atishp@atishpatra.org> wrote:
> > On Tue, Jan 25, 2022 at 2:26 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> > > On 20 Jan 2022, at 09:09, Atish Patra <atishp@rivosinc.com> wrote:
> > > > Currently, SBI APIs accept a hartmask that is generated from struct
> > > > cpumask. Cpumask data structure can hold upto NR_CPUs value. Thus, it
> > > > is not the correct data structure for hartids as it can be higher
> > > > than NR_CPUs for platforms with sparse or discontguous hartids.
> > > >
> > > > Remove all association between hartid mask and struct cpumask.
> > > >
> > > > Reviewed-by: Anup Patel <anup@brainfault.org> (For Linux RISC-V changes)
> > > > Acked-by: Anup Patel <anup@brainfault.org> (For KVM RISC-V changes)
> > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> > I am yet to reproduce it on my end.
> > @Geert Uytterhoeven: can you please try the below diff on your end.
>
> Unfortunately it doesn't fix the issue for me.
>
> /me debugging...

Found it: after this commit, the SBI_EXT_RFENCE_REMOTE_FENCE_I and
SBI_EXT_RFENCE_REMOTE_SFENCE_VMA ecalls are now called with
hmask = 0x8000000000000001 and hbase = 1 instead of hmask = 3 and
hbase = 0.

cpuid 1 maps to  hartid 0
cpuid 0 maps to hartid 1

    __sbi_rfence_v02:364: cpuid 1 hartid 0
    __sbi_rfence_v02:377: hartid 0 hbase 1
    hmask |= 1UL << (hartid - hbase);

oops

    __sbi_rfence_v02_call:303: SBI_EXT_RFENCE_REMOTE_FENCE_I hmask
8000000000000001 hbase 1

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
