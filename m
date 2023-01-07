Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76629C54EBE
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 09:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6D6vhBoYF/4p5WlOL26OCtts9DzmOBbklvg2P3FRWA8=; b=fpMerUWIP8LdyU
	P2oKBuBWD8P55oPdtcVuwD1tWY4nLn4rmTqp6BpPtnUkFv4/gsSQ9plwMIxnfA7rmRgi6zbqJgNqQ
	A1wFW+ISEkyVXFZaQRJgZxvf81QKMV+mjrZDdMciJ4b97W71rR3XdIWDWrZa4gK8yEGmRT1dVplNk
	kp62a6eDsKe6uhFd301bszp8GUAIPOXU+Js+xm9NcRD6gHrLHFRCXHLpn0Q86nCmasZtEicuZffWg
	TG8XCDNnYRe6L+6z4w48E8cV6fyN2vadXzzFclgNwjRUOjb0LLBn118j11+oGr0WVPb/CcQD1H0Pl
	lSjMhds7NhQU6Agt65zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE5EP-003lrM-M7; Sat, 07 Jan 2023 09:11:13 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE5EK-003lhk-MI
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 09:11:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8922224E004;
	Sat,  7 Jan 2023 17:10:24 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 7 Jan
 2023 17:10:24 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Sat, 7 Jan 2023 17:10:24 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH 0/3] RISC-V Hibernation Support
Thread-Topic: [PATCH 0/3] RISC-V Hibernation Support
Thread-Index: AQHZIZTqwYypoX0My0ChYWYlFtUmh66Qm80AgAG96pA=
Date: Sat, 7 Jan 2023 09:10:24 +0000
Message-ID: <31b303a394f24b04b3aa81c64be6855f@EXMBX066.cuchost.com>
References: <20230106060535.104321-1-jeeheng.sia@starfivetech.com>
 <E0CEA20A-7D53-4766-AB5D-48A06D7E3991@kernel.org>
In-Reply-To: <E0CEA20A-7D53-4766-AB5D-48A06D7E3991@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.16.6.8]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_011109_062740_A64963C9 
X-CRM114-Status: GOOD (  21.61  )
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
> From: Conor Dooley <conor@kernel.org>
> Sent: Friday, 6 January, 2023 5:38 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; paul.walmsley@sifive.com;
> palmer@dabbelt.com; aou@eecs.berkeley.edu
> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; JeeHeng Sia
> <jeeheng.sia@starfivetech.com>; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>; Mason Huo
> <mason.huo@starfivetech.com>
> Subject: Re: [PATCH 0/3] RISC-V Hibernation Support
> 
> Hey folks,
> Just passing on some issues that automation picked up.
Thanks. Will submit a new patches series to address the issues.
> 
> 
> On 6 January 2023 06:05:32 GMT, Sia Jee Heng
> <jeeheng.sia@starfivetech.com> wrote:
> >This series adds RISC-V Hibernation/suspend to disk support.
> >Low level Arch functions were created to support hibernation.
> >swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> >cpu state onto the stack, then calling swsusp_save() to save the memory
> >image.
> >
> >arch_hibernation_header_restore() and arch_hibernation_header_save()
> >functions are implemented to prevent kernel crash when resume,
> >the kernel built version is saved into the hibernation image header
> >to making sure only the same kernel is restore when resume.
> >
> >swsusp_arch_resume() creates a temporary page table that covering only
> >the linear map, copies the restore code to a 'safe' page, then start to
> >restore the memory image. Once completed, it restores the original
> >kernel's page table. It then calls into __hibernate_cpu_resume()
> >to restore the CPU context. Finally, it follows the normal hibernation
> >path back to the hibernation core.
> >
> >To enable hibernation/suspend to disk into RISCV, the below config
> >need to be enabled:
> >- CONFIG_ARCH_HIBERNATION_HEADER
> >- CONFIG_ARCH_HIBERNATION_POSSIBLE
> >
> >
> >At high-level, this series includes the following changes:
> >1) Change suspend_save_csrs() and suspend_restore_csrs()
> >   to public function as these functions are common to
> >   suspend/hibernation. (patch 1)
> >2) Enhance kernel_page_present() function to support huge page. (patch 2)
> >3) Add arch/riscv low level functions to support
> >   hibernation/suspend to disk. (patch 3)
> >
> >The above patches are based on kernel v6.2-rc2 and are tested on
> >Starfive VF2 SBC board.
> >
> >Sia Jee Heng (3):
> >  RISC-V: Change suspend_save_csrs and suspend_restore_csrs to public
> >    function
> >  RISC-V: mm: Enable huge page support to kernel_page_present() function
> 
> Unfortunately this breaks rv32_defconfig
> https://patchwork.kernel.org/project/linux-
> riscv/patch/20230106060535.104321-3-jeeheng.sia@starfivetech.com/
> 
> >  RISC-V: Add arch functions to support hibernation/suspend-to-disk
> 
> This one then breaks rv64 allmodconfig too :/
> 
> https://patchwork.kernel.org/project/linux-
> riscv/patch/20230106060535.104321-4-jeeheng.sia@starfivetech.com/
> 
> Thanks,
> Conor.
> 
> >
> > arch/riscv/Kconfig                |   7 +
> > arch/riscv/include/asm/suspend.h  |  23 ++
> > arch/riscv/kernel/Makefile        |   2 +-
> > arch/riscv/kernel/asm-offsets.c   |   5 +
> > arch/riscv/kernel/hibernate-asm.S | 123 +++++++++++
> > arch/riscv/kernel/hibernate.c     | 353 ++++++++++++++++++++++++++++++
> > arch/riscv/kernel/suspend.c       |   4 +-
> > arch/riscv/mm/pageattr.c          |   6 +
> > 8 files changed, 520 insertions(+), 3 deletions(-)
> > create mode 100644 arch/riscv/kernel/hibernate-asm.S
> > create mode 100644 arch/riscv/kernel/hibernate.c
> >
> >
> >base-commit: 1f5abbd77e2c1787e74b7c2caffac97def78ba52
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
