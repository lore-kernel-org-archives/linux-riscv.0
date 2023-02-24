Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FE4C61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/kDXi5MjdG78abgbV0sSrNr6ljEFvo4U6m1KZfdGn8=; b=gD9qIEEjIAGlma
	Uv4P1bHp2k5HA/oYqM0BcxpTzDTHwLnPj+J1pjG6elm9ZAkFPTlTLjEzCcC3AWAZfugPsZSmvg/C4
	ksSUkPsVBeNhxspsxehFZaFdlY3LXZBwhcY9RIF6GRWeNVKGW0oNNFXkTxgx2Gh7+6T0eTgvboC6Q
	ZJvWLtDN7gHqQ3/vyFaBw79jw4Hl8PUjv9KIKOo7uMyWTGlqoFGE+vrlhH5GHyREcX7XFR8Bn/svP
	GG+JliX1ZqXSQYV9gQQZqpzSWVw4rIGlroqRPPhM/dlo13r74tjzNAwXB1EabVBKAdKQYUNyzkGSh
	lodaY11l5Uw3qBBDryEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTuP-001bui-Dz; Fri, 24 Feb 2023 08:58:29 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVTuL-001bqa-Oj
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 08:58:28 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7DA1F24E2A1;
	Fri, 24 Feb 2023 16:57:50 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 16:57:50 +0800
Received: from [192.168.125.82] (113.72.147.165) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 16:57:49 +0800
Message-ID: <b9b4e45b-eb79-f94f-d96f-764b49ce0471@starfivetech.com>
Date: Fri, 24 Feb 2023 16:57:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 2/2] hwmon: (sfctemp) Add StarFive JH71x0 temperature
 sensor
Content-Language: en-US
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
References: <20230207072314.62040-1-hal.feng@starfivetech.com>
 <20230207072314.62040-3-hal.feng@starfivetech.com>
 <20230208162312.GA3062856@roeck-us.net>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230208162312.GA3062856@roeck-us.net>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_005826_106131_B0723B43 
X-CRM114-Status: GOOD (  14.46  )
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

On Wed, 8 Feb 2023 08:23:12 -0800, Guenter Roeck wrote:
> On Tue, Feb 07, 2023 at 03:23:14PM +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Register definitions and conversion constants based on sfctemp driver by
>> Samin in the StarFive 5.10 kernel.
> 
> "based on ..." does not belong here. Describe what the driver does,
> not what it is based on. If you want to add a note about the origin
> of the driver, add it in the comments on the top of the driver.

Will reword the commit message in the next version.

> 
> Please add the missing default: statements in the driver,

OK. I will fix it accordingly.

> and explain (for example in the comments at the top of the
> driver) why you don't use continuous mode. The description
> needs to be detailed and compelling enough that no one comes
> back and implements a continuous mode version of the driver.

As we discussed in [1], I will use continuous mode instead.
Thanks.

[1] https://lore.kernel.org/all/2c424d39-3a1d-3c91-d049-c0b941359bc3@starfivetech.com/

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
