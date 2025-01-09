Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03FBE7719B
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnTjlYrkstmcCvRW30eKNfCIwuYn1jVDvNTsfJOWR7E=; b=fnXGjavT2xZGUe
	SbcaFInYQFOojVqOg1x8yQk/LVDYV1e4YCVXyuO0CVvX9NM7gejuOE0zp14cBofcMQt4mgmUk+POF
	35Mu2ao7IW61y6neiAeH9IB4BcRFHAvO4kxthukqzUCM5IuVGwcoQFBRAXIe+UabJ7TXCF8Jd/V/2
	rV2p+eTHRctn8vOl29lSIBFIbdxPTgU9LOsedOvGotKLgWDjk7yfuedDkVukdlJycKdi2k6BPGS+o
	/3UYmfCynv79CZGBRwn6YTIdLRue8xyBfG4w0JFc+C0Tcld3h4mI7dFbJ+yJdIoLS8GpqgmADxvrN
	Hxq2EBtxt1E9KL8ii/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvD0-0000000CdpD-2bAK;
	Thu, 09 Jan 2025 16:16:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCy-0000000Cdmi-1XNU
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 16:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCD4D5C5C69;
	Thu,  9 Jan 2025 16:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79001C4CED2;
	Thu,  9 Jan 2025 16:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439391;
	bh=U+PB9W4+UsPTNIAE1vKQ2VkLWmxg7Jaqkcu31Y/OYQs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PMn/oGh/BZTZB0N3NeOgBNoh6XWqhb1R/NYyrRRz2Lpy+tH1UYFhvW89iOwuTIMkh
	 UIWWcI0ywZ6mHe8vS1hhWimLDciphU8pREeV2jFFBYoN7m/XaIyay3afI0Ex8saJQw
	 YFEzWN9cnydAHl7CK129MrJ2ECXodFGaIJUHTJ2oaStDcA3bBnvyX8XyXmL2C3O4jr
	 HTYswL5rDQBVjTUB5yP/fKnFrjMVgvnMPwUIjHZaP2cOTa+lqhw+cVLLzn8rGuR22N
	 lA2t9q1mpP0CiBP/aQp/ExKnWQIdbcCjBHKrVt/unAaHfg/meyjoQE0lbBQYR7+8DL
	 BFFFX6bsq6X0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CB8380A97D;
	Thu,  9 Jan 2025 16:16:54 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] cpuidle: riscv-sbi: fix device node release in early
 exit of for_each_possible_cpu
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173643941299.1375203.12210975797046480950.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:16:52 +0000
References: <20241116-cpuidle-riscv-sbi-cleanup-v3-1-a3a46372ce08@gmail.com>
In-Reply-To: <20241116-cpuidle-riscv-sbi-cleanup-v3-1-a3a46372ce08@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, atishp@rivosinc.com, palmer@rivosinc.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081632_441829_05A5D1B4 
X-CRM114-Status: UNSURE (   9.70  )
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

On Sat, 16 Nov 2024 00:32:39 +0100 you wrote:
> The 'np' device_node is initialized via of_cpu_device_node_get(), which
> requires explicit calls to of_node_put() when it is no longer required
> to avoid leaking the resource.
> 
> Instead of adding the missing calls to of_node_put() in all execution
> paths, use the cleanup attribute for 'np' by means of the __free()
> macro, which automatically calls of_node_put() when the variable goes
> out of scope. Given that 'np' is only used within the
> for_each_possible_cpu(), reduce its scope to release the nood after
> every iteration of the loop.
> 
> [...]

Here is the summary with links:
  - [v3] cpuidle: riscv-sbi: fix device node release in early exit of for_each_possible_cpu
    https://git.kernel.org/riscv/c/7e25044b8045

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
