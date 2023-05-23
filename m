Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634C0C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 05:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYBDSJR+6zxAISopaIM/36D+akCVQ9ZywGX2JGEnIsM=; b=hfx81svWe6JpYi
	6KecwW4wFyGitZ78hntaeNXyoJu1FLCaxftvrVnqf8ksLsWRMq+VmJFgmnvYOXTOlb/6jPOpXG2tI
	7/T1JUDowMjLQcFXIyMgtJeNssOq63JuqB/SjUj1T+YMmE4zhn+NuE1otFZnEwjyTVcycwgAvHMtZ
	Py/9aNH30yGHUvQdTwifTo+MiiwcgaG5xBbXPfyL8H/KzhcvAMEEKMnaqwj/BOFCv5ooR7fZW07+x
	8VgJ64wEHYEhdZ8xsyEt/4egb47W7X1W+cF3+B0UjRKC7u4ZfaPvr2iIJOe9Q485h7NLok4eILf0+
	Jt1Zs0g8kPh+AcfQeGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Kzb-0091Js-1i;
	Tue, 23 May 2023 05:55:31 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1KzX-0091I7-1H;
	Tue, 23 May 2023 05:55:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D0DC124DBC0;
	Tue, 23 May 2023 13:54:52 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 23 May
 2023 13:54:52 +0800
Received: from [192.168.125.107] (183.27.98.143) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 23 May
 2023 13:54:51 +0800
Message-ID: <86ac4ba9-706f-0d35-099d-1575b206ee87@starfivetech.com>
Date: Tue, 23 May 2023 13:54:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 0/3] Add JH7110 MIPI DPHY RX support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel
	<p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230412084540.295411-1-changhuang.liang@starfivetech.com>
 <93d39956-25c9-971b-e73b-09c69e803341@starfivetech.com>
 <20230522-extradite-nastily-c2a88cfd2f02@wendy>
 <7d4c3c08-6590-5947-92c6-1425c0cb662d@starfivetech.com>
 <039744BB-E0C2-4311-A663-DDDD819A219D@kernel.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <039744BB-E0C2-4311-A663-DDDD819A219D@kernel.org>
X-Originating-IP: [183.27.98.143]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_225527_701388_D27F3D05 
X-CRM114-Status: GOOD (  10.36  )
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



On 2023/5/23 13:13, Conor Dooley wrote:
> 
> 
> On 23 May 2023 02:02:24 IST, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:
>>
>>
>> On 2023/5/22 21:11, Conor Dooley wrote:
>>> On Mon, May 22, 2023 at 09:00:04PM +0800, Changhuang Liang wrote:
>>>> On 2023/4/12 16:45, Changhuang Liang wrote:
>>>>> This patchset adds mipi dphy rx driver for the StarFive JH7110 SoC.
>>>>> It is used to transfer CSI camera data. The series has been tested on
>>>>> the VisionFive 2 board.
>>>>>
>>>
>>>> Can you help to find the Vinod reviewed this patchset?
>>>
>>> I am sorry, but I have no idea what you mean.
>>> Are you asking if I can get Vinod to review the series?
>>>
>>
>> Yes, I need his comments.
> 
> No, I cannot. Maybe you should fix any outstanding comments and resubmit?

It seems to be a better way.

Thanks,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
