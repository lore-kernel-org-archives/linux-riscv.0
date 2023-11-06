Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF154C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+kBHl+eESCO+b2nErJYgdKriduQIB6sFTZJ9dEtFwo=; b=EwzAWWLEFcytzd
	Gi+BWH9smC7ViD64I2meyM0/MMTyVQ+bOAmqoJ+lXGuqKPn8hWr/QOkRDYv9OSr63xF9h3Bzhyd6w
	swN0f8sWnOkdpg79HwoLVAsfi4mPdethfmwzNgYicv4zkLz33qWEwJxIvIr8kUyrd4GZKdzCh++r2
	9V8rMYElL8zM+GlnYdkrNcVa3mPHDBNKEQx9IAe3HzDggPIJj7S09Dbwi1ugjNrpHAOIEpVr8liFf
	Z1ljTcRsVvy3CpjlLQX4RTeKEWiGry7y5sc8Bxj227l+PcZOiCEKgsN4b+ryeAof67J8F6W1W9R8X
	kHHsq+Uo9rHSsFRvzZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r015g-00GveL-11;
	Mon, 06 Nov 2023 15:00:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r015a-00Gvak-23
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 79A3F60F7E;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24D32C433CA;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699282829;
	bh=mpBdQjV65JRskvJp5MGoenmwHDRRCPUdFaTCUpk5jRU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FQebDZe4rr/4KDXpniGFPdHhbt6ngDrOfVEVDzKnxWfMRILRqRRfCsFjhiDiqna2p
	 h9llcV0FCkX0PilEpB6XaRUiahZzFlk+lKQOVFw7W9QUpQSHgkg6a2Ho4rdrgtqMx8
	 w6J04a2VWbnNvOtswzn7B8WodcsSoq459mXNX90q2ubsyaz5OnXywnR00sobOnwC6Q
	 VyOwY6jCNi9gkSfoKhCWZ378TKzEy0yXlyzFOFXtSUFZ1wXgsLGWdMjNWfa9+dxov8
	 B7fuLgTMrnSrilZkpxumw69EpT/j2+UI0TmcsYgR0B5zJOJzLh7f0fiSEXxqAf1c3m
	 cedeTZqJW6/mg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C23FE00097;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: kprobes: allow writing to x0
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169928282904.16503.14969147654698213248.git-patchwork-notify@kernel.org>
Date: Mon, 06 Nov 2023 15:00:29 +0000
References: <20230829182500.61875-1-namcaov@gmail.com>
In-Reply-To: <20230829182500.61875-1-namcaov@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 guoren@kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_070030_739007_4639678A 
X-CRM114-Status: UNSURE (   8.16  )
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

On Tue, 29 Aug 2023 20:25:00 +0200 you wrote:
> Instructions can write to x0, so we should simulate these instructions
> normally.
> 
> Currently, the kernel hangs if an instruction who writes to x0 is
> simulated.
> 
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> 
> [...]

Here is the summary with links:
  - riscv: kprobes: allow writing to x0
    https://git.kernel.org/riscv/c/8cb22bec1426

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
