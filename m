Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E236EC6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrkbU240+akHkRUwriMuDbdeQqB3Bskfg8EJLVf01js=; b=a60C1x15RS/2vH
	yoIHznUMPycHjtDjXA/31AvLTwYoBYQ7U2xWd3qcg/l4CO7z9nq66nfO/KqGHOahjYkOpZzoAOdt9
	V6NFAvZtxrArbe1Sed5SVXq8v5FmW6m2EqqZwMO+aQKfR3q6nx5PQu5bAAqcWz8CnZcglQgaeSS71
	t8HHn8if6tIjSIRzRL9YML6KQ5p8q+Xvv6NoGttRy0Dd27tqrMrSYfpxWz4/cD3CirsrU3EJ1v7Ak
	AFBBpiq0Akn+HCwe9rJE4e7HqmjG3xDlIkuTPrHm60gMFPE3FIEmrL+b8QjJwfhLmZ3LMAQJN5Ene
	qaJz6d9oCy8bcGM0ay1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7r-00DXfX-2R;
	Wed, 30 Aug 2023 13:20:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7e-00DXWH-0J
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D876B62094;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C087DC433B7;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=jyXLnnkKGtU6HGmUDvmShKZCmlIr+YiiY/SO+Sj/GkQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F32oMYF7Po0Au1jKdGvNtv8ROFh7kL9uPK3LKeNtXffQik+RqQpbnWC9rrp4htNwK
	 ptPlvrwUFUEdJR74NHL537Q/2yGJBYhcGnQ63f/VNSLIyVM29sWEXS8nCaJ3Or6bpm
	 5s0dS4VwNJMDRpKppjYE8qf77BQdX+V4jo5glKH+Qhmq6b9Y0fnlgUTYVs/PATXS/5
	 P4f6LwKoUkp7P4N4n48jfhOxsDLXT8DZDQNUkPiQn4bcFk34sRhtSkCufZ18hOo3zI
	 Lqf7ZbB3N4GQoWlWcUagrZMMBBQASnjbsDbNUTlldqVbVBuqeJx8p0UKUgGrBX4tSd
	 4jD3ZeJmTvmew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A76EBE26D49;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] riscv: Mark KASAN tmp* page tables variables as static
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163468.19859.6513000378615706534.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230704074357.233982-1-alexghiti@rivosinc.com>
In-Reply-To: <20230704074357.233982-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, ryabinin.a.a@gmail.com,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, bjorn@rivosinc.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062038_201697_BC30276C 
X-CRM114-Status: UNSURE (   8.05  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  4 Jul 2023 09:43:56 +0200 you wrote:
> tmp_pg_dir, tmp_p4d and tmp_pud are only used in kasan_init.c so they
> should be declared as static.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306282202.bODptiGE-lkp@intel.com/
> Fixes: 96f9d4daf745 ("riscv: Rework kasan population functions")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: Mark KASAN tmp* page tables variables as static
    https://git.kernel.org/riscv/c/56e1803d9de0
  - [2/2] riscv: Move create_tmp_mapping() to init sections
    https://git.kernel.org/riscv/c/d616fce3f100

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
