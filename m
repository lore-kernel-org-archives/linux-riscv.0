Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E4FC64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 01:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQLfKyaH4tAg+6dxzKJqmWT/QyjjqO2ZZVRZ60HpNVQ=; b=wHtUfby/btZz7L
	5KeDqX2zkiZk+UP5xCk6NDEoXkhCff2OFMVW9G2b1YsClgVex5xaD5ckuNZxM8ZREHajMX+XZ++Xc
	kQP6JhOazni34I5nwsbrEu4SWdJ8tvo+Xp3UvIg+UEg1wnwyCU90u7XcbW3ucL9kp3T1ePzJ1YxWi
	S+jJvltSRR27l/TOt3M1e52eZAU6ZP69zoo1KFBS/ZR6h6uYLwQ3cYP7OUZNIAuRiecQYBtcX3Tl1
	2kphpjPlB77VWPhniB8ExzYrmYCQUAytgKuB+tOEPDGLtHQyvqdl46ytozfrx4uH/PculExW25Jrr
	+VxSmymXUixe/1xUtncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWScS-008AqP-M9; Mon, 27 Feb 2023 01:48:00 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWScP-008Ap0-B7
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 01:47:59 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id F35EC24E205;
	Mon, 27 Feb 2023 09:47:07 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 09:47:07 +0800
Received: from [192.168.125.128] (113.72.145.171) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 09:47:06 +0800
Message-ID: <0a1f48b4-8bba-afed-dd08-4d2c3d69cdb6@starfivetech.com>
Date: Mon, 27 Feb 2023 09:47:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
	Samin Guo <samin.guo@starfivetech.com>, <linux-kernel@vger.kernel.org>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com>
 <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
 <CA6686A1-2336-442F-8C7B-7D8EFEEE1940@kernel.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <CA6686A1-2336-442F-8C7B-7D8EFEEE1940@kernel.org>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_174757_708574_1226BD78 
X-CRM114-Status: UNSURE (   8.95  )
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

On 2023/2/26 22:33, Conor Dooley wrote:
> 
> 
> On 26 February 2023 14:14:25 GMT, Emil Renner Berthing <emil.renner.berthing@canonical.com> wrote:
>>On Mon, 20 Feb 2023 at 09:21, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>>>
>>> Add watchdog driver for the StarFive JH7110 SoC.
>>>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>> ---
>>>  MAINTAINERS                     |   7 +
>>>  drivers/watchdog/Kconfig        |   9 +
>>>  drivers/watchdog/Makefile       |   2 +
>>>  drivers/watchdog/starfive-wdt.c | 651 ++++++++++++++++++++++++++++++++
>>>  4 files changed, 669 insertions(+)
>>>  create mode 100644 drivers/watchdog/starfive-wdt.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 135d93368d36..6cbcf08fa76a 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -19933,6 +19933,13 @@ F:     Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
>>>  F:     drivers/reset/reset-starfive-jh7100.c
>>>  F:     include/dt-bindings/reset/starfive-jh7100.h
>>>
>>> +STARFIVE JH7110 WATCHDOG DRIVER
>>> +M:     Xingyu Wu <xingyu.wu@starfivetech.com>
>>> +M:     Samin Guo <samin.guo@starfivetech.com>
>>> +S:     Supported
>>> +F:     Documentation/devicetree/bindings/watchdog/starfive*
>>> +F:     drivers/watchdog/starfive-wdt.c
>>> +
>>>  STATIC BRANCH/CALL
>>>  M:     Peter Zijlstra <peterz@infradead.org>
>>>  M:     Josh Poimboeuf <jpoimboe@kernel.org>
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index 0bc40b763b06..4608eb5c9501 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -2089,6 +2089,15 @@ config UML_WATCHDOG
>>>         tristate "UML watchdog"
>>>         depends on UML || COMPILE_TEST
>>>
>>> +config STARFIVE_WATCHDOG
>>> +       tristate "StarFive Watchdog support"
>>> +       depends on RISCV
>>
>>Let's do like the pinctrl and clock drivers and
>>
>>    depends SOC_STARFIVE || COMPILE_TEST
> 
> Or better yet, rebase on 6.3-rc1, and use ARCH_STARFIVE and save me a conversion!
> 

Will modify this.

Best regards,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
