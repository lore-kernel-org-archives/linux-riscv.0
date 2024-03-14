Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D63FC54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 02:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7xlMJVeUULyeJ76nj65lHyQrt7VjczdGytYfw0Fx5E=; b=hJvbOzbc+4LTEx
	E//w5QB/tHIJO/CIRpOb/thpPba40+4W2y+Vst6YeZGMWp/kkr3S2Csz8CYxqLhX4X/5CE19632IX
	nNrK4qvYPSpJF+u2TJEoFoQBQMABV0z2okXNieNJ1NxCSNjblCZ/79uXUBrKI7derNjbsyqvvFZuI
	vrJ1LR+dD831TVBmpK1N5BL7IiBjTJ4xaJfSUenQ1AxQSo93ywjxRyXHrgaJOdcaeVnvvxw0Ombxh
	sciYyKrgBYwG1hq3V9auDSuX9VWNtx6B/SNrSb5pWLhQEcUe2IkdaDfClqRLDvIP3VcGXBWYAl4oP
	MWg8LSTcfXoy1nsImMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkbCF-0000000CiOn-304t;
	Thu, 14 Mar 2024 02:51:55 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkbCC-0000000CiNl-1LRy
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 02:51:54 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6e53893c559so199402a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 19:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710384711; x=1710989511; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cmPhMoh7yooYD/bXkTsN1nBpv6o1eZl498h/YwZndzA=;
        b=dODbU3GAFJiP23xeEFpQ6CpbDRfGzrcTmy0eqXVCl+PMWmvUJtNuabAxjz72ZfoHrF
         v6fxQ4QHCFtDn3AmmcIEOrB5kqKpjVPrDOW/d1NtgsthKdqr14Kk3ZbSgCYANEAoYshh
         A6oHKnNY1fPxHccyxPxO33M41H3lBdFP3W7Gv95JAcKuv1KUKdpwQlJZWXi9kSxXvPw1
         nwPDaY+JZhFdVROKKP+sJcXhFyfOtg5vZwJD7pZkr3PiwxaJ7QfVmJ9KuF9KHLCQjXr7
         rp2wgOYGFczzaU4yBAV1+PLfPGzU+5wSN7vfDj6zWD5zBBtM4dzNar5IaNqVslrVjYB8
         Zd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710384711; x=1710989511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmPhMoh7yooYD/bXkTsN1nBpv6o1eZl498h/YwZndzA=;
        b=TCmAezLkZMAXH7pa1i/1bE6T/fFchtLh/VPdnpxGejSpz7YtsqRPhn1l+iTph7L4xc
         0/F/C1x3ONXYxj1pe86ejswaTr4bTXr/OcIPsiwpdLTwPz2J5gJ9liNWV7/r0PnjZwVh
         LLlvxYf3JMW0R+CPhsGtiuj2E4TGQbbNpYTcLofeByjKKFuLs8z46fXBrhVpxf9Wk8Db
         MnPE58CS0yWOaoYkE19KJI79xUhKsDD2a80aLxuJa2uol/wvZcJZ7TGj/MpmKa9Tth4P
         e2hCdwVxmb9xtbd/gEEcUyKWsDB9LZgPuBFPOnDgcyf5slEfnJYpJia1yl4WQOzxncaG
         U8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi3yjL9NURlmu8QuzIPtSH81a77OVXnaxgieGhz2lzAq1h7Zku0sI0yeIdWOqcnL+JuAdABWTZTjgdqDbvTwjh+bKeH08J5e+ukhS/iC0c
X-Gm-Message-State: AOJu0Ywk87t49A6G3FPAJFj6C+1Q05j0BzzHFP7OAhsDQgTOGrQ2xCen
	4pZKcm8Egd+zIgrl8Rg1s842XJ2Uy6c5o1fYk4kY3WD5b1oK7lQXsil4z9cepq8=
X-Google-Smtp-Source: AGHT+IGCHNssxZ0wWF82FsWC9RxpZCLhW0D1wkXR00VIe/SijvydBz0DRqvVYF4Nf3e5Z+748JriDQ==
X-Received: by 2002:a05:6870:818e:b0:222:61c9:3e8b with SMTP id k14-20020a056870818e00b0022261c93e8bmr572811oae.23.1710384710806;
        Wed, 13 Mar 2024 19:51:50 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:c3a2:fcab:1ebb:b50c])
        by smtp.gmail.com with ESMTPSA id n64-20020a634043000000b005d8b2f04eb7sm343931pga.62.2024.03.13.19.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 19:51:44 -0700 (PDT)
Date: Wed, 13 Mar 2024 19:51:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"david.laight@aculab.com" <david.laight@aculab.com>,
	"Li, Haicheng" <haicheng.li@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] riscv: Optimize crc32 with Zbc extension
