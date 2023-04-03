Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD12C761A6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 06:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PAUggko5Z1S+w83HvyvR6Qv3WNcTGFStUaTR4274jI=; b=ou4XrBrXnikCHd
	/ut57Y15foxjeV5QtBel55RwlB1qf8p9Z8sT1yi8q4co/mt5t8GZf+Fy1ZvjHQ9lE/Kcvf68dmEE0
	35fb+fPQVQaGlffs9LdhngWtCv/RhonDHhbsSKpwOAy/pbEW2cStUia3OsRaWCeld6aLPE17Spb1n
	aVJrEpQ5M3zKiGhxHd+tqB8FXC/uNW9UMVPDDHjnJMQPBXNiYj6Jr5hQ7IuE8FJYuIckYTaUnyjWz
	H3prVaO13sj54tNdDez0lW3F4axdfh5rW9oplCrWl+sF4tyLERxGL1JCXFqdciqkwR8oKAHEyRq20
	zKsv3mwwpHGC0/2gOBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjDrR-00EI0v-0z;
	Mon, 03 Apr 2023 06:40:13 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjDrN-00EHza-0c;
	Mon, 03 Apr 2023 06:40:11 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 38B2424E14F;
	Mon,  3 Apr 2023 14:39:29 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 14:39:29 +0800
Received: from [192.168.125.82] (183.27.97.179) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 14:39:28 +0800
Message-ID: <374e7ebd-bf39-2792-2847-24b14d1d871d@starfivetech.com>
Date: Mon, 3 Apr 2023 14:39:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] phy: starfive: Add mipi dphy rx support
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230223015952.201841-1-changhuang.liang@starfivetech.com>
 <20230223015952.201841-3-changhuang.liang@starfivetech.com>
 <ZBhTmTEcrV59oaw3@matsya>
 <2aa1bdbd-e37e-941a-9422-0908545c14f7@starfivetech.com>
 <ZCbloBdeffocT3Os@matsya>
 <d48ab612-213a-8d20-4b36-3f64f3d24721@starfivetech.com>
 <0dd5e35b-512e-41ed-af33-f94b7e2868c1@spud>
 <b07842e4-54cc-873e-3140-4a933e054802@starfivetech.com>
 <ZCpzjIrcKt4t93gn@matsya>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <ZCpzjIrcKt4t93gn@matsya>
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_234009_573962_736BA0AF 
X-CRM114-Status: GOOD (  10.35  )
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



On 2023/4/3 14:34, Vinod Koul wrote:
> On 03-04-23, 14:31, Changhuang Liang wrote:
>>
>>
>> On 2023/4/3 14:24, Conor Dooley wrote:
>>> On Mon, Apr 03, 2023 at 09:39:00AM +0800, Changhuang Liang wrote:
>>>> On 2023/3/31 21:52, Vinod Koul wrote:
>>>>> On 21-03-23, 14:08, Changhuang Liang wrote:
>>>>>> On 2023/3/20 20:37, Vinod Koul wrote:
>>>>>>> On 22-02-23, 17:59, Changhuang Liang wrote:
> 
>>>>>>>> +static int stf_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
>>>>>>>> +{
>>>>>>>> +	struct stf_dphy *dphy = phy_get_drvdata(phy);
>>>>>>>> +	int map[6] = {4, 0, 1, 2, 3, 5};
>>>>>>>
>>>>>>> what does this mean?
>>>>>>
>>>>>> This is the physical lane and logical lane mapping table, should I add a note for it?
>>>>>
>>>>> Yes please. Also will the mapping be always static or ever change?
>>>>>  
>>>>
>>>> The mapping is always static on the visionfive2 single board computer.
>>>> Thanks for your comments.
>>>
>>> What about other boards featuring a JH7110?
>>
>> maybe add this mapping in the device tree, we just need to parse the device tree is better.
> 
> If the mapping is hw description then yes it makes sense
> 

Yes, different hardware may be described differently, I will change it in next version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
