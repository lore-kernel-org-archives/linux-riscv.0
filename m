Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A6BC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipjWfnwmE05Do/C5DoMdG+DUnoeb/xF/0guRnFjKGnE=; b=nVDA0bi1aO7ZAy
	Q46whmGjs5NXnQo2+QmlrLOYMJ4bMH3lwJjAiL4IqPy2sPD2nJo8FtDYc4gUmY/Vsp7OCOahUn6IN
	MONOPIwJPRzz5qlab9GKPmlwRcs/5IL8of57PLZQ8Po1xAENSTWoD91FfbhlHA8j8+yHQ2J2pcZCj
	d88z9fuWC5w02fFz7T2uDv75S42vGZd9QpWvhOdEhlTABteGnmnDOMgMiECQB5Ngzpx+i/inMT9e8
	tNFU/IHwH/Ac0gDh5WcPLG9aTDlNU76QAF+oQw9hbS+WJWbVMkB7hP6RCAGsyrcBLii+MfVgeLVG5
	nBsQYTQqkTx8tagxgckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVB64-00GMlQ-7K; Thu, 23 Feb 2023 12:53:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVB5z-00GMj5-L3
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 12:53:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so4449383wms.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 04:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/FvmpoFfP+6tUBA7y7H71sCgjkL+kidP+/CqI/VdtvQ=;
        b=Sy1T+eNVldcEfJbVgrVeoPAxr7YjBUUlIDW6fInf1xOmu7p/xjzPKFg41ykXq/ZPGy
         2r75oe0JRN3yNKlhXth62uqEFeBN5ZU4xwkmZYX2ZmnVn2W/49i6OHXTS2V3AGfDpl00
         4OmOhelC7jmCbDXm9q7WWAMJseXPcM6/4zpLPA32gj4nTjwbZ/MEETgquCjb3niTWkA7
         yF6M5C9zvkIHuUHXwIfI3/rBfTM/zCN7ylpktkkJvYTFK+r9KtOa+rkraQxo0kumPxJi
         V/rvAzh3K1orfCnx8Vsbft27WHYt6zhhyMfDQ0JCVaEUr+Dqkq3WK0gv7OlPzMKaiSKe
         K29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FvmpoFfP+6tUBA7y7H71sCgjkL+kidP+/CqI/VdtvQ=;
        b=Vn1KPedUsKBYp/SK8Kne5j689eKeT9m2IpB8QxsF5eVmmF7O9cLOG3vVBl2goa3UIO
         6W/SqfIdim7mT51q2HuYUH07oq4jr1T659vhf7Qv+uvW9bqMaRnY9bcuy9mwEGpYEO7x
         5iGP+cHoFlkP3yxBiRQNLyRXDIl9QbFNPIU/4MC/a9NHEk/XAj6U/sd70asEEH5vl9R8
         cWvYFf4vjPBE40bfUAOCffTa0iOd6P0U885z5vW+tkQVfpehEYfGEqezVx1sjCaEbhaD
         aXZk20H5JqBm5erPkZ/wmtPrvMorANdT+HXaOtI31tMwB2/0or9/Lo0L9L3hs6iJh2jW
         0BMw==
X-Gm-Message-State: AO0yUKURGoLLEkkg77x+kyAi96Rw9FelVRRS0nhAQSxCQUUDmIxaooZk
	on2tXAOKXUzljDEJ4Ka3wo4pAA==
X-Google-Smtp-Source: AK7set/nBH+egrzpQF7SYDPVDZrSkZOXC+6YXUPs5juU6fLKtnNXfMjPxU9USn8Upw7ApWo3FqGM9A==
X-Received: by 2002:a05:600c:3b14:b0:3e8:f27b:a92c with SMTP id m20-20020a05600c3b1400b003e8f27ba92cmr4378018wms.32.1677156789410;
        Thu, 23 Feb 2023 04:53:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c4fd200b003e9ded91c27sm4045312wmq.4.2023.02.23.04.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 04:53:08 -0800 (PST)
Date: Thu, 23 Feb 2023 13:53:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org, 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>
Subject: Re: [PATCH v5 5/8] riscv: cpufeatures: Put the upper 16 bits of
 patch ID to work
Message-ID: <20230223125307.5jumkavjnnddvdtp@orel>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
 <20230221190916.572454-6-ajones@ventanamicro.com>
 <Y/ZQk0ifXPEnenoe@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y/ZQk0ifXPEnenoe@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_045311_741501_E20736E3 
X-CRM114-Status: GOOD (  42.08  )
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

