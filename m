Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968A6C25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4XQ7BqAxZ4LzY0a022yKoKuVFOJdQ4RVp8SMpB2gLk=; b=FLIGI6Ql3uWB3j
	lw5QwxJ4m0obGmNJ3unuDY8RYDBuFMizsY3AZIRG5mnH0BUQ3AfQx6LKGwYQmipqE4saa5smwXHKM
	0yyzyOEBVQ8XTDRkD3KxZ0sbcjoAQaA12wyvKOo596gP0uBnudsrS81TJvWHqtls+WGUL9FQ4Y/L6
	4vbfQaj/oFSFQxT7AxpcnEnEpidJh3blPUfnA/GEJLNMTloTxkQYXaO8D2Xz8Vy8H06VdFwO3XG7M
	7YZj9BjEKpQcSc70qGwouKu6K1FOz9lzr32yAYEVK+fwJtCDPvmyW1Dpj0G8pYdc5rUADK7ePmLLO
	MuPKxCK5hwrH+LMYouIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0PR-00000001W5b-41ri;
	Tue, 28 May 2024 17:14:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0PP-00000001W4l-0DVT;
	Tue, 28 May 2024 17:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4508962237;
	Tue, 28 May 2024 17:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6879C32789;
	Tue, 28 May 2024 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716916486;
	bh=qyrjilBChXcbabeuPYMmcl4KCvAVqkL8gOwikW3ih3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQXZGMAOWpmruXCqCzgdqN+FgfpL0xIelwQi6ettbFGm47F9kLaHUFcm2wZTi0TV7
	 R0XKnoXQIaCboVzE7ohGePcLfD01H8kZMOnEK/fkNwTolKh0ENqoilPPD/F6Aj2XkL
	 7sd94QFlMPmltjCQ/1DKassUe8slfYBJ5PtssVIyUihRErPaj6gNFIqqRFdDnn5alz
	 C4pAk+h74bqzVOwxNh8CrrFLcfeGHCQyf5wmEAmODSgjWmG4LOQsVxSiHL4EfA2vrz
	 sBeWkfmY+T9P2vbCxywziaDrQM4+HbyBuMyOq+SeuM9zRZFz7cjbs/dKKvfHzOP8gL
	 YUwu3XQQVtzbA==
Date: Tue, 28 May 2024 12:14:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH] of: property: Fix fw_devlink handling of interrupt-map
Message-ID: <171691641513.1016774.9157485411952411160.robh@kernel.org>
References: <20240528164132.2451685-1-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528164132.2451685-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_101447_258828_E8F931E3 
X-CRM114-Status: GOOD (  15.11  )
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


On Tue, 28 May 2024 17:41:32 +0100, Marc Zyngier wrote:
> Commit d976c6f4b32c ("of: property: Add fw_devlink support for
> interrupt-map property") tried to do what it says on the tin,
> but failed on a couple of points:
> 
> - it confuses bytes and cells. Not a huge deal, except when it
>   comes to pointer arithmetic
> 
> - it doesn't really handle anything but interrupt-maps that have
>   their parent #address-cells set to 0
> 
> The combinations of the two leads to some serious fun on my M1
> box, with plenty of WARN-ON() firing all over the shop, and
> amusing values being generated for interrupt specifiers.
> 
> Address both issues so that I can boot my machines again.
> 
> Fixes: d976c6f4b32c ("of: property: Add fw_devlink support for interrupt-map property")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/of/property.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
