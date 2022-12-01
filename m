Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DA9C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 03:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INRORGLE2z1MAjVKdTCNhYGwgO5/4cl/CKKMN8HomCI=; b=udQSV2Ft+RI9EY
	J1d8D2pM05ZboBEqRqx4PM6WY3Eqtf1vNQKB3N084kG/rVKeYaG89AWEwhjOeqsYOXabJgX0jq3Ra
	XF3GpEuD88NhN0XGIK3FMi+uHRLmTWqbu2s0QWaOWSN3ldOOu4LRmuTr0StUA+WFphcq6YDo1eqI/
	/S9jsvzm3CNWLYEc2DAO3NQxW2wFPw619jW3vY4O6AEeUIOqwsYmXi1JGqq/0aApNS1PGEqTiEGyO
	+NTSh4qKgQx4jVj49FkPsQpxTTo8OQYEjbs/h36sHQ/QaCkG05dgyqFH9E918M4Tk+QiXpZPL0LBx
	FDpYMde96xN1degrPvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ah5-004Pzh-Q2; Thu, 01 Dec 2022 03:57:03 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ah1-004PuN-69
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 03:57:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7A30524E13A;
	Thu,  1 Dec 2022 11:56:28 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 11:56:28 +0800
Received: from [192.168.125.96] (113.72.147.18) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 11:56:28 +0800
Message-ID: <e0cf51d3-ba58-36a7-5c70-1d070e5fb12a@starfivetech.com>
Date: Thu, 1 Dec 2022 11:56:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 3/4] soc: starfive: Add StarFive JH71XX pmu driver
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-4-walker.chen@starfivetech.com> <Y3giSQ0YccyY2tVk@spud>
 <95b05ac3-31a9-50dc-8eeb-eb3a9f883a6b@starfivetech.com>
 <Y4CkVnmdEhCsyckH@wendy>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <Y4CkVnmdEhCsyckH@wendy>
X-Originating-IP: [113.72.147.18]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_195659_669484_D1FCF41B 
X-CRM114-Status: GOOD (  58.95  )
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

On 2022/11/25 19:17, Conor Dooley wrote:
> On Fri, Nov 25, 2022 at 06:04:59PM +0800, Walker Chen wrote:
>> On 2022/11/19 8:24, Conor Dooley wrote:
>> > On Fri, Nov 18, 2022 at 09:32:15PM +0800, Walker Chen wrote:
> 
>> >> +void starfive_pmu_hw_event_turn_off(u32 mask)
>> >> +{
>> >> +	pmu_writel(mask, HW_EVENT_TURN_OFF_MASK);
>> >> +}
>> >> +EXPORT_SYMBOL(starfive_pmu_hw_event_turn_off);
>> > 
>> > Where are the users for these exports? Also, should they be exported as
>> > GPL?
>> > 
>> > Either way, what is the point of the extra layer of abstraction here
>> > around the writel()?
>> 
>> The two export functions are only prepared for GPU module. But accordint to
>>  the latest information, it seems that there is no open source plan for GPU. 
>> So the two functions will be drop in next version of patch.
> 
> That's a shame!

Need to comply with certain commercial terms.

