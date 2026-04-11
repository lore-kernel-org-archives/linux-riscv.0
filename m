Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB34DF3ED67
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 23:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjge5GLTZnbs2EkL6G/Ldp433yEbCD1tGk98WEBsVnw=; b=Pue6XckLf4W8JG
	h+/JwzfUXhsaz3Kt9HNz7PlewHK2sm0EOpvCexzcH8gncXNwDMOR6WY38NnLUT8+QeAjpekh7ifVf
	szhpnWqpj+offr8TlweuhpnQABpYSj1eyK+LYvAWpkFZTWGoGueuTxyB5AvUIn7kRXazI4Ale7N8C
	FI1I7arlC8wprLo8emXnwhVeSwgRmOVpZPpxbPHAdAS9teakmgMkvDH0dcMY2qM2ydJCPrTJCXlb1
	Rc18luaF4i7WtbQErshczK6J2Q70EJhxT6tCxXXH/cDhEihBAifakIsyJjJ674Jhs6uzI2drd9cT0
	rRGInOxelOc+0lYMWLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhJe-0000000Dr8F-1Jf5;
	Sat, 11 Apr 2026 23:00:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhJd-0000000Dr89-0ADa
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 23:00:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 350E36015B;
	Sat, 11 Apr 2026 23:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65BBC116C6;
	Sat, 11 Apr 2026 23:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775948435;
	bh=tq1KXTnWpJmdQtwkrrNB8D2YP4p81pR/wPRdcNwSHdg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KVqpOi5EMQnk4kfyzl33OuwBaecnrQsKo/M0lAHyy04LNJMKkid8eStdalwpvmtNq
	 Ig4q5t3Y3Nne4/YQNytUCjEZ6frU8IqD5RY5AXhWCLQIXdvS65VUFmyvgVZOJsFRKe
	 DCQN7uGYFpi546VfWlqTpmk3L+XPpZ0uXCr3bjGX2e5MsfgXWOZo38Ny+y/MdTxOYh
	 fS5gGrKA1fwhC8Y8KSLND2bYbb+XzMkazC9CNbFYFOILVspWPLLP+pDdLKrNz8H45n
	 hhQ5ksfNW82+/9+7UxY6TlOgovFZAKpi+GSB316BhSFS1Q4msdxDpYjRZW470aoIJi
	 g00KsE9kGzreQ==
MIME-Version: 1.0
In-Reply-To: <abghFg5INVslFFcc@x1>
References: <abghFg5INVslFFcc@x1>
Subject: Re: [GIT PULL] clk: tenstorrent: Add Atlantis PRCM for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Drew Fustini <dfustini@oss.tenstorrent.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Drew Fustini <fustini@kernel.org>
Date: Sat, 11 Apr 2026 16:00:33 -0700
Message-ID: <177594843379.5403.17573222940623235549@lazor>
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

Quoting Drew Fustini (2026-03-16 08:26:14)
> Hi Stephen,
> 
> This pull request introduces support for the Tenstorrent Atlantis RISC-V
> SoC in the form of a clk driver, reset driver and the associated DT
> binding. The reset driver was reviewed by Philipp, who agreed that it
> could go via the clk tree. Brian reviewed the clk driver but there is no
> review/ack from you. Please let me know if you'd like to see any changes
> and we will post a new revision.
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tags/tenstorrent-clk-for-v7.1
> 
> for you to fetch changes up to 23c8ebc952849b3ba47d04d0ec95daf5cc136061:
> 
>   clk: tenstorrent: Add Atlantis clock controller driver (2026-03-09 20:10:26 -0700)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
