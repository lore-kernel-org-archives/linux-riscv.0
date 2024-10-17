Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80291D3C536
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 21:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMyYJ8dCaxILOIrAdI1FdLJTsb5yK6Fn6WKfBTWyar4=; b=vRvxH2DydV2Hk5
	GsoXSqY1TfWw7NosoHs3AGBa0uxX5WeDo4V6q3+z6sXL2jXJJTVOrjZoiffgF58yZnrGcuTWpxdJO
	dU/P9CVugyIwZhgxxflIYg6bjtHQ6MxBIj779et0TwkcEq5xzKOkc6lVUpuxe+IyJLJv0qwQbcwEK
	Ps3JgwV8FAkDrLXIvvLCyEgc5kgofzJp6Ibuet2VTXzdaujbha1kNoP7EwIKZTd7aoKYJaV+HDF1p
	/5PwhhuPfdtGLS0Zx90zDiLTVsD9wFgkAnJjTi4A9KhYnvrMXHrktrciIbiMpNp5zdSqni2Mf62Y3
	MXmI2PNW+piYQLsnfH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1YO3-0000000GHV5-2ZNK;
	Thu, 17 Oct 2024 21:50:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1YO0-0000000GHUV-2FwE
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 21:50:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91E69A4420E;
	Thu, 17 Oct 2024 21:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4154CC4CEC3;
	Thu, 17 Oct 2024 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729201823;
	bh=aeO5mqalDieTy07wPVN1K2wEr9dfLnNXATvctaHt+UY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sQZe+uS33wAnjFiNSuQyi6HRtmK46li8pwEbOkAciHQq+NdyLt7VaVy2kzPpoxJAk
	 WWMQkUe5NCN7QQ1N9Sjh3ijrWSvy7HzTQEjo6f1+WIhT4ehzs3nSmzpPtqaHlWvh5L
	 MCg6HVoStLCSHfe0eWpGNZZr/l4OrxtjgJUi0uHRQot5zaskb/fnRN8FxZ5Nn/560C
	 Bf2Oj2kuuc+8FGAYZopWoMyeq5hiC0eTnCNQexQsGu8eNKOCLFoMiD5o+49yBmuMBj
	 ld+u+6vxIWQs27L6st3aEauJCuIArF1FV2Td6ebrwENy2pUuEmyRofrAPmFn3/Ofrx
	 o79T5JOHbBhug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAECE3809A8A;
	Thu, 17 Oct 2024 21:50:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RESEND. PATCH v2] riscv: Use '%u' to format the output of 'cpu'
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172920182876.2615893.11531053005712444726.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 21:50:28 +0000
References: <4C127DEECDA287C8+20241017032010.96772-1-wangyuli@uniontech.com>
In-Reply-To: <4C127DEECDA287C8+20241017032010.96772-1-wangyuli@uniontech.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, macro@orcam.me.uk,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 anup@brainfault.org, guanwentao@uniontech.com, zhanjun@uniontech.com,
 tglx@linutronix.de, peterz@infradead.org, mikelley@microsoft.com,
 oleksandr@natalenko.name, deller@gmx.de, gpiccoli@igalia.com,
 apatel@ventanamicro.com, maz@kernel.org, kernelfans@gmail.com,
 jszhang@kernel.org, daniel.lezcano@linaro.org, Alistair.Francis@wdc.com,
 atishp@atishpatra.org, dwmw2@infradead.org, mark.rutland@arm.com,
 sabrapan@amazon.com, ross.philipson@oracle.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_145024_663170_F7F48D00 
X-CRM114-Status: UNSURE (   7.37  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 17 Oct 2024 11:20:10 +0800 you wrote:
> 'cpu' is an unsigned integer, so its conversion specifier should
> be %u, not %d.
> 
> Suggested-by: Wentao Guan <guanwentao@uniontech.com>
> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Link: https://lore.kernel.org/all/alpine.DEB.2.21.2409122309090.40372@angie.orcam.me.uk/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [RESEND.,v2] riscv: Use '%u' to format the output of 'cpu'
    https://git.kernel.org/riscv/c/c05ad457ce8c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
