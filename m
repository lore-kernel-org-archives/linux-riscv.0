Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEA9C87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 13:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIt51/j8rVpBu0qMd/AQ45vuKmJ4CpSBf8p5NQ/bs6w=; b=cGGqnhrxyjx6ws
	VlwnSkMTDlFgQF9LJDMqRPs01OUgZ9NmOySWrOI5VsqtOGFn/logxnA/V7K3n3Y+Pu6gpmTb5KM5b
	1doRibgCsNrFNlkTvh+D60yyH6aWmtTIDjsdNlKHlJM08td9uvQJ1hw/8a8zxunU0CQrji9FT4YC1
	nbfcUTef0BzWyamstOjJ/0zinzs3fVbY6qRBbbUhTiDdJyd/Qye3l7KT6XO+Ox35aqSTvqzrNZJzw
	Lfp7GXmbpPZ21EK9RfnedvnA3CEt5gOql7siYjuv665fUza05WDw9jPN08E1tkWAhHK0gde/crRo4
	pDgRmVWh0UWRf/a8TG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhT6J-00000003fZm-3iqk;
	Thu, 31 Jul 2025 13:13:39 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhT6C-00000003fXo-3dsD
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 13:13:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 510B4443F0;
	Thu, 31 Jul 2025 13:13:25 +0000 (UTC)
Message-ID: <84a22949-88e7-4a6c-b14e-e8448724b034@ghiti.fr>
Date: Thu, 31 Jul 2025 15:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ACPI: support BGRT table on RISC-V
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, kernel@vger.kernel.org,
 Yunhui Cui <cuiyunhui@bytedance.com>, linux-acpi@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org,
 Len Brown <lenb@kernel.org>
References: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
 <20250729131535.522205-3-heinrich.schuchardt@canonical.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250729131535.522205-3-heinrich.schuchardt@canonical.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvdgrtdegmegtvggttdemuddtjeefmegslegsgeemjegvtgekmeehhegutdemgehfvddvmeeigedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmedutdejfeemsgelsgegmeejvggtkeemheehugdtmeegfhdvvdemieegvdekpdhhvghloheplgfkrfggieemvdgrtdegmegtvggttdemuddtjeefmegslegsgeemjegvtgekmeehhegutdemgehfvddvmeeigedvkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohephhgvihhnrhhitghhrdhstghhuhgthhgrrhguthestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehprghulhdrfigrl
 hhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhmrdgtohhmpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_061333_040939_DCD65E4A 
X-CRM114-Status: GOOD (  15.40  )
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

Hi Heinrich,

On 7/29/25 15:15, Heinrich Schuchardt wrote:
> The BGRT table is used to display a vendor logo in the boot process.
> There is no good reason why RISC-V should not support it.
>
> Remove the architecture constraint.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>   drivers/acpi/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index 7bc40c2735ac0..2b83c91bb1a78 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -460,7 +460,7 @@ config ACPI_HED
>   
>   config ACPI_BGRT
>   	bool "Boottime Graphics Resource Table support"
> -	depends on EFI && (X86 || ARM64 || LOONGARCH)
> +	depends on EFI
>   	help
>   	  This driver adds support for exposing the ACPI Boottime Graphics
>   	  Resource Table, which allows the operating system to obtain


@Rafael: If you ack this patch, I can merge that for 6.17 as I haven't 
sent my PR yet, just let me know!

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
