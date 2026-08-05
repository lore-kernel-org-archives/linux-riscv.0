Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1F6C55ABF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 20:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gp6excmdrxrf2p8uDt95r7VfxDCHJUJ4VWSZjmiwIMU=; b=LqgvRL+ozjQRYf
	928ZKA0M2t9TWPzTN8nZKFSGxGJMO4Pa+Yjbh4Sr2Pkj3MM0M+YfoOLa4hxYU6IE7cHZnqxsmYL9T
	XzhENm1B09g1IBuKi9ZvT4Hd5Rh0CgGztJV/TBQ+asrxuZysn3RlIiW5BWu4dv3paQxGNE/Fa2rWZ
	F5tF4pDolP1IRsiyL2+ck3wgPgC0aoQZTcwIIVo4AXO86sdBfVJju8bl/2TMK5lwLz7jsUMnaOGn3
	pBySlKdzNhBAXFQ8pL+zuo9MikY12lSw9AhaR1xhgNWjw3awni3V+pUVhxKedIxedfXulir7gXdt1
	n5tLRIrP7zItdOBlja5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wriZe-00000004Xol-0qmR;
	Wed, 05 Aug 2026 20:50:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wriZc-00000004Xoe-1Vwc
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 20:50:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E756560A5E;
	Wed,  5 Aug 2026 20:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C741F00A3A;
	Wed,  5 Aug 2026 20:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785963046;
	bh=G++DbwSiUfVLHD8mc41VhyTUG03Wep5oKHw2pOGnKgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WncqtGrpdC8Yzn9eLoX3ZVFiSW7ZWrIypm/oqVAUoMefWs1UPjmWxM3x+2zq+J27m
	 QAaJKWgrC+pc4ItCtATBZGIvZZrwpXng00pybpJntvEJYmXvgZ9p7NqjkBqkl5FnTo
	 t/JORJItzPpYup5zcO1wRpN9nr2FCW86cVBBicnkWy+CvOsKU9kTsx27kiOetB41fG
	 PbtwipVRsCwF1w+1w9/1PjF3C4AIHga265v98pk1LTcqGoOKpX8ZLOlrNxMz4ZB4fc
	 emJwqwAHRPoOj+8cf4oJJZFBzvuZ44W1PSubucX148xBnAonhoMTD7TZWc9bk8SWBW
	 AFlV0iC3h0Itw==
Date: Wed, 5 Aug 2026 13:50:44 -0700
From: Drew Fustini <fustini@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 3/8] riscv: Add support for srmcfg CSR from Ssqosid
 extension
Message-ID: <anOiJHmU24Lpbizi@x1>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-3-7c22b05d461b@kernel.org>
 <3b6dd35e-dabb-3cb0-547f-0c8a0b035e1a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b6dd35e-dabb-3cb0-547f-0c8a0b035e1a@kernel.org>
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

On Wed, Aug 05, 2026 at 12:54:42PM -0600, Paul Walmsley wrote:
> Hi,
> 

> On Wed, 29 Jul 2026, Drew Fustini wrote:
> 
> > Add support for the srmcfg CSR defined in the Ssqosid ISA extension.
> > The CSR contains two fields:
> > 
> >   - Resource Control ID (RCID) for resource allocation
> >   - Monitoring Counter ID (MCID) for tracking resource usage
> > 
> > Requests from a hart to shared resources are tagged with these IDs,
> > allowing resource usage to be associated with the running task.
> > 
> > Add a srmcfg field to thread_struct with the same format as the CSR.
> > The context-switch path writes the field to the CSR, and
> > resctrl_arch_set_closid_rmid() updates it when a task is assigned to a
> > resctrl control or monitoring group.
> > 
> > A per-cpu cpu_srmcfg_default holds the default srmcfg for each CPU, set
> > by resctrl_arch_set_cpu_default_closid_rmid() on CPU group assignment.
> > On context switch, RCID and MCID inherit from the CPU default
> > independently: a task whose thread RCID field is zero takes the CPU
> > default's RCID, and likewise for MCID.
> 
> Thanks, queued for v7.3, but with one change (below):
> 
> > diff --git a/arch/riscv/include/asm/qos.h b/arch/riscv/include/asm/qos.h
> > new file mode 100644
> > index 000000000000..cf19e8438bb9
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/qos.h
> > @@ -0,0 +1,74 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_RISCV_QOS_H
> > +#define _ASM_RISCV_QOS_H
> > +
> > +#include <linux/percpu-defs.h>
> > +
> > +#ifdef CONFIG_RISCV_ISA_SSQOSID
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cpufeature.h>
> > +#include <linux/sched.h>
> > +
> > +#include <asm/csr.h>
> > +#include <asm/hwcap.h>
> > +
> > +/* cached value of srmcfg csr for each cpu */
> > +DECLARE_PER_CPU(u32, cpu_srmcfg);
> > +
> > +/* default srmcfg value for each cpu, set via resctrl cpu assignment */
> > +DECLARE_PER_CPU(u32, cpu_srmcfg_default);
> > +
> > +static inline void __switch_to_srmcfg(struct task_struct *next)
> > +{
> > +	u32 thread_srmcfg, default_srmcfg;
> > +
> > +	thread_srmcfg = READ_ONCE(next->thread.srmcfg);
> 
> What is the intent of the READ_ONCE() here?  
> 
> I've dropped it from what's been queued for now.  If it's really 
> needed, please let us know why.
> 
> 
> thanks,
> 
> - Paul

Thanks for queuing this patch. It is okay to leave out the READ_ONCE()
since only Patches 1-3 are being applied.

The READ_ONCE() is meant to pair with the WRITE_ONCE() in
resctrl_arch_set_closid_rmid(), which comes in patch 5. RCID and MCID
share the srmcfg csr, and resctrl can update thread.srmcfg from another
hart while this task is switched in.

Without READ_ONCE(), the compiler may reload the field between the zero
test and the two FIELD_GET() calls, so thread_srmcfg could end up with
RCID from the old value and MCID from the new one. arm64 MPAM uses
READ_ONCE() here for the same reason for mpam_get_regval() in
arch/arm64/include/asm/mpam.h

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
