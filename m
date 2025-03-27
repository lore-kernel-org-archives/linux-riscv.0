Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126BCC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXSbl1WsjApoLTwDpElTFRSctM+igY9WI77U0Satu00=; b=dNtgvotIKQJQaM
	K6RpHPjUVeXIfAsS7+8VveuJ835qStCEexwR8cED7r7iCBrGxFzNd6gTsS8t2hC/xaAQI6HV4wopw
	J/ncTS9SqDYMID7mxApeGAM91FATqg3elpw87mMoDrQhLXDkRJw94/l3B2QeoWMYKof4fEQDnX63W
	YwV8snG9t1eQYE5o9DRNpAexKeD0IVwHNeYvdz7UlY+BwlY9lZXWOUIsD26QDTr81thRbCroLp3q4
	nXfwIh3/E45P14EkJzMt1ANIe1TMCmdCXtUvPLmw3eAY+FBhfmQlvA8UNXxVVO4gWfzVcmHs5/x2r
	D6HXuXt8DCXHwRk8oMNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf14-0000000A9ur-3RkD;
	Thu, 27 Mar 2025 04:38:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqw-0000000A4PT-3veZ
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47058A41AA6;
	Thu, 27 Mar 2025 03:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B2DC4CEEA;
	Thu, 27 Mar 2025 03:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045861;
	bh=YtxfKvSWv2/a1oAlKoiwHfzUaB8Ez36lv4AOkIm9qzI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G4aZQfYorl84c7rtvXXeCrzOmQpcx1lxEh7LOWAGryMmz8GUzjWtlRlQg9+qKFbVT
	 rMQGjkH0KqeQ4vqQ07mPh7mnV1LSgNcttx92HBTwhFVKk0K/GrlqUB3qVs3RDQs1/r
	 JXpn4Azp+jgBwCUQkF3KEDnm7p/aZapz2rzytNqSpafGSCZwqHZa/zUJ8J/DVb7uLX
	 Cmz392YazAeoRLijed1VTQ/i6ssahkQ8RnsatM/9hab8/dP9CNDGVuvb8Sgi8BBcr0
	 jAO+0ALvyK8X8YV53DV2Drwr7DW/qtCY/buqAsIPhXXdRyT8SUvxa86b3hbx8pcrgv
	 QFrsc70/eal5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FD1380AAFD;
	Thu, 27 Mar 2025 03:24:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v7 0/3] Enable Zicbom in usermode
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304589800.1549280.3544562224305376378.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:58 +0000
References: <20250226063206.71216-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250226063206.71216-1-cuiyunhui@bytedance.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, ajones@ventanamicro.com,
 alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu,
 charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com,
 conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, samuel.holland@sifive.com, shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202423_085241_7BB6FF6B 
X-CRM114-Status: UNSURE (   6.80  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 26 Feb 2025 14:32:03 +0800 you wrote:
> v1/v2:
> There is only the first patch: RISC-V: Enable cbo.clean/flush in usermode,
> which mainly removes the enabling of cbo.inval in user mode.
> 
> v3:
> Add the functionality of Expose Zicbom and selftests for Zicbom.
> 
> [...]

Here is the summary with links:
  - [v7,1/3] RISC-V: Enable cbo.clean/flush in usermode
    https://git.kernel.org/riscv/c/de70b532f91b
  - [v7,2/3] RISC-V: hwprobe: Expose Zicbom extension and its block size
    https://git.kernel.org/riscv/c/eb1003970940
  - [v7,3/3] RISC-V: selftests: Add TEST_ZICBOM into CBO tests
    https://git.kernel.org/riscv/c/36dec9e44805

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
