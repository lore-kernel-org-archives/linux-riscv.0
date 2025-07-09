Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECACC83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyKanqP4wAmpoB31OZSL1d5WF3F0oho/LACov95ogo4=; b=JQikSGjy4iaey3
	wQj7byZ1Rg9i3BatHDRSuLD5jXKbOssRF31wtWO0R4v57+L1qRlD+Mvd+2Onl4Tladb5MhtnnpKgQ
	8UKZQEHf3hfNX/9APDSaAB5N/w6CY6UBbcukFyhSIY7CrcXKunXqStBSPbQsYmfOctcdtWgSRKJWa
	DqJDHLJYJFnHYcMsX++zs+SROSv5VqWB3MYSNvs2pXLlmKDYarnxeoctZR4BRDMxh6blErWaigV57
	FFlbSM1LpNsu5AyunaViZhg1Tkcq5peNjyFJoMGKFrYuYENpFcYHVd/DoQ8t1iqLaMCZw0LIjFamY
	HpRyY+Tvyd++zSbzLbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQIF-00000007zET-0KLb;
	Wed, 09 Jul 2025 08:36:43 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZP3n-00000007n4V-1dxP
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 07:17:46 +0000
Received: from [192.168.0.104] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowAAHNKiFF25oW8BfAg--.1894S2;
	Wed, 09 Jul 2025 15:17:26 +0800 (CST)
Message-ID: <742cb5df-cf63-44be-b671-f834ba025d4e@iscas.ac.cn>
Date: Wed, 9 Jul 2025 15:17:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Yixun Lan <dlan@gentoo.org>, Vivian Wang <uwu@dram.page>
Cc: Guodong Xu <guodong@riscstar.com>, Ze Huang <huangze@whut.edu.cn>,
 Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
 <20250709064009-GYB487904@gentoo>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250709064009-GYB487904@gentoo>
X-CM-TRANSID: qwCowAAHNKiFF25oW8BfAg--.1894S2
X-Coremail-Antispam: 1UD129KBjvdXoWrCF4ktw4UXFy8Jw1UtFW5KFg_yoWxGwbE9F
	1rtw48t3s8JFWq9w43Kw1fZrnxGaykAFyFqw45t3s3uwnxA3W5Xrs3GFykt3W3Jan5KFy7
	WFZ5ZrsYvw45WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU8fpnPUUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_001743_942577_21C04CFD 
X-CRM114-Status: UNSURE (   7.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/9/25 14:40, Yixun Lan wrote:
> [...]
>
> Hi Vivian,
>
>    We'd like to push this series for v6.17, so I've queued it at
> k1/dt-for-next branch of SpacemiT SoC tree [4] for now, FYI.

Thanks, the DTS changes look good to me.

One oddity I noticed is that there's a pinctrl in the middle of the list 
of pwm*, but that is indeed correctly sorted by address, and the 
addresses seems to be correct. So, not a problem.

Vivian "dramforever" Wang

> Link: https://lore.kernel.org/all/2dc8ab35-4f58-49d3-8e8b-3e463fa592ae@kernel.org/ [3]
> Link: https://github.com/spacemit-com/linux/tree/k1/dt-for-next [4]
>
> Thanks all


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
