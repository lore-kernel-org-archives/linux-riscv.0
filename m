Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23D5C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 02:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UiJC02BXMD9lINNTbogyUqKX0mX4fd7ACyi6v26odKU=; b=upiyVwyO/qB35l
	a9QlszN4FpPJgwYsnZtP+eSf9B05pXMXzNoB2Jn3/zCiVPyZAkolsu8+/fXRIWa4iNbKKYaTahWpg
	v6c15M8+2dbT8onbnSNPSzquJuPjMcu4IAbHrX7h5Onj9W/M081sSFez6EAlVgLHVFsshOqjwEZVY
	J88627sYkX/Yv4P5hfigCn27ODdJYVfcrkqh1REPXv4T+X+lEzVb8RxuDnJ2yUWwsLk7AClwOjzi6
	HqoSSm0MdAF04/37LD96EGaccxcYncmqKMxGSrGZck7goY1JotaYhvicRB6aPjHEK0kDGIO5cuX2n
	5mwIubBwdZtGOE5XC0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peRSE-00AzUJ-1O;
	Tue, 21 Mar 2023 02:10:26 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peRS9-00AzTi-1z;
	Tue, 21 Mar 2023 02:10:23 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8748F24E1FB;
	Tue, 21 Mar 2023 10:10:00 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Mar
 2023 10:10:00 +0800
Received: from [192.168.125.82] (183.27.97.64) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Mar
 2023 10:09:59 +0800
Message-ID: <7f38d366-f3da-7441-3400-7719b0f33326@starfivetech.com>
Date: Tue, 21 Mar 2023 10:09:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/3] Add JH7110 MIPI DPHY RX support
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230223015952.201841-1-changhuang.liang@starfivetech.com>
 <7e525c7d-d534-adba-4aea-a485ba37bcc7@starfivetech.com>
 <ZBhT8tpBhdFugurm@matsya>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <ZBhT8tpBhdFugurm@matsya>
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_191021_990717_9734EA8F 
X-CRM114-Status: GOOD (  11.27  )
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



On 2023/3/20 20:39, Vinod Koul wrote:
> On 03-03-23, 14:05, Changhuang Liang wrote:
>>
>>
>> On 2023/2/23 9:59, Changhuang Liang wrote:
>>> This patchset adds mipi dphy rx driver for the StarFive JH7110 SoC.
>>> It is used to transfer CSI camera data. The series has been tested on
>>> the VisionFive 2 board.
>>>
>>> This patchset should be applied after the patchset [1] and patch [2]:
>>> [1] https://lore.kernel.org/all/20230221083323.302471-1-xingyu.wu@starfivetech.com/
>>> [2] https://lore.kernel.org/all/20230215113249.47727-4-william.qiu@starfivetech.com/
>>>
>> Hi, Vinod and Kishon
>>
>> Could you please help to review and give me some suggestions
>> for this patch series? Thank you for your time.
> 
> There are already comments on dt-binding, please address them!
> 

I have address them on v3, and I am really looking forward to your comments. 
Thank you so much for wasting your time.

>>
>> Best regards,
>> Changhuang
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
