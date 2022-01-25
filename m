Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE09C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 20:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQm62w+LyFDuYWYHC0/kvKg3ek57+4lW4l1ZzwbcdKw=; b=nJXGwgEeKZUYj8
	amI/N1sENPKUfbqUiup0Aw/BXxPFM3ZXBukvM3cQRB5+8MUXqBEpTeVh4KqwanvurTB23gkB50Ozm
	2Uao00tJvKN4FzS+ty8yRYK76cgK19b86dtouabRXgYVX+/WcVs9EBx21jt18Nn2mUTr137XB5TV7
	RN2TJC3SpdFow4YWPCG8Z9c2zPzU6zyuvF6BAepwLC3TljV2ip1vT8SWV1kG1sUp2pr0c0JGJDrjI
	9cX71QgFldYVMuQXEF7Ik7vFOhKmgAHGBRhK6TNZdbSxrc0EoZIfcB/TZb/3VcZ38fkDJek2Euw2k
	PbqXljre8SeTy0tKw1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCSGN-009TI9-J6; Tue, 25 Jan 2022 20:17:59 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCSGK-009THQ-OK
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 20:17:58 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id c6so65078008ybk.3
 for <linux-riscv@lists.infradead.org>; Tue, 25 Jan 2022 12:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xH4919BBQDatXV47ZV39NtXvgYYtXrd/TsEbvbZr80k=;
 b=MfklnOCQVmnZ1DGtZ/7lH8SHjstb5OvkICRH3LZOqLvcVDHKV0C4/qab9nARYCxi07
 SkqgzSsp4w8mfq9ydwKA+Pq4fo943Kkwmo7LEUszNU5r+EGEZe9b7JQskqSHPiwQ9xjS
 6+3mmdc2jub7xRbVt6HrtXDQmbjJj3kJkwuzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xH4919BBQDatXV47ZV39NtXvgYYtXrd/TsEbvbZr80k=;
 b=k3CCLtvkeWDkehLsYePECBiLDMr1/1BQXG6fdF06OTQRsq0L4nFoYB0MA5+1ewneB7
 fZaE2tIIBl8TvYxqggnRMwxEkfi8xjxIOjdRRfq5/UEZVVjkaQPuWv9wss79O9FBsTmY
 tVAhvh/3sn4yUQ4MW4O1rnqO4SE5i/DLuco0gilIV+fCP1fYY/i+A3UxY9tO38HK5Fqf
 b9sLhO2WGX0hCtt3f8D/pYjMdpwthAM7bB6E8FxAhNRMveJkPLKKRouYCUiqgcgvTqsn
 izY/RPWkPWk9dxqMWyjMDba9sqNMxmF/l3mwQ7xunNux7q4Jtx6P7jD/wNjSYMwl3W+o
 4VFA==
X-Gm-Message-State: AOAM531+UsTEPVxxsBKvEVfXNqGeaypHAJfbTCTDg76gM1934I4U0+qa
 5pbxkFiGWGnoLvTepnl62x89XAhaUAiDbz/RgFw5
X-Google-Smtp-Source: ABdhPJz4ErEQdG2kZzS4RU3R+TozqNSpTkyZlNySmm+OUFhQWBU6G++H14erGITpDeyTZi30ICVtSwClulYTDTDEhuI=
X-Received: by 2002:a25:ac9a:: with SMTP id x26mr4798915ybi.713.1643141875109; 
 Tue, 25 Jan 2022 12:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20220120090918.2646626-1-atishp@rivosinc.com>
 <20220120090918.2646626-7-atishp@rivosinc.com>
 <CAMuHMdXJoREF7jZaYWrDUjJqKUSCd82qDVaMEo7VO38ok8J-AA@mail.gmail.com>
In-Reply-To: <CAMuHMdXJoREF7jZaYWrDUjJqKUSCd82qDVaMEo7VO38ok8J-AA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 25 Jan 2022 12:17:44 -0800
Message-ID: <CAOnJCULjqeL9Q27n=g19ALbOivzid6pc_gYv6JUF4iP=64kJ-Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] RISC-V: Do not use cpumask data structure for
 hartid bitmap
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Atish Patra <atishp@rivosinc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@wdc.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_121756_907907_5E679C5D 
X-CRM114-Status: GOOD (  27.50  )
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

On Tue, Jan 25, 2022 at 12:12 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Atish,
>
> On Thu, Jan 20, 2022 at 10:12 AM Atish Patra <atishp@rivosinc.com> wrote:
> > Currently, SBI APIs accept a hartmask that is generated from struct
> > cpumask. Cpumask data structure can hold upto NR_CPUs value. Thus, it
> > is not the correct data structure for hartids as it can be higher
> > than NR_CPUs for platforms with sparse or discontguous hartids.
> >
> > Remove all association between hartid mask and struct cpumask.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org> (For Linux RISC-V changes)
> > Acked-by: Anup Patel <anup@brainfault.org> (For KVM RISC-V changes)
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> Thanks for your patch, which is now commit 26fb751ca37846c9 ("RISC-V:
> Do not use cpumask data structure for hartid bitmap") in v5.17-rc1.
>
> I am having an issue with random userspace SEGVs on Starlight Beta
> (which needs out-of-tree patches).  It doesn't always manifest
> itself immediately, so it took a while to bisect, but I suspect the
> above commit to be the culprit.
>

I have never seen one before during my testing. How frequently do you see them?
Does it happen while running anything or just idle user space results
in SEGVs randomly.

Do you have a trace that I can look into ?

> So far the Icicle looks unaffected.
>
> Do you have a clue?
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
