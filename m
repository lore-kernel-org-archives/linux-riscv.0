Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C21CD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 22:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fv5fgk2z3fY1owOVMe2xjco7dVyrEXhFHjjGo0EmfO0=; b=NQWga+vS0ZRvNo
	k6wga+AoE11e8uq6HHaAozlN4Y7P5A8UCoGYkP9kMzh04kdfyCUViPxGXrd7Nsj81uPq5YUDWKn8i
	sk+nfjUVyjoMuwlUYq+IcotA0FAQ67+Z9fHN6UOaMrKKhYUD6y22QeA6HT23MLQKg512JIIOQwLjr
	6AY9goyzIHTEU6La/3kUEuBgBEaAdFnDA4Yn4cRF0XfSdMUPrpcPQ58pOx5V6f9lhFNvCnWNUZT7P
	vUILt5ZL3PcSHH6tFzQoLkBt/vFVFv6K6hcauGdF5yQTKDaf3T4WBq3h7uWDCEWt+2NqbwUMpESRZ
	fTVwIsMh44CgYuoLel7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIWs-00000003y1W-2OXi;
	Wed, 13 May 2026 22:58:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIWr-00000003y1I-2oYz
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 22:58:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9CF9600AE;
	Wed, 13 May 2026 22:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33D6C19425;
	Wed, 13 May 2026 22:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713092;
	bh=UJXw77036QRC2gbLJ1DXoQA6e75YWdG6aLoyVTky+NE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GbJnc8MA43YFlq345p4312t6QH9guw1MhRhcUznBzwQAjMm/0YHbcO1mZu7WP7WBv
	 bayG+GBUL/5ZstCQducNbitoPsl0ns1nyVKlZCuPaTAsZj/uUNHLhmirtxN8eZK9Iz
	 FEAxeoop/vH2DsWK9SCG1jBQqzjoDLmkA7zNzpkMlfIvXnlZjV/fBJtcgGqEMOOjBk
	 ZNExAdS7LbbuFk9eQxWS3Vdu4O0oU3tTxtQlBEM9zCn/ere2HY0l7GWcIJ/YmV5zRd
	 AX250Tkd6eyy4ObbDAFcACrV9sKTq82dgCVc0fhNQdWMi3uRjDaJlf9xI7+fOvJb0A
	 KsFKdOpO0l89A==
Date: Wed, 13 May 2026 16:58:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv/purgatory: add asm/purgatory.h
In-Reply-To: <20260509073850.44595-4-thorsten.blum@linux.dev>
Message-ID: <5bce7e41-01bd-c0df-1ed0-2110f22a2133@kernel.org>
References: <20260509073850.44595-3-thorsten.blum@linux.dev> <20260509073850.44595-4-thorsten.blum@linux.dev>
MIME-Version: 1.0
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

On Sat, 9 May 2026, Thorsten Blum wrote:

> Add arch/riscv/include/asm/purgatory.h and provide the purgatory()
> prototype via the architecture header, mirroring the x86 layout.
> 
> Remove the workaround from arch/riscv/purgatory/purgatory.c.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, queued for v7.2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
