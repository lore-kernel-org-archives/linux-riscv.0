Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E0DC00A94
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 18:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTTWu9gubgKMVWBYwciTdr0OtYoKiFL5ZC1ewjUSXl0=; b=RBbyiGGX1PRXyX
	PYmJOE0Wnm0iOT6KAV1AhflWSuMrBiCKqbNUgBakAU5auKcWuAhn9v/XpyQxsQW7jrbThmR7I9b/K
	onP/+v6bVSf+cIqClgA3bAtHlHQqbDbIYMNOgriVyGPDrhq3A0A9drlUevO59Js4ZIbYsI6/ddYoh
	9PphQ35jKPLONJZiR4AJenFrTdFJec4uYUojl/07NEN2Wh+3Oxjyv+6Cpz6MYOIb2cMfmMt1GMCox
	xPJwJlrNKox1E4sQSm+436xPejQYVKLmwFIkME9B/drXKChj2txkZj9mJvaZe8y1lwUxsbR5LU+3g
	S53Zzau9LSF5Ee46CDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLbP-00000000rBz-2p2r;
	Fri, 12 Apr 2024 18:26:19 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLbM-00000000rAg-42Uu
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 18:26:18 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ee13f19e7eso1003387b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712946375; x=1713551175; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMxTHfwmfGngfKcHt9BB7WUlzUr2s5LaZsK/l59Ii3w=;
        b=sF3tLcWINzzU+SOCfFioBX6XcUcbdMkjCJ55b6RvldUql1ZNssS4ZEhiuBVscgExuS
         NDqUtK4obyqsIY3vc31ZnNQ3XmnAXS7mPEO3Ad/QPF9sZ+XUo1hWhaxIlBOfMFd1XicZ
         DNfSnQTlzI6C++nQT5+DhN60+jMFsqDPEWBNhqZdgch9B093+nrIWLnJ9HEMyfM9OGFS
         emYzuhkazjinjx0Q7cmYc0KF/Ylc229tOjFB+ReDrMvrSI70JLsjLv+LX+PTeRRiWE2B
         BuGn2SN+NyCUWkOl8CqI0ncLH5uoQq0TfGUi9cQGEe7uq1HahH9PQ0KTeydGWTMDFXFX
         YF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712946375; x=1713551175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMxTHfwmfGngfKcHt9BB7WUlzUr2s5LaZsK/l59Ii3w=;
        b=lWoONlcnRpUKh47OLn8LhGNGeoV4d9QZrV4JYO8DbglRay6JI4ocWqkjamDedMZdTC
         1/KJud+XSY0acBYqllwwcc9CUWTc462OEM5c49JmEk4Z2/tA8K3H5LuMu+1mEWbYy7z1
         WEpnF5C+DTNJXG1CABXiE6QlLkbagj410nQFVa7IYoFfTMzBnvK5Z8ScjxaqXG3S0cwS
         1LoU6j8m5SFd1MaYw4Pu79MYjR30WhnM0LlirDUmeA2/YSO1aoitbXG1u4+SWwo1AkeI
         JwPpABXi0zKD97DjcMOZP8N1W6ottErfI5Gfa8uRd1zLDmq1scyVr4OxjIe00yNWFast
         nUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWImTeBNj8lcOT/dErMBsOa2LRp1CbmSURjxDwTrh/Zsc6qfnJEu8/YzLjnlYOEtB7tw+gUzfDpsCufZUuAN8/Z5b/1xs/m7deorULL62Ur
X-Gm-Message-State: AOJu0Ywe0Dwyf+GXwulIVtqo336sQetfDdGQTaa5HEL3I4EguUUFb+QB
	/9sP8odnVVcBOx+r7Ic8uKVtUgWujZ1KqZ/ywiI3cY5CZQ4pVwuZMZ5sIuBhN/c=
X-Google-Smtp-Source: AGHT+IF+XDdyB5UuM6N1UjqqE0/VQom0I9Op5dF9IOxOPYX/5ovaNt57ADIRPWe8tJpR7LWz5w/zoQ==
X-Received: by 2002:a05:6a20:9717:b0:1a9:8861:9e77 with SMTP id hr23-20020a056a20971700b001a988619e77mr3208395pzc.28.1712946374944;
        Fri, 12 Apr 2024 11:26:14 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id q18-20020a63d612000000b005dc9ab425c2sm3053438pgg.35.2024.04.12.11.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:26:14 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:26:10 -0700
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
Subject: Re: [PATCH 15/19] riscv: hwcap: Add v to hwcap if xtheadvector
 enabled
Message-ID: <Zhl8wtc5ikM2Btjv@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-15-4af9815ec746@rivosinc.com>
 <20240412-thrill-amnesty-019897f21466@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-thrill-amnesty-019897f21466@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_112617_017472_8E916E96 
X-CRM114-Status: GOOD (  25.72  )
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

On Fri, Apr 12, 2024 at 12:37:08PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:21PM -0700, Charlie Jenkins wrote:
> > xtheadvector is not vector 1.0 compatible, but it can leverage all of
> > the same save/restore routines as vector plus
> > riscv_v_first_use_handler(). vector 1.0 and xtheadvector are mutually
> > exclusive so there is no risk of overlap.
> 
> I think this not okay to do - if a program checks hwcap to see if vector
> is supported they'll get told it is on T-Head system where only the 0.7.1
> is.

That's fair. I did remove it from the hwprobe result but this is kind of
a gross way of doing it. I'll mess around with this so this isn't
necessary.

- Charlie

> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 41a4d2028428..59f628b1341c 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -647,9 +647,13 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> >  		 * Many vendors with T-Head CPU cores which implement the 0.7.1
> >  		 * version of the vector specification put "v" into their DTs.
> >  		 * CPU cores with the ratified spec will contain non-zero
> > -		 * marchid.
> > +		 * marchid. Only allow "v" to be set if xtheadvector is present.
> >  		 */
> > -		if (acpi_disabled && this_vendorid == THEAD_VENDOR_ID &&
> > +		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,
> > +							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
> > +			this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
> > +			set_bit(RISCV_ISA_EXT_v, isainfo->isa);
> > +		} else if (acpi_disabled && this_vendorid == THEAD_VENDOR_ID &&
> >  		    this_archid == 0x0) {
> >  			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
> >  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
> > @@ -776,6 +780,15 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> >  
> >  		of_node_put(cpu_node);
> >  
> > +		/*
> > +		 * Enable kernel vector routines if xtheadvector is present
> > +		 */
> > +		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,
> > +							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
> > +			this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
> > +			set_bit(RISCV_ISA_EXT_v, isainfo->isa);
> > +		}
> > +
> >  		/*
> >  		 * All "okay" harts should have same isa. Set HWCAP based on
> >  		 * common capabilities of every "okay" hart, in case they don't.
> > 
> > -- 
> > 2.44.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