> 
>> >> +static int starfive_pmu_get_state(struct starfive_power_dev *pmd, bool *is_on)
>> >> +{
>> >> +	struct starfive_pmu *pmu = pmd->power;
>> >> +
>> >> +	if (!pmd->mask) {
>> >> +		*is_on = false;
>> >> +		return -EINVAL;
>> >> +	}
>> >> +
>> >> +	*is_on = __raw_readl(pmu->base + CURR_POWER_MODE) & pmd->mask;
>> > 
>> > Is there a specific reason that you are using the __raw variants here
>> > (and elsewhere) in the driver?
>> 
>> Will use unified function '__raw_readl' and '__raw_writel'
> 
> No no, I want to know *why* you are using the __raw accessors here. My
> understanding was that __raw variants are unbarriered & unordered with
> respect to other io accesses.
> 
> I do notice that the bcm driver you mentioned uses the __raw variants,
> but only __raw variants - whereas you use readl() which is ordered and
> barriered & __raw_readl().
> 
> Is there a reason why you would not use readl() or readl_relaxed()?

Your question led me to deeply understand the usage of these io accessors.
__raw_readl / __raw_writel denotes native byte order, no memory barrier.
readl / writel do guarantee the byte order with barrier, ensure that previous writes are done.
Seem that non-raw accessors are more safe.

> 
>> >> +
>> >> +	return 0;
>> >> +}
>> >> +
>> >> +static int starfive_pmu_set_state(struct starfive_power_dev *pmd, bool on)
>> >> +{
>> >> +	struct starfive_pmu *pmu = pmd->power;
>> >> +	unsigned long flags;
>> >> +	uint32_t val;
>> >> +	uint32_t mode;
>> >> +	uint32_t encourage_lo;
>> >> +	uint32_t encourage_hi;
>> >> +	bool is_on;
>> >> +	int ret;
>> >> +
>> >> +	if (!pmd->mask)
>> >> +		return -EINVAL;
>> >> +
>> >> +	if (is_on == on) {
>> >> +		dev_info(pmu->pdev, "pm domain [%s] is already %sable status.\n",
>> >> +				pmd->genpd.name, on ? "en" : "dis");
>> > 
>> > Am I missing something here: you've just declared is_on, so it must be
>> > false & therefore this check is all a little pointless? The check just
>> > becomes if (false == on) which I don't think is what you're going for
>> > here? Or did I miss something obvious?
>> 
>> Sorry, indeed I missed several lines of code. It should be witten like this:
>> 	ret = jh71xx_pmu_get_state(pmd, &is_on);
>>         if (ret) {
>>                 dev_dbg(pmu->pdev, "unable to get current state for %s\n",
>>                         pmd->genpd.name);
>>                 return ret;
>>         }
> 
> Heh, this looks more sane :)
> 
>> 
>>         if (is_on == on) {
>>                 dev_dbg(pmu->pdev, "pm domain [%s] is already %sable status.\n",
>>                         pmd->genpd.name, on ? "en" : "dis");
>>                 return 0;
>>         }
>> 
>> > 
>> >> +		return 0;
>> >> +	}
>> >> +
>> >> +	spin_lock_irqsave(&pmu->lock, flags);
>> >> +
>> >> +	if (on) {
>> >> +		mode = SW_TURN_ON_POWER_MODE;
>> >> +		encourage_lo = SW_MODE_ENCOURAGE_EN_LO;
>> >> +		encourage_hi = SW_MODE_ENCOURAGE_EN_HI;
>> >> +	} else {
>> >> +		mode = SW_TURN_OFF_POWER_MODE;
>> >> +		encourage_lo = SW_MODE_ENCOURAGE_DIS_LO;
>> >> +		encourage_hi = SW_MODE_ENCOURAGE_DIS_HI;
>> >> +	}
>> >> +
>> >> +	__raw_writel(pmd->mask, pmu->base + mode);
>> >> +
>> >> +	/* write SW_ENCOURAGE to make the configuration take effect */
>> >> +	__raw_writel(SW_MODE_ENCOURAGE_ON, pmu->base + SW_ENCOURAGE);
>> > 
>> > Is register "sticky"? IOW, could you set it in probe and leave this mode
>> > always on? Or does it need to be set every time you want to use this
>> > feature?
>> 
>> These power domain registers need to be set by other module according to the
>> specific situation. 
>> For example some power domains should be turned off via System PM mechanism
>> when system goes to sleep, 
>> and then they are turned on when system resume.
> 
> I was just wondering if SW_MODE_ENCOURAGE_ON would retain it's value
> during operation or if it had to be written every time. It's fine if
> that's not the case.

Writing SW_MODE_ENCOURAGE_ON (0xFF) to SW_ENCOURAGE register, the purpose is to reset the 
state machine which is going to parse instruction sequence. It has to be written every time. 

