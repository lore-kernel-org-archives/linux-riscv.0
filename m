Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5295C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzdSef4aTQ2GIDJA/5zM1AqnbDHijE3bdLgNgdRyAy8=; b=ipTNHU+jp/IzhG
	88F9p27HG11Pi1QVrw7fP3OvZeeUNDq4Qf0XRo8Fg/Jx9dS6/vbFw99KXLm3kngVnRPF+z97jkmAX
	aKRxMREhObUPtM4+OIIMg9po+zHXwL497F5Ly/wsF3X+Oh8a8r/dFc1wsIj2sU3R8/qNuwO+Ks+bL
	4cGFk77zAbz2gkl9bT+D8qG2t0aMeXbuQDgowrhdiXlvuMN4rrwH7bTfzkEmpMmmIxCwEnkmDri48
	rO3WqzTpO+N4kvDCF4PvqJXx6rB6Cw5GydaRNzhHHnVwWGFrMVRVZpKjeOHy8uUOqH0fBQ/c97CMl
	/fG+o7kPtkhZonnCNHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DOH-0000000AFvl-1Yfd;
	Wed, 01 May 2024 17:05:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DOD-0000000AFtm-3RMO
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 17:05:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e65a1370b7so65622165ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 10:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714583102; x=1715187902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElGjJ6DhmRlqGsY+eiWz/anA6sw6bSbldqs1mMMSdXY=;
        b=1rvf9KTX230WqztUm6lwRSWpwKcueKs4KqGAzm4TyUDAaGIOX9Pq5rTwb4ag2U+yXn
         OL0ZnkUTydEDsKxSePEg3lrC3UnSPEMe+2dFE9hIhJuuc+d1XbtGoD7KGDOc9mQM+iyR
         sh71lDwCJTKsFaEif0VUAT4P6tYoXNwLfVocikF3XN5biZaqq7Jy582F12DfGw8N/myK
         1ctDwdUEFmFfxKt9GbK07wuqubiwUGE4Uxyfo7noDQ/MnxazduIlZVMQE3fus6Uf15jR
         ima/NYAirFkoXteZgN6/MIUPS4H99MdJASSN6D4YALy5a5lYN0Bcg1QKx7KTNFAuzKSV
         650Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714583102; x=1715187902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElGjJ6DhmRlqGsY+eiWz/anA6sw6bSbldqs1mMMSdXY=;
        b=HH42dEgX4zEm+RY5+dFm++Oz/IIJki5KOkQ5BpqguiHLsCxcPGOmR8x1L2AMZD9/Zp
         KzxcKnDPauDyXcY2xTTNJUJDzyLO15r7s6XP+4MQDLOzByel0c6dhPMmnUSYn71GZMVa
         AttByp6R9KC7xHAyYBw8h+fDTrIqtkmabfCCnetVOd7/NT8j/5R+JvW9qiTFqXAGEqPJ
         KG7toxltsgicWBrgzMiQbZ90Hd8RlQjPVE3GeYha9SAhlTdBi1533QVET+r75arzHZwz
         MNpMubK7oLtQvzczCkv1YjmXL4bd+9Oc9rBwxzPq5TwF2fBTqp1CRDpAXFUB57nVnpRg
         BnGg==
X-Forwarded-Encrypted: i=1; AJvYcCX0a1g48uhd5vEhBUf/mmvWSTzS9zaF0aK7BRZRv7ZdMz9K13t/CURhBPQpxJ3El2W1ItvGy2i5ZE3tRI6kyvYi643vHTTg4si7oLp5tdoN
X-Gm-Message-State: AOJu0YzvVl0RjEs0z0kAwsaRsQxjI2UYlxs5XyZzu+tIJX60/gNlE0pm
	Hd6Ib+0Y2+fj7j2wTMSCDPAbU0PPBTlWY2kAXwqg6hEKfVwjr9TJcjKymHnmlu0=
