Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8462CA600A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpeyQnUKiBXJnlmzFdeZlJTi70ZUzFUcusCL0luC8BA=; b=lgH88Ojiszz38c
	2HUaqKIYzBiObh+jx1AbSvnOU7Ef1ev7uunIXyhwAPAkPu3AFM6Oo9J5VB9aZJo9EAlqeKETGG7zZ
	o4WfmcMkKIFZP79xQ/S9lX2vxPXaMQ1g171ckNC50Spxc6KcLtlnD/aEZjh6JkM20Uy2W/e5TgLZs
	BGyOWHMGb5HKGaxCs4gl0RzV2TWEqOSww/A75b5DHG6scSFR7DrnoThnL3DlLy7jH/o97RvUt9zIY
	H3m5GspUo1WlAAXEpm9ztufoTFa4Pu4lsJsOgiaStlmwMH9d+bTYKLTZcUbOrAEl63iCtSMqjJfIc
	n1PNvynuu5iJxy3XIWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkDW-00000003yz3-3cgT;
	Thu, 08 Oct 2026 09:15:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkDV-00000003yyt-1gP1
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 09:15:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF0A44006A;
	Thu,  8 Oct 2026 09:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B8E1F00898;
	Thu,  8 Oct 2026 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791450908;
	bh=N0iVQ+icpXXzIWEz3mV5Uf7KkvSTdwHOk+gN5yGHz3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VsHLvdjS+390MDSEAalnQqsiwY25PV9OUQmvvuJ+Lfj66g62QZTeidCVDdQw75wU/
	 oKXDd5/Q5mex5jfPtVj7K1FRf7FxupmQSzzPNbaATyZKG4k798DaMD8EtgE6QRTN1T
	 ZmxURI1lyE6urspVilk5eR/HiW62t4fTZXaxr+cMxlDfyqpBRWYYaiG7RnfwtexKOZ
	 H/Kco3Xqz71EqFrfevHmqLh5ak12nNrDeS9GZzFx/WN8FVNGC5S1T7t2bBSioq1mDJ
	 xNAIcvV4Ez9/WvxCaUaEU5PuCiP8rl+VVJpCz3nSBO+aElABCAWZbSlP5TMigwWSUo
	 BwhAiuRIiEO+Q==
Date: Thu, 8 Oct 2026 09:15:06 +0000
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
Message-ID: <20261008091506-GKC2005@kernel.org>
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org>
 <20261008-04-k3-pm-support-v2-1-6f778a53dd2d@kernel.org>
 <20261008-df80c21d73b287d09b6baa78@squawk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261008-df80c21d73b287d09b6baa78@squawk>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On 08:27 Thu 08 Oct     , Conor Dooley wrote:
> On Thu, Oct 08, 2026 at 03:44:29AM +0000, Yixun Lan wrote:
> > Add initial power domain driver support for SpacemiT K1/K3 SoC, The Power
> > Domain Controller is SoC internal module which is part of APMU (Advanced
> > Power Management Unit), it is responsible for managing power across multi
> > power domains, which includes power on/off, isolation, power-on sequence.
> 
> You should prob mention that this APMU is already documented elsewhere.
Right, the documentation already exists in
   Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml

I can add a short note in next version

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
Thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
