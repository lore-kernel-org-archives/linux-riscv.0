Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9560DC35FFF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBN2B1XpAgb+Hs2Csb+xwh7pcrDoTQjDTIKgDDzcrUo=; b=uUEkeN/sf8yt19
	fMUySGDIt47tQS9NxbRd4L1lmcdV+/p7kQlED3Cuw94NuFZal76AAaUuejEtQvYGp3km02SHR4dlN
	A/aeL4C+f623fJCQuY1S9J17+PGFbuahPzrOZs4S6M6nh4JdlLtXwgJsxb60iIXVeQvjP/Njpsyti
	w/yFLOJakl9apUeja2xbz9sYHDDzMEkNGuiJXe4Osg/Ob+HlylIs2X+5XhZd5p7BazuPb7QbBK2/b
	7wDZWigjdpAM8D4pAN0JtwzEl1FAiDmfs89Yl8Pw69MGx02JVhnErZ0IPQum7nOkEOWWbSFTdcoaV
	SG/DcOC9FXIe6ErzOBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXpD-00000006B4y-2YTU;
	Tue, 17 Sep 2024 13:00:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp7-00000006AzP-3oOQ
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2B0D0A41493;
	Tue, 17 Sep 2024 13:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84666C4CECD;
	Tue, 17 Sep 2024 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726578052;
	bh=vXbeplZ1G+0wcjdO+vuH1yzCOpOfz/gAnMMvX2K1kVI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jDBXtYUKDn6g8wSi+jxcozb/3cjhSUlghGet4AO8qeQauW/h73U58CHDG+TJma6Aw
	 0PJetWr09JZhIuWAKsOtn8sHNOJ8rhbAp2sQfzJ+uqX1GFMZ0Z8pj8sW6GAffns1MB
	 AQ4JG+ra6oFPzR+HpSDXSyoQMYwKd2ItzJVm333Eafx2Bzpvd4Ght88aoByYogqoES
	 dctkPDU1ZWpFeUNRVbXYpt8CeUHhHl0usRnTfJAEoxelX+ahJRlAvUrfnCu5XNkOcs
	 DsfbTbWhlWZ4BEK2zc6H+0Xlzjp156F6n5A5xgzqLg01T2UxTCbs6vCisAakigUeCF
	 bPsH/x/V/X7Wg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D2A3809A80;
	Tue, 17 Sep 2024 13:00:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: avoid Imbalance in RAS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172657805400.126252.7167871737849732377.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 13:00:54 +0000
References: <20240720170659.1522-1-jszhang@kernel.org>
In-Reply-To: <20240720170659.1522-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 cyrilbur@tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060054_122577_A2DCC29F 
X-CRM114-Status: UNSURE (   7.95  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 21 Jul 2024 01:06:59 +0800 you wrote:
> Inspired by[1], modify the code to remove the code of modifying ra to
> avoid imbalance RAS (return address stack) which may lead to incorret
> predictions on return.
> 
> Link: https://lore.kernel.org/linux-riscv/20240607061335.2197383-1-cyrilbur@tenstorrent.com/ [1]
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Cyril Bur <cyrilbur@tenstorrent.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: avoid Imbalance in RAS
    https://git.kernel.org/riscv/c/8f1534e74403

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
