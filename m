Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A3DC636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 07:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6oZHIA0Dc+zo1lzo5EMTtyYMQKFEAHCC92Xszwar4c=; b=c58HETCn/P0dEy
	KmIPGuj1tyUHyzONTu4GEnU6HyaI63U5r5r7x84ujyqUeFN0Cce0pZyYdu4No/A4mysQNBxc5oxLI
	MOEEiSlFEftU279UH538YAORDgOEPxrqs64X5WcNXJ23n8uVwrNsVmEzYSrJEMevcQwFnPThIBxaO
	DTLro0hZLlF2mxcpJ7gphMwaecpbIle8SiDGdi0WORYKpGsw1NKEo33rJmm1PhE2qkZdQIZshbJBq
	BMZpumMZv7YS/OEzIqX7PYa8KLSgjBZMwRouVa7m9d+uNPqR8Sg/b7/eAV2EdSnFQaudwrOG0PUyJ
	ioIOI5KamYvqnF0/VLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQOId-004gtr-WC; Fri, 10 Feb 2023 07:58:28 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQOIZ-004gsF-Pj
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 07:58:25 +0000
Received: by mail-ej1-x633.google.com with SMTP id rp23so13557874ejb.7
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 23:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PVwvLPdoCG9Eqj6NqnBPjX2qD9B50cXR8ttDSJSuM4A=;
        b=E54giWET6EZ//rnbVLCk30jHwlkvwBQTSRrKzWxqC+Dh6I7jwRkUuOeD33TKOW84N+
         HSjXBJcigaAkSHJNXcG3ArSe16CRpP78pNFkEKbw7AvEJS6+k92zhsWL95lpfKHn6iKs
         V4BdmkzPUHwX+rSCo3mXCYGfFOI4u/vYzRRN+g0gEnBYFCZg0cHZ8gNbEh8r/JB4Y3Kk
         sCd2fsDHefJuMqZy2BUNJZLozJU3TFo3SoRb8ke7opEBIFLKCsnUiN2BSw0nxEhGPHKm
         hSSJOOEWtAwVwCONnPwtqGYxK/swhMP3vFLcnB00OY4L3eSHP9oRWnT+RJ3J3F/69FPO
         OlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVwvLPdoCG9Eqj6NqnBPjX2qD9B50cXR8ttDSJSuM4A=;
        b=mwBfRLJX8mzc2Nsow6krNaABwyxRzaeaLhj+lMgt5mnTgwx6QGcWfvmrj13/fVMdJY
         oc45QikFlYIta54bcXULxwgHI26DHp7yIiKl+69gwnnvepbqdPlFQ/VMsRkODQVkVTtv
         ZlRc/mK0Yf9nniE/cBCpfHmVMWD0iSphHsgtcn1EY7TcdrHCeVowOx4CbL+NQwq4YsrY
         2O6I++e9J++vcKYua5iV4/hmvqGUIF7Av23sZGXAFA2P6gsTK21SG94jp9CDkhODw6Q3
         1SvVCkv5wToMrMzJ9ev5E2SbRD/jZWeFdYiu5h0csPnaAAEpWW1XDAWie5ksVxQASMxd
         j20A==
X-Gm-Message-State: AO0yUKW4CZynq8sapJNDGgvjtF9owssqFJoTNWW71pSq55zIIEDl/1sK
	8ZVfFc+bC66PkXp1PkxC9vz/jQ==
X-Google-Smtp-Source: AK7set/pSgw0sSEPaDn8vw6CqyxZeGxDr7nF3C2NkVx7d7q6Hx9lxU+IbrZm1BkKwVQiHeukXBoE7w==
X-Received: by 2002:a17:906:9494:b0:878:5f35:b8d6 with SMTP id t20-20020a170906949400b008785f35b8d6mr12555289ejx.51.1676015900046;
        Thu, 09 Feb 2023 23:58:20 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906101700b008aedc51fc02sm2048340ejm.210.2023.02.09.23.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 23:58:19 -0800 (PST)
Date: Fri, 10 Feb 2023 08:58:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 5/8] RISC-V: cpufeature: Put vendor_id to work
Message-ID: <20230210075818.chh5myc2tmcvjplc@orel>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-6-ajones@ventanamicro.com>
 <Y+VD2/owMIvqzOx8@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+VD2/owMIvqzOx8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_235823_882508_5D99221D 
