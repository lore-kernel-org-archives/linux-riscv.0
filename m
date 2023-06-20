Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEDFC001B3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 01:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qno4IucF6VwCkNYdeV+HW5Rw3gcNGpdxEyv8kvZGgjc=; b=2TDtkm8IdMbOwv
	YgQJ34RYzItIkY5GzPRe31VbzyGxj52jMrnk9QF6chh66eDLFH/c4Wc0wKYK03YYjhjHLKC3rNDs+
	o/lqIXyGPeQxh404xZGWuek8sAc86rIcuD9zMQLKkegVzlEiwhNKbqpeThS3Or+b91390VKSc+9/B
	f2umqqTwHE4P7jbKUR/d+gMBPZMcuCdJ0CYQnyVfW1iZhx6/+AqTluqPkLuONeceNgps7gsNZD+IQ
	lXayE/mx1uqCsc5JE2Q8htPL3mkU1z+Grc6rF+EhCKd1gpD5uQJXGO3IHCeQRB1aFH63nnAuhT+F6
	zkPPacPp/hmv8ZI6Arww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjX-009pba-2c;
	Tue, 20 Jun 2023 01:00:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjT-009pVg-0p
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 01:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2909960F73;
	Tue, 20 Jun 2023 01:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F9A2C433D9;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687222824;
	bh=rgd+2GOkx8HY1HKHn2hW8zy4YcZb3qf4ph7Yocru+IA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bKMOYFic/3xM/FUmSZtY7RlpDVAZwbqlp/SfU6+AZn6e9bMA1INjDxGw8CrVlFAtc
	 l0p51ybeih6chsdTJdcJcbIZ97Nhw6OUnj6yiDqrBPg+8hjPbJMStQOkSQkWOfQgYQ
	 fPkCs68yl3qnHzXUkt9SDb0549eO4VBunUDjF3UYIaEui071TGbnyROkz21+VNCt2O
	 5z262fTiHiXJseBb7NXF+95486JR/EXX0ezRc6RUNPL2VDOWJVWXsFwwzTxnSyIVZ8
	 t/3u4OOmJ1TG1LLOaXpF8DBGzW8jDGpfL5QzTLvanet9BsXQhXBx02m1EII+/mF/tR
	 wdj5k2wa10s9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0330AE1B4F2;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: say disabling zicbom if no or bad
 riscv,cbom-block-size found
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168722282400.22807.3785014894585865454.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 01:00:24 +0000
References: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_180031_374621_D6DB91B4 
X-CRM114-Status: UNSURE (   9.91  )
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

On Fri, 17 Mar 2023 13:45:12 +0000 you wrote:
> If Zicbom is present but there was no riscv,cbom-blocks-size property found
> during the cpu feeatures probe, or the cbom-block-size is not valid, then
> the extension will be disabled. Make the print explicitly say this is
> disabled to ensure that there is no confusion about what is being done.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> [...]

Here is the summary with links:
  - riscv: say disabling zicbom if no or bad riscv,cbom-block-size found
    https://git.kernel.org/riscv/c/c818fea83de4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
