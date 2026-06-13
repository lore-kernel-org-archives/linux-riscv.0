Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7DECD98C5
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jun 2026 22:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7I2+warq5z8fXs3heRv58sToPP2R4a4jbqnI+dQ+Axk=; b=ptcSbJUFQB5ho5
	sWdQZJAmkarJaXRmQox9c1oSNuOVijbLJgOJTkyrB9wCjMas+vSzx+4hL5Yl+ERmEMkbAvhDJlBUc
	4dZtNj2ZjlPSVQR4qQvX/RZdXWoCn8CYLCCDBHM3VN4rJNclQh+8CGP2vw7d1PEoTA0liAYA7SwMl
	78eIdyiNzRSjR6g4xigVgV+kM3nlX8Abv3uFy8GNGxviiuy7rYYU6N/eT27xPoDs7tE+DxrrP4KtE
	PgW2A0C9n1Yv6702U/MYqhNfLC5ilYDHMpEd+/rybXL17j5t+cMZByDOakW5Uzc2NUITTy/Pc7odC
	DWNj+e1lUvfHNwu/gr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXFt-0000000Calc-0T7M;
	Sat, 13 Jun 2026 22:55:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXFr-0000000Cal6-1o8N
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jun 2026 22:55:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C67B417A4;
	Sat, 13 Jun 2026 22:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9141F000E9;
	Sat, 13 Jun 2026 22:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391306;
	bh=BwqEUqZIHCYcI0ej/IpaqwrOyHSHksQI9CW0b3RsNBk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=R9ip4fg5VJR0IjDbCnnUMEoD9vvZtiSc64E4KxTCZYSBjeALgV8VVi7Ul6LXo0N6I
	 DZc/L4r3PCNIduUqXCLG+63el+4olLumLBiUI/+U2LAoMF6Z3bhM/EJj6MkHFoNENc
	 NPtfHbtkCNZneHrj5o6vJZxs5XZYZOjDv9itDowhEIjXQ442kvzaklykCwG2jvk2Kz
	 UxY+a0a7IT+1suvVzE1leYOP0dmEvxEZ3vQZet5qVH6auY9vBZIGahDUoqtbwH3IIm
	 OV14oTXkYTcO7q8ero/Xf1mBSvZodLaKz6YgU7MvqjcbqtxNK0xAUIURUlMqpnvqqF
	 l45olQejkmYZQ==
MIME-Version: 1.0
In-Reply-To: <20260602-latitude-unroasted-d88074ae2ebc@spud>
References: <20260602-latitude-unroasted-d88074ae2ebc@spud>
Subject: Re: [GIT PULL] canaan clk changes for 7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, conor@kernel.org, Troy Mitchell <TroyMitchell988@gmail.com>, Xukai Wang <kingxukai@zohomail.com>, linux-riscv@lists.infradead.org
To: Conor Dooley <conor@kernel.org>
Date: Sat, 13 Jun 2026 14:52:11 -0700
Message-ID: <178138753189.819343.1420937117273276704@localhost.localdomain>
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

Quoting Conor Dooley (2026-06-02 02:09:42)
> Hey Stephen,
> 
> Please pull the addition of a new driver for the Canaan k230 SoC.
> 
> It's been on the list for quite a while, with minimal feedback received
> on recent versions, so I figured I'd grab it and send a PR so that I can
> merge the rest of the SoC support for 7.2. It's been in linux-next for
> about two weeks with no issues that I am aware of.
> 
> Thanks,
> Conor.
> 
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ clk-canaan-7.2
> 
> for you to fetch changes up to a7b7c7c6c01679efef0fd2f2ca1c5114f303e4f5:
> 
>   clk: canaan: Add clock driver for Canaan K230 (2026-05-22 17:13:10 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
