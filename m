Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23BAC4829C
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/6nogd09YVOseN4s2StoC3sctvVMFh/6dV/xSG7jg4=; b=ISrpUqp0Ta1ulf
	Oo27Z7gGhTfoKZdHIrR64KZTH1M2Kn8PIUPqypmhjea9PjOVRnuFiil+48INgCS6qw2F7vQvHGz/i
	DbIOvISB4lKrPy9kwANBK5QcoPY/zno71FCImLTVxV3BaCipiwmVuFjj7XPZZVKptMYoTsTmar2J7
	R/BvPOez/Le1+gRHOJVKBxcVQaJm8/4A5a9iusrwEMRZ0gpN/VRiPRDOOQluM2MMh7wbXec1JI8Wg
	bGL+4gHvA/iPd2U2UZWfHSdSeHctJqH7I6ccGQw+YeWv6V4Fu58U9XE81QfIGu67POh5Gc9MbPg87
	r6dT9OusQSPyN+P8WVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxqB-0000000CnCp-3Xi7;
	Thu, 08 Feb 2024 06:24:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxq8-0000000CnBZ-3Mpj
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 06:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A7C15CE1B9F;
	Thu,  8 Feb 2024 06:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBE69C43601;
	Thu,  8 Feb 2024 06:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707373489;
	bh=owPdNZi9h+GBmuCz+AP0KT9ohuNaRk86URWvrTvmHXU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PSK2dkqIozJn/HI4qLLobf8dl8+kO29+/WK5nltdqoKE++Bx9eCMr2HOhQpd9CSus
	 Y6VUnc6X1KeReulNgqklJF6d4OrNf+atsG6WIJGtGMBsiyYxR7CUFRhXuEVms6LncA
	 JeyVNr4PMKOqnjn7ilxUsQ+5CMFfx5u4dd3a2KvU1Tpsc95IAtV6D05DThepu3Z8n3
	 eGo4ota0f7tkxlsiaYQTV0tc9KGlyG9kAQqWHwaSxPrUbPUCHiPHLKu04WfEifunZO
	 6BawLRFHxmygPPod1D3O4gk2ndNZI/PYZMhxFSUtCegtmvK1+94OwIzrtDBWXviicr
	 pbvY5NU0UWGrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8B7CE2F2F0;
	Thu,  8 Feb 2024 06:24:49 +0000 (UTC)
Subject: Re: [GIT PULL] percpu changes for v6.8-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZcQtvkrWhIkRVfS9@snowbird>
References: <ZcQtvkrWhIkRVfS9@snowbird>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <ZcQtvkrWhIkRVfS9@snowbird>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git tags/percpu-for-6.8-rc4
X-PR-Tracked-Commit-Id: ebd4acc0cbeae9efea15993b11b05bd32942f3f0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 860d7dcb20105af1fc7228a162886c421296cd86
Message-Id: <170737348981.17177.16622837033304946277.pr-tracker-bot@kernel.org>
Date: Thu, 08 Feb 2024 06:24:49 +0000
To: Dennis Zhou <dennis@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_222453_041006_DA7C6B9E 
X-CRM114-Status: UNSURE (   2.87  )
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

The pull request you sent on Wed, 7 Feb 2024 17:26:22 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git tags/percpu-for-6.8-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/860d7dcb20105af1fc7228a162886c421296cd86

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
