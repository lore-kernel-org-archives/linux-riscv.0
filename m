Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F4AC001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QuDMz2Gv50pu56ZXBb8jc526sF0nUEXJM3VR9hKS2A=; b=vFZ8hCxF1FHGAX
	b6msIyZLflROcZaMM0n4bTwLe/nOZQmdSmcMrLgD2bq6tq9Ey142Eohv28G1l950wyjz4c+m7ZsEQ
	1BeQJ3FWvuhWI5C3vGrGM5TLTaEJtV9UzmNcSPTjCk2l0vHDHEIEZD68CSF99u6TlxaRoR/RBBmMo
	bWeo53YhCMK5tTSG4OlIrhfewdfH//TLQfkVfz4lMDJ/F3xqSAFH4P+m66jcPqaM3hRJudJ3k4kQt
	PP16TPXBfDKUqMg01ZxaaRXXiUXmsT+MkIYkXXhctjtLIjXkEzrhH0unuw9r5hLQk6N4wJkw8RDmi
	IOFYy2v1SZxJzKjJdrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNscm-003e9N-1l;
	Mon, 24 Jul 2023 10:17:08 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsck-003e7P-0n
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:17:07 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0988C24E35D;
	Mon, 24 Jul 2023 18:16:52 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Jul
 2023 18:16:52 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Jul
 2023 18:16:51 +0800
Message-ID: <eb258dcd-a8f0-26ed-2d77-f49269ebb469@starfivetech.com>
Date: Mon, 24 Jul 2023 18:16:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 0/4] StarFive's Pulse Width Modulation driver support
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
	<hal.feng@starfivetech.com>
References: <20230601085154.36938-1-william.qiu@starfivetech.com>
 <c3c7fb8a-7c0c-5966-88cd-e004db69de83@starfivetech.com>
In-Reply-To: <c3c7fb8a-7c0c-5966-88cd-e004db69de83@starfivetech.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_031706_594865_7FB2F84D 
X-CRM114-Status: GOOD (  18.23  )
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



On 2023/6/27 15:46, William Qiu wrote:
> 
> 
> On 2023/6/1 16:51, William Qiu wrote:
>> Hi,
>> 
>> This patchset adds initial rudimentary support for the StarFive
>> Pulse Width Modulation controller driver. And this driver will
>> be used in StarFive's VisionFive 2 board.The first patch add
>> Documentations for the device and Patch 2 adds device probe for
>> the module.
>> 
>> Changes v2->v3:
>> - Rebased to v6.4rc3.
>> - Sorted the header files in alphabetic order.
>> - Changed iowrite32() to writel().
>> - Added a way to turn off.
>> - Moified polarity inversion implementation.
>> - Added 7100 support.
>> - Added dts patches.
>> - Used the various helpers in linux/math.h.
>> - Corrected formatting problems.
>> - Renamed dtbinding  to 'starfive,jh7100-pwm.yaml'.
>> - Dropped the redundant code.
>> 
>> Changes v2->v3:
>> - Fixed some formatting issues.
>> 
>> Changes v1->v2:
>> - Renamed the dt-binding 'pwm-starfive.yaml' to 'starfive,jh7110-pwm.yaml'.
>> - Dropped the compatible's Items.
>> - Dropped the unuse defines.
>> - Modified the code to follow the Linux coding style.
>> - Changed return value to dev_err_probe.
>> - Dropped the unnecessary local variable.
>> 
>> The patch series is based on v6.4rc3.
>> 
>> William Qiu (4):
>>   dt-bindings: pwm: Add StarFive PWM module
>>   pwm: starfive: Add PWM driver support
>>   riscv: dts: starfive: jh7110: Add PWM node and pins configuration
>>   riscv: dts: starfive: jh7100: Add PWM node and pins configuration
>> 
>>  .../bindings/pwm/starfive,jh7100-pwm.yaml     |  55 +++++
>>  MAINTAINERS                                   |   7 +
>>  .../boot/dts/starfive/jh7100-common.dtsi      |  24 +++
>>  arch/riscv/boot/dts/starfive/jh7100.dtsi      |   9 +
>>  .../jh7110-starfive-visionfive-2.dtsi         |  22 ++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |   9 +
>>  drivers/pwm/Kconfig                           |   9 +
>>  drivers/pwm/Makefile                          |   1 +
>>  drivers/pwm/pwm-starfive-ptc.c                | 192 ++++++++++++++++++
>>  9 files changed, 328 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pwm/starfive,jh7100-pwm.yaml
>>  create mode 100644 drivers/pwm/pwm-starfive-ptc.c
>> 
>> --
>> 2.34.1
>> 
> Hi everyone,
> 
> Could you please help me review this patch series to see if there is
> anything that needs to be modified?
> Thanks for taking time to review this patch series.
> 
> Best Regards,
> William

Hi Thierry Reding,

Could you please help me review this patch series to see if there is
anything that needs to be modified?
Thanks for taking time to review this patch series.
 
Best Regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
