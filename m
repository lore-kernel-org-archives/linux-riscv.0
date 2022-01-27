Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C286C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRVbP8V45b2JYRiCSwJXkr2fZH50tcWnBFUcbVJu478=; b=cdjGvtz71JhJ7e
	vxqOVdhMcpWSz+ouJfoZlekoqvhZsSaBDdXsBBbjPMQr6Q32q3SxkKslhQtLJNnaXrnUIzpuBHSUH
	XqGwzUURNIKTzHK3ZPDm15vA6dF6c6z9kzj1kvT2hzHAT/9FBSAbwXGA9sRjxg48y0GkrlcLq876P
	Vp1e/Ze51cSkwS2bwvU/QJrauO9bRRSHH09tR3JazF0vE6vU5lmLfyjtVlobZEAdlR0HpBqnxvQpb
	dR+dnaWm8f1STWJ7pfo+qK7WfBC6PsdI7ZUibuhmmUWjNYfSV6zcbwb8zy61SdtOGjnMomBlVlQsH
	u230xf0teOg+OOZQmRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD1fC-00F3a2-OC; Thu, 27 Jan 2022 10:05:58 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD1cg-00F2iS-Uf
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 10:03:24 +0000
Received: by mail-ua1-f47.google.com with SMTP id u76so3767487uau.3
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 02:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lAMLR34jNozPdnmP0r/qrkgc/xZXHX189n9STko6+vo=;
 b=iH60MuRhi1aQ8SCEaN+6m3qFSe+PoIhotntSUDOyyum3xpegZzuseCvMUgRAp8AvNG
 dlmm80mXGp6oksbk6WwnUigbiLqd4IG+sz9aTPbOegLAcsEw7b0rR80MKn5b1OesAmTk
 nFQ4Glpa9hmNAY/IsUop/BNBA8ldnMj8MAYtW/6O7ND0OeZRJpwBshwbAFkDLj9AFQlu
 84yZnrc7u84xt6MqxKlteKmevA2gGC3JddGPsObAjhI5rcQ/nDlr/mGYrwhGi0Xm1TYW
 fWzC8tdALmUuFscy8VvVX2GjtC8w1VU8+3lxLQOAdcHhCfFZd2MUkvt5WEQGy/AJP0hK
 SwAQ==
X-Gm-Message-State: AOAM532q5XBXutaCrcLqTtJT5fPSABvke5haQxxatuqm/HJ1iVAEptus
 dttfcLzWDcy4yzWGcPd4uzbIDEZ71QTS5w==
X-Google-Smtp-Source: ABdhPJwO2I3ltd1rnyk1CK6B/iK505V1rcHyWIcZJVBXnD30C8tyHPURx0AulDZ5qGKmzMz+4wWa+A==
X-Received: by 2002:a05:6102:c8a:: with SMTP id
 f10mr1386025vst.82.1643277801122; 
 Thu, 27 Jan 2022 02:03:21 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171])
 by smtp.gmail.com with ESMTPSA id r4sm450004vsk.2.2022.01.27.02.03.20
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 02:03:20 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id z15so1475370vkp.13
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 02:03:20 -0800 (PST)
X-Received: by 2002:a05:6122:c8f:: with SMTP id
 ba15mr1132842vkb.39.1643277799973; 
 Thu, 27 Jan 2022 02:03:19 -0800 (PST)
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
Date: Thu, 27 Jan 2022 11:03:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyjSrXNCAO8V8pajXW5ts29p==p2J1HnPPoo3-8osKbA@mail.gmail.com>
Message-ID: <CAMuHMdXyjSrXNCAO8V8pajXW5ts29p==p2J1HnPPoo3-8osKbA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220127_020323_039052_61EE6279 
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

Hi Atish,

On Thu, Jan 27, 2022 at 9:48 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Jan 27, 2022 at 2:02 AM Atish Patra <atishp@atishpatra.org> wrote:
 > Ahh yes. hmask will be incorrect if the bootcpu(cpu 0) is a higher
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
>
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c

> > @@ -345,13 +368,21 @@ static int __sbi_rfence_v02(int fid, const
> > struct cpumask *cpu_mask,
> >       unsigned long arg4, unsigned long arg5)
> >  {
> >   unsigned long hartid, cpuid, hmask = 0, hbase = 0;
> > - int result;
> > + int result, index = 0, max_index = 0;
> > + unsigned long hartid_arr[NR_CPUS] = {0};
>
> That's up to 256 bytes on the stack. And more if the maximum
> number of cores is increased.

I.e. 4 KiB with the proposed increase to 256 CPUs, as mentioned in
https://lore.kernel.org/all/CAAhSdy2xTW0FkwvS2dExOb7q1dVruFfTP_Vh_jWju+yi7thCeA@mail.gmail.com/

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
