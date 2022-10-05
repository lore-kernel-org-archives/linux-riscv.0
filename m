Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F89C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3s/KmvebcS8WVLS21+OSMwtVZNxcSJLX2EDZYE4Q1KE=; b=HUG6uGwqfQSCCg
	C2Hm0tJujCj1AzfCwcCkbCRh5j7PVKBMoof54bs9eYAFJ4n0LFiT0f6bJv7ivE9KZGgGWoJmVMqmj
	v4qlrzjaqhTH/pbZNppyxd3m/Y5DxnI06o+2xieF7tK4Hbh3VXkeBmNj7zex1dI6RoW2xRI8wTuSA
	+X1UMoFSsPTdPt3GQNyn18OGP25aKhqz15dYxVzmhaWL+AWq+t1kvLykqil4jTp0YKBj2aXHrArj9
	CwzCN4zcmAEjZCHrD8OgsTed9LF8d1qTWmfUqBeDZ1EmlbG2v0jMp2hvpkEROqK76fqJWAHS1LBlB
	imJOOMn54q9I11M0v44w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og1WZ-00DaFX-OD; Wed, 05 Oct 2022 10:21:11 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og1WY-00DaEM-0U
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 10:21:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y100so21817596ede.6
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 03:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=WkUF7nsCWMrVQcZjPcJShdJ544XjXf3Wq64oN9V1KwM=;
        b=iW47KgRGaHFC17do7RlXeHlCMVmgZQVkJ4WOZiycISwH6BHkk0XYlBS3ufqhFwFpAi
         5SasslWV/lQ5k0Y2c5dsA2p2daanQEh0osc3NIRUmNwME7S0ciI1Tyu70E3ZUWgZJAl4
         IZoRxBzt4KIITsZWaoAJAazFAg1QZy2V5Okt//0Oe62mkT+aXlBuH7mav/hwlVmWQaqB
         6wR1hXMZZ3cxOg3VnX4TNbe8AfSxNaqGgGbrOzcS8PgRRAhMXCbzUvdf65n0244SKezu
         B3lM7uq0ELCLs8d9QO7CFjFyXhceIsRG4lmW2JNaFJVrwcpyZh1HgfVPuV/MB6UQCkeB
         9qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WkUF7nsCWMrVQcZjPcJShdJ544XjXf3Wq64oN9V1KwM=;
        b=hCoap5VdbyxkHfIJV+JDTnClvP5qtQP/4LmqFJ01K/ItNALekDJENEA907i5SXiMm5
         81l3Hv6vvzLtSIuN0tQjneGlyimkdHKwIkYLV3i/LRO5hMowvWT9W4bNbYoour2CPLmA
         WMwBsd+LC3bSczZo4hSAjMrplnH+Kds8xD3MVDmsoGaf28qyF4q6F7hk2dqjQ6H/RiL8
         X5nZ3KJqH+T0R4ybEK7a4eoyuNyhN534BJ0lHR9xppKLN/ugPsGoAF5WuAKdLm5skLj0
         Kai+yLwgWRtlSC0nx+PySkOv+ZSRMcLc2hiEkju8bT8JPL2YhyQrG+1A3VVN5O2wE4iH
         twBA==
X-Gm-Message-State: ACrzQf3h77+XrLv+L3PgH+hfgX3xF2uQ4YPG7KblORtO7bFWE15t3jSN
	Rtiko0m260iECW9quQ21FZm9zlq6pTUoRYOQVoE=
X-Google-Smtp-Source: AMsMyM6/e7AQ2JNXwNzTR6TshoLirQtaoB5igRP6UNCpCiTb1aLMt2J+38J0hwLyWHxuPXoMyNpmbS7V+NYupLpXcgI=
X-Received: by 2002:a05:6402:50d1:b0:452:899e:77c with SMTP id
 h17-20020a05640250d100b00452899e077cmr27499515edb.0.1664965267172; Wed, 05
 Oct 2022 03:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YzxwoELNBctbhjJb@spud> <CA+V-a8tgvF16vduoQ+ZbzTpRJUmCnN-GPQs5G8AqMOXbnznwHA@mail.gmail.com>
 <F0B6C609-6C39-4080-8F07-7FEFFAFEA993@kernel.org> <5254a42c-9233-6f9a-eff8-33324a184d20@microchip.com>
In-Reply-To: <5254a42c-9233-6f9a-eff8-33324a184d20@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Oct 2022 11:20:40 +0100
Message-ID: <CA+V-a8tS=vsTW=SvGeAjy_M9C=ZwtaWHYhdBK=XV0M9T_c3b5A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To: Conor.Dooley@microchip.com
Cc: conor@kernel.org, geert+renesas@glider.be, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, magnus.damm@gmail.com, heiko@sntech.de, 
	guoren@kernel.org, philipp.tomsich@vrull.eu, nathan@kernel.org, 
	atishp@rivosinc.com, apatel@ventanamicro.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_032110_092213_3266BA01 
X-CRM114-Status: GOOD (  14.60  )
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

Hi Conor,

On Wed, Oct 5, 2022 at 10:17 AM <Conor.Dooley@microchip.com> wrote:
>
> On 05/10/2022 09:58, Conor Dooley wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On 5 October 2022 09:44:56 IST, "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
> >> Hi Conor,
> >>
> >> Thank you for the review.
> >>
> >> On Tue, Oct 4, 2022 at 6:43 PM Conor Dooley <conor@kernel.org> wrote:
> >
> >>>> +static void cpu_dcache_wb_range(unsigned long start,
> >>>> +                             unsigned long end,
> >>>> +                             int line_size)
> >>>> +{
> >>>> +     bool ucctl_ok = false;
> >>>> +     unsigned long pa;
> >>>> +     int mhartid = 0;
> >>>> +#ifdef CONFIG_SMP
> >>>> +     mhartid = smp_processor_id();
> >>>> +#endif
> >>>
> >>> Won't this produce complaints from your if you compile with CONFIG_SMP
> >>> set?
> >>>
> >> No I dont see a build issue with SMP enabled, do you see any reason
> >> why it should fail?
> >
> > Not fail but complain about the unused variable.
> >
>
> Not unused variable, sorry but the unused 0 that it was initialised with*

No, it doesn't complain (I dont think compilers complain of such
unused assignments, maybe I'm wrong). BTW I am using GCC 9.4.0. Do you
think I need to update it?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
