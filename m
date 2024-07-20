Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70383C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 16:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdY2qNghjKolnaGH6Mr7Bxfhxxvn5OfOZh7wc7Bc5Jk=; b=T1xLU+z99TVo5E
	yspu5ZEj2CPtwSBYv31KEchHzTQPJ6ehJcM49gpVJgtnnCR2RgUKxxtclEIYgY6rpQMCceW5oFMaR
	i4sbwhDaNq0YPbUzrznpB0URJFpeM5joZ87ue8Eai1vF97NUrFO9sYsf3Uojb3ZrDhriVejyChIfY
	Enr92XttXzw5Op4w8I4nM32vIlE4Jv1EjDph7CAM+Wq2CQizYwzskq0EkNMIVT4gni6Tn4gJB3f53
	ImKIu+T1gEUXaltRiRkrOmgjUfiyfQuAoOE9xKcSu9Q/TJaUAhtPxeuk751k0sHc9BCN4ilbvOnA4
	1ZmP2UmWsc9wRi79njJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVCyP-00000005NMf-0yh8;
	Sat, 20 Jul 2024 16:30:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVCyL-00000005NL4-3IlF
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 16:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7898D61152;
	Sat, 20 Jul 2024 16:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EB21C2BD10;
	Sat, 20 Jul 2024 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721493012;
	bh=LwG53DGu+NXuUTEEJa6wYuCfAAhA6hkxKYBg6Qe1wdA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bYnxXu4CUo9KZQocUJs6CgcOFctCstaATLczTSekTP/UQE0n3XH2JOj4ZIpDW9/lm
	 sHS7xORfvAcZgWGiCs1rlJs3UYtAZLgba+IsfQHFn3r/5GXigZIx1dN17rBOUfSvKO
	 jfOqKmn+0z4ARDFT6Zh19EQKiEa5Dc1E2bSZi7dDnHynyzqd0rhDfUlRlEaEIN1wKX
	 EgO4JQnt0Ij3Ab+GIhE0GLlGnRBYvfJ1yghiWqZs10wFYIIX+9ak+GtmYHHPT+mG7G
	 f9o5cyEj4PsUailyX2aGy6jVlc4mBzu43St+R+4srJ+iidUNCL81xaAVe5i3x+leky
	 O0O4nRkBVnc/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0670D63008;
	Sat, 20 Jul 2024 16:30:11 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.11 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-099fa737-a1fc-466d-bf27-9ad62173bb45@palmer-ri-x1c9>
References: <mhng-099fa737-a1fc-466d-bf27-9ad62173bb45@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-099fa737-a1fc-466d-bf27-9ad62173bb45@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-mw1
X-PR-Tracked-Commit-Id: 93b63f68d00a0483b450b446e2ea5386a1b94213
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f557af081de6b45a25e27d633b4d8d2dbc2f428e
Message-Id: <172149301196.6110.13606531128454287157.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jul 2024 16:30:11 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_093013_918029_57FE6503 
X-CRM114-Status: UNSURE (   2.83  )
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

The pull request you sent on Sat, 20 Jul 2024 06:35:08 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f557af081de6b45a25e27d633b4d8d2dbc2f428e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
