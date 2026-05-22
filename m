Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A242CD5BAB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 03:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtNyfvO8RAAlEOGuBsYlcBrGG+F+25S+QYyMzFXx4vQ=; b=4QHgKvOezfXzXw
	ogIc7f8Vupg8iopNfUdjNoBkgk2NOa9uenTLIU8XGqJnAkCvjXfG9CEf86/+tnj/iqy4H1oot69Mv
	87/bsBXyJZ3umKXIH+ujduAnqLrSWZNTlB8LRT0Uu/Roddewr+tXS2R9P+UGiLkl739IzPa6cm3uX
	VhsAlspKT9Q6Vl40bfhzbkgZ1T7Jvu8b0WAK9897SljgWAPRXYi+5dkjQTkKXJKHz6ZXLk3ueqctB
	xhdhK9SsFurBMvxM8dVZNsjJL3vh1kE5l9KVddaaNzAwg+qJLvtUDQpi4QoKNlGm8IZ85AIE381ou
	LOJtQj49nD/yh6/BXFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGEs-00000009c7I-3lpf;
	Fri, 22 May 2026 03:07:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGEs-00000009c6h-02UJ
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 03:07:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2465960204;
	Fri, 22 May 2026 03:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3DB1F000E9;
	Fri, 22 May 2026 03:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779419272;
	bh=6kQrez1gnivfNNtB2gZIX9sMLH3yQ/lt7QrGi8nNRMk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Rn6kQ0Paa5xI2I2AIxheHOXwZdj0qePhSZb8Y76bV4VoqIqJkePjQ67mpPbBw1J31
	 +z1Epz3YSukDwbifKiO59MdIztjiXv+MJq0YjeK26MkIaLZpEGj2hfqikjSQZQq6cs
	 NgipMrYytdC90ES20UrxDTt9gBLdoz8awCBAHuXXKjvctHSNuBDUEy3ZUXlgQJESKL
	 pdUyH7ISVY7qQrMsAO+GDLhIn3UlGTiRnMYAx0L94i//ohdys07D+IrnybxhjA7+VW
	 vqJGnKzzbpIcKFJaUY+KfdbwGqjhRfTC0hAY3wOcxtfnaErlu8oJPXi/fuM/D0uRuK
	 5m3UEOjwugTpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939D03930E40;
	Fri, 22 May 2026 03:08:03 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: module: Use generic cmp_int() instead of custom
 cmp_3way()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177941928214.602940.16428657104568986358.git-patchwork-notify@kernel.org>
Date: Fri, 22 May 2026 03:08:02 +0000
References: <20260512063231.708256-1-florian.schmaus@codasip.com>
In-Reply-To: <20260512063231.708256-1-florian.schmaus@codasip.com>
To: Florian Schmaus <florian.schmaus@codasip.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
 ajones@ventanamicro.com, conor.dooley@microchip.com, seanwascoding@gmail.com,
 linmq006@gmail.com, linux-kernel@vger.kernel.org
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Tue, 12 May 2026 08:32:31 +0200 you wrote:
> The module-sections.c file defines a custom cmp_3way() macro to perform
> 3-way comparisons during relocation sorting.
> 
> Instead of maintaining our own implementation, use the generic
> cmp_int() macro provided by the already included <linux/sort.h>. This
> removes redundant code and relies on standard kernel interfaces.
> 
> [...]

Here is the summary with links:
  - riscv: module: Use generic cmp_int() instead of custom cmp_3way()
    https://git.kernel.org/riscv/c/7a6fbb72a489

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
