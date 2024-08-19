Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65810C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 16:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2DcQZIy3IqjV0L9aB1PBw4NaE1QoYFPvf0cbpEyM3o=; b=IvbzIpwRMBHvlO
	ogh/iN+dRWrOLqvvk2QnoC/VEUw9Nf3XowQxpSUmFTxdbLy00nyA7NMgAjGxxjSvaod6RKmj4W0Fd
	GcUeulihfY41PbHmqdSzL4WTm+EyvpK+vZN89W0I101uP52P8w5WNbxGRc3yV99Cz0YX1WR0PWvFS
	f55uyxVa29dBKUVmsQWUtHX0F158FTGKF6k3XiYI8kOpizvlvwWVWtQ2ks+2iE5rcKHRLKjjUxiqe
	wVgKOR+zafgWLe6/Akgnt1YKHapvpkegfDxq2a0fTR17RahRSy/h0KpckIR0xLFut5ZUfaEKEKRt9
	KqcVCBrbZDkmgI0tijrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4z9-000000026W3-1IS9;
	Mon, 19 Aug 2024 16:11:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4yR-000000026MW-2New;
	Mon, 19 Aug 2024 16:11:17 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WncvR3GBnz67MmR;
	Tue, 20 Aug 2024 00:08:03 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E4F51400DB;
	Tue, 20 Aug 2024 00:11:06 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 19 Aug
 2024 17:11:06 +0100
Date: Mon, 19 Aug 2024 17:11:04 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel
	<anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/4] cpuidle: psci: Simplify with scoped for each OF
 child loop
Message-ID: <20240819171104.0000625c@Huawei.com>
In-Reply-To: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
References: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_091115_783430_0152C20F 
X-CRM114-Status: GOOD (  17.43  )
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

On Fri, 16 Aug 2024 17:09:28 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Looks fine,
FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

If you are bored, the pr_err() at end of here seems like it should be

return dev_err_probe(pdev->dev, ret, "failed to create CPU PM domains\n");

But that's obviously completely unrelated!


> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index ea28b73ef3fb..146f97068022 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -142,7 +142,6 @@ static const struct of_device_id psci_of_match[] = {
>  static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> -	struct device_node *node;
>  	bool use_osi = psci_has_osi_support();
>  	int ret = 0, pd_count = 0;
>  
> @@ -153,15 +152,13 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>  	 * Parse child nodes for the "#power-domain-cells" property and
>  	 * initialize a genpd/genpd-of-provider pair when it's found.
>  	 */
> -	for_each_child_of_node(np, node) {
> +	for_each_child_of_node_scoped(np, node) {
>  		if (!of_property_present(node, "#power-domain-cells"))
>  			continue;
>  
>  		ret = psci_pd_init(node, use_osi);
> -		if (ret) {
> -			of_node_put(node);
> +		if (ret)
>  			goto exit;
> -		}
>  
>  		pd_count++;
>  	}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
