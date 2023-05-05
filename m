Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB50C77B75
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmWjJYk8NRwqSzcujmDdpG4sZ26+7M4XHrQYFzHL3Q8=; b=EINPKXvpcusE+P
	wxSmdOuX5ai3wGBkyo1lCu5ZVoSzRPrQK5FvaTX9UIxHszLBIyWUbn8PvOJo7D6e87RIHVOsO7bsK
	nd3hxRvaY1mXuhFXq/Bneb27fH2Oi24ZPOcCLoCoenIaWPT6py7fpX7MIVGO6vUI8LXBxIiG6Z2SD
	EBvCExee5FKkCgiqnponA/FL0+YAbw6Doee+42yXydqZ3cn0X7ah9tOBlPTTM4DtEH0cZ7qUajvr4
	yD7gxCka7yxaM/n7J4plghetLR0HP2qckZJUquUcm/h8H7IHhOCHgiBq1bwRGZlZeFBnbsdtoTY+8
	UhsN18cxGYpDY7DSquUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puxrC-00BGBT-1t;
	Fri, 05 May 2023 16:00:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puxr8-00BG9p-1G;
	Fri, 05 May 2023 16:00:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B3E61FB;
	Fri,  5 May 2023 09:01:04 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFA093F5A1;
	Fri,  5 May 2023 09:00:17 -0700 (PDT)
Date: Fri, 5 May 2023 17:00:15 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: robh+dt@kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
Message-ID: <20230505170015.664c18bc@donnerap.cambridge.arm.com>
In-Reply-To: <CALHCpMi8=t1bMceTOfZjh7aKEQcEEpfeG4wi9pB=5o34Ca+N3w@mail.gmail.com>
References: <20230505074701.1030980-1-bigunclemax@gmail.com>
	<20230505105805.548d1a1b@donnerap.cambridge.arm.com>
	<CALHCpMi8=t1bMceTOfZjh7aKEQcEEpfeG4wi9pB=5o34Ca+N3w@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_090026_480251_1955D729 
X-CRM114-Status: GOOD (  22.77  )
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

On Fri, 5 May 2023 17:27:07 +0400
Maxim Kiselev <bigunclemax@gmail.com> wrote:

Hi Maxim,

> > From a quick glance at the manuals, it
> > looks like there are not quite the same, though: the D1/R528/T113s
> > mentions a SPI_SAMP_DL register @0x28, whereas the older IP has a SPI_CCR
> > register @0x24 - which is not mentioned in the newer manuals. The driver
> > relies on that clock control register, so it wouldn't really work
> > reliably, if that register is not there.  
> 
> Thank you for pointing this out. I missed this difference.
> I actually have a board with T113 SoC, and it looks like writing to
> SPI_CCR@0x24 does nothing.

According to the manual, the register doesn't exist, so this would support
this theory. Most Allwinner IP just implements non-existing registers as
RAZ/WI.

> And it doesn't affect access to connected SPI NOR flash (read\write
> operations are fine).

I guess it just works with *some* (default?) clock settings then. Might be
faster than configured, but the SPI flash chip might be fine with that.

> But I completely agree with you that this difference should be handled
> by the spi driver.

As Samuel pointed out on IRC, there are patches, for the R329, using the
same IP:
https://lore.kernel.org/lkml/BYAPR20MB2472E8B10BFEF75E7950BBC0BCF79@BYAPR20MB2472.namprd20.prod.outlook.com/
And he also seemed to have issues, at least with SPI-NAND on one board:
https://lore.kernel.org/lkml/0b5b586a-3bc7-384e-103c-e40d0b2fac23@sholland.org/

Can you please try these patches, and use:
compatible = "allwinner,sun20i-d1-spi", "allwinner,sun50i-r329-spi";
for the compatible string?
If possible, you could revive this series, and add the D1/T113s support on
top: just add the compatible string combo to the binding document.

Cheers,
Andre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
