Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1784ACCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 01:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgBiD62cXzm7g2sCl0XsRXd1IAYyePOc25q2efBS23E=; b=qF4Xi3112Nah4t
	fmPt95qKj4rUw/06i4asws0aemi8Z+3W1M9I/Z+b7eVGvMBKiVFNVqbrSE0C31valt7CRettXhUqz
	7tkKW3dE464iG58c+L0Adfy+0yzfNCy05jaWrnN0FrQapSyt76aawYcwoCC8Vi421vDY+3c9DZDDM
	fQ1vv/PCSy2bClsCNWs1gjLXMPOZeB4VZ/ur2v76xXD4fi90vCbR0zdRYYpX/Arpxj6588rBeDIuj
	TcECMxLubwGjCpJchUjBu5gVcLVNP7KyoxervPtam2tIcan/Qw0gr0L8tQzpjG1b16nY29o++22AS
	OcCGlUXzLOwpcNn5dXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v48A0-00000009Prd-0mf9;
	Thu, 02 Oct 2025 01:31:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v489y-00000009Pr9-1Jbk
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 01:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B102F61FC8;
	Thu,  2 Oct 2025 01:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3AFC4CEF1;
	Thu,  2 Oct 2025 01:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759368665;
	bh=HedJW/nDt3ySfYEknVt9nC6mYxiOLbtjAAGaTegzmC0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TK3FBJ2Pi2XNFQq9wfiZrF7ao79pFnuUna+jNN0498YP7RF7HEsRgtaLhnbLS6q0r
	 hpboNQUzFTc1MGKR12rpI9y0J3SKPMEvGY4NQP2HAaEN52crnjtGv1sLYtJ11tn06D
	 YjPslPyB9QVE8rIkGcNSfhuH1JeIsqAvuPHJQJCtKrvmZN26/3HKrC8YiJacARUjj8
	 V6YCCiLuRSwwsoaYDX6V7CF84x9nYW3hLryJkVq927C1YnZAvosV1PP8ZVooNIavsO
	 KbKcZ0y91kn+zfApjzIAoO98WSPQus3zTdGW1z9FQYmNsSawQMOGbVSAh1XK8zb903
	 ro8EdAaYMFEzw==
Date: Wed, 1 Oct 2025 19:31:00 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Anup Patel <apatel@ventanamicro.com>, linux-clk@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: COMMON_CLK_RPMI should depend on RISCV
In-Reply-To: <6555b47f-919b-b56c-4a76-352c904343c2@kernel.org>
Message-ID: <82323d78-0111-aa0d-cafb-d0c04071c6ea@kernel.org>
References: <ed37635b59b0765ed3dbed6ea33c562a40b9e287.1759243789.git.geert+renesas@glider.be> <6555b47f-919b-b56c-4a76-352c904343c2@kernel.org>
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

On Wed, 1 Oct 2025, Paul Walmsley wrote:

> On Tue, 30 Sep 2025, Geert Uytterhoeven wrote:
> 
> > And perhaps the "default RISCV" should be dropped, too?
> 
> Probably.  I guess we should just add this to the arch/riscv defconfig 
> instead.  Let's wait on this one for a few days to see if anyone has any 
> comments, and consider that change for v6.18-rc fixes.

Sorry, this one got garbled on the way out.  I meant to say that we should 
think about whether it makes sense to use a more fine-grained way to 
enable this by default.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
