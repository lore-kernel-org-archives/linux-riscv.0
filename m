Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0FECD8CA8
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jun 2026 22:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izwqWHspdh35XMa4X6N7+yF84UicJBPgPoK3MuyLQOI=; b=igakms7UXW4pgL
	obfq5LbQHRYJmXuxprbi17zmhvQfNDXDTB6L7gs8OajoMSEHOYM8fTo48D4ZT+ccYgXX+Baf4kCSu
	DY9vkYCgNpnE8lRFbqMMtifJMTdXnDQGbXAzsOLkrPpLgaQeWN0jKEclNaChKJ9VbgPYW3OSjGvZ+
	FTezLMJVxhS61pSDT2fAyAW3RkQX5kWF84XlrORTRkjiakEDjng5XtJLsHXqAFXEGo7VlefumpLLa
	I4n+2d9gKwwELZB/GCSKMAKKTdevF2eAJdi8H+HTPlYyOu804t/FbPvRYSLyC71VLJfPbbN7OnRBm
	oJfxayabM1XZZNl2MhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXFw-0000000Camd-0uaY;
	Sat, 13 Jun 2026 22:55:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXFu-0000000Cam3-2zNK
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jun 2026 22:55:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D677600AF;
	Sat, 13 Jun 2026 22:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E061F000E9;
	Sat, 13 Jun 2026 22:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391309;
	bh=kFm/v8Fkne9Zzw1gl0HAOhSOwY2bIVLPIqywqA2BEIY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=GeszxUzGdoFfGIl3Rg3mVslKGfhdVnmL7xoAsuiKjMN0BhjmfBhkhBOECqf12aKez
	 tqU24lDpT4OEXIo2t/LKi1s8slrMnfS4mg7EZZaaKqqIhEgjJLcuzS4apNxE9W+Do7
	 EY1FLNLNp9brwBQwXb0Rm/OiiVD/8WMffYfBsSM6JSGHo0839A+v6gGTYC7XGq4qG0
	 M+POoprV1E9mufcllrbGQ6PwyHD6EPHKIB3U6kyywieIJeDIMGAfgtVIVzVap6ihsz
	 l6i/VQadBWqUG6fJ5MyBhHTW3ksGD3BLxie3xJtE+oNPac0CDhJJIZfD6+Zg3IuvZS
	 v4WHYJZxwwLMw==
MIME-Version: 1.0
In-Reply-To: <20260609052422-KYC4837748@kernel.org>
References: <20260609052422-KYC4837748@kernel.org>
Subject: Re: [GIT PULL] clk: spacemit: Updates for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Michael Turquette <mturquette@baylibre.com>, Inochi Amaoto <inochiama@gmail.com>, linux-clk@vger.kernel.org, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Yixun Lan <dlan@kernel.org>
Date: Sat, 13 Jun 2026 14:55:19 -0700
Message-ID: <178138771970.819343.13341743695486361093@localhost.localdomain>
User-Agent: alot/0.12
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

Quoting Yixun Lan (2026-06-08 22:28:09)
> From: Yixun Lan <dlan@gentoo.org>
> 
> Hi Stephen,
> 
>    Please pull SpacemiT's clock changes for v7.2
> All clock changes are related to PCIe for K3 SoC.
>    Hope this isn't too late..
> 
> Yixun Lan
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/spacemit-com/linux spacemit-clk-for-7.2-1
> 
> for you to fetch changes up to a37c75d7b5bb7f3344b0e639b313ac5ace6244ff:
> 
>   clk: spacemit: k3: Add PCIe DBI clock (2026-06-02 07:16:59 +0000)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
