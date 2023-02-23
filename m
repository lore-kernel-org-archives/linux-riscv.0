Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FCAC636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 06:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxaFg56Q3GrwArZ98MYYajfdsh1MUq5gNaTARiB1v08=; b=cJKxhMbEq2/NZ1
	J6KrVec9XqAsaiS3Ah0BW0ofsC6vqarFVDpyCXwqBYJL3kvChUyByKtbxSgLZGLLJJzXzmfTdZGa5
	+dapj06iTxwZkYLVSa3txu9RbYfGoAhXo2hB9LJ1QlT6ASgNvlx5FChS+uHvsPS0cPJhThPZHcLm4
	cGTj0JKYtJ8pZ4Ts2WGG6hkat/cXmlEAF8OrYTaQsDwTfz+UNm7YDLvJ1l3ZJjsk3GEhEjPhdgesb
	PgU2kUfy7BgQnaSRW5m4BUEwlVC8AisAz9gh0X4ovDH3PmrYIjX+aTlCIDnByDkRIyLTHQNynEUQJ
	jf4AZrQFTgiB+Gi2xYJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV4vG-00FGbS-LC; Thu, 23 Feb 2023 06:17:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV4vD-00FGZq-4c
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 06:17:41 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6A79124E1F2;
	Thu, 23 Feb 2023 14:17:08 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 14:17:08 +0800
Received: from [192.168.125.82] (113.72.147.165) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 14:17:07 +0800
Message-ID: <ae842a00-497a-e70d-e9c9-1a5316da93fa@starfivetech.com>
Date: Thu, 23 Feb 2023 14:17:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 11/19] clk: starfive: Add StarFive JH7110 system clock
 driver
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-12-hal.feng@starfivetech.com> <Y/Tfa8YU2LFxweyg@wendy>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y/Tfa8YU2LFxweyg@wendy>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_221739_367432_D9B1F30D 
X-CRM114-Status: GOOD (  14.24  )
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

On Tue, 21 Feb 2023 15:12:43 +0000, Conor Dooley wrote:
> On Tue, Feb 21, 2023 at 10:46:37AM +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add driver for the StarFive JH7110 system clock controller and
>> register an auxiliary device for system reset controller which
>> is named as "reset-sys".
>> 
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> How is this Reported-by lkp?
> If lkp responded to your patch saying there was a problem with it, it
> doesn't get a Reported-by - just like how any other reviewer doesn't get
> a Reported-by for pointing out build issues ;)
> You only need to add that for bugs it reports on patches that have
> already been applied ;)

I don't know. I just saw the following message in [1]. I will remove
it as you suggested. Ditto for the other patches. Thank you.

"If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>"

[1] https://lore.kernel.org/all/202212231726.ZYGFg045-lkp@intel.com/

Best regards,
Hal

> 
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
