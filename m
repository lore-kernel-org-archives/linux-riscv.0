Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0573BC636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIbi4pkCGKtAN4nBDltM+X0GLkko2l7spDUzy4XO2bI=; b=2ML09yVlMkY6lV
	9EUaxhjOBKk4/sNGVut9rAV8QuH+G7s7cDae5kJBrR9Ybtvj248ITyc1J59Xz48l1aTMi3aXvxUpA
	fQV1nk8+VMdE6S/PPd06dtxZAzMj+rl+jhboVRCSTJWMAhbSKYBSjiWfXF9uFZxSR/orBGdByYosH
	NFZRas05bWWLxX+igo3XFuNa/i/flsNp6UgdV/7hSMxoiqoLPlfUnOBwwWtcbVo3/J1YQDzUMcrnM
	V6STaP6trVSb4cCGbQjYKNe4ES6/5z3MsVzq/nDRfBhZN/AQqL900XdLp+IAWdiCVbjVr6cf0XYZN
	lrpsJEsW0UgNjKU3BpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRczM-00FjyT-B8; Mon, 13 Feb 2023 17:51:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRczH-00Fjvx-Te
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:51:38 +0000
Received: by mail-pl1-x636.google.com with SMTP id o8so11910590pls.11
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 09:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1rCNA4cuV2MbKCZjKd9ExnkpJbsqU8Ywy+PrX2AtP0=;
        b=HOAK8lXHxmYUb3rxFNQJbKm81lvDY+PrZpu/7b1GKulxKUZdwMnOETeavjzADWTjLI
         PWGE2hbSpKuYbzJ0yBI2KwMxIpWhiKU4607wisoAZu1tsgFddylpnpleUotSzQ14I0du
         44H77whWzlS6Wdo53gcJ+uI1cYJEd7gJ48f0jkC7e8ZRU0UX9fPL68iZfA5tdM3R8ZYt
         2E3qGpAZKq/oS2D4Pax/DxNyhyEXFvPFY7/rHDyIq9cFU36J/fSzwviFVKmrZ5iLFFzw
         ZQgCyVUFBW4YRdWeiznP5eaoj2Y4eCH+aWq7I+0v8SPTbpHSfjArdXKIh/4YTIkDokOR
         FdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1rCNA4cuV2MbKCZjKd9ExnkpJbsqU8Ywy+PrX2AtP0=;
        b=cT/8ovjqWMTjQrIcIhsZOuLgSMPgb1P5BZpE8wMddd5juQYZY/L9qj4iB2RRYS8f8j
         t6PQnjIOHdekxyN3a2nYVnSqLabXCYqpyRwemGx5FmYdItY7UgfN5RNJyVFA1kvc83E6
         PmrnIELK7ZDehfdXKj/wjBKUJdnhcwCYXAcNW0m9jO34E1smeUWSkaYrj0i9pJt/yBUy
         V1dNno8o0OFngV/dxHYSdL8GYEZ5mAunTvc2vcejra1YGmRov99wE//27ZU4HoU/okBQ
         V4nuQRIze1zWZI6Z5EHyXnseMtmBm5entQOpD14BgHCdrB6uc3m7n0NA6VlEyjkrmaKl
         KhRA==
X-Gm-Message-State: AO0yUKX/gRvIiTEe+FuDrQfvniXvYUW8vZZbxH2cCUAztiEfYh80nNUB
	C4OHnRFbfOWvZazc4y9wD0NFGQ==
X-Google-Smtp-Source: AK7set/c2OfW27Z3nu/u/P90OjUPxgBg49c76FMYOxMM8kg+OUSb7WQySsvC8EDCESqLxXpcesj21A==
X-Received: by 2002:a17:90a:e7cb:b0:233:e4f6:43d1 with SMTP id kb11-20020a17090ae7cb00b00233e4f643d1mr6205167pjb.45.1676310694510;
        Mon, 13 Feb 2023 09:51:34 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id f17-20020a63f111000000b004fb10399da2sm3108708pgi.56.2023.02.13.09.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:51:34 -0800 (PST)
