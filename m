Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39035D3566A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 03:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me6TJULhhs9cWQAJl6lrWu6wdlfxcHHTU/TtCydpkQI=; b=FnWh/HjJarwBt/
	Z3kqbFn9rYGUl82m+X2k7EPH9YLB0VF1s61MksNxzmb6cw6taB40bs4IobHJxd0fZvXYAabZ1crDJ
	GvkSN6YHdyMVmaio7q68gHBFfEtDoqowWAKLC2Mt0jqOVC88l7qkvvvZKMYOWXmTVygLFgqpMHS6s
	0X6GG+ail2u/xUDf4qq4K68HSdDYVZh9lWDiwfjR9DTDPy0ylytyD+huZMg156zVuUl3wTGi2UYXi
	Xvwlw5IeLASJyvNnYGJe708D2I9c3J4jKopjcpI62flqKDl38NBtY9OWKR/KWNFrkPjf/FIKGqFqP
	eaja41VC9jB8Iky806kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvup-0000000FLNN-2gOt;
	Wed, 28 Jan 2026 03:08:23 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkvum-0000000FLN5-1ing
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 03:08:22 +0000
Received: from [192.168.0.109] (unknown [123.118.222.47])
	by APP-05 (Coremail) with SMTP id zQCowAC3Sw+bfXlpAQvXBg--.33087S2;
	Wed, 28 Jan 2026 11:08:12 +0800 (CST)
Message-ID: <dc31ca81-1854-41ba-a448-718ba1f781da@iscas.ac.cn>
Date: Wed, 28 Jan 2026 11:08:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: spacemit: k1-emac: program frame size
 registers for jumbo frames
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tomas Hlavacek <tmshlvck@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Yixun Lan <dlan@kernel.org>
References: <20260126135919.77168-1-tmshlvck@gmail.com>
 <20260126171449.83288-1-tmshlvck@gmail.com>
 <9f424b4e-b83b-47a0-8637-3df25e504be7@iscas.ac.cn>
 <20260127172401.4bb7bd83@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260127172401.4bb7bd83@kernel.org>
X-CM-TRANSID: zQCowAC3Sw+bfXlpAQvXBg--.33087S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY67k0a2IF6FyUM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
	6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
	1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF
	7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r1q6r43Mx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8fwIDUUUUU==
X-Originating-IP: [123.118.222.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_190820_852895_6B05BDBD 
X-CRM114-Status: UNSURE (   4.36  )
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

On 1/28/26 09:24, Jakub Kicinski wrote:
> On Tue, 27 Jan 2026 12:58:21 +0800 Vivian Wang wrote:
>> Oh and... maybe these should be priv->ndev->mtu + ETH_HLEN + ETH_FCS_LEN?
> + 2 * VLAN_HLEN perhaps?

... yeah looks like I've simply messed up the whole MTU and max frame
size configuration thing.

* Tomas: Do you still want to deal with all this and figure out all the
MTU stuff that needs to be fixed? I can give it a go but I don't want to
steal your credit.

Regards,
Vivian "dramforever" Wang



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
