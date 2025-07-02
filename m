Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93152C83038
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=724PMg2wWJMrW6u0TVfn/cGLUq8n2IEHo4iDGZaWScc=; b=uV3iBVeYialnx1
	WQBopgwStCCL6b5bX0ew+s19hz4UcSXX4CuZbP9g9sQIOUzrt5Cp1zuUugQq0CUlXAawkcVvtzUig
	KEwihQxldMp0tGnZLD0Wi6xzgg2tAB5dQuLM/KrpiiEyZjJkEB82gGn4I+e7X6Fj+NNIktp2+5Ozf
	u0QX/HB2LZTGmgJAXsiQJ2q95KVrXv0r6DmtFHxJREE5aZy5x9SamLrsjZg7zS3k8CGURdDDb0RfJ
	upYfMCsVLOEhq9wkZgbjSqypFf3AL1zIVXkOaU8SCDFQnJDS+oovj4/6vA5crc1XLf1Gu9CXgAlKe
	eVBXAzO3XXAd76AZEn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2ux-00000009NSR-45ca;
	Wed, 02 Jul 2025 19:14:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Yy-00000009KJX-0Nqw
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 18:52:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B6B0462A5;
	Wed,  2 Jul 2025 18:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9AFC4CEE7;
	Wed,  2 Jul 2025 18:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482326;
	bh=SGyeQlibR1BxJUiKs8Y3RHmbhvqdYbs9YQezGtbJUF0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h13kiYuqSnh82zieUjhHSdEouxLX44BEeA0ySmnp9JDXpj33nyfp311XK3rf/Fe78
	 /G7oAzfRKSyN6lQpAlvdVxDn0sA0+gb68Tru2my4x9pboDfeNAELEyL1kQdbJChha+
	 6X20edkJsOliLp2herjFfowxsExIy7hsNGbyFsrP2i2PeX7UriHxe5atJNsQ/tM+Fm
	 82woA3Zr+LCMrf3grYKFZurV53ze6a7Vh5FZrtWA659bL3HKJ9mCwSXL5eoo+wbAVz
	 2t+jPW00OGmccSMv7QbZKudlc94xgiq4+AZsXcb8dME4wHl+m61jxEdKErqLyYn8vh
	 ph/TMUH0MUBpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE31383B273;
	Wed,  2 Jul 2025 18:52:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: cpu_ops_sbi: Use static array for boot_data
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175148235075.828808.9774709298630060770.git-patchwork-notify@kernel.org>
Date: Wed, 02 Jul 2025 18:52:30 +0000
References: <20250624-riscv-hsm-boot-data-array-v1-1-50b5eeafbe61@iscas.ac.cn>
In-Reply-To: <20250624-riscv-hsm-boot-data-array-v1-1-50b5eeafbe61@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 alexghiti@rivosinc.com, atishp@rivosinc.com, anup@brainfault.org,
 uwu@dram.page, rabenda.cn@gmail.com, ziyao@disroot.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_115208_149037_728607FC 
X-CRM114-Status: UNSURE (   8.98  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue, 24 Jun 2025 16:04:46 +0800 you wrote:
> Since commit 6b9f29b81b15 ("riscv: Enable pcpu page first chunk
> allocator"), if NUMA is enabled, the page percpu allocator may be used
> on very sparse configurations, or when requested on boot with
> percpu_alloc=page.
> 
> In that case, percpu data gets put in the vmalloc area. However,
> sbi_hsm_hart_start() needs the physical address of a sbi_hart_boot_data,
> and simply assumes that __pa() would work. This causes the just started
> hart to immediately access an invalid address and hang.
> 
> [...]

Here is the summary with links:
  - riscv: cpu_ops_sbi: Use static array for boot_data
    https://git.kernel.org/riscv/c/2b29be967ae4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
