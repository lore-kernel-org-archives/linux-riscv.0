Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493EFEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoEep+6BPkFtNKVsE/ju5la7XXq/6XsThU9zp020AxQ=; b=EclV6F2k5Fi1iu
	00XXuadx4mWpopE8Yntux1Hks/cA/ekoc/Z4Wi/ZC8DjVGiSkke8WCa39l52pVscvmLpKU5UOWjpM
	Cj/AvPeBk9h0DezGVWAPnwhAIlwvs/r1YJAga9e3+iQlWpaKaefAKPxfBQWf2pbb5pMribij0KSqK
	XDNqMmIVjQPVQhQ640DS2+BmJyH4cNFUDJmDVDG0X1gVzWgDxOm5pUrtjw6RfU14WO+1nW6Bcv+dL
	M2SibciBjriFanITWfWsiktChulVAITr2Wd5mSytD/rtYc4ZEPwDUMFSYQ/yxRRtjm9ObfoMsxYPF
	ZyWGXbOytj0CbvVHu1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzrL-005Lko-38;
	Wed, 19 Jul 2023 05:36:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzrK-005LkA-0d
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=E0FKZwssj/7Hic5rOvVV0gEG7dk+QL3K/iy5qBzZz9I=; b=L7/iqCFjkg0NibhssNXCxl1Frj
	fcBSfDt45NDxeUUAFTJrftaV8a2jeLII2coQs9eroXPhEri1mJGdCxsC0o9SYXtb94WuGZDnU8DRr
	eWpe8SNq/4R1UcZ89i4xiwVNsalJOVV9Ah0I25oCM18gTl2P49Gy5vuCi5WhUz4UegRdI9Z3w+TNZ
	DiEvLK82j9anpxscUeZJboErDmBucKGAOPmpunOyLvhMaRqHNpbVOTRAEzf3RMmNYLA77y6s76/1U
	pO/uqrzygGwImecvU8r4tRNF30L1OjF99k3lkYh7kfdZy3pWlu4XBv4vCqFi0xC3PnEvq9jvGflDZ
	qBJqrjHg==;
Received: from ex01.ufhost.com ([61.152.239.75])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLdd8-00BBxJ-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 05:52:18 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id F3C1324E280;
	Tue, 18 Jul 2023 13:51:26 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 13:51:27 +0800
Received: from [192.168.125.128] (113.72.147.86) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 13:51:25 +0800
Message-ID: <4e4dea7f-639b-71aa-5a47-95ce14d7f1ed@starfivetech.com>
Date: Tue, 18 Jul 2023 13:48:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 0/7] Add PLL clocks driver and syscon for StarFive
 JH7110 SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, William Qiu
	<william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230717023040.78860-1-xingyu.wu@starfivetech.com>
 <20230717-easel-pessimist-5b7c4e5bed0a@spud>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230717-easel-pessimist-5b7c4e5bed0a@spud>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_065215_316267_62E9668A 
X-CRM114-Status: GOOD (  14.10  )
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

On 2023/7/18 2:14, Conor Dooley wrote:
> Hey Xingyu,
> 
> On Mon, Jul 17, 2023 at 10:30:33AM +0800, Xingyu Wu wrote:
>> This patch serises are to add PLL clocks driver and providers by writing
>> and reading syscon registers for the StarFive JH7110 RISC-V SoC. And add 
>> documentation and nodes to describe StarFive System Controller(syscon)
>> Registers. This patch serises are based on Linux 6.4.
>> 
>> PLLs are high speed, low jitter frequency synthesizers in JH7110.
>> Each PLL clock works in integer mode or fraction mode by some dividers,
>> and the dividers are set in several syscon registers.
>> The formula for calculating frequency is: 
>> Fvco = Fref * (NI + NF) / M / Q1
>> 
>> The first patch adds docunmentation to describe PLL clock bindings,
>> and the second patch adds documentation to decribe syscon registers.
>> The patch 3 modifies the SYSCRG bindings and adds PLL clock inputs.
>> The patch 4 adds driver to support PLL clocks for JH7110.
>> The patch 5 modifies the system clock driver and can select the PLL clock
>> source from PLL clocks driver. And the patch 6 adds the 
>> stg/sys/aon syscon nodes for JH7110 SoC. The last patch modifies the 
>> syscrg node in JH7110 dts file.
> 
> Just FYI, I have picked up the binding & clock portions of this series
> and your other one adding the stg syscon. I've pushed them out here for
> the test robots to have a look:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=clk-starfive
> 
> If that passes, my plan is to send Stephen a PR for the lot, later this
> week.
> 

Great. Thank you for everything.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
