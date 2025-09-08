Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8A3CAC581
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 18:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcIRy++u1uerJLdQMHQre2j87hALbsn3HK9dvZjjGSo=; b=TOj/lAZet44DM7
	9wj/r+V0EybPKleWNFqMtzzATXU8PP0ytZ0J2FTKr+CzqrE74ZA5kEmLjRTxFUhyCVhKvsHqjdJl0
	LcaXCp0v81pgYaEs7NoK8Kzuwn51D9h6KHbrGubEEPiedekKLooVm09UwhZxxVaKjuDBijPnIMUoD
	YJI2CQlud5Qlo6JYQDwByzLkKLg4ucNG34DA8YSTLKbycpjK4O+FsrgIHsPLB8iUa7qjOrHxevM4W
	NUyuaXJ5iOfdHjnfkQVwFXpiAICsow/kdnq8mArb0/n1lwxepWcdWgLSEBGCYhWM1HdLAbGM/Kylv
	76bH83/2GDQERMslc+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgtp-00000001epz-1RtY;
	Mon, 08 Sep 2025 18:47:33 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdlQ-00000000PrX-1cEZ
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 15:26:42 +0000
Received: from [192.168.0.106] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowAC3DaCB9b5o9d+wAQ--.57957S2;
	Mon, 08 Sep 2025 23:25:54 +0800 (CST)
Message-ID: <b6dbb901-e904-47bf-b295-47f610ce3230@iscas.ac.cn>
Date: Mon, 8 Sep 2025 23:25:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 2/5] net: spacemit: Add K1 Ethernet MAC
To: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
References: <20250908-net-k1-emac-v10-0-90d807ccd469@iscas.ac.cn>
 <20250908-net-k1-emac-v10-2-90d807ccd469@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250908-net-k1-emac-v10-2-90d807ccd469@iscas.ac.cn>
X-CM-TRANSID: qwCowAC3DaCB9b5o9d+wAQ--.57957S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY67k0a2IF6FyUM7kC6x804xWl14x267AK
	xVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gc
	CE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxI
	r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87
	Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_GFv_Wryl4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8D3ktUUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_082640_784690_D68F0487 
X-CRM114-Status: UNSURE (   5.36  )
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

On 9/8/25 20:34, Vivian Wang wrote:

> [...]
> +static u64 emac_get_stat_tx_dropped(struct emac_priv *priv)
> +{
> +	u64 result;

Well, this should be result = 0. That was careless on my part. Will fix
in v11.

I need to start using this clang thing...

Vivian "dramforever" Wang

> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		result += READ_ONCE(per_cpu(*priv->stat_tx_dropped, cpu));
> +	}
> +
> +	return result;
> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
