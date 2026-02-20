Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD4AC53215
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bldgCJrVQt+sDAGJwKimoqWHB7tl8y+c+jrr7l4xvrk=; b=N2WXg7VJtJFN04
	Z0Az3J+OL+bxudFLlSVQH4IgEpaUco2PD9HaFRsM6I/2D5LAc3+Jz+zP4Sw5tucoNMN7ypr4BYxDD
	1/g381UBzAuCJVDeBr3PloLRS4IvfSzmH2zpEhnYDFGvqGdkYtFRscJrTUUvraEV0fZSRXpW/2cXP
	2Ubs96PQJURUe8elJShznhBJqtdgEwUKSEJaw2FWjc9bE9T5MeZ+sFJEDAi9NEkyuWto3hx2DoS2X
	iuThBIIMrCAlFi2NxhEC/TkwtMRLGuEf39cLlsZTqaIih65z/TwML5UVlO3IgtiaqSToRhendwwCD
	92xcZJvoClg9saJIs2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqm-0000000DCN9-2OS0;
	Fri, 20 Feb 2026 04:10:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqi-0000000DCJL-36OZ
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 04:10:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D938E61887;
	Fri, 20 Feb 2026 04:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B270C2BCB0;
	Fri, 20 Feb 2026 04:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560639;
	bh=0PM3EvHMCr8BvaAe9tsZy3ke/nSbfi2Vm8wcUfyZoLQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IVx2kUNSxwdn74f3azX658a2kTXvhnAo2uYJ0bpEMr+c6aO+cz8pL8626VIS81zgm
	 Hm3ohw27VvABIpU01I09pS6tpRkCKzGBFkizfiQXloXkQcFj535JY1NtJlcUUz/yQz
	 zI76CKiCR6bQjllggKkYdueNsdTPXwg+xKkV36RH19CiBgxQu7xPPz0+xBQu5qw0M6
	 vwGsQ+XlvFXFuRYrufowmz9SeyWMjUvTD8CENbNArppvg1nbNfcMdcv3TryDcEhFlz
	 q/Og6P925mDm6YJX8HiVuSIqJEiyiW79umNtOcgxrYOC5QBWJMXHsx+jot4W3TOkKB
	 m8Y5bX+jeVa3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE3B3809A88;
	Fri, 20 Feb 2026 04:10:49 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156064779.189817.8600732238018283033.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:47 +0000
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, nathan@kernel.org,
 nicolas.schier@linux.dev, nsc@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, tsbogend@alpha.franken.de, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, davem@davemloft.net, andreas@gaisler.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org
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
by Andreas Larsson <andreas@gaisler.com>:

On Tue, 14 Oct 2025 15:05:15 +0200 you wrote:
> The current logic to inherit -m32/-m64 from the kernel build only works
> for a few architectures. It does not handle byte order differences,
> architectures using different compiler flags or different kinds of ABIs.
> 
> Introduce a per-architecture override mechanism to set CC_CAN_LINK and
> the flags used for userprogs.
> 
> [...]

Here is the summary with links:
  - [v2,01/10] kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
    (no matching commit)
  - [v2,02/10] init: deduplicate cc-can-link.sh invocations
    (no matching commit)
  - [v2,03/10] kbuild: allow architectures to override CC_CAN_LINK
    (no matching commit)
  - [v2,04/10] riscv: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,05/10] s390: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,06/10] powerpc: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,07/10] MIPS: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,08/10] x86/Kconfig: Implement custom CC_CAN_LINK
    (no matching commit)
  - [v2,09/10] sparc: Implement custom CC_CAN_LINK
    https://git.kernel.org/riscv/c/dc2f4d41a6b6
  - [v2,10/10] kbuild: simplify CC_CAN_LINK
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
