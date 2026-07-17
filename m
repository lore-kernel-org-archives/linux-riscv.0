Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4562CC44516
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 22:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MVBc6H2WRNUCMw1TfjNXq8+Y225wHUpcsduP4dHyxc=; b=wQt9xWC6o7JACB
	TYAkTl9d34T+fG0j+e2DWq491aHkOAt7S+iPmlItbPvKrvSbeRHDJsOfluBbuak5dLPvvTF04b0zT
	6SdbvWnRubWUFwVkZBlqf6HmCG5hnAbLWLVnpmJ9caQ7SZvPZYLOGYklyJByQ9TP7T5++An4FXTd7
	hvA08K0uwQ+VCqmoh0bdGSQQ5uzBw794GbDWp47cXqXVqWnvLdD3La2glp6KuAY7VXy6wRpYUqyW8
	g8xFl4wcfhG4kmkX+VWe8CDT5874pSaeShyn+x8/MwlB48qDJEJ2LsdCx51iyEHa1y2ErOhU3FM3R
	4F5BBI7yYLwXoH15Z3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkqck-00000003JHw-2ZP1;
	Fri, 17 Jul 2026 22:01:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkqci-00000003JHJ-0ck1;
	Fri, 17 Jul 2026 22:01:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D51A1476;
	Fri, 17 Jul 2026 15:01:27 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF9F83F66F;
	Fri, 17 Jul 2026 15:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784325691; bh=ibP4H/kTc6QpQES5l0G9CzhAJHDJoBKAVcsqYj265Qk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=liTaZx7pXEUG/d54Fz0HF4kPrlEEhQ5Soeb/Xz0YcG0QXdu2r82YoCE3lKDkxRQd6
	 0LZp9/3XsmIkKdbtG/VTXeMs7YQWwAL+tEEbZfcfbnJR+dQcWrBBOfRxwvoUd7nb3L
	 L3QtznJYV6bxhepnmiy6xjDB14+QPAO3G6X5XzTs=
Date: Fri, 17 Jul 2026 23:57:37 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Brian Masney
 <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran
 <richardcochran@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Message-ID: <20260717235737.6e69ba19@ryzen.lan>
In-Reply-To: <20260702165944.828550-1-enzo.adriano.code@gmail.com>
References: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
	<20260702165944.828550-1-enzo.adriano.code@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_150136_446284_3EA32F41 
X-CRM114-Status: GOOD (  12.24  )
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

On Thu,  2 Jul 2026 12:59:44 -0400
Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

Hi Enzo,

> Register check for the PRCM driver against the public A733 User Manual
> V0.92, chapter 4.2.5: all 41 entries I could extract (13 reset-map
> entries, 18 bus gates, 10 mod/mux clocks) match the manual's register
> offsets and bit positions. No discrepancies found in this patch.
> 
> For what it's worth, we have also exercised the R-domain at runtime on a
> Radxa Cubie A7S (r-ahb/r-apb0 rates with live consumers on r-pinctrl,
> r-rtc and the PPU, bus-r-cpucfg via its critical flag), with no
> misbehavior attributable to the PRCM model.

many thanks for doing this, but please add proper tags to your replies,
otherwise this won't be carried over to new revision, and your work
gets lost in the cracks - as it happened this time.

So you now would need to redo the review on v2. I'd suggest to compare
the patches between their RFC and v2 version, and if you agree that the
changes don't touch anything you checked (register offsets, bit
positions), then you can just (re-)post your review with the proper
tags - and a brief list of what you checked, as you did in the RFC
reply.

Thanks,
Andre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
