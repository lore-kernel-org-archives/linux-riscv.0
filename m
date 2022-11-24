Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493A1C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 10:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdotWgW8dVMu3yT4/jXUomm6LogdP3eK3SQ76bNACs8=; b=I7w90tsA2Z3wPG
	IJSpBK9vqLDEOILFrU+knqxyMhCGBv0AjoWdJlEr4MKArOzWM9r6ijEppClg8fEn5QNoBN/HOIAzn
	pGOWzVThV+1ridQFTnKdEtOjrEH7J+hhP2CqDdWsd5HHb56ZIDH+Q36pVvRDR5c0NmWxa5YAOTffl
	hBxTz+5gjc9B2jfTn4Tlk2fj3Il1nu9qZWbBDrd4c2DnfFypO/6F1zUI9LlCvEA8s60z5Y/IhXEfz
	q1EeHgi3+HdbhnbTWhczON1jgPd8vdjcZybG8nvI4dF9aOZ0KonLwpLhbZcvitDmOtAjbNGAELbwg
	diYhhb+vt5H9ZUr8YTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9le-007nri-Ay; Thu, 24 Nov 2022 10:47:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9la-007noz-Vt
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 10:47:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id n7so1852853wrr.13
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdtUZWyW9M5SwW4fKcdbfWbLqv835trkT/YigXlBk1w=;
        b=lZRuJhU0PWoWBofvLovP0IppWpFGWN7fWZxhDO9ezc4w5caGcqd7GVbP7bCb7rAx1m
         WQ6CU4A1vpmhvvRv/MQ41imUpzdHYbhwg3dDp0rbi28alBmmwHbyXBwRq3aChs75OSDn
         cRrBdPyiuU7dJYFQtVWFi1LEgVC4mSS2oQjdxundznfY1LJUvxRqILH4ZmHrlPOswPBO
         jEcYKziqFvY3FrZ63yxBO4J0U840aXaQmAc4K6YO6KlrTgIyIecW0EnswrSdUB+3/Jmh
         cj61cpVBa/01MKcxUSm/M8X+zKHd0MycDwttn5w4VYm2g67Pq84aKg+vXL7bGEl/EnSK
         OJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdtUZWyW9M5SwW4fKcdbfWbLqv835trkT/YigXlBk1w=;
        b=D3RsIee6BFMBeMB+T+BN51AZKdOvBrx4WTAR3jJCwKeSwt8dekIzkFUwksBQqPCXbi
         zCbfK3i8TQ6oCjgezj9ubvEmXTBcFICDofsn1Spw7GQsGnluayBMkwxIzAWuEaPUrjou
         0VglDQ9BE9cUYNslSe4yDimpECVjYmO1PioRfQXCDFzzEemLRJ04Yd3dOn3g5s9s8sUK
         5Ii5oEt5UQme5Nomwh/05xCqS4cXFoifGzKFdPAMUrjC/1f82KCWGNrFpjvXPmW7VFcF
         UebTQssgWCG8WkzZfd5hQF/QDJ+vquYPfg0WCmy932Bb1EdoVCzsTk4ZQOP9IFc24Lxz
         WXAw==
X-Gm-Message-State: ANoB5pmf76LUCk2RASV/ZiJL5+5GRyfRIWFtGMbKNOVwP6OzGCYBG8gQ
	lEW/twBxpEp/WwtgPZ2LfQSIHA==
X-Google-Smtp-Source: AA0mqf7Y1aVWMReyOdtNOIWeuH3AL6Av2lChTeX2TQ4ZCkY3jMlcei8W4RANI/Yp76L7gWGL7TGKGQ==
X-Received: by 2002:adf:ebc6:0:b0:241:c6d8:be83 with SMTP id v6-20020adfebc6000000b00241c6d8be83mr12040852wrn.454.1669286855389;
        Thu, 24 Nov 2022 02:47:35 -0800 (PST)
Received: from vermeer ([145.224.92.100])
        by smtp.gmail.com with ESMTPSA id l35-20020a05600c1d2300b003cf878c4468sm5765534wms.5.2022.11.24.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:47:34 -0800 (PST)
Date: Thu, 24 Nov 2022 11:47:30 +0100
From: Samuel Ortiz <sameo@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: "Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	linux-man@vger.kernel.org, Jiatai He <jiatai2021@iscas.ac.cn>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/3] RISC-V: uapi: add HWCAP for Bitmanip/Scalar Crypto
Message-ID: <Y39Lwp4rQc3Qkl0i@vermeer>
References: <YqYz+xDsXr/tNaNu@Sun>
 <YqY0i22SdbHjB/MX@Sun>
 <Y385rS/5zDaDJ3Os@vermeer>
 <Y39AXYPFzSiBngwI@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y39AXYPFzSiBngwI@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_024739_212499_36A658C6 
X-CRM114-Status: GOOD (  23.16  )
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

On Thu, Nov 24, 2022 at 09:58:53AM +0000, Conor Dooley wrote:
> On Thu, Nov 24, 2022 at 10:30:21AM +0100, Samuel Ortiz wrote:
> > On Mon, Jun 13, 2022 at 02:46:35AM +0800, Hongren (Zenithal) Zheng wrote:
> > > diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
> > > index 46dc3f5ee99f..bfed3e5c338c 100644
> > > --- a/arch/riscv/include/uapi/asm/hwcap.h
> > > +++ b/arch/riscv/include/uapi/asm/hwcap.h
> > > @@ -22,4 +22,26 @@
> > >  #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
> > >  #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
> > >  
> > > +/*
> > > + * HWCAP2 flags - for elf_hwcap2 (in kernel) and AT_HWCAP2
> > > + *
> > > + * As only 32 bits of elf_hwcap (in kernel) could be used
> > > + * and RISC-V has reserved 26 bits of it, other caps like
> > > + * bitmanip and crypto can not be placed in AT_HWCAP
> > > + */
> > 
> > Have we agreed that multi-letter ISA extensions would use hwcap to be
> > exposed to userspace? With so many potential extensions, we could
> > quickly run out of space on AT_HWCAP2 as well.
> 
> Palmer whipped up a PoC hwprobe interface (during Plumbers I think) that
> Heiko is currently looking into - I think his motivation is misaligned
> access performance. There's a branch but I have no idea if it even
> compiles... I'm mostly waiting for whatever Heiko comes up with ;)
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=riscv-hwprobe-v1
> 
> This patchset seems to need a rebase anyway per your other reply, but I
> guess that the new proposed interface would be preferable?
I think so, yes.
Patch #1 is definitely needed regardless of which interface we pick for
exposing the ISA strings to userspace.

Cheers,
Samuel.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
