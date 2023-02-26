Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D94C64ED6
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Feb 2023 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNWwssClwLNgjzU9GWbVbkp6sgY46tKzNKvJlJb3uk4=; b=yAA2ANL5bdyNWh
	7CZMz59yJDKt7qVfpqaJ+RyckL8ycKjB2qO6PPET0OQvvhc3Xk02rmgYLoyZxTI8+sfvN7K9qKnFr
	VBuX/7/HWJa0CD96sEXPJ3pcy0otc71W9Wt7r9iavJxCN/GjUmkr4IJFU5fqtECfs+04+TJl4Mgrz
	yvIun9gV6z4ifSvo5pAhgJfRXkxzrUDgWc1JNfFBiY0oDFPEfZ88/I+0t/BOycU5GdNvzJiYeSFED
	C0sTplU0k5FzltbsTdTDIYoRR7EVrEW/tg9I9Yz+WnDjC+yOhN4JI/QFXPSFmZB4h/op1X/lhdoFX
	2l35O8N8WwvSGrsSiBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWI5Y-007OCR-9n; Sun, 26 Feb 2023 14:33:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWI5V-007OBu-NO
	for linux-riscv@lists.infradead.org; Sun, 26 Feb 2023 14:33:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 809F760B93;
	Sun, 26 Feb 2023 14:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC50C433EF;
	Sun, 26 Feb 2023 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677421992;
	bh=YnxpkmbkG6PzcFyevBigSqi5GniCxlw3dIbgKnEcWt8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=U3DuBm8ED4PczZm6tJIrICo3o0CiMDJs/JYJdSPCpS0NtAkSmXSQzk7lNXiai09hv
	 pf1kE2IMc0V6kunxscDiTdqyu9iVub+ezxpNfGwo7X8O/V5kYEoAZ43XJNqDZPoEE+
	 88LBVIv83wfKYZ6Usc4hyCyEhESXElIr8FwFOVkWyzfijHsZfd6RnWqkpMg7fylJdh
	 yhJoo65Kh68Fxp/qXpJH2cBein1afGn/NF+mPUfucsqJomFjaV7MDQ0lXAEcp8ydaO
	 +pmOjeiBpmXa4iN+m30WpiUGh/zC7ewF0iVptIbEK5t6Ng7Mf2uGHkF0lfV82hPg0S
	 d1p07RvrhfS2g==
Date: Sun, 26 Feb 2023 14:33:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>
CC: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com> <20230220081926.267695-3-xingyu.wu@starfivetech.com> <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
Message-ID: <CA6686A1-2336-442F-8C7B-7D8EFEEE1940@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_063317_881071_8503CF40 
X-CRM114-Status: GOOD (  12.58  )
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



On 26 February 2023 14:14:25 GMT, Emil Renner Berthing <emil.renner.berthing@canonical.com> wrote:
>On Mon, 20 Feb 2023 at 09:21, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>>
>> Add watchdog driver for the StarFive JH7110 SoC.
>>
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  MAINTAINERS                     |   7 +
>>  drivers/watchdog/Kconfig        |   9 +
>>  drivers/watchdog/Makefile       |   2 +
>>  drivers/watchdog/starfive-wdt.c | 651 ++++++++++++++++++++++++++++++++
>>  4 files changed, 669 insertions(+)
>>  create mode 100644 drivers/watchdog/starfive-wdt.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 135d93368d36..6cbcf08fa76a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19933,6 +19933,13 @@ F:     Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
>>  F:     drivers/reset/reset-starfive-jh7100.c
>>  F:     include/dt-bindings/reset/starfive-jh7100.h
>>
>> +STARFIVE JH7110 WATCHDOG DRIVER
>> +M:     Xingyu Wu <xingyu.wu@starfivetech.com>
>> +M:     Samin Guo <samin.guo@starfivetech.com>
>> +S:     Supported
>> +F:     Documentation/devicetree/bindings/watchdog/starfive*
>> +F:     drivers/watchdog/starfive-wdt.c
>> +
>>  STATIC BRANCH/CALL
>>  M:     Peter Zijlstra <peterz@infradead.org>
>>  M:     Josh Poimboeuf <jpoimboe@kernel.org>
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 0bc40b763b06..4608eb5c9501 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -2089,6 +2089,15 @@ config UML_WATCHDOG
>>         tristate "UML watchdog"
>>         depends on UML || COMPILE_TEST
>>
>> +config STARFIVE_WATCHDOG
>> +       tristate "StarFive Watchdog support"
>> +       depends on RISCV
>
>Let's do like the pinctrl and clock drivers and
>
>    depends SOC_STARFIVE || COMPILE_TEST

Or better yet, rebase on 6.3-rc1, and use ARCH_STARFIVE and save me a conversion!

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
