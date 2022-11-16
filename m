Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0BCC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjcg+yfjy8uvRd0gtE7U259qcT1PuqlvSet4pZhJQWE=; b=mr6D/UONIhrxdC
	pypXn8FIzHYTNMDGihfMG2y2utkPn5Z6c/IQaqSw2cLVzkpT0g51WmPYnkiNn1K1z2VnrXKxGlndI
	7T5lpipih8tRPDgNbuMaXE3yIk/e39DXklzSWjY2gGAc1Y9Xs9LLfvGd3juWwW6ovGOCsF3lXFvCD
	trVwwZEi8NUo4RH3wupznYloe5JWemZN+ZHg6P8lWLcQyjdF+DBQi20/d4Y3rmvlAOaYPagULRiFf
	2RRrUmBBa7a50fQ437R1+yHhl3/u0a+vU16nBOhFxxbMDz4Ro//ISp2oJgI/Ypm6zYsEfyzdpPBva
	n8WB0UMpPV8Ax4vh/JOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEb9-001cxF-93; Wed, 16 Nov 2022 09:20:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEb3-001cuP-P5
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 09:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668590441; x=1700126441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PBvpl/LIIC4KatBxSf7OTdZHj1uA/ufQHvck22uMENM=;
  b=pp+TfWhU2y+NWgdhKx3W2JYDDrJjYKZ3o5XKcybHLDZGQ89pHSrveuYn
   wDqcKvAsofQI4Ha+X667Jj8DWXJY6OaaBDX78mU5KeRb1X69XWKgr9nz5
   myboTlvLj6jiIOSlBMpFOEsY4wfLwFkiiZIbD//MyDfSaK0wQGsK4gIjH
   guIsAdPKjorSQG6lcLRb+aqPMTrd+FUErV5xlg5P2oG+ojrhRxZgFA/wC
   qd5pxC2d6RPKNdHWw8c8TedpVXTOx05dkkZnMQtz4jyePCRP5kRupYeBJ
   SogEwuvzYsUYXXgrT8HBtr8z8YREgqzzfczu89Ru00+k0qkS+v1UICsTg
   A==;
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="123666759"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Nov 2022 02:20:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 16 Nov 2022 02:20:40 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 16 Nov 2022 02:20:37 -0700
Date: Wed, 16 Nov 2022 09:20:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Conor Dooley <conor@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra
	<atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, Anup
 Patel <anup@brainfault.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller
 bindings
Message-ID: <Y3SrVMYjkWEx4wYw@wendy>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com>
 <Y3EDuaW0zQSSfiQ/@spud>
 <CAK9=C2WDQCnVnxKR6SFspdwope2KffyASLJDF_Ygo_417ekJ5w@mail.gmail.com>
 <Y3QT5Vy3RnIXobHz@spud>
 <3037b4f9-268d-df03-380c-393a5d01f3ba@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3037b4f9-268d-df03-380c-393a5d01f3ba@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_012041_923985_65F2E850 
X-CRM114-Status: GOOD (  16.04  )
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

On Wed, Nov 16, 2022 at 10:00:27AM +0100, Krzysztof Kozlowski wrote:
> On 15/11/2022 23:34, Conor Dooley wrote:
> > On Mon, Nov 14, 2022 at 05:59:00PM +0530, Anup Patel wrote:
> >> On Sun, Nov 13, 2022 at 8:18 PM Conor Dooley <conor@kernel.org> wrote:
> > 
> >>> Also, the file name says "riscv,imsic", the description says "IMSIC" but
> >>> you've used "imsics" in the compatible. Is this a typo, or a plural?
> >>
> >> Yes, the file name should be consistent. I will update the file name.
> > 
> > Is there a reason why the compatible is plural when all of the other
> > mentions etc do not have an "s"? It really did look like a typo to me.
> > 
> > It's the "incoming MSI controller", so I am unsure as to where the "s"
> > actually even comes from. Why not just use "riscv,imsic"?
> 
> Yep, should be rather consistent with all others, and IMSIC stands for
> Integrated Circuit?

Incoming Message Signalled Interrupts Controller, no?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
