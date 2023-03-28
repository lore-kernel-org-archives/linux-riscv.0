Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5150DC76195
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 06:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgRpwB+QM90+FnO/SYSc5vg83SgKgZm15JsYcs6mVEo=; b=p/9CepA3rqqjwg
	92SCKgo2+hL4m6XxwAtWrpNe6G37EeNRJuDZThW75BkZtxCN1uta6XccgYt1Ig31D6nVPnmC0QYIo
	Dap99vdMp5eO93z2/iT+bDiQ1db+uIXY1cVvZiAGWXU/YtAYbZDdTRqp63oSdyvEHxa2wHulnF0ba
	p6sEFYRLJS6/OpypUtsxpI6AVX2wODWpXcqou1Qu0qWkkFVnz3HY4DGR0qpoXOnEsCXyc3oBmcKub
	hNTy4nTqOgDhJ3bfjmwUIbLcmc8Cdwziv+xSF1bNBURPVYpxrPEIN6C8AtyF+xO0Ka0MjX1foz4YR
	2K6jLG/eGrjuYxUyDl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2xV-00DKmQ-1y;
	Tue, 28 Mar 2023 06:37:29 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2xR-00DKkW-2e
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 06:37:28 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2F37324DBBD;
	Tue, 28 Mar 2023 14:37:13 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 14:37:13 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 14:37:12 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 28 Mar 2023 14:37:12 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH v7 0/4] RISC-V Hibernation Support
Thread-Topic: [PATCH v7 0/4] RISC-V Hibernation Support
Thread-Index: AQHZXUPKO69rRW/KG0+oVGFtmEc2GK8OG1CAgAGl6+A=
Date: Tue, 28 Mar 2023 06:37:12 +0000
Message-ID: <5cf6ed6ca59e4173b6c469aa36510090@EXMBX066.cuchost.com>
References: <20230323045604.536099-1-jeeheng.sia@starfivetech.com>
 <20230327131353.6gzjjppfy2o5456x@orel>
In-Reply-To: <20230327131353.6gzjjppfy2o5456x@orel>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_233726_187697_DC2AAAEA 
X-CRM114-Status: GOOD (  27.61  )
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
> Sent: Monday, March 27, 2023 9:14 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> Subject: Re: [PATCH v7 0/4] RISC-V Hibernation Support
> 
> On Thu, Mar 23, 2023 at 12:56:00PM +0800, Sia Jee Heng wrote:
> > This series adds RISC-V Hibernation/suspend to disk support.
> > Low level Arch functions were created to support hibernation.
> > swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> > cpu state onto the stack, then calling swsusp_save() to save the memory
> > image.
> >
> > Arch specific hibernation header is implemented and is utilized by the
> > arch_hibernation_header_restore() and arch_hibernation_header_save()
> > functions. The arch specific hibernation header consists of satp, hartid,
> > and the cpu_resume address. The kernel built version is also need to be
> > saved into the hibernation image header to making sure only the same
> > kernel is restore when resume.
> >
> > swsusp_arch_resume() creates a temporary page table that covering only
> > the linear map. It copies the restore code to a 'safe' page, then start to
> > restore the memory image. Once completed, it restores the original
> > kernel's page table. It then calls into __hibernate_cpu_resume()
> > to restore the CPU context. Finally, it follows the normal hibernation
> > path back to the hibernation core.
> >
> > To enable hibernation/suspend to disk into RISCV, the below config
> > need to be enabled:
> > - CONFIG_ARCH_HIBERNATION_HEADER
> > - CONFIG_ARCH_HIBERNATION_POSSIBLE
> >
> > At high-level, this series includes the following changes:
> > 1) Change suspend_save_csrs() and suspend_restore_csrs()
> >    to public function as these functions are common to
> >    suspend/hibernation. (patch 1)
> > 2) Refactor the common code in the __cpu_resume_enter() function and
> >    __hibernate_cpu_resume() function. The common code are used by
> >    hibernation and suspend. (patch 2)
> > 3) Enhance kernel_page_present() function to support huge page. (patch 3)
> > 4) Add arch/riscv low level functions to support
> >    hibernation/suspend to disk. (patch 4)
> >
> > The above patches are based on kernel v6.3-rc3 and are tested on
> > StarFive VF2 SBC board and Qemu.
> > ACPI platform mode is not supported in this series.
> >
> 
> I tested this on QEMU, but, FYI, I had to use a raw backing file for
> the swap disk, rather than a qcow2 backing file, otherwise it didn't
> resume. It's probably worth looking into why that is.
Thanks for your time. The raw file format is closer to the actual physical disk. Although I can look into the qcow2 format for QEMU in the near future, it shouldn't be a blocking factor for this patch series to be upstreamed.
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
