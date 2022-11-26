Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17B9C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 18:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wP0g62Kj39nf8ShRWFmh0sZAaBPSSsWOTlG5QIqgNO0=; b=Zmi+aLWg7YypyG
	dRbnGMxISmttd07yBrth86mGWdiijKxtfa+xvSSTCVNWxqwbeKbWtvheUvR2mckgY4RZVQKX2EkW2
	xyeTj6R7AlAfRFJsgU5UNb2ps5MR38ZFK/G1HRfsCG/BVNVhrCepK1fO8Jsp5CRNCOJdwXgvXWjtw
	2jtODzeiEW0flhGlpx+COLYLBrrdxgE/Q8YAGEbamgjEiUYXF00NfM38JhKOk0NCcTs0mOsA/HyGH
	1fVWBjnnWs8cYY6a/q2bpdNiIWPPFeAYd815zgblgydWIdtSVjGcWgNRjPZ4jSSvsn60wpzIGSfFY
	YqNox2hsnhx2FjvSDHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz0Bw-007oYN-H9; Sat, 26 Nov 2022 18:46:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz0Bt-007oXG-Ta
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 18:46:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 30CD6B80932;
	Sat, 26 Nov 2022 18:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521ACC433D6;
	Sat, 26 Nov 2022 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669488369;
	bh=uWdFFAXg78nudNnPJUDiXEmEVy6V5aBDdLZwo3yon44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6dR+XFLq9Qto5l1h0WDJat2H97M7zodpyqFs4JjoT8cwVtyWSkP7RH7FruhnaYWl
	 MfmF/x46qUZxhUMBdK7p3v8QZi2SqjfQ9FFqiCnvz3nSJP7Xzl0ztMy3ok/rc7T1B7
	 E7aDsFzzIrJTXYRWjhazFczbAWBSV51qS1Ct2hQxdMZ9AFiFpNTOX9YnHD8TjNzgPb
	 Tm2Smbj+mseRAkPCSzZv2/4zY1mFk6lZQRaw+sHCYCflcAQdHEqJvSZJIV+of1yzRy
	 eKLOioMDdMnu02v2h/T9Hpnrib5FyUVvi+d+S132qheihkutra5XN7v2NjSp8sGTEt
	 JlOeutqwQReMQ==
Date: Sat, 26 Nov 2022 18:46:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: increase boot command line size to 1K
Message-ID: <Y4Je7chN+fQM3NpP@spud>
References: <20221125133713.314796-1-andrea.righi@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125133713.314796-1-andrea.righi@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_104618_277763_393ED238 
X-CRM114-Status: GOOD (  18.67  )
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

Hey Andrea,

On Fri, Nov 25, 2022 at 02:37:13PM +0100, Andrea Righi wrote:
> Kernel parameters string is limited to 512 characters on riscv (using
> the default from include/uapi/asm-generic/setup.h).
> 
> In some testing environments (e.g., qemu with long kernel parameters
> string) we may exceed this limit, triggering errors like the following:
> 
> [    3.331893] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
> [    3.332625] CPU: 2 PID: 1 Comm: sh Not tainted 6.1.0-rc6-kc #1
> [    3.333233] Hardware name: riscv-virtio,qemu (DT)
> [    3.333550] Call Trace:
> [    3.333736] [<ffffffff800062b6>] dump_backtrace+0x1c/0x24
> [    3.334053] [<ffffffff806e8f54>] show_stack+0x2c/0x38
> [    3.334260] [<ffffffff806f2d06>] dump_stack_lvl+0x5a/0x7c
> [    3.334483] [<ffffffff806f2d3c>] dump_stack+0x14/0x1c
> [    3.334687] [<ffffffff806e92fa>] panic+0x116/0x2d0
> [    3.334878] [<ffffffff8001b0aa>] do_exit+0x80a/0x810
> [    3.335079] [<ffffffff8001b1d0>] do_group_exit+0x24/0x70
> [    3.335287] [<ffffffff8001b234>] __wake_up_parent+0x0/0x20
> [    3.335502] [<ffffffff80003cee>] ret_from_syscall+0x0/0x2
> [    3.335857] SMP: stopping secondary CPUs
> [    3.337561] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---
> 
> It seems reasonable enough to increase the default command line size to
> 1024, like arm, to prevent issues like the one reported above.

error: arch/riscv/include/uapi/asm/setup.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier

Unfortunately this does not build :/

Thanks,
Conor.

> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> ---
>  arch/riscv/include/asm/setup.h      | 7 +++++++
>  arch/riscv/include/uapi/asm/setup.h | 7 +++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 arch/riscv/include/asm/setup.h
>  create mode 100644 arch/riscv/include/uapi/asm/setup.h
> 
> diff --git a/arch/riscv/include/asm/setup.h b/arch/riscv/include/asm/setup.h
> new file mode 100644
> index 000000000000..f4fe549aab40
> --- /dev/null
> +++ b/arch/riscv/include/asm/setup.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASMRISCV_SETUP_H
> +#define __ASMRISCV_SETUP_H
> +
> +#include <uapi/asm/setup.h>
> +
> +#endif /* __ASMRISCV_SETUP_H */
> diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
> new file mode 100644
> index 000000000000..5738f93ae437
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/setup.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _UAPI__ASMRISCV_SETUP_H
> +#define _UAPI__ASMRISCV_SETUP_H
> +
> +#define COMMAND_LINE_SIZE 1024
> +
> +#endif /* _UAPI__ASMRISCV_SETUP_H */
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
