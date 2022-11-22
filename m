Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ABBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvuEVaabN1Wy56+zJYIpmacM4htQiHSxgJKREjM5bxo=; b=3iWqkVY2Pu4NqL
	TDK/UMEPMxsv9z+qSskO9kvVO4nw7qo1Mk0hGmyxJsQqkbPp4hhDmHJSDrP29aNWq9cyr95AhM9gu
	H2l3hee/0knv6Xoi09e+sOWMaA7F6zethEjCE0SVfLjE1XUmjpeweCeGdbKnpM8+1Drel84rgXu5c
	R9auAvSKhKn1YLsmA4kPPWcoH3ks88sLIo9YoZv8a64sbc7hJG7f6RnmgLVEPIO2RvKHIuAD4S1m3
	Ckd21wkXKXI792bRVYUi8uZWpV+q7pNese/djsOquDPSiZHYMISLtNlplPTZNCH/1AxI+btxHOEU3
	L4IPAz3VF/RI74w7ay7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPG9-006nNu-Dk; Tue, 22 Nov 2022 09:08:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPG3-006nL2-1Q
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 09:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669108080; x=1700644080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EE5pcTfSPr5DaXNcKToRfW2ELh+2i5w5CLa+8PM/AcM=;
  b=dZQEWPxRcpRsz1CE7g/vow61goWKQ7Hg7tX2vOd3CmViXFzXg5EN9Rta
   ApzxhozudYhSupDNYmZdiPv1QGf19JwkTLHQmSZkZ+69rNwQD0KlZkHnM
   PHzWtoz9a23pvwPfZKDmCI4JDo/UuT67ojib5vWoon9i+pI2/JcYTMMyh
   ENuOW/IBSOWrE33LzK+N38pi9K0uYdPjqJcZo4J96METI0uhNs5lsrPSh
   J+in3FUsbpacrimIyyVlrSkRVzyeBvGQiIjcE1/zAiY3kP0TB44ssvyVU
   cyvdkZBZC3ZKSSfy1BfaSKXalZdX7uSlCgTjobpE+qa2hY1Bz3JnP4ziX
   w==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="190021134"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 02:07:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 02:07:47 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 02:07:44 -0700
Date: Tue, 22 Nov 2022 09:07:26 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
	<maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: sifive,ccache0: Support StarFive
 JH7110 SoC
Message-ID: <Y3yRTuo69JUsfLqk@wendy>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-5-hal.feng@starfivetech.com>
 <Y3duiJguYE6VrVLP@spud>
 <Y3dvCPP1g0LzzHFO@spud>
 <a5193e23-efe1-fa65-15de-d53b80b87d63@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5193e23-efe1-fa65-15de-d53b80b87d63@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_010759_119949_C4862B7B 
X-CRM114-Status: GOOD (  17.41  )
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

On Tue, Nov 22, 2022 at 04:40:23PM +0800, Hal Feng wrote:
> On Fri, 18 Nov 2022 19:39:52 +0800, Conor Dooley wrote:
> > On Fri, Nov 18, 2022 at 11:37:50AM +0000, Conor Dooley wrote:
> > > On Fri, Nov 18, 2022 at 09:17:10AM +0800, Hal Feng wrote:
> > > > From: Emil Renner Berthing <kernel@esmil.dk>
> > > > 
> > > > This cache controller is also used on the StarFive JH7110 SoC.
> > > 
> > > "... and configured identically to that of the FU740"?
> > > Anyways,
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Actually, after looking at the next patch - why can you not fall back to
> > the fu740 one since you appear to have the same configuration as it?
> 
> Right, I will drop this patch and use "sifive,fu740-c000-ccache" as
> compatible in dts.

Uh, that's not quite what I was suggesting. Rather than using that one
in isolation, you can do the following in your dt:
"starfive,jh7110-ccache", "sifive,fu740-c000-ccache"

And then in the driver we need to make no changes - unless down the line
we find some sort of issue that requires special handling etc. There's
no harm in having a "starfive,jh7110-ccache" IMO.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
