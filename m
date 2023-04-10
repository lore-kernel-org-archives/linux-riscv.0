Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A62C76196
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3gU3yqkPwMWeZPp/PlmRW2JM5wgX8SVxiAnI+4Eji0=; b=LMeGdOHL+wShsZ
	SQgJleIVzjH/6KerHDC6/1yS0Y66hLRPvdz9AWwl3KN/sLvGn+99oaLcqZ3AgyjT2Wb2L22xa0bt+
	aGB7i8hCnl11Jx3uYEx9kqeCaWUJzVoXinsDtJho9fhHA9opmYh+HNbgVlsLeMdYmb4MAAXrW0rPD
	NbCLYXIyPZ/iVZ6TFOokQZfXo7klNfhtCB6L5nS0TAGUmR6+LntdpCWshe8Qvmc/37OOQzxVc0s/I
	ZSY6QxmFVWGhHfiYfqTe8G8he/4IiTMgAxEVh7jb1wPggMvsW7BZ91okvVbfm/In1bGI71tSeLt2e
	ss2Dn6+EqhUJPItcMQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plnMc-00EqUe-34;
	Mon, 10 Apr 2023 08:59:02 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plnMY-00EqTZ-0Y
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 08:59:00 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 029C124E2A5;
	Mon, 10 Apr 2023 16:58:17 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 16:58:16 +0800
Received: from [192.168.125.108] (113.72.145.176) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 16:58:15 +0800
Message-ID: <ac4b10d3-2a9f-b0a2-8004-38357266c861@starfivetech.com>
Date: Mon, 10 Apr 2023 16:58:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 0/3] Add JH7110 PCIe driver support
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
	<kw@linux.com>, <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, <daire.mcnamara@microchip.com>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
 <20230406-quench-unharmed-2c11b2617e9f@wendy>
 <20230406-coming-stuffed-26f89610959c@wendy>
 <d9dde509-8923-a930-4c82-4bc8bd78ed0d@starfivetech.com>
 <20230407-splatter-greyhound-edc706148337@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230407-splatter-greyhound-edc706148337@wendy>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_015858_542070_38C5C90C 
X-CRM114-Status: GOOD (  37.92  )
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



On 2023/4/7 17:57, Conor Dooley wrote:
> Hey Minda,
> 
> On Fri, Apr 07, 2023 at 10:32:51AM +0800, Minda Chen wrote:
>> On 2023/4/6 19:54, Conor Dooley wrote:
>> > On Thu, Apr 06, 2023 at 12:47:41PM +0100, Conor Dooley wrote:
>> >> On Thu, Apr 06, 2023 at 07:11:39PM +0800, Minda Chen wrote:
>> >> > This patchset adds PCIe driver for the StarFive JH7110 SoC.
>> >> > The patch has been tested on the VisionFive 2 board. The test
>> >> > devices include M.2 NVMe SSD and Realtek 8169 Ethernet adapter.
>> >> 
>> >> I was talking with Daire last week about some changes he's working on
>> >> for the microchip driver, and we seemed to recall an off-list email
>> >> sent to Daire & Bjorn about extracting the common PLDA bits from the
>> >> pcie-microchip-host driver to be used with an (at that point)
>> >> unreleased SoC. Perhaps Bjorn has this in his mailbox somewhere still,
>> >> our corporate mail policy scrubs things from over a year ago & I could
>> >> not find it.
>> >>
>> >> I realised that that may actually have been StarFive, and the driver on
>> >> your GitHub [1] certainly felt very familiar to Daire (he said it was
>> >> very similar to his earlier revisions of his driver).
>> >> 
>> >> I've not looked at a diff between this and the version you ship on
>> >> GitHub, but first a quick inspection it mostly just looks like you
>> >> did s/plda/sifive/ on the file.
>> >> 
>> >> I'm obviously not a PCI maintainer, but if there are common bits between
>> >> the two drivers, extracting common bits seems like a good idea to me...
> 
>> Thanks. It is pleasure to using same common codes. Does common bits changes
>> will upstream soon?
> 
> I don't quite get what you mean. We've got some changes that are in
> progress here:
> https://lore.kernel.org/linux-pci/20230111125323.1911373-1-daire.mcnamara@microchip.com/
> We've been quiet there for a while, but Daire's back looking into Robin's
> comments in there about the range parsing/window setup at the moment.
> 
> I'm not sure if that's what you mean though, since you said "common
> bits" & Daire was doing that work in a world where there was no jh7110
> driver in the mix.
> Extracting common bits would be part of the process of adding a new
> driver, as I don't think there's any real reason to do so without
> another in-tree user.
> 
OK, I know extracting common bits is microchip new PCIe driver codes changed.
Just ignore my previous comments.
Maybe I will try to restructuring the driver code according to corporate e-mail which has been sent one year ago.
>> And I see there are many difference between pcie-microchip-host and our codes.
> 
> Right. I'd expect there to be a fair difference between our integrations
> of the IP, and therefore there'll be a bunch of non-shareable bits.
> 
> You need the stg,syscon & phy bits, and the clock/reset handling is
> clearly different too.
> 
>> >> https://github.com/starfive-tech/linux/blob/JH7110_VisionFive2_devel/drivers/pci/controller/pcie-plda.c
> 
> I had a bit of a read through this again today with Daire to check what
> the differences actually are and it *looked* like the main,
> non-implementation related, differences were the extra "event" domain
> that was created to simplify the driver & the bottom half interrupt
> handling.
> That all came out of the review process, so it's likely that some of the
> same requests would be made of you by the PCI maintainers anyway.
> 
Thanks. I will check it and change my codes.
> As an aside, you should probably run checkpatch --strict on this
> submission, there's a rake of coding style "issues" in the new code
> you've added.
> 
I do not run checkpatch with "--strict". I will run with it.
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