Date: Mon, 13 Feb 2023 23:21:27 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 19/24] RISC-V: ACPI: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <Y+p4n8CNzLB7em0+@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-20-sunilvl@ventanamicro.com>
 <Y+VqCLVETZBRn6iX@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+VqCLVETZBRn6iX@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_095135_987785_91D3EAF8 
X-CRM114-Status: GOOD (  27.18  )
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

On Thu, Feb 09, 2023 at 09:47:52PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:20PM +0530, Sunil V L wrote:
> > On ACPI based systems, the information about the hart
> > like ISA, extesions supported are defined in RISC-V Hart
> > Capabilities Table (RHCT). Enable filling up hwcap structure
> > based on the information in RHCT.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 45 ++++++++++++++++++++++++++++------
> >  1 file changed, 38 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 93e45560af30..c10177c608f8 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -6,12 +6,14 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/bitmap.h>
> >  #include <linux/ctype.h>
> >  #include <linux/libfdt.h>
> >  #include <linux/log2.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <asm/acpi.h>
> >  #include <asm/alternative.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/errata_list.h>
> > @@ -21,6 +23,7 @@
> >  #include <asm/processor.h>
> >  #include <asm/smp.h>
> >  #include <asm/switch_to.h>
> > +#include <linux/of_device.h>
> 
> Is there a reason this header is not added with the other linux ones?
> 
No, let me move it.

> >  
> >  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> >  
> > @@ -93,7 +96,10 @@ void __init riscv_fill_hwcap(void)
> >  	char print_str[NUM_ALPHA_EXTS + 1];
> >  	int i, j, rc;
> >  	unsigned long isa2hwcap[26] = {0};
> > +	struct acpi_table_header *rhct;
> > +	acpi_status status;
> >  	unsigned long hartid;
> > +	unsigned int cpu;
> >  
> >  	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
> >  	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> > @@ -106,18 +112,38 @@ void __init riscv_fill_hwcap(void)
> >  
> >  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> >  
> > -	for_each_of_cpu_node(node) {
> > +	if (!acpi_disabled) {
> > +
> 
> Extraneous blank line.
> 
Okay

> > +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> > +		if (ACPI_FAILURE(status))
> > +			return;
> > +	}
> > +
> > +	for_each_possible_cpu(cpu) {
> >  		unsigned long this_hwcap = 0;
> >  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> >  		const char *temp;
> >  
> > -		rc = riscv_of_processor_hartid(node, &hartid);
> > -		if (rc < 0)
> > -			continue;
> > +		if (acpi_disabled) {
> > +			node = of_cpu_device_node_get(cpu);
> > +			if (node) {
> > +				rc = riscv_of_processor_hartid(node, &hartid);
> > +				if (rc < 0)
> > +					continue;
> >  
> > -		if (of_property_read_string(node, "riscv,isa", &isa)) {
> > -			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > -			continue;
> > +				if (of_property_read_string(node, "riscv,isa", &isa)) {
> > +					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > +					continue;
> > +				}
> > +				of_node_put(node);
> > +			}
> > +		} else {
> > +			rc = acpi_get_riscv_isa(rhct, get_acpi_id_for_cpu(cpu), &isa);
> > +			if (rc < 0) {
> > +				pr_warn("Unable to get ISA for the hart - %d\n",
> > +						cpu);
> 
> The alignment here is wrong, but the whole thing fits on a single line.
> 
Okay

> > +				continue;
> > +			}
> >  		}
> >  
> >  		temp = isa;
> > @@ -248,6 +274,11 @@ void __init riscv_fill_hwcap(void)
> >  			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> >  	}
> >  
> > +#ifdef CONFIG_ACPI
> 
> Is this guard actually needed, or is acpi_put_table() always available?
> 
It can be removed.

Thanks,
Sunil

> Cheers,
> Conor.
> 
> > +	if (!acpi_disabled)
> > +		acpi_put_table((struct acpi_table_header *)rhct);
> > +#endif
> > +
> >  	/* We don't support systems with F but without D, so mask those out
> >  	 * here. */
> >  	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
> > -- 
> > 2.38.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
