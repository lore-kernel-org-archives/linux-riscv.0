Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A012C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 03:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5iwP608/nyudNrtgoydjb+Q6pQnlCj9qrGJT5EK430=; b=3ijVP6GYcPzGzx
	3KGGRWHFBX/jV9YRpuQOpJHDqt8mNPyyZO3UK0LTq9enVfkwPlEcdmzoVOaizzkqD21MhbzqeD5Ib
	tnx+6vFg3TGsCC5rqJjeoUYskrw42Ru0BxagfNnXBmQ3wFRqMiNqsjsbuBSzaproLKN2Uqdc/jYD+
	ylBnxv4oHQyDz6hKBmDAcZERXy+sKAufBzXsRHJ/DhAzeqnhe/MqHBMZC0ZhkFL/WzzzpavBpe0S9
	jpZsOTTI5B1VHCwATxNoX2cL6O9XKZYb0bBfUi8PDc0ioISWe5p3WytVLfPrdiewSj+idL4blS9wj
	n75wT1eD/JZBKRFPYP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTu1L-00000004WNH-0EAJ;
	Tue, 24 Jun 2025 03:08:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrr5-00000004KWL-3sVN
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 00:49:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D9E9629CA;
	Tue, 24 Jun 2025 00:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDE5C4CEF2;
	Tue, 24 Jun 2025 00:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750726183;
	bh=RKieSCMnnxr7Bp9MnznRAfCwf58nBx31lL4xjTswCxM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S+iQYPtWM51notqk7uZ/u1i1LoXV32gP27oIzHnOpl6/R2ljV/Kb17OiJGmWPb0Fq
	 u0I2pr257XTSdklQwM7BI8tJ1I/VHmP1TVXXw1y9i/TWMS0ZkHJPW/DqHzWL1t7IU7
	 1P8Hd4twovsBP0NIpmy7iEkxVEZFh7u71FySHTaVUmWUx7nNjZHpEVZxij5pINAEFI
	 IeuodNdzIKTX2+wCl4zj8jfvCtV6XOWqIHFTqSVuIASPyyS4xiyES9YuEGm4oGg2np
	 qPtLH9N2PCFfSirpL97OxYssI3n2XKPa0eTSoIpHdUrzaj22Np4sR30LfcjbgUbuOV
	 fm1B3xuDOCPdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E0839FEB7D;
	Tue, 24 Jun 2025 00:50:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175072621024.3349808.1646542677101843866.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:50:10 +0000
References: <20250619155858.1249789-1-namcao@linutronix.de>
In-Reply-To: <20250619155858.1249789-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, rtm@csail.mit.edu, stable@vger.kernel.org
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Thu, 19 Jun 2025 17:58:58 +0200 you wrote:
> This reverts commit ad5643cf2f69 ("riscv: Define TASK_SIZE_MAX for
> __access_ok()").
> 
> This commit changes TASK_SIZE_MAX to be LONG_MAX to optimize access_ok(),
> because the previous TASK_SIZE_MAX (default to TASK_SIZE) requires some
> computation.
> 
> [...]

Here is the summary with links:
  - Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
    https://git.kernel.org/riscv/c/890ba5be6335

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
