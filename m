Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E235CAC586
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBZi37wzMSZuP3Ep5T6/Lm4ER1U/1PljgfSOCA8itZw=; b=Job9GfyoxyzXo6
	2KIBgw5mile8JfsF7ePIx+fk86IRoUsbNMaztXcMs7LG+80GzCWqUMn9xogymaSWCavO/ZXY3KcZf
	FNJDc4VCCqX/61yNrMWIVGb/Hyc4EfcD5byI07NWz9Vuuc4z47TxI6AqBGxjAQXAI03uuCYkmbYwJ
	h4s6YZePF6fw5JdWX3sbqYTTV1ikkaG6/dSaygXUctiJwb7yMQjM6kCaloP9Kof6GiBxFCQoz/UH6
	/3Dec4dkwKyurhXzf6U4QBgKuaKdbr2ZNfJzRumS7GnouP5Jf51qM+m/USR7g0P8uFwF8iEYZ2Iii
	bClapkxETKtfFmg1SLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVP-00000005R8H-1Lm7;
	Sat, 06 Sep 2025 00:10:11 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZQP-000000039Mg-01XH
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 16:36:34 +0000
Received: from [192.168.0.106] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowAAHqRJZEbtoxoHZAA--.36388S2;
	Sat, 06 Sep 2025 00:35:37 +0800 (CST)
Message-ID: <45053235-3b01-42d8-98aa-042681104d11@iscas.ac.cn>
Date: Sat, 6 Sep 2025 00:35:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 2/5] net: spacemit: Add K1 Ethernet MAC
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, Junhui Liu <junhui.liu@pigmoral.tech>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, Vivian Wang <uwu@dram.page>
References: <20250905-net-k1-emac-v9-0-f1649b98a19c@iscas.ac.cn>
 <20250905-net-k1-emac-v9-2-f1649b98a19c@iscas.ac.cn>
 <20250905153500.GH553991@horms.kernel.org>
 <0605f176-5cdb-4f5b-9a6b-afa139c96732@iscas.ac.cn>
 <20250905160158.GI553991@horms.kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250905160158.GI553991@horms.kernel.org>
X-CM-TRANSID: zQCowAAHqRJZEbtoxoHZAA--.36388S2
X-Coremail-Antispam: 1UD129KBjvJXoWruFW5Ary5JFW7Wr13trW8WFg_yoW8Jr4fpa
	y8Ka1qyF4Ut347JrWDX397Ar92yFn3JrW3Xrn3WayYgas0yr13t34xtrWjkw1DCrWF9w40
	va1jqr9FgFW5WFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUvaZXDUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_093633_464735_61CD1265 
X-CRM114-Status: GOOD (  11.57  )
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

On 9/6/25 00:01, Simon Horman wrote:

> On Fri, Sep 05, 2025 at 11:45:29PM +0800, Vivian Wang wrote:
>
> ...
>
> Hi Vivian,
>
>>>> +		status = emac_rx_frame_status(priv, rx_desc);
>>>> +		if (unlikely(status == RX_FRAME_DISCARD)) {
>>>> +			ndev->stats.rx_dropped++;
>>> As per the comment in struct net-device,
>>> ndev->stats should not be used in modern drivers.
>>>
>>> Probably you want to implement NETDEV_PCPU_STAT_TSTATS.
>>>
>>> Sorry for not mentioning this in an earlier review of
>>> stats in this driver.
>>>
>> On a closer look, these counters in ndev->stats seems to be redundant
>> with the hardware-tracked statistics, so maybe I should just not bother
>> with updating ndev->stats. Does that make sense?
> For rx/tx packets/bytes I think that makes sense.
> But what about rx/tx drops?

Right... but tstats doesn't have *_dropped. It seems that tx_dropped and
rx_dropped are considered "slow path" for real devices. It makes sense
to me that those should be very rare.

So it seems that what I should do is to just track tx_dropped and
rx_dropped myself in a member in emac_priv and report in the
ndo_get_stats64 callback, and use the hardware stuff for the rest, as
implemented now.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
