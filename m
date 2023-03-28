Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E4DC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 06:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gst5t720F8X4Weg3GPjT8bkJSOUbcV1lktI2DAH+T6w=; b=HanmX/KfAxtNgv
	Sr0cKTrpUy5hp3TfEbL0xa8I4f0Rsx1ZswcVx37Qojvd5+6mr96FecMD5xJ2K+XDfMergACxvf3Qq
	K9VYfQfd+oUhHjqX8Idg8tGZJMip1ssPM3Z+V29Q6NOx6az7jpj9A9EinVdoU2m0j9QJvTQtTT7yH
	aRiTtu01dNoOer/XvB9KqQn3wAW3pLBqyQUdAt2cSrS4DagyEHKDBCmoF1PqW2klI/3bVf7kHHVG9
	CQPIfUCVHp+yap/a/mCj1CWY9ti4qzjsQJN+2b8vBDJU+aIQxBJLW2B3v4FTXlzZzMsP4cGb7fkry
	MSrV1OfCVVmo/dWkPmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2l7-00DJJ5-2f;
	Tue, 28 Mar 2023 06:24:41 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2l4-00DJF1-1p
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 06:24:40 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6E9D024E2F2;
	Tue, 28 Mar 2023 14:23:52 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 14:23:52 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 14:23:51 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 28 Mar 2023 14:23:51 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v7 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Topic: [PATCH v7 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Index: AQHZXUPUmSFyHAHJnEaKAA/P9UfMX68OGliAgAADeoCAAaM50A==
Date: Tue, 28 Mar 2023 06:23:51 +0000
Message-ID: <c6e4a3cb42044c07b1ec37b76ea6596d@EXMBX066.cuchost.com>
References: <20230323045604.536099-1-jeeheng.sia@starfivetech.com>
 <20230323045604.536099-5-jeeheng.sia@starfivetech.com>
 <20230327131025.6bawvoti65sth4rk@orel> <20230327132251.dejgmcpxjdrqzmvk@orel>
In-Reply-To: <20230327132251.dejgmcpxjdrqzmvk@orel>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_232438_951442_08FB5CDE 
X-CRM114-Status: GOOD (  26.48  )
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



> -----Original Message-----
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Monday, March 27, 2023 9:23 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>; Conor Dooley
> <conor.dooley@microchip.com>
> Subject: Re: [PATCH v7 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> 
> On Mon, Mar 27, 2023 at 03:10:25PM +0200, Andrew Jones wrote:
> > On Thu, Mar 23, 2023 at 12:56:04PM +0800, Sia Jee Heng wrote:
> > > Low level Arch functions were created to support hibernation.
> > > swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> > > cpu state onto the stack, then calling swsusp_save() to save the memory
> > > image.
> > >
> > > Arch specific hibernation header is implemented and is utilized by the
> > > arch_hibernation_header_restore() and arch_hibernation_header_save()
> > > functions. The arch specific hibernation header consists of satp, hartid,
> > > and the cpu_resume address. The kernel built version is also need to be
> > > saved into the hibernation image header to making sure only the same
> > > kernel is restore when resume.
> > >
> > > swsusp_arch_resume() creates a temporary page table that covering only
> > > the linear map. It copies the restore code to a 'safe' page, then start
> > > to restore the memory image. Once completed, it restores the original
> > > kernel's page table. It then calls into __hibernate_cpu_resume()
> > > to restore the CPU context. Finally, it follows the normal hibernation
> > > path back to the hibernation core.
> > >
> > > To enable hibernation/suspend to disk into RISCV, the below config
> > > need to be enabled:
> > > - CONFIG_ARCH_HIBERNATION_HEADER
> > > - CONFIG_ARCH_HIBERNATION_POSSIBLE
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  arch/riscv/Kconfig                 |   6 +
> > >  arch/riscv/include/asm/assembler.h |  20 ++
> > >  arch/riscv/include/asm/suspend.h   |  19 ++
> > >  arch/riscv/kernel/Makefile         |   1 +
> > >  arch/riscv/kernel/asm-offsets.c    |   5 +
> > >  arch/riscv/kernel/hibernate-asm.S  |  77 ++++++
> > >  arch/riscv/kernel/hibernate.c      | 427 +++++++++++++++++++++++++++++
> > >  7 files changed, 555 insertions(+)
> > >  create mode 100644 arch/riscv/kernel/hibernate-asm.S
> > >  create mode 100644 arch/riscv/kernel/hibernate.c
> > >
> >
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Actually, I forgot to point out something. As hibernation depends on
> suspend.c for save/restore_csrs, we need something like
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 73cca7f17f6f..f1d2289df660 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -54,7 +54,7 @@ config RISCV
>         select CLINT_TIMER if !MMU
>         select CLONE_BACKWARDS
>         select COMMON_CLK
> -       select CPU_PM if CPU_IDLE
> +       select CPU_PM if CPU_IDLE || HIBERNATION
Sure. Will add it
>         select EDAC_SUPPORT
>         select GENERIC_ARCH_TOPOLOGY
>         select GENERIC_ATOMIC64 if !64BIT
> 
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
