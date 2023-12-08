Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796ACC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZ6mNrgpogoxu55aRhdFJDHSnYJ7/RNnY4cxWCZfyR4=; b=IpsG3dflKITtYK
	bdtL6mUklwbYKBLddj4UCnARge8SR67sp4HpGlFcCoMhRTs/E1vGdrV648IRr1tdMjRoXrMNkuyfF
	3XL0rsHnCeH9QG3BCsAmZKwcmfx37qs8jVzP2Oddk8MJJZdaw57O70Se1kCxVsCrcK5xZzsaZqnJa
	t5MCw6Q4s8yfwScw1MoyzE0n9jmyyTlo99BS3Q5Y2Iww2Gw6Frqf2ZGMr8V6xMf4pETqK9TjN5h9R
	BFOKHHxvqtD3AZC8rGanKdc7cNyH9lEiuxAPd/DHfoj+0XP2iZIZUVDam9V+Ae/yFr/zHIGEktxov
	KJqDFvfhNYJP8kk1biJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdQs-00FzG6-0A;
	Fri, 08 Dec 2023 16:10:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdQp-00FzFc-1M
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 16:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 97B8CB82E04;
	Fri,  8 Dec 2023 16:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECE54C433C9;
	Fri,  8 Dec 2023 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702051825;
	bh=k70d+rmqL6gSsL1IMke2eW576j5AfLrvXYwaW5nHJuA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DY4bWioroVoTMN18u2Csl0cPvH8wi65U946SLuE4Al6smWJECVUbeykfm80OqAi3n
	 CQl+Te9Qe5U3rDd+JptrcvhzL4Ne0H5jkbvx0VhDU6/I7ewVFnFt+TRdZRmA24RPVe
	 pv6csMpO8NV9VA+Q5DoOCKe2vfDpJpnAettap1yu+RnW8uB0lkACRfSUiCJg6RYv6x
	 5Wj7gtQbU3JnUfS+6DEDHWZ/NSv4ktbDdPkB+mhscjgF56yq1U+RzZdPcFdujlGiR9
	 YrmDvlZpVBpxOjBAdlBBfuMSUQ/Us/RjeTvnvLSCCVSsPOElA2dQHVVh11wdLy/zDD
	 6o963YhQuGHSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D38EFDD4F1E;
	Fri,  8 Dec 2023 16:10:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Check if the code to patch lies in the exit
 section
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170205182486.7426.12012524229624787875.git-patchwork-notify@kernel.org>
Date: Fri, 08 Dec 2023 16:10:24 +0000
References: <20231206165458.40610-1-alexghiti@rivosinc.com>
In-Reply-To: <20231206165458.40610-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, zong.li@sifive.com,
 linux-kernel@vger.kernel.org,
 syzbot+2c2a76232878c44e0eae@syzkaller.appspotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_081027_630323_214C22B5 
X-CRM114-Status: UNSURE (   7.38  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed,  6 Dec 2023 17:54:58 +0100 you wrote:
> Otherwise we fall through to vmalloc_to_page() which panics since the
> address does not lie in the vmalloc region.
> 
> Fixes: 043cb41a85de ("riscv: introduce interfaces to patch kernel code")
> Reported-by: syzbot+2c2a76232878c44e0eae@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/000000000000ce4a27060b39ed34@google.com/T/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Check if the code to patch lies in the exit section
    https://git.kernel.org/riscv/c/eb46a0076501

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
