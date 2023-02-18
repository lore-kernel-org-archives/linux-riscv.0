Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF07C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 21:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycB8YD6MJ3l/aycV607+EqQX8aVOYWSK3smM8OvFUFI=; b=stIM8vtWgO++8C
	jP1X3cUW92tPSYboYPslDo1F0Cu3kWO01xNaqdXzxG1lfawoxmkw/KUmjpxhunq3Ret8duAePvwt8
	2Sev5EzW9CyDyu1dU2IEX+Rb5MTDrNPtt2+4A/BhlleiP5b86ZEk/LESBQyOID3WPZHoJGac7mzr3
	m0LM/j0Ywnsc2GlA3c1ORDSKqD049h1/e3Tu2qClbeOoHjUpoJ/bcqHlHMLZcs3UV7hak41V1WE3m
	3Xq+sozir94tRRTAYDJX4DD2Z3WuTTKooVWfJ34vwe4R+wAE1qjdM9e3cXBld9qDRdGsFsmTfLTl4
	IUrArjrKH5Memn3s+DvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUyc-000C0o-8Q; Sat, 18 Feb 2023 21:42:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUyX-000Bzl-Om
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 21:42:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A3CBDB802C4;
	Sat, 18 Feb 2023 21:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B125C4339B;
	Sat, 18 Feb 2023 21:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676756550;
	bh=inKpTNdeTXJQXc2kCE2ygH8R+rkjnBMFxu5iAD5Thhc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YoETc/4lf2iWwhemc7pZhBdWs4vOKxeaEzVQa4XFrgFn4RXny6giIeAYJ4DVFC7DX
	 QvkHisTrLxOtSACIHGyYZqpd18nBzUYqhM2vZrkHNYnmfnK1if7rLmFXZ8/UWrNddq
	 72GbrXvqhINAOP0FHDYNryxwfwlwRVK5ybQhz8kc6k+WUdiWSDyxQgRu2paonOMcz1
	 E6sMh+SZZmJDSuZhZjRYkrE31CvQOo4VQl/QYlrIu9neStQQcT40sCZGUlrzbgUQYL
	 N2bRpQNVOX8MsGcZ4KZdebPo4+1rXxDBVc15aWD4lkBaTOuhn7Iuz5Bs4Cl+YteUGj
	 md1dZxKhhVjhw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B7D8E68D2F;
	Sat, 18 Feb 2023 21:42:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next V7 0/7] riscv: Optimize function trace
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167675655023.26920.11250197941763068411.git-patchwork-notify@kernel.org>
Date: Sat, 18 Feb 2023 21:42:30 +0000
References: <20230112090603.1295340-1-guoren@kernel.org>
In-Reply-To: <20230112090603.1295340-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com,
 heiko@sntech.de, rostedt@goodmis.org, mhiramat@kernel.org, jolsa@redhat.com,
 bp@suse.de, jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com,
 e.shatokhin@yadro.com, linux-kernel@vger.kernel.org, guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_134233_983449_2D85D3D1 
X-CRM114-Status: GOOD (  12.14  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 12 Jan 2023 04:05:56 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The previous ftrace detour implementation fc76b8b8011 ("riscv: Using
> PATCHABLE_FUNCTION_ENTRY instead of MCOUNT") contain three problems.
> 
>  - The most horrible bug is preemption panic which found by Andy [1].
>    Let's disable preemption for ftrace first, and Andy could continue
>    the ftrace preemption work.
>  - The "-fpatchable-function-entry= CFLAG" wasted code size
>    !RISCV_ISA_C.
>  - The ftrace detour implementation wasted code size.
>  - When livepatching, the trampoline (ftrace_regs_caller) would not
>    return to <func_prolog+12> but would rather jump to the new function.
>    So, "REG_L ra, -SZREG(sp)" would not run and the original return
>    address would not be restored. The kernel is likely to hang or crash
>    as a result. (Found by Evgenii Shatokhin [4])
> 
> [...]

Here is the summary with links:
  - [-next,V7,1/7] riscv: ftrace: Fixup panic by disabling preemption
    https://git.kernel.org/riscv/c/8547649981e6
  - [-next,V7,2/7] riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
    https://git.kernel.org/riscv/c/409c8fb20c66
  - [-next,V7,3/7] riscv: ftrace: Reduce the detour code size to half
    https://git.kernel.org/riscv/c/6724a76cff85
  - [-next,V7,4/7] riscv: ftrace: Add ftrace_graph_func
    (no matching commit)
  - [-next,V7,5/7] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
    (no matching commit)
  - [-next,V7,6/7] samples: ftrace: Add riscv support for SAMPLE_FTRACE_DIRECT[_MULTI]
    (no matching commit)
  - [-next,V7,7/7] riscv : select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
