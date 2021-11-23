Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEA1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkyJ3FL9gB1m9z89fat/ZGFscXMU2LzO51ED5XbfINo=; b=sV8MTVkm+Ldi6Z
	o/FAyP4BETe3lznQCYQc5rfnjEhgXTox+G9C5f/WdwCjC2RQHPwmdyCUPlruDCORB1waMYbMUH/dJ
	6tDxcV0+jVNnvWQMeP/4eqS8aYkvPHckRTZci2fwUrHiUPumKcTxTERntPyNxSrz+Sa2qVyz8UrSN
	SSVk0+dPAi0TjYxrFa8cXXMxr9xDacmL5oPRMnFMNOvO1hCslinHUVYkQvxeXa9vMAxMUFJprdyOP
	nUHbcYBRpcePUGEmINXQ2Yj7YOXUX96uffRdSqV0NL/zv1A2D/ZefWbKp/ZVnlTjzHQU7C7wFv3ri
	Sq/nPNybkDuiEb+1husQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpbXi-003Jhm-Lw; Tue, 23 Nov 2021 19:33:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpbXf-003Jgu-7q
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 19:33:24 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mpbXb-0001xe-3l; Tue, 23 Nov 2021 20:33:19 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: guoren@kernel.org, anup@brainfault.org, palmer@dabbelt.com,
 atishp@rivosinc.com, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 guoren@kernel.org, philipp.tomsich@vrull.eu
Subject: Re: [RFC PATCH 0/3] riscv: Add riscv.fwsz kernel parameter to save
 memory
Date: Tue, 23 Nov 2021 20:33:18 +0100
Message-ID: <1913356.JkcO0Xq8vV@diego>
In-Reply-To: <20211123015717.542631-1-guoren@kernel.org>
References: <20211123015717.542631-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_113323_319479_679E7223 
X-CRM114-Status: GOOD (  17.81  )
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

Hi Guo,

Am Dienstag, 23. November 2021, 02:57:14 CET schrieb guoren@kernel.org:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The firmware of riscv (such as opensbi) occupy 2MB(64bit) /
> 4MB(32bit) in Linux. It's very wasteful to small memory footprint
> soc chip such as Allwinner D1s/F133. The kernel parameter gives a
> chance to users to set the proper size of the firmware and get
> more than 1.5MB of memory.

is this kernel parameter approach a result of the T-Head Ice-SoC
currently loading its openSBI from inside the main u-boot via extfs-load,
directly before the kernel itself [0] ?

Because that approach in general looks not ideal.

Normally you want the main u-boot already running with less privileges
so firmware like openSBI should've been already loaded before that.
Even more true when you're employing methods to protect memory regions
from less privileged access.

A lot of socs set u-boot as opensbi payload, but for the example the D1
mainline approach uses the Allwinner TOC1 image format to load both
opensbi and the main uboot into memory from its 1st stage loader.


Of course the best way would be to just mimic what a number of
arm64 and also riscv socs do and use already existing u-boot utilities.

U-Boot can create a FIT image containing both main u-boot, dtb and
firmware images that all get loaded from SPL and placed at the correct
addresses before having the SPL jump into opensbi and from there
into u-boot [1] .

And as Anup was writing, reserved-memory should then be the way
to go to tell the kernel what regions to omit.

And mainline u-boot has already the means to even take the reserved-memory
from the devicetree used by opensbi and copy it to a new devicetree,
if the second one is different.


Heiko


[0] https://github.com/T-head-Semi/u-boot/blob/main/include/configs/ice-c910.h#L46
[1] see spl_invoke_opensbi() in common/spl/spl_opensbi.c
[2] see riscv_board_reserved_mem_fixup() in arch/riscv/lib/fdt_fixup.c

> 
> Guo Ren (3):
>   riscv: Remove 2MB offset in the mm layout
>   riscv: Add early_param to decrease firmware region
>   riscv: Add riscv.fwsz kernel parameter
> 
>  .../admin-guide/kernel-parameters.txt         |  3 +++
>  arch/riscv/include/asm/page.h                 |  8 +++++++
>  arch/riscv/kernel/head.S                      | 10 +++-----
>  arch/riscv/kernel/vmlinux.lds.S               |  5 ++--
>  arch/riscv/mm/init.c                          | 23 ++++++++++++++++---
>  5 files changed, 36 insertions(+), 13 deletions(-)
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
