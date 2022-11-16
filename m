Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF83C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuDeo/RSu85Bp2a1NVZWTSb3x1lFoDyrlNdk9vsOlV4=; b=llN68MAk9Kp48q
	yAFQbajKWYJmm4/nLk3AOR/d9VxUx9B18/8ArzAHrykWJX3mFV4ZIxbH6MhNOwnP6jFEpdXLV0knD
	4QGbxarYj/kFUWd7hAKI1zXPbGMc6tfA0IXPWb75Wbl0vduzKsV7l7uH6LCu1kSfHUkSJ74zXr/TQ
	SDCbnjFJ5RE3ePc4CZv8/I1avw5TH1MkSv2vHm1CNofV56/lFCyR5mYZfXe3/gHaXgvBRw89xXYmY
	iZejCQqkQv4YpE9jV0rWgzKTJ15m4+jLIxlJHEcy9F+auQvHcTpK+FuXWLzsz4ZeQCuxpzI2Ri9Tr
	MZJgMqi9pQvM63tKusjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovIUT-003wgW-1P; Wed, 16 Nov 2022 13:30:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovIUO-003wcX-GE
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 13:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668605404; x=1700141404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pW7nWcHcRlPbZUbml/VKsh4NmRLOoeC1fsUj+ROfVX4=;
  b=0JR4tqYwt6HnXW1Sk7viVzvShPfJNFgngCfsymKjZM+2biTmRTWAgw32
   n7AWAIKYvtNkkU7hTwDBU2KqDvwaDMOkVgsjpNUTqAGnPUQYmGNYCzmzd
   vM0zmI2xAuUQmfIuc/XHxcKhlYEXQqKESife8VfjIKXLc2mWoOxwSHmbN
   gbVzvG9OhtSrT1xn+MAGNCODp5fboRGdLrinKLenByRfH+ogUwArtIcTs
   0TUBOWb9AkJevukWj/WeMSXni48nvdZITD0EA8YoqLfYe5Ra7UHo8UalG
   cHWuXVnQ7p9nGOG0zU8h8qjFn4UHvDFk2HCvr/1fJs2LxhDJXZwTp8KNA
   w==;
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="187259614"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Nov 2022 06:29:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 16 Nov 2022 06:29:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 16 Nov 2022 06:29:50 -0700
Date: Wed, 16 Nov 2022 13:29:33 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra
	<atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, Anup
 Patel <anup@brainfault.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller
 bindings
Message-ID: <Y3TlvSG0tmZSl8/2@wendy>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com>
 <Y3EDuaW0zQSSfiQ/@spud>
 <CAK9=C2WDQCnVnxKR6SFspdwope2KffyASLJDF_Ygo_417ekJ5w@mail.gmail.com>
 <Y3QT5Vy3RnIXobHz@spud>
 <3037b4f9-268d-df03-380c-393a5d01f3ba@linaro.org>
 <CAK9=C2UpiM=UC27Bgm+QqSc=27g__QLL3y-wMVJGjO-N-XKThw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2UpiM=UC27Bgm+QqSc=27g__QLL3y-wMVJGjO-N-XKThw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_053004_683709_DF27CCA1 
X-CRM114-Status: GOOD (  23.79  )
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

On Wed, Nov 16, 2022 at 04:04:45PM +0530, Anup Patel wrote:
> On Wed, Nov 16, 2022 at 2:30 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 15/11/2022 23:34, Conor Dooley wrote:
> > > On Mon, Nov 14, 2022 at 05:59:00PM +0530, Anup Patel wrote:
> > >> On Sun, Nov 13, 2022 at 8:18 PM Conor Dooley <conor@kernel.org> wrote:
> > >
> > >>> Also, the file name says "riscv,imsic", the description says "IMSIC" but
> > >>> you've used "imsics" in the compatible. Is this a typo, or a plural?
> > >>
> > >> Yes, the file name should be consistent. I will update the file name.
> > >
> > > Is there a reason why the compatible is plural when all of the other
> > > mentions etc do not have an "s"? It really did look like a typo to me.
> > >
> > > It's the "incoming MSI controller", so I am unsure as to where the "s"
> > > actually even comes from. Why not just use "riscv,imsic"?
> >
> > Yep, should be rather consistent with all others, and IMSIC stands for
> > Integrated Circuit?
> 
> This is intentionally plural because even though we have one
> IMSIC per-CPU, Linux (and various OSes) expect one DT node
> as MSI controller targeting all CPUs.

Even still, calling it "riscv,imsic" would seem fair to me given the
multiple regs make the distinct regions clear.

I think I must have missed the bit at the end of the description though:

+  The device tree of a RISC-V platform will have one IMSIC device tree node
+  for each privilege level (machine or supervisor) which collectively describe
+  IMSIC interrupt files at that privilege level across CPUs (or HARTs).

Perhaps, for eejits like me, that paragraph should become paragraph 3
instead of hiding it below the register layout etc?

Anyways, existing name seems fine to me then w/ the filename update &
increased prominence of the many-controllers-in-one statement.

Maybe the devicetree gods think differently!

> The plural compatible string "riscv,imsics" was chosen based
> on consensus on RISC-V AIA Task Group meetings.

btw, I see the following in the example:

+      reg = <0x28000000 0x2000>, /* Group0 IMSICs */
+            <0x29000000 0x2000>; /* Group1 IMSICs */

And in the property:
+  reg:
+    minItems: 1
+    maxItems: 128
+    description:
+      Base address of each IMSIC group.

It would appear that the comment there conflicts with the description of
the reg property itself & it's that lack of consistency me confused (:
Should the comments be in the singular form?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
