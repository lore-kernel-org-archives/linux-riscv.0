Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C66FC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnHL6PBaaQZ8QhNh38+Kiwg8gK1YQxeUKfsBUvXEpec=; b=wp9uRZOHfRiHkK
	DYk9MbNxmQTKyPix4Gc6zOy++Y8NIRjPF3DZQn3oqwmnObczZMiygSQPI7NK8tqycBRAvBW+oh+v4
	SZCUUZ4t10olliwfI8bRZE/9Se5aEecOYaYXCb2Ok3YIeTz2/y6PBi2hycOZRyHLLAY20gOs4LTDS
	5UNfw7hR/3GICLHkFXIRx32JOcRQus9LhQYKm9PqvFf1D2twgUn8E2XKyV/zxybN+Z5rJOxPv/dS0
	xBLs8eEx2ZHde+Dw17CZyxEvVYVT7SyMLQ1Tv4thDTIlC+C41+MYQT57y1/51K8Ft8T8r9HWestXK
	09komHTiaznTFy1NiLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwg1d-005eAS-2D;
	Wed, 10 May 2023 09:22:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwg1Z-005e3I-0b
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 09:22:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5816224E2A9;
	Wed, 10 May 2023 17:21:25 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 17:21:23 +0800
Received: from [192.168.125.124] (183.27.98.219) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 17:21:22 +0800
Message-ID: <f27b7ee7-f23a-35a2-3b82-71f50871dfcc@starfivetech.com>
Date: Wed, 10 May 2023 17:21:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-4-walker.chen@starfivetech.com>
 <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
 <20230509-overheat-pliable-00d60523637e@spud>
 <CAJM55Z9AxMVw=ymfFBb=45nODq89O8dMebzRgo-XD0GKduDBYg@mail.gmail.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <CAJM55Z9AxMVw=ymfFBb=45nODq89O8dMebzRgo-XD0GKduDBYg@mail.gmail.com>
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_022217_527137_10E1E722 
X-CRM114-Status: GOOD (  18.10  )
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



On 2023/5/10 16:33, Emil Renner Berthing wrote:
> On Tue, 9 May 2023 at 20:05, Conor Dooley <conor@kernel.org> wrote:
>>
>> On Tue, May 09, 2023 at 08:52:48PM +0800, Walker Chen wrote:
>> > Hi Conor/Emil,
>> >
>> > DT overlay is used to describe combinations of VF2 and hat.
>> > Do you have any comments on this patch ?
>>
>> Up to Emil :)
>>
>> I seem to recall that he said at the linux-riscv sync-up call that we
>> have* that he was not in favour of overlays for hats like this.
>> I'll let him confirm that though, I might very well be misinterpreting or
>> misremembering what he said.
> 
> What probably meant was that I didn't want a bunch of different device
> trees for each combination board * hat. An overlay makes a lot more
> sense. However, looking through the kernel tree there is a surprising
> lack of overlays for hats committed already, so I suspect there is
> some sort of policy around overlays already in place.
Hi Emil,

About the specific usage of overlay for this board + hat, referenced to the following example in kernel:
linux/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtso
That board is connected with imx219 sensor via mipi_csi interface. That patch was accepted in 2022.

So do you think this way is feasible ?
Thanks!

Best regards,
Walker
 
> 
>> Cheers,
>> Conor.
>>
>> * https://lore.kernel.org/linux-riscv/mhng-775d4068-6c1e-48a4-a1dc-b4a76ff26bb3@palmer-ri-x1c9a/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
