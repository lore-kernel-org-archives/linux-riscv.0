Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330FAC87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFZaJ4Bh7OjvBzKHdvVz4ubB1GAs9xqQ9oIeXsQt878=; b=drNmdClN3IZbfM
	nZnAUhQzwEU2gi6LDNP/3E9MEryt5gDp1G48ng7/nsG5h/LXIZPAoU846zNnWAegVkwgKe1xdpS4t
	osJYjdn/JX24/Aakt2Trn4283+9KUsXl0RR1I6p7CfBhoxUU2G6dCp5MyxIdOU4/qcg2HN9MuVlT9
	QGcWPhqJOwQHw7BIEsxZK9ze4oJ/rAZzF1+SVmPywvRBU6u9W8jjVdOpHTVgBdiQ3HAZcFZ0fZQsq
	7IXo1kx0WnMnXwemNOaprlB5Hpa2nR5l7lPznrae5/igo5SDbR7SnkjLlelzSB6nd29O8nWz9kvSt
	TNVXQjlDVMa7tqPt1i1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU11-00000003nAm-3KrR;
	Thu, 31 Jul 2025 14:12:15 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTLH-00000003hAY-1NTa
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 13:29:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A28D42D7F;
	Thu, 31 Jul 2025 13:29:01 +0000 (UTC)
Message-ID: <d339833a-5784-407b-816d-ab95d35fbe4e@ghiti.fr>
Date: Thu, 31 Jul 2025 15:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: cacheinfo: init cache levels via fetch_cache_info
 when SMP disabled
To: liu.xuemei1@zte.com.cn, paul.walmsley@sifive.com
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, spersvold@gmail.com,
 sudeep.holla@arm.com, mikisabate@gmail.com, robh@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250725104425229ArF_W-F7CmscLJKs0yoiQ@zte.com.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250725104425229ArF_W-F7CmscLJKs0yoiQ@zte.com.cn>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvrgdtgeemtggvtgdtmedutdejfeemsgelsgegmeejvggtkeemheehugdtmeegfhdvvdemieegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtdegmegtvggttdemuddtjeefmegslegsgeemjegvtgekmeehhegutdemgehfvddvmeeigedvkedphhgvlhhopeglkffrggeimedvrgdtgeemtggvtgdtmedutdejfeemsgelsgegmeejvggtkeemheehugdtmeegfhdvvdemieegvdekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehlihhurdiguhgvmhgvihduseiithgvrdgtohhmrdgtnhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvv
 ggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepshhpvghrshhvohhlugesghhmrghilhdrtghomhdprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehmihhkihhsrggsrghtvgesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_062907_513768_84E6A2B6 
X-CRM114-Status: GOOD (  15.51  )
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

Hi Jessica,

On 7/25/25 04:44, liu.xuemei1@zte.com.cn wrote:
> From: Jessica Liu <liu.xuemei1@zte.com.cn>
>
> As described in commit 1845d381f280 ("riscv: cacheinfo: Add back
> init_cache_level() function"), when CONFIG_SMP is undefined, the cache
> hierarchy detection needs to be performed through the init_cache_level(),
> whereas when CONFIG_SMP is defined, this detection is handled during the
> init_cpu_topology() process.
>
> Furthermore, while commit 66381d36771e ("RISC-V: Select ACPI PPTT drivers")
> enables cache information retrieval through the ACPI PPTT table, the
> init_of_cache_level() called within init_cache_level() cannot support cache
> hierarchy detection through ACPI PPTT. Therefore, when CONFIG_SMP is
> undefined, we directly invoke the fetch_cache_info function to initialize
> the cache levels.
>
> Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
> ---
>   arch/riscv/kernel/cacheinfo.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 26b085dbdd07..f81ca963d177 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -73,7 +73,11 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,
>
>   int init_cache_level(unsigned int cpu)
>   {
> -	return init_of_cache_level(cpu);
> +#ifdef CONFIG_SMP
> +	return 0;
> +#endif
> +
> +	return fetch_cache_info(cpu);
>   }
>
>   int populate_cache_leaves(unsigned int cpu)


Is the current behaviour wrong or just redundant? If wrong, I'll add a 
Fixes tag to backport, otherwise I won't.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
