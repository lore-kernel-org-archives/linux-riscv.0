Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE42BC6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 22:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3DTka3T7CwR8wTFuKGHwnKi2lWJZ/MqhkhTcr6Cwds=; b=beHRidIrTcHYua
	TwLeDZDjVnx2fGtuPUUU1Cuu/K7Ue5lbADGoBqfg63RUZQ/88J8FW0CARsDSMhWspYzhB1Aq5LtuF
	NM8P2Od1TyZ+YnsFgj0vliEvzY7CRFMTvrhJdnLjDkMFHa+I+kYEnwtNVsTZGn38EaTovCDvVzb9a
	jPCinOzEoBccUvomXDGLYj/mFb0UJ8uQTUzun1E9nJCMi1sO0khc7lYwLrkRHpOH9t4gjeRX21jcQ
	3zlhbRr4Kp/YgsSK3zw9MXSsMN/YIbpv4YjiMPrxjCT+fDmVddMapuTKR9gjbuEzoebA20rbDwTuE
	M2Xxjr3iM4u/g4MVt5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfpc9-005iSw-0Q;
	Fri, 24 Mar 2023 22:10:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfpc6-005iSC-2k
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 22:10:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 372EB62CEB;
	Fri, 24 Mar 2023 22:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A34AC433D2;
	Fri, 24 Mar 2023 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679695820;
	bh=7NwS0U01MV0dfXKZoaLQ2hFmYS51CthUEOZmKxykaMI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hClVYetXTib/837YePQUK5+XtDS+o/RD51zAHlmROciMRK8ibiL57HjFIDhpFG/hF
	 xAALL+OkPw+0YEpZpUl7205PKFvgmuJImIr3cqxmkn72Ut6UCMNjljzzM4jVZgs5Hk
	 DZE7wdnE2C/dGgUoTd0pC6xZQ3C4ldBhcJ9tmBJKfIe0h4lIr5nnaUE8g+NnZsqlDN
	 DpWkddNLe2h+oDEvl5Z84MXxCUc377wSNzB2YxN0tllgTKnLlBJCnaxqfi6LjYDbgi
	 c6i8l1nu40jIaJQKchJ7eCSlpJr84hsnM5Xy7S0QGCHMtEqrXmbD5xRnfT0h+4iS2b
	 Rkjvhio+9m8sw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63A65E52505;
	Fri, 24 Mar 2023 22:10:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next V17 0/7] riscv: Add GENERIC_ENTRY support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167969582040.16091.14731927626105849742.git-patchwork-notify@kernel.org>
Date: Fri, 24 Mar 2023 22:10:20 +0000
References: <20230222033021.983168-1-guoren@kernel.org>
In-Reply-To: <20230222033021.983168-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, palmer@rivosinc.com,
 tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
 conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
 lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
 apatel@ventanamicro.com, atishp@atishpatra.org, mark.rutland@arm.com,
 ben@decadent.org.uk, bjorn@kernel.org, palmer@dabbelt.com,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_151022_950267_567C61C2 
X-CRM114-Status: UNSURE (   9.62  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 21 Feb 2023 22:30:14 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The patches convert riscv to use the generic entry infrastructure from
> kernel/entry/*. Some optimization for entry.S with new .macro and merge
> ret_from_kernel_thread into ret_from_fork.
> 
> The 1,2 are the preparation of generic entry. 3~7 are the main part
> of generic entry.
> 
> [...]

Here is the summary with links:
  - [-next,V17,1/7] compiler_types.h: Add __noinstr_section() for noinstr
    (no matching commit)
  - [-next,V17,2/7] riscv: ptrace: Remove duplicate operation
    https://git.kernel.org/riscv/c/8574bf8d0ddd
  - [-next,V17,3/7] riscv: entry: Add noinstr to prevent instrumentation inserted
    https://git.kernel.org/riscv/c/d0db02c62879
  - [-next,V17,4/7] riscv: entry: Convert to generic entry
    https://git.kernel.org/riscv/c/f0bddf50586d
  - [-next,V17,5/7] riscv: entry: Remove extra level wrappers of trace_hardirqs_{on,off}
    https://git.kernel.org/riscv/c/0bf298ad2b61
  - [-next,V17,6/7] riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork
    https://git.kernel.org/riscv/c/ab9164dae273
  - [-next,V17,7/7] riscv: entry: Consolidate general regs saving/restoring
    https://git.kernel.org/riscv/c/45b32b946a97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
