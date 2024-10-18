Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98831D3E189
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2024 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icfK82KGZlGUqzmoPZymc0YQ9EfzxeaRcO7Ui+GoC5U=; b=C37fm9cPYgxPJI
	Phn2CdnMtmA0MtKgZ61BFdlDuoTid8Lbv+i71bbggEIc7gYFkCr+J2BAUSvBlgLMMlc8vNTioMbWY
	e+6XNMrzimZ86tMu02lcNucb3KzWJe/IhMan45AkiXK96nWQe7eH7lSxMAYoHWfJa2j/k7niNPlGq
	njg++myy4d8Rfh6B8AQyG/FEHIUguQmDVOOHIhni2MMctFpjOe0CKkAkeILtp6kgCitcK7hYiEAIf
	mD96JDpozIS6QTADKbzO1E0nuU8UvYK+9QrpWxUgLrPE/HkVKAjMBbrW7OhoIEvME31SFiGpWhyQ3
	u/RNLh6HYR4bjhtOzbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1stz-00000001qPC-0Ueu;
	Fri, 18 Oct 2024 19:44:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1sg7-00000001nmr-1USb
	for linux-riscv@lists.infradead.org;
	Fri, 18 Oct 2024 19:30:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C728D5C58F2;
	Fri, 18 Oct 2024 19:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5AE6C4CEC3;
	Fri, 18 Oct 2024 19:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729279825;
	bh=p9ULyfH5xSo1quqZ2zJZlf3a0m4okW+HzZ99xgU0074=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Odg0szGui3Hynaz4FDwV1jtwEkU6wtWbbds1g9Gy0SM2rfQnNVglc+3zjONcEHCJh
	 KHQ0kzbZEDJv/cJzV86GtpN1X2j7Ibq/vkUQwB4FJsQNRT+HdhqqbxpQF0dSWKELsN
	 7JWEdskOsIPTDVubkNFlIwniDAo0d1DucnwqUOj9Rfdtt+UtM/pbAbSDT5zPgDk4uN
	 23f9YoHf4i7x00AsR70HryHXOB3RjqUG3rH4jDWniYTq1h1QMPUYAUa0aVR/oHZcnf
	 bU+H7zHfm2W82OX6zMqo6OurdH54AJIk+0o6o7+QCEX0rKrP+nOhuBCvWWfTrdhZ7F
	 SpTpXsL4CR7bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD583805CC0;
	Fri, 18 Oct 2024 19:30:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] cpuidle: riscv-sbi: Allow cpuidle pd used by other
 devices
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172927983117.3213860.9782496340545347046.git-patchwork-notify@kernel.org>
Date: Fri, 18 Oct 2024 19:30:31 +0000
References: <20240814054434.3563453-1-nick.hu@sifive.com>
In-Reply-To: <20240814054434.3563453-1-nick.hu@sifive.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, greentime.hu@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_123027_462777_E5D337A8 
X-CRM114-Status: UNSURE (   8.90  )
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

On Wed, 14 Aug 2024 13:44:32 +0800 you wrote:
> Add this patchset so the devices that inside the cpu/cluster power domain
> can use the cpuidle pd to register the genpd notifier to handle the PM
> when cpu/cluster is going to enter a deeper sleep state.
> 
> Nick Hu (2):
>   cpuidle: riscv-sbi: Move sbi_cpuidle_init to arch_initcall
>   cpuidle: riscv-sbi: Add cpuidle_disabled() check
> 
> [...]

Here is the summary with links:
  - [v2,1/2] cpuidle: riscv-sbi: Move sbi_cpuidle_init to arch_initcall
    https://git.kernel.org/riscv/c/f8a23e3b79d6
  - [v2,2/2] cpuidle: riscv-sbi: Add cpuidle_disabled() check
    https://git.kernel.org/riscv/c/27b4d6aa29ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
