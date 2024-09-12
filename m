Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E168EEE25B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 20:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJmAzL1qwi0sir0m8r1r5Fw/nkLnM4vqF0TTr43Xs9s=; b=AIJ50F//y1jgy4
	6n5gKu/S5Kd4BA7PfCP5vuiV6mWi5OSDVsh/trj+Fs9q5UlfqQuqwWTU/YzFI6jVaedT5sQIogMmx
	/PpcTlpghSwaceCYiB0z5kzltyZy3klPj35u1lLxQ5NNfSYoTzPi0hroNh1JrkzhwZC7aUXErxnqa
	oVECo28GPrzcY76aJiX3mCCDFM8U7iQoDPTOmHimyRiGP972gfbUOG/7RdWrBG0NVgykjK3+JvTiN
	O8vky8KXzj8iKqqXVqVkXR67B3hBkaorG6vqlrlJogKH//Gi3dlfTyW/fLLq2qEMPjZpALGJB9L/2
	uKwB9X0KDtYRFL8Vpdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqDh-0000000E9ef-0OTC;
	Thu, 12 Sep 2024 20:15:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqDe-0000000E9e1-0kRL
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 20:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D5C4A45452;
	Thu, 12 Sep 2024 20:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DE3C4CEC3;
	Thu, 12 Sep 2024 20:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726172108;
	bh=BY/nMIl8gVt2eO0JCfBQjP8aUlLdXOO4DYz+gvc/Pzs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Hnxq/xTUKQfDt+rRz6hrI3CQVtb5lkBFo2sEQ/+B5LTz+bfDV/4OI/VmfDDjkVGEb
	 8Y+fFdj9rVP2X/e3HCDtLiik2aYWZhB/oOY2SuSZGt0ZooR63m+pC7uGWRXAUwZp3H
	 0/wuk9+S0mkt00AFlVyTB/ypL6IMrKhILK+vODxk5U5d4psW5/Jh6vJ4LaO5dUjJmL
	 CEDnixc4Xh265SX7FzV7A8oj5ztLuiNeMV3v2c+88rEJAA+bfcadvQ2hvjBmjF+wXv
	 IKa8hcL2GsN7G21SisSrLxl4tearpQvNo8im73YuIITV32Fv4C6AOk7/izs0nAeEbY
	 kGWVc/oI/BVbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1583822D1B;
	Thu, 12 Sep 2024 20:15:10 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.11-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-61f22aea-eea4-4ed5-a803-92fa9df853cd@palmer-ri-x1c9>
References: <mhng-61f22aea-eea4-4ed5-a803-92fa9df853cd@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-61f22aea-eea4-4ed5-a803-92fa9df853cd@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc8
X-PR-Tracked-Commit-Id: 7c1e5b9690b0e14acead4ff98d8a6c40f2dff54b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8581ae1ea0d203a71851b21455c2d5167ba00e50
Message-Id: <172617210959.1705632.12738653586746207738.pr-tracker-bot@kernel.org>
Date: Thu, 12 Sep 2024 20:15:09 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_131510_297933_C33B1F38 
X-CRM114-Status: UNSURE (   3.53  )
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

The pull request you sent on Thu, 12 Sep 2024 09:25:44 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8581ae1ea0d203a71851b21455c2d5167ba00e50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
