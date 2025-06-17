Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2958C7114A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 06:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLxQsc2WGQ+j800HLxB6CQLXP+4X7sCWNd5aoOA8Vr0=; b=JV6UqgQ1mcOvvt
	eXotoGoyVhyRSg63+wqVfbg3ZNifqyGUQL4XRljvjaQEvrwU9QQNXlfpd+ZxCj6ilaARscnBfPxOu
	qdNp8s/1S6p/pSJQQHotnMek+lRvDUMfw0Ve0jB0DKFLDUCap4BqaSZbhtTYa0gxhOyANudZRlEYo
	H3etEN2MVDl+AV2rfugKx3MfCqNpnPDScxET4aPA1gk/r7JFoyzLXE2NZ9O27W+RzZ07J2V5aGA4U
	iTWJ05eFKOlni/ajemtCEVGHPs10la6/LvuH7on78dH5UUBIKRuFqra859ggk8X3SkbkNtlMB01d/
	aWW5lx/2TxZgBc7SwPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPPJ-00000006JTx-0uZL;
	Tue, 17 Jun 2025 06:02:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPPG-00000006JTc-2Up2
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 06:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B67B40C14;
	Tue, 17 Jun 2025 06:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985FCC4CEE3;
	Tue, 17 Jun 2025 06:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750140170;
	bh=y3LjvVl5E7KxK3T3g5NR+r6/2sbufh9dPYcDzRkbfdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vDqEObYqJgZsr3HsU3JEM5UdeuznK8bpOubp16XshTnWA4lQcYuVdnMkfpsodMRMN
	 z1a5IKqyB0y+o1RcfgyJ46ItVjTYPamCYQ/Qm71gkCNlStAGZGVQpx7sl7POMeF4RK
	 0KI7oe4MIJZRktHYrKioauhHZHUHpGzYfPBZLjSFxMfDwc8vxkBrqLffqXvZzq+yMv
	 29xWo4gTwmZYpvTUlPH2ujpdU+I74jbP+MKRW+m2zbr+92LlD1kG7Y8n9iRHR1mI4h
	 UbKYyQBeARoIQF8nW7oaH3tr2pDf6moA0Yyfo4Ya6y1MNnRDwqg3RQT6UWWp1Gy/e1
	 TmSHYwDY4gMyg==
Date: Tue, 17 Jun 2025 11:32:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, emil.renner.berthing@canonical.com,
	inochiama@gmail.com, geert+renesas@glider.be, tglx@linutronix.de,
	hal.feng@starfivetech.com, joel@jms.id.au, duje.mihanovic@skole.hr,
	elder@riscstar.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 4/8] dma: mmp_pdma: Add SpacemiT PDMA support with 64-bit
 addressing
Message-ID: <aFEFBss3RT7NbQkV@vaman>
References: <20250611125723.181711-1-guodong@riscstar.com>
 <20250611125723.181711-5-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611125723.181711-5-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_230251_178229_742F8AA1 
X-CRM114-Status: GOOD (  10.86  )
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

On 11-06-25, 20:57, Guodong Xu wrote:
> Extend the MMP PDMA driver to support SpacemiT PDMA controllers with
> 64-bit physical addressing capabilities, as used in the K1 SoC. This
> change introduces a flexible architecture that maintains compatibility
> with existing 32-bit Marvell platforms while adding 64-bit support.
> 
> Key changes:
> - Add struct mmp_pdma_config to abstract platform-specific behaviors
> - Implement 64-bit address support through:
>   * New high address registers (DDADRH, DSADRH, DTADRH)
>   * DCSR_LPAEEN bit for Long Physical Address Extension mode
>   * Helper functions for 32/64-bit address handling
> - Add "spacemit,pdma-1.0" compatible string with associated config
> - Extend descriptor structure to support 64-bit addresses
> - Refactor address handling code to be platform-agnostic
> - Add proper DMA mask configuration for both 32-bit and 64-bit modes
> 
> The implementation uses a configuration-based approach to keeps all
> platform-specific code isolated in config structures. It maintains clean
> separation between 32-bit and 64-bit code paths, provides consistent
> API for both addressing modes and preserves backward compatibility.

I would ask for this to be split, first to to driver changes for adding
new ops and then adding new soc support. This way the two changes are
independent

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
