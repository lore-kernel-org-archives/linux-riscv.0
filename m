Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A712EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 19:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0LOjzEk0xuexsP3PBpFIyGQ89a1AdCIROJFP0GzBPw=; b=WIXxWS2vd3dn/D
	y7ljOJNkv9f5g+DugBn8VPuW7OW1q2jIfqAWWMvt7E0R2F8wrziamqPdhSWcSDio1lUdhgUrwyvBY
	7K86Lzrys93+4o3X+Fdwq0Qqr/C/Q99QfBbDvQVSX2rKNsvg4ayK2PhSJgqiX8Obss8sA/Tdei9wy
	k21yOsP5YJWt1TLJXGobLJ0F6B5ZDQ3Se8NWTPjpGC58QytKk5tvyxbvemZTS8aOREMlqKV/H4D4x
	imLBeMyBEqT8A5orwGsQdbapf6ruLTBHYcNdSFtIRHisPWqK65rvoFRQQefINjQvgB9j/5SQHR7dW
	mZWNcXdSfkCLPC3enWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6GWp-000GwD-TP; Fri, 16 Dec 2022 19:37:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6GWn-000Gtw-A6
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 19:37:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A6E4621F3;
	Fri, 16 Dec 2022 19:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF7A5C433EF;
	Fri, 16 Dec 2022 19:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671219470;
	bh=M1ZYaPESBl8QhjN70S555yU5nbnIzMhYimAaNNoyDlo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jycl+yhJ0nPclDBKuttoXHtIJ/akO51DK2j+udBqmiqwvHYwevm1OHGslbiAcCSiq
	 8tx3pnPyohxd/Z1CLI21rHtvQcP8jTQV9Sa6mT83cdoiNEdRDhJO9Zhsel12Xx9/jN
	 n7sKm2gSSxZDr8gAJPqETQu10Cjo9JVebfu43/IQ1QLA4jkq/edLoi/woHTPSRbo17
	 cCrDa4ZdcdxnnlS5GeXWPJNVHASodlcRmFpTOJ1qsUUBerRZH8AEhB+L0cHM9auac+
	 UG9AYgT7aiY441t9HxCzpX4lRq6AbGzBROL87II7MjwxuiFlstdHYzKEVS1fKOdbPt
	 zTDevQg7+36kg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ADAFBC00445;
	Fri, 16 Dec 2022 19:37:50 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next V6 0/2] riscv: kexec: Fxiup crash_save percpu and
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167121947070.14925.11249878728419640630.git-patchwork-notify@kernel.org>
Date: Fri, 16 Dec 2022 19:37:50 +0000
References: <20221209075513.532249-1-guoren@kernel.org>
In-Reply-To: <20221209075513.532249-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 conor.Dooley@microchip.com, heiko@sntech.de, linux-kernel@vger.kernel.org,
 crash-utility@redhat.com, guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_113753_435529_FFCB3C7A 
X-CRM114-Status: UNSURE (   8.15  )
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

On Fri,  9 Dec 2022 02:55:11 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Current riscv kexec can't crash_save percpu states and disable
> interrupts properly. The series fix them, make crash correct.
> 
> v6:
>  - Fixup checkpatch.pl problems
>  - Remove Fixes tags and make the series as features
> 
> [...]

Here is the summary with links:
  - [-next,V6,1/2] riscv: kexec: EOI active and mask all interrupts in kexec crash path
    https://git.kernel.org/riscv/c/b17d19a5314a
  - [-next,V6,2/2] riscv: kexec: Make crash save multi harts' context
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
