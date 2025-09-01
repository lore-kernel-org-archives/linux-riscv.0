Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B2DCA0FE8
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 00:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUWdhqW2iRNOuUL/nTE/KXLYrCHzEVk5LkOvF55TOl8=; b=JlWMgKfmIhPutm
	7OR6S+55SHDBRIfesV6VLcgsxoT4eSbBMCL51kHBy1TcXg4mFQNdVnmfRCspjfvjpEpkhZkEvldyF
	5cqB2yrf9IbdplF7COt0tGU+lSFZRhZWYilZLNOuet4H4RH3RB+sWCnjgb+PKKd29QSkMvjz6fNgF
	4KV8oxAjIYoMOMRGwJXnHG5QWYOAE97UJg4IHPxwBnILLiwNW+AVd95J+OOV6+opPSkhFWlQQ15eU
	VuXJ2z5/8YHkZtrli4I1rMAbiQHaTnpd1B/NPKY8i9lm87fqBpdyjLSaqiNR9JrZGwy10wrh4Hnzw
	eRJ9OrgXhymzYc50YMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussFR-0000000ArPo-0Ll1;
	Mon, 01 Sep 2025 00:18:13 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussDj-0000000ArJW-2qPP
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 00:16:29 +0000
Received: from [192.168.0.102] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowAAnulqt5bRozJxqEA--.28114S2;
	Mon, 01 Sep 2025 08:15:42 +0800 (CST)
Message-ID: <ce7508df-f154-4fd7-a621-abe371c1cb4a@iscas.ac.cn>
Date: Mon, 1 Sep 2025 08:15:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/5] net: spacemit: Add K1 Ethernet MAC
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
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
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250828-net-k1-emac-v8-0-e9075dd2ca90@iscas.ac.cn>
 <20250828-net-k1-emac-v8-2-e9075dd2ca90@iscas.ac.cn>
 <58E42B0649434EDA+aLEHlp1jfLVxVZWR@LT-Guozexi>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <58E42B0649434EDA+aLEHlp1jfLVxVZWR@LT-Guozexi>
X-CM-TRANSID: zQCowAAnulqt5bRozJxqEA--.28114S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw48tw48tF15KFW3ur48Zwb_yoW8ArW7pa
	13Ga4q9rZ2yr47Gr9xZ3WDAa9Yvw4jkFyjyFW5tr1rWF1qy34aqrnrtw45u348ur48G3yY
	vr4jva4Iqas8A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxU3wIDUUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_171628_077329_11975BA1 
X-CRM114-Status: GOOD (  14.36  )
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


On 8/29/25 09:51, Troy Mitchell wrote:
> On Thu, Aug 28, 2025 at 04:47:50PM +0800, Vivian Wang wrote:
>> The Ethernet MACs found on SpacemiT K1 appears to be a custom design
>> that only superficially resembles some other embedded MACs. SpacemiT
>> refers to them as "EMAC", so let's just call the driver "k1_emac".
>>
>> Supports RGMII and RMII interfaces. Includes support for MAC hardware
>> statistics counters. PTP support is not implemented.
>>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>> Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
> [...]
>> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..49afe9312a742c27dd35a015d75a1de7ec5c7d15
>> --- /dev/null
> [...]
>> +
>> +static int emac_phy_interface_config(struct emac_priv *priv)
>> +{
>> +	u32 val = 0, mask = PHY_INTF_RGMII;
>> +
>> +	switch (priv->phy_interface) {
>> +	case PHY_INTERFACE_MODE_RMII:
>> +		mask |= REF_CLK_SEL;
> How about we move `val = 0` to here? 
> This makes it clearer that val should be 0 when PHY_INTERFACE_MODE_RMII,
> instead of being hidden in the initialization.

I'll probably just use phy_interface_mode_is_rgmii or something for val.

I will clean this up, but I'll wait for a few more changes to batch up
before sending the next version.

> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Thank you!

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
