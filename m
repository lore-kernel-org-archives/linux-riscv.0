Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA239CA0FED
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 01:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Og9jsiSzNQ410HfQ9/fBjkKM9aZXJA7lxoSMRlijD0=; b=c95MEu0K3idugK
	Ot544MZHMV6prvbFLZS+qtWe0iDmOsEjnYm2hLh/j0h9TzsP+k52fxvLbGPAIR/lEv8gV/GolJrLY
	3Wv7We86LNMgaGuD2X7uDVMd7aDaZiDJjC733aFtqtf0CA3lJsWOBl1d7G5DcareyEyvqkm2q4GWb
	gCRptrEnPwODbZ70KHEN6msQzl2BFzN1EQ0zQZQDi1XpYiVXpptBAgvGevySqHh0ASoKXOcy6wrhK
	emo1i2vSXh2xmhBXEfJVQivmc/aPpxtHFOlgv0YlsKUABuPwH7yQJhXy4Z+/jaivYaAPWZRZUbNIL
	7DYEwJ944FO9/WiITJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uui12-00000005wdb-0wr3;
	Sat, 06 Sep 2025 01:46:56 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uui0z-00000005wd8-0DxH
	for linux-riscv@lists.infradead.org;
	Sat, 06 Sep 2025 01:46:55 +0000
Received: from [192.168.0.105] (unknown [114.241.87.235])
	by APP-03 (Coremail) with SMTP id rQCowAC3B4J2krtoUhLyAA--.63050S2;
	Sat, 06 Sep 2025 09:46:31 +0800 (CST)
Message-ID: <19279021-e89e-458a-8bf1-62ad2f76a0ba@iscas.ac.cn>
Date: Sat, 6 Sep 2025 09:46:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 2/5] net: spacemit: Add K1 Ethernet MAC
To: Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
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
 <45053235-3b01-42d8-98aa-042681104d11@iscas.ac.cn>
 <20250905165908.69548ce0@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250905165908.69548ce0@kernel.org>
X-CM-TRANSID: rQCowAC3B4J2krtoUhLyAA--.63050S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFyDKF1DKr48Kr1UJF17trb_yoW3WFXEgr
	Wq9Fs2krs8WF1qga13Ja1Ygr4DAa42gFyUXryS9w1qv3sxXFyFgF4DWr4qvw18W3yagrnI
	qr4rZrn7u34jgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUn1v3UUUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_184653_460755_26F50EF7 
X-CRM114-Status: UNSURE (   5.12  )
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


On 9/6/25 07:59, Jakub Kicinski wrote:
> On Sat, 6 Sep 2025 00:35:37 +0800 Vivian Wang wrote:
>>>> On a closer look, these counters in ndev->stats seems to be redundant
>>>> with the hardware-tracked statistics, so maybe I should just not bother
>>>> with updating ndev->stats. Does that make sense?  
>>> For rx/tx packets/bytes I think that makes sense.
>>> But what about rx/tx drops?  
>> Right... but tstats doesn't have *_dropped. It seems that tx_dropped and
>> rx_dropped are considered "slow path" for real devices. It makes sense
>> to me that those should be very rare.
> Pretty sure Simon meant the per-cpu netdev stats in general.
> There are three types of them, if you need drops I think you
> probably want dstats. Take a look.

Thank you, I will look into this.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
