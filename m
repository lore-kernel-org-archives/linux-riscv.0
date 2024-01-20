Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5447AC47DAF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 19:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytMMjwFebw4TaPnHa0Sa0mC7kY/76kW6u687FzLN+tU=; b=LiE0OrnPEUxAdO
	vRh7se2Yc5js763rSOgRkx6INYWaYAzsO7Fn1jCj2YkiL1CRMU0zlCmw07K/8pXC66ci/cvhIOu6D
	OIzay68kUOe7CoFGXBDhL14hU1TCtEijbTQCMVtYHwCLFdBYdi8S1HMwpB8BuJslhKhpD/98vacYH
	fpFms6VWPYA/7rhN04OYqbYu/QKfuehRgGaALe0zPn9yXISGpO1jrdkQo2oesWh6bm8lbxwrYnn7i
	HbnCrx0KqTBYchugbXl6mRXcffJN6579rwuXp7C0ic6apY0ZARSM6O8ICpWZEBx5hdp29VzplSilR
	8oRkC7sHwckzBVuBA2tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRHF7-008J6R-2l;
	Sat, 20 Jan 2024 19:43:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRHF5-008J5f-2m
	for linux-riscv@bombadil.infradead.org;
	Sat, 20 Jan 2024 19:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Date:Message-Id:References:
	In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OGT6ttFfmWBnyXd8gT1Ozpnw15H1Y8R5XGEVVnSHeYA=; b=jhOmCy+2DcBwjh3t9DVUUfPFAP
	spUmSmJfk9JNR3jhgM27H0dfmo3MJ9TaxJs/HICIFFDxYAeTTWxd3BaPrdRQbXH+IAkFkcu+E1oa5
	QcY3y7LIDiarGh4wFpMjhWZ0V1MRBJg1DWobVrzeTChnksk2rE3dBQ6YOzuMecaK4rBoGVM8j/Wmo
	pv89A6tgTjzD2iL1mNa0OA0xCe+3VWIgj3TTWmvE7eMadIn8tIN2vM1soNXFYnEd42gDIdQDqLyZx
	TKlyc9++Id0cAVekllt0VSLT93IlYOa1kUzmGWY2aByGAyzwXSrmg4ZtKGqr3L/qR9Skx/i1QsDsl
	iWOY38fA==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRHF2-00000002GWQ-1Cve
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 19:42:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 10EFEB803F7;
	Sat, 20 Jan 2024 19:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3CE3C433C7;
	Sat, 20 Jan 2024 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705779763;
	bh=2mxFYdmBSkm/9gBvn8lI4Ab/gdegAATDGXuHWlqWSFU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PK7YCndEEcTqo/onV8ZnLaH00M+ruFpVwFZp/GpHcmJmhKOXca7w1u04iCv6wILTe
	 IQgcmdPFOOY1+c0ztAhS+Rm07JoUrYEmsqozwUKI+WEh3qc697LC45rxvBejUrrqoD
	 V77ttEI8YSos/LyOyW/fpLNxdp6xl/0U5c95K8s5H2L+f87KcSYyUkp1dazwGzQ1+P
	 dzU3bB8naUQ2VI1QtjI6RpucAa/7ogrquQSXEtCMDLwWLRw1cm3afeayIdB0n0LVm8
	 yheGL+63Fx8tknv1wdHTUwjLe9n0/Z9RJlVuwEVVU03TXshorx5G1uB/SIPE1xEv6r
	 QuB/zrFD5foxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AB80AD8C978;
	Sat, 20 Jan 2024 19:42:43 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.8 Merge Window, Part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-878cc879-7aa0-473f-91e4-8288072cdd4e@palmer-ri-x1c9>
References: <mhng-878cc879-7aa0-473f-91e4-8288072cdd4e@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-878cc879-7aa0-473f-91e4-8288072cdd4e@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-mw4
X-PR-Tracked-Commit-Id: f24a70106dc1ad2a755b2d42f47cf1dcf24f0b27
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e5075d8ec5647322fb9e699bfb76331cc8ee098d
Message-Id: <170577976369.29448.6106762647083098483.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jan 2024 19:42:43 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_194256_483597_DCB9E177 
X-CRM114-Status: UNSURE (   3.03  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 20 Jan 2024 10:17:18 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-mw4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e5075d8ec5647322fb9e699bfb76331cc8ee098d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
