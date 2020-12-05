Return-Path: <SRS0=5ZKR=FJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA5FC433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 13:44:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6055523107
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 13:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6055523107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0TImkcmOo3VUPftgHsk30bkdeBlklSTFucNV3gn19xM=; b=pcSaFvXQ+wbMt7h72kPLjO4sg
	fLDD8r59cCCekbgKj3xt3V6j/jFdSF+IyIELQCUDYtdDs2pI8qJNKZcKrt6b0lGYW1A/maWJmbfxu
	i+OUIaNgwYYks2B3sM3hf/EGdU8aE2iyu3IeoOfv84pFc2eRYcgf/sxKZS8bi2HX/grIT+12PaF1U
	zGbgz5KNJjGWkECnLF7F193gQdEKEbI4UfpwYDCXkAj+3Fap3GAl3Trp5zEZDr+ZYAdji2b1TwY37
	RAvajJXGBH6KqK7pOdaYR2GkMWII1mOG9diltCUHM6KKnYqaq5ci7bbz2FIvASlZWKHl9k65H+6RC
	lvMRlBuHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klXqj-0007P1-7C; Sat, 05 Dec 2020 13:43:45 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klXqf-0007Og-HA
 for linux-riscv@lists.infradead.org; Sat, 05 Dec 2020 13:43:42 +0000
Received: by mail-qv1-xf41.google.com with SMTP id k3so4232820qvz.4
 for <linux-riscv@lists.infradead.org>; Sat, 05 Dec 2020 05:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7V54Z/5Mr/xxZxoJa6ftBYvRndPF7BKH8GwvUe0W1jo=;
 b=nNe87USGiI5TXREYkoGvoEOqxnFeogR6rh+mcbxhir4ObpT9e7AokThh+c+w3ffXD6
 M49MBBrH2tTaQ2B/XzKpMt9KTTSaWxmb5ZGL5W4WSayvK8E92czfLckqGCPG81DwNuBV
 vlpGa6vdxIN7dknt76sod5Nri8oNnv8shGqoJgWBDwH1SsceR6gQtGELM3riabxWfkDX
 vvyMrOODthd0vjj0WUbvvD88Kqy2NFYFklWJiKzblUosrHQooLXmPnsbMrbCkulvxHu/
 PzM7Hx3ApImG7JG2GmPH65JrpMVzw0IpNiE3pL10QOZ30z2B38+92ZOSNGxjslJFE/cH
 /Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7V54Z/5Mr/xxZxoJa6ftBYvRndPF7BKH8GwvUe0W1jo=;
 b=gkrHkOmGsYF0RTIyB3MsN9hNAEtb1Z6qtAVd+6S4PmlqDVd2HDZKHcAERc6s4MJUAX
 c91JwP2oM1G0roqsg8JB7VJpgLiw4x2Zih/pvricMLhsNZCuzZROPVyiolBKZKfDBynl
 jNfumZ6ZycxrX2ozZnK/i5BUsK2pZIzRamAGxdfv3bs46GTxT2qo5FjtMiwkFS95T2Rk
 LheFZr9YsghYaCzx1zagmYo9PC8LhL2Baxx1Iiv8IEe0xoDwX6m86HItL+RpkuCdTgpr
 t4Bh+wyNff6bUKZwbobo6Ehvna3HcSPgISjfoBdAiF0QNYnb1wd+d7yUdkpgViu7UOXQ
 MDQQ==
X-Gm-Message-State: AOAM530UYUmPMZo0ZfQNgEfgMprATtMq2/l+QXBdFmEnxK9KVVWjh9F1
 3ehmKJ1nc60DF6deq5vpZcI=
X-Google-Smtp-Source: ABdhPJwyIeonJaI/FDnQ3n3MDma2rUmE/Kfsw0jOlKbN/08tEtNoFDPIVd613z6xf+DOoONjAZjHvA==
X-Received: by 2002:a0c:fa4f:: with SMTP id k15mr11346192qvo.62.1607175818286; 
 Sat, 05 Dec 2020 05:43:38 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id r14sm8098427qtu.25.2020.12.05.05.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 05:43:37 -0800 (PST)
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
 <20201202032500.206346-12-damien.lemoal@wdc.com>
 <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
 <d9aec92299e5f427aaf5c5e892194e27006f8bbc.camel@wdc.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <3ef543a8-5709-d653-e347-78faa08f81d2@gmail.com>
