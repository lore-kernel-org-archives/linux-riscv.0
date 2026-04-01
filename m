Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2050D35140
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlcDRtETO2o0ix90Pd8L05xqf4lC83RnOwAdTspQYzY=; b=wAADhA23nlSlSS
	PF/hN2vSMR3gP1OOI1gsSnpLERkDiaj5E2W/H8ZgxqJhYZqGwHeyyk3RvGSW/NdTV7m9AXwCT8WAL
	8OojlMk1HiBDDNWu8fzR1c5ec06lJEPjTC/jlMnxARoyUDhSuFeWg+jpwQN7KhcNUbcdygtJgUyy+
	zaLeTdy12bqqdDmsQCWu0Lgy33Eb01myz1As04DyO9pMvgqbfnPlIdA/6KQ/d5ECcn9g171mmL4Yk
	k7n5xvRaGLLCFDR0LNVmBboX9U0cQSAIt9K/SeE8vLUZ7EbezfBQIf7Cq/ml/G6Cq+ZslW0A0f4Xt
	DZoMalMRXuMNo4XVwHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pHh-0000000E7uH-0VtS;
	Wed, 01 Apr 2026 06:42:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pHe-0000000E7tg-3aiR
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 06:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 058834044B;
	Wed,  1 Apr 2026 06:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57830C4CEF7;
	Wed,  1 Apr 2026 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775025753;
	bh=3lkikTg0z/4Lxu0Fwa2UNf6cezlmSQAqwLsxdRmUJr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsTNp39g251oXeS4gtkL0tH8DetAp58TB++OCi4jNnWvlZaPXq/eVaXhoKofg120X
	 3pUcw7O0PxNOGnCchQGQyyh3iY0JM9AymG9fIJJF8FkLGAgnX3ROen+77G0TpYR2A6
	 MnVZ+Q+cSF46ex7fatmkjDVf6cCVlnOW+OW4H6QNvQDGohPOIowCqVByRQp61roDMi
	 +aJaws0OtKH3nRnpyNO7UT4OsmXAMYQlzSjOH4/TUSA7YYfJ6pzgk6aCa2tBA+99cE
	 bvO8djuMySzY9+nTh3nzvMu59XRU9/WMp4Df5V/SNB2KGgtfMc7IWt76lIeGEkGdgN
	 9+fGN2VuOgGoQ==
Date: Wed, 1 Apr 2026 08:42:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
Message-ID: <20260401-divergent-magenta-dalmatian-3c6c3e@quoll>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
 <20260331-k3-pdma-v3-1-a4e60dd8b4b3@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331-k3-pdma-v3-1-a4e60dd8b4b3@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_234234_916237_82B7E672 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

On Tue, Mar 31, 2026 at 04:27:04PM +0800, Troy Mitchell wrote:
> From: Guodong Xu <guodong@riscstar.com>
> 
> Add the "spacemit,k3-pdma" compatible string for the SpacemiT K3 SoC.
> 
> While the K3 PDMA IP reuses most of the design found on the earlier K1 SoC,
> a new compatible string is required due to the following hardware differences:

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> - Variable extended DRCMR base: The DRCMR (DMA Request/Command Register) base
>   address for extended DMA request numbers (>= 64) differs from the K1
>   implementation, requiring different driver ops.

Please do not mention drivers.

> - Memory addressing capabilities: Unlike the K1 SoC, which had memory addressing
>   limitations (e.g., restricted to the 0-4GB space) and required a dedicated
>   dma-bus with dma-ranges to restrict memory allocations, the K3 DMA masters
>   possess full memory addressing capabilities.

Programming interface is still compatible, regardless of memory
addressing limitations, so that is rather incorrect reason.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
