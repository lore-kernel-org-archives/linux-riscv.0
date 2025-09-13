Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96547CAC587
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 22:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4P2yU+N9k7KIAmvsoi4sl48yxJOFrPmyBtDdtgQq3c=; b=2RB3Dvz2KLCkFc
	JVZwCQLUoMz57kwfvnhlHErBcUwdlAYyUN8YULHhIpbB/zSiUulKprlI6LYT9sVxRqqEMVuPfKqWX
	tZizxvl1u+omstNXukAOmhIbf0ZOFmGnuh/BNeDoLGQbmF+VgsrhirE/PmgjrSVKaBhg83W8JpTKN
	3op2URuUv7ZXyfEZnmENjxhRLbmDFH8ON82iVcXwWn7D3EESb8RftjMXAtVDhAM+nJegNpgpo/eYD
	CpQfUl1OME+yC0YVubQWmHZLjRTDhoY6CvxLH74KHmwx5pcdyHsniMd6J3ZETqUdsy8gYsDOA5bcZ
	JTl8UAYT63hcaMW/SZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxYID-0000000GRrv-2YUc;
	Sat, 13 Sep 2025 22:00:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxYIB-0000000GRrY-3nFx
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 22:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00AF360145;
	Sat, 13 Sep 2025 22:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E69C4CEEB;
	Sat, 13 Sep 2025 22:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757800822;
	bh=zZ1OUc3zM/Cg73rU6Gn5fHp1VQlbaJwqo8Lcfm2ews4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fyuZs716eTJ7WPS2GiS4TdLlvTBU5QH2yzss1KHabropYqAQ3mFpYndd3B7HsP1K8
	 DUHqzSxnUcS6JF7Q2E8xc4tUTV2tPVPVaMgpSxGV5fWl+0ZQuV5+jYVTYKs8pnyI0K
	 5WF2hDgQ0mnCS6OFHAqJnb0RUFiQmAnA+5j1mtzz5joiP0/HPeLFyeO5NbL5kZZsw7
	 elz9WmuogeE/UTKHpTHOk/WQz2o9X7hNvFi0LZpshjLdzpfwr6tVeNVFLICYdDZSnf
	 VBuiipeKzSFzh0wHNk/WlDvwvbiPb/tC9CAEKJDufyKhWKTWOwpAD9jUg+0cBii9RY
	 vR4ZI9RlvvJag==
MIME-Version: 1.0
In-Reply-To: <aLyHtxrU4mGFfnFs@x1>
References: <aLyHtxrU4mGFfnFs@x1>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.18
From: Stephen Boyd <sboyd@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Date: Sat, 13 Sep 2025 15:00:21 -0700
Message-ID: <175780082175.4354.18337386109597093831@lazor>
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
Cc: linux-kernel@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Drew Fustini (2025-09-06 12:12:55)
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v6.18
> 
> for you to fetch changes up to c567bc5fc68c4388c00e11fc65fd14fe86b52070:
> 
>   clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL (2025-08-18 14:58:23 -0700)
> 
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
