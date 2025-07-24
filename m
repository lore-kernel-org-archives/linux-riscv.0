Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171E4C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 22:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FJY8a0wfCSj99FS8wZjA80Nc2DkdemdP2XdnwG3JXM=; b=47hodH//f0G69b
	NNvXNDReWHDEiJMXyyNsg8I91Ac2IwW4iBm3SwiNLcOqzFvEPLTBbMAqA/AyH90exMhT01/aKu0cK
	viHh4YXRlJxniQevpqyXsV2+XNeR2du2n6mptL1XWwpndAyFTFYkiJ8XG/Jt2wzk07hddqpcmveJl
	bLpGp+0zj5kL1yrTiQrDopLWpnbd6NL45ljcS12iEvtYdRCxmSInI2nveXbdbstX6xFnHJLZJQKVa
	LrGPpOUUYo5yQENEuzym6hlN3kGxlEBNhmvwdOYU2ZtOh398+rjD6MD90R9f7F5Q0Zwm0AJhMGh2R
	8R8rOCsZIU0vlSgu9dGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf45e-00000008YYK-3gZO;
	Thu, 24 Jul 2025 22:07:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf45d-00000008YY9-29D2
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 22:07:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A02EB60008;
	Thu, 24 Jul 2025 22:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEF4C4CEED;
	Thu, 24 Jul 2025 22:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753394820;
	bh=H4bI8MigaMkypNpkii9+xYRtzoc4ShGUP1lY8l1HJE4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ksI732Z46/mkBky8OU6QC/3H2CN751lTILAbTuLw6NiZGamBTd1OUolE0tXAR4/6C
	 fw059+tkbgkFjNHv5H7qVTdtJSD2udS2vVY5LeJr75oeUtESTg82jCFe/KLzIACpnR
	 w56OsBpfZs41hMG4VbdTc1SIPCjVmsnmLgYJTcZmGBKyHsF05KaZWELHF43jOeYfuw
	 ezlp3wsvZ7x/ceRFeX5ZLyDWGPF9wQuwfLhjMnMnZfTe/GmHkyi8YpSETZVXnnq2nl
	 McadAsd+WCHeHnE6RkNIzDYll06qorlWxiklF7dOnNZpHMGXFNPAhYz6QlmTF1J+mw
	 U1ajbwJndOmoQ==
MIME-Version: 1.0
In-Reply-To: <aIKcFzsCvvz0PCBW@x1>
References: <aIKcFzsCvvz0PCBW@x1>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.17, part 2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Date: Thu, 24 Jul 2025 15:06:58 -0700
Message-ID: <175339481888.3513.6668397032978631593@lazor>
User-Agent: alot/0.11
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

Quoting Drew Fustini (2025-07-24 13:48:23)
> Hi Stephen,
> 
> I'm sending this followup PR in case there is still time to include it
> for your 6.17 PR. Yao Zi refactored mux clk registration which fixes an
> orphan mux clk issue which would occur when booting with mainline uboot.
> 
> Thanks,
> Drew
> 
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v6.17-p2
> 
> for you to fetch changes up to 54edba916e2913b0893b0f6404b73155d48374ea:
> 
>   clk: thead: th1520-ap: Describe mux clocks with clk_mux (2025-07-22 15:40:54 -0700)
> 
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
