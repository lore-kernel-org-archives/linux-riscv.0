Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9658C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAxoPkXgNHOVlHqzywf/CyyNKkr7EGjHvqStgtPFq/s=; b=fKnhqxmzIr/R9I
	K/uCT1R9Q9fDboZgI+M7AjkReGsDPFaOqZsKD2Yw27mi2/JdCZ4aWcBRM6SAcXhqBPpU1ITHmvgus
	T+/wacauLJhDAvelRepiv4ADXMsjxiXMEU7SEB7aGUrNYBd+j32NIW3w6hz5sC7nUsPeUzDWODduo
	CUeBiNR5mI516M0hJku69XGVMNVNjJkotCa2qiDc7lNFqF3HjPpe/kKDRPLj3vuHYRRw3Ot/fPlnw
	hD2ii5upOTYHrpWxmEIM+llLzsQgCH/e3ZCzgcQ5EKgFNMbDqYrvvUN6xr8zhTV7WLsgtCyLwzYbz
	K/bmuty/8j7Q/dgvbKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKRy-00000000cx6-1vy6;
	Fri, 12 Apr 2024 17:12:30 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKRu-00000000cvt-1inh
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 17:12:28 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso714983a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 10:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712941943; x=1713546743; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V6RQsJgA0sqhyVb4iUdwKlWBxVZP7PvFbdqSmnVezOg=;
        b=sb5P1zFypXLFjPTqp1AAhvTWXs0/3xlAQ8XIwnoKkhMlzZNfUZi+GvptsFvvTbctcS
         57QGtda2xEXppTUmsFbEAELdwgveffuW/g8QO4Q4pk0En3ZUBQGqQHxDegcDAQsSG0DU
         VtO2x7HvE+V10eZcsd/Q5uE6bmMn7yrvWcps+7yfmLFAghmGF/FIDJNRMmsWdy+Vzb5G
         LyNxIB0+M9o8+v5OTlkySAmWlLLn2N+Y8o/OkEX7oHOZmDyvHMvRSJkJSGvV5slOdmhw
         FQqAxHt5et4yCcj6+o3nL8IIeL/T2aWy/KuqYSyW68POYb7lYaSxBRcji7Yvsf5l0TJX
         LmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712941943; x=1713546743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6RQsJgA0sqhyVb4iUdwKlWBxVZP7PvFbdqSmnVezOg=;
        b=L4tSQci+5L7Gj/HAcO8GLDdrcsxSb3ddcHqvy7fFAd14oSWq6otovRTCm0Ue3UKcbs
         qj5irrMkr3rqlqEFH/A+HGyNzwLcgmUhUu50S0v6ux9MAbVNwOAs7MBkFV6aFrLwqZEq
         gsIDVqvycW/IGYdB2goukiZMdFLeh/0Oa6BvmnNtkf8cC3/fP+QZDnlx/eb61j6PhYNs
         ZAya0wtx5XTo00GhLzAM4RdT3y74FpszxNX7bTLGclIcKVPBRgy9CrnM1k5hO6exCMqb
         Xm1t2nuHueW1JBY0W1zsssHTHiJCbZ8FvPmBHTgTv9L+j8kaWas6sVPhsucnSuuv5mFA
         RIxg==
X-Forwarded-Encrypted: i=1; AJvYcCW9AaFHjYAymzPpKB1t7hAoC829OkBxprtDkyAISlr+Vpbrww8ND40GKhYEBmhZ63/UN7c12pgIaZiMBcTITHzb2mbPE5f4xr6azvg4zfLP
X-Gm-Message-State: AOJu0YzJ5KIsYPjQH8tGIli+cOWwaQpUvS+zXKW40Ep1KUu7KmL7zcNh
	1vfnwHl0+ryRFXdgFLOeELlwqSz2t+hLtU/sSOJDqGMqcDA4g2b3DPZ3znaA5sU=
X-Google-Smtp-Source: AGHT+IGENLLg9Nrtb+afnnQbyAqzrlHIs52avdhanWUzgTqUmFBmisUUxHkztjDQR67LUvfCdWQBaQ==
X-Received: by 2002:a05:6a20:550a:b0:1a9:4343:765f with SMTP id ko10-20020a056a20550a00b001a94343765fmr3511412pzb.23.1712941942911;
        Fri, 12 Apr 2024 10:12:22 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:121b:da6b:94f1:304])
        by smtp.gmail.com with ESMTPSA id u4-20020aa78484000000b006ed59179b14sm3114754pfn.83.2024.04.12.10.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 10:12:22 -0700 (PDT)
Date: Fri, 12 Apr 2024 10:12:20 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <ZhlrdGXfSushUNTp@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-tuesday-resident-d9d07e75463c@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_101226_480716_B4E30766 
X-CRM114-Status: GOOD (  31.17  )
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

On Fri, Apr 12, 2024 at 11:25:47AM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:08PM -0700, Charlie Jenkins wrote:
> > The riscv_cpuinfo struct that contains mvendorid and marchid is not
> > populated until all harts are booted which happens after the DT parsing.
> > Use the vendorid/archid values from the DT if available or assume all
> > harts have the same values as the boot hart as a fallback.
> > 
> > Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs")
> 
> If this is our only use case for getting the mvendorid/marchid stuff
> from dt, then I don't think we should add it. None of the devicetrees
> that the commit you're fixing here addresses will have these properties
> and if they did have them, they'd then also be new enough to hopefully
> not have "v" either - the issue is they're using whatever crap the
> vendor shipped.

Yes, the DT those shipped with will not have the property in the DT so
will fall back on the boot hart. The addition of the DT properties allow
future heterogenous systems to be able to function.

> If we're gonna get the information from DT, we already have something
> that we can look at to perform the disable as the cpu compatibles give
> us enough information to make the decision.
> 
> I also think that we could just cache the boot CPU's marchid/mvendorid,
> since we already have to look at it in riscv_fill_cpu_mfr_info(), avoid
> repeating these ecalls on all systems.

Yeah that is a minor optimization that can I can apply.

> 
> Perhaps for now we could just look at the boot CPU alone? To my
> knowledge the systems that this targets all have homogeneous
> marchid/mvendorid values of 0x0.

They have an mvendorid of 0x5b7.

This is already falling back on the boot CPU, but that is not a solution
that scales. Even though all systems currently have homogenous
marchid/mvendorid I am hesitant to assert that all systems are
homogenous without providing an option to override this. The overhead is
looking for a field in the DT which does not seem to be impactful enough
to prevent the addition of this option.

> 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> > @@ -514,12 +521,23 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> >  				pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> >  				continue;
> >  			}
> > +			if (of_property_read_u64(node, "riscv,vendorid", &this_vendorid) < 0) {
> > +				pr_warn("Unable to find \"riscv,vendorid\" devicetree entry, using boot hart mvendorid instead\n");
> 
> This should 100% not be a warning, it's not a required property in the
> binding.

Yes definitely, thank you.

- Charlie

> 
> Cheers,
> Conor.
> 
> > +				this_vendorid = boot_vendorid;
> > +			}
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
