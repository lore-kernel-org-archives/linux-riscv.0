Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAACCFC509
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 22:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJ3lKugIq7Y4QebJV6yQ/rsD846mPoTLO91Cf7gBTVI=; b=1bjB5riOFKaoQg
	gLIgjKChKo30ZA3iFJ8UrgoHBx4f5acfFfCoQtvCIgzc3jyay3khXVvOa1xL5ruR8tr4svvYLig7H
	hrErMdiAQNC3Byu8BTDEVgsELs2LEbGpHOrcCAnh7+kPkYXDz7s9bHf493myoY7bdT04+OXFTAM0t
	vu0cF76LZc6mS/ms1IZ2ucmtZN5JrIKMKmk+wUAydtkIqsV2Hu38StnhVCIPaa63qUZqoJBe9s+yC
	3AvxhLMKHyJsGF4YZ7mORV0XRujL6pcve5rq9vgjoFe/760Egbe7+9ltnCkt85b28EZ9eOqCCsl/v
	gQe7xgqdho3CakJoGUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMZUc-000000091vF-3ijT;
	Fri, 21 Nov 2025 22:20:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMZUa-000000091ua-294F;
	Fri, 21 Nov 2025 22:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8783D43BA3;
	Fri, 21 Nov 2025 22:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6DEC4CEF1;
	Fri, 21 Nov 2025 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763763635;
	bh=IA7dRYfgmLM6hh4dPmzDRF9cilrSQigzy922nod1WPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJesF9+6JXaHzGISpMpsgsByjjJRM0QtCtvm2qL3gNgta24CuCZbdho3/MCwy/6rm
	 wTEygSGamPSDbl3LFobWCmgI0rPTUqF1eXo3FPj74vkKRYzqfWP8cE0MgKC7IQoIH1
	 Z8PuCzaUKBcT+azvdSyjcMzK7TM21it/2mqnGZILw9g6yIpTZxkntKATJijxGupIy+
	 cjOXjavQ62AwFHXfiyG1RyjkAMXVuPdgEH8aFq4snwjSQDUU2NkQJfkILhOEHJggNM
	 RO6mCyvbw2bYilLbZKOHaF3d/PsO61RNb9mtw3RWYiN1EPtvTQ2jO37K3rML5gd/Yc
	 +CNi7KS/9M9SA==
Date: Fri, 21 Nov 2025 15:20:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] kbuild: Support directory targets for building DTBs
Message-ID: <20251121222029.GA1674270@ax162>
References: <20251120204812.1983452-4-robh@kernel.org>
 <20251121063033.GA571346@ax162>
 <aSDAqhUb8_76IP0Y@derry.ads.avm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSDAqhUb8_76IP0Y@derry.ads.avm.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_142036_577799_91AF59B0 
X-CRM114-Status: UNSURE (   8.08  )
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

On Fri, Nov 21, 2025 at 08:42:34PM +0100, Nicolas Schier wrote:
> Using '$(filter )' instead of '$(findstring )' reduces the risk of false
> positives, e.g.:
> 
> dtb-targets := %/dts %.dtb %.dtbo dtbs dtbs_check
> ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(filter $(dtb-targets),$(MAKECMDGOALS)),)

Oh yeah, that would seem to clear up my concerns.

> With (something like) that:
> Tested-by: Nicolas Schier <nsc@kernel.org>
> Acked-by: Nicolas Schier <nsc@kernel.org>

Agreed.

Acked-by: Nathan Chancellor <nathan@kernel.org>

> But [1] seems to break this patch.
> 
> [1]: https://lore.kernel.org/linux-kbuild/20251120140645.478623-1-thomas.de_schampheleire@nokia.com

Yeah, that will need to be coordinated, I cc'd Rob on that change for
him to take a look as well.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
