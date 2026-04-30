Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BC0CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lrisfhfFx9XrepT/6URv+x1kYmYa9zfZve28YpLccM=; b=lNFOMWjUNJYiQ9
	Iwc+fpP00xiXI5dDmC+Ig2SNFUWKkJ+KEr9u6sk+Ldhp6E/NARKa9/HS9w0QOr1RVyQLnpxePBJuB
	MEthOkZ9MscxQPrUNjAIA/js8IQZ/FCPUu8w/FgOG+tgItBuLwOsQyoLPAYJpXXKyA/HbOT4GIlJ+
	DfdjIsJExstrM637vhlVbR9IbiHmiRNIZVnIrdiYaMuo38FO2CgopJDMoeTwEUbsCS8DMpKQsebDs
	4D+2aUzuVDK8JFIUpgldomQIERa/nGVYy1aie7kTUhtWpS34Hi5EabUoGWyBtg0FQYYMfDAyUeI4S
	Imb4NdH8RZgHNylKQG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2t-00000004WqN-3aAz;
	Thu, 30 Apr 2026 03:26:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2G-00000004WQO-1aTE
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:25:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 076AE4447A;
	Thu, 30 Apr 2026 03:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEF6C2BCB8;
	Thu, 30 Apr 2026 03:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519555;
	bh=szPW1uCqeNjuxpRKf35c7votk+r6wYXFiCCMDEk9F+0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TcVHchma7Ti4f25Tb42Qdy4/B1aY4IMmqDmHeKXgGQMHk0Y/XDu6omLd7HMot4nC2
	 qqkgtNf43wEE57ObFah4MpQYx/iUsBoqoXiwt9Q2FRYP6LvmRILJK2xLJ1+YojoLd+
	 W95luRnZSz1lkUJ9y8gVDNvsG7hOZvZXmcX7UMbHdE/HM+uGsgnDUwbUKCy0Q3zvJM
	 T0sklUqkyCFPWpTMDY3aWOY/V3Nes2YnTvpRDTLKV34JA8fvOImVss4J1wqmY68GSQ
	 DFQNLS3NZ7NK+idIVzM0QFnoMRtUzXEGf829i7BOqEfJ2TS3hMl7jx2rqfnoX60TmQ
	 +Jx39aV29qTbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDBE3809A07;
	Thu, 30 Apr 2026 03:25:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] iommu/riscv: Fix signedness bug
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751951080.2274119.8369417517084133049.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:10 +0000
References: <20260326175738.750060-1-ethantidmore06@gmail.com>
In-Reply-To: <20260326175738.750060-1-ethantidmore06@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: linux-riscv@lists.infradead.org, tjeznach@rivosinc.com, joro@8bytes.org,
 will@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 robin.murphy@arm.com, alex@ghiti.fr, mick@ics.forth.gr, seb@rivosinc.com,
 andrew.jones@oss.qualcomm.com, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202556_437371_926C9E58 
X-CRM114-Status: UNSURE (   8.67  )
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
by Joerg Roedel <joerg.roedel@amd.com>:

On Thu, 26 Mar 2026 12:57:38 -0500 you wrote:
> The function platform_irq_count() returns negative error codes and
> iommu->irqs_count is an unsigned integer, so the check
> (iommu->irqs_count <= 0) is always impossible.
> 
> Make the return value of platform_irq_count() be assigned to ret, check
> for error, and then assign iommu->irqs_count to ret.
> 
> [...]

Here is the summary with links:
  - [v2] iommu/riscv: Fix signedness bug
    https://git.kernel.org/riscv/c/553a127cb665

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
