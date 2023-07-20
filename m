Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77757EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 06:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxKgNoeLdHDGn3e3W6lTlM1wmAdl/2lW006LL4Zry9c=; b=us4ZC9rL7zQ9lj
	88K/5Ljx7x/yK6TA03OD5kQxL9cwm5Jp6yhvDyjCiXxWieAl8+LovkzcUZFP7iAmz5okullOLVlow
	Iqia3kU6ZFK2ttbf5HhzT9unX/sw0+UhMVbGJ+5jrMCpg+jvFwAsfzoIuT60qAPNn7ybbQJzY/Kw6
	0h9iljyQot24Ch3riiASgSG/tCHcFe141C430idd6mp7OcbHUTsAv6d9bb2tU6Vjs7/yeTy7DNvV3
	utUBjuuO1NF7tvdeUUgYPb+M0/oK2Zl8xEkH2jrvA/z+zdqopTgW63dpTpUPy4zfw1XHWoQcd7HL9
	GV5spVCiztrl7yI2cx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNFf-009x8W-1a;
	Thu, 20 Jul 2023 06:35:03 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNFb-009x3e-2b
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 06:35:02 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3252324E36A;
	Thu, 20 Jul 2023 14:34:04 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 14:34:04 +0800
Received: from [192.168.125.113] (113.72.147.86) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 14:34:03 +0800
Message-ID: <d397c3ba-4ac9-bf21-5ae4-79db6c2ad16e@starfivetech.com>
Date: Thu, 20 Jul 2023 14:34:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] riscv: dts: Enable device-tree overlay support for
 starfive devices
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Felix Moessbauer <felix.moessbauer@siemens.com>, Emil Renner Berthing
	<kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Daniel Bovensiepen
	<daniel.bovensiepen@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <20230627080620.329873-1-felix.moessbauer@siemens.com>
 <20230710-villain-dainty-d1a90ce57a27@spud>
 <CAJM55Z_0X+UT1s9s4kqKuyg4hF2JooTMXe4RYTAzoEgY=+8A1Q@mail.gmail.com>
 <20230712-single-crestless-93bf57c09773@spud>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230712-single-crestless-93bf57c09773@spud>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_233500_016224_AB823E08 
X-CRM114-Status: GOOD (  23.41  )
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



On 2023/7/13 0:23, Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 06:17:19PM +0200, Emil Renner Berthing wrote:
>> On Mon, 10 Jul 2023 at 20:29, Conor Dooley <conor@kernel.org> wrote:
>> >
>> >
>> > Emil, Walker,
>> >
>> > On Tue, Jun 27, 2023 at 04:06:20PM +0800, Felix Moessbauer wrote:
>> > > Add the '-@' DTC option for the starfive devices. This option
>> > > populates the '__symbols__' node that contains all the necessary symbols
>> > > for supporting device-tree overlays (for instance from the firmware or
>> > > the bootloader) on these devices.
>> > >
>> > > The starfive devices allow various modules to be connected and this
>> > > enables users to create out-of-tree device-tree overlays for these modules.
>> > >
>> > > Please note that this change does increase the size of the resulting DTB
>> > > by ~20%. For example, with v6.4 increase in size is as follows:
>> >
>> > Whatcha think?
>> 
>> I'm fine with it. I just wonder why it's only the Nvidia Tegra boards
>> and the VisionFive's that need this. Surely other boards have pins for
>> expansion cards.
> 
> It's totally not just these two - there's been a flurry of similar
> patches recently. The RPi stuff got it - I think I Acked that one from
> the DT side while Rob and Krzysztof were out of office, partially on the
> basis that the Nvidia stuff had it (and IIRC Renesas).
> Since then there's been a couple other ones that got the same treatment,
> including 32-bit ARM Microchip stuff. I've been avoiding doing it for the
> RISC-V Microchip to see if Rob decides that what I Acked was a problem.
> 
> It seems generally helpful, so I've been a little suspicious as to why
> it was not done already...

I agree to use DT overlay though this will increase a little bit size for DTB.
For users who want to use expansion card like audio daughter board, it provides a convenient way.

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
