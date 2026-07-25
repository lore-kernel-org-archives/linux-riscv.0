Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B485C531FC
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 01:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lVA0wDTC5R45+qXDxT69fGX7mKxrk5h+lYuLyP+V+A=; b=eTxouUFzacG74/
	OrCXYnn6hRcreXKaviEgOeznNf5Egr2YGngmzA3oWrLE95IiOB/Hs56zjjbENBXL+EsPD6Ey0bwRl
	PuCfTBmAvfOK4g2gF9lk/zSmH0F4lJmJwUxiiepSPf5oFDURbV1RhCKzMl+00tDeR2HLZ4wVK9gyO
	IG6AnkgXqj9yv3laNJw9lmGE6TccXTj9ER5PPjjopgSTZ3/DUeL1xQKCfkB/Ph/q3Ah9S9wbI0uOK
	hjFhMeqmSByxqU2rzRbzI+VfwT8E7RGHaS9+2I9iGUcpi7sladAeeyPPdCmilwxaawGVqyfTXwo7m
	FXGR3OSRFhqO6fLezZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQuQ-0000000HR8H-0Yub;
	Sat, 25 Jul 2026 01:10:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQuP-0000000HR89-1BjB
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 01:10:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 80AD641278;
	Sat, 25 Jul 2026 01:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D413B1F000E9;
	Sat, 25 Jul 2026 01:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784941832;
	bh=7Tdgl5VWtqICxb+Y8DVatCG+1v07WZyrS2hVZIJk20Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bDb0U3Cz9TrjtxczsWNxtfeuuyiPtLOWKyqkdUKkaJRbznCe2PHVl9UXzK8yDX9qT
	 elV3PJOS1UAJn5NQ4lVn3lk/A78AdnkxrdYtznbUYBsKVnT/myzA1oqH78E8oFVgHu
	 cK4AYqR/jGadyvVhDAWRteWh4EWDK3RDsXJ6pF8+ThK4Y8iLszO6Ov/rjoIndB0b47
	 EMXqgFOzwzmuEOscxBjaFE1jKLEsA9Mo6Dt8P8zzkeQ1qFg3sRjddfJSdMBzS/5T0m
	 txsyoi6FHflbPHkIqx/uOZYfHTjZOyHgCvOm+I4NH8Iog2p5xHQWoXXSPtqFOOOFWz
	 33WMhZGvKlkUA==
Date: Sat, 25 Jul 2026 01:10:30 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for
 the PHY on PICO ITX
Message-ID: <20260725011030-GKA77474@kernel.org>
References: <20260710063314.1030249-1-inochiama@gmail.com>
 <20260710223804-GKB106000@kernel.org>
 <amQKpgD7NKlR8qEE@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <amQKpgD7NKlR8qEE@inochi.infowork>
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

Hi Inochi,

On 09:01 Sat 25 Jul     , Inochi Amaoto wrote:
> On Fri, Jul 10, 2026 at 10:38:04PM +0000, Yixun Lan wrote:
> > Hi Inochi,
> > 
> > On 14:33 Fri 10 Jul     , Inochi Amaoto wrote:
> > > RTL8211F require at least 50ms deassert to guarantee the register
> > > access, 10ms is only enough for the PHY reset.
> > > 
> > IMO, it's kind of too trivial to split into two separate patches,
> > while duplicating the commit message
> > 
> 
> For backport, I suggest keeping two patches, so it can be backported
> in a more clear way
> 
Ok, fine by me, I will queue the patches for v7.3

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
