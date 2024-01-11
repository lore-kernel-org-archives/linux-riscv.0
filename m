Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BACC47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=La5yfOf6dlmlMC1tTV57pyYx/EuOdipJ4q8yggcGVac=; b=aVQGymNm6sVWdp
	HQT96IqosGP4VM97cu4Yo/BLuSi0OFYeaWbIMXIX3/Z+gJKUP7sw3gSUkSAgrB83rVnBe3kGQX6sN
	I3reeEVB1Wm+O3jCyzxxR1dh4Tmmwba/Pdrg8D+/UUVgDeb1hrxtWu//MOWc3MCUjCSyPmSuZ9eti
	BtW6uPxgdzlSJHbueSVJXv3hs6Zl5EZVtCACzy3S8pn1SdCokNyGJX+u9Fv5X3JJqtq8qgO25IxPG
	gEc+US2cjZuG9UDQEdSQBoKWBnURQIoadLvpeM5fN4GAYWO5UmSn6D5urBLKOZ9EA6qY7k/xxVMcM
	JJhMK29Bjb/0Wv6b0UpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOJ-000KKL-0y;
	Thu, 11 Jan 2024 14:50:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOF-000KGi-20
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F0B961AF8;
	Thu, 11 Jan 2024 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2BA3C43609;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984638;
	bh=poNz0ZTftVJwt7XbLawzBiVnhFM+TAQwKnLBWaeIY2A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hXwEmxrbdHXjEbjKT9cmMGDMp+soTGur9boVUpX+yeXIiv8b/u8G07PEnaRSiyW8R
	 edIyBL50tFk+tmk7o5ApNztR7sVfp6uPBu1W/3M2OhYjlfSXp3HAq9AG4DICw+c5vg
	 nM4Th8RmkSpe8yPk0RibQysBTzv/dzIqqNAMDZC+mRV37CNFOJFf+EwAuTZ53ZsjW8
	 k68dOyaYeWRvO5J04bjhvjgnBUI/QWE4ngvvRNgFQ6NSY3icogjF+fJOGZAARhYryy
	 E8La/cu6qcGeBEzqFHwyJrTbFJiwtUXHc49IYMH0ac+nTlDwYCxam9b2BLi4abZYQ1
	 OLeNk5edMfekA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CDBA3DFC698;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/5] RISC-V SBI debug console extension support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463783.20080.10723421328706946354.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
In-Reply-To: <20231124070905.1043092-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 conor@kernel.org, ajones@ventanamicro.com, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065039_700638_A6B14596 
X-CRM114-Status: UNSURE (   8.66  )
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

On Fri, 24 Nov 2023 12:39:00 +0530 you wrote:
> The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
> functions sbi_console_putchar() and sbi_console_getchar().
> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)
> 
> This series adds support for SBI debug console (DBCN) extension in
> Linux RISC-V.
> 
> [...]

Here is the summary with links:
  - [v5,1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
    https://git.kernel.org/riscv/c/f503b167b660
  - [v5,2/5] RISC-V: Add SBI debug console helper routines
    https://git.kernel.org/riscv/c/f43fabf444ca
  - [v5,3/5] tty/serial: Add RISC-V SBI debug console based earlycon
    https://git.kernel.org/riscv/c/c77bf3607a0f
  - [v5,4/5] tty: Add SBI debug console support to HVC SBI driver
    https://git.kernel.org/riscv/c/88ead68e764c
  - [v5,5/5] RISC-V: Enable SBI based earlycon support
    https://git.kernel.org/riscv/c/50942ad6ddb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
