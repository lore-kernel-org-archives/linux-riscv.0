Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9332DC76196
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 06:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+B+zRJiH0JOU/B3vsZArzLPbd/e+kZn2y/8v5J8EEtQ=; b=nYU8DTLRx5BRGp
	mnNDTnFw9AhvxKNY30itlE+6WDDhYs4/IIVv821HeYuSM9LJ25PKz236GfsNrUdCWwYDMcyaUz2ad
	skCYzgXM66RLvyAjNIBnSx7DagBodVX4djsgxXbZg2UON7WY4FeK2cyoxLUlAFuMXZPbkArZOLU23
	t9rMYx7QWxlKGirArtTGZwniXglrdLvuAnsPhp3f9A471YE1k2aUn3SPMygvcPmYyIJwHwlqisPrv
	owj+Iz2W27bI+fYBfeaW3kgtPrLnA6y8dNWRj3nzwmkY5hvH5PzdEq2Uyn4XoNsmDkBbqoNdshAAh
	L7rxtXB3aYqTN8Deav5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plkeq-00EdaW-0S;
	Mon, 10 Apr 2023 06:05:40 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plkem-00EdZZ-2n
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 06:05:39 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8AA8A24DC94;
	Mon, 10 Apr 2023 14:05:01 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 14:05:01 +0800
Received: from [192.168.125.87] (113.72.145.176) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 14:05:00 +0800
Message-ID: <629439b9-13e4-7a69-bb56-7c3f7622c332@starfivetech.com>
Date: Mon, 10 Apr 2023 14:04:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 2/2] hwmon: (sfctemp) Add StarFive JH71x0 temperature
 sensor
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Jean Delvare
	<jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
References: <20230321022644.107027-1-hal.feng@starfivetech.com>
 <20230321022644.107027-3-hal.feng@starfivetech.com>
 <4423f128-dff8-421a-ae9b-b45c087481a4@roeck-us.net>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <4423f128-dff8-421a-ae9b-b45c087481a4@roeck-us.net>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_230537_079255_D37E6A46 
X-CRM114-Status: UNSURE (   7.87  )
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

On Sat, 8 Apr 2023 08:29:36 -0700, Guenter Roeck wrote:
> On Tue, Mar 21, 2023 at 10:26:44AM +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add driver for the StarFive JH71x0 temperature sensor. You
>> can enable/disable it and read temperature in milli Celcius
>> through sysfs.
>> 
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Co-developed-by: Samin Guo <samin.guo@starfivetech.com>
>> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> 
> Applied.

Thank you so much! Looking forward to seeing it in v6.4.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
