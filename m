Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB448C76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktdQVspx0DMwbrKIwVZNTAuQhxaO25JvhcClOe2Acnc=; b=ucNtSQ5HBEASwr
	vbMtx1dqoME8lLniFSj1ZpRLkVb5xRbrtLRn4LPAKUSR6m3rf1U9DFgdTw0xuDspxpVoKPRxRPgQK
	IH6Sq5mUjmdwq6Mk5US4x0KC8qYQw3krH1Qx4ZVuu1Mp8t9JYW5bI8h0TG+SFhLRAlMiyE15FwM9c
	nPFP0UNsIHzVEBUydj7nmbPaRi+P+5xrTSpZ3IPUJcN7wb29fITDNrDKU6sO+R6h0+Fo9L0frrHAM
	YJKFY9xfPJiWEexismyeFk8+n51D7ZFWVB/lg8+PZwH2JkAMe04cg5hMjYfmmhyV5W8k7/xf71ZI5
	m1sUnFcWbGylzSYZ90ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3Is-004XrN-2m;
	Wed, 05 Apr 2023 13:35:58 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3Iq-004Xqc-2A
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 13:35:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so37308120pjz.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680701755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JIHDYxgUdzzSqTP2brP/Gv5M90CrOXKIjgMsPWUPa3E=;
        b=CKTKF4kpb7ZHTt5WzSMSNpO/YiANGdZvzrrD77G3R2AwcXrky8I6y4ejU+fBNRkbFN
         lryZ+EIvfsuH2rhE1cSkHr2YVlmsBsCIb8FDF1XSoF0GPIMefcCmWeKloUJDFICHi6eb
         7MRvsY+ChHOJQlUMZypaYAaLEZHVZ0W99yx9LtAckYSxsCvWLVnwy22p6QBxC6+q6Wm5
         UhgAmuMSveoY6oR2rnXWLS00Sqg1O+H6+VjZvXkfNBpXmNdo6GRt3ztEp6czta8goSwK
         oRSWcq7xRdYhdRHeqG+fJZwC0rkHEmiTgcIOzCeYaKuTbI1JTB78nUaYlT1a1CD4IDgf
         bc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680701755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIHDYxgUdzzSqTP2brP/Gv5M90CrOXKIjgMsPWUPa3E=;
        b=JFyVPrRp8sgFGLl5Y3BvaDUzJUUmBbHqvdRlJxSPutZBh8Tj4zyzqHuQL7YsDjtAcP
         9Q6cVwMXkA/DVsG+Ps2zHcgSK3Ejdyo1vctvW4Cd9nzN5SSjgEGqz+1UPRccMZR5Ob1d
         N5lygJ46bdghfNDwg/FKZxsk31XTF07R/rBEFRmsOphM/0ioHOcB9BobOzqAVobuhW9Y
         /OsKHlXMvKZ4oJg00LrA1n/tIb4Qwi01iiPApFba3HaXUxipoAIFfLy/9Mgx46pX1oqn
         1tr+BgRTNtqCFhs60lXGxHlo3KH9FMazUd/qGtF2qNw6zPxF1vZBsjFllBiPAMgLGN56
         0TjQ==
X-Gm-Message-State: AAQBX9fiWMxihYsEZPFqxw8CGarTv5YyoMQai7CZA5mIPQem+aOFKvmh
	EraXvvLdIY+UPz+o236AX1/b5HKKYkVsQbh9XRs=
X-Google-Smtp-Source: AKy350YakjU97DwbNOaHnJ7tP50TtKQnFHAXGnpEmklEn/OYjSLROKhCvPK2o+vvLvZ4pWgOW/ApXw==
X-Received: by 2002:a17:902:e891:b0:1a1:f413:70b1 with SMTP id w17-20020a170902e89100b001a1f41370b1mr7345803plg.18.1680701754753;
        Wed, 05 Apr 2023 06:35:54 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b0019cad2de86bsm10131129pli.156.2023.04.05.06.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 06:35:54 -0700 (PDT)
Date: Wed, 5 Apr 2023 19:05:42 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>,
	Weili Qian <qianweili@huawei.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Gross <markgross@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 13/23] RISC-V: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <ZC15LqYqLzmiVdcr@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-14-sunilvl@ventanamicro.com>
 <20230404-promotion-scarce-7c69ff7e5f99@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404-promotion-scarce-7c69ff7e5f99@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_063556_715601_415F3D73 
X-CRM114-Status: GOOD (  23.77  )
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

On Tue, Apr 04, 2023 at 09:57:19PM +0100, Conor Dooley wrote:
> On Tue, Apr 04, 2023 at 11:50:27PM +0530, Sunil V L wrote:
> > On ACPI based systems, the information about the hart
> > like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
> > Enable filling up hwcap structure based on the information in RHCT.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 39 ++++++++++++++++++++++++++++++----
> >  1 file changed, 35 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 63e56ce04162..5d2065b937e5 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -6,6 +6,7 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/bitmap.h>
> >  #include <linux/ctype.h>
> >  #include <linux/libfdt.h>
> > @@ -13,6 +14,8 @@
> >  #include <linux/memory.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <asm/acpi.h>
> >  #include <asm/alternative.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/errata_list.h>
> > @@ -91,6 +94,9 @@ void __init riscv_fill_hwcap(void)
> >  	char print_str[NUM_ALPHA_EXTS + 1];
> >  	int i, j, rc;
> >  	unsigned long isa2hwcap[26] = {0};
> > +	struct acpi_table_header *rhct;
> > +	acpi_status status;
> > +	unsigned int cpu;
> >  
> >  	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
> >  	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> > @@ -103,14 +109,36 @@ void __init riscv_fill_hwcap(void)
> >  
> >  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> >  
> > -	for_each_of_cpu_node(node) {
> > +	if (!acpi_disabled) {
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
> > -		if (of_property_read_string(node, "riscv,isa", &isa)) {
> > -			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > -			continue;
> > +		if (acpi_disabled) {
> > +			node = of_cpu_device_node_get(cpu);
> > +			if (node) {
> > +				rc = of_property_read_string(node, "riscv,isa", &isa);
> 
> Hmm, after digging in the previous patch, I think this is actually not
> possible to fail? We already validated it when setting up the mask of
> possible cpus, but I think leaving the error handling here makes things
> a lot more obvious.
> 
Yeah, do you prefer to merge these patches again since only in this
patch, we change the loop to for_each_possible_cpu() from
for_each_of_cpu_node() which actually makes riscv_of_processor_hartid()
not useful?

> I'd swear I gave you a (conditional) R-b on v3 though, no?
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
