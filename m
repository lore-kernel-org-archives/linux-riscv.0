Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11420C52D70
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtAezStBosHvp5cd16sap9S6YBfHEeddBWEGIIGB0bM=; b=dfmwZeAmAid7Fr
	I2eruSD2dzLdNMqrA0WuoFhBzVUpBOka7pQ7vzymOOGmjqihr1HkMdZjZNauklp38xGoUFbHs5gLm
	ZkvqLSvrLkktmJkJusKePHVw0jdhdrRYt/oho1I1+DGskSaLvxnpygm3n2JNnhYpU0t39VYltdjOJ
	Hmcsx2f2PFCG/phtPDgGTqZB7IIsZn2F+GdEnGoaxqvTwoTRAzOmrkWrHpfFTVZoRkW34Y+ezBzPg
	x4qVErEWflPKhCRTlzvVqgzmiFe3quGyzBGs5klTmEbO3yAZqP3gr/MQFeaRcRLeerJmj6OR7Laa9
	LmPlhnTLMojed3QU/DRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYs4-000000067YV-2eDQ;
	Thu, 01 Aug 2024 16:41:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYr3-000000067Cc-27HU
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 16:40:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 169FF62929;
	Thu,  1 Aug 2024 16:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3824C32786;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722530438;
	bh=Qf7CsUZ7Mp3HUtb2ngmsj4kwcF27UTC845pBKzaaids=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VGIHvkW9pm4tSmx6J5sp7tQHJlJVPsD1h3vPy5N/Nja9Va9NQZbPXUbS/SmN3oQ1/
	 52v+14H02XzrEEK3jYk84UGohxTLTG3wZVdee4cd3KREyJh4iEM2LAy5PpH4PewKTg
	 m3iCvKTkpTN5mYmnuwhGpsX0S3hG1BT5ob9sYm20wNJ+DQW6AMsPUf+GRCFHpdMBmr
	 sUOFJrsjDROJQQMeOHkmtoyufG2H9+eGptiT8QNH+GyURI2SCZvvem+o0GjbPrg6yu
	 wU2Ik0fnfzpv/qp+aFxUPFWq/6Nvz/hGlh0lJnc4nfYjkMIGBbPGxqW23o8i7m2B02
	 UsJDIGQ9gn49Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7E05E8877A;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: Enable the IPI before workqueue_online_cpu()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172253043788.13740.11553891732223082482.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 16:40:37 +0000
References: <20240717031714.1946036-1-nick.hu@sifive.com>
In-Reply-To: <20240717031714.1946036-1-nick.hu@sifive.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@linutronix.de,
 peterz@infradead.org, anup@brainfault.org, samuel.holland@sifive.com,
 tj@kernel.org, alexghiti@rivosinc.com, linux-kernel@vger.kernel.org,
 greentime.hu@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_094041_779095_1DF751B6 
X-CRM114-Status: GOOD (  10.51  )
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

On Wed, 17 Jul 2024 11:17:14 +0800 you wrote:
> Sometimes the hotplug cpu stalls at the arch_cpu_idle() for a while after
> workqueue_online_cpu(). When cpu stalls at the idle loop, the reschedule
> IPI is pending. However the enable bit is not enabled yet so the cpu stalls
> at WFI until watchdog timeout. Therefore enable the IPI before the
> workqueue_online_cpu() to fix the issue.
> 
> Fixes: 63c5484e7495 ("workqueue: Add multiple affinity scopes and interface to select them")
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: Enable the IPI before workqueue_online_cpu()
    https://git.kernel.org/riscv/c/3908ba2e0b24

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
