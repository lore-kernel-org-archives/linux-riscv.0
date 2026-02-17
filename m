Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0E4E9A034
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Feb 2026 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWBwpfbGWykmtLPFIl9n+Fwb/+BU9OkzgPgz/83X5Ps=; b=Aa2LTZmjX5NRhk
	Tuz7a4oKnTjqbzOGpa8gzK6UcmN/sHPGy1qXpOBmTycVEqS8KgD17+aZeQeAB4p+SAffvfBxmEGRn
	SQT7s/3FKCqJ4YY30dBBTGA+pVZkDtQ0dYfh+pZynGnUTpigy3oqDYMAErToxpxdMd0kctsJnRR1a
	Di/VGPSHwcv0w/jhHWBqgx2Mqj65x3GAWdhUizdIouI1a3ewmvq3+VC5BRZcK9X+pRwfNFmW6bIXc
	XO23io9Ix9FdZfybKnl9mXa4p3A8UyuxH5vOew/7m1pUQN2tWLnahJy3NwkhFNr81g8HQm88mT39U
	MuOMFmP8+nm/ptn8T8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPob-00000008ier-0J3K;
	Tue, 17 Feb 2026 18:28:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPoZ-00000008iel-1DlU
	for linux-riscv@lists.infradead.org;
	Tue, 17 Feb 2026 18:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36DFA61858;
	Tue, 17 Feb 2026 18:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0EFC4CEF7;
	Tue, 17 Feb 2026 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771352928;
	bh=6VEW5d7AQFJxxetsXBI84a7st2FxJT4K5c5ALxF0BlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nP4xUFSLToWnOwwa4nhEUkF5sMvpVR7KgCPHfM5ocvrhmdQ2qdKf3rGu6kGOB3j5n
	 hjWBs0euPbe56pJK4oYINPNhuTSnzogVtM8Ms2p3I1NLofyMLPVSxUhkOvC+jxotKy
	 jxBj/EOajDew9rXSQMNdQJ+4+N2VTKnUeOIXFLxsE85z6wkqRFoV7JOYawVsA++mn4
	 FJi0HSs5vAUP/s9og47Tdw7ofCy5jYe1gVjRnQMOntrLbLxMN4h3GeWXiLOB2q0Nfs
	 2YxcjZTtybCIjgtdTL9nBKBT+JbqrbI2SWBbejs8A+ea3hiBTN3hdMoV+d8SAALbhS
	 cwDRpS+QRNn/A==
Date: Tue, 17 Feb 2026 10:28:52 -0800
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Subject: Re: [PATCH RFC v2 05/17] RISC-V: QoS: define CBQRI capacity and
 bandwidth capabilities
Message-ID: <aZSzZChSrjXeZmf1@gen8>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-5-dca586b091b9@kernel.org>
 <3f53c823-74ab-46c3-9cf0-c28b062f2c89@intel.com>
 <aZCh3JaS2V0pLWXm@gen8>
 <0ba158fc-0c44-4b83-b733-9fc00c4d7f3a@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ba158fc-0c44-4b83-b733-9fc00c4d7f3a@intel.com>
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 17, 2026 at 08:32:41AM -0800, Reinette Chatre wrote:
> Hi Drew,
> 
> On 2/14/26 8:25 AM, Drew Fustini wrote:
> > On Fri, Feb 13, 2026 at 03:13:42PM -0800, Reinette Chatre wrote:
> >> Hi Drew,
> > 
> > Hi! Thanks for your detailed feedback on this series.
> > 
> >> On 1/28/26 12:27 PM, Drew Fustini wrote:
> >>> Define data structures to store the capacity and bandwidth capabilities
> >>> that are discovered for a CBQRI-capable controller.
> >>>
> >>> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> >>> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> >>> Signed-off-by: Drew Fustini <fustini@kernel.org>
> >>> ---
> >>>  arch/riscv/kernel/qos/internal.h | 128 +++++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 128 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/kernel/qos/internal.h b/arch/riscv/kernel/qos/internal.h
> >>> new file mode 100644
> >>> index 000000000000..ff2c7eff50be
> >>> --- /dev/null
> >>> +++ b/arch/riscv/kernel/qos/internal.h
> >>> @@ -0,0 +1,128 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +#ifndef _ASM_RISCV_QOS_INTERNAL_H
> >>> +#define _ASM_RISCV_QOS_INTERNAL_H
> >>> +
> >>> +#include <linux/resctrl.h>
> >>
> >> The include caught my eye but I did not notice any additions in this patch
> >> refer to it.
> >>
> >> Reinette
> >>
> > 
> > I was using this to make resctrl structs available in the code that
> > includdes this header:
> > 
> > arch/riscv/kernel/qos/qos.c
> > arch/riscv/kernel/qos/qos_resctrl.c
> 
> I see. The changelog made me believe that this patch defines new data structures
> used by the patches that follow and the inclusion of resctrl.h created expectation
> that some of these new data structures contain resctrl members that I was interested
> in seeing used. If keeping this style then a snippet in changelog that explains the
> header inclusion/organization would be helpful.
>  
> > Should I rearrange to include resctrl.h directly where it is needed?
> I'll defer to the RISC-V folks since I understand that not all subsystems follow/enforce
> rule #1 of Documentation/process/submit-checklist.rst the same (also called "Include
> What You Use (IWYU)") quoted for convenience:
> 
> 	1) If you use a facility then #include the file that defines/declares           
> 	   that facility.  Don't depend on other header files pulling in ones           
> 	   that you use.
> 
> I have worked with code following different customs and personally I do find code
> following IWYU easier to maintain.

Thank you for the explanation. I agree that IWYU makes more sense so
I'll rearrange how I do includes in the series.

BTW, I'm working through all the comments in patch 8. In short, there
are a lot of shortcomings in my current implementation that need to be
fixed and I will explain in my reply how I plan to address them.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
