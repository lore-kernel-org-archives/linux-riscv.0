Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15B3EEAA4E
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFU2H378LSFHVoSq31rINGWBl4wD/zjryecckCKcJkg=; b=er+S4EZ5ssayJj
	WWlea/vzXuqIuNsmjFLeqt9kp9xqw5FmbDJFiAyCeRP1nkEMWprkyXbVrbLA+0XQhsf3JQA1NxHj/
	sNbfRtSbnBCjFlbYZkyVT/YVM9aLScpDrCw7CE1GPwxH3gc0QHbYqwDDTkdi7MMjgoOAy7dOgGt8a
	patn4MvCYH75LTRln3jXifBINBrS0/enTxo2w4btk9sksl443YfJcHhFnazK32w3a/4p+qzef/TPE
	cHG2amk2vdxymwE3IZnFQYtpxA2OHfVDT5X4PF3OJL3NKAHUOMYBZFCiwXc9OmTcJrbFQPkbQC/sK
	8+ONNBnDUVQjhgY86Bfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnkM-008hSG-2n;
	Thu, 14 Sep 2023 14:55:10 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnkH-008hQy-29;
	Thu, 14 Sep 2023 14:55:08 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RmgMM5jtxz6FGPS;
	Thu, 14 Sep 2023 22:54:23 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 14 Sep
 2023 15:54:59 +0100
Date: Thu, 14 Sep 2023 15:54:59 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: James Morse <james.morse@arm.com>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Russell King <linux@armlinux.org.uk>, Jean-Philippe
 Brucker <jean-philippe@linaro.org>, <jianyong.wu@arm.com>,
	<justin.he@arm.com>
Subject: Re: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields
 [code first?]
Message-ID: <20230914155459.00002dba@Huawei.com>
In-Reply-To: <CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
References: <20230913163823.7880-1-james.morse@arm.com>
	<20230913163823.7880-28-james.morse@arm.com>
	<CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_075505_992710_3457E877 
X-CRM114-Status: GOOD (  26.29  )
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

On Thu, 14 Sep 2023 09:57:44 +0200
Ard Biesheuvel <ardb@kernel.org> wrote:

> Hello James,
> 
> On Wed, 13 Sept 2023 at 18:41, James Morse <james.morse@arm.com> wrote:
> >
> > Add the new flag field to the MADT's GICC structure.
> >
> > 'Online Capable' indicates a disabled CPU can be enabled later.
> >  
> 
> Why do we need a bit for this? What would be the point of describing
> disabled CPUs that cannot be enabled (and are you are aware of
> firmware doing this?).

Enabled being not set is common at some similar ACPI tables at least.

This is available in most ACPI tables to allow firmware to use 'nearly'
static tables and just tweak the 'enabled' bit to say if the record should
be ignored or not. Also _STA not present which is for same trick.
If you are doing clever dynamic tables, then you can just not present 
the entry.

With that existing use case in mind, need another bit to say this
one might one day turn up.  Note this is copied from x86 though no
one seems to have implemented the kernel support for them yet.

Note as per my other reply - this isn't a code first proposal. It's in the
spec already (via a code first proposal last year I think).

> 
> So why are we not able to assume that this new bit can always be treated as '1'?

Given above, need the extra bit to size stuff to allow for the CPU showing up
late.


> 
> 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > ---
> > This patch probably needs to go via the upstream acpica project,
> > but is included here so the feature can be testd.
> > ---
> >  include/acpi/actbl2.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
> > index 3751ae69432f..c433a079d8e1 100644
> > --- a/include/acpi/actbl2.h
> > +++ b/include/acpi/actbl2.h
> > @@ -1046,6 +1046,7 @@ struct acpi_madt_generic_interrupt {
> >  /* ACPI_MADT_ENABLED                    (1)      Processor is usable if set */
> >  #define ACPI_MADT_PERFORMANCE_IRQ_MODE  (1<<1) /* 01: Performance Interrupt Mode */
> >  #define ACPI_MADT_VGIC_IRQ_MODE         (1<<2) /* 02: VGIC Maintenance Interrupt mode */
> > +#define ACPI_MADT_GICC_CPU_CAPABLE      (1<<3) /* 03: CPU is online capable */
> >
> >  /* 12: Generic Distributor (ACPI 5.0 + ACPI 6.0 changes) */
> >
> > --
> > 2.39.2
> >  
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
