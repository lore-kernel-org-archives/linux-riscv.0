Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA19C636D3
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 16:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4l3BH3Kd92pVLZVdkgHBzMzLsOI4i2adCgJWNypYm4=; b=VbKZE7tu3oYoQN
	BQ1zG5Ioe830OKYvhF96gQtBhRwpjfmIOSDAPxdM/wfz8+RugXYy0LSgjWKNnty3Zmf7y5Lri2DGL
	LCZ9+nOH0HnHycBUC1p4X/n9PJ3eu6rl0zVE1i/5KsWQnNAPBbeJYfYKSA3fGCJ0bKEP9Ct3L5YDL
	bvmZyn8ty0igqyQIYuxHmnFbeOgqHytOwk50HGks0zWx0zd2cTtkylSPLvQnDFVoXDTEm31QWU61e
	M10cVUAxeEJ/5qcUqPUcSLhFFQCquKj4Kyq7ZxHyjH6Mlys10p3Oy70Zkxxw21NcFjAQKW/EdFlCc
	PKjBRI1MKXsC2/I5JbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRFBU-00Br4r-1B; Sun, 12 Feb 2023 16:26:37 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRFBQ-00Br2x-PZ
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 16:26:34 +0000
Received: by mail-ed1-x52f.google.com with SMTP id a10so9954797edu.9
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 08:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3PCYy6Wbh7GsA27zvT/r5W62MOOvZT1L4mCL8SLtH5Y=;
        b=FjcwRHU/TfAzQU0y6k9Qnc5WV+05vgp/eF+XzNlZO0UrGQT+a0ShpXhneDxozggAHT
         xjo9triMvt6QUQN0hJY+ukUpVLzgshbOx1DCj4zg6RCY0C4R1fpUCRwqM0L3UpCmaDtV
         ApMEdoS+Oz9NtZW9Qs+fwwF99N55C8Qic5dGCVXhHTBiMDcS9oTIgLn0lxLNeobZTGYQ
         MFRk0M312Who+wBXtzW3bwsDE9BkpiBE38gqmp9/40k/FgUaFe0v3PXrzmhxFwx8LjZD
         T62lhV2nEKzL/MwA1alcbNfLryI8z+t77UPJnaf2IlV5DpZnHMzzTHxnDNdTCZumjUUW
         d/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PCYy6Wbh7GsA27zvT/r5W62MOOvZT1L4mCL8SLtH5Y=;
        b=NvrySAkvHts3wNsSS5d4gR7nHG7gRswOsB5RFfrdGXkvsJkL6pRSFSX+1xWa9nPOFe
         p2zZ39X2bfhFPd4jiqoz6jRli6WA3nW+KpbIaZ9CF0zVgN+L8UgY8i5GU7y3b7T7OGXK
         91z5fljests+GcJyJYI6mdVAN6ajdD2bmdnNdhaU/aArkHvOSOJxcpq2Skqfnq0B8nXZ
         yV5SXJSeoZNNs/+9rpTKS/l+QWZCe1XVznVKk6OJ5/tlb9T3WNB4eeccuSFQs9KfC62x
         CK1ETYGr6FEjbXu/RHqTA/xKC+Gg0pGqSZBwJghKJXFK3XXnPFLy5E6jFD23sL5NDymF
         0Byg==
X-Gm-Message-State: AO0yUKUEISS6ty2/8gDQlVfUnM5Nw0ejzA5Rj7cvPSgF3TkFDBysx6GL
	QVEkyIaKb7lF2bGotG5mc7UHbQ==
X-Google-Smtp-Source: AK7set9ZPfY01Ct3ZIJaSAiXOKv2Api9L0ewq9QnDS38whEHPPbgFxAwFAtPcgJDTdZ1UKAn2rDazg==
X-Received: by 2002:a50:8d1d:0:b0:4ac:c4ed:f1d5 with SMTP id s29-20020a508d1d000000b004acc4edf1d5mr1694361eds.1.1676219189631;
        Sun, 12 Feb 2023 08:26:29 -0800 (PST)
