Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4903BC7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 01:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/q/oa8lczS9fCGdwY1CYhAKATncuXnoVK8OcK2AF/0=; b=PO9bCrjWbJs7L+
	f56MDxTdSvR6/zeBZp0YRAT8cTnnRzs/WM4EGZ0MOxKlPMnQ9f/h7D1ObuQlZ9Ig4ZhwDd+qd5qqe
	0xn7XjAttFlLZZD/otG+L32kWI7IzFYOjWRshOPM9POFVdJZUVVZedctuvaMFDCYgsIh4hPGEhtAz
	MqoxK+KD87RI4l8V4vQui40kkWleNjwska6lQy9O9EWDK0+H7mGMEkaE3ZjiX9apA7CHrAvdKkPOP
	hoFlC08wJVpArLyQ3wNZysAXmVWLzfJ5tuYe9XYbO0KdEE3tDfyPdqBflyF1HY/qQr2WsMjVCu3eu
	6Kwm+BU/wI+ECg2kNycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3oSb-00C7yx-1n;
	Tue, 30 May 2023 01:47:41 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3oSV-00C7wZ-1r;
	Tue, 30 May 2023 01:47:37 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A041A24E272;
	Tue, 30 May 2023 09:47:00 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 30 May
 2023 09:47:00 +0800
Received: from [192.168.125.107] (113.72.147.198) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 30 May
 2023 09:46:59 +0800
Message-ID: <e41b68bc-5f70-8b89-0f8d-5bf715f6bb5a@starfivetech.com>
Date: Tue, 30 May 2023 09:46:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 0/3] Add JH7110 MIPI DPHY RX support
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230529121503.3544-1-changhuang.liang@starfivetech.com>
 <20230529-unsocial-activity-9607a9bd3989@wendy>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230529-unsocial-activity-9607a9bd3989@wendy>
X-Originating-IP: [113.72.147.198]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_184735_762377_3C3BA755 
X-CRM114-Status: UNSURE (   9.12  )
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



On 2023/5/29 22:08, Conor Dooley wrote:
> On Mon, May 29, 2023 at 05:15:00AM -0700, Changhuang Liang wrote:
>> This patchset adds mipi dphy rx driver for the StarFive JH7110 SoC.
>> It is used to transfer CSI camera data. The series has been tested on
>> the VisionFive 2 board.
>>
>> This patchset should be applied after the patchset [1] [2]:
>> [1] https://lore.kernel.org/all/20230518101234.143748-1-xingyu.wu@starfivetech.com/
>> [2] https://lore.kernel.org/all/20230519060202.15296-1-changhuang.liang@starfivetech.com/
> 
> Are these are only relevant for the dts patch, or for the whole series?
> 

[1] is clock framework, [2] is power framework. Maybe they are only relevant for the dts patch.

Thank, 
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
