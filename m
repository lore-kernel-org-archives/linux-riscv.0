Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED0CC4708E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 01:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KGy0U1y9OZEsH8VO7FBhfe1W7t2izdHlnzu9ArsBLk=; b=GqD6rY/bnmYTO6
	1LzQbqhRBreUCvDirRl4AFCompvGe/eexziB1mkRmCxY8tizBwCoKR0CzxjKhRCYy5UuHgi84hcIJ
	2F6zkgvYKfbfMC1daHhrJaOCueYuYhROWxkvzsZiITVhu6ROaWyebYS5Qt+8dL04bKjxp/rOrSxSE
	WMSYz0YWqEe4g32KgvRgBIi4MZtCbnqlPVVvapI7dddOoVe+IzqIOZlj4ztqB5gmm97FNamsioQDu
	GiBbZGO85oDL4QKpLrUXIcK/PagvxiJQzAzhAxJBxy4xSU4ach/fXX4DGeshQo3waP6uudBoVsETU
	mpxK3QuA5yhqJiMuKNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDbHt-00Gm5g-WE; Fri, 06 Jan 2023 01:12:50 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDbHp-00Glrn-H9
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 01:12:48 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4B76424DBC0;
	Fri,  6 Jan 2023 09:11:57 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 6 Jan
 2023 09:11:57 +0800
Received: from [192.168.2.237] (183.27.98.121) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 6 Jan
 2023 09:11:55 +0800
Message-ID: <2286c916-c54c-bdda-b1d9-b704813b6fec@starfivetech.com>
Date: Fri, 6 Jan 2023 09:11:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 0/4] Temperature sensor support for StarFive JH7110
 RISC-V SoC
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, Jean Delvare
	<jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20230103013145.9570-1-hal.feng@starfivetech.com>
 <20230103015601.GB313835@roeck-us.net>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230103015601.GB313835@roeck-us.net>
X-Originating-IP: [183.27.98.121]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_171245_884890_27821C62 
X-CRM114-Status: GOOD (  17.13  )
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

On Mon, 2 Jan 2023 17:56:01 -0800, Guenter Roeck wrote:
> On Tue, Jan 03, 2023 at 09:31:41AM +0800, Hal Feng wrote:
> > This patch series adds temperature sensor support for StarFive JH7110 SoC.
> > The last two patches depend on series [1].
> > 
> > [1]: https://lore.kernel.org/all/20221220011247.35560-1-hal.feng@starfivetech.com/
> > 
> > Emil Renner Berthing (4):
> >   dt-bindings: hwmon: Add starfive,jh71x0-temp
> >   hwmon: (sfctemp) Add StarFive JH71x0 temperature sensor
> >   riscv: dts: starfive: jh7110: Add temperature sensor node
> >   riscv: dts: starfive: visionfive-2: Add thermal-zones
> > 
> 
> The hardware monitoring driver is obviously either the same
> or derived from the previous series at
> https://patchwork.kernel.org/project/linux-hwmon/list/?series=&submitter=&state=*&q=starfive
> 
> Why is this not submitted as v4 of the original series ?
> What has changed, and what is the rationale for (re-)submitting
> it as v1 ?

Sorry for the late reply. I feel sorry to say that I didn't know
the submitting history of this patch series and Emil forgot to
tell me maybe. After comparing with the previous series, I find
the changes between this one and the previous one can be concluded
as below.

Change log:
- Added support for StarFive JH7110 SoC besides JH7100.
- Added clock and reset support in dt-bindings and driver.
- Added two patches for adding nodes in JH7110 and VisionFive 2 dts
  which were being reviewed.

Thank you for your kindly reminding. I will resend this patch
series as version 4 and add the change log.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
