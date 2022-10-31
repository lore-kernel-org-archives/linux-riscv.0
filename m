Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127E7C38A02
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jf8fCndng/mfprGImC9XdOtrDBPv57ovYP0iwEGQADw=; b=EmSM5upjzFcGs4
	EqxODHVpsp1mLE37y2d8CvrnhOWIpsTJn81qJY2a3kj8d/mIvmg9ZpY6HDNDKIFQaFnn8TC2/J2MB
	vpz/9JEb+/CbERcPgR5YR5/CEyD6l7ntmTGFDI0M3PSmfjMbybbqmTKk34fdcDJTR8Afy9PovvITB
	0m/B1Eoqml09ZJ+3WOocCGlihKOOSv/vs5QVGo/XLtc1YyZAQktGq+a7X4ojzXOHkbhUCj2x1yV5p
	swbqNKMh54c6NmhxozmIYuGF13wuToVgL6jNVJVnwk/suBvA84uo5TMrkRRpJzC3JSU30tct3amVV
	D0P/1kuO98V8FmiANDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opPt9-009Sdt-9N; Mon, 31 Oct 2022 08:11:19 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opPt6-009Say-NR
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 08:11:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id y14so27399756ejd.9
        for <linux-riscv@lists.infradead.org>; Mon, 31 Oct 2022 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sHQyVuzeTg7QPs7lkNzUB7XzYg4smEI+BB6FkfZOry8=;
        b=AU4fR+6dr+oUL35I2lOMwvCqy4g1nflWQR0ZqLP6byUefWB5rbQBmJ6v70kDtN+2pr
         +uVrld3KHcnfVVktZXPRlN2K/nqYFwGGQeFlhIVBqpMIb6SwkxfO4sMgwwOomp8lYCOg
         /Kd4QbYeaaqKB9YnUr8gc8yODdS7usz1u+FX0E91MNbfd/AaFTauwI4tG/U2TwCDhDTv
         oY3Hw6hHFMVGdpIgjwg4rXQ2rhPOcydy8LzF8NZy5IZwZcVHeS11CFlVuNguofjO0Inc
         jMdmC9Xd46NH+B7HtF7wjOLdsIaAc04RPsTk80pfmy4WGaYQWirPOUkHz957XaqA9M/r
         +R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHQyVuzeTg7QPs7lkNzUB7XzYg4smEI+BB6FkfZOry8=;
        b=0ZIxcRTeUAHwczh0ejUnMrlqucD5h68+kqdNJ5eOCtdZlHJusU+jXzFIjESM5Oxsya
         N/SV9GSVmCMup3s+LALtuLrDIqkq0dvj4001AJcYWaf42C6C5XB06PLpj4HzGIa7+Ke6
         pyoOH8vz9bzckZonAqgEfo+WyZrvQkJ2R8Qx9XDS5tW35fNyKQV5+ZWnpWajH6RO6dX+
         vygwsqPA5LzgrljCYrYA7MERGu/R/XTOeuj3bjBoIOJ1IQOc1+xUNKBHtZKTJH/a5vRG
         GQeTRZTMlvqxlwen5QhJ7rqHXDeKLHy1R7bPDD8drLILdGyzA/8CXadO/DdDwgHWXEeM
         JYRA==
X-Gm-Message-State: ACrzQf0MPzu1KEqDi0Nv+ij+b8913ZecTLMEPaIg/NJrrw/Q1wlnBg/C
	rsgzfp9FNBAwoUoWWAR87qFF+Q==
X-Google-Smtp-Source: AMsMyM4gasa/ZpeSADeEk0NFbJaDtpg6g+Rdzo8MbfabfJCFS0uhI7bR5lOzhO5BkrkcK9DBxrN5Mg==
X-Received: by 2002:a17:907:6e90:b0:7ad:8ba7:6640 with SMTP id sh16-20020a1709076e9000b007ad8ba76640mr12086053ejc.142.1667203874365;
        Mon, 31 Oct 2022 01:11:14 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id j9-20020aa7c0c9000000b004587f9d3ce8sm2927918edp.56.2022.10.31.01.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 01:11:14 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:11:13 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 1/9] RISC-V: Factor out body of riscv_init_cbom_blocksize
 loop
Message-ID: <20221031081113.um77mqvtr36toorz@kamzik>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-2-ajones@ventanamicro.com>
 <Y17fMkRRkTIbEX+r@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y17fMkRRkTIbEX+r@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_011116_828181_E9B82040 
X-CRM114-Status: GOOD (  26.23  )
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

On Sun, Oct 30, 2022 at 08:31:46PM +0000, Conor Dooley wrote:
> On Thu, Oct 27, 2022 at 03:02:39PM +0200, Andrew Jones wrote:
> > Refactor riscv_init_cbom_blocksize() to prepare for it to be used
> > for both cbom block size and cboz block size.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/mm/cacheflush.c | 45 +++++++++++++++++++++-----------------
> >  1 file changed, 25 insertions(+), 20 deletions(-)
> > 
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 57b40a350420..f096b9966cae 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -91,34 +91,39 @@ void flush_icache_pte(pte_t pte)
> >  unsigned int riscv_cbom_block_size;
> >  EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> >  
> > +static void cbo_get_block_size(struct device_node *node,
> > +			       const char *name, u32 *blksz,
> 
> Is there a reason you called this "blksz" when we are using the spelt
> out "block_size" everywhere else in this code? My OCD would appreciate
> the consistency :s

I just tend to prefer shorter names for local, short-lived variables
as it sometimes helps avoid line wrapping, but I'm fine with naming it
block_size as well and can do the rename for v2 if you'd like.

> 
> Other than that:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

> 
> > +			       unsigned long *first_hartid)
> > +{
> > +	unsigned long hartid;
> > +	u32 val;
> > +
> > +	if (riscv_of_processor_hartid(node, &hartid))
> > +		return;
> > +
> > +	if (of_property_read_u32(node, name, &val))
> > +		return;
> > +
> > +	if (!*blksz) {
> > +		*blksz = val;
> > +		*first_hartid = hartid;
> > +	} else if (*blksz != val) {
> > +		pr_warn("%s mismatched between harts %lu and %lu\n",
> > +			name, *first_hartid, hartid);
> > +	}
> > +}
> > +
> >  void riscv_init_cbom_blocksize(void)
> >  {
> >  	struct device_node *node;
> >  	unsigned long cbom_hartid;
> > -	u32 val, probed_block_size;
> > -	int ret;
> > +	u32 probed_block_size;
> >  
> >  	probed_block_size = 0;
> >  	for_each_of_cpu_node(node) {
> > -		unsigned long hartid;
> > -
> > -		ret = riscv_of_processor_hartid(node, &hartid);
> > -		if (ret)
> > -			continue;
> > -
> >  		/* set block-size for cbom extension if available */
> > -		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> > -		if (ret)
> > -			continue;
> > -
> > -		if (!probed_block_size) {
> > -			probed_block_size = val;
> > -			cbom_hartid = hartid;
> > -		} else {
> > -			if (probed_block_size != val)
> > -				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> > -					cbom_hartid, hartid);
> > -		}
> > +		cbo_get_block_size(node, "riscv,cbom-block-size",
> > +				   &probed_block_size, &cbom_hartid);
> >  	}
> >  
> >  	if (probed_block_size)
> > -- 
> > 2.37.3
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
