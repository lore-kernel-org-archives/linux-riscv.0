Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D30C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 05:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObDvYNWQg1y4ja8+uW8EpmmAgmymu1TqPwYaPU/NPAU=; b=gdj6qKuw7Jp+BS
	f31XD3R8nYG2zRNUQ1vBK0AySVLZk8C30o8CCHOUgNcXZ22bqpyV0ycWa0RGMRteEiG93m5XQ65TM
	MHrtkSQMoK4oHrlwTm5AT++EKWvcYt7n7uM4lq3PPN4GvoRPlvvmit5kIa4URdLpM1/3N1fKruE9w
	+HMKhP7vp/AkknFQqhTn2S+cbp0b6OBrpxunc60KtvgYEO3K/oZeFsQ78JA62g8zCPwdQGhFp+F7V
	O/YRn2rWXkOo7q0n8GZCz3LZsYol1rNYODNQf1IxXf8eWweSiLu5XxA6DWps/iklXekyDfEZsQd5a
	6rz8rVbOCVG/SP2d/dYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0FzA-00DZ4M-Cu; Wed, 30 Nov 2022 05:50:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Fz8-00DZ20-7I
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 05:50:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A889E61A08;
	Wed, 30 Nov 2022 05:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08D53C43470;
	Wed, 30 Nov 2022 05:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669787416;
	bh=Zir1ps/2c2EwIni6tIKiHxWTktiNF48TCCnVqNEWPdw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jeyo07wxc6apZt9dJYmMQEWjnLgIu2l4VAidR70XYiUroF5v9Nphw5gGMZdrEez2l
	 6Jm+jVSCsF5itw6QYCV0WVCRDYfYKjfzrR7eKdE+oN620B0UFLvtVmm++1L6aqn4IS
	 p9tRiEsUqX5S0Wf5Kl3UHLi996Jxo+c3WN1W4JfTFieMEtPEsj8ssVaD/7wG1rF+o0
	 svRbuz4ljcwKkUtF5jMu8Pjl950xYijUHiX7SQysO0bEjUAf+hoBXtXHmQX9CzFKTP
	 teimL55Lb0WdaEnAQAWRkcGGgiuLLSkzKeMwqNlRJuxNPXybl5eMXkCNtVS0IQXQ6g
	 mhxIMdaPE08Yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E33E7E29F38;
	Wed, 30 Nov 2022 05:50:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: vdso: fix section overlapping under some conditions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <166978741592.2406.17617743225163774809.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 05:50:15 +0000
References: <20221102170254.1925-1-jszhang@kernel.org>
In-Reply-To: <20221102170254.1925-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_215018_350119_A607079A 
X-CRM114-Status: UNSURE (   8.72  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu,  3 Nov 2022 01:02:54 +0800 you wrote:
> lkp reported a build error, I tried the config and can reproduce
> build error as below:
> 
>   VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
> ld.lld: error: section .note file range overlaps with .text
> >>> .note range is [0x7C8, 0x803]
> >>> .text range is [0x800, 0x1993]
> 
> [...]

Here is the summary with links:
  - [v2] riscv: vdso: fix section overlapping under some conditions
    https://git.kernel.org/riscv/c/74f6bb55c834

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
