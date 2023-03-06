Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3987BC64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 23:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iz9/DkTWUBX2zlyfjik1G/ji4MMCsCqtmIyfzZe3yoM=; b=lviJ3rvym6oLak
	evIyXsOSSWI6j2rY08hw+eXqh6gbYXcFkxHHL8RMRmc8cAYq1nEv2o9IlgAAy6zhHnwefHd5hlQOQ
	G7B4GhdKKyFRbtm9ZGdQtstG2O1Avk97FJqg9ptGsIgRnXxfugTObYo/IY7LStFBS7T5ZzyrjUimb
	HF1KLolJOeIgyPzBHDxNQK0ITs13gHDPF5N/3CwmzVNAT5EVyNwJnrzouljSun2b6Lz4E5wvnMjbn
	Psn4tNZLEJTsLRxroZXPxkdW2XXv4iL9S6tJTSrKpYCOuPOvIlXw2jz/7VIxRtd7gcEg/ofmCCMAj
	tR4lp3JYNItCeq5AU2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZKXH-00FVZq-BS; Mon, 06 Mar 2023 23:46:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZKX7-00FVXV-56; Mon, 06 Mar 2023 23:46:22 +0000
Received: from [192.168.1.90] (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3BA6B6602F5E;
	Mon,  6 Mar 2023 23:46:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678146376;
	bh=NEoWyHe0xORmwmkapLJCDAiOtq7Nhqyrhrxnf11E9X0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b7wEyD48eZrqKBBwbQBZGMDDqMv7sy8/YQfCNfrJlB94wRymvBrK30IppzEUOccJg
	 EMi7WAao0h0YenfHKwuoTwA8eKHToT6ZoBkyjppspncS+qBobyyuBUoZUeZOoRRVGd
	 nleQJwIJCrxzdyMzcLGeVhykAaNIffgea13u3HiWF4LH0iBCQxDMvEGRDwLi8dKk2z
	 w+OXPZ3X29oxw7AM+9ZNaJCEWrQIHsq1/2F2mQYo6Q6+OyK3MBXR8iR9SplMEntAP9
	 yl4y5mQIqv0cNpHkh5jEFW/QGk+m7o/9PSs6iyFhQN9eaLlYyuIyaguPanA4/nNbR5
	 5FXdYSDVr4gKg==
Message-ID: <243aebb3-70d8-3d83-cb8f-bd1e67e6707e@collabora.com>
Date: Tue, 7 Mar 2023 01:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 03/12] soc: sifive: ccache: Add StarFive JH7100 support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-4-cristian.ciocaltea@collabora.com>
 <b969cf86-d5df-462a-982b-c5b67f97c3d6@spud>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <b969cf86-d5df-462a-982b-c5b67f97c3d6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_154621_454355_DC8A150B 
X-CRM114-Status: GOOD (  20.38  )
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

On 3/7/23 01:32, Conor Dooley wrote:
> On Sat, Feb 11, 2023 at 05:18:12AM +0200, Cristian Ciocaltea wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>>
>> This adds support for the StarFive JH7100 SoC which also feature this
>> SiFive cache controller.
>>
>> Unfortunately the interrupt for uncorrected data is broken on the JH7100
>> and fires continuously, so add a quirk to not register a handler for it.
>>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> [drop JH7110, rework Kconfig]
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> This driver doesn't really do very much of anything as things stand, so
> I don't see really see all that much value in picking it up right now,
> since the non-coherent bits aren't usable yet.
> 
>> ---
>>   drivers/soc/sifive/Kconfig         |  1 +
>>   drivers/soc/sifive/sifive_ccache.c | 11 ++++++++++-
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
>> index e86870be34c9..867cf16273a4 100644
>> --- a/drivers/soc/sifive/Kconfig
>> +++ b/drivers/soc/sifive/Kconfig
>> @@ -4,6 +4,7 @@ if SOC_SIFIVE || SOC_STARFIVE
>>   
>>   config SIFIVE_CCACHE
>>   	bool "Sifive Composable Cache controller"
>> +	default SOC_STARFIVE
> 
> I don't think this should have a default set w/ the support that this
> patch brings in. Perhaps later we should be doing defaulting, but not at
> this point in the series.

I will handle this is v2 as soon as the non-coherency stuff is ready.

> Other than that, this is fine by me:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for reviewing,
Cristian

> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
