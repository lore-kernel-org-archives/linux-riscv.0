Return-Path: <SRS0=/HzI=OC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE8FC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Sep 2021 00:42:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A704760F6F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Sep 2021 00:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A704760F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EqZRJ2DiXQ+1oK+FqRtYVG37DEqg+paugUk0Y18efc=; b=oE+bu73LwUuzbe
	lsRvRJdB/r6r8og+zHdH9Ud+FSp2cGdqMgbu7XTg9i7EYLhwxFpoZYpYrSUIAPF7ux4DLMHv7+7eu
	MgF0y4Io7BZHXXAYWwazGm/mEd4FJkQgsggsUPUZNy87LJmldRV1LSCWytAZQfYieE9iQEcu0ztFa
	TdvvnTPAqvWyjBH4api7MG1HHVvU4ab0Td+4Hl+TTGQKa16qhVMwGf8RxjnYSWtnOY9ArHUtswF+x
	octDZfMkh1LS/5uM1989mnTk10A1KveW9oQ/uy75sOHOyb/Atp2suEmY+bJNvXv842L2fFstGge1H
	Mvy1bsqVQtn8v6tP9OmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPDZW-00FdRv-V9; Sun, 12 Sep 2021 00:42:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPDZU-00FdRX-0L
 for linux-riscv@lists.infradead.org; Sun, 12 Sep 2021 00:42:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 0757C611C0;
 Sun, 12 Sep 2021 00:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631407331;
 bh=GYdlDYOD6WSKtAsowWnoOCTQHnkwdaUHqgJbDkDX6/I=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=R/KUgGcdkksStVuXXC/V9sK7p302yZy7psl04VzVAakYN+aEvIj90XFf4/RYigQq9
 kZjMYN2bhvW/YEFPdHir0gr5YwV2TUuadoAZh40iokqTCvVKkMe8S6WGVR8u0J8vpF
 SsLK/rhLZrYW8lOP1SERzHNP94pnqNEtJxSWXj4vShYmsrfUBy14a6mmeAVdr7q6NG
 AZCtV6bBqR6xUM4g4hPc6WSj1kJ/iyPIkf9GGKOomKIxYy20FpPpM2rw7Yd+eRBZfE
 vu8ZalY0aQTXe9ceCAE+lJvpiY6LvDNaH6byl8SxV1hxH4HpSQtPjjlBRp1eETvSMI
 iqVcjRaR49LSg==
Subject: Re: [GIT PULL] RISC-V Patches for the 5.15 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-b2b622b6-e788-4923-8cf2-ada90a2a095f@palmerdabbelt-glaptop>
References: <mhng-b2b622b6-e788-4923-8cf2-ada90a2a095f@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-b2b622b6-e788-4923-8cf2-ada90a2a095f@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.15-mw1
X-PR-Tracked-Commit-Id: 6f55ab36bef505b449723300a5a445ddc76a94d7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b79bd0d5102b4a3ea908018fda6b84a4c8fd6235
Message-Id: <163140733099.30830.91602493286682383.pr-tracker-bot@kernel.org>
Date: Sun, 12 Sep 2021 00:42:10 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_174212_103258_220BB16F 
X-CRM114-Status: UNSURE (   2.94  )
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

The pull request you sent on Sat, 11 Sep 2021 10:43:47 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.15-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b79bd0d5102b4a3ea908018fda6b84a4c8fd6235

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
