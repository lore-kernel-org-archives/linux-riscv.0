Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAC2C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 09:27:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71F41610A2
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 09:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71F41610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoDYy6E/OnNjqDrvEMkMm28KYs9vja7pB/aaKS3bjxk=; b=tJfUlOiS9DoVmBkmVGLGcoX8HO
	mF/w+8EQlNiPXw7FiRIGG+v9AJJyO9JrztVp4rPuAhX8OXmHB5AKycNwh82tG/J5R3OwhrEX40lhs
	Iu47/oBncxeHEAOLqWKmLcAAH2faf0qAzF/IkvxFGWanedJQmV31Ep3PM00mmK/xt1l0nHVHYXNBn
	GchpmgqJTSOeKQwhIg0nHn4U7tQyWK0L0mNhMUSllt1yFF6h1O/n1pDrL+yejFJkzzUb6h7aUhZXn
	6cKUOejdp6P83qayY+ChU+3Mw5B30hwF0UmVSdxXgFO7fW3A8A5N22JqHODcVfQviXeJ3QBQ/ui0a
	go4L1zQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ4iP-0050vH-Gg; Tue, 14 Sep 2021 09:26:57 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ4iM-0050sl-6k
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 09:26:55 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1mQ4hw-0003UJ-HY; Tue, 14 Sep 2021 10:26:28 +0100
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: Maxime Ripard <maxime@cerno.tech>, guoren@kernel.org
Cc: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, hch@lst.de,
 liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 Chen-Yu Tsai <wens@csie.org>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <7d9e1f45-f349-fd07-75ac-c2902882c14a@codethink.co.uk>
Date: Tue, 14 Sep 2021 10:26:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913084520.kkbsupogkzv226x3@gilmour>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_022654_323044_6E6E571F 
X-CRM114-Status: GOOD (  19.78  )
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

On 13/09/2021 09:45, Maxime Ripard wrote:
> Hi,
> 
> On Sat, Sep 11, 2021 at 05:21:39PM +0800, guoren@kernel.org wrote:
>> From: Liu Shaohua <liush@allwinnertech.com>
>>
>> Add Allwinner kconfig option which selects SoC specific and common
>> drivers that is required for this SoC.
>>
>> Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
>> interconnect issues for dma synchronization, so we set the default
>> value when SOC_SUNXI selected.
>>
>> Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Wei Fu <wefu@redhat.com>
>> Cc: Anup Patel <anup.patel@wdc.com>
>> Cc: Atish Patra <atish.patra@wdc.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Chen-Yu Tsai <wens@csie.org>
>> Cc: Drew Fustini <drew@beagleboard.org>
>> Cc: Maxime Ripard <maxime@cerno.tech>
>> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
>> Cc: Wei Wu <lazyparser@gmail.com>
>> ---
>>   arch/riscv/Kconfig.socs      | 15 +++++++++++++++
>>   arch/riscv/configs/defconfig |  1 +
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 30676ebb16eb..8721c000ef23 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -70,4 +70,19 @@ config SOC_CANAAN_K210_DTB_SOURCE
>>   
>>   endif
>>   
>> +config SOC_SUNXI
>> +	bool "Allwinner SoCs"
>> +	depends on MMU
>> +	select DWMAC_GENERIC
>> +	select ERRATA_THEAD
>> +	select RISCV_DMA_NONCOHERENT
>> +	select RISCV_ERRATA_ALTERNATIVE
>> +	select SERIAL_8250
>> +	select SERIAL_8250_CONSOLE
>> +	select SERIAL_8250_DW
>> +	select SIFIVE_PLIC
>> +	select STMMAC_ETH
>> +	help
>> +	  This enables support for Allwinner SoC platforms like the D1.
>> +
> 
> I'm not sure we should select the drivers there. We could very well
> imagine a board without UART, or even more so without ethernet.

I could make a case for selecting the serial as it is probably the
console, however the ethernet is not necessary for operation and I
would prefer to see this removed.

I wonder if we should have a new Kconfig keyword of suggest which
marks drivers as suggested for a given SoC/board/platform.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
