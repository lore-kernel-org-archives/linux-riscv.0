Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC8DEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ookBVTCRwd74B7oMSIK8S9SC7AtTZZqACLqmApPBmh0=; b=wfKN+SAGgEBaKP
	7KIHBhHE1qCKUH0IePYomDm+2DWYynuCEZhH/OrGUOi+uiItij56Df0I32KCq2pF8JuulHX/qDp1u
	HaDBQKa1boedAebjsW2fZSyhKPZANicePg3I4EkZQpZbMIJLeD6KbDcSusQcu0Gq2R+q2kTkCv5vN
	Tm1oZWG6AVTPE3NGgjxw9Ru1Wz6fcPqEawJZ5PiHIVRLuRj5YxUPkXuuQJaIMbLWR+3rfNGfVrmxc
	LpAh01D7kfBchgtlPzQT8M0VTgOiTadAOjeKuXleIcb5obsmnfYG45/cn9NDi9v0TuEaqD+6BQfL/
	ObOM7bM0cQbbkYT2GQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHV0R-002Xon-2f;
	Thu, 06 Jul 2023 19:51:11 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHV0O-002Xnt-2j
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 19:51:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b8a462e0b0so5924105ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688673066; x=1691265066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7SIfnrH6W+ndBIG+oT0zX41PxWzADh99okj7zLhiK0=;
        b=CO4X1I50kWvov5SoMY3GNP1psp65ddcb3IBeDCXn0w1oq97Zgwf8mxa31TMfEyIr2Q
         W5P69ERWgc5XZQYBGbtiSHEybPu4HeCBoFQpE9u6YXP8TmCPVK2/gSvvD3rj7OgDc56A
         kpck3R+en2tAc/DXlIDatnpT7cA7glU1rbTNt/+iuhljAvZ6eGAawzzOdhKsQNt+PET6
         l8WO5iKW3mK+jBoo6fUxi11xygiunbBEvHF5lpXjYdQDzETC6p8KhgtH2AlsiKIKf/Qq
         KSThj6RDtFlRU0HqWgHDwHffpL29yUeANmhilv7bhCh6PuOzh/TfcD8KmM2mq2qNsb/L
         7QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688673066; x=1691265066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7SIfnrH6W+ndBIG+oT0zX41PxWzADh99okj7zLhiK0=;
        b=YT3MOdTRYoGhUt6meJdQVI1k1j4AMhhoVrNULqF+p9JDrNG1TVVAKYtYWBL1+TSAmj
         sbjGUBpTpIdvkhbX+CQfWN/mcCtdwGbsC2c1rqpzJ/FN0plxZgEucCJ4jlXxEI6uyZqr
         Ax93wzaWGJOdHQ0xiz7Hb/6opQdouz+Fbesth0teI+C+qbHCq2dbIo4k868CiA7BHqJm
         397G76PKKRfyuTXuo6Q5rDehXFlDcUIJaOO0FqVWbAWWwoyYMVk+puGjZ7YOpdMWebO7
         ugGk0aeAuI3XvvNs6GzkeXhq2AN/hqob5Avdfd7qAUnkkh8zdzDxZ4g0BMJQZ4uq1vAx
         YHQw==
X-Gm-Message-State: ABy/qLb4yYxTmiAVISxVpk9RWKcXYw3QqGSv5Fy7ebxa64FiP23dAB9q
	ENUM6KFXo5TRPgOR0jr+1UYZhQ==
X-Google-Smtp-Source: APBJJlF2X52/3Pvd+ZdFOhgdfrTYvfNyCuhE45wjY6c2fADHuAleT51p3v7oewUSckaC8xKctXu0qA==
X-Received: by 2002:a17:902:e88e:b0:1b8:b3f9:58eb with SMTP id w14-20020a170902e88e00b001b8b3f958ebmr2849469plg.31.1688673065601;
        Thu, 06 Jul 2023 12:51:05 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902dac300b001b8aa51821csm1778401plx.138.2023.07.06.12.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 12:51:05 -0700 (PDT)
Date: Thu, 6 Jul 2023 12:51:03 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	evan@rivosinc.com, heiko@sntech.de, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] RISC-V: Framework for vendor extensions
Message-ID: <ZKcbJ9MEP/pBx39J@ghost>
References: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
 <20230705-thead_vendor_extensions-v1-1-ad6915349c4d@rivosinc.com>
 <20230706-curly-swinging-afbf79a4cdb7@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230706-curly-swinging-afbf79a4cdb7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_125108_892796_11142D1E 
X-CRM114-Status: GOOD (  45.96  )
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

