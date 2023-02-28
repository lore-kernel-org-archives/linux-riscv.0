Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5AAC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 02:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQ7+ZxMBeixWp5Dv5Bf1SWZL6yXYrDzLBukXwkoGx/k=; b=41C7A2icaxg+fH
	/4YddCivX+xtpjXxNcbLCBPWVSWp7vJOKlS++T82OF9TrKW8/fI80vcBTXVlJ8Put1lRjBywcI7GM
	kr4al6h0fDj0FWE+1sazDmH6k1+iRdiY24u6tshuxemJ9VgBUYMJxz7NPoSzE6bVDk9fVNSokfrBG
	uhqMWUqnhs3Y36wea5wkX5J9tcx6ZYJ3IJds90dhZvDqnSlVHm769SN3Lj0jbpLQmaxQSq9d9sDfA
	5xIo+9mjolId5q8Dnuz4ziOT2EXWYqD490h46Xq0Lwt3Lc/PF6VjDFbZ8TFRYG3I7cllz35JIJ/Kj
	/QeNCLUbRgT4NBlG6SSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWqCF-00BsA2-E0; Tue, 28 Feb 2023 02:58:31 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWqCB-00Bs6Q-MH
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 02:58:29 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4BAA124E1A4;
	Tue, 28 Feb 2023 10:58:03 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 10:58:03 +0800
Received: from [192.168.125.82] (113.72.145.171) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 10:58:02 +0800
Message-ID: <9a0f4aa1-be98-cac7-adc4-5af67792a2e2@starfivetech.com>
Date: Tue, 28 Feb 2023 10:58:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 19/19] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-20-hal.feng@starfivetech.com>
 <CAJM55Z_QMtzKeRFN1iGf498z4+vga6RBgwybCQi6aOUYCr_P-Q@mail.gmail.com>
 <2af3f84b-2c2b-dc79-c76c-9411fcbcf7ca@starfivetech.com>
 <Y/zykfydb+bJ7G2l@spud> <Y/0L4SKKtl49C95j@spud>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y/0L4SKKtl49C95j@spud>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_185828_026090_8FECB794 
X-CRM114-Status: GOOD (  25.29  )
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

On Mon, 27 Feb 2023 20:00:33 +0000, Conor Dooley wrote:
> On Mon, Feb 27, 2023 at 06:12:40PM +0000, Conor Dooley wrote:
>> On Thu, Feb 23, 2023 at 04:50:20PM +0800, Hal Feng wrote:
>> > On Tue, 21 Feb 2023 16:03:08 +0100, Emil Renner Berthing wrote:
>> > > On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
>> > >> From: Emil Renner Berthing <kernel@esmil.dk>
>> > >>
>> > >> Add a minimal device tree for StarFive JH7110 VisionFive 2 board
>> > >> which has version A and version B. Support booting and basic
>> > >> clock/reset/pinctrl/uart drivers.
>> > >>
>> > >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> > >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > >> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> > >> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> > >> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
>> > >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> > >> ---
>> > >>  arch/riscv/boot/dts/starfive/Makefile         |   6 +-
>> > >>  .../jh7110-starfive-visionfive-2-v1.2a.dts    |  13 ++
>> > >>  .../jh7110-starfive-visionfive-2-v1.3b.dts    |  13 ++
>> > >>  .../jh7110-starfive-visionfive-2.dtsi         | 215 ++++++++++++++++++
>> > >>  4 files changed, 246 insertions(+), 1 deletion(-)
>> > >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dts
>> > >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dts
>> > >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> > >>
>> > >> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
>> > >> index 039c143cba33..cd73519b907b 100644
>> > >> --- a/arch/riscv/boot/dts/starfive/Makefile
>> > >> +++ b/arch/riscv/boot/dts/starfive/Makefile
>> > >> @@ -1,2 +1,6 @@
>> > >>  # SPDX-License-Identifier: GPL-2.0
>> > >> -dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb jh7100-starfive-visionfive-v1.dtb
>> > >> +dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
>> > >> +dtb-$(CONFIG_SOC_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>> > >> +
>> > >> +dtb-$(CONFIG_SOC_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>> > >> +dtb-$(CONFIG_SOC_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
>> 
>> If you could rebase on top of v6.3-rc1 for the next version & use ARCH_
>> not SOC_ here that'd be great.

I will use the ARCH_ symbol instead and tell the other people from StarFive
to do so.

>> 
>> > >> +/ {
>> > >> +       aliases {
>> > >> +               serial0 = &uart0;
>> > >> +               i2c0 = &i2c0;
>> > >> +               i2c2 = &i2c2;
>> > >> +               i2c5 = &i2c5;
>> > >> +               i2c6 = &i2c6;
>> > > 
>> > > Let's keep these sorted alphabetically.
>> > 
>> > OK, will fix it.
>> > 
>> 
>> > > It would be great to have some sort of order to this file so it's
>> > > obvious where to add new nodes. I suggest we do
>> > > - root node
>> > > - external clocks
>> > > - other node references in alphabetical order
>> > > 
>> > > You're almost there with this patch except the uart0 node is out of place.
>> > 
>> > Will fix accordingly. Thanks for your suggestions.
>> 
>> With Emil's suggestions implemented:
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Actually, there's one thing that I don't think was (explicitly?) mentioned,
> could you sort the external clocks alphanumerically too?

OK. I will sort them in the next version. Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
