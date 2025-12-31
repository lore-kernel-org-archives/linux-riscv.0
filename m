Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75877EE49BD
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 03:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xFmDuy1tfirUDbG67x9t+DEKbRVf8Q/A/XRivVO7CM=; b=Ka7hHJugrTK94t
	Mb64ywLrpvF2vmdjhRgj6OyUC4txLsBJ1orC+yzRrqinkvdajhkWwT94q1ojRW3oZaYJQyGHoAlnz
	0ZtBRkmd4G/wDlOLvdYxiKbLHEpK+efOztA2K4pGlL/BzwoOuAU/U1ivZCuWwlugjCUVGM+sJ6S34
	BvHkxYygBBSqJg7zgIlILQY1Kg4mGvBsSZc7dqv31EWuASNhwACughDsDwJh6jx2QVNaakSKtGwLy
	cOQLwMDVvl1oEnSAKRDLh6Vm9p6nZ1ORX4ubHP8iqS+eEWpUlsnj72sSaDPmHAsVxSE/9QS1J0Onc
	H162dFlE88Daa8kZDbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamSk-00000005cLw-245Z;
	Wed, 31 Dec 2025 03:01:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamSk-00000005cLb-0pmj
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 03:01:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51C8860008;
	Wed, 31 Dec 2025 03:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EA4C116C6;
	Wed, 31 Dec 2025 03:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767150085;
	bh=Q2+Rt8W61CA9DfQnOvcn73GgeeG4biAzPEGsgWhR4ko=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RSWmi1fquDi6fA20tELdQkP1lOKT4KonhKTiaR39WPycrE6efi9VAMZ7aXCjBmRsn
	 M9D51EWeAC5PFewmfYcRQK04TitdhWL40pA/TAtbMK350gmvuwVR4xUsETIXifQmxE
	 pRWfPxhSEr1PK0zi3XuWV0j3AST1eNQ0ia8CPEIfJXDNyiosbLEsEVva3jGXWRmgJY
	 JDSgBTyT/osNrRtl4sc23wRDPPSz6yl9evPQ4UjphKCUrsMvM0vnIurYL9wGzqp+VZ
	 Bg+LCKvqdPQOF0oeXmEpJb2J/XH2UMivVWij/Lzr91BjckG0kwXYTu6T2CZxTLqCYI
	 nu/50mnZoMCHQ==
Date: Tue, 30 Dec 2025 20:01:20 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Lukas Gerlach <lukas.gerlach@cispa.de>
cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org, 
    daniel.weber@cispa.de, michael.schwarz@cispa.de, marton.bognar@kuleuven.be, 
    jo.vanbulck@kuleuven.be
Subject: Re: [PATCH 2/2] riscv: Sanitize syscall table indexing under
 speculation
In-Reply-To: <20251218191332.35849-3-lukas.gerlach@cispa.de>
Message-ID: <e41be7b8-5c39-a41f-e194-7cfc595b3f76@kernel.org>
References: <20251218191332.35849-1-lukas.gerlach@cispa.de> <20251218191332.35849-3-lukas.gerlach@cispa.de>
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

On Thu, 18 Dec 2025, Lukas Gerlach wrote:

> The syscall number is a user-controlled value used to index into the
> syscall table. Use array_index_nospec() to clamp this value after the
> bounds check to prevent speculative out-of-bounds access and subsequent
> data leakage via cache side channels.
> 
> Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>

Thanks, queued for v6.19-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
