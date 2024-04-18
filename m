Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0ABC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 19:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAPzurDGRDuYSzmxEnLzp9ifOovmfwUjI3fFIbuiIvI=; b=w1xEbVpmnDnQZg
	Cnp1XNRobj2ClXXVv7yfDm6OZcrmz6WxqNbRsDlKqLnX3MWeUa57W424ujz5TRxqklIieDn14KETd
	J7yU7qI+ExxKBesqNFdPmUeHBpOC1peZQ4fPaG1vcpIbzYShKpDE27JwI/LuGRC5qA0R3Tuj8uZC7
	yjB3TObVJDCR8y5cGvJszrZIlDxt2Fyd17kPzybCdaac7O5X4dDl90KlRFfOgKicgJgoZekoF8ZcJ
	r3db/pzdxSIkTLAgB5tIxuCNr8oph5v5QdMy0L0fknnKOsf/g47JEGT2c1H5TP1uE2LcJ3raSYqmo
	3S7L8NYxIXOYhKFlY+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxXA3-00000003QDx-0YzC;
	Thu, 18 Apr 2024 19:11:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxX9y-00000003QBD-400h
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 19:11:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-418e4cd2196so8223975e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 12:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713467456; x=1714072256; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yXdSYYCw4tbBK12sFpumhiTHBryJ6X9NPqaTloVYbGU=;
        b=GO9qtMhTmG3sGYvhuY7B+7iEn3BPaNp8wfGueWZr34pqJRKRDbmDU5rASQyl2zD2kl
         oaXZybfr32L5gWpBROhJxQhYhe9CA2nH+b1frNtMw6/lGl4XHI3rM75o6ZnfgnLH+pXM
         ipLA2wfz/0aUxKF1PGvWEwpWo+RWUvmh1AE44QGhzHLmXOEcYvSD524gWbuUgkCuRDAb
         oNRc/Qq6UbuAbx/lcmzgGkl/QiasFuScJJwjfKdgeQTQc3YB4YOiLIbpDhtyOdZxeBlK
         71LO89uHLEEg9fa0gdSsj7Enb4uedne7vTeiqFi5pKugUry+9EARtOREnKqHOkw7oLn1
         WcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713467456; x=1714072256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXdSYYCw4tbBK12sFpumhiTHBryJ6X9NPqaTloVYbGU=;
        b=FVPhcfK5mn4KD6sCy68wpY/a62TV9ON0O+EQBhpSTmZgQbtSgSP5ObRpEYb42HN158
         OjTiyglgiAmQuvaJ+7sahUnomk7DgpbQubwuKP33os8SHfpGCiLUgDdsxzwsRD/YN89H
         daRZ0PKWm+hquwODYjTvtsfajjNJYrIB3ZqNVFR9GOpDFlu64Dmk79V+XzQLDPOzdCoe
         XtRnxclZqYrhpDgxTapusBGlA0g8Jb9GCU/RhGv/T/kbNuPcl1D4StkVOK6vC5cRmUdt
         IymjLQ6f4LB3Pklj1cwqVP+SZXATHkR2hYIFiHxMrGUlXMncGfaujiJPPqjSZIRv7I6h
         7sMA==
X-Forwarded-Encrypted: i=1; AJvYcCU/hkmlk2p3BdS3LuO8Ne+WgQO3ZuHnvCsOgspy4p8erPvWPsGGSqTQ9GYgK1TyJiABO5DlWZ02yJdFB189Whn0DccYWWPv+Gcudj+6d5lQ
X-Gm-Message-State: AOJu0YyJSnN1gs66ZI7DzZFZzMkPhXeiuIwzLS6S72FMAQjwwXxz4JZP
	2AmDWTNwLmbu4jpRimpwa6Nfi43O8ZGT1GRwodQc4frk0mr2t7MbFoUg7/SgE08=
X-Google-Smtp-Source: AGHT+IEW9e+5B+54U3zhcer9b4WmdKoqb4N3E3Rq+DsJVrLICB1hplQdrHWsY00Soarca1d97Rc1YA==
X-Received: by 2002:a05:600c:4511:b0:417:fbc2:caf8 with SMTP id t17-20020a05600c451100b00417fbc2caf8mr2760993wmo.23.1713467456173;
        Thu, 18 Apr 2024 12:10:56 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b00418a6d62ad0sm7472101wmq.34.2024.04.18.12.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 12:10:55 -0700 (PDT)
Date: Thu, 18 Apr 2024 21:10:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Xu Lu <luxu.kernel@bytedance.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com, guoren@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, lihangjing@bytedance.com, 
	dengliang.1214@bytedance.com, xieyongji@bytedance.com, chaiwen.cc@bytedance.com
Subject: Re: [RFC 1/2] riscv: process: Introduce idle thread using Zawrs
 extension
Message-ID: <20240418-d9f305770dc71c2687a6e84b@orel>
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
 <20240418114942.52770-2-luxu.kernel@bytedance.com>
 <20240418-dove-deferral-2b01100e13ca@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418-dove-deferral-2b01100e13ca@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_121103_028177_7A0245AC 
X-CRM114-Status: GOOD (  24.07  )
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

On Thu, Apr 18, 2024 at 04:05:55PM +0100, Conor Dooley wrote:
> + Drew,
> 
> On Thu, Apr 18, 2024 at 07:49:41PM +0800, Xu Lu wrote:
> > The Zawrs extension introduces a new instruction WRS.NTO, which will
> > register a reservation set and causes the hart to temporarily stall
> > execution in a low-power state until a store occurs to the reservation
> > set or an interrupt is observed.
> > 
> > This commit implements new version of idle thread for RISC-V via Zawrs
> > extension.
> > 
> > Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> > Reviewed-by: Hangjing Li <lihangjing@bytedance.com>
> > Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
> > Reviewed-by: Wen Chai <chaiwen.cc@bytedance.com>
> > ---
> >  arch/riscv/Kconfig                 | 24 +++++++++++++++++
> >  arch/riscv/include/asm/cpuidle.h   | 11 +-------
> >  arch/riscv/include/asm/hwcap.h     |  1 +
> >  arch/riscv/include/asm/processor.h | 17 +++++++++++++
> >  arch/riscv/kernel/cpu.c            |  5 ++++
> >  arch/riscv/kernel/cpufeature.c     |  1 +
> >  arch/riscv/kernel/process.c        | 41 +++++++++++++++++++++++++++++-
> >  7 files changed, 89 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index be09c8836d56..a0d344e9803f 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -19,6 +19,7 @@ config RISCV
> >  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> >  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> >  	select ARCH_HAS_BINFMT_FLAT
> > +	select ARCH_HAS_CPU_FINALIZE_INIT
> >  	select ARCH_HAS_CURRENT_STACK_POINTER
> >  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
> >  	select ARCH_HAS_DEBUG_VM_PGTABLE
> > @@ -525,6 +526,20 @@ config RISCV_ISA_SVPBMT
> >  
> >  	   If you don't know what to do here, say Y.
> >  
> > +config RISCV_ISA_ZAWRS
> > +	bool "Zawrs extension support for wait-on-reservation-set instructions"
> > +	depends on RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Adds support to dynamically detect the presence of the Zawrs
> > +	   extension and enable its usage.
> 
> Drew, could you, in your update, use the wording:
> 	   Add support for enabling optimisations in the kernel when the
> 	   Zawrs extension is detected at boot.

How about

  The Zawrs extension defines a pair of instructions to be used in
  polling loops which allow a hart to enter a low-power state or to
  trap to the hypervisor while waiting on a store to a memory location.
  Enable the use of these instructions when the Zawrs extension is
  detected at boot.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
