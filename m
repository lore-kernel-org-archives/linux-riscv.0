Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76771C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 23:22:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4437F20774
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 23:22:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="26f5oUrZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fAOOWOgb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4437F20774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tiZM75FZ1HdUMnpQ8iWxUpor9S7JpgYiUDbTLWMyya8=; b=26f5oUrZtZBLfDA9FO/gHjtwS
	R9iU+SRQu3o3xzBG8yKW9KPZ4qGrWkpL/+bAArw6K5cnjREzvZGrOmQIMrG2bZU2TWG15f2ZQhyHq
	RsAUlvSgl8RvBhm87p7MY01N8Wg0essMN42LuClYNDbTemtjMtiiNYA6XWyC53ddRac2JyFIGvjHq
	OHRq+bu5l6sAiB0lCAkfBUBvBUhhWTAzzPSpdAGgaYeb4Hlj8zbKjsvPxm4WHV6SWZGHcu7lr5jI9
	oUB7OAIRWkWkbcltceCvzuyHOn1/ZbRVF1GDtWWYNCaGus4Ztpq54yBrIBAnwzDHWVN4qnN8ddCCl
	ZnMG/mf2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6j1K-0005xj-Lo; Fri, 14 Aug 2020 23:21:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6j1G-0005x1-SJ; Fri, 14 Aug 2020 23:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=gcuzMKy5ca6nfpuGB7Mj7FbeflYqFCzDME2EUzPv4RI=; b=fAOOWOgbBBcaQyop3AF67ybOEX
 k/WF+pgpKGKLLKzbe7Ulx6Ps2XQvg8KHEStyZjDY9NPvQupoQrFENxvNiHJrEXtnvlGDDUcxy1Hyj
 XQLxy2PVel5XjaOyffpPuWnLysmtajdns/y4kJge3K1NOqDyk0EmYxCucuH0KGwYOq93fSKGR2n3r
 hSFZ36NXhNa4O7937jfUb3hG0bXZkcE2na7NvzfjDoV9YDkKDgrif4pPhgnyTq8LvLvE7ANflQpbA
 taeK74i9uBbRoIqgS7v6qkVtUqX9qrXlOIoFxcn/S+q8EUPAi1jZ4EhqobOVsVaOKHKzUHG4/pn35
 1748qU+Q==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6j19-0003gu-0n; Fri, 14 Aug 2020 23:21:53 +0000
Subject: Re: [RFC/RFT PATCH 6/6] riscv: Add numa support for riscv64 platform
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
References: <20200814214725.28818-1-atish.patra@wdc.com>
 <20200814214725.28818-7-atish.patra@wdc.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0d5046a4-8b7e-6279-ccd2-e02b2a091139@infradead.org>
Date: Fri, 14 Aug 2020 16:21:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814214725.28818-7-atish.patra@wdc.com>
Content-Language: en-US
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/14/20 2:47 PM, Atish Patra wrote:
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7b5905529146..4bd67f94aaac 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -137,7 +137,7 @@ config PAGE_OFFSET
>  	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
>  
>  config ARCH_FLATMEM_ENABLE
> -	def_bool y
> +	def_bool !NUMA
>  
>  config ARCH_SPARSEMEM_ENABLE
>  	def_bool y
> @@ -295,6 +295,35 @@ config TUNE_GENERIC
>  
>  endchoice
>  
> +# Common NUMA Features
> +config NUMA
> +	bool "Numa Memory Allocation and Scheduler Support"

	      NUMA

> +	select GENERIC_ARCH_NUMA
> +	select OF_NUMA
> +	select ARCH_SUPPORTS_NUMA_BALANCING
> +	help
> +	  Enable NUMA (Non-Uniform Memory Access) support.
> +
> +	  The kernel will try to allocate memory used by a CPU on the
> +	  local memory of the CPU and add some more NUMA awareness to the kernel.
> +
> +config NODES_SHIFT
> +	int "Maximum NUMA Nodes (as a power of 2)"
> +	range 1 10
> +	default "2"
> +	depends on NEED_MULTIPLE_NODES
> +	help
> +	  Specify the maximum number of NUMA Nodes available on the target
> +	  system.  Increases memory reserved to accommodate various tables.
> +
> +config USE_PERCPU_NUMA_NODE_ID
> +	def_bool y
> +	depends on NUMA
> +
> +config NEED_PER_CPU_EMBED_FIRST_CHUNK
> +	def_bool y
> +	depends on NUMA
> +
>  config RISCV_ISA_C
>  	bool "Emit compressed instructions when building Linux"
>  	default y


thanks.
-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
