Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206DECCF9FE
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gzAGQ1QX9vYsB4is1vOXtQrNXFz1wq6/bel9qH5q4A=; b=Aq++e090hLBKwy
	8WXvFAzlHjO64bR/QU5GONN4kdKFAH6kzAR4mbLjBEuWBi+uKY5eXeq5GbArdBXdTc1Gb5qgh2sOO
	4v27m8U8RG6DIXWzp2BQf5LNMTK4ZvkKsn+siszeihchbAg+Oj1hm7lKrEzZcBLiTU8HBFwQnIrTl
	U1DYwF6n6aY15ITlZWbNKwSQQps9UsvxP109nc5pWkhgctit9iYqLwT920SzbdDuyKBu/380XHfBi
	hw4VuDgXRDNt2dbHjZSg8r5Vosm/UBQs/sIynZynXUX+ozBMqHqR6Iu3s3kpQru6zggoQUpkqr0jX
	yqakBr6xSFh2y+C24F4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpCF-000000069um-0nlJ;
	Fri, 31 Oct 2025 13:29:39 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpCA-000000069uJ-3zmv
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 13:29:37 +0000
Received: from [192.168.0.109] (unknown [114.241.85.109])
	by APP-01 (Coremail) with SMTP id qwCowAAXfWe0uQRpJJbBAA--.7539S2;
	Fri, 31 Oct 2025 21:29:24 +0800 (CST)
Message-ID: <729fc508-0682-41b0-8582-b1388f31e08d@iscas.ac.cn>
Date: Fri, 31 Oct 2025 21:29:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: spacemit: Implement emac_set_pauseparam properly
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@gentoo.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251030-k1-ethernet-fix-autoneg-v1-1-baa572607ccc@iscas.ac.cn>
 <2eb5f9fc-d173-4b9e-89a3-87ad17ddd163@lunn.ch>
 <ee49cb12-2116-4f0d-8265-cd1c42b6037b@iscas.ac.cn>
 <c180925d-68fe-4af1-aa4f-57fb2cd1e9ca@lunn.ch>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <c180925d-68fe-4af1-aa4f-57fb2cd1e9ca@lunn.ch>
X-CM-TRANSID: qwCowAAXfWe0uQRpJJbBAA--.7539S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW7Xr13Zw15KF43CFW5GFg_yoW8ur1rpa
	yaga4vyF1jyr1vyFZ7Zr47Xa4j9395JrsxCFyrKw18Xrn8XFyrCr9rKF47C39xWw1kJr4Y
	9ws5XF93ArsrAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_062935_367875_DDADE171 
X-CRM114-Status: GOOD (  16.41  )
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

On 10/31/25 20:43, Andrew Lunn wrote:
> On Fri, Oct 31, 2025 at 03:22:56PM +0800, Vivian Wang wrote:
>> On 10/31/25 05:32, Andrew Lunn wrote:
>>>> [...]
>>>>
>>>> -		emac_set_fc(priv, fc);
>>>> -	}
>>>> +	phy_set_asym_pause(dev->phydev, pause->rx_pause, pause->tx_pause);
>>> It is hard to read what this patch is doing, but there are 3 use cases.
>> Yeah, I guess the patch doesn't look great. I'll reorganize it in the
>> next version to make it clearer what the new implementation is and also
>> fix it up per your other comments.
>>
>>> 1) general autoneg for link speed etc, and pause autoneg
>>> 2) general autoneg for link speed etc, and forced pause
>>> 3) forced link speed etc, and forced pause.
>> Thanks for the tip on the different cases. However, there's one bit I
>> don't really understand: Isn't this set_pauseparam thing only for
>> setting pause autoneg / force?
> Nope. You need to think about how it interacts with generic autoneg.
>
>        ethtool -A|--pause devname [autoneg on|off] [rx on|off] [tx on|off]
>
>        ethtool -s devname [speed N] [lanes N] [duplex half|full]
>               [port tp|aui|bnc|mii] [mdix auto|on|off] [autoneg on|off]
>
> These autoneg are different things. -s is about generic autoneg,
> speed, duplex, etc. However pause can also be negotiated, or not,
> using -A.
>
> You can only autoneg pause if you are doing generic autoneg. So there
> are three combinations you need to handle.

Oh, that is what I had missed. I hadn't understood this part before. Thanks.

> With pause autoneg off, you can set registers in the MAC immediately,
> but you need to be careful not to overwrite the values when generic
> autoneg completes and the adjust_link callback is called.
>
> If you have pause autoneg on, you have to wait for the adjust_link
> callback to be called with the results of the negotiation, including
> pause.
>
> phylink hides all this logic. There is a link_up callback, which tells
> you how to program the hardware. You just do it, no logic needed.

This makes sense. I'll look into using phylink.

Thanks,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
