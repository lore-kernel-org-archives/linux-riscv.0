Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A668E7F150
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 01:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YH+mUzIxxN0HHsk06T8196jA2MAtCVhug9esNgfaHg=; b=fnZCwML0FgTF2G
	hlXpbWiRoybNxqu6btHeqO+Xkv1sTkog+F5pnZhFGnbeiU5xiMPi/2XsA61jOrFEvc7MX6MZ3J2a1
	ozDxZp6j+l+Ep1IxjkA7HZqaXPEBRlwa9utFYBIzCTzO1HTALfRbgpUld011xgwm+vqKwEx88qO8i
	pT16I6wIa2XG5KQIpqefp0ybK4oGyGf3/GLmrajjI42wYiTtVhngFJGKKaQhhB2tO0xgslJzow1gH
	1hMSI5eOYaey0BAOF8m56wgerrHLR/EcyKUjouMIGgu9HAj6TuZZjwjou7+3AE7Sd77uCtn5nPc/E
	6fsGKm4f8P8/OidAbi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlJOw-00HJ5B-23;
	Wed, 27 Sep 2023 01:31:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlJOt-00HJ3r-05
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 01:31:40 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2176224E26F;
	Wed, 27 Sep 2023 09:31:20 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Sep
 2023 09:31:20 +0800
Received: from [192.168.125.107] (113.72.144.128) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Sep
 2023 09:31:19 +0800
Message-ID: <88457ee3-b97a-b350-7f87-20cdc18cb4e9@starfivetech.com>
Date: Wed, 27 Sep 2023 09:31:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [GIT PULL 2/5] dt-bindings: power: Add power-domain header for
 JH7110
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
CC: <ulf.hansson@linaro.org>, Conor Dooley <conor.dooley@microchip.com>,
	<arnd@arndb.de>, <jiajie.ho@starfivetech.com>, <linux-pm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <robh@kernel.org>,
	<walker.chen@starfivetech.com>
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
 <20230913-grumbly-rewrite-34c85539f2ed@spud>
 <CAMuHMdXmNCXvFj8gF0COQrvhbRuugrJN0sM_DL1vDE=4EU0bEA@mail.gmail.com>
 <20230926-trio-sweat-9b878df53209@spud>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230926-trio-sweat-9b878df53209@spud>
X-Originating-IP: [113.72.144.128]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_183139_340672_9073607E 
X-CRM114-Status: GOOD (  14.86  )
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



>>>  #ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
>>> @@ -14,4 +14,7 @@
>>>  #define JH7110_PD_ISP          5
>>>  #define JH7110_PD_VENC         6
>>>
>>> +#define JH7110_PD_DPHY_TX      0
>>> +#define JH7110_PD_DPHY_RX      1
>>
>> These values are conflicting with similarly-named values above:
>>
>>     #define JH7110_PD_SYSTOP        0
>>     #define JH7110_PD_CPU           1
>>
>> Upon closer look, and diving into the driver, this header file contains
>> definitions for two separate number spaces: the first set is meant
>> to be used in PM Domain specifiers referring to a node compatible
>> with "starfive,jh7110-pmu", while the second set is meant to be
>> used in PM Domain specifiers referring to a node compatible with
>> "starfive,jh7110-aon-syscon".
> 
> Yeah, apologies for the confusion there. I maybe should have
> requested an additional file, since the relevant compatibles
> are different.
> 
>> I think it would be nice to have this reflected in the names of
>> the defines (e.g. JH7110_PD_AON_DPHY_TX), and/or to add comments
>> clearly delimiting the two separate number spaces, and explaining
>> where they apply to.
> 
> Since this is 6.7 material, there's still plenty of time remaining to
> make either of these changes. Changhuang Liang, do you think you would
> be able to send a patch implementing either of the suggestions made by
> Geert?
> 

Hi Conor,

I will send a patch to fix this confusion.

Thanks,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
