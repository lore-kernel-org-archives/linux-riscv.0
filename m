Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08E4C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 22:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eM/AMejK34gEUbvWBA8BCWZin1FSlYWstGVlpQlxK98=; b=RR7212jtGCdSff
	WgbROsrWMixD23xckIIwx24lrIZaP5Fz/bbCIhkWZhgDNoQbFbJCZdfUp27DK+1I44BMqjR4l87Bt
	NLmRyhEUsNyfXUatQn0KSFI4yQjmEi+967zymI7CwyItld2Ocjf2pgM0PhveeycEi2uFk6V937P/q
	vaP7hxJeS1vMSonNLMdB1XN4MhaDX7f5WJcetlMsfUiw+h0+eCvhPqfxhhHdpyfQGOb3M5ZL9TJGq
	5U23YlBd/tKOlal6lbhYfTzxrCTSJO1yWmBELpbz1uMHQ+/OToRDMrQUfryS2Rgu19+5pwThSvquy
	VgEMb9+33aavjsZ/lmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOF-000000099mN-0TOn;
	Mon, 02 Jun 2025 22:12:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOE-000000099lb-1zNY
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Jun 2025 22:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Lsi+3NUgruFdOKOljXw48FLaGUPljT6iBd+vUE7fsl4=; b=coGlD3EQIfZZgUdE3rW7RlYm+b
	L8lZDb1JuLZeMNyX+uVrw66NezNhjtyjpXtY1N7mZIZh/+K7eBpzydbICqVOFeQV6pyRPV5uSJ9sV
	K5FqF/Jkj2BMhnBLVxUlhrmAqayYFVhGMu9yec3Rgfbf85dvR3B+7lWktSMVHvjkylU9YOTI0/ckP
	xTWVTjO2mtCqItcX4BI9TWS993gz8qLtW95wdFYAkhbKc3m6HbxRx9FQ57euCNGgmkGsP4Aa++VDo
	VF1f5UMJWs5rAhaXUQWqGmAbESjQGdOivctsxmJiIePQrMaTbTFhHx5wBYwqVegalZT8HA5wHTJCV
	srl4sOrw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOA-00000000gDq-37sF
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 22:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B60F049FFA;
	Mon,  2 Jun 2025 22:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951DBC4CEEB;
	Mon,  2 Jun 2025 22:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902330;
	bh=aBzjsMEEhXVIe1zVGvGDXk9sXhqzdXCVIPE36+jRrbQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RaIxgnmYx+7sNvyNz2IzcnpY39HOM+PAHCo0MTt+d318KLoaxtOwfO3dWMQB1SGuY
	 8txcIQm8bYZIcSSdQGkcPP9GqXMUhsCm5PpV9FTRrVhHSzvGke+qCuLTqu7dXeOovw
	 7nAlh+Iz8wjYWyq7xv2TWeWprir2BXqST761RayqIvZ0PjdI3nGyvmLN4hOSs8uFnL
	 00R1KU56O21XsYY/3fGbN4u45YZc3oeoJZ7YlT9CCF9pSIrvT2IV5YojWuzndq9B1Q
	 vEBXl9soSu5nujHVR8jb1BzIt7FrN6f7ammbVJNI11LIoC96AYl+5FLg8RV+6EfToF
	 +15LBv/4dVxwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CA8380AAD0;
	Mon,  2 Jun 2025 22:12:44 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 01/12] riscv: ftrace: support fastcc in Clang for
 WITH_ARGS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174890236299.925497.5731685320676689356.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:42 +0000
References: <20250407180838.42877-1-andybnac@gmail.com>
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 palmer@dabbelt.com, andy.chiu@sifive.com, e.shatokhin@yadro.com,
 nathan@kernel.org, bjorn@rivosinc.com, palmer@rivosinc.com,
 puranjay@kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev,
 mark.rutland@arm.com, alex@ghiti.fr, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, puranjay12@gmail.com,
 paul.walmsley@sifive.com, greentime.hu@sifive.com, nick.hu@sifive.com,
 nylon.chen@sifive.com, eric.lin@sifive.com, vicent.chen@sifive.com,
 zong.li@sifive.com, yongxuan.wang@sifive.com, samuel.holland@sifive.com,
 olivia.chu@sifive.com, c2232430@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_231215_236373_B498B4BB 
X-CRM114-Status: UNSURE (   9.65  )
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

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue,  8 Apr 2025 02:08:25 +0800 you wrote:
> From: Andy Chiu <andy.chiu@sifive.com>
> 
> Some caller-saved registers which are not defined as function arguments
> in the ABI can still be passed as arguments when the kernel is compiled
> with Clang. As a result, we must save and restore those registers to
> prevent ftrace from clobbering them.
> 
> [...]

Here is the summary with links:
  - [v4,01/12] riscv: ftrace: support fastcc in Clang for WITH_ARGS
    https://git.kernel.org/riscv/c/7cecf4f30c33
  - [v4,02/12] riscv: ftrace factor out code defined by !WITH_ARG
    https://git.kernel.org/riscv/c/2efa234f5e0c
  - [v4,03/12] riscv: ftrace: align patchable functions to 4 Byte boundary
    https://git.kernel.org/riscv/c/cced570c2c0c
  - [v4,04/12] kernel: ftrace: export ftrace_sync_ipi
    (no matching commit)
  - [v4,05/12] riscv: ftrace: prepare ftrace for atomic code patching
    (no matching commit)
  - [v4,06/12] riscv: ftrace: do not use stop_machine to update code
    (no matching commit)
  - [v4,07/12] riscv: vector: Support calling schedule() for preemptible Vector
    https://git.kernel.org/riscv/c/e2a8cbdbe932
  - [v4,08/12] riscv: add a data fence for CMODX in the kernel mode
    https://git.kernel.org/riscv/c/29b59e3bbb6e
  - [v4,09/12] riscv: ftrace: support PREEMPT
    https://git.kernel.org/riscv/c/f48ba55bb8a8
  - [v4,10/12] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
    (no matching commit)
  - [v4,11/12] riscv: ftrace: support direct call using call_ops
    https://git.kernel.org/riscv/c/7ef9ae7457c0
  - [v4,12/12] riscv: Documentation: add a description about dynamic ftrace
    https://git.kernel.org/riscv/c/0e07200b2af6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
