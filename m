Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0C1C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksTQaADMi9pjjfS4RpVCsVEbk0yl18Jz+z/CbyNJS5M=; b=0o0CoovYs2owg5
	BDCVHWQ+TyxU1zusZaBaV+QOIc5772DDvZXFW4BB2lInLx5F3g0jTRBJK69cNwZEdqxh5NYOo1bp5
	1iyBPH+Cuss+GvBNvEmzYj3GJHfqSxLx3ET9DBwOb8wIYruzdwX94LQWuychu2PeJZJ1c5qrFhdAu
	2dEMPWyoBlGYrxACCy0KxSoiBKM9yFDS2zULoB292e0hIgkft+f9ekA+pGO8hE2OzbDgr098ymEP8
	K7YkmikBHVrKtDoEYWV4ffpraA+CC/gqnwqeEaTDCbYGhn32L0J620iRUN2c1FUhMs7lTvlmRjRpX
	kFsVg8wRIxc9RHZpGAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seecW-0000000AhCN-0rV5;
	Thu, 15 Aug 2024 17:50:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seecR-0000000AhAH-2bL5
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 17:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1733861F77;
	Thu, 15 Aug 2024 17:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABEBC4AF12;
	Thu, 15 Aug 2024 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723744238;
	bh=C0K0y8xjMzXiqfZeiuATtXG7MMvO3HdT273gPOXVus8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B9uQsyue+w8drvkYVNc+kk1QuuZQyvILUbUUx8hXvuJibsLuzys36fEfp0kbdmPzE
	 1ayPB/2gwauoydS1ZHIDKNMEXUeyWYLd0tOq4z/WiElszOWrXasWGNZpNT5Bi6BOSM
	 XyF/qqw4o/Uv7TFxvslG7BSbk1yfzibQa2ZP5cdyLzKI6fK6Rf8uKox0mIQfwiYy2t
	 cNzcYlQFtKTp75bpnDkzus3rWVK/ooVqLBiSGt5M3Iq3XURYpKTDFM6xl2guw8Gcv5
	 UlEk3+MkeG9xPaN4Z6YkIYYJ+68K8KC+5Ao+hK7F1iMUf6uJcC6QeYmmd/bt/0Sb6n
	 PrTaPGmcEY/9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 35CE8382327A;
	Thu, 15 Aug 2024 17:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v2] riscv: Fix out-of-bounds when accessing Andes per
 hart vendor extension array
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172374423800.2967007.6789620641826605863.git-patchwork-notify@kernel.org>
Date: Thu, 15 Aug 2024 17:50:38 +0000
References: <20240814192619.276794-1-alexghiti@rivosinc.com>
In-Reply-To: <20240814192619.276794-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, charlie@rivosinc.com,
 andy.chiu@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_105039_732610_287E2296 
X-CRM114-Status: UNSURE (   7.72  )
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

On Wed, 14 Aug 2024 21:26:19 +0200 you wrote:
> The out-of-bounds access is reported by UBSAN:
> 
> [    0.000000] UBSAN: array-index-out-of-bounds in ../arch/riscv/kernel/vendor_extensions.c:41:66
> [    0.000000] index -1 is out of range for type 'riscv_isavendorinfo [32]'
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.11.0-rc2ubuntu-defconfig #2
> [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> [    0.000000] Call Trace:
> [    0.000000] [<ffffffff94e078ba>] dump_backtrace+0x32/0x40
> [    0.000000] [<ffffffff95c83c1a>] show_stack+0x38/0x44
> [    0.000000] [<ffffffff95c94614>] dump_stack_lvl+0x70/0x9c
> [    0.000000] [<ffffffff95c94658>] dump_stack+0x18/0x20
> [    0.000000] [<ffffffff95c8bbb2>] ubsan_epilogue+0x10/0x46
> [    0.000000] [<ffffffff95485a82>] __ubsan_handle_out_of_bounds+0x94/0x9c
> [    0.000000] [<ffffffff94e09442>] __riscv_isa_vendor_extension_available+0x90/0x92
> [    0.000000] [<ffffffff94e043b6>] riscv_cpufeature_patch_func+0xc4/0x148
> [    0.000000] [<ffffffff94e035f8>] _apply_alternatives+0x42/0x50
> [    0.000000] [<ffffffff95e04196>] apply_boot_alternatives+0x3c/0x100
> [    0.000000] [<ffffffff95e05b52>] setup_arch+0x85a/0x8bc
> [    0.000000] [<ffffffff95e00ca0>] start_kernel+0xa4/0xfb6
> 
> [...]

Here is the summary with links:
  - [-fixes,v2] riscv: Fix out-of-bounds when accessing Andes per hart vendor extension array
    https://git.kernel.org/riscv/c/b3f10d9b81e5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
