Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0660C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpalCqKLeI5j8qjy79NrtUwPHAAG2w6/EJtYgxGnQmA=; b=fxfWQirNaIV9AN
	LcOMXRqJexPfWSMvoaayQ/HfsvHqwZFPOzFT/HcA8T7SKbMM1ac4l/e0j6RnCPBFh+tn4ySyEYMe7
	MzFCMmkSNRkPUq/8UrERcGcR3D1ugW3EbKRSZm3cPX+YZmL9szV1RVGqInG1HCY8QXcS5JiCHu45g
	PZgAccckYuz4MwTjbkyDcuNVmyVlQJ/qqR+0kEmZk5qA2mP1lbf3JTdSRUPcVsnAUS0rZxsackxl/
	Xi+gV+OgnmbyWtuN8lVIETGNJ6yp617ZmeXNreTMPd/Pls1lCofKzbB35clPejp//UxiEXfg6poF8
	ZlNeWdxAtft3zCIgc86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppYGh-008fA8-2T;
	Thu, 20 Apr 2023 17:40:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppYGe-008f8R-33
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 17:40:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97FC464A38;
	Thu, 20 Apr 2023 17:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0229BC4339C;
	Thu, 20 Apr 2023 17:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682012422;
	bh=g0ksG6nfP361Le8p/mc0obDjhA3uxSOnBqsqKl8TFic=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H+O4QULsjgMwJYS6AYt1YJg55l10HlZgTvndw5KVKTuHyJgzu/k33R4yXrFpPO5B9
	 GxOXfy/0sGByAnoopEwTaHdyugG7tdLJMiI64YuL7/C/AcStOmZOLGEBwcwQbgC9BV
	 WY9lGxTse50ZgmDnlyef44MrIqjCSNmDbbdusf88T5rRUGATui1MKMc4xgYOIxFTP3
	 g57+yZiDB6UNrjaNfMs9PR9RpM66Fl6Ijx0pOKQQNFkM5HrCn7xqDZ3i1GspQUkMhz
	 qpYUrNgVFdbMyKUWVpQjfBYys27G1Y0KPgww9V6AaUOueLFmgChE7RYkqF8nwYECZd
	 I6BH3IxR3oTSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DD154C395C8;
	Thu, 20 Apr 2023 17:40:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/1] riscv: Allow to downgrade paging mode from the command
 line
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168201242189.9373.3633169603042394509.git-patchwork-notify@kernel.org>
Date: Thu, 20 Apr 2023 17:40:21 +0000
References: <20230329050951.66085-1-alexghiti@rivosinc.com>
In-Reply-To: <20230329050951.66085-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org, ardb@kernel.org,
 bjorn@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_104025_020441_952A7791 
X-CRM114-Status: GOOD (  11.71  )
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

On Wed, 29 Mar 2023 07:09:50 +0200 you wrote:
> This new version gets rid of the limitation that prevented KASAN kernels
> to use the newly introduced parameters.
> 
> While looking into KASLR, I fell onto commit aacd149b6238 ("arm64: head:
> avoid relocating the kernel twice for KASLR"): it allows to use the fdt
> functions very early in the boot process with KASAN enabled by simply
> compiling a new version of those functions without instrumentation.
> 
> [...]

Here is the summary with links:
  - [v9,1/1] riscv: Allow to downgrade paging mode from the command line
    https://git.kernel.org/riscv/c/c070bcfdb2fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
