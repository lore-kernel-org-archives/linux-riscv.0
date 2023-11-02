Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051CFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LoOZwScOI1c/eNsC3jurjXdUViPcKVuGB5HwGH00K/I=; b=UgC6uOYVb9+DEt
	XfOjp9MpBWnwJmPClG1G6lLNVCeNq/f66QZ8v6leamJZshHIXRbLlbEmTcFARwFsIyyQ4+cDzAWeG
	DRK6wsUWHdE7by3gcfQXzuXlDIUPPGwrkP/QNCiah2PvUb2wJZvqYxI4M7pjGbxg0ocb6lAJNbcn+
	x4ohzo4DlNU4wwgibMlOkkXiJV2/oSmQKLdMNEKj4AUImOOuC5u+xr6Sxg+d5Pm2iyDCR9WbUvdn0
	6NCvFj8s08m1WJFHdLh6M5oqyQhNDEwlClXHadHGl2zLzL5RE54F1XuHyF1Ay0ulROXyQkyCDaWZo
	eUMto7fQqRWlgK90eDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeBA-00AEIu-2k;
	Thu, 02 Nov 2023 20:20:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyeB7-00AEHG-0G
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 20:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93157614C2;
	Thu,  2 Nov 2023 20:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B03A8C433CD;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698956430;
	bh=LJ143qQumSwJ+frQ2lgaKZNiAUVef0ohgDMpkllbi6c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sop1YtMvm+UqaKpq81oh8SDoseVahc+Y5vvsVVe+fQcl0QiuMLCeJj5mrAcC3YJ1i
	 UsP6zD+a/6Or5rMI5kWTseDv7lmP91npEuoFZoHyWxNgbujJ7F7oDMJWrSkaUj599d
	 7C9W1uANcMrrRcsdAkHAjXdDOBPSu/hHIr6TSfkMOK0zPq1KtuAHQmeq2/ZpsIxU6g
	 +EGzHUpSoDhiAyC3UN7NIMQkHqFmMHUPejrCUVUXOUjvBVQC7C/3Yyfr2+iyIPUft5
	 dRM24b8yDOuzYR7ayMWhIfLUVJnQl2qFzuDZhI55TTEXNs9WMoM/ygoFKNTklLWZuP
	 4xhJ1695PEq9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B38DE00089;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: Probe misaligned access speed in parallel
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169895643056.22248.6956745778026886386.git-patchwork-notify@kernel.org>
Date: Thu, 02 Nov 2023 20:20:30 +0000
References: <20230920193801.3035093-1-evan@rivosinc.com>
In-Reply-To: <20230920193801.3035093-1-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 apatel@ventanamicro.com, aou@eecs.berkeley.edu, heiko@sntech.de,
 maz@kernel.org, linux-kernel@vger.kernel.org, conor.dooley@microchip.com,
 David.Laight@aculab.com, palmer@dabbelt.com, jszhang@kernel.org,
 paul.walmsley@sifive.com, greentime.hu@sifive.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_132033_180510_BC34773C 
X-CRM114-Status: UNSURE (   9.01  )
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

On Wed, 20 Sep 2023 12:38:01 -0700 you wrote:
> Probing for misaligned access speed takes about 0.06 seconds. On a
> system with 64 cores, doing this in smp_callin() means it's done
> serially, extending boot time by 3.8 seconds. That's a lot of boot time.
> 
> Instead of measuring each CPU serially, let's do the measurements on
> all CPUs in parallel. If we disable preemption on all CPUs, the
> jiffies stop ticking, so we can do this in stages of 1) everybody
> except core 0, then 2) core 0.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: Probe misaligned access speed in parallel
    https://git.kernel.org/riscv/c/0c37376609da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
