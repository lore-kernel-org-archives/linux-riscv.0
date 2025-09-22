Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E42CA100F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6ehtUf6FIUaYzregQ4W5acdeSuSIJnXCObroBBR/Ho=; b=pl5Z/BpGIuDOlJ
	TgxyVVZGApgewC+bY73vSlyz7EPkibxzs+eNAVrLW3SvCcoBGjqym1NR5VFx1dTjw48bEUawXHUZv
	ZKU1XPRyzN0lgYUYp03rU3HDf411ZUo0POj7UrrXtzzdsv+B9HIuNAAfKCoOiRbUILkvqbcOq8fsg
	R50HxmS1p6zzNqp9t9mqba6u0H9rD3W3YWDjJPnyDY5osSjrBl22gu3MgfjF6ASqNtAACRFSMTzoe
	lFmOwI+ORZWqtOISKqNmLnVg3eo7+KIVhgfg6ecdlIq8Mc28nTeJZ+iDHRL1/g5VgUOpBxyCBrKeK
	Ia+/auPdCBjUV1bvyGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j1y-0000000AvSj-1JSy;
	Mon, 22 Sep 2025 16:04:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j1w-0000000AvSJ-3CsK
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 16:04:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 388C7601FD;
	Mon, 22 Sep 2025 16:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C880EC4CEF0;
	Mon, 22 Sep 2025 16:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758557083;
	bh=j8+H6d+N9dsULNeU+aYEW3KWGEvfUeD2U3M3YFhZX0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BV6qaTpdj8ZlZB++F+0X9FE1SAOjVxZ6TJWOPovFbM7fyQcFy2s1UqH3udVbA3ppc
	 S3/H4Pdl121rg+2w0w9Gsx9fyZAzAPWOy56X+PT0+VQKhFXMpghfsBJusqTVtRXuk7
	 U9Y6gWZTM4kyJg68CGQrK+ToXKzW9DyeEGhnIBwXY+nYQgznWLnpXWhLc9X9Ayk8Pw
	 7QFVyGKnOaQTjjy+cwvSaCbqWSXiXoIzb5qwAGWaBw7CbujMNK/fnkh4rQRJ2YUP+2
	 /WyLR4l01zXFjOQeDkmyRbRbyKRGzPCJTyzPicsmvc9ScxR96fem5HfM1bkbk2MYcG
	 EWOQ3U48Y1RHQ==
Date: Mon, 22 Sep 2025 11:04:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: reset: thead,th1520-reset: Remove
 non-VO-subsystem resets
Message-ID: <175855708160.137911.10472182890366112328.robh@kernel.org>
References: <20250915095331.53350-1-ziyao@disroot.org>
 <20250915095331.53350-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915095331.53350-2-ziyao@disroot.org>
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Mon, 15 Sep 2025 09:53:27 +0000, Yao Zi wrote:
> Registers in control of TH1520_RESET_ID_{NPU,WDT0,WDT1} belong to AP
> reset controller, not the VO one which is documented as
> "thead,th1520-reset" and is the only reset controller supported for
> TH1520 for now.
> 
> Let's remove the IDs, leaving them to be implemented by AP-subsystem
> reset controller in the future.
> 
> Fixes: 30e7573babdc ("dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  include/dt-bindings/reset/thead,th1520-reset.h | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
