Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A754AC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XEo+Q9POWXlgHLnb6P1nl4HTJh0kOcqqtf5c80SCL2E=; b=p1aQW8GUZWFBc5
	PcnzZnkylJFTzXYWorNrdAwsv3ssp5MHHDDExRZGRgEk6dxPlZn8vJ1yW9EOaXOyoexKAFdkKda/j
	q7XH96TrtiwPRoK8Dy1I0ucQxklrQiEts7fUhIAjMz2hVkeRyDSw5rsqFtrxMHd8p0fHDPaNFoAWp
	P58qiEiRVCXKHsUaoer4JvBOpV5/gZga/Xq8tsMQeSThCgLOZ6V8oVLwz+z4ctBA+ptMclAI10MQW
	5T4D0qxwsH/M7xev00Y/oFNGE3zH7atK2vh9fUD+6+EJx5m4mHzTIEKvf7JRPfWdQ3xdlOdEJcBmT
	O/sA91UWaEgrb2DnMfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlbZ-006diF-Oi; Tue, 31 Jan 2023 08:03:01 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlbT-006dgN-Sz
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 08:02:59 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BA501682646;
	Tue, 31 Jan 2023 16:02:01 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 31 Jan
 2023 16:02:01 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 31 Jan
 2023 16:02:00 +0800
Message-ID: <fdad1eaf-bba5-0706-e3bf-9a4869ea4e92@starfivetech.com>
Date: Tue, 31 Jan 2023 16:02:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/3] riscv: dts: starfive: Add mmc node
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	<linux-kernel@vger.kernel.org>
References: <20221227122227.460921-1-william.qiu@starfivetech.com>
 <20221227122227.460921-4-william.qiu@starfivetech.com>
 <Y8mPRQnGPpAhpu8C@spud>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <Y8mPRQnGPpAhpu8C@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_000256_126288_80A76DCD 
X-CRM114-Status: GOOD (  13.39  )
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



On 2023/1/20 2:43, Conor Dooley wrote:
> Hey William,
> 
> On Tue, Dec 27, 2022 at 08:22:27PM +0800, William Qiu wrote:
>> This adds the mmc node for the StarFive JH7110 SoC.
>> Set sdioo node to emmc and set sdio1 node to sd.
>> 
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-v2.dts         | 25 ++++++++++++
> 
> FYI, this file does not exist in the v3 Devicetree patchset sent by Hal
> Feng:
> https://lore.kernel.org/linux-riscv/20221220011247.35560-1-hal.feng@starfivetech.com
> 
> Would you make sure that future revisions take into account that there
> is now a jh7110-starfive-visionfive-2.dtsi file instead?
> 
> Thanks,
> Conor.
> 
Hi Conor,

I did it based on v2 and will rebase to v3 in the next version.

Best Regards
William Qiu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
