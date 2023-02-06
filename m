Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B216FC05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sx6KTfFb7M9eV3xkbYkWLtaoQhBBixDt1O76AEoE4UQ=; b=F5mqdkcllipAIe
	QetEDsSVS36UGWh+zF62TCjZfNGsDuBqWDeQpp/znGyGh+xr4YR/vcifhKyJNO1q8C/mH+G4yazVR
	IPIZU7jZ3uHcJsrl228KsOf5yngWCch1uNT5J0vg8o2tUXpXE+17eoo26zZQw72J/09dQ/BymAnJY
	CVsufRRGEoQBPoyDENbNG/5JZnlZ0E/Xjhx91zPTz28Yc8xAjwICYi9bEsRJ6GbLpySaOx5rZgaFK
	JRQcykQJcrr5lwHbN+GBwSLB70gfzxHbicOGY5wvPQQY5JuNEBoxy1Czo2647pqZ9mcvDFs3YaL8t
	lkaWNVjTIXi33UE5CkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP56k-009Rjg-Sf; Mon, 06 Feb 2023 17:16:46 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP56h-009RiJ-VO
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 17:16:45 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0002624E01A;
	Tue,  7 Feb 2023 01:16:30 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 01:16:31 +0800
Received: from [172.16.16.234] (113.72.145.145) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 01:16:30 +0800
Message-ID: <f43ec664-4571-b52d-5b8a-48c8f65addce@starfivetech.com>
Date: Tue, 7 Feb 2023 01:16:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/4] dt-bindings: hwmon: Add starfive,jh71x0-temp
Content-Language: en-US
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
 <20230103013145.9570-2-hal.feng@starfivetech.com>
 <20230103221405.GA217696@roeck-us.net>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230103221405.GA217696@roeck-us.net>
X-Originating-IP: [113.72.145.145]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_091644_180616_6B27811B 
X-CRM114-Status: UNSURE (   9.59  )
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

On Tue, 3 Jan 2023 14:14:05 -0800, Guenter Roeck wrote:
> On Tue, Jan 03, 2023 at 09:31:42AM +0800, Hal Feng wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>> 
>> Add bindings for the temperature sensor on the StarFive JH7100 and
>> JH7110 SoCs.
>> 
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> 
> The previous version of this bindings document (v3, 
> https://patchwork.kernel.org/project/linux-hwmon/patch/20210726171802.1052716-2-kernel@esmil.dk/
> had been reviewed by Rob Herring. Even though this version is named differently
> (starfive,jh71x0-temp.yaml instead of starfive,jh7100-temp.yaml), the old version
> should be referenced, and there should be a change log.

Will add the Reviewed-by tag of Rob and add a change log. Thank you again.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
