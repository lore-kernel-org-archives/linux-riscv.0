Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08034D711D6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvMvzEZjFu+TyNDG9GtHLitcJ8o5zyRj0dnop/f79QA=; b=qYvNenyemoY+l7
	FDIbPXGdRGXLuJE0mQwUdfAxB6qyS4SjK3GX8BlcIChgux8+6/qtD2ux0PN+SIkEhlCP1ydrU57DE
	0WJsQkcpbU3UzAQ4o8yU45qzn73/g2jMY2tLuQu6TnFoR2JVkWvWQC+wRQVB2LFKjG6W3pqoCMoK7
	yDFq30wOBTzJX+Qp1cXPu+b3vaFGZXmJCO/oH1blxYj7puoZoHWc2H7rkDhLb+Uwf4r45MHOqPwm0
	UBDAzZ67LrXIWJuGLRDydAvTy3mlY8UGOiDp0tZeVjhNMUp7y3GGoJB0JcApknaywQzO2I7jqQ/+U
	EryEpP7BqKJ8GCjD+tzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbu-00000009oqi-0QxV;
	Fri, 19 Dec 2025 08:13:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbs-00000009opB-038n
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7A70441F0;
	Fri, 19 Dec 2025 08:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830A6C4CEF1;
	Fri, 19 Dec 2025 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131991;
	bh=VHoS82AXfCFO1ejAKfSVVHRYub84nw1PWg6S5l2Exag=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IaLW4S1tN6Y5d0CEwtYrP7pEFFatg4+zyVk42le/G1ucAiucsqwdqRrXSmIZwetfz
	 2zs60fMbWBsq8viNHscFfmAKLsGTsX8ViZtlMfKG9WYxS113c6NsRFI8XmO0QqXa/c
	 G0kwrN1ENE+XMTcx1FH3lNlIq0qG47mawO0dWLcFaANMO7XG7pRpYaBN+N0AlY0L56
	 ULFhlpqrcbAvM1rLyzbhF9iEwedS5paG2uV9+u0arVl40hVQMgM6e0mGyCZneg8EU8
	 smrcfl6UIkPgQ9go9rjfopU/D3bUCirJ/35nYbjYY0piCkggs9AMgBsGaHp6htqpnM
	 PkespiJB9S78Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5C24380AA50;
	Fri, 19 Dec 2025 08:10:01 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613180027.3684357.16322390150390680475.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:00 +0000
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001312_089169_699891A3 
X-CRM114-Status: UNSURE (   9.34  )
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
by Nicolas Schier <nsc@kernel.org>:

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
    https://git.kernel.org/riscv/c/d81d9d389b9b
  - [v2,02/10] init: deduplicate cc-can-link.sh invocations
    https://git.kernel.org/riscv/c/80623f2c83d7
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
    (no matching commit)
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
