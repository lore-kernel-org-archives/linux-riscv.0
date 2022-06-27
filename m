Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBB2C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYbKCukgam2ay85tMQv55uh0qdFSZv1al7tw+n91sQs=; b=h+6q5pOn3108rT
	cXbk3ZxYwTTXLtse7hHvbvrx37jBA7j33kDX08icICm0uJtcFmy/iPCl6oSSBCHQblulUfaRhhmlV
	EXvT7Wiq8PyYMz+XECZTp7V+QpZQS4Z1ZZ4T+slNyk8iD2cEJqfQE9GMnVF5YNTvjO4StnCrC+wmp
	0OjiBdisieihWGG/dLTk6pkX5ogQbvqOiddf8NXRT7hgD3ZwUSjub2ohKc1Fa2omrBDnqls6hZGjK
	93CYa8kUBGwZrqfuFrERlgIOC7Aff3dL9OV+HJKwkLiye63bpQLYCiVxqfrdlkM/N0kz1RuHW5b80
	vnFczYuhc/DrlFjZrP0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oYC-0015sa-U0; Mon, 27 Jun 2022 13:13:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oXy-0015oJ-9M; Mon, 27 Jun 2022 13:13:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1CD21758;
	Mon, 27 Jun 2022 06:12:54 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 488433F5A1;
	Mon, 27 Jun 2022 06:12:54 -0700 (PDT)
Date: Mon, 27 Jun 2022 14:12:52 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 16/20] arch_topology: Drop unnecessary check for
 uninitialised package_id
Message-ID: <Yrms1OMuSZ2GhmT7@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
 <20220621192034.3332546-17-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220621192034.3332546-17-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_061258_415086_E364F3C3 
X-CRM114-Status: GOOD (  23.14  )
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

On Tuesday 21 Jun 2022 at 20:20:30 (+0100), Sudeep Holla wrote:
> With the support of socket node parsing from the device tree and
> assigning 0 as package_id in absence of socket nodes, there is no need
> to check for invalid package_id. It is always initialised to 0 or values
> from the device tree socket nodes.
> 
> Just drop that now redundant check for uninitialised package_id.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 46fa1b70b02b..42448a5a9412 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -611,7 +611,6 @@ static int __init parse_dt_topology(void)
>  {
>  	struct device_node *cn, *map;
>  	int ret = 0;
> -	int cpu;
>  
>  	cn = of_find_node_by_path("/cpus");
>  	if (!cn) {
> @@ -633,16 +632,6 @@ static int __init parse_dt_topology(void)
>  
>  	topology_normalize_cpu_scale();
>  
> -	/*
> -	 * Check that all cores are in the topology; the SMP code will
> -	 * only mark cores described in the DT as possible.
> -	 */
> -	for_each_possible_cpu(cpu)
> -		if (cpu_topology[cpu].package_id < 0) {
> -			ret = -EINVAL;
> -			break;
> -		}
> -

Maybe it would still be good to keep this for systems with potential
errors in DT, where one forgets to add a core in cpu-map.

For example, if I modify juno.dts as follows:

--- a/arch/arm64/boot/dts/arm/juno.dts
+++ b/arch/arm64/boot/dts/arm/juno.dts
@@ -51,12 +51,9 @@ core0 {
                                        cpu = <&A53_0>;
                                };
                                core1 {
-                                       cpu = <&A53_1>;
-                               };
-                               core2 {
                                        cpu = <&A53_2>;
                                };
-                               core3 {
+                               core2 {
                                        cpu = <&A53_3>;
                                };
                        };

and miss a little core in cluster1, I would end up with an incomplete
topology: core3 would have cluster_id as -1, while all other CPUs would
have a valid value; also, core3 would have package_id = -1.

Thanks,
Ionela.

>  out_map:
>  	of_node_put(map);
>  out:
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
