Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C710FCCF9EB
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 07:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2fGvsKZVTzojDugOtXBNz4XB5zz4jO0l4vYcbI967o=; b=LrigM5n6OzZwOn
	F6q7FX/zMRAEANOMJX05yboRfdJaxzyCRMV8foPYY421ibAp0m1FslBR1q/Vt8gMgEhYjxFo504NV
	xezJYyN5uVmeiOxtuXbsVSFA3BrZnJUoq6AUoNUJLWTRM2Oyho0uMFtkZiqDLzk7KBXhPapJlTvWa
	TAsvV1asfX9BKbcb3x9JY7mHsCpMbOOuPGgZk947R+OPh5kaDIKJmahJ2/m4AM2Kit+80yA0QkDjO
	7gawlF6uCnSaVzTFeD13d0qjh0xeiiweYwQDTTpj42ufUmgewooyCcgegIEDDmMf2Mqsrh3/7h9ii
	izyd0WwGjeJmg1/e02DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjTi-00000005Wbe-0cZ0;
	Fri, 31 Oct 2025 07:23:18 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjTf-00000005WbG-0uLN
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 07:23:16 +0000
Received: from [192.168.0.100] (unknown [114.241.85.109])
	by APP-01 (Coremail) with SMTP id qwCowAAXf2nRYwRptSe8AA--.1032S2;
	Fri, 31 Oct 2025 15:22:57 +0800 (CST)
Message-ID: <ee49cb12-2116-4f0d-8265-cd1c42b6037b@iscas.ac.cn>
Date: Fri, 31 Oct 2025 15:22:56 +0800
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
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <2eb5f9fc-d173-4b9e-89a3-87ad17ddd163@lunn.ch>
X-CM-TRANSID: qwCowAAXf2nRYwRptSe8AA--.1032S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFyxZFyUZFykCrWrCrWktFb_yoWkJFcE9F
	yqyanrJw17Ar4UA3y3KF15Ars3C39Y9a4UArykKr1xZa4rAFWxXF1kCF1xGa4fJ3y5G3s5
	tFWFv347Gwn7XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
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
X-CRM114-CacheID: sfid-20251031_002315_746610_482A76D2 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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


On 10/31/25 05:32, Andrew Lunn wrote:
>> [...]
>>
>> -		emac_set_fc(priv, fc);
>> -	}
>> +	phy_set_asym_pause(dev->phydev, pause->rx_pause, pause->tx_pause);
> It is hard to read what this patch is doing, but there are 3 use cases.

Yeah, I guess the patch doesn't look great. I'll reorganize it in the
next version to make it clearer what the new implementation is and also
fix it up per your other comments.

> 1) general autoneg for link speed etc, and pause autoneg
> 2) general autoneg for link speed etc, and forced pause
> 3) forced link speed etc, and forced pause.

Thanks for the tip on the different cases. However, there's one bit I
don't really understand: Isn't this set_pauseparam thing only for
setting pause autoneg / force?

AFAICT from my testing, forcing link speed and duplex from ethtool still
works, so I'm not sure what I'm missing here.

> I don't see all these being handled. It gets much easier to get this
> right if you make use of phylink, since phylink handles all the
> business logic for you.

I'll look into calling phylink next version. Thanks.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