On Thu, Jul 06, 2023 at 06:15:57PM +0100, Conor Dooley wrote:
> Hey Charlie,
> 
> On Wed, Jul 05, 2023 at 08:30:17PM -0700, Charlie Jenkins wrote:
> > Create Kconfig files, Makefiles, and functions to enable vendors to
> > provide information via the riscv_hwprobe syscall about which vendor
> > extensions are available.
> 
> This is all apparently from reading the diff, you don't need to tell us
> what files you have created etc. Please just stick with explaining the
> rationale for your changes (especially anything that might make someone
> reading it go "huh").
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/Kbuild                     |  1 +
> >  arch/riscv/Kconfig                    |  1 +
> >  arch/riscv/Kconfig.vendor             |  3 +++
> >  arch/riscv/include/asm/hwprobe.h      |  1 +
> >  arch/riscv/kernel/sys_riscv.c         | 40 ++++++++++++++++++++++++++++++++---
> >  arch/riscv/vendor_extensions/Makefile |  3 +++
> >  6 files changed, 46 insertions(+), 3 deletions(-)
> 
> > diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
> > index afa83e307a2e..bea38010d9db 100644
> > --- a/arch/riscv/Kbuild
> > +++ b/arch/riscv/Kbuild
> > @@ -3,6 +3,7 @@
> >  obj-y += kernel/ mm/ net/
> >  obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
> >  obj-y += errata/
> > +obj-y += vendor_extensions/
> >  obj-$(CONFIG_KVM) += kvm/
> >  
> >  obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) += purgatory/
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index c1505c7729ec..19404ede0ee3 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -276,6 +276,7 @@ config AS_HAS_OPTION_ARCH
> >  
> >  source "arch/riscv/Kconfig.socs"
> >  source "arch/riscv/Kconfig.errata"
> > +source "arch/riscv/Kconfig.vendor"
> >  
> >  menu "Platform type"
> >  
> > diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
> > new file mode 100644
> > index 000000000000..213ac3e6fed5
> > --- /dev/null
> > +++ b/arch/riscv/Kconfig.vendor
> > @@ -0,0 +1,3 @@
> > +menu "Vendor extensions selection"
> > +
> > +endmenu # "Vendor extensions selection"
> 
> These files don't do anything, don't add them until you need to.
I wasn't sure if it was more clear to split up the vendor extension
framework from the T-Head specific calls since the main goal of this
series is to propose a vendor extension framework. I can merge this with
the following patch.
> 
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> > index 78936f4ff513..fadb38b83243 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -9,5 +9,6 @@
> >  #include <uapi/asm/hwprobe.h>
> >  
> >  #define RISCV_HWPROBE_MAX_KEY 5
> > +#define RISCV_HWPROBE_VENDOR_EXTENSION_SPACE (UL(1)<<63)
> 
> Should this not be BIT_ULL(63)? Although I am not sure that we can
> actually do this, more on that front later.
> 
> >  
> >  #endif
> > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> > index 26ef5526bfb4..2351a5f7b8b1 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -188,9 +188,35 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
> >  	return perf;
> >  }
> >  
> > +static int hwprobe_vendor(__u64 mvendorid, struct riscv_hwprobe *pair,
> > +			 const struct cpumask *cpus)
> > +{
> > +	switch (mvendorid) {
> > +	default:
> > +		return -1;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >  			     const struct cpumask *cpus)
> >  {
> > +	int err;
> > +
> > +	if (((unsigned long) pair->key) >= RISCV_HWPROBE_VENDOR_EXTENSION_SPACE) {
> 
> Hopefully Bjorn or someone that actually knows a thing or two about uapi
> stuff can chime in here, but I think what you are doing here (where the
> vendor space sets the MSB) really muddies the api. These keys are defined
> as signed 64 bit numbers & -1 is the value set when a key is not valid.
> I'd much rather we kept the negative space off-limits, and used the 62nd
> bit instead, avoiding using negative numbers for valid keys.
> 
Yeah that makes sense, I can change this up.
> > +		struct riscv_hwprobe mvendorid = {
> > +			.key = RISCV_HWPROBE_KEY_MVENDORID,
> > +			.value = 0
> > +		};
> > +
> > +		hwprobe_arch_id(&mvendorid, cpus);
> 
> I think this needs a comment explaining why you do this hwprobe call, 
> > +		if (mvendorid.value != -1ULL)
> > +			err = hwprobe_vendor(mvendorid.value, pair, cpus);
> > +		else
> > +			err = -1;
> > +	}
> 
> I don't really understand the control flow here. Why are you continuing
> on to the switch statement, if you have either a) already ran
> hwprobe_vendor() or b) noticed that mvendorid.value is not valid?
> 
The purpose of this was to consolidate the error handling to a single
spot at the bottom of the file. It would fall through the switch
statement and set the values appropriately. I guess it does seem a bit
awkward.
> >  	switch (pair->key) {
> >  	case RISCV_HWPROBE_KEY_MVENDORID:
> >  	case RISCV_HWPROBE_KEY_MARCHID:
> > @@ -217,13 +243,21 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >  
> >  	/*
> >  	 * For forward compatibility, unknown keys don't fail the whole
> > -	 * call, but get their element key set to -1 and value set to 0
> > -	 * indicating they're unrecognized.
> > +	 * call, instead an error is raised to indicate the element key
> > +	 * is unrecognized.
> >  	 */
> >  	default:
> > +		err = -1;
> > +		break;
> > +	}
> > +
> > +	/*
> > +	 * Setting the element key to -1 and value to 0 indicates that
> > +	 * hwprobe was unable to find the requested key.
> > +	 */
> > +	if (err != 0) {
> >  		pair->key = -1;
> >  		pair->value = 0;
> > -		break;
> >  	}
> >  }
> >  
> > diff --git a/arch/riscv/vendor_extensions/Makefile b/arch/riscv/vendor_extensions/Makefile
> > new file mode 100644
> > index 000000000000..e815895e9372
> > --- /dev/null
> > +++ b/arch/riscv/vendor_extensions/Makefile
> > @@ -0,0 +1,3 @@
> > +ifdef CONFIG_RELOCATABLE
> > +KBUILD_CFLAGS += -fno-pie
> > +endif
> 
> There are no files in this directory, why do you need to do a dance
> about relocatable kernels?
> 
This is framework for the following patch in the series. I saw these
lines in the errata Makefile so I created this Makefile to set up the
following patch in the series. I can merge this patch with the following
patch to make this series more clear.
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
