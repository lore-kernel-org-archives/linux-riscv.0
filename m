Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661DFCD5BB1
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hon/SksnWZLxvf1JuzadyNQaNZRSnEcDGafqXx+3Gz8=; b=4k/447vM6p2S1z
	k+Rwytr9adbxEYsbfxPPurAECyFSX+EE4goZzDa0e7Bo+tKbTfxl6ubKTttJ6D3MMvasyAtd+MF/9
	IdUG8iCK+9pu1t29Nfgus9jVLhqY+WwcM8YKtqic/fmsFojBA0ivh35taAZPwL/s25M72vaXdDp/L
	yKEhL15rErYwDIlceFql9DDsfZx1OJI9YzSZCnds3ohgOpSHsKOu+UnUa626dtgpkVzJAqW0NvIzE
	8wreD2EpC6bojsOQFVPhh3DjgrHhLe0r1V4HQtkjIz7R32ED678DwcMwcHnR20hZJl4wIHcksN7pq
	rUro36jSquC1BGJKtn2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2sS-00000007mKa-1b6g;
	Thu, 21 May 2026 12:51:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2sR-00000007mK5-0ppl
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 12:51:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F0C46021D;
	Thu, 21 May 2026 12:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565AB1F000E9;
	Thu, 21 May 2026 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779367909;
	bh=fa2t3Ix+ICIlEmYv6c8T87OOWsd/LKLHM9B9C/lUzAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YVSMj3m+P734bbrXRSUcfR9z86BlmKikL7rcPD82ZYb9jpu3tFGneJfbaLdT3IdNS
	 tsbH7g1yvNiJccFYZkyA9F9xDwE/hwAP6qK+YU5ay/IGIYxBwJa3Ifqf0pNcLTVoEP
	 DQMRZePfjEEYZktHgyXHWRjEszpiE3zuE1Gvg6FZX+AvKdeaAraK2SBf7wzchPB5Sy
	 KSlfTe3lN3lFKhd6B71Ous4BJb5CVjyMCEx17724cMk0LWMnxOODUJy4tUo9ENMr7s
	 ul+62ksmPDA20Vr/6jQ8r1SGJrwgprg5Ti9sIG5llTpBU7fmwLKOJ9meoGkXpRDg0V
	 IKFGol4yI0rcA==
Date: Thu, 21 May 2026 12:51:45 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 4/4] riscv: dts: spacemit: Add PDMA controller node
 for K3 SoC
Message-ID: <20260521125145-GKC3717228@kernel.org>
References: <20260518-k3-pdma-v6-0-67fdf319a8f8@linux.spacemit.com>
 <20260518-k3-pdma-v6-4-67fdf319a8f8@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260518-k3-pdma-v6-4-67fdf319a8f8@linux.spacemit.com>
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

Hi Troy,

On 11:32 Mon 18 May     , Troy Mitchell wrote:
> Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
> The PDMA controller provides general-purpose DMA capabilities for various
> peripheral devices across the system to offload CPU data transfers.
> 
> Unlike the previous K1 SoC, where some DMA masters had memory addressing
> limitations (e.g. restricted to the 0-4GB space) requiring a dedicated dma-bus
> with dma-ranges to restrict memory allocations, the K3 DMA masters have
> full memory addressing capabilities. Therefore, the PDMA node is now
> instantiated directly under the main soc bus.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Applied, Thanks
[4/4] riscv: dts: spacemit: Add PDMA controller node for K3 SoC
	https://github.com/spacemit-com/linux/commit/3f47ca8bb3c3f4a71688451a0cb7350d3e1e1059

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
