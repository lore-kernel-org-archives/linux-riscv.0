Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ED4CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsBdVP8Er2BY3uVwcfQK2f956DE3LU6xu98LkT2sR9E=; b=3u0ylEGK45oCoI
	jfRmRNboB/dv+JZKDrYrIc1LqUz4kL9BGCLNyoWSQTqhjDrwzEn7RwhIqgBr+STYarclmdqspB1e4
	+rst6I6VBwG6ryRbWddBhkMG3/QW/J7ArNmNOJbziC0F0QdR+oV7dOAwDWb84btOflCsx9/I/RcbV
	he/ojlhZcPGebhxzwaf6Pi3hl5m+/zLVv9by63abS0g1Dc+QZGknYn6o9TFeqvVnmtBF8sJ5Sdum+
	4C72/8/55x/JRQFcK+a8kUfx8fXKBncbp+RpzImEf8ZFRCNnhI2bSQ16ks7jZd6QiPSyZmV3PVFyi
	LG+uHZUfZUw3A9C+Zoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkue-001ZCz-1o;
	Fri, 20 Oct 2023 08:31:20 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkua-001ZAz-2O;
	Fri, 20 Oct 2023 08:31:19 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39K8UpJf015318;
	Fri, 20 Oct 2023 16:30:51 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Fri, 20 Oct 2023 16:30:49 +0800
Date: Fri, 20 Oct 2023 16:30:46 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [RFC PATCH v2 08/10] perf: RISC-V: Introduce Andes PMU for perf
 event sampling
Message-ID: <ZTI6k00Z1la8EmtR@APC323>
References: <20231019140156.3660000-1-peterlin@andestech.com>
 <20231019-daybed-preschool-8663d5a86798@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231019-daybed-preschool-8663d5a86798@spud>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39K8UpJf015318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_013117_215318_F25B80A0 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: mark.rutland@arm.com, heiko@sntech.de, atishp@atishpatra.org, conor.dooley@microchip.com, jszhang@kernel.org, linux-riscv@lists.infradead.org, will@kernel.org, anup@brainfault.org, dminus@andestech.com, dylan@andestech.com, ajones@ventanamicro.com, aou@eecs.berkeley.edu, locus84@andestech.com, prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com, paul.walmsley@sifive.com, linux-arm-kernel@lists.infradead.org, Leo
 Yu-Chi Liang <ycliang@andestech.com>, linux-kernel@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On Thu, Oct 19, 2023 at 05:02:18PM +0100, Conor Dooley wrote:
> On Thu, Oct 19, 2023 at 10:01:56PM +0800, Yu Chien Peter Lin wrote:
> > The Andes PMU extension provides the same mechanism as Sscofpmf,
> > allowing us to reuse the SBI PMU driver to support event sampling
> > and mode filtering.
> > 
> > To make use of this custom PMU extension, "xandespmu" needs
> > to be appended to the riscv,isa-extensions for each cpu node
> > in device-tree, and enable CONFIG_ANDES_CUSTOM_PMU.
> > 
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> > Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> > Co-developed-by: Locus Wei-Han Chen <locus84@andestech.com>
> > Signed-off-by: Locus Wei-Han Chen <locus84@andestech.com>
> > ---
> > Changes v1 -> v2:
> >   - New patch
> > ---
> >  arch/riscv/include/asm/hwcap.h |  1 +
> >  arch/riscv/kernel/cpufeature.c |  1 +
> >  drivers/perf/Kconfig           | 14 ++++++++++++++
> >  drivers/perf/riscv_pmu_sbi.c   | 35 +++++++++++++++++++++++++++++-----
> >  4 files changed, 46 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index d3082391c901..eecfe95d5050 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -59,6 +59,7 @@
> >  #define RISCV_ISA_EXT_ZIFENCEI		41
> >  #define RISCV_ISA_EXT_ZIHPM		42
> >  #define RISCV_ISA_EXT_XTHEADPMU		43
> > +#define RISCV_ISA_EXT_XANDESPMU		44
> >  
> >  #define RISCV_ISA_EXT_MAX		64
> >  
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 4a3fb017026c..a8e71c6dfb3e 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -182,6 +182,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >  	__RISCV_ISA_EXT_DATA(xtheadpmu, RISCV_ISA_EXT_XTHEADPMU),
> > +	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
> 
> This does not following the ordering convention (see the comment above
> this datastructure) and is not documented in the dt-binding AFAICT.

OK, will insert the xandespmu here.

Thanks,
Peter Lin

> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
