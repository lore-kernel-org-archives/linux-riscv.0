Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB40C5519F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 01:12:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F9B22260
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 01:12:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZQtjfNLQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F9B22260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WdFg/WXR4oe5DuZi4NjvqIigl6f5IwhU4HFMwOR6aFI=; b=ZQtjfNLQmxu6gCyNqJjYOd9Vt
	sqj8Ak8tV1gXrKrTqrdALnCAnKJCjtZv3EQnZVKtCk+shhGivb0L8QO9JvpQUdRivThXLXLwNVW1K
	zdJm0NaCeHppos0LKF7fvendBX0QFP3WNsFaC3wfbpyTIRZ2cYqsKaC8ALzV+YhLHtPrDYfhkGRRP
	GTv8BZeoveDVCuZ//Ck1rKKgpcJENFtOLc7noSS3v0Tfcf6hOupXglVoQY8r/4GMz+c6wdi2eAOMy
	pdyS2AepUcorsnGlwhz+7oWaXmfOhMIA1y7cDwkCXRiaQll76XxF6YTtorm7ws4wpoVZlP8s8LL9W
	sqb0imSxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfYVA-0001UM-D0; Thu, 19 Nov 2020 01:12:44 +0000
Received: from [2601:1c0:6280:3f0::bcc4]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfYUv-0001Q0-1T; Thu, 19 Nov 2020 01:12:29 +0000
Subject: Re: [PATCH v5 2/5] numa: Move numa implementation to common code
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
References: <20201119003829.1282810-1-atish.patra@wdc.com>
 <20201119003829.1282810-3-atish.patra@wdc.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c650ecd7-7cd3-fd8e-7d4b-ed32ca91ca70@infradead.org>
Date: Wed, 18 Nov 2020 17:12:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201119003829.1282810-3-atish.patra@wdc.com>
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>,
 Baoquan He <bhe@redhat.com>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/18/20 4:38 PM, Atish Patra wrote:
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index 8d7001712062..c5956c8845cc 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -210,4 +210,10 @@ config GENERIC_ARCH_TOPOLOGY
>  	  appropriate scaling, sysfs interface for reading capacity values at
>  	  runtime.
>  
> +config GENERIC_ARCH_NUMA
> +	bool
> +	help
> +	  Enable support for generic NUMA implementation. Currently, RISC-V
> +	  and ARM64 uses it.

	            use it.

> +
>  endmenu


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
