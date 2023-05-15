Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD1C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 01:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QxrJM66MMkgxLMoPKNljYrNPo6fie2T0c2rTrrBCEz0=; b=XAEZq8R4/j5UVB
	DTq4XUe31+Mr24IdCNCdVenAEK0rKxghX+p/9+8vG244slLT7XAWMkWelY4HJWcQUa7kq4t4s0eV/
	bdFclh2jEx4JdB/uYRK/n++o3iTdOJa8VJ2Qhngz7HoX9bv/hYXN2w1IrHNaEZlvKSfvJmZEuh9nK
	Ud3sNd9lHslTf9U6s2Ujjb34PhkwgeXR5tvHl3jr6eGHvAQvlsBRRlsbw6457tlFm7u2vHotOU9De
	NkXxbCbQTK9O4xruLElI0xDx3voDufJ0f0Szhdj8KLxZWKVO5EOqhwgniqt9c8L789Ilk62olLbGu
	Y6DT0/q8Uvc73/cSWsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyNKA-000cEF-25;
	Mon, 15 May 2023 01:48:30 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyNK7-000cDO-1F
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 01:48:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3D4C124DED7;
	Mon, 15 May 2023 09:47:46 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 09:47:46 +0800
Received: from [192.168.125.124] (113.72.146.187) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 09:47:45 +0800
Message-ID: <ec5693b7-1ace-2215-1115-971d8086a171@starfivetech.com>
Date: Mon, 15 May 2023 09:47:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1 2/2] riscv: dts: starfive: jh7110: Add watchdog node
To: Conor Dooley <conor@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>
References: <20230509151723.84989-1-xingyu.wu@starfivetech.com>
 <20230509151723.84989-3-xingyu.wu@starfivetech.com>
 <20230512-barrack-catchable-1f4072b9355b@spud>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230512-barrack-catchable-1f4072b9355b@spud>
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_184827_598640_E1417CF6 
X-CRM114-Status: UNSURE (   8.89  )
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



On 2023/5/13 6:27, Conor Dooley wrote:
> On Tue, May 09, 2023 at 11:17:23PM +0800, Xingyu Wu wrote:
>> Add the watchdog node for the Starfive JH7110 SoC.
> 
> Emil or Walker, could I get a review on this please?
> It's the only dts patch on the list right now for the jh7110 that I can
> actually apply, so it'd be nice to do so.

Of course, thank you for helping to review and apply.

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
