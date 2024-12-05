Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F366E7716D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 14:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SglBatEZtmZtJhRW7fPgV0ZOl2xmm95sTanS2/FXH5A=; b=vxFP1hnDOxq/NV
	IfQrbTeIj3V1n7E7ADY9kaGnIfREFj2uoaib5DyyL+la8QxC4P4x4oEgmJI3M/JFWwzK751Gu9Bnp
	w/KnVkxjPNILBlXUe1Z67zcW4gLnYI2Py2L+rEDyjmUa33agd86eOp0V7IgzlZvcoXHZn0r0Phcbq
	ZuWi0LaxO1nppvTLKz7Np6Aa7AVdELJKpPIo60xxo1U+T3KWvmdBQgX5/7S7G3f/xM1A9ShPz/34S
	bFsdTw3Zp2uStr1KlIHpBk1p3rewqPhr2vO1+urTSX1zBcbXWL/oj4zHAXWxVwio1B1oneKLOnmOi
	G79uu896wdqQ1zQUdkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJD1p-0000000GOPM-21mn;
	Thu, 05 Dec 2024 14:40:29 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJD1c-0000000GONI-35mJ
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 14:40:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC779C0008;
	Thu,  5 Dec 2024 14:40:10 +0000 (UTC)
Message-ID: <eee10593-eb0b-4660-80cf-3027d6a99435@ghiti.fr>
Date: Thu, 5 Dec 2024 15:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] cpuidle: riscv-sbi: fix device node release in early
 exit of for_each_possible_cpu
Content-Language: en-US
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20241116-cpuidle-riscv-sbi-cleanup-v3-1-a3a46372ce08@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241116-cpuidle-riscv-sbi-cleanup-v3-1-a3a46372ce08@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_064016_925621_96ECBE13 
X-CRM114-Status: GOOD (  18.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

On 16/11/2024 00:32, Javier Carrasco wrote:
> The 'np' device_node is initialized via of_cpu_device_node_get(), which
> requires explicit calls to of_node_put() when it is no longer required
> to avoid leaking the resource.
>
> Instead of adding the missing calls to of_node_put() in all execution
> paths, use the cleanup attribute for 'np' by means of the __free()
> macro, which automatically calls of_node_put() when the variable goes
> out of scope. Given that 'np' is only used within the
> for_each_possible_cpu(), reduce its scope to release the nood after
> every iteration of the loop.
>
> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Changes in v3:
> - Unwrap line (100 char width).
> - Link to v2: https://lore.kernel.org/r/20241031-cpuidle-riscv-sbi-cleanup-v2-1-aae62d383118@gmail.com
>
> Changes in v2:
> - Squash patches for mainline solution without intermediate steps.
> - Link to v1: https://lore.kernel.org/r/20241030-cpuidle-riscv-sbi-cleanup-v1-0-5e08a22c9409@gmail.com
> ---
>   drivers/cpuidle/cpuidle-riscv-sbi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index 14462c092039..0c92a628bbd4 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -504,12 +504,12 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
>   	int cpu, ret;
>   	struct cpuidle_driver *drv;
>   	struct cpuidle_device *dev;
> -	struct device_node *np, *pds_node;
> +	struct device_node *pds_node;
>   
>   	/* Detect OSI support based on CPU DT nodes */
>   	sbi_cpuidle_use_osi = true;
>   	for_each_possible_cpu(cpu) {
> -		np = of_cpu_device_node_get(cpu);
> +		struct device_node *np __free(device_node) = of_cpu_device_node_get(cpu);
>   		if (np &&
>   		    of_property_present(np, "power-domains") &&
>   		    of_property_present(np, "power-domain-names")) {
>
> ---
> base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
> change-id: 20241029-cpuidle-riscv-sbi-cleanup-e9b3cb96e16d
>
> Best regards,


Will you make a PR for this? Or should this go through the riscv tree?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
