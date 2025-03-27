Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFA5C36011
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peiaHrx6t2a+xv8XwfBU708ljU+wSKBrpELRPW7puNw=; b=QuMFkLc/8GQ6Da
	Ekl3W4mfhuppHDzjO78KQg3ndbAo88q6S+t3CsGbrJPITfIlpL16HufQimUSOiyubxRALK39J9yef
	oL8n9b5YE4JREZpmMz4lnpZLOmTubDRGW5OyWDTi6PG5QBZofTKsm6acIjc1gU/t1PzOzC7nQMPWr
	q8vfzEIWLYay5ZmjEFz6pOivbtSDfRlqD445MVCYoYq9j1aOFgT6/YcdQkfe9X6iSqXF6qx0+8/jE
	/DJiXbaoebMYmFUH2ruxJWbi4HgPopGbFKRiY0hVUx0ltdEJGdcGhawf0MyooraHa4OnofiXchmeT
	ixEy0k3ulBJTTLLaCM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf1A-0000000A9zg-3G2Q;
	Thu, 27 Mar 2025 04:39:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdrd-0000000A54D-1GQ4
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Mar 2025 03:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/1U2hv0On2sJK5JyxdKAwrMqnqKjRbnH6wLQ6Q2MAgs=; b=B4ZV+CcDs2iQTeNGACl6OS8oE2
	RJyS+d4kD7fYEJpL/F2tCHDIJBK4kJQn8vBY0dgf/90FY7xUJFAtNbnT5Vej5Y0zI0xJHkgP0xLj+
	U8XvZPTf21QaC1V8VZgkgsBq1Z5q9/mpGfDY14JMPysRLzjAVgEF29ocm75enuNjkwY8gFWA9zDE7
	fXydWCypaagLt0I47xn3e+ABrf/3vAYjZVDn6dm8JZClIgZ38nbzyx93GOsEC9qUbWLb7g4d0uUaK
	Zb0TBF2HGSKDsm74okQqH5DqjXeoukEgb0ANn2EUg+EqtUGVDaemBnf6TUNFGNWJEKoD6i57+1Eiy
	br0hIRww==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdrA-00000005tKY-1vhL
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B5D7A4179E;
	Thu, 27 Mar 2025 03:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3CFC4CEDD;
	Thu, 27 Mar 2025 03:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045872;
	bh=LFo4fJhj7LYS+DWRELXN3oisPqu60X2eAPFXsH5rLOI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IhbjfZ8IjHrBmvECLpZ6xHk1Y+clh+HewujQXnFfg33WXNez44RzBRsy3/z7rDxuG
	 mjxjGHunV5mMb9j7jM5+TTVP902Ku/PJkxo0Vn3Lf2dQrwp+i3hILt6G4ljjOiasWk
	 Syfl67rnti1D1EFbztKIKTr4SoQ0gqICAtGV7/bBEhi4sfEiv3jz/sWTzs5WPy5CAN
	 CqEEstmAVlM8YJXR/aeqAUfOT1pMYBhpYyh5wCw0Lo9McXRoBJpZ1wj/4stZs4mUEE
	 Zl4XHY7PCKPC6tdLSZDzBaEDtJpjjq2pVBsiheyTsDFrlWpOjuCF6TfRwN/OiJdKEG
	 wFU96omzU/i6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC08380AAFD;
	Thu, 27 Mar 2025 03:25:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] Support SSTC while PM operations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304590824.1549280.16399053930975160017.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:08 +0000
References: <20241028033928.223218-1-nick.hu@sifive.com>
In-Reply-To: <20241028033928.223218-1-nick.hu@sifive.com>
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_032437_113641_6D06FBC6 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: aou@eecs.berkeley.edu, zong.li@sifive.com, rafael@kernel.org, linux-pm@vger.kernel.org, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, samuel.holland@sifive.com, conor.dooley@microchip.com, palmer@dabbelt.com, pavel@ucw.cz, paul.walmsley@sifive.com, greentime.hu@sifive.com, linux-riscv@lists.infradead.org, tglx@linutronix.de, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 28 Oct 2024 11:39:24 +0800 you wrote:
> When the cpu is going to be hotplug, stop the stimecmp to prevent pending
> interrupt.
> When the cpu is going to be suspended, save the stimecmp before entering
> the suspend state and restore it in the resume path.
> 
> changes in v3:
> 1. Update the commit description
> 2. Remove csr_read/write_hi_lo from the previous patch
> Link: https://lore.kernel.org/lkml/20240926065422.226518-1-nick.hu@sifive.com/T/
> 
> [...]

Here is the summary with links:
  - [v3,1/2] riscv: Add stimecmp save and restore
    https://git.kernel.org/riscv/c/ffef54ad4110
  - [v3,2/2] clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
