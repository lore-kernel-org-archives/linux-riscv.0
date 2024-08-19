Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFD9C52D6F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 16:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=609qnKNp5szTr+PbvKK+hTF1h5x/GwMozIAq9tbTvqQ=; b=ocjEPioxl1Drqy
	OLQvib8ZC7/bPaBvjuziADehNK4MF3Vyj4i665yYWQQSwxNnDqCG+/L1Tamfqb5Gw5keQuo6dVd3k
	ru6cIODxdWibgIUBkblsFH98rJ4rLLAfSuqU/9s11qdMdj44PcQ3Cp+XoC4dS8y4zAm0ZWzaXxNOl
	pwFSXE8mLcYlIloeacUCmyq1KODXFWl5MWvy34YntqqwGzZVbdrT2SBgTah6No1UqXnT8bOBtZF3Q
	7E6bNIacwqDxuyD2otnEp/4jkfqRmv1te49ndsPbTVwXaviSD615WU1gwvT1P6RG7wo1tgEyipZjp
	s3MSaO3xN8XXwbhHCTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg57f-000000028LY-2oql;
	Mon, 19 Aug 2024 16:20:47 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg56w-000000028Cb-3ohx;
	Mon, 19 Aug 2024 16:20:04 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wnd5d3wgkz6K6j4;
	Tue, 20 Aug 2024 00:16:53 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id B69C51400DD;
	Tue, 20 Aug 2024 00:19:56 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 19 Aug
 2024 17:19:56 +0100
Date: Mon, 19 Aug 2024 17:19:54 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel
	<anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/4] cpuidle: riscv-sbi: Use scoped device node handling
 to simplify error paths
Message-ID: <20240819171954.0000600d@Huawei.com>
In-Reply-To: <20240819171313.00004677@Huawei.com>
References: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
	<20240816150931.142208-2-krzysztof.kozlowski@linaro.org>
	<20240819171313.00004677@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_092003_281728_ED81F8BA 
X-CRM114-Status: GOOD (  21.54  )
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

On Mon, 19 Aug 2024 17:13:13 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Fri, 16 Aug 2024 17:09:29 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> > Obtain the device node reference with scoped/cleanup.h to reduce error
> > handling and make the code a bit simpler.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>  
> The original code looks suspect. See below.

Whilst here...  Why not do similar for state_node to avoid
the delayed return check.
Existing code
	{
		state_node = of_get_cpu_state_node(cpu_node, i - 1);
		if (!state_node)
			break;

		ret = sbi_dt_parse_state_node(state_node, &states[i]);
		of_node_put(state_node);

		if (ret)
			//another bug here on holding cpu_node btw.
			return ret;
		pr_debug("sbi-state %#x index %d\n", states[i], i);
	}
//I think only path to this is is early break above.
	if (i != state_count) {
		ret = -ENODEV;
		goto fail;
	}
Can be something like

	{
		struct device_node *state_node __free(device_node) =
			= of_get-cpu_State_nod(cpu_node, i - 1);
	
		if (!state_node)
			return -ENODEV;

		ret = sbi_dt_parse_state_node(state_node, &states[i]);
		if (ret)
			return ret;

		pr_debug("sbi-state %#x index %d\n", states[i], i);
	}
		

> 
> > ---
> >  drivers/cpuidle/cpuidle-riscv-sbi.c | 21 +++++++--------------
> >  1 file changed, 7 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> > index a6e123dfe394..5bb3401220d2 100644
> > --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> > +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> > @@ -8,6 +8,7 @@
> >  
> >  #define pr_fmt(fmt) "cpuidle-riscv-sbi: " fmt
> >  
> > +#include <linux/cleanup.h>
> >  #include <linux/cpuhotplug.h>
> >  #include <linux/cpuidle.h>
> >  #include <linux/cpumask.h>
> > @@ -236,19 +237,16 @@ static int sbi_cpuidle_dt_init_states(struct device *dev,
> >  {
> >  	struct sbi_cpuidle_data *data = per_cpu_ptr(&sbi_cpuidle_data, cpu);
> >  	struct device_node *state_node;
> > -	struct device_node *cpu_node;
> >  	u32 *states;
> >  	int i, ret;
> >  
> > -	cpu_node = of_cpu_device_node_get(cpu);
> > +	struct device_node *cpu_node __free(device_node) = of_cpu_device_node_get(cpu);
> >  	if (!cpu_node)
> >  		return -ENODEV;
> >  
> >  	states = devm_kcalloc(dev, state_count, sizeof(*states), GFP_KERNEL);
> > -	if (!states) {
> > -		ret = -ENOMEM;
> > -		goto fail;
> > -	}
> > +	if (!states)
> > +		return -ENOMEM;
> >  
> >  	/* Parse SBI specific details from state DT nodes */
> >  	for (i = 1; i < state_count; i++) {
> > @@ -264,10 +262,8 @@ static int sbi_cpuidle_dt_init_states(struct device *dev,
> >  
> >  		pr_debug("sbi-state %#x index %d\n", states[i], i);
> >  	}
> > -	if (i != state_count) {
> > -		ret = -ENODEV;
> > -		goto fail;
> > -	}
> > +	if (i != state_count)
> > +		return -ENODEV;
> >  
> >  	/* Initialize optional data, used for the hierarchical topology. */
> >  	ret = sbi_dt_cpu_init_topology(drv, data, state_count, cpu);  
> The handling of error ret from here doesn't free the node.
> 
> Bug or something subtle I'm missing?
> 
> If it's a bug, then fixes tag.

> 
> 
> > @@ -277,10 +273,7 @@ static int sbi_cpuidle_dt_init_states(struct device *dev,
> >  	/* Store states in the per-cpu struct. */
> >  	data->states = states;
> >  
> > -fail:
> > -	of_node_put(cpu_node);
> > -
> > -	return ret;
> > +	return 0;
> >  }
> >  
> >  static void sbi_cpuidle_deinit_cpu(int cpu)  
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