Message-ID: <ZfJmPiD/FrDbL1kE@ghost>
References: <20240313032139.3763427-1-xiao.w.wang@intel.com>
 <ZfIs5ND0S08N2zLd@ghost>
 <DM8PR11MB57514B86A2C1AA40973AF705B8292@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM8PR11MB57514B86A2C1AA40973AF705B8292@DM8PR11MB5751.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_195152_525727_381776F6 
X-CRM114-Status: GOOD (  49.75  )
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

On Thu, Mar 14, 2024 at 02:32:57AM +0000, Wang, Xiao W wrote:
> 
> 
> > -----Original Message-----
> > From: Charlie Jenkins <charlie@rivosinc.com>
> > Sent: Thursday, March 14, 2024 6:47 AM
> > To: Wang, Xiao W <xiao.w.wang@intel.com>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; ajones@ventanamicro.com;
> > conor.dooley@microchip.com; heiko@sntech.de; david.laight@aculab.com;
> > Li, Haicheng <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH v3] riscv: Optimize crc32 with Zbc extension
> > 
> > On Wed, Mar 13, 2024 at 11:21:39AM +0800, Xiao Wang wrote:
> > > As suggested by the B-ext spec, the Zbc (carry-less multiplication)
> > > instructions can be used to accelerate CRC calculations. Currently, the
> > > crc32 is the most widely used crc function inside kernel, so this patch
> > > focuses on the optimization of just the crc32 APIs.
> > >
> > > Compared with the current table-lookup based optimization, Zbc based
> > > optimization can also achieve large stride during CRC calculation loop,
> > > meantime, it avoids the memory access latency of the table-lookup based
> > > implementation and it reduces memory footprint.
> > >
> > > If Zbc feature is not supported in a runtime environment, then the
> > > table-lookup based implementation would serve as fallback via alternative
> > > mechanism.
> > >
> > > By inspecting the vmlinux built by gcc v12.2.0 with default optimization
> > > level (-O2), we can see below instruction count change for each 8-byte
> > > stride in the CRC32 loop:
> > >
> > > rv64: crc32_be (54->31), crc32_le (54->13), __crc32c_le (54->13)
> > > rv32: crc32_be (50->32), crc32_le (50->16), __crc32c_le (50->16)
> > 
> > Even though this loop is optimized, there are a lot of other
> > instructions being executed else where for these tests. When running the
> > test-case in QEMU with ZBC enabled, I get these results:
> > 
> > [    0.353444] crc32: CRC_LE_BITS = 64, CRC_BE BITS = 64
> > [    0.353470] crc32: self tests passed, processed 225944 bytes in 2044700
> > nsec
> > [    0.354098] crc32c: CRC_LE_BITS = 64
> > [    0.354114] crc32c: self tests passed, processed 112972 bytes in 289000
> > nsec
> > [    0.387204] crc32_combine: 8373 self tests passed
> > [    0.419881] crc32c_combine: 8373 self tests passed
> > 
> > Then when running with ZBC disabled I get:
> > 
> > [    0.351331] crc32: CRC_LE_BITS = 64, CRC_BE BITS = 64
> > [    0.351359] crc32: self tests passed, processed 225944 bytes in 567500
> > nsec
> > [    0.352071] crc32c: CRC_LE_BITS = 64
> > [    0.352090] crc32c: self tests passed, processed 112972 bytes in 289900
> > nsec
> > [    0.385395] crc32_combine: 8373 self tests passed
> > [    0.418180] crc32c_combine: 8373 self tests passed
> > 
> > This is QEMU so it's not a perfect representation of hardware, but being
> > 4 times slower with ZBC seems suspicious. I ran these tests numerous
> > times and got similar results. Do you know why these tests would perform
> > 4 times better without ZBC?
> 
> ZBC instruction' functionality is relatively more complex, so QEMU tcg uses the
> helper function mechanism to emulate these ZBC instructions. Helper function
> gets called for each ZBC instruction within tcg JIT code, which is inefficient. I see
> similar issue about the Vector extension, the optimized RVV implementation runs
> actually much slower than the scalar implementation on QEMU tcg.

Okay I will take your word for it :)