Date: Sat, 5 Dec 2020 08:43:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d9aec92299e5f427aaf5c5e892194e27006f8bbc.camel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_084341_710269_11319EFA 
X-CRM114-Status: GOOD (  47.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/5/20 2:43 AM, Damien Le Moal wrote:
> Hi Stephen,
> 
> Thank you for the review. I will address all your comments.
> I just have a few questions below.
> 
> On Fri, 2020-12-04 at 22:19 -0800, Stephen Boyd wrote:
>> Quoting Damien Le Moal (2020-12-01 19:24:50)
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 2daa6ee673f7..3da9a7a02f61 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3822,6 +3822,22 @@ W:       https://github.com/Cascoda/ca8210-linux.git
>>>   F:     Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
>>>   F:     drivers/net/ieee802154/ca8210.c
>>>   
>>>
>>>
>>>
>>> +CANAAN/KENDRYTE K210 SOC CLOCK DRIVER
>>> +M:     Damien Le Moal <damien.lemoal@wdc.com>
>>> +L:     linux-riscv@lists.infradead.org
>>> +L:     linux-clk@vger.kernel.org (clock driver)
>>
>> Is this needed? I think we cover all of drivers/clk/ and bindings/clock
>> already.
> 
> I was not sure about that so I added the entry. Will remove it.
> 
>>
>>> +S:     Maintained
>>> +F:     Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
>>> +F:     drivers/clk/clk-k210.c
>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>> index 88ac0d1a5da4..f2f9633087d1 100644
>>> --- a/arch/riscv/Kconfig.socs
>>> +++ b/arch/riscv/Kconfig.socs
>>> @@ -29,6 +29,8 @@ config SOC_CANAAN
>>>          select SERIAL_SIFIVE if TTY
>>>          select SERIAL_SIFIVE_CONSOLE if TTY
>>>          select SIFIVE_PLIC
>>> +       select SOC_K210_SYSCTL
>>> +       select CLK_K210
>>
>> Any reason to do this vs. just make it the default?
> 
> I do not understand here... Just selecting the drivers needed for the SoC here.
> Is there any other way of doing this ?
> 
> [...]
>>> +
>>> +       while (true) {
>>> +               reg = readl(pll->lock);
>>> +               if ((reg & mask) == mask)
>>> +                       break;
>>> +
>>> +               reg |= BIT(pll->lock_shift + K210_PLL_CLEAR_SLIP);
>>> +               writel(reg, pll->lock);
>>
>> Is this readl_poll_timeout?
> 
> Oh. Yes, it is. I did not know about this function. Will change the code to use
> it.

FWIW the timeout could be incorrect since we might be configuring a
parent of ACLK. And realistically the only way this fails is if a user
has edited this file and put in invalid PLL parameters. I don't think
you gain much by adding a timeout.

>>
>>> +       }
>>> +}
>>> +
>>> +static bool k210_pll_hw_is_enabled(struct k210_pll *pll)
>>> +{
>>> +       u32 reg = readl(pll->reg);
>>> +       u32 mask = K210_PLL_PWRD | K210_PLL_EN;
>>> +
>>> +       if (reg & K210_PLL_RESET)
>>> +               return false;
>>> +
>>> +       return (reg & mask) == mask;
>>> +}
>>> +
>>> +static void k210_pll_enable_hw(struct k210_pll *pll)
>>> +{
>>> +       struct k210_pll_cfg *pll_cfg = &k210_plls_cfg[pll->id];
>>> +       unsigned long flags;
>>> +       u32 reg;
>>> +
>>> +       spin_lock_irqsave(&kcl->clk_lock, flags);
>>> +
>>> +       if (k210_pll_hw_is_enabled(pll))
>>> +               goto unlock;
>>> +
>>> +       if (pll->id == K210_PLL0) {
>>> +               /* Re-parent aclk to IN0 to keep the CPUs running */
>>> +               k210_aclk_set_selector(0);
>>> +       }
>>> +
>>> +       /* Set factors */
>>> +       reg = readl(pll->reg);
>>> +       reg &= ~GENMASK(19, 0);
>>> +       reg |= FIELD_PREP(K210_PLL_CLKR, pll_cfg->r);
>>> +       reg |= FIELD_PREP(K210_PLL_CLKF, pll_cfg->f);
>>> +       reg |= FIELD_PREP(K210_PLL_CLKOD, pll_cfg->od);
>>> +       reg |= FIELD_PREP(K210_PLL_BWADJ, pll_cfg->bwadj);
>>> +       reg |= K210_PLL_PWRD;
>>> +       writel(reg, pll->reg);
>>> +
>>> +       /* Ensure reset is low before asserting it */
>>> +       reg &= ~K210_PLL_RESET;
>>> +       writel(reg, pll->reg);
>>> +       reg |= K210_PLL_RESET;
>>> +       writel(reg, pll->reg);
>>> +       nop();
>>> +       nop();
>>
>> Are these nops needed for some reason? Any comment to add here? It's
>> basically non-portable code and hopefully nothing is inserted into that
>> writel function that shouldn't be there.
> 
> No clue... They are "magic" nops that are present in the K210 SDK from
> Kendryte. I copied that, but do not actually know if they are really needed. I
> am working without any specs for the hardware: the Kendryte SDK is my main
> source of information here. I will try to remove them or just replace this with
> a delay() call a nd see what happens.

Basically any delay should work as long as it takes more than 2
instructions ;) Of course, anything longer than that just delays startup
for no reason.

--Sean

