Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA66C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 21:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRH3BUKRjLy4T+rvP8ZwNc4FoU5cfFnuKo0894ait9I=; b=4dxX6xW8oerFJK
	Al2A0p4WBFBhxMgp7I/eJ3Bq2xxo4xQC94pkNHPqegCuM3ezuqUqQh6e01zh/0IHrAoV84Cm7ZXkl
	G/+SHaa8ONcRQspNGa6xDRnAVhLcGoe9f9x93NQXnWIz0I01HaR196o5GN84RzDBk9LhkmNrE/wHJ
	egc60aNsoYeojvtNM5ihaXXNY/yJIZQHseOz6Xcr0xxdM48Xqb/rghT8t7y2rgjsG4Q1GOxWA8H1Q
	2vmisoREIOADoUQwm0FylWBA1whR99zXkYYCC/OXRV9+J4z1fyUZl/4FFeWZixdpGZgJ0fDDMJRP+
	YZl2zrohBA0X4GPUOW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMwY0-0000000BkvR-2rSI;
	Thu, 27 Jun 2024 21:20:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMwXx-0000000BkuW-3nbz
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 21:20:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f6a837e9a3so52570465ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 14:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719523248; x=1720128048; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=exJx7MLHmhBfufwvX1HMSMkLUGzkmkvSDGWi4KvWQsU=;
        b=jdkr09IptJGkq2+XUdX4K0eORtHts6yzuqFqtKNhG+nOctfGGCPxoPXK6iE4RHcjJv
         mlai96WERKRWUWiSE/47Smx0TAVXWOtpRGFDk3CmoBbzMnK8C/eUpPN4+FuqWbSJLITM
         AhVt2YQ1yeTKk0aMeXjODA0KEVHyCGRsFjWwApqCYZ/KtkxHc2LDUzDMkTDg5AOB2mcA
         C31iKnispNqrRkrtt7w7Yd5aSLGm4L/A0Z8KDDkrtG7DEr8JyRBEeqj9xG42IVEwT+HT
         Qq7jxfhPKhls8mglxSZDCB+nRFJR+6eiLrNGRcUOZ5Z7vJoyg0PBDVERflNoT8gzy+Ku
         Cb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719523248; x=1720128048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exJx7MLHmhBfufwvX1HMSMkLUGzkmkvSDGWi4KvWQsU=;
        b=r0I+ej7c27WPbob3DD/0bdFvCliRhShDuGwlCMeBpKuGLoN12JO+nMiOYwg7kdu9z3
         JdiEMjQCFvP9+xLb7rBv8aCUVjydK5SPk2ExLXgfE0o++wnvTy6CYonatJH67lWAt5mA
         NCAxQK9FFesmFKkYYHNfJ89va1d9lRiWQQ1xlXUZ3tBwATV+1sBTD2uT0HT+jOk7t+Ad
         j5+td++5f9GjTTg8tVTIH4RiPCBHCwWPDXGZ+sycob/H+WDGtJVcv4S+FBjfLvf4o66B
         iAuznaVMzpBceGXquiiTzSElHXljsqG4GdpI0LhiSWM3wCIu19Ivs5zshDTTGNGPyCE1
         USow==
X-Forwarded-Encrypted: i=1; AJvYcCWpNVc+q1IRk3VrvTOfhhMe0y3RcB/dYTErVUgEyM7O6tijH574Z+ROdJDXy345l1CkZJBmJ9/4rd9QfSvxKjmoXIeGDiZ910JgeN1xWaBU
X-Gm-Message-State: AOJu0YyLj/S09MAxTiGvXsh1lTGP/1jh45QOIzVEksnOyyfEZDcs/+aA
	cgbpvM3Ak41cu6nIKfhyCw5fgTtNuGOwQ+N1N1KQj3Lot3//sDq1FJxMsm6j+lI=
X-Google-Smtp-Source: AGHT+IGz34zuJdkPHa55bzUnF3pVUAjXlKAg/ZK+Xx4lnJseZeESVd/0JFLcbe/sbMFtYV8yKgFslQ==
X-Received: by 2002:a17:902:d50b:b0:1f9:d982:5f23 with SMTP id d9443c01a7336-1fa23f073e3mr162626865ad.12.1719523248499;
        Thu, 27 Jun 2024 14:20:48 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159d32csm2113575ad.291.2024.06.27.14.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 14:20:47 -0700 (PDT)
Date: Thu, 27 Jun 2024 14:20:44 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/8] RISC-V: Check Zicclsm to set unaligned access
 speed
Message-ID: <Zn3XrLRl/yazsoZe@ghost>
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-5-jesse@rivosinc.com>
 <20240626-march-abreast-83414e844250@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626-march-abreast-83414e844250@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_142050_281063_7E106C5E 
X-CRM114-Status: GOOD (  27.03  )
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

On Wed, Jun 26, 2024 at 03:39:14PM +0100, Conor Dooley wrote:
> On Mon, Jun 24, 2024 at 08:49:57PM -0400, Jesse Taube wrote:
> > Check for Zicclsm before checking for unaligned access speed. This will
> > greatly reduce the boot up time as finding the access speed is no longer
> > necessary.
> > 
> > Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> > ---
> > V2 -> V3:
> >  - New patch split from previous patch
> > ---
> >  arch/riscv/kernel/unaligned_access_speed.c | 26 ++++++++++++++--------
> >  1 file changed, 17 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> > index a9a6bcb02acf..329fd289b5c8 100644
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> > @@ -259,23 +259,31 @@ static int check_unaligned_access_speed_all_cpus(void)
> >  	kfree(bufs);
> >  	return 0;
> >  }
> > +#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> > +static int check_unaligned_access_speed_all_cpus(void)
> > +{
> > +	return 0;
> > +}
> > +#endif
> >  
> >  static int check_unaligned_access_all_cpus(void)
> >  {
> > -	bool all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
> > +	bool all_cpus_emulated;
> > +	int cpu;
> > +
> > +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
> > +		for_each_online_cpu(cpu) {
> > +			per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
> 
> - const: zicclsm
>   description:
>     The standard Zicclsm extension for misaligned support for all regular
>     load and store instructions (including scalar and vector) but not AMOs
>     or other specialized forms of memory access. Defined in the
>     RISC-V RVA Profiles Specification. 
> 
> Doesn't, unfortunately, say anywhere there that they're actually fast :(

Oh no! That is unfortunate that the ISA does not explicitly call that
out, but I think that acceptable.

If a vendor puts Zicclsm in their isa string, they should expect
software to take advantage of misaligned accesses. FAST is our signal to
tell software that they should emit misaligned accesses.

This allows for a generic kernel, like the one a distro would compile, to
skip the probing when booting on a system that explicitly called out
that the hardware supports misaligned accesses.

- Charlie

> 
> Thanks,
> Conor.
> 
> > +		}
> > +		return 0;
> > +	}
> > +
> > +	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
> >  
> >  	if (!all_cpus_emulated)
> >  		return check_unaligned_access_speed_all_cpus();
> >  
> >  	return 0;
> >  }
> > -#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> > -static int check_unaligned_access_all_cpus(void)
> > -{
> > -	check_unaligned_access_emulated_all_cpus();
> > -
> > -	return 0;
> > -}
> > -#endif
> >  
> >  arch_initcall(check_unaligned_access_all_cpus);
> > -- 
> > 2.45.2
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