X-Google-Smtp-Source: AGHT+IFvczd8ByrKjRpEmw2Tm8e/A7jIBRbW9BHOckqa6SdF3HlIzepIjpMlwHXG9pT5WMnsKMpNHw==
X-Received: by 2002:a17:902:e54f:b0:1eb:dae:bdab with SMTP id n15-20020a170902e54f00b001eb0daebdabmr3974726plf.46.1714583102382;
        Wed, 01 May 2024 10:05:02 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902ea0100b001e3d2314f3csm24412023plg.141.2024.05.01.10.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:05:02 -0700 (PDT)
Date: Wed, 1 May 2024 10:04:58 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <ZjJ2Omhynz02mAGk@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <20240501-chastise-gecko-342f2c35cfc1@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-chastise-gecko-342f2c35cfc1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_100505_898702_B8387BF2 
X-CRM114-Status: GOOD (  26.96  )
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

On Wed, May 01, 2024 at 11:46:07AM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:19PM -0700, Charlie Jenkins wrote:
> > Separate vendor extensions out into one struct per vendor
> > instead of adding vendor extensions onto riscv_isa_ext.
> > 
> > Add a hidden config RISCV_ISA_VENDOR_EXT to conditionally include this
> > code.
> > 
> > The xtheadvector vendor extension is added using these changes.
> 
> This mostly looks good to me, thanks for the updates. There's one thing
> that I think is wrong, but I need to test and will get back to you on...
> 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig                               |  2 +
> >  arch/riscv/Kconfig.vendor                        | 19 ++++++
> >  arch/riscv/include/asm/cpufeature.h              | 18 ++++++
> >  arch/riscv/include/asm/vendor_extensions.h       | 26 ++++++++
> >  arch/riscv/include/asm/vendor_extensions/thead.h | 19 ++++++
> >  arch/riscv/kernel/Makefile                       |  2 +
> >  arch/riscv/kernel/cpufeature.c                   | 77 ++++++++++++++++++------
> >  arch/riscv/kernel/vendor_extensions.c            | 18 ++++++
> >  arch/riscv/kernel/vendor_extensions/Makefile     |  3 +
> >  arch/riscv/kernel/vendor_extensions/thead.c      | 36 +++++++++++
> >  10 files changed, 200 insertions(+), 20 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index be09c8836d56..fec86fba3acd 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -759,6 +759,8 @@ config RISCV_EFFICIENT_UNALIGNED_ACCESS
> >  
> >  endchoice
> >  
> > +source "arch/riscv/Kconfig.vendor"
> > +
> >  endmenu # "Platform type"
> >  
> >  menu "Kernel features"
> > diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
> > new file mode 100644
> > index 000000000000..4fc86810af1d
> > --- /dev/null
> > +++ b/arch/riscv/Kconfig.vendor
> > @@ -0,0 +1,19 @@
> > +menu "Vendor extensions"
> > +
> > +config RISCV_ISA_VENDOR_EXT
> > +	bool
> > +
> > +menu "T-Head"
> > +config RISCV_ISA_VENDOR_EXT_THEAD
> > +	bool "T-Head vendor extension support"
> > +	select RISCV_ISA_VENDOR_EXT
> > +	default y
> > +	help
> > +	  Say N here if you want to disable all T-Head vendor extension
> > +	  support. This will cause any T-Head vendor extensions that are
> > +	  requested to be ignored.
> 
> What does "requested to be ignored" mean to a punter configuring a
> kernel? I'd expect this to be something like:
> 
> "Say N here to disable detection of and support for all T-Head vendor
> extensions. Without this option enabled, T-Head vendor extensions will
> not be detected at boot and their presence not reported to userspace."

Sounds great I will change to that.

- Charlie

> 
> In general, I'd expect something that needs some support in the kernel
> (like vector) to function to have a dedicated option, but the likes of
> their Zba variant could be detected and reported via hwprobe et al
> once RISCV_ISA_VENDOR_EXT_THEAD is enabled.
> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
