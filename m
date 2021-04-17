Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F78EC433ED
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 04:57:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF876108B
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 04:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF876108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fXcnUWI+wd7iWWcNxO2ASxfZuXlbeFGUozKxqealQdI=; b=gX1TXX+P4ri7rximouCS75lsQ
	9cyox253WCw/3XpIIjTq/1i1GhlTniC5V/116wZ5wyjNeKMeJI2ONBX2aTCtnhYfOkX3TMITaJRpC
	Wsyqufku8us61h5hurVvkAJf4Lx45mbIsExJMin4mlSm4YBW0deNzDL9dWvr3etBqI51W0i2qir6D
	MArE/c2w7wUhy5SinY/+7embky4+vlaAGgTKOsIwtJE05dQ19T20cduxtW9YfDsV/ELv+YvTzvzMJ
	hbR4A7Y8CVBjGe6AAb6QvkYWZCbqzzWXjCAcNaESzV5GVL9qqsim/6ctCN/Z5FlfyTA+WbfuQF33S
	Xzl32uG3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXd0n-004MMs-Tv; Sat, 17 Apr 2021 04:56:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXd0h-004MMA-Nl
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 04:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=nbbaLSJ0xQPZdtzEzpp9QI50BrWdC7vS6jlsJzsvgxM=; b=uGehqD7Sdbh2d05oCqpvIXPD7S
 MjiNz9Wkq6bn3+NECc8/Jgai30Ie5WL4HCQLxOqNAaPgASfAhhqhblZkyf3h0b2mDmXhlWej7Fwri
 lOyOmtW4Wr7OuZLMFdl7VUkGoNfnl1qMvG+YNV5tVXiN38tDVqrVzfQJUhyAdoc7o0uoc1PYWeGv8
 VtH5SPZ8hq9cMQlQ58qMNvbW8ENGUJJZc77WF5CovTB7fRZnuLY4i6oDqpufQQ/dllYDYwPTyzv6h
 1KOmwqGgVM0mZgRLzmM8zk+e0F58Yc4XlUrFp9YPKbTIyPjRw9NAcqzwg5NLFWJ7XAzAhDuJR4Mcf
 3cDVekZw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXd0f-009sBh-9y
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 04:56:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 396886113D;
 Sat, 17 Apr 2021 04:56:43 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] riscv: Disable data start offset in flat binaries
To: Damien Le Moal <damien.lemoal@wdc.com>, uclinux-dev@uclinux.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Christoph Hellwig <hch@lst.de>
References: <20210417011009.54569-1-damien.lemoal@wdc.com>
 <20210417011009.54569-3-damien.lemoal@wdc.com>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <ba8edc33-a171-31c4-a873-ae552cca7690@linux-m68k.org>
Date: Sat, 17 Apr 2021 14:56:41 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210417011009.54569-3-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_215645_402643_7DEFF31E 
X-CRM114-Status: GOOD (  18.18  )
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


On 17/4/21 11:10 am, Damien Le Moal wrote:
> uclibc/gcc combined with elf2flt riscv linker file fully resolve the
> PC relative __global_pointer$ value at compile time and do not generate
> a relocation entry to set a correct value of the gp register at runtime.
> As a result, if the flatbin loader offsets the start of the data
> section, the relative position change between the text and data sections
> compared to the compile time positions results in an incorrect gp value
> being used. This causes flatbin executables to crash.
> 
> Avoid this problem by enabling CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
> automatically when CONFIG_RISCV is enabled and CONFIG_MMU is disabled.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Palmer do you want me to take this via my tree with 1/2 in the series,
or are you going to pick it up?

Regards
Greg


> ---
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4515a10c5d22..add528eb9235 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -33,6 +33,7 @@ config RISCV
>   	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>   	select ARCH_WANT_FRAME_POINTERS
>   	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> +	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>   	select CLONE_BACKWARDS
>   	select CLINT_TIMER if !MMU
>   	select COMMON_CLK
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
