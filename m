Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF36C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eD0mGqI7XsfbwlHa1z+mQ35/uU9RE5ZTAvxYpV1au1g=; b=LtQhIUyhJukuSA
	yPF9W15pY32Wf4sOpc1JpnfPnIQD4RzOP5ZCHiZdIup3T2Xd2yJ6MohU3pLiiaGn96Nqay3Oc32Am
	6AdiXp8GB1wLO5LzZx0ppnm49OYYXEsjj+HiHzeIoqef5SeJxs/d2H0Gde9EOq4uZec3Q0lXfMSnS
	RkLbl5IDFH60mgMphvsmHOOJhKGL61DVhQq+tvNBS+NMpEQ4oF0C1li1uBOthGu01n4qNdyEu3CUJ
	Bta3PCRu6oGWFspbKZZzZSwLxU7buP2tUFYxazJoJpX+Vr7c9SmBIuinXsXVLidcgxkx1idpvmmzN
	9Rtk1FAnZ/DD/gSpMtVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7Ix-000000020R6-2juz;
	Thu, 25 Jan 2024 21:30:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7Is-000000020NZ-40DQ
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 21:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC25362320;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E8EDC43394;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706218229;
	bh=+MxR9NaWaOppxz1CebUGCA3UGwUCCpm+2/tjFMQvNwY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fEmX87PLzrdwWTQWwpSjg37S+uSvU5viqmA3eY4LAPTBEKTn8Vy5Xm6i+fPIO1+Uh
	 698K8Ka5acpgEBwfIC7w2+8OWBKMWs1J2ck0ocGIMrQDiA73js8KC1HeezbpNt7q9W
	 u7gN1weUog8LWrOEfMzYUYWvJFT2tKV3WxwK9lYofwX9hCpwXpjzPaSXEKuYEsKbcm
	 zM5beLowdfluCqT2cPW34KIBG4e2OAih7VZarzFfBh/ZKt+NC0mKRGjxDUwGkKBgo4
	 AO4wsAGtx9tP1nuVXiK9Zo4lTwmSmUf/GcXZGrrcNd4H/t9sX9zd3qTOrOVC0TO9LS
	 dfyXIqSe5s+kg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 36D8ED8C966;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: blacklist assembly symbols for kprobe
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170621822922.6239.4505416696182414411.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 21:30:29 +0000
References: <20231004131009.409193-1-cleger@rivosinc.com>
In-Reply-To: <20231004131009.409193-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_133031_075237_FCA694A7 
X-CRM114-Status: UNSURE (   7.36  )
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

On Wed,  4 Oct 2023 15:10:09 +0200 you wrote:
> Adding kprobes on some assembly functions (mainly exception handling)
> will result in crashes (either recursive trap or panic). To avoid such
> errors, add ASM_NOKPROBE() macro which allow adding specific symbols
> into the __kprobe_blacklist section and use to blacklist the following
> symbols that showed to be problematic:
> - handle_exception()
> - ret_from_exception()
> - handle_kernel_stack_overflow()
> 
> [...]

Here is the summary with links:
  - riscv: blacklist assembly symbols for kprobe
    https://git.kernel.org/riscv/c/5014396af9bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
