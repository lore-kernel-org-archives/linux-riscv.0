Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCECEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 01:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4k8CVzA/BnnW1xpdNu6UCHK2lZEVcwtiAr0LiaAeGTQ=; b=UYP+gGAoljOb8e
	mwzz7XfK7qRzZim9clgUdMqPOiTebgTc/6NN1/ooTuzisNaQWYC3QsAOONKM5XNYYFE+/TFKa7Kj2
	hISXP9EoGUo0C3usQIKe5i96SysbxxYKl1LZ7U6mwEo4Xg71jlsiFC3CWk36zcNoHh7dlIJDQi97F
	EVd4RJPbgX+2WHTqaPTcW+jJgBPtEy63SemcSOLamGkvk0HcxBRcsElyCT8OZDKzIIRZMAsaX3xR7
	q5M7eNMle9DAbT3xy9amBt0uygkDZMuI0RAD3wv2S4UDUr5NsVoCVvY+oQ+qYfjmDpMkSb3HXOoZs
	t+EWrpRxXc4wM6/Juipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGVJz-00Brrz-2S;
	Tue, 04 Jul 2023 01:59:15 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGVJw-00Brq2-0Q
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 01:59:14 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 791BF24E271;
	Tue,  4 Jul 2023 09:58:35 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 09:58:35 +0800
Received: from [192.168.120.43] (171.223.208.138) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 09:58:34 +0800
Message-ID: <fd591491-b8aa-b3e0-82e0-7d19c841819e@starfivetech.com>
Date: Tue, 4 Jul 2023 09:58:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 0/8] Add Ethernet driver for StarFive JH7110 SoC
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230313034645.5469-1-samin.guo@starfivetech.com>
 <20230313173330.797bf8e7@kernel.org>
 <51102144-1533-d2f7-5fde-e01160a6f49e@starfivetech.com>
 <ZKChUuUpCgh/jPSU@aurel32.net>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <ZKChUuUpCgh/jPSU@aurel32.net>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_185912_474229_63AAFE30 
X-CRM114-Status: GOOD (  15.36  )
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

Re: [PATCH v6 0/8] Add Ethernet driver for StarFive JH7110 SoC
From: Aurelien Jarno <aurelien@aurel32.net>
tro: Guo Samin <samin.guo@starfivetech.com>
data: 2023/7/2

> Hi,
> 
> On 2023-03-15 09:31, Guo Samin wrote:
>> Re: [PATCH v6 0/8] Add Ethernet driver for StarFive JH7110 SoC
>> From: Jakub Kicinski <kuba@kernel.org>
>> to: Samin Guo <samin.guo@starfivetech.com>
>> data: 2023/3/14
>>
>>> On Mon, 13 Mar 2023 11:46:37 +0800 Samin Guo wrote:
>>>> This series adds ethernet support for the StarFive JH7110 RISC-V SoC.
>>>> The series includes MAC driver. The MAC version is dwmac-5.20 (from
>>>> Synopsys DesignWare). For more information and support, you can visit
>>>> RVspace wiki[1].
>>>
>>> I'm guessing the first 6 patches need to go via networking and patches
>>> 7 and 8 via riscv trees? Please repost those separately, otherwise
>>> the series won't apply and relevant CIs can't run on it.
>>
>> Hi Jakub,
>>
>> 	Thanks a lot, I will repost those separately.
> 
> Unless I am mistaken, this patches haven't been reposted since them.
> Could you please do that?
> 
> Thanks
> Aurelien
> 

Hi Aurelien,

Sorry for not having an update in a while. I'm waiting for the configuration of PHY to be finalized and the SYSCON patch to finally be merged in.
1) There are some updates to visionfive 2's PHY Drive Strength[1], but the implementation has not yet been finalized. Of course this is not the most important thing, since it can be updated later.
2) DTS depends on SYSCON. If the patch about SYSCON[2] has not been merged into the main line, there will be compilation problems. SYSCON's patch is part of Xingyu's PLL patchsets, and if the parts of SYSCON could be merged first, there would be no problem.

[1]: https://patchwork.kernel.org/project/netdevbpf/cover/20230526090502.29835-1-samin.guo@starfivetech.com
[2]: https://patchwork.kernel.org/project/linux-riscv/patch/20230613125852.211636-7-xingyu.wu@starfivetech.com
 
Best regards,
Samin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