> 
>> >> +	__raw_writel(encourage_lo, pmu->base + SW_ENCOURAGE);
>> >> +	__raw_writel(encourage_hi, pmu->base + SW_ENCOURAGE);
>> >> +
>> >> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> >> +
>> >> +	if (on) {
>> >> +		ret = readl_poll_timeout_atomic(pmu->base + CURR_POWER_MODE, val,
>> >> +						val & pmd->mask, DELAY_US,
>> >> +						TIMEOUT_US);
>> >> +		if (ret) {
>> >> +			dev_err(pmu->pdev, "%s: failed to power on\n", pmd->genpd.name);
>> >> +			return -ETIMEDOUT;
>> >> +		}
>> >> +	} else {
>> >> +		ret = readl_poll_timeout_atomic(pmu->base + CURR_POWER_MODE, val,
>> >> +						!(val & pmd->mask), DELAY_US,
>> >> +						TIMEOUT_US);
>> > 
>> > Could you not just decide the 3rd arg outside of the readl_poll..() and
>> > save on duplicating the wait logic here?
>> 
>> Seems that the readl_poll..() can only be called in two cases 
>> because the CURR_POWER_MODE register is read to val and then operation with mask every time.
>> 
> 
> I'm sorry, I completely forgot that read*_poll..() actually not actually
> a function. Please ignore this comment!
> 
>> >> +static int starfive_pmu_probe(struct platform_device *pdev)
>> >> +{
>> >> +	struct device *dev = &pdev->dev;
>> >> +	struct device_node *np = dev->of_node;
>> >> +	const struct starfive_pmu_data *entry, *table;
>> >> +	struct starfive_pmu *pmu;
>> >> +	unsigned int i;
>> >> +	uint8_t max_bit = 0;
>> >> +	int ret;
>> >> +
>> >> +	pmu = devm_kzalloc(dev, sizeof(*pmu), GFP_KERNEL);
>> >> +	if (!pmu)
>> >> +		return -ENOMEM;
>> >> +
>> >> +	pmu_base = pmu->base = devm_platform_ioremap_resource(pdev, 0);
>> >> +	if (IS_ERR(pmu->base))
>> >> +		return PTR_ERR(pmu->base);
>> >> +
>> >> +	/* initialize pmu interrupt  */
>> >> +	pmu->irq = platform_get_irq(pdev, 0);
>> >> +	if (pmu->irq < 0)
>> >> +		return pmu->irq;
>> >> +
>> >> +	ret = devm_request_irq(dev, pmu->irq, starfive_pmu_interrupt,
>> >> +			       0, pdev->name, pmu);
>> >> +	if (ret)
>> >> +		dev_err(dev, "request irq failed.\n");
>> >> +
>> >> +	table = of_device_get_match_data(dev);
>> >> +	if (!table)
>> >> +		return -EINVAL;
>> >> +
>> >> +	pmu->pdev = dev;
>> >> +	pmu->genpd_data.num_domains = 0;
>> >> +	i = 0;
>> >> +	for (entry = table; entry->name; entry++) {
>> >> +		max_bit = max(max_bit, entry->bit);
>> >> +		i++;
>> >> +	}
>> > 
>> > This looks like something that could be replaced by the functions in
>> > linux/list.h, no? Same below.
>> 
>> Nowadays other platforms on linux mainline mostly write in this way or write like this: 
>> 	for (i = 0; i < num; i++) {
>> 		...
>> 		pm_genpd_init(&pmd[i]->genpd, NULL, !is_on);
>> 	}
> 
> That's not what this specific bit of code is doing though, right? You're
> walking jh7110_power_domains to find the highest bit. I was looking at what
> some other drivers do, and took a look at drivers/soc/qcom/rpmhpd.c
> where they know the size of this struct at compile time & so can do
> store the number of power domains in the match data. If you did that,
> you could use a loop like the one other platforms use.
> 
>> >> +	if (!pmu->genpd)
>> >> +		return -ENOMEM;
>> >> +
>> >> +	pmu->genpd_data.domains = pmu->genpd;
>> >> +
>> >> +	i = 0;
>> >> +	for (entry = table; entry->name; entry++) {
> 
> And it's the same here. By now, you should know how many power domains
> you have, no?
> 
> Anyways, as I said before I don't know much about this power domain
> stuff, it's just that these two loops seem odd.

About the usage of loop, I took a look at other platforms like drivers/soc/qcom/rpmhpd.c,
maybe that way is simpler and easier to understand. I will try to change to that looping in next version.

> 
>> >> +		struct starfive_power_dev *pmd = &pmu->dev[i];
>> >> +		bool is_on;
>> >> +
>> >> +		pmd->power = pmu;
>> >> +		pmd->mask = BIT(entry->bit);
>> >> +		pmd->genpd.name = entry->name;
>> >> +		pmd->genpd.flags = entry->flags;
>> >> +
>> >> +		ret = starfive_pmu_get_state(pmd, &is_on);
>> >> +		if (ret)
>> >> +			dev_warn(dev, "unable to get current state for %s\n",
>> >> +				 pmd->genpd.name);
> 
>> >> +static const struct starfive_pmu_data jh7110_power_domains[] = {
>> > 
>> > Is this driver jh7110 only or actually jh71XX? Have you just started out
>> > by implementing one SoC both intend to support both?
>> 
>> JH7110 is our first SoC, probably the next generation of SoC jh7120 still
>> use this controller driver.
>> Maybe now the naming for JH71XX is not very suitable.
> 
> Right. My question was more about if this supported the JH7100 too, but
> I saw from your answer to Emil that it won't. I don't have a preference
> as to whether you call it jh71xx or jh7110, I'll leave that up to
> yourselves and Emil. This particular struct should still be called
> `jh7110_power_domains` though since it is particular to this SoC, no
> matter what you end up calling the file etc.

Emil has gave me a good suggestion.

> 
>> > I don't know /jack/ about power domain stuff, so I can barely review
>> > this at all sadly.
> 
>> Thank you for taking the time to review the code, you helped me a lot.
>> Thank you so much.
> 
> No worries, looking forward to getting my board :)
> 
Have you purchased a VisionFive 2 board online?  Do you need the shopping link ? 
https://forum.rvspace.org/t/how-to-purchase-visionfive-2/665

Best Regards,
Walker Chen




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
