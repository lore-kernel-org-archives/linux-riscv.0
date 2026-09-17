Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36542C982D5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 13:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYW3dp3Ng90gs5uWVN3FnZANFECAv5x5d5nql+ziokA=; b=BPRhBlFWWsZ3jl
	nLHYS581yJ7Kg7VM/Gx3lNlXRnNV93JuP0RHqjozfJKm0H2lfFPgAiajCaGJ/RLt0A+zvICla8LLL
	RybyJCAoMVLDE3yGyFTB0yNRvpFgYdiXznmQDc5gCyn7v6iBWy9JfCCcOnizzKzmlCpEX7qDM/4jN
	7/9yd/gP9X07MR8T06YOTdp309B19CjKiPsUXFikZMbMEy1GuXs4GGH5yUvgHNXo2A3ne+Oz7aMaP
	RiXKd2kLbDwlJ82v/tGv98QihIKkflON4XSnDCu2N4CbijrwmkhV/EOXE0sUR/SgnprAi3mX8eqPG
	K9Tc5l0wAo1isY0k4AAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7C5C-0000000BORQ-1fKm;
	Thu, 17 Sep 2026 13:23:22 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7C59-0000000BOR1-0380
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 13:23:20 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id F1AF992009E; Thu, 17 Sep 2026 15:23:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EE31D92009B;
	Thu, 17 Sep 2026 14:23:15 +0100 (BST)
Date: Thu, 17 Sep 2026 14:23:15 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Conor Dooley <conor@kernel.org>
cc: aleksa.paunovic@htecgroup.com, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, 
    Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
    Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
    Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
    Daniel Lezcano <daniel.lezcano@kernel.org>, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board
 compatible
In-Reply-To: <20260915-woof-ducktail-5e2f52bc5762@spud>
Message-ID: <alpine.DEB.2.21.2609171254060.15569@angie.orcam.me.uk>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com> <20260914-p8700-dts-v1-3-3267f14ebce1@htecgroup.com> <20260915-woof-ducktail-5e2f52bc5762@spud>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_062319_217548_3148A591 
X-CRM114-Status: GOOD (  13.46  )
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

On Tue, 15 Sep 2026, Conor Dooley wrote:

> > +    oneOf:
> > +      - description: Boston FPGA development board with a MIPS P8700 bitfile
> 
> I'm not convinced that this is specific enough at all.
> I have absolutely no idea from this description if there's even a
> specific FPGA involved here - this could mean a bitstream used on an Altera
> platform or a Xilinx one, with totally different contents.
> I'm only happy with FPGA bitstream content being supported if it is
> versioned strictly and matches with some clear and obvious releases from
> the vendor. I cannot even find this board by googling it, let alone find
> clear information about what this could correspond to.

 This stuff has been around for a decade now; cf. commit 6e62a888029b 
("MIPS: generic: Support MIPS Boston development boards").  Public 
resources have been scarce.  Here's the best one I could track down: 
<https://training.mips.com/cps_mips/Examples/MD00901_Boot-MIPS_Example_Boot_Code_for_MIPS_Cores.pdf>.  
Expect disappointment, but at least there's a photo of the platform (p. 
142).

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
