Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31FCC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpsf85Wub8y63Wwd3ZJGcjH29oeMXrONwZ3yIHhQZU0=; b=ibbre/SMnBR7JS
	HX3DjHMDc9pJRLwzEX+J/HE+LSdtLanJyQvgE/+VQhz+UcT89sB2w02hrICT0PnlASNIQuZZ8NKz7
	6otbQwJJonK4cjZtbinpi+5Z1VC7XvDu/3gVZGco4W8eAv1Tw5TRdjWZCQFxoTzCPtfZlxHjtWNtT
	Mxgrx9Q+XLNzyXk1zjZ8C3bip2HguP00/K8VrjjeDMz9FgPXC51pDwkTNIwqMde4iAPqNcLK3AEXD
	ZQuXP+4OeDYZoXaoCeGNn+oKOabd8cldxJcXSL9a40JMCl9XuT2YiWt+7apS38IyKqzEv1pZzwZR7
	kNVF03KNmAofaeghWjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1polUz-002IHO-2o;
	Tue, 18 Apr 2023 13:35:57 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1polUw-002IDP-03
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 13:35:56 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 496C124DBBD;
	Tue, 18 Apr 2023 21:34:47 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Apr
 2023 21:34:47 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Apr
 2023 21:34:45 +0800
Message-ID: <44908c89-1e77-8521-d5cd-2bbe7affa04c@starfivetech.com>
Date: Tue, 18 Apr 2023 21:34:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [-net-next v12 0/6] Add Ethernet driver for StarFive JH7110 SoC
Content-Language: en-US
To: <patchwork-bot+netdevbpf@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <kernel@esmil.dk>,
	<pmmoreir@synopsys.com>, <richardcochran@gmail.com>, <conor@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<andrew@lunn.ch>, <hkallweit1@gmail.com>, <pgwipeout@gmail.com>,
	<yanhong.wang@starfivetech.com>, <tomm.merciai@gmail.com>
References: <20230417100251.11871-1-samin.guo@starfivetech.com>
 <168181742075.8442.13068337635820008574.git-patchwork-notify@kernel.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <168181742075.8442.13068337635820008574.git-patchwork-notify@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_063554_331123_C9AC7D09 
X-CRM114-Status: GOOD (  10.37  )
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

 Re: [-net-next v12 0/6] Add Ethernet driver for StarFive JH7110 SoC
From: patchwork-bot+netdevbpf@kernel.org
to: Samin Guo <samin.guo@starfivetech.com>
data: 2023/4/18

> Hello:
> 
> This series was applied to netdev/net-next.git (main)
> by Paolo Abeni <pabeni@redhat.com>:
> 
> On Mon, 17 Apr 2023 18:02:45 +0800 you wrote:
>> This series adds ethernet support for the StarFive JH7110 RISC-V SoC,
>> which includes a dwmac-5.20 MAC driver (from Synopsys DesignWare).
>> This series has been tested and works fine on VisionFive-2 v1.2A and
>> v1.3B SBC boards.
>>
>> For more information and support, you can visit RVspace wiki[1].
>> You can simply review or test the patches at the link [2].
>> This patchset should be applied after the patchset [3] [4].
>>
>> [...]
> 
> Here is the summary with links:
>   - [-net-next,v12,1/6] dt-bindings: net: snps,dwmac: Add dwmac-5.20 version
>     https://git.kernel.org/netdev/net-next/c/13f9351180aa
>   - [-net-next,v12,2/6] net: stmmac: platform: Add snps,dwmac-5.20 IP compatible string
>     https://git.kernel.org/netdev/net-next/c/65a1d72f0c7c
>   - [-net-next,v12,3/6] dt-bindings: net: snps,dwmac: Add 'ahb' reset/reset-name
>     https://git.kernel.org/netdev/net-next/c/843f603762a5
>   - [-net-next,v12,4/6] dt-bindings: net: Add support StarFive dwmac
>     https://git.kernel.org/netdev/net-next/c/b76eaf7d7ede
>   - [-net-next,v12,5/6] net: stmmac: Add glue layer for StarFive JH7110 SoC
>     https://git.kernel.org/netdev/net-next/c/4bd3bb7b4526
>   - [-net-next,v12,6/6] net: stmmac: dwmac-starfive: Add phy interface settings
>     https://git.kernel.org/netdev/net-next/c/b4a5afa51cee
> 
> You are awesome, thank you!


Thank you so much! Looking forward to seeing it in v6.4.

Best regards,
Samin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
