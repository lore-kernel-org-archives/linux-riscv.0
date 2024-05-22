Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20336C25B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcXnRduoS64vOQWoSJunzawd3n8voI4fi22vlw9QkFY=; b=MW1rZsGU5emKKu
	HXDrnLmJKq6rZPsAAUxvl3E0PC5TxM1Qlt+tBA1DUQHzriGLgX2QN167A/a8FPnwn7EiW9G2F8tQY
	irQ2aGfJLUdbTmfukhuznI/0ETdTFbRKn/OiGOZkc5Sf9BMM3rxAavkaejUHktLDiPhkGMk84n5PU
	Aw81RnuhhJ98XpR0BwXFQ92m0fT2DcsBGGjmRcO6dLjZkZ6f8OWtrF33W+eaeBODQCVPp+/8+2UM3
	EZE7HCn7Qvq9fIG+ZQql03Dm8Aru3Rsn5wLkEKdQkzvryqnWYERZVereooJixN9tFrvBFIAryjRBs
	6flzeUtxkBKOTuoQIQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRf-00000004RVn-0fBL;
	Wed, 22 May 2024 23:32:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRZ-00000004RRU-2Lxf
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A02F62BF7;
	Wed, 22 May 2024 23:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A476C32782;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716420743;
	bh=DMZ8A416rj3K/WIir9WPtL3TV/SPPZCOPyqRSy00irs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nnrWrKxAo9mkqq71SM15auqRvSuvMo1cwsc6uvNC0KmIf+8W+IFcGygA3Eo10mVeF
	 G2s+yrZMHPymUXLo+nLgP9UO7ySUEsYIr50vVERehi9hXlgnqcVX15e5hUtoNM1MCz
	 KdnJ408xiD+Wl9pXpBy3F6o9nfLEvLRX7/+b2odzWwlKArAQUij/s2m/3Jjh97LXPg
	 F8nJXMua61Qqa3D8YshT5wUFNBblfy5aUQ+sDx/fnkyS8EUbkRV5Kgi4KlL/y5Jmh6
	 7bCukgmu47qPQMBbXvCJyTY00enK+zaAd4j5um3XBgM7w9fHKYmb4gx7qdCy7Br/vb
	 fDCO7Xn+t58qw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7625CC43638;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642074348.9409.15455041633304152397.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:32:23 +0000
References: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
In-Reply-To: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, guoren@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, James.Bottomley@HansenPartnership.com, deller@gmx.de,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_163225_949929_DDEADECF 
X-CRM114-Status: UNSURE (   9.44  )
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

This patch was applied to riscv/linux.git (fixes)
by Masami Hiramatsu (Google) <mhiramat@kernel.org>:

On Wed,  1 May 2024 09:29:56 -0700 you wrote:
> If an error happens in ftrace, ftrace_kill() will prevent disarming
> kprobes. Eventually, the ftrace_ops associated with the kprobes will be
> freed, yet the kprobes will still be active, and when triggered, they
> will use the freed memory, likely resulting in a page fault and panic.
> 
> This behavior can be reproduced quite easily, by creating a kprobe and
> then triggering a ftrace_kill(). For simplicity, we can simulate an
> ftrace error with a kernel module like [1]:
> 
> [...]

Here is the summary with links:
  - [v3] kprobe/ftrace: bail out if ftrace was killed
    https://git.kernel.org/riscv/c/1a7d0890dd4a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
