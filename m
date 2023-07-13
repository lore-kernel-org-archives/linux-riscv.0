Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FFEEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 03:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqYpjcMKP9Upmm4/TDaf6OswoNMdm4nAtZMGhkiIay0=; b=KVQPH7sJELna/W
	zDURd9bAbH51Fq8zDOFBipaPCsedsDQ1GpzPB2enkGZsKvuJ/xD5ROeBNfdpmD7Du7G9zudY3l/1C
	dQ0DxH3V+zueLiishN/qrnAQdHaNh1tL6N28YkP7nyxDq1Ym/IeR2vM6pX+6x4oZEKo5/A8V2DsmO
	vzOyzMrbDv+2qRAYCyfocfQsP60W5RJGcD5cnbjAeebtgoLZSa5OC42dLeCj6UZR8xd1sNG2nB8aJ
	7+3gMW63+3yezWyZhzlcRsIRo2CUHwO4AUPV4ZqpQijBBBiHtOEb6cqGIXUNBa1lf/HuXKSZ4I3sZ
	xQqL/F81R42DN2DVTwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJnHw-001qPe-0H;
	Thu, 13 Jul 2023 03:46:44 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJnHt-001qNw-01
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 03:46:43 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 49AC680BE;
	Thu, 13 Jul 2023 11:46:15 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Jul
 2023 11:46:15 +0800
Received: from [192.168.125.128] (183.27.98.46) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Jul
 2023 11:46:14 +0800
Message-ID: <a6bdf17f-dd05-0237-92f4-7fc5115e4bef@starfivetech.com>
Date: Thu, 13 Jul 2023 11:43:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 0/9] Add STG/ISP/VOUT clock and reset drivers for
 StarFive JH7110
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <p.zabel@pengutronix.de>,
	<kernel@esmil.dk>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<hal.feng@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com>
 <mhng-d3795910-5414-4555-bf3d-75ebe769ed2b@palmer-ri-x1c9a>
 <20230712-unsold-impound-02608d701dfb@spud>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230712-unsold-impound-02608d701dfb@spud>
X-Originating-IP: [183.27.98.46]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_204641_218913_309CB1BA 
X-CRM114-Status: GOOD (  13.74  )
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

On 2023/7/13 1:01, Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 09:50:37AM -0700, Palmer Dabbelt wrote:
>> On Wed, 12 Jul 2023 02:19:58 PDT (-0700), xingyu.wu@starfivetech.com wrote:
>> > This patch serises are base on the basic JH7110 SYSCRG/AONCRG
>> > drivers and add new partial clock drivers and reset supports
>> > about System-Top-Group(STG), Image-Signal-Process(ISP)
>> > and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC. These
>> > clocks and resets could be used by DMA, VIN and Display modules.
> 
>> Happy to take it through the RISC-V tree if folks want, but IMO it's
>> probably better aimed at the clock/reset folks.  Either way I'd want to give
>> them a chance to ack/review it, so I'm going to drop it from my list.
>> 
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> I had a look through it & I am generally happy with it - everything has
> either an R-b from DT folk or Hal on the drivers.
> I was going to propose the same thing as the PLL patchset - if Emil is
> happy with it, then I intend sending Stephen a PR for the drivers &
> bindings.
> 

Thanks, I will send a new version soon with some modification from Emil's comments.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
