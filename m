Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5C7C28CF5
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSEqQt40U0v4xJ68/+qb5jwEGJ8+nvNPDflC2APNvN8=; b=ayDcVOp4frmSiL
	7LlGOH7FCv4QhZ7g9pd9v5h1RszsxOA8z3P5TyLNxuPIMxj5A91MIIRGWcyFKTjmVwrRnhAelxG5t
	7nBzDzdo5xbmsjW48Squ4tIpRDRXNcx9zef93p5GOpJZKdrMCrR0z8lksNIPMT+lkpc4lRflCU/7Z
	A0tSb7b2q2tpnh3Ca58b7/4c/ZJPrFnepClEteCFwo5wtHZlGKIT2cEEXHRh6lTvO4kOmBc1yUgUU
	baVvS+QC4p5Vn2F+70kIl+etq+4YwkKxAoj1UNoZqffQjtxhaEWtMjv+ajZp3NeBg18DWJs9hOBit
	0OHOJjDJnKlbItidwX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCdg3-00Ajq6-H7; Wed, 26 Jan 2022 08:29:15 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCdfo-00Ajlo-5c
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 08:29:01 +0000
Received: by mail-vk1-f177.google.com with SMTP id v192so13912505vkv.4
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 00:28:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Ed2si8RhKLaGz8C9MuLECJIsE/v5RcDpMHVTl4zgGc=;
 b=N8AHzog6FO0ssBfBIV4J4X4PinLp3EUfhy78N4EoUaliyIodksbedeJ2bUs1pgWDUD
 HtgU/YUPoQPyhQXl2mLVOpNm8ZBYW8I8KukJxjrIoFOtvyn3U95r/pxXurhmX9ok7zah
 g7ybRll1CRwO3x9LnRllN4i3ky2gWy7dAhzWsagQbcwa9xTT90f22vulHV/nvPvQsnra
 x5/BHsZDKtbWfnh2wmBgKWgkNRwfxq/E8mhbt7P6AovPz4G8nbKxPzPE8ABYWIyN2mib
 4uEoRbUSX/gW8iegkGy9xIjwnQkGCHDPAMdJiKf5AX7sOj4Xd1YuGJZCA95iGF+9Rhx4
 PvRQ==
X-Gm-Message-State: AOAM5302oa3W8hBQ7uWWxiyOYVoNFYdBUDtGu458SUP/EsO0kb6SDPnp
 sDKZ4KmDc+LzXgrbFE7ZlwWJJ5pL+F+cbQAY
X-Google-Smtp-Source: ABdhPJwyqV0HzF9/qB60eQKBwlX1ymt8Ninf3pfkRIGlN8N/mhWNGQ5BQ58NzrS1q7lfMLnLhnRI8A==
X-Received: by 2002:a05:6122:887:: with SMTP id 7mr9430505vkf.34.1643185738372; 
 Wed, 26 Jan 2022 00:28:58 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id v71sm3273343vsv.1.2022.01.26.00.28.57
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 00:28:57 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id u6so42130998uaq.0
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 00:28:57 -0800 (PST)
X-Received: by 2002:a05:6102:a04:: with SMTP id
 t4mr3799826vsa.77.1643185737329; 
 Wed, 26 Jan 2022 00:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20220120090918.2646626-1-atishp@rivosinc.com>
 <20220120090918.2646626-7-atishp@rivosinc.com>
 <1AA3005C-E9C8-4E4B-900D-DD48B37CEA41@jrtc27.com>
 <CAOnJCUKJmHv2Rs3=FR3LjiZqvM5uxcVeZ3D5xRSbEeDFCeS9=Q@mail.gmail.com>
In-Reply-To: <CAOnJCUKJmHv2Rs3=FR3LjiZqvM5uxcVeZ3D5xRSbEeDFCeS9=Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jan 2022 09:28:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW+ZO0=Qc8NCWujZUq=L-LZJpcd7oZo4MxRFYMmcURXVQ@mail.gmail.com>
Message-ID: <CAMuHMdW+ZO0=Qc8NCWujZUq=L-LZJpcd7oZo4MxRFYMmcURXVQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220126_002900_235647_3A49C337 
X-CRM114-Status: GOOD (  24.98  )
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

On Wed, Jan 26, 2022 at 3:21 AM Atish Patra <atishp@atishpatra.org> wrote:
> On Tue, Jan 25, 2022 at 2:26 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> > On 20 Jan 2022, at 09:09, Atish Patra <atishp@rivosinc.com> wrote:
> > > Currently, SBI APIs accept a hartmask that is generated from struct
> > > cpumask. Cpumask data structure can hold upto NR_CPUs value. Thus, it
> > > is not the correct data structure for hartids as it can be higher
> > > than NR_CPUs for platforms with sparse or discontguous hartids.
> > >
> > > Remove all association between hartid mask and struct cpumask.
> > >
> > > Reviewed-by: Anup Patel <anup@brainfault.org> (For Linux RISC-V changes)
> > > Acked-by: Anup Patel <anup@brainfault.org> (For KVM RISC-V changes)
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>

> I am yet to reproduce it on my end.
> @Geert Uytterhoeven: can you please try the below diff on your end.

Unfortunately it doesn't fix the issue for me.

/me debugging...

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
