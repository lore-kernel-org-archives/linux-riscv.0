Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AA0EB64D7
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jun 2023 12:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVcw3Vt5vz2390fqtZGYF2XR1mxCewa+MVCQGxkqDFw=; b=KfEaMf8m6r8E50
	vM4nYs/omhQdWZUSCTS0Mfq9qKOfDT5W+1OagMblUU0LC5mGjENQKQXMW0VMv+f5aNq1w9LWu40ex
	fUPc9TzR95HCIFyAKYHoI1b2umMPwMHj1y+s4dNPu48QX+0BvWSv1qouzgusOPnKzr+1ztn/XjE/G
	cBDDJcnqXvtaV+wE5T5XwJ/SDGyzle46ahCahBUwCsH6wRKlLJT0MLX0bdSwxmFLqmaEmgWOu/Y1q
	kSiRV7COX4hp7wUqp5QSCjZKj8LJ3jCF31fWZbpFamToPdhwRKkFGl3jZq+Dm0TatLxh9w4Yy6sfi
	W7TdPsAvHp03lO3vPR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qArQt-005sRv-2f;
	Sun, 18 Jun 2023 12:23:03 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qArQn-005sNt-0O;
	Sun, 18 Jun 2023 12:23:01 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DAC017FEF;
	Sun, 18 Jun 2023 20:22:08 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 18 Jun
 2023 20:22:08 +0800
Received: from [192.168.125.127] (113.72.145.217) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sun, 18 Jun
 2023 20:22:07 +0800
Message-ID: <a91f4167-e797-435f-8867-dbef4b109df8@starfivetech.com>
Date: Sun, 18 Jun 2023 20:22:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 5/7] dt-bindings: usb: Add StarFive JH7110 USB
 controller
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Conor Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Vinod Koul <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak
	<pawell@cadence.com>, Peter Chen <peter.chen@kernel.org>, Roger Quadros
	<rogerq@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Mason Huo" <mason.huo@starfivetech.com>
References: <20230518112750.57924-1-minda.chen@starfivetech.com>
 <20230518112750.57924-6-minda.chen@starfivetech.com>
 <20230525-shopper-handbrake-27fc06aede32@spud>
 <5124e6a8-8ca6-71a5-19d6-8c15e954c458@starfivetech.com>
 <20230526-grain-cubical-e0af96202007@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230526-grain-cubical-e0af96202007@wendy>
X-Originating-IP: [113.72.145.217]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_052258_121986_671936DE 
X-CRM114-Status: GOOD (  13.69  )
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



On 2023/5/26 21:13, Conor Dooley wrote:
> On Fri, May 26, 2023 at 06:24:48PM +0800, Minda Chen wrote:
> 
>> >> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controller
>> > 
>> > I think you told Krzysztof you'd rename this to "StarFive JH7110 Cadence
>> > USBSS-DRD SoC controller"?
>> > 
>> The previous title describe whole USB controller for previous dts node is
>> merged. Now the dts node is split. 
>> "starfive,jh7110-usb" just contain starfive wrapper layer dts configuration.
> 
> Okay, I must have misunderstood the conversation on the previous
> version. Sorry about that.
> 
>> > Otherwise, it looks like all the stuff from him and Rob have been sorted
>> > out, so other than $title this is
>> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 

Hi Greg
Can this patch can be applied to Linux-USB-next tree? Since this patch is reviewed by Conor.

List Below is Conor's previous E-mail.

   I think I missed this mail somehow. 5/7 had the binding for the driver
   so probably that should've gone via the USB tree too?
   Should apply on its own (no deps on the phy patches) & has dt-binding
   maintainer reviews.

   `b4 am -P 5 20230518112750.57924-6-minda.chen@starfivetech.com` if
   that's your cup of tea.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