> 
> > 
> > >
> > > The compile target CPU is little endian, extra effort is needed for byte
> > > swapping for the crc32_be API, thus, the instruction count change is not
> > > as significant as that in the *_le cases.
> > >
> > > This patch is tested on QEMU VM with the kernel CRC32 selftest for both
> > > rv64 and rv32.
> > >
> > > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > > ---
> > > v3:
> > > - Use Zbc to handle also the data head and tail bytes, instead of calling
> > >   fallback function.
> > > - Misc changes due to the new design.
> > >
> > > v2:
> > > - Fix sparse warnings about type casting. (lkp)
> > > - Add info about instruction count change in commit log. (Andrew)
> > > - Use the min() helper from linux/minmax.h. (Andrew)
> > > - Use "#if __riscv_xlen == 64" macro check to differentiate rv64 and rv32.
> > (Andrew)
> > > - Line up several macro values by tab. (Andrew)
> > > - Make poly_qt as "unsigned long" to unify the code for rv64 and rv32.
> > (David)
> > > - Fix the style of comment wing. (Andrew)
> > > - Add function wrappers for the asm code for the *_le cases. (Andrew)
> > > ---
> > >  arch/riscv/Kconfig      |  23 ++++
> > >  arch/riscv/lib/Makefile |   1 +
> > >  arch/riscv/lib/crc32.c  | 294
> 
> [...]
> > > +static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
> > > +					  size_t len, u32 poly,
> > > +					  unsigned long poly_qt,
> > > +					  fallback crc_fb)
> > > +{
> > > +	size_t offset, head_len, tail_len;
> > > +	unsigned long const *p_ul;
> > > +	unsigned long s;
> > > +
> > > +	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> > 
> > This needs to be changed to be asm goto:
> > 
> > 4356e9f841f7f ("work around gcc bugs with 'asm goto' with outputs")
> > 
> 
> Thanks for the pointer. Will change it.
> 
> > > +				      RISCV_ISA_EXT_ZBC, 1)
> > > +			  : : : : legacy);
> > > +
> > > +	/* Handle the unaligned head. */
> > > +	offset = (unsigned long)p & OFFSET_MASK;
> > > +	if (offset && len) {
> > 
> > If len is 0 nothing in the function seems like it will modify crc. Is there
> > a reason to not break out immediately if len is 0?
> > 
> 
> Yeah, if len is 0, then crc won't be modified.
> Normally in scenarios like hash value calculation and packets CRC check,
> the "len" can hardly be zero. And software usually avoids unaligned buf
> addr, which means the "offset" here mostly is false.
> 
> So if we add a "len == 0" check at the beginning of this function, it will
> introduce a branch overhead for the most cases.

That makes sense thank you. 

> 
> > > +		head_len = min(STEP - offset, len);
> > > +		crc = crc32_le_unaligned(crc, p, head_len, poly, poly_qt);
> > > +		p += head_len;
> > > +		len -= head_len;
> > > +	}
> > > +
> > > +	tail_len = len & OFFSET_MASK;
> > > +	len = len >> STEP_ORDER;
> > > +	p_ul = (unsigned long const *)p;
> > > +
> > > +	for (int i = 0; i < len; i++) {
> > > +		s = crc32_le_prep(crc, p_ul);
> > > +		crc = crc32_le_zbc(s, poly, poly_qt);
> > > +		p_ul++;
> > > +	}
> > > +
> > > +	/* Handle the tail bytes. */
> > > +	p = (unsigned char const *)p_ul;
> > > +	if (tail_len)
> > > +		crc = crc32_le_unaligned(crc, p, tail_len, poly, poly_qt);
> > > +
> > > +	return crc;
> > > +
> > > +legacy:
> > > +	return crc_fb(crc, p, len);
> > > +}
> > > +
> > > +u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
> > > +{
> > > +	return crc32_le_generic(crc, p, len, CRC32_POLY_LE,
> > CRC32_POLY_QT_LE,
> > > +				crc32_le_base);
> > > +}
> > > +
> > > +u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
> > > +{
> > > +	return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
> > > +				CRC32C_POLY_QT_LE, __crc32c_le_base);
> > > +}
> > > +
> > > +static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
> > > +				     size_t len)
> > > +{
> > > +	size_t bits = len * 8;
> > > +	unsigned long s = 0;
> > > +	u32 crc_low = 0;
> > > +
> > > +	s = 0;
> > > +	for (int i = 0; i < len; i++)
> > > +		s = *p++ | (s << 8);
> > > +
> > > +	if (__riscv_xlen == 32 || len < sizeof(u32)) {
> > > +		s ^= crc >> (32 - bits);
> > > +		crc_low = crc << bits;
> > > +	} else {
> > > +		s ^= (unsigned long)crc << (bits - 32);
> > > +	}
> > > +
> > > +	crc = crc32_be_zbc(s);
> > > +	crc ^= crc_low;
> > > +
> > > +	return crc;
> > > +}
> > > +
> > > +u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
> > > +{
> > > +	size_t offset, head_len, tail_len;
> > > +	unsigned long const *p_ul;
> > > +	unsigned long s;
> > > +
> > > +	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> > 
> > Same here
> > 
> 
> Will change it.
> 
> Thanks for the comments.
> -Xiao
> 

I am not familiar with this algorithm but this does seem like it should
show an improvement in hardware with ZBC, so there is no reason to hold
this from being merged.

When you change the asm goto so it will compile with 6.8 you can add my
tag:

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
