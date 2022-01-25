Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431F2C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 20:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3bM9c0QdNJRh7hhWvxB1fF/n7DtnC2jwSVzBs5DrOI=; b=adimfVj4lLsY3A
	g0gq8Z4M6CGO6DGlWZADfGhc1wmLGBbydAcachpJeXFMh2WneZ6BXo2Qh40vK682vyEe3Ph7oO3qt
	UUiKFd7qaVOKy52OcH8AEKmgiCnlfJ0EonTnZSe9Aak4BGQNis1KTzHFLzxAUyORLFJTrdeibSHQG
	3XZpzbUnwBnTb5bKPudEhdRkvB7Q98QdUIvF5JqesPAZKuL1He5YkypC9ugeLvRyu3lDVuB56pFEz
	qkG2JCZXmd/yYMrKv0LueYcm5pLk4JOKBXwo+jc1n0BjRnCtNdlfpX60HSJawrw2dntn0bLXpqYCS
	qJcpAdWNiO/S3Vs8C/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCSIw-009TUA-MX; Tue, 25 Jan 2022 20:20:38 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCSIl-009TT3-VC
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 20:20:29 +0000
Received: by mail-pl1-f173.google.com with SMTP id c9so20446671plg.11
 for <linux-riscv@lists.infradead.org>; Tue, 25 Jan 2022 12:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1cqbsPNZ64vIJQYyE3XbIMBM01AmRJigHSuPYUkGB7E=;
 b=X+GKWSJ9kJuUor+K2V3H+iK8irreKhvI0dzGmHtTKn0FsZxLlub/yTYuNvoaqyLIeO
 L6TDLonwdVY/TVJlr6pZZSnHd68RpXvVcUtXgFs/tce+OsoDMA1YX/ANJmIorDeqx0LY
 hGz1Dblw2z+na958cuSHV+4CgC6WR2pUylNTX+umb1AMxHjo8apdcgl5ah0G7YgKS31p
 JMhGIoXoyN5C8wwnGznA2GWLDPaGSosfR57+2j/T+g/udjmB9ButLfeO3U6/3ZALZMLE
 lBMSo3r0RaMcUrfg54SBdSVaG2u2Slr7vlbsT/2NPgMMVfdZlT53jDCDNsrYAsqPfWkI
 Y59A==
X-Gm-Message-State: AOAM531+9Ciw3tS+MBktLxD/C9KSkvZfKS7KX1/bP6riCdZjPxLoYYPw
 AE5FNuBm+qpgKhd24EXHECsyL/l5u0PmSSIH
X-Google-Smtp-Source: ABdhPJzm6/jk3ZSadUBOWSszQ4kAguYDGyzkgR+ytjDUv/oDhlh1NRhevB/ruTtlCgo4wFqxwkcGbQ==
X-Received: by 2002:a17:90b:4f44:: with SMTP id
 pj4mr5257108pjb.167.1643142026326; 
 Tue, 25 Jan 2022 12:20:26 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com.
 [209.85.216.53])
 by smtp.gmail.com with ESMTPSA id 134sm9265878pfz.165.2022.01.25.12.20.25
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 12:20:26 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id r59so3241732pjg.4
 for <linux-riscv@lists.infradead.org>; Tue, 25 Jan 2022 12:20:25 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr4458394vse.38.1643141561680;
 Tue, 25 Jan 2022 12:12:41 -0800 (PST)
MIME-Version: 1.0
References: <20220120090918.2646626-1-atishp@rivosinc.com>
 <20220120090918.2646626-7-atishp@rivosinc.com>
In-Reply-To: <20220120090918.2646626-7-atishp@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jan 2022 21:12:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJoREF7jZaYWrDUjJqKUSCd82qDVaMEo7VO38ok8J-AA@mail.gmail.com>
Message-ID: <CAMuHMdXJoREF7jZaYWrDUjJqKUSCd82qDVaMEo7VO38ok8J-AA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] RISC-V: Do not use cpumask data structure for
 hartid bitmap
To: Atish Patra <atishp@rivosinc.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_122028_023110_A2109F3F 
X-CRM114-Status: GOOD (  20.85  )
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

On Thu, Jan 20, 2022 at 10:12 AM Atish Patra <atishp@rivosinc.com> wrote:
> Currently, SBI APIs accept a hartmask that is generated from struct
> cpumask. Cpumask data structure can hold upto NR_CPUs value. Thus, it
> is not the correct data structure for hartids as it can be higher
> than NR_CPUs for platforms with sparse or discontguous hartids.
>
> Remove all association between hartid mask and struct cpumask.
>
> Reviewed-by: Anup Patel <anup@brainfault.org> (For Linux RISC-V changes)
> Acked-by: Anup Patel <anup@brainfault.org> (For KVM RISC-V changes)
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks for your patch, which is now commit 26fb751ca37846c9 ("RISC-V:
Do not use cpumask data structure for hartid bitmap") in v5.17-rc1.

I am having an issue with random userspace SEGVs on Starlight Beta
(which needs out-of-tree patches).  It doesn't always manifest
itself immediately, so it took a while to bisect, but I suspect the
above commit to be the culprit.

So far the Icicle looks unaffected.

Do you have a clue?
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
