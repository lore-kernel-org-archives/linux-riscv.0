Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED1BD3CC8B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 00:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuIGOrhODlWqE+vlDsRKQMvkpzn+xr4vATbvD00Uac4=; b=F0bNmNLhl6Me/z
	ojOPNKuCabGPCoyCM04rSblp6g5qt6riTxeK82z4D0Y68DtVOckq6awJvKaKy1LRgzDnve6UipeuL
	8d1EOhXey2lhZpflStl82k67bwgNbPFpMBr6Bly9+gCbt60ENEwTze6aFE816K705UTAjxhq2TKgq
	gqdLDxic76kWxp4/7e3Kv8ORB5hKgBN8w5oLawmRtvTN0o8o2+WYy1cIgnER7rfB4a7gkAtTA0xOh
	z/r62LH+IA7onwkV53o56RcwndwjqS2B+b+pqKGqOqJ2fUDXMimjT+PKO8Tt9UnsdvU/nN1R3NBvb
	SFBUPJoFQ0znccVfrNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAwR-0000000BBD9-0nAj;
	Thu, 15 Jan 2026 00:10:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAwN-0000000BBCH-42W7
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 00:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D02D41E63;
	Thu, 15 Jan 2026 00:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA41BC4CEF7;
	Thu, 15 Jan 2026 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768435819;
	bh=Ljq6Ev0VUg/ATfRNcevTlJY9Y7DmUPF+pSGl3zMERsM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fdxvhVmgH7t0NVfxCuVG+vg+FymTORumEusFnBforAlYl+P3hnT9yqLNlRZsFMOxc
	 v3H3ocYBGnsOr7zTmBl7nx2Rd5fM9rWVIjcqxqNl4MpZBGXlQnS8ZIXEqKoQQA/lh5
	 5jBABtjkfgJoStX8ElTEdd7sTNmhmFsyqaR3TkyDixyU2mrFzY7NNTjkVTEUWQF+Bm
	 dQStxJ2ezwVQWZqOoGQVGslxj7GCorF0SRKLWDXxyogzRAz5/e8R/1oZ7A4Vrg1gPq
	 kdJhffdkwhlexCUB932WeIpKRXJZD9BHZ3dEpXGk6FvPCcqEivYmXn0yBaSSEIcBXA
	 TYl7+oTaBROAg==
Date: Wed, 14 Jan 2026 17:10:16 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
    Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
    Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>, 
    Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
    spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/4] Documentation: riscv: uabi: Clarify ISA spec
 version for canonical order
In-Reply-To: <20260115-adding-b-dtsi-v2-1-254dd61cf947@riscstar.com>
Message-ID: <e91054c8-d7fc-5b0f-2821-9926561f64d5@kernel.org>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com> <20260115-adding-b-dtsi-v2-1-254dd61cf947@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_161020_029297_A8DE0B4F 
X-CRM114-Status: UNSURE (   8.89  )
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

On Thu, 15 Jan 2026, Guodong Xu wrote:

> Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
> Unprivileged Architecture. The chapter numbering differs across
> specification versions - for example, in version 20250508, the ISA
> Extension Naming Conventions is chapter 36, not chapter 27.
> 
> Historical versions of the RISC-V specification can be found via Link [1].
> 
> Acked-by: Paul Walmsley <pjw@kernel.org>
> Link: https://riscv.org/specifications/ratified/ [1]
> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Thanks, queued for v6.19-rc fixes.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