Received: from localhost ([145.224.109.44])
        by smtp.gmail.com with ESMTPSA id z16-20020a5096d0000000b004aad0a9144fsm5395432eda.51.2023.02.12.08.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 08:26:29 -0800 (PST)
Date: Sun, 12 Feb 2023 17:26:27 +0100
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
Message-ID: <20230212162627.4k76d7y3b3rgezkw@orel>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-6-ajones@ventanamicro.com>
 <Y+VD2/owMIvqzOx8@spud>
 <20230210075818.chh5myc2tmcvjplc@orel>
 <Y+apG/nVSLJY8nsN@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+apG/nVSLJY8nsN@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_082632_839779_61DEFB16 
X-CRM114-Status: GOOD (  32.13  )
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

On Fri, Feb 10, 2023 at 08:29:15PM +0000, Conor Dooley wrote:
> On Fri, Feb 10, 2023 at 08:58:18AM +0100, Andrew Jones wrote:
> > On Thu, Feb 09, 2023 at 07:04:59PM +0000, Conor Dooley wrote:
> > > On Thu, Feb 09, 2023 at 04:26:25PM +0100, Andrew Jones wrote:
> 
> > > > +static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> > > > +{
> > > > +	return data == 0;
> > > > +}
> > > > +
> > > >  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > > >  						  struct alt_entry *end,
> > > >  						  unsigned int stage)
> > > > @@ -289,8 +294,6 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> > > >  		return;
> > > >  
> > > >  	for (alt = begin; alt < end; alt++) {
> > > > -		if (alt->vendor_id != 0)
> > > > -			continue;
> > > 
> > > Can you remind me what makes this "safe"?
> > > My understanding was that a vendor_id of zero was safe, as zero is
> > > reserved in JEDEC.
> > > What is stopping someone stuffing this with a given value and
> > > colliding with a real vendor's errata?
> > > 
> > > 	for (alt = begin; alt < end; alt++) {
> > > 		if (alt->vendor_id != A_VENDOR_ID)
> > > 			continue;
> > > 		if (alt->errata_id >= ERRATA_A_NUMBER)
> > > 			continue;
> > > 
> > > 		tmp = (1U << alt->errata_id);
> > > 		if (cpu_req_errata & tmp) {
> > > 			oldptr = ALT_OLD_PTR(alt);
> > > 			altptr = ALT_ALT_PTR(alt);
> > > 
> > > 			/* On vm-alternatives, the mmu isn't running yet */
> > > 			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > > 				memcpy((void *)__pa_symbol(oldptr),
> > > 				       (void *)__pa_symbol(altptr),
> > > 				       alt->alt_len);
> > > 			else
> > > 				patch_text_nosync(oldptr, altptr, alt->alt_len);
> > > 		}
> > > 	}
> > > 
> > > I've probably just missing something, my brain swapped out alternatives
> > > the other week. Hopefully whatever I missed isn't embarrassingly obvious!
> > 
> > You're right. I was assuming the errata_id space for errata didn't overlap
> > with the errata_id space for cpufeatures. It doesn't, atm, but by luck,
> > not design. I could try to ensure that somehow, but probably the better
> > approach would be to use the upper bits of errata_id for the application
> > data and to leave vendor_id alone. Thanks for catching my oversight!
> 
> Sounds like a better idea at least.
> I suppose the ideal would be to add another arg and not abuse things,
> but maybe that's one for the future, idk.

We could add another arg without too much trouble and even use some macro
trickier to only pass it when it's needed. OTOH, the errata_id is 32-bits,
which is overkill, since errata are assigned increasing integers from
zero, and I don't want to over-bloat this structure. Maybe I can split
errata_id into two 16-bit parameters to avoid completely adding yet
another.

> Is this somewhere that an assertion should be used to make sure that
> we don't grow the list of extensions such that the regions collide?

It's probably best to split errata_id for the application data and not
worry about collisions.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
