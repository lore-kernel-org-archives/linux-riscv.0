Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CD9C47DDB
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYXAQ8RQ+nLDqi0ONmq5Li9dBfnm4S5pdnqlxNeNDl4=; b=OJk5/W/rVQsKAs
	AvLPYDHv9MVdt7BisNxs0i9RyzL4aLhrQ4lVTufi6dZGWJ1n4z5D7h8C5YbIjwIWpvlGk6cTyuqtL
	2JaTjVaNoT+DzQFd8OoVwgDPU4GtijexGonHo+6uSdgwkZdysrKJyi/Fk9YOVkWA4fjY4uxw2v/lj
	jSkOWb0DyzV3er23J+gHPbX6ism0NhAx5dPBaS+umV/uHSBcwk7/IxS6Vwf6D3yvLc0M5H8yYS9kj
	P2FtWUwU7P37rkyW8BmZeqgaLa/4/eTIUbNjk96FepzCT0GM0JEcIi+lRwDyfScA/QzI67vbO9Wt6
	3WQLzzUi73GQo12yFERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbN-008OMy-36;
	Sat, 20 Jan 2024 21:10:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbH-008OEP-10;
	Sat, 20 Jan 2024 21:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DE988B80943;
	Sat, 20 Jan 2024 21:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF1CC433F1;
	Sat, 20 Jan 2024 21:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784997;
	bh=fjX1QcNSUSDtg3zN9eJIvh1kheAnttohq2CojBDtXqM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f5fgAd8lGmVqY/67XbUSO4Qk0dRCUMvtUJD6k/fd5iG2uct6gv2xMQ3OHM1WYZ8U2
	 ngc78M3hIIoMXED9Rhlsx50MT1WXbiTtNG6ah5EKBwBMud8j+kcgE1H0x+0FnmqSGT
	 BBTDD9MuDisjsB7prVtq2FzT7FYcqsURHqxqgW0uE6WwNcJg/7ykZhWW1w3xibUlyP
	 wX703TQTb8qu6a0/EiiGati/ykJT0BM8pyB94IT1As1Rm6DeIeWHsSDdmfkdUHpJ+M
	 Y4G5OILFVDaAC74ogXv0ePOSln8yYvcsMgVHnWJJUfV+xzzSdGzo674sw/Es00ID6Y
	 cufuVhFU3QLqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7D333D8C970;
	Sat, 20 Jan 2024 21:09:57 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] kexec_file: Load kernel at top of system RAM if required
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499750.24348.2518240009884006018.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:57 +0000
References: <20231114091658.228030-1-bhe@redhat.com>
In-Reply-To: <20231114091658.228030-1-bhe@redhat.com>
To: Baoquan He <bhe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kexec@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 akpm@linux-foundation.org, ebiederm@xmission.com, takahiro.akashi@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130959_501174_D6E1A8FE 
X-CRM114-Status: UNSURE (   8.58  )
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
by Andrew Morton <akpm@linux-foundation.org>:

On Tue, 14 Nov 2023 17:16:56 +0800 you wrote:
> Justification:
> ==============
> Kexec_load interface has been doing top down searching and loading
> kernel/initrd/purgtory etc to prepare for kexec reboot. In that way,
> the benefits are that it avoids to consume and fragment limited low
> memory which satisfy DMA buffer allocation and big chunk of continuous
> memory during system init; and avoids to stir with BIOS/FW reserved
> or occupied areas, or corner case handling/work around/quirk occupied
> areas when doing system init. By the way, the top-down searching and
> loading of kexec-ed kernel is done in user space utility code.
> 
> [...]

Here is the summary with links:
  - [1/2] resource: add walk_system_ram_res_rev()
    (no matching commit)
  - [2/2] kexec_file: Load kernel at top of system RAM if required
    https://git.kernel.org/riscv/c/b3ba234171cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
