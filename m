Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1384FC531F8
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTFs+tZNbYBlXx0BE3/vO3+DyUPCaS4+tN26nDPegD0=; b=f4hMp9kJDC60FA
	ZvBhuVYurZ5AvY2A2Khzp3DblTByIzA/p+Antt77LwlNyUwlFELpZnUQTpkpRHuj189GL/ZeeUbc3
	VxPEAos1pkPgNIfhjD7u3QvOF41Zged+jrKSiOf9hdgqKvqgq4LCCR8y24/4voLz2c5SD17hZQ3Zk
	82IghywlSIfQKgsHh/8nvLVVjzJ2RaNQiaaM3QwSbcHuCSLEVtBMhMY3IDceIFkPEW7ZIKbVOmwP0
	s/e8D6cXR1q34N58+R67H7pEsb98Uto6hHYkGFgLh+VoGi3/FQeassuP98JJrZp/NgTrhwOYIQ3+c
	woIZG/3jzfE5yAobpiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqn-0000000DCOM-1Ws4;
	Fri, 20 Feb 2026 04:10:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqk-0000000DCJa-0iIK;
	Fri, 20 Feb 2026 04:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5787661881;
	Fri, 20 Feb 2026 04:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D73AC19421;
	Fri, 20 Feb 2026 04:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560641;
	bh=fHDGQg8Y8I31uG+H3itYMHO1lNQuNdbaHv3s+w2VA9E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oMaFyqG2bTps/8USOYgV6sHoWWaZWkyD8fr7yLmY5l7usrVYWzQZzpzEhFrj5oIso
	 JsHHbdcmGWZfgObZBMrrGYnYu32BPlMnnVgwwSDA1ys0qiJ1qOLadxN3JSuLSdLeIV
	 tnZk2pdJNKsAWT931GvGXNP4fol0h+61TmknQ8GSGiCMQCV6UL7UDupsNR66mU84jY
	 Uf0+Fkd9Pj07dGm9AzWla0qfC5/ONLfwGajcUnLXdYT+BVuNcuJZmO6sBygjchoA7g
	 hhSIJI8pnZDmIXMjKC9Jz5/fJyymINQf46MMxuBF/t5nZ792GREhqQxlQeEORgXYm7
	 E3Z2SpOIzWr4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0853809A88;
	Fri, 20 Feb 2026 04:10:50 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/21] paravirt: cleanup and reorg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156064929.189817.13253801870624912064.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:49 +0000
References: <20260105110520.21356-1-jgross@suse.com>
In-Reply-To: <20260105110520.21356-1-jgross@suse.com>
To: =?utf-8?b?SsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, luto@kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, peterz@infradead.org, will@kernel.org,
 boqun.feng@gmail.com, longman@redhat.com, jikos@kernel.org,
 jpoimboe@kernel.org, pawan.kumar.gupta@linux.intel.com,
 boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linux@armlinux.org.uk,
 catalin.marinas@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com,
 vkuznets@redhat.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 daniel.lezcano@linaro.org, oleg@redhat.com
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
by Borislav Petkov (AMD) <bp@alien8.de>:

On Mon,  5 Jan 2026 12:04:59 +0100 you wrote:
> Some cleanups and reorg of paravirt code and headers:
> 
> - The first 2 patches should be not controversial at all, as they
>   remove just some no longer needed #include and struct forward
>   declarations.
> 
> - The 3rd patch is removing CONFIG_PARAVIRT_DEBUG, which IMO has
>   no real value, as it just changes a crash to a BUG() (the stack
>   trace will basically be the same). As the maintainer of the main
>   paravirt user (Xen) I have never seen this crash/BUG() to happen.
> 
> [...]

Here is the summary with links:
  - [v5,05/21] paravirt: Remove asm/paravirt_api_clock.h
    https://git.kernel.org/riscv/c/68b10fd40d49
  - [v5,06/21] sched: Move clock related paravirt code to kernel/sched
    https://git.kernel.org/riscv/c/e6b2aa6d4004
  - [v5,10/21] riscv/paravirt: Use common code for paravirt_steal_clock()
    https://git.kernel.org/riscv/c/ee9ffcf99f07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
