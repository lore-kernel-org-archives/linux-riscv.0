Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDCAC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fE3XI9NILRlfrvrToXJZy/x3envIIn3/g8wqLto8tDU=; b=NxbOsnxwh8W+Xe
	cBiTaypNcFat9j+/IZEPnH45UGtn3nvfQt+38DBuKvVzZhVW7bhtQMC2EBOgSHTzSztRbpXGTccB2
	OJLx/GjLSZMID6gbo8Eu1K3NIIXeAzNyvbM8UsLTrNLmRIWhRiPM2+668zZhz5VZ+ZQ8xT5N0IKu7
	oGDnUovPebsZukxjfObR0ILIRxTe9Nnvvm+L/BKT0UMQTZ88AHCDHzzEMmaeQq57bBxg62jWfNLCl
	gacTVotstFO3leiApcWxutDAiUv6P1WRA+DZDU4niG9WwGIR4nDjGl/GLxoLnEplV8e+llffUIh/V
	wAZz7H7vVfyQGVqcXwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TAH-0000000E4mS-45gK;
	Fri, 26 Apr 2024 21:31:29 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0T9X-0000000E4C0-0TQY
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:30:46 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ab88634cfaso2162450a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714167042; x=1714771842; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/H8e5hlV+/I4+TPtXJEmnSVpBl2vd7RDe12C8rr7Cys=;
        b=f2mUAP8jb/KRRfzwkS5qj1vDfh11Whbp0Ih1O8mlRRLBUuploaxMl0eugJ2RMtdDpz
         pe15tkdPiNGJt9IMRVJva+SsUpf/7fSkEWJWwJJqEPuJwukk4GkaMljUr/GJzgmg0tzf
         i8W+LTokRd4ARl7asqu6IoVJ5ZUO09mfM9f5gxdvVa/yqgpiiDweRIpgw3+a8mGC1He+
         7MuBzmeoQpHPbl3SmOZLmtehZppnHvI5J4q/2amhfEvefCiwCgEwwUMeQcRbzI53GXj2
         WGnXsQOXHjGxULpjVBS7WbkY3cwLue0GA7T+5rvSwdRHv3e77My3hDPjMIY5GTX/X7Hp
         uCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714167042; x=1714771842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/H8e5hlV+/I4+TPtXJEmnSVpBl2vd7RDe12C8rr7Cys=;
        b=cDM32pefm4ku9VRfvqUivXFbpw1ht+CZqmyY4FwoD9gPSM35USS25zMY4JRHvpRVP+
         etgQSLTdvqr4hugY2L/BW9edRwE0yuHlzbiHThcM5oyVMYtz93eBli5x8880hDq1QFeb
         hPxnWT5emYLF47Nm3KFgsKgkw66y2C9zPZE5R/HuRcWvKlBTsPKjZFa0RlqiXFQRMRvS
         WKsX2+kVJRHCBlQbSdLGmdAMGSUfx4FfqjSrEIGHk5XGi5rQA35fJGxtY7vXU9iMnlTT
         k7jYVQdG4/ukJCbvLioiRZxy1MHw4NNaOgckRe0F1pvO5Xgg7neht+XCKaHqGk6vWNT7
         J99w==
X-Forwarded-Encrypted: i=1; AJvYcCWFjG+ilBbhfbx5Wn8GUL4zi1zcQTpCYBscY1CGy8+DESlRKQAhDScc0Z0IgwCPcIneDE1vqg5oo9JqpLMQMWJ7o3v/TMOD1UgHwusyzDOm
X-Gm-Message-State: AOJu0YwiimCCw4HzNHbcqPg0pRtK2KKpBexFhS1YDXoS/oqLuu/R+JBv
	AwgFWIZZmZLip4qeEefo2pFfvTrQ7ILPccwDIy2gn1SYmrMJ0vBjdvAYMUzmUJ44z/3EmGPGfnp
	G
X-Google-Smtp-Source: AGHT+IG6SE8OrSd9ojcqff1UuWL+xPFCFrexq7q4C0vjAZm0SbmrYw9oyQfoJcf054h7/OJCN6VARw==
X-Received: by 2002:a17:90b:4c85:b0:2b0:b535:4721 with SMTP id my5-20020a17090b4c8500b002b0b5354721mr1533883pjb.1.1714167041775;
        Fri, 26 Apr 2024 14:30:41 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:3b15:3aba:70a1:7ce9])
        by smtp.gmail.com with ESMTPSA id s4-20020a17090aa10400b002a54632931bsm16694006pjp.23.2024.04.26.14.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:30:40 -0700 (PDT)
Date: Fri, 26 Apr 2024 14:30:37 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <Ziwc/SnWVITvsFgZ@ghost>
References: <20240424-cpufeature_fixes-v1-0-585e73d2226b@rivosinc.com>
 <20240424-cpufeature_fixes-v1-1-585e73d2226b@rivosinc.com>
 <20240426-d8aba0211e882568ccc761df@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240426-d8aba0211e882568ccc761df@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_143043_447893_66A91D9B 
X-CRM114-Status: GOOD (  18.46  )
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

On Fri, Apr 26, 2024 at 11:02:30AM +0200, Andrew Jones wrote:
> On Wed, Apr 24, 2024 at 09:19:54AM GMT, Charlie Jenkins wrote:
> ...
> > +	/*
> > +	 * Naively assume that all harts have the same mvendorid/marchid as the
> > +	 * boot hart.
> 
> This comment isn't necessary, since we don't have to assume all harts have
> the same IDs. This information is currently being collected specifically
> for thead. So, we can state in a comment below, where the information is
> used, that we assume when the boot hart is thead, then we don't want to
> enable V on any hart (whatever their IDs are).

Yes you are correct, I will do as you suggest.

- Charlie

> 
> Thanks,
> drew
> 
> > +	 */
> > +	boot_vendorid = riscv_get_mvendorid();
> > +	boot_archid = riscv_get_marchid();
> > +
> >  	for_each_possible_cpu(cpu) {
> >  		struct riscv_isainfo *isainfo = &hart_isa[cpu];
> >  		unsigned long this_hwcap = 0;
> > @@ -544,8 +553,7 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> >  		 * CPU cores with the ratified spec will contain non-zero
> >  		 * marchid.
> >  		 */
> > -		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
> > -		    riscv_cached_marchid(cpu) == 0x0) {
> > +		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
> >  			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
> >  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
> >  		}
> > 
> > -- 
> > 2.44.0
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
