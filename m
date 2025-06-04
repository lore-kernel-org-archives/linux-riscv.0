Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75966C5B543
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 14:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vr68eWx3lJ0rSq9uJa3L1A1IskY7ks0e1LHeqgyzyMA=; b=nIYMITHW5MHsLd
	EejMIOi03uom5NDNZzWKybTnfz8kO5OqIrdzknPZhRCWm7Z0oMmtLk9lE/YmzMe6DaUo9eT6Z9tjG
	sLueqhO8WsuIhqmMJwKZAAbO0g0gTnVewEryIeX10MS+ddHkLYAR7BMoTz83emd9ms0bOF68e/pGE
	T+T2AjFvQxQr23g982X8Hatkz0UW3P67n+CcgAJgLFyXbkyJN890hn+1CyXHeo2CTV+VZGOWWvQ66
	kMIgX0yhljNC++lsZa6/aCseUA9fpyFgoyq0cTLHgl7U190hFSOvtaYr92BcjHgU6xlC7y67W6foD
	Y8jDPzO6o8gT02QDqOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpAV-0000000DZkd-0PZH;
	Wed, 04 Jun 2025 14:32:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpAS-0000000DZj1-0bxt
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 14:32:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8032F5C588B;
	Wed,  4 Jun 2025 14:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065C9C4CEE7;
	Wed,  4 Jun 2025 14:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047555;
	bh=0cex6vSsXIzLr3HCp6pdJwaZEIj6tYWrRSJ+A1mcFLI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FcU55DcLd27Gzr3kTtCD7R0h8Y+7t99/1qb67kVtT7VJmq2VsTlx8WVfgKCaUzAY7
	 s6639hu3xKMWeHBGHX4FqKRT2crjgv9FG1p/XNFds2H6apBCBqPplBZCsv06+GEZER
	 QOu2AjNw+jItngyM8zBYXR9vuNIZfz7PAPUTWhfXir7EvPccAuOC9oCO2JmcwJN9/F
	 Cbqho20ofD7DtdUsKULcNQKAVgMG4MlA+Q3V4G2OJbIvTK8Hg67MzZofyiZaL8+isR
	 pX6eB+05poNoSy4eiUs7UZ08J5KgQ3fzkccK6+t5/DcZCAETw8VNQXQxL7fUK6xO2F
	 HvqIc64Kpmt8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BC438111E5;
	Wed,  4 Jun 2025 14:33:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/11] riscv: kprobes: Clean up instruction simulation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174904758698.2309006.9940004806769596353.git-patchwork-notify@kernel.org>
Date: Wed, 04 Jun 2025 14:33:06 +0000
References: <cover.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_073236_223898_32C2C10F 
X-CRM114-Status: GOOD (  10.61  )
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

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 14 May 2025 11:38:39 +0200 you wrote:
> Hi,
> 
> There is some instruction-processing code in kprobes simulate code. These
> code should be insn.h. In fact, most of them is duplicating insn.h.
> 
> This series remove the duplicated bits and make use of macros already
> defined in insn.h. The non-duplicated bits are moved into insn.h.
> 
> [...]

Here is the summary with links:
  - [v2,01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
    https://git.kernel.org/riscv/c/d29656bab74c
  - [v2,02/11] riscv: kprobes: Move branch_funct3 to insn.h
    https://git.kernel.org/riscv/c/da6de46c2eed
  - [v2,03/11] riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
    https://git.kernel.org/riscv/c/6d47d903b18f
  - [v2,04/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
    https://git.kernel.org/riscv/c/5cefc323f32a
  - [v2,05/11] riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
    https://git.kernel.org/riscv/c/a285674909ae
  - [v2,06/11] riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
    https://git.kernel.org/riscv/c/c7196c136e29
  - [v2,07/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
    https://git.kernel.org/riscv/c/768007ca3fe8
  - [v2,08/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
    https://git.kernel.org/riscv/c/f2c715fff676
  - [v2,09/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
    https://git.kernel.org/riscv/c/284ca2a100de
  - [v2,10/11] riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
    https://git.kernel.org/riscv/c/a60c2933ec74
  - [v2,11/11] riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
    https://git.kernel.org/riscv/c/ee4c45f5cbeb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