On Wed, Feb 22, 2023 at 05:27:47PM +0000, Conor Dooley wrote:
> On Tue, Feb 21, 2023 at 08:09:13PM +0100, Andrew Jones wrote:
> > cpufeature IDs are consecutive integers starting at 26, so a 32-bit
> > patch ID allows an aircraft carrier load of feature IDs. Repurposing
> > the upper 16 bits still leaves a boat load of feature IDs and gains
> > 16 bits which may be used to control patching on a per patch-site
> > basis.
> > 
> > This will be initially used in Zicboz's application to clear_page(),
> > as Zicboz's block size must also be considered. In that case, the
> > upper 16-bit value's role will be to convey the maximum block size
> > which the Zicboz clear_page() implementation supports.
> > 
> > cpufeature patch sites which need to check for the existence or
> > absence of other cpufeatures may also be able to make use of this.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/alternative.h |  3 +++
> >  arch/riscv/kernel/cpufeature.c       | 37 +++++++++++++++++++++++++---
> >  2 files changed, 36 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > index 8f39d4e8598d..f2cb543b0bd2 100644
> > --- a/arch/riscv/include/asm/alternative.h
> > +++ b/arch/riscv/include/asm/alternative.h
> > @@ -17,6 +17,9 @@
> >  #include <linux/stddef.h>
> >  #include <asm/hwcap.h>
> >  
> > +#define PATCH_ID_CPUFEATURE_ID(p)		((u16)((u32)(p) & 0xffff))
> > +#define PATCH_ID_CPUFEATURE_VALUE(p)		((u16)(((u32)(p) >> 16) & 0xffff))
> 
> I was just fiddling around a bit with macros, I think these do the same
> thing:
> #define PATCH_ID_CPUFEATURE_ID(p)		((p) & GENMASK(15, 0))
> #define PATCH_ID_CPUFEATURE_VALUE(p)		FIELD_GET(GENMASK(31, 16), (p))
> Although without the same care about types - is there a specific reason
> you were casting like that?

Just to be pedantic, but I just remembered we already have
upper/lower_16_bits() in linux/kernel.h. I'll use those.

> 
> Either way, I think I prefer this approach to the vendor_id stuffing!
> If we do end up needing to fit an aircraft carrier, we can come back and
> revisit another parameter in the alternatives I suppose...
> 
> I don't really know if the macros do anything to help with
> understandability, so with or without trying to use macros:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

> 
> Thanks,
> Conor.
> 
> >  #define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
> >  #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
> >  #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before mmu start */
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 6102b6bb5db3..0594989ead63 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -273,12 +273,35 @@ void __init riscv_fill_hwcap(void)
> >  }
> >  
> >  #ifdef CONFIG_RISCV_ALTERNATIVE
> > +/*
> > + * Alternative patch sites consider 48 bits when determining when to patch
> > + * the old instruction sequence with the new. These bits are broken into a
> > + * 16-bit vendor ID and a 32-bit patch ID. A non-zero vendor ID means the
> > + * patch site is for an erratum, identified by the 32-bit patch ID. When
> > + * the vendor ID is zero, the patch site is for a cpufeature. cpufeatures
> > + * further break down patch ID into two 16-bit numbers. The lower 16 bits
> > + * are the cpufeature ID and the upper 16 bits are used for a value specific
> > + * to the cpufeature and patch site. If the upper 16 bits are zero, then it
> > + * implies no specific value is specified. cpufeatures that want to control
> > + * patching on a per-site basis will provide non-zero values and implement
> > + * checks here. The checks return true when patching should be done, and
> > + * false otherwise.
> > + */
> > +static bool riscv_cpufeature_patch_check(u16 id, u16 value)
> > +{
> > +	if (!value)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  						  struct alt_entry *end,
> >  						  unsigned int stage)
> >  {
> >  	struct alt_entry *alt;
> >  	void *oldptr, *altptr;
> > +	u16 id, value;
> >  
> >  	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> >  		return;
> > @@ -286,13 +309,19 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  	for (alt = begin; alt < end; alt++) {
> >  		if (alt->vendor_id != 0)
> >  			continue;
> > -		if (alt->patch_id >= RISCV_ISA_EXT_MAX) {
> > -			WARN(1, "This extension id:%d is not in ISA extension list",
> > -				alt->patch_id);
> > +
> > +		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
> > +
> > +		if (id >= RISCV_ISA_EXT_MAX) {
> > +			WARN(1, "This extension id:%d is not in ISA extension list", id);
> >  			continue;
> >  		}
> >  
> > -		if (!__riscv_isa_extension_available(NULL, alt->patch_id))
> > +		if (!__riscv_isa_extension_available(NULL, id))
> > +			continue;
> > +
> > +		value = PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
> > +		if (!riscv_cpufeature_patch_check(id, value))
> >  			continue;
> >  
> >  		oldptr = ALT_OLD_PTR(alt);
> > -- 
> > 2.39.1
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
