Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43333ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 12:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xj7h3CZrJxkF1mfciAAKMXXbaxZXklsWwxZ+Nbg88Tk=; b=GrF3WjuOQSlwk1
	7m6f+2eQFG4rHqr7nblyAAcZemO0lIGXEU26q7W4nGBXNfofSBe3NsiNyURBh7C5NJ0iFQJ6lJ33L
	oDMWy696thWWhOs9gXDjpYRS4v1mm+aA5oWfHBdo5k1gwaj+3fUZa5OVf6VWgFVL8zdixqCAKue5v
	91MSUbVATMIc8Dquw9ugmGJ3tPrEDGobR9eyO9WkOElQEzMztrb9Yl7lIz5iLLV4cGtyIXjz5uV8c
	sSojIRKrBa2bGCHhiMZyUQmn73ont+eSv84VAJPWfjKHqRK2AiNOHgSkmU0C3YezSx8LlgV2M3O2C
	wMj57MC3Lw/zg9yVv43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacPZ-003ifG-Fd; Tue, 20 Sep 2022 12:31:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacPW-003ibn-IW
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 12:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663677094; x=1695213094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q/fZbisIvw+4RruEs9TBl1W84JkX1r956syzCxEZ1v4=;
  b=SkD+HOngaGFz7PPwyzesQvx6tTza2/i+p6pRKT4PiztR/c7n8oMEvcLe
   2QRu5ldt4YJLH+fma5bjteMrsgWvU8arvz0Q0vzXVUIep0QLLzj/EDM55
   VXd2Rkt7YwB1ttyjesvybuJc4ELsWipbllHNRrAqpcWgvo9mxE+UDPSHE
   0NrjZ0DKX0lbrHybu3cHcTeUnUsSV5++7Xysz5StBOUxS5b3+QJH6R1yG
   XmCVl5qfaO3BXarSBcNlmwrocAWnT/pMF7Kwa7oqOe/4b8Dps0wZO9sP1
   QXU4k5JBG7r9BLEDGPMuGEBBrq8fW6mDi1zGian8YluzYDNdeeqlvPRTA
   w==;
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="178026134"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Sep 2022 05:31:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 20 Sep 2022 05:31:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 20 Sep 2022 05:31:24 -0700
Date: Tue, 20 Sep 2022 13:31:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Conor Dooley <mail@conchuod.ie>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <heiko@sntech.de>,
	<atishp@rivosinc.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <biju.das.jz@bp.renesas.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 07/10] riscv: boot: dts: r9a07g043: Add placeholder
 nodes
Message-ID: <Yymyh+UlIICacxeV@wendy>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <3693a3a1-5a2a-4cc5-fb55-f6ad9a4b3f72@microchip.com>
 <CA+V-a8u87tqhC69qGD2zq_gT9jc_cSWd+NRn_u0bPTdmmk+j4A@mail.gmail.com>
 <e15f3e2a-2761-84d9-c5c9-118717e0bb83@conchuod.ie>
 <CAMuHMdUGD9s96JJafsYdfnPqvg6KLvmC9GUS4yjaaXi2hYrJYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUGD9s96JJafsYdfnPqvg6KLvmC9GUS4yjaaXi2hYrJYQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_053134_706993_EDB9DE2F 
X-CRM114-Status: GOOD (  26.61  )
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

On Tue, Sep 20, 2022 at 02:17:50PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Fri, Sep 16, 2022 at 12:40 AM Conor Dooley <mail@conchuod.ie> wrote:
> > On 15/09/2022 23:26, Lad, Prabhakar wrote:
> > > On Thu, Sep 15, 2022 at 10:36 PM <Conor.Dooley@microchip.com> wrote:
> > >> On 15/09/2022 19:15, Prabhakar wrote:
> > >>> riscv: boot: dts: r9a07g043: Add placeholder nodes
> > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >>> Add empty placeholder nodes to RZ/Five (R9A07G043) SoC DTSI.
> > >> Can you explain why do you need placeholder nodes for this and
> > >> cannot just directly include the other dtsis?
> > >>
> > > Since the RZ/G2UL SoC is ARM64 where it has a GIC and on RZ/Five SoC
> > > we have PLIC for interrupts. Also the interrupt numbering for RZ/Five
> > > SoC differs from RZ/G2UL SoC hence we are not directly using the
> > > RZ/G2UL SoC DTSI [0].
> > >
> > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi?h=v6.0-rc5
> > >
> > > For the RZ/Five SMARC EVK I am re-using the below files [1] (SoM) and
> > > [2] (Carrier board) as the RZ/Five SMARC EVK is pin compatible.  Since
> > > I am re-using these when trying to compile the RZ/Five DTB I get
> > > compilation errors since the nodes dont exist (and there is no way
> > > currently we can delete the node reference when the actual node itself
> > > isn't present) hence these place holders.
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi?h=v6.0-rc5
> > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi?h=v6.0-rc5
> >
> > If this method is acceptable to Geert, this explanation 100% needs to
> > go into the commit message.
> 
> We've been using these placeholders a lot in Renesas SoC-specific
> .dtsi files, as they allow us to introduce gradually support for a new SoC
> that is mounted on an existing PCB, and thus shares a board-specific
> .dtsi file.  Hence I'm fine with this.

Aye, if you're happy with it then I am too...
> 
> However, I think more properties can be dropped from the placeholders.
> There is no need to have e.g. 'reg-names' and 'status = "disabled"'
> (there is no compatible value, so no matching is done).

...and this makes a lot of sense. I'd still like a comment in the
commit message though explaining why placeholder nodes are needed as
opposed to just leaving it blank etc.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