X-CRM114-Status: GOOD (  36.83  )
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

On Thu, Feb 09, 2023 at 07:04:59PM +0000, Conor Dooley wrote:
> Hey Drew,
> 
> On Thu, Feb 09, 2023 at 04:26:25PM +0100, Andrew Jones wrote:
> > When [ab]using alternatives as cpufeature "static keys", which can
> > be used in assembly, also put vendor_id to work as application-
> > specific data. This will be initially used in Zicboz's application to
> > clear_page(), as Zicboz's block size must also be considered. In that
> > case, vendor_id's role will be to convey the maximum block size which
> > the Zicboz clear_page() implementation supports.
> > 
> > cpufeature alternative applications which need to check for the
> > existence or absence of other cpufeatures may also be able to make
> > use of this.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 0d2db03cf167..74736b4f0624 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -278,6 +278,11 @@ void __init riscv_fill_hwcap(void)
> >  }
> >  
> >  #ifdef CONFIG_RISCV_ALTERNATIVE
> 
> I think a comment here about what "application check" means would be
> nice.
> That wording just feels clunky & the meaning is not immediately
> graspable?
> 
> /*
>  * riscv_cpufeature_application_check() - Check if a cpufeature applies.
>  * The presence of a cpufeature does not mean it is necessarily
>  * useable. This function is used to apply the alternative on a
>  * case-by-case basis.
>  */
> 
> Dunno, does something like that convey the intent?

Indeed, a comment would be helpful. I'll put something similar to what you
propose in the next version.

> 
> > +static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> > +{
> > +	return data == 0;
> > +}
> > +
> >  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  						  struct alt_entry *end,
> >  						  unsigned int stage)
> > @@ -289,8 +294,6 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  		return;
> >  
> >  	for (alt = begin; alt < end; alt++) {
> > -		if (alt->vendor_id != 0)
> > -			continue;
> 
> Can you remind me what makes this "safe"?
> My understanding was that a vendor_id of zero was safe, as zero is
> reserved in JEDEC.
> What is stopping someone stuffing this with a given value and
> colliding with a real vendor's errata?
> 
> 	for (alt = begin; alt < end; alt++) {
> 		if (alt->vendor_id != A_VENDOR_ID)
> 			continue;
> 		if (alt->errata_id >= ERRATA_A_NUMBER)
> 			continue;
> 
> 		tmp = (1U << alt->errata_id);
> 		if (cpu_req_errata & tmp) {
> 			oldptr = ALT_OLD_PTR(alt);
> 			altptr = ALT_ALT_PTR(alt);
> 
> 			/* On vm-alternatives, the mmu isn't running yet */
> 			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> 				memcpy((void *)__pa_symbol(oldptr),
> 				       (void *)__pa_symbol(altptr),
> 				       alt->alt_len);
> 			else
> 				patch_text_nosync(oldptr, altptr, alt->alt_len);
> 		}
> 	}
> 
> I've probably just missing something, my brain swapped out alternatives
> the other week. Hopefully whatever I missed isn't embarrassingly obvious!

You're right. I was assuming the errata_id space for errata didn't overlap
with the errata_id space for cpufeatures. It doesn't, atm, but by luck,
not design. I could try to ensure that somehow, but probably the better
approach would be to use the upper bits of errata_id for the application
data and to leave vendor_id alone. Thanks for catching my oversight!

Thanks,
drew


> 
> Cheers,
> Conor.
> 
> >  		if (alt->errata_id >= RISCV_ISA_EXT_MAX) {
> >  			WARN(1, "This extension id:%d is not in ISA extension list",
> >  				alt->errata_id);
> > @@ -300,6 +303,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >  		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
> >  			continue;
> >  
> > +		if (!riscv_cpufeature_application_check(alt->errata_id, alt->vendor_id))
> > +			continue;
> > +
> >  		oldptr = ALT_OLD_PTR(alt);
> >  		altptr = ALT_ALT_PTR(alt);
> >  		patch_text_nosync(oldptr, altptr, alt->alt_len);
> > -- 
> > 2.39.1
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
