Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61D5CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TzRNGsvzHcx4K0dlFng4SQT248y0WhZjsJWSjBAJ3A=; b=sJw3WChWZmddAv
	99QugQVBD4IkSutB+ScIhJcPV6xWGZ/KYXTLmOaIYAVBJ1RU9+N8s6UJadkmPqAMjYFqg5LR6Zpqw
	pE9yvJia4HDRXg0xxQ/BP50ZVaFr+tJr+7LdKrKOGN+YtxsFSxKl2v2NHNRULeXxrhywcVt6Rz69+
	vl0kDS4mJRsq7JT8YbnYqZGR2FxRxKKLpwbP3N/cCgLRMVbC1agGJsaRwClc+5ZBVwwxuahmNrwDY
	1xXsUzFLbyCypu5yJhH9oLrxoIHahRC6nDF0iAQzUtl25NmVMCLB9Luo2xXW05g4ydPXDnsIc/dBK
	QS+YTMQ/cy6SJYhl2qWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYV9-00000007LM3-0PlO;
	Wed, 10 Apr 2024 14:00:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYV5-00000007LJt-2D7x
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5177761D92;
	Wed, 10 Apr 2024 14:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0682C433C7;
	Wed, 10 Apr 2024 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712757630;
	bh=Ja6AZniRSqEA6oBU1zr4PBdhcx8DSrD4UWpOIIKlY4o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B8a7kQ77dT7VsPRjXN8owihdda6AzTWc8w+PYqwj0i1FSbZi1V+vvACaoUTn3lhgI
	 AWa+9VpZosKE+Wo2jGRVolWEXxdqs97ET23jWYIEaq41arE2j+eh2LrVwBgRt+TJm2
	 AQpbbb4XaLwOFeJepGK6vpMdhhNa82+yydX6VE1zK3WntU3L6u312M5EaXkoS1CTZ5
	 6yDZPpOA6rauqck3QhVMEtvkKidQ9PWk6yZLiI+uMjpqQDP9rWhfLrroq6RVLJwd/f
	 UMIDbdJvCkTzHMXmNY6/G4kSMa0aA1ySwHlTSkIfdLHdNP+EYcS/0CJgKZcmbDrONm
	 C6JZbnipGYLwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DE715D60310;
	Wed, 10 Apr 2024 14:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] riscv: 64-bit NOMMU fixes and enhancements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275762990.4679.14858564193959592140.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:00:29 +0000
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
In-Reply-To: <20240227003630.3634533-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_070031_762863_8A617C6B 
X-CRM114-Status: UNSURE (   9.37  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 26 Feb 2024 16:34:45 -0800 you wrote:
> This series aims to improve support for NOMMU, specifically by making it
> easier to test NOMMU kernels in QEMU and on various widely-available
> hardware (errata permitting). After all, everything supports Svbare...
> 
> After applying this series, a NOMMU kernel based on defconfig (changing
> only the three options below*) boots to userspace on QEMU when passed as
> -kernel.
> 
> [...]

Here is the summary with links:
  - [1/4] riscv: Fix TASK_SIZE on 64-bit NOMMU
    https://git.kernel.org/riscv/c/6065e736f82c
  - [2/4] riscv: Fix loading 64-bit NOMMU kernels past the start of RAM
    https://git.kernel.org/riscv/c/aea702dde7e9
  - [3/4] riscv: Remove MMU dependency from Zbb and Zicboz
    (no matching commit)
  - [4/4] riscv: Allow NOMMU kernels to run in S-mode
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
