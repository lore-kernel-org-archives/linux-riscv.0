Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F69C5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 17:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E53FVUFYlyoZFDFzvAmRNQ67J4ctLMWMHy+cHB5xNFA=; b=Kdru0bel700t6H
	nwnOvtqs3wdhik+6XTilgLHDIMli0VQRnoUrticRv6wnyYXb9vcQCwxXsDWWYlvAILk2ZGkvkbku1
	Dfk0H2mSNaIoV+9OSNIdgWHGpx/tvqxflUbVZme812/K4ZChUeGU+WTOfbIdbr1yXbV4andITZ/D9
	HdynRIUt3VJbT15nmCn0ZDOjaVbrGMu2p3jlvR722XBFKp09nGlQ9coFJfW1iEeL4DFjyhw0UrpAV
	in1agVKVA/OfoYGuAoiIWST2qiaYHi1kfBpSE9q9q/vdrpUETljsCkXxqXC8lDdOimvl/GBQ0Lpfm
	X6dqzJPljz0JG9REmqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNLO-0000000ADfg-3BZV;
	Wed, 28 Feb 2024 17:03:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNLK-0000000ADeY-0VX3
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 17:03:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1894361856;
	Wed, 28 Feb 2024 17:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A94C433F1;
	Wed, 28 Feb 2024 17:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709139820;
	bh=S/6RXer/Iy4usF2UTMTh4mOioXIr0Eu6d5gI1EUscEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pj1JrxiE2ap21L8oriZilmCozDhK4djbGRyvjaMBqOvXS9dJJhvyfA6hl7D5pTiND
	 rwuNFKpEEZOoFATtUe57ZqQVGjuwUFFE3f0nrglB9YaTbzAxfzzaQ6/JofE5Wqj8fr
	 Gh+R4T/etyKm2OFRBT2ESUIpxbDniN4ahGAV1jx1ltdMsFv+Grd1z16iA9hFkaI/IA
	 l2ssZNbzb2F4rnYZLTO3Yon7/qbaS7pPIHruFS9pAVXMMoXNR61P52pTd7x6MccmLh
	 3eVMOte9WwNbZ9uVbDQWIrbX4cbT5p1AHZscaoCFTjOmayxOEDZE7Yg76TDAOPllAI
	 9+cF2nP+dalwg==
Date: Wed, 28 Feb 2024 11:03:38 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alex Soo <yuklin.soo@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH v2 1/6] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
Message-ID: <20240228170338.GA239206-robh@kernel.org>
References: <20240220064246.467216-1-yuklin.soo@starfivetech.com>
 <20240220064246.467216-2-yuklin.soo@starfivetech.com>
 <1a11cee2-2ef1-4ce0-8cc1-63c6cc97863f@linaro.org>
 <20240220-bottling-reverence-e0ee08f48ccc@spud>
 <cafccf8d-b8f7-44cb-bc41-3c7a908fd1e4@linaro.org>
 <20240223002443.GA3877354-robh@kernel.org>
 <caea26e2-6598-4796-b199-4ee5b1b9cd30@linaro.org>
 <20240224-smudgy-eldercare-d5d8640d9961@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240224-smudgy-eldercare-d5d8640d9961@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_090342_891083_53065BFB 
X-CRM114-Status: GOOD (  15.49  )
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

On Sat, Feb 24, 2024 at 07:20:30PM +0000, Conor Dooley wrote:
> On Sat, Feb 24, 2024 at 09:46:53AM +0100, Krzysztof Kozlowski wrote:
> > > I would like a solution though. The only idea I have is passing 
> > > SystemReady cert, but that's an Arm thing.
> 
> I don't know jack about SystemReady

AIUI, Risc-V is working on something similar... 

The primary intent of it is to enable installing off-the-shelf OSs.

> - I had it in my head that it was a
> system level certification. I am wondering how you think that
> SystemReady certification would apply to a whole binding (I can see it
> being a per-compatible thing, but that would be a mess I am sure).

There's a lot of pieces, but I'll stick to the DT aspects (which is 
SystemReady IR band). Certification applies to a specific firmware build 
(which includes the DTB) on a specific board. The testing requirements 
at the moment (for 2.x) are every binding (compatible) must have a 
schema, but warnings are allowed. 

So a "stable" tag would apply to a DTS as a whole. That of course 
implies that everything within the DTS is stable too. 

One wrinkle is that SR has no direct requirement that the DTB come from 
anything upstream. Indirectly, the schemas must exist and be upstream 
(or acked on the lists) and various distro kernels have to actually 
boot. For that reason, if we had some tag, it would have to be 
distinct from SR.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
