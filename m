Return-Path: <SRS0=Pi2f=OD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBE6C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 18:49:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17DAE60249
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 18:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17DAE60249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hK7tmwigYy3APhHryyNO8M0NNETr6685VQPJo016ypA=; b=ByiV4dZSO04L91kTZJw3/oa/N7
	mQYcRrqHn1CtRW7Nyew+qY3HGJlk63qphp0IPhkH/957Vo+zziJvdT4Wc0eEvgnBVHS5cKmXRSJiK
	pAP597JStbvgFXKjTr2hrUFFenl6Sk8kdCgkqfQ3CZ4x3Cj6fr++gDviFzHwyXt62a7PaNngfQIW5
	rurR5xNUtnvMp3qnhVmu5QnQ7HyFnSKxDKdgJLkirySJXZVuXeu6geh2T85V6XI78NmtOd4sMS6My
	NeBIEfzEyCOT2TJp4MJy7hklLDiKIF/2jS0PFQuqH1orj+3iKU6eb30y54JtdK7/04hX8XVKmQo8a
	9fUPOoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPr0f-0031LP-QO; Mon, 13 Sep 2021 18:48:53 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPr0b-0031L4-Rm; Mon, 13 Sep 2021 18:48:49 +0000
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: Guo Ren <guoren@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 philipp.tomsich@vrull.eu, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, wefu@redhat.com,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>, Chen-Yu Tsai <wens@csie.org>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d2ac3da8-f4d5-52c1-da7f-f8260a0bb604@infradead.org>
Date: Mon, 13 Sep 2021 11:48:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
Content-Language: en-US
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

On 9/13/21 2:20 AM, Guo Ren wrote:
> On Mon, Sep 13, 2021 at 4:45 PM Maxime Ripard <maxime@cerno.tech> wrote:
>>
>> Hi,
>>
>> On Sat, Sep 11, 2021 at 05:21:39PM +0800, guoren@kernel.org wrote:
>>> From: Liu Shaohua <liush@allwinnertech.com>
>>>
>>> Add Allwinner kconfig option which selects SoC specific and common
>>> drivers that is required for this SoC.
>>>
>>> Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
>>> interconnect issues for dma synchronization, so we set the default
>>> value when SOC_SUNXI selected.
>>>
>>> Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
>>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>>> Signed-off-by: Wei Fu <wefu@redhat.com>
>>> Cc: Anup Patel <anup.patel@wdc.com>
>>> Cc: Atish Patra <atish.patra@wdc.com>
>>> Cc: Christoph Hellwig <hch@lst.de>
>>> Cc: Chen-Yu Tsai <wens@csie.org>
>>> Cc: Drew Fustini <drew@beagleboard.org>
>>> Cc: Maxime Ripard <maxime@cerno.tech>
>>> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
>>> Cc: Wei Wu <lazyparser@gmail.com>
>>> ---
>>>   arch/riscv/Kconfig.socs      | 15 +++++++++++++++
>>>   arch/riscv/configs/defconfig |  1 +
>>>   2 files changed, 16 insertions(+)
>>>
>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>> index 30676ebb16eb..8721c000ef23 100644
>>> --- a/arch/riscv/Kconfig.socs
>>> +++ b/arch/riscv/Kconfig.socs
>>> @@ -70,4 +70,19 @@ config SOC_CANAAN_K210_DTB_SOURCE
>>>
>>>   endif
>>>
>>> +config SOC_SUNXI
>>> +     bool "Allwinner SoCs"
>>> +     depends on MMU
>>> +     select DWMAC_GENERIC
>>> +     select ERRATA_THEAD
>>> +     select RISCV_DMA_NONCOHERENT
>>> +     select RISCV_ERRATA_ALTERNATIVE
>>> +     select SERIAL_8250
>>> +     select SERIAL_8250_CONSOLE
>>> +     select SERIAL_8250_DW
>>> +     select SIFIVE_PLIC
>>> +     select STMMAC_ETH
>>> +     help
>>> +       This enables support for Allwinner SoC platforms like the D1.
>>> +
>>
>> I'm not sure we should select the drivers there. We could very well
>> imagine a board without UART, or even more so without ethernet.
> We just want people could bring D1 up easier, 8250 is the basic component.
> 
> 
>>
>> These options should be in the defconfig.

Agreed, using a defconfig is the right way to do this.

-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