> 
> [...]
>>> +static int k210_aclk_set_parent(struct clk_hw *hw, u8 index)
>>> +{
>>> +       if (WARN_ON(index > 1))
>>
>> Is this possible? What am I going to do as a user if this happens?
> 
> No, it is not possible. Will remove this. I could put a BUG_ON(), but I am not
> a fan this extreme.
> 
> [...]
>>> +       /*
>>> +        * in0 is the system base fixed-rate 26MHz oscillator which
>>> +        * should already be defined by the device tree. If it is not,
>>> +        * create it here.
>>
>> Are there old DTBs that don't have this? Sadface.
> 
> No, not any old DTB. Will remove that.
> 
>>
>>> +        */
>>> +       in0_clk = of_clk_get(np, 0);
>>> +       if (IS_ERR(in0_clk)) {
>>> +               pr_warn("%pOFP: in0 oscillator not found\n", np);
>>> +               hws[K210_CLK_IN0] =
>>> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
>>> +                                                  0, K210_IN0_RATE);
>>> +       } else {
>>> +               hws[K210_CLK_IN0] = __clk_get_hw(in0_clk);
>>> +       }
>>> +       if (IS_ERR(hws[K210_CLK_IN0])) {
>>> +               pr_err("%pOFP: failed to get base oscillator\n", np);
>>> +               goto err;
>>> +       }
>>> +
>>> +       in0 = clk_hw_get_name(hws[K210_CLK_IN0]);
>>> +       aclk_parents[0] = in0;
>>> +       pll_parents[0] = in0;
>>> +       mux_parents[0] = in0;
>>
>> Can we use the new way of specifying clk parents so that we don't have
>> to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
>> the core can handl that all instead of this driver.
> 
> Not sure what new way of specifying the parent you are referring to here.
> clk_hw_set_parent() ?
> 
>>
>>> +
>>> +       /* PLLs */
>>> +       hws[K210_CLK_PLL0] =
>>> +               k210_register_pll(K210_PLL0, "pll0", pll_parents, 1, 0);
>>> +       hws[K210_CLK_PLL1] =
>>> +               k210_register_pll(K210_PLL1, "pll1", pll_parents, 1, 0);
>>> +       hws[K210_CLK_PLL2] =
>>> +               k210_register_pll(K210_PLL2, "pll2", pll_parents, 3, 0);
>>> +
>>> +       /* aclk: muxed of in0 and pll0_d, no gate */
>>> +       hws[K210_CLK_ACLK] = k210_register_aclk();
>>> +
>>> +       /*
>>> +        * Clocks with aclk as source: the CPU clock is obviously critical.
>>> +        * So is the CLINT clock as the scheduler clocksource.
>>> +        */
>>> +       hws[K210_CLK_CPU] =
>>> +               k210_register_clk(K210_CLK_CPU, "cpu", "aclk", CLK_IS_CRITICAL);
>>> +       hws[K210_CLK_CLINT] =
>>> +               clk_hw_register_fixed_factor(NULL, "clint", "aclk",
>>> +                                            CLK_IS_CRITICAL, 1, 50);
>>
>> Is anyone getting these clks? It's nice and all to model things in the
>> clk framework but if they never have a consumer then it is sort of
>> useless and just wastes memory and causes more overhead.
> 
> The CPU and SRAM clocks do not have any consumer, so I could remove them (just
> enable the HW but not represent them as clocks in the driver). There is no
> direct consumer of ACLK but it is the parent of multiple clocks, including the
> SRAM clocks. So it needs to be represented as a clock and kept alive even if
> all the peripheral drivers needing it are disabled. Otherwise, the system just
> stops (SRAM accesses hang).
> 
> [...]
>>> +       ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, kcl->clk_data);
>>> +       if (ret)
>>> +               pr_err("%pOFP: add clock provider failed %d\n", np, ret);
>>> +       else
>>> +               pr_info("%pOFP: CPU running at %lu MHz\n",
>>
>> Is this important? Is there a CPUfreq driver that runs and tells us the
>> boot CPU frequency instead? Doesn't feel like we care in the clk driver
>> about this.
> 
> There is no CPU freq driver that gives this frequency that I know of. That is
> why I added the message since the driver basically just comes up using the
> default HW settings for the SoC. CPU freq speed can be changed though by
> increasing the PLL freq. Just not supporting this for now as it is tricky to
> do: the SRAM clocks depend on aclk and PLL1 and if these are not the same
> value, the system hangs (most likely because we end up with the sram banks
> running at different speeds, which the SoC cache does not like).
> 
> [...]
>>> +CLK_OF_DECLARE_DRIVER(k210_clk, "canaan,k210-clk", k210_clk_init);
>>
>> Is this needed or can this just be a plain platform driver? If something
>> is needed early for a clocksource or clockevent then the driver can be
>> split to register those few clks early from this hook and then register
>> the rest later when the platform device probes. That's what
>> CLK_OF_DECLARE_DRIVER is for. A DECLARE_DRIVER without a platform driver
>> is incorrect.
> 
> I think I can clean this up: aclk and clint clocks are needed early but others
> can likely be deferred. Will fix this up.
> 
> Thanks !
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
