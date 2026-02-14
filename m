Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9531EF5849
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 16:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zf0UJZ69/BUmc5ho/JqRZJDZqW5/F0770bshOlyaGSk=; b=ajsiHRmtWrFF1M
	nc6pvY4RzBSKTL4OkOHGeTSDFz7ZO9CIveFtLLS9sxUtoSVdnDYQHFkMXM6d4m85wGu6rmkE9Akve
	GFuIsnLZ6rpEZsM3LQBYv7v5f2dn8+a/dJw1E2RxC5xsqXPJygnzEGQ6DXt/IVRlH7meiW9bmnGww
	X4wj7jJ5GcmE37CIdotFknoVGSQ4sua0/3IT6bketb3tHu6+/+WoPOULHcxMRGyg+q5fR2JYTcEu5
	WBDH+oAMrZWHO5Cv/2mTfh4AgssAHy2fR2yyOQo5irp+4pBcVjdx1JmPGPwY8sVzYZ31S1gFEcJzw
	hYWkLt3apw6689t6Yrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrIRw-00000004kQ8-1Lde;
	Sat, 14 Feb 2026 16:24:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrIRt-00000004kPo-3cKz
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 16:24:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56E3643F29;
	Sat, 14 Feb 2026 16:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FEDC16AAE;
	Sat, 14 Feb 2026 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771086288;
	bh=b2fAA/6LiIRnE5uC+fyY6XY1BAVSpPQMAo5szwC5qS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSuljZt07B+CaREOkzyeuVoDOVGRuiv8ypd6iBLKVG+gQRSOVdFo72/dlOAoX5Q8q
	 y8kx1kuEZSLtIfmVo6RPrr68Jk5UXObQXEXY2Rnc33INnOp/SnY9TEZcmObRlTHrXW
	 Nar/oSM3CsWXW+wSyyMfEsZy2hKnDgoj1TU0Xj7Uy2iCdkjWrpLPK1qbVRtRRo5iLW
	 OzSqFr8wRvf6Fw1pfHGKuCqlTDdD5QT3xz1YTFw9tu7UCmbSmn8xkSLiRNUEEty4RF
	 2kG4YNYTx/YvKPad++FCYm+7BcLi3BZQ2Ddf3naU+PFffzJG/GhFlgzEovIKnRAOZS
	 USVUhvBHe+BGg==
Date: Sat, 14 Feb 2026 08:25:00 -0800
From: Drew Fustini <fustini@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Subject: Re: [PATCH RFC v2 05/17] RISC-V: QoS: define CBQRI capacity and
 bandwidth capabilities
Message-ID: <aZCh3JaS2V0pLWXm@gen8>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-5-dca586b091b9@kernel.org>
 <3f53c823-74ab-46c3-9cf0-c28b062f2c89@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f53c823-74ab-46c3-9cf0-c28b062f2c89@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_082449_963376_9223B24F 
X-CRM114-Status: GOOD (  17.96  )
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

On Fri, Feb 13, 2026 at 03:13:42PM -0800, Reinette Chatre wrote:
> Hi Drew,

Hi! Thanks for your detailed feedback on this series.

> On 1/28/26 12:27 PM, Drew Fustini wrote:
> > Define data structures to store the capacity and bandwidth capabilities
> > that are discovered for a CBQRI-capable controller.
> > 
> > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > ---
> >  arch/riscv/kernel/qos/internal.h | 128 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 128 insertions(+)
> > 
> > diff --git a/arch/riscv/kernel/qos/internal.h b/arch/riscv/kernel/qos/internal.h
> > new file mode 100644
> > index 000000000000..ff2c7eff50be
> > --- /dev/null
> > +++ b/arch/riscv/kernel/qos/internal.h
> > @@ -0,0 +1,128 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef _ASM_RISCV_QOS_INTERNAL_H
> > +#define _ASM_RISCV_QOS_INTERNAL_H
> > +
> > +#include <linux/resctrl.h>
> 
> The include caught my eye but I did not notice any additions in this patch
> refer to it.
> 
> Reinette
> 

I was using this to make resctrl structs available in the code that
includdes this header:

arch/riscv/kernel/qos/qos.c
arch/riscv/kernel/qos/qos_resctrl.c

Should I rearrange to include resctrl.h directly where it is needed?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
