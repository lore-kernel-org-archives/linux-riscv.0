Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72E1C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 07:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JorTjvghqP3b9fdYCfBZqtrBSIjoARwCkg9V3/bs9n4=; b=IJV1dmEeP6f44u
	aaGEClp+n24FEI1VANDuI2UqrT5MGD6Qps94SeN6dp58txwpUHkeo10uuxFtDQnp9eXMnr15BWH7w
	0xm+LB0Jt0jiPzSjtQcD+sdDF+El7QJZDg/6URbKEhyetvaY3MgAgeijot6UMzvrGcjj+riFybdw1
	pkmy5OVuEA36orCF+Bm3pPRF7/0jZ1SWPFCulpO4Bct51R7L1bWDikGfIvD8HPVEhofWYDkceaXN4
	aIMVO4vuNk4Zyhl9cY1cm+xeSacE1OJwa7NoQBl9s4xuboHrAG77HR+2duQgYZJfIsOUgVw7vb9I8
	B3imDh/z8Wv+/uq4Hgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEXo-0000000AXMm-2e2g;
	Thu, 03 Jul 2025 07:39:44 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEXk-0000000AXJh-10Jw
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 07:39:42 +0000
Received: from [192.168.33.13] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowADnEqemM2ZoIjmpAA--.20643S2;
	Thu, 03 Jul 2025 15:39:19 +0800 (CST)
Message-ID: <a9cad07c-0973-43c3-89f3-95b856b575df@iscas.ac.cn>
Date: Thu, 3 Jul 2025 15:39:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/5] Add Ethernet MAC support for SpacemiT K1
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <uwu@dram.page>,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250702-net-k1-emac-v3-0-882dc55404f3@iscas.ac.cn>
 <20250703072317.GK41770@horms.kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250703072317.GK41770@horms.kernel.org>
X-CM-TRANSID: qwCowADnEqemM2ZoIjmpAA--.20643S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWkXryDZFy7KrWUCry8Zrb_yoW5AF15pa
	y8uFs0k3yDtrWxGrsruwnF9F40vws5tF15W3W8tryrua9xCF10yrZ2kr15uayDurZ3Cr12
	yF1UAF1kGF98AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9ab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IUYvjg3UUUUU==
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_003940_645046_8CDD8676 
X-CRM114-Status: GOOD (  22.81  )
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

Hi Simon,

On 7/3/25 15:23, Simon Horman wrote:
> On Wed, Jul 02, 2025 at 02:01:39PM +0800, Vivian Wang wrote:
>> SpacemiT K1 has two gigabit Ethernet MACs with RGMII and RMII support.
>> Add a driver for them, as well as the supporting devicetree and bindings
>> updates.
>>
>> Tested on BananaPi BPI-F3 and Milk-V Jupiter.
>>
>> I would like to note that even though some bit field names superficially
>> resemble that of DesignWare MAC, all other differences point to it in
>> fact being a custom design.
>>
>> Based on SpacemiT drivers [1].
>>
>> This series depends on reset controller support [2] and DMA buses [3]
>> for K1. There are some minor conflicts resulting from both touching
>> k1.dtsi, but it should just both be adding nodes.
>>
>> These patches can also be pulled from:
>>
>> https://github.com/dramforever/linux/tree/k1/ethernet/v3
>>
>> [1]: https://github.com/spacemit-com/linux-k1x
>> [2]: https://lore.kernel.org/all/20250613011139.1201702-1-elder@riscstar.com
>> [3]: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn
>>
>> ---
>> Changes in v3:
>> - Refactored and simplified emac_tx_mem_map
>> - Addressed other minor v2 review comments
>> - Removed what was patch 3 in v2, depend on DMA buses instead
>> - DT nodes in alphabetical order where appropriate
>> - Link to v2: https://lore.kernel.org/r/20250618-net-k1-emac-v2-0-94f5f07227a8@iscas.ac.cn
>>
>> Changes in v2:
>> - dts: Put eth0 and eth1 nodes under a bus with dma-ranges
>> - dts: Added Milk-V Jupiter
>> - Fix typo in emac_init_hw() that broke the driver (Oops!)
>> - Reformatted line lengths to under 80
>> - Addressed other v1 review comments
>> - Link to v1: https://lore.kernel.org/r/20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn
>>
>> ---
>> Vivian Wang (5):
>>       dt-bindings: net: Add support for SpacemiT K1
>>       net: spacemit: Add K1 Ethernet MAC
>>       riscv: dts: spacemit: Add Ethernet support for K1
>>       riscv: dts: spacemit: Add Ethernet support for BPI-F3
>>       riscv: dts: spacemit: Add Ethernet support for Jupiter
> I'm unsure on the plan for merging this.  But it seems to me that the first
> two patches ought to go though net-next. But in order for patches to
> proceed through net-next the entire series ought to apply on that tree - so
> CI can run.
>
> I'm not sure on the way forward.  But perhaps splitting the series in two:
> the first two patches for net-next; and, the riscv patches targeted elsewhere
> makes sense?

Oops. I had not considered this originally, since v1 only depended on
the reset stuff, which seemed like it was going to be taken up at
v6.16-rc1. That did not happen, and this unfortunately also gained a
dependency on DMA buses. So:

I will send a v4 fixing suggestions here but with only patch 1 and 2,
i.e. bindings and driver. The DTS changes will go through the SpacemiT tree.

Thanks for the suggestion.

Regards,
Vivian "dramforever" Wang

> </2c>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
