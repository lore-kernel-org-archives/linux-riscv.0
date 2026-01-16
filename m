Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A03D4A615
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 09:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeFek4UQ/dq0mnS4VLel1cE/amuGcFIC/vxCaH4WM8I=; b=AMHV92MDYicYUI
	MzNn2FaFJwtbnz/Yt/JT+uLvFSSUgM3rRvLslC6V3iQANH6z8DoqRoYUwVVdt1uiv0OQSZ5yB7eMm
	bJWy1u2LXDy4EvWWZ2Klg2Ryx2SwULmyWHRw3gi5uk+ogZfyHYN1hAEXoCeeSx+gwZtxE3kVBgfLY
	MLjnLpwH2JhP090iVDbrB2QRgbWbVlBS+Lj0AG7lYYwbJ0xq8Kmt0YsB9c0qMSZNvQ0bVIj9kxux5
	LSf8bfwU835q8yza4Qmn6oYld+sBUskMeopbb7Jx4Pzp9uKi+o48NuNBUmT4ZnJ1oNySL22lr4Y3r
	kXFQbbboDkSxNP04+02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfoQ-0000000DpAQ-0IEz;
	Fri, 16 Jan 2026 09:08:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfoP-0000000DpA2-07vR
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 09:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24FCB60160;
	Fri, 16 Jan 2026 09:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B88EC116C6;
	Fri, 16 Jan 2026 09:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554487;
	bh=TOF4GAlmY1WDg3xIdWRzUey0EKZgIyHzsAISslRGFF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppedPxBFdX7m92njKvJHrxJMadmvYRzmJjPcIaYZOeUmoMjClXn6IzDN5t2qwed6Q
	 e1utOmmJr71/Rv9gg95IBitzgF9Vwdb0oNpbrOF1QkGm5IpUgsmc+oPdnbD2u7YptJ
	 CmoAi9reGBqr0PBpt62+6nVDZqaiQehJCfVG6tkkU78L2QM1tRKFsRBjd9dKjPe1id
	 Nliv7Xm3xv37WmHTkBaPY5SA+MQaXk+1iiLXSVku5Iw44eLguAw8rPrqACD2+eN0Vm
	 1zJWCN/pOm5ZLLGPChbuvCybAMUyUaFQXWQtfsKaP2Pf3jXE0f3dzONDnSCqVVC3Fn
	 MBTHk3+tlrxdw==
Date: Fri, 16 Jan 2026 10:08:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 8/8] clk: tenstorrent: Add reset controller to Atlantis
 clock controller probe
Message-ID: <20260116-pretty-maize-cuscus-fd1cbf@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-8-7356e671f28b@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-8-7356e671f28b@oss.tenstorrent.com>
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

On Thu, Jan 15, 2026 at 05:42:07PM -0600, Anirudh Srinivasan wrote:
> Create a reset auxiliary device during probe of clock controller
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  drivers/clk/tenstorrent/atlantis-ccu.c | 59 ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/clk/tenstorrent/atlantis-ccu.c b/drivers/clk/tenstorrent/atlantis-ccu.c
> index f3a2ea49a82e..e4f56018907f 100644
> --- a/drivers/clk/tenstorrent/atlantis-ccu.c
> +++ b/drivers/clk/tenstorrent/atlantis-ccu.c
> @@ -491,6 +491,7 @@ struct atlantis_ccu {
>  struct atlantis_ccu_data {
>  	struct clk_hw **hws;
>  	size_t num;
> +	const char *reset_name;

You just added this file! Why are you adding incomplete or even buggy
code which immediately you fix?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
