Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA487CA0ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 03:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83cOEJufc0dWP1lr7TnHMIBItSmRSdyqv2yANL5Pk6s=; b=PivAYUL6RCLHY2
	vS1sZerCSlg+J1tT6HiWjNdm2L2pVRQSGY2XEXuVwxAaWWCzPlg1A2OyyUOJK9Ie6HFuaiRc6wnyN
	oMR5JvElDOQ1pWEuxCLcWpuo3Y7VQRgruRLrcRs3bdwf4S5eDL8iAB68nYUmQLtqBTkXqoNipCDr3
	IthYWDzzKUdoDBw9sagSfuL3Qru+mAv0IHo5Z1YgFpdDEYYHo7Wfmx0nD3lS+uVdX9ftOozZRd3yL
	SZ8M2Km2kMpjd7cWxNzfv4oWZRY6jrm+YjzmsYlY41f9oQwtkp2MUKanXlxFaVSd7iUD9a1buiA8L
	GFudEFJx7XJJarqI14aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfQF-00000009gvV-4A3i;
	Tue, 12 Aug 2025 03:11:35 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfQD-00000009gv4-0Gwg
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 03:11:34 +0000
Received: from [192.168.0.111] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowADnPl+_sJpoQFIJCw--.51801S2;
	Tue, 12 Aug 2025 11:10:56 +0800 (CST)
Message-ID: <86b99a5f-02a0-43cc-9f7b-4ed3a260b4df@iscas.ac.cn>
Date: Tue, 12 Aug 2025 11:10:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 2/5] net: spacemit: Add K1 Ethernet MAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <uwu@dram.page>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250812-net-k1-emac-v5-0-dd17c4905f49@iscas.ac.cn>
 <20250812-net-k1-emac-v5-2-dd17c4905f49@iscas.ac.cn>
 <5c32fde3-0478-4029-9b71-e46a60edf06b@lunn.ch>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <5c32fde3-0478-4029-9b71-e46a60edf06b@lunn.ch>
X-CM-TRANSID: zQCowADnPl+_sJpoQFIJCw--.51801S2
X-Coremail-Antispam: 1UD129KBjvdXoW5Kry3GFyDKrWxXFy7JF1rCrg_yoWxWwc_Gw
	1Fk3yFkFs0yrs0y34Sgw15Ar1fKa95XF9xZw1v9r4xCF9xtFW29ryDuFnIq3WxWrZxGr95
	trnI9w4UWrn7AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jDsqXUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_201133_474565_7521455E 
X-CRM114-Status: UNSURE (   6.16  )
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

Hi Andrew,

On 8/12/25 10:17, Andrew Lunn wrote:
>> +/* Caller must hold stats_lock */
>> +static void emac_stats_update(struct emac_priv *priv)
>> +{
>> +	u64 *tx_stats_off = (u64 *)&priv->tx_stats_off;
>> +	u64 *rx_stats_off = (u64 *)&priv->rx_stats_off;
>> +	u64 *tx_stats = (u64 *)&priv->tx_stats;
>> +	u64 *rx_stats = (u64 *)&priv->rx_stats;
>> +	u32 i, res;
> Rather than the comment, you could do:
>
> 	assert_spin_locked(priv->stats_lock);

Thanks, I'll use assert_spin_locked.

I don't think there's anything else that needs a similar assertion, but
I'll check for sure and update next version.

Vivian "dramforever" Wang


> 	Andrew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
