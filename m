Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EADC3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 09:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyLP7QYebi7VtHntDGfY/DHul+9z2vp4m0PL3WNXUws=; b=g2wtB6XOnyTgAY
	QLEiPoTEcWRWepsTZPZSJx1aMD6ikjzmDas6+vCRlwvOt3L1ky3s+DCVTkvVIb7zTPMcivxHU7giR
	Ul+45IEb2+gfM1IoZI4sLyuhZZeslPL0FrHbanBfjqwm0DDyscnmYPsaMCo8Rgbi+abyCgmvYv5Bc
	Uzwz7CPYoQKLV7X8m186Ay7tHxQmjBHTkaClM7FHGsN3Q3/By0D82mKjHBNdtki/j/u7VT4QIwXzP
	MxQmwjHThhaEfUsCEnexco1xfupWQAdfQYhvwvBorWhV3Spy+srif3yWSmak0LEYIi0cudwgi+xnZ
	wV1qHghbe2mlEVuz4Uiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDjAl-0078KW-8o; Fri, 06 Jan 2023 09:37:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDjAh-0078Ht-V5
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 09:37:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B03D8B81C4A;
	Fri,  6 Jan 2023 09:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D407EC433D2;
	Fri,  6 Jan 2023 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672997872;
	bh=4Yg7nKp5VKlgMLRQicguVZYUf8Mfxt+W8biYKtmLKNw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=JF2wYRrhOQHlEyYkwne41oBdqiJTi+svDSB5DxIHYLfPVyPbLD/DiSD4HuCsyglXr
	 lxEV+eBQBIUyUf2FfwBbhzvix4xBW4tH763tpGyAIyVZRIsKGKXV+Ajf4+fPIJnbiB
	 F9nlDDkR/OOZ17Jlwev/YQcus3Qhv7eHUm3WqxvfGvHY4/o1TEw08UX/jXYWDus+Ud
	 nrGmh+rbKQF3a4uJIZspp8JrMyPhblxW8WX53R1o5JtnFfz4bxQNPJLJdf40g0BkMP
	 s4I3WyaVpifMXmZ/5xX4lDMA5oMVJB5cQ8xHaBNqoH/Vl178mqEcGk4zUtGaDNVQFu
	 XiW4ONMRj1n7Q==
Date: Fri, 06 Jan 2023 09:37:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jeeheng.sia@starfivetech.com, leyfoon.tan@starfivetech.com,
 mason.huo@starfivetech.com
Subject: Re: [PATCH 0/3] RISC-V Hibernation Support
User-Agent: K-9 Mail for Android
In-Reply-To: <20230106060535.104321-1-jeeheng.sia@starfivetech.com>
References: <20230106060535.104321-1-jeeheng.sia@starfivetech.com>
Message-ID: <E0CEA20A-7D53-4766-AB5D-48A06D7E3991@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_013756_319106_D038E38E 
X-CRM114-Status: GOOD (  15.36  )
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

Hey folks,
Just passing on some issues that automation picked up.


On 6 January 2023 06:05:32 GMT, Sia Jee Heng <jeeheng.sia@starfivetech.com> wrote:
>This series adds RISC-V Hibernation/suspend to disk support.
>Low level Arch functions were created to support hibernation.
>swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
>cpu state onto the stack, then calling swsusp_save() to save the memory
>image.
>
>arch_hibernation_header_restore() and arch_hibernation_header_save()
>functions are implemented to prevent kernel crash when resume,
>the kernel built version is saved into the hibernation image header
>to making sure only the same kernel is restore when resume.
>
>swsusp_arch_resume() creates a temporary page table that covering only
>the linear map, copies the restore code to a 'safe' page, then start to
>restore the memory image. Once completed, it restores the original
>kernel's page table. It then calls into __hibernate_cpu_resume()
>to restore the CPU context. Finally, it follows the normal hibernation
>path back to the hibernation core.
>
>To enable hibernation/suspend to disk into RISCV, the below config
>need to be enabled:
>- CONFIG_ARCH_HIBERNATION_HEADER
>- CONFIG_ARCH_HIBERNATION_POSSIBLE
>
>
>At high-level, this series includes the following changes:
>1) Change suspend_save_csrs() and suspend_restore_csrs()
>   to public function as these functions are common to
>   suspend/hibernation. (patch 1)
>2) Enhance kernel_page_present() function to support huge page. (patch 2)
>3) Add arch/riscv low level functions to support
>   hibernation/suspend to disk. (patch 3)
>
>The above patches are based on kernel v6.2-rc2 and are tested on
>Starfive VF2 SBC board.
>
>Sia Jee Heng (3):
>  RISC-V: Change suspend_save_csrs and suspend_restore_csrs to public
>    function
>  RISC-V: mm: Enable huge page support to kernel_page_present() function

Unfortunately this breaks rv32_defconfig
https://patchwork.kernel.org/project/linux-riscv/patch/20230106060535.104321-3-jeeheng.sia@starfivetech.com/

>  RISC-V: Add arch functions to support hibernation/suspend-to-disk

This one then breaks rv64 allmodconfig too :/

https://patchwork.kernel.org/project/linux-riscv/patch/20230106060535.104321-4-jeeheng.sia@starfivetech.com/

Thanks,
Conor.

>
> arch/riscv/Kconfig                |   7 +
> arch/riscv/include/asm/suspend.h  |  23 ++
> arch/riscv/kernel/Makefile        |   2 +-
> arch/riscv/kernel/asm-offsets.c   |   5 +
> arch/riscv/kernel/hibernate-asm.S | 123 +++++++++++
> arch/riscv/kernel/hibernate.c     | 353 ++++++++++++++++++++++++++++++
> arch/riscv/kernel/suspend.c       |   4 +-
> arch/riscv/mm/pageattr.c          |   6 +
> 8 files changed, 520 insertions(+), 3 deletions(-)
> create mode 100644 arch/riscv/kernel/hibernate-asm.S
> create mode 100644 arch/riscv/kernel/hibernate.c
>
>
>base-commit: 1f5abbd77e2c1787e74b7c2caffac97def78ba52

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
