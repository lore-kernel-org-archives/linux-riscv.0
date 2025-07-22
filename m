Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A66C83F25
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 00:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JV3tIsQuClz+xEQTQM5Huua+fvwVgKhs4GpYXyO7CZc=; b=VavXH0QQR1yzhf
	MN31tINAqiZjMGyscDaYp98OBYfmMm/eseXIwTXJxze3rjAuf9Od2Wx2m3Yh3mZMDA8teLCnBL+eA
	RROVZVVAO4+3dKHNlKIjZbnQ3n27dGHY9ftJowS2CMlBnFyClTes6fnyeY9fB2VpxQ1qVfskcR0LH
	7RtjtbYdCbQfusvPB9bX0VlSwNEbLNnHpFemxsZR5zFMzj89JxOFB07pIXWnGyn3fSuZlF0XXNd8W
	gfKIi/IaEb8HOV1TfG4roNZ4DtZ7hQDG/QJNfRXIRwd9MRyU4wpXqWIaIRRBZwVUl80t3K5t3eR+A
	JZuxxfdXqFa4zmDgTBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue0sF-00000000x8I-1X6i;
	Tue, 22 Jul 2025 00:28:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue0sD-00000000x7z-2iup
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 00:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 635A0435A3;
	Tue, 22 Jul 2025 00:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD274C4CEF5;
	Tue, 22 Jul 2025 00:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753144127;
	bh=lkj2iz50e05gBdLMWwNIikXAisnhw8Y2ADazq8uUrJk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kEv/04ix+WN83EBGQ2ITPE7dRRqyn2TYr0hPFBeC1uwEEbUPIioGTnHk+ZPypCgTR
	 ndhYPeDwg1XyOtwSM85mEoXm63qiQNSQrTwlukrFvF7uD2IPucXTSb8eocJOBHw04r
	 s2QbWCygpfMvGuhOZN5t5jwSO1ZQ4mQc4e8Da6cwktHK6AP91guOOthb8fZnBLV4Wv
	 QDmANOZpvpwipchlDrekCi62O1zIPzNcmMFzrh8znGhbcKBHCzakM/pyBM1oHuQAmw
	 t0mRBLhqF5RjOa3FiQIE5HjgDv3fi98lrmfFkTdECD3GjDwFxvZxrvXuVUiOq2FjhK
	 9FKAX0T72D4NQ==
MIME-Version: 1.0
In-Reply-To: <aHt0ojYyO1OEZTmG@x1>
References: <aHt0ojYyO1OEZTmG@x1>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Date: Mon, 21 Jul 2025 17:28:38 -0700
Message-ID: <175314411891.3513.15061789735684884470@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_172849_725061_C44D4E9F 
X-CRM114-Status: UNSURE (   5.54  )
X-CRM114-Notice: Please train this message.
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

Quoting Drew Fustini (2025-07-19 03:34:10)
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v6.17
> 
> for you to fetch changes up to d274c77ffa202b70ad01d579f33b73b4de123375:
> 
>   clk: thead: th1520-ap: Correctly refer the parent of osc_12m (2025-07-13 12:46:58 -0700)
> 
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
