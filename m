Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511C7CD11DF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 21:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhnxFfSFPLkynWwRHOj0uKzE7f0Av3rL8RaAg0NrYwM=; b=KHL8L15y3K0gyT
	XjXN2297qXg4/+Nw5VvHR3MetbCqxW2k3D+zrswSLSCc2URdc6WObOs4i6KGGVfGM0/T9UxcGwThw
	IaWVjKPug/3cR8bOICz9txzdzI+vGdmpMwanXi7z5hGrAzqjBwLaHGnmRCbsYjb14ehlOw8EZeS2+
	7o71sKg3RcsDWjTsRa2Fewjj3DNgQQZVxE+VC3jtWIru/qm6aN7ZlOQwFEeBt2YVlTfrXidiKA+Fw
	i8eDVTz9DpgeUl/EAGTPG7apzuZUikQ/FQWd6BExBe+0v4Oq0GYR1efFW0pLMWIR6zA+uAHafQSGn
	9pqi+Fa6Cx1Z4DMXjzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpE42-00000006V3U-3AVk;
	Tue, 26 Mar 2024 21:10:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpE40-00000006V2G-0auI
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 21:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D85F46144B;
	Tue, 26 Mar 2024 21:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CF0BC43399;
	Tue, 26 Mar 2024 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711487429;
	bh=SboH/0hyVW3B3ksnsDhHW9j/7t4aFvMtUDl7w8vJNLY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NRScKgcTknA+A3TXBJHEmBkorPQ7Am9bUTOF0MfmYbKYjUy/j00JAypltFGB1Gf08
	 9gPMk+PyGlynA19kHDVdvpsDdwTVY4kTdRYpUumezsrkpm+GzK+vYqdL40OH9IoUw5
	 muxR1DyU6isBhVQM6KM8kI7bquofImO8heLVkixaCOEAV7Tpg4N7nv14MVSx15y4XM
	 zRx6RrNb5KXbnc+V8WS2Xklzyev2oHQ/MTpcTsgqbP+JdUo+n4JkkLTWRp3ZHCJ4+W
	 aYJSKmNjWv94HS2kqjbbep6Xi3G7xhRDbT7NVXQZDjMfpl+LyjPLqt6VjYqYACYu6X
	 mUTlt55qEJn3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D929D95062;
	Tue, 26 Mar 2024 21:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: mm: Fix prototype to avoid discarding const
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171148742944.11448.2500869883007069793.git-patchwork-notify@kernel.org>
Date: Tue, 26 Mar 2024 21:10:29 +0000
References: <20240301201837.2826172-1-samuel.holland@sifive.com>
In-Reply-To: <20240301201837.2826172-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 alexghiti@rivosinc.com, ajones@ventanamicro.com, apatel@ventanamicro.com,
 dylan@andestech.com, jszhang@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, sergey.matyukevich@syntacore.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_141032_257347_5378483B 
X-CRM114-Status: UNSURE (   7.81  )
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

On Fri,  1 Mar 2024 12:18:32 -0800 you wrote:
> __flush_tlb_range() does not modify the provided cpumask, so its cmask
> parameter can be pointer-to-const. This avoids the unsafe cast of
> cpu_online_mask.
> 
> Fixes: 54d7431af73e ("riscv: Add support for BATCHED_UNMAP_TLB_FLUSH")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - riscv: mm: Fix prototype to avoid discarding const
    https://git.kernel.org/riscv/c/674bc0168e6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
