Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A408CD8C92
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GArDWRV+wQetKUK9ucOC4WRcDP6Dgxsg1lJBUg3ZegY=; b=Y4TaEEDKQkRehA
	ODbdAsPzu8jN9s+MWTXmXe2ceEcgazvtnQ0za5UwtXDuwoCrYhilOgSbM2Wekf/IaFUCORJfzblaJ
	QNJyvEAJOWyHfqvthl8b0JQ3hM86LFoMlnnCtpyGZKoWQlwu+UYC04FQnDuiPeaE4F5j9R1W9qM8m
	BJor1nwbyPmHu3egszePWoNngpt1aEf7zVxErDsUb+y9Y5me/iWTCg+DaLqItcYnMt4UC6pTnpbaz
	WBg8/4r9YndO5AaZL7DsLRARVKWGpe4unLJ/KTOf0rT3iCzBUIwfYL8ayinJYtnjulLHGezBZTi3f
	nCaaDFHHJ5+4NrBlGtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvHH-00000005UuV-28ca;
	Tue, 09 Jun 2026 12:09:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvHF-00000005Uu8-00Ku
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 12:09:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490b64c8311so60980105e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781006991; x=1781611791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=88XDxznyKMslMXjQAG1u3Xg3ByMFLCBNESPJIyE17HU=;
        b=MjUVnH/LBvF1wkq6KsjNh2hT9um+LA/ZSvStB7lgBXTamp1YptKNVMfVx1/J/vigaT
         iJKE89c+FsAvDKKlQGbh7b/3XW5ffxVgsWIk+9ye57UhguMFWqGdarnyvuy3JxuCmAKx
         mybaL8imY6hsqxQ+l3RuaRPEStfr8OcYeI81dRA1FxqSiXoDGuOhzf0H/ORmZeTW8hKT
         UupS9+0a3XiRXXIzrdoi6JfP/j0KZ0tuj1+ijbrsCwAoJxlJlC26HqMgBMpZIbdM4WGr
         taMU5YVXQsaUD1/5Y3k0VBA5TTDlf/V2pcphuzjW8I1GkAqxggFq5qXZFTZTM3DiRFow
         iQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006991; x=1781611791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88XDxznyKMslMXjQAG1u3Xg3ByMFLCBNESPJIyE17HU=;
        b=HVSQW7prmLG0utzgojQ9+80dNJm+HsA843NBX5UeP9BWD9oE8rZZlWlSYpAABUUo/X
         iDBY8Db4TUM/4cNIv6q52nAlRwZe3n21/sqC4rSFoXZGOLH7SZwM7soU0tQf9SUgOcC+
         S+U/w4JQs69FBmr0nWf+NQfoa4z5IoQdp/yICXIh9iB3pgWvIMzxuzuJSFW29qMLyPdX
         wgs2/ALdpxEXfY9riGtEHacAN36vQVW8uY5NdBjzi2Qp9Co5EjrWdcqKkiRVFoOpkRM+
         KbE6wnd/GOswixVk6T16SzbRFxcDfxBBT93tjcNRI8wtddaBjBvTuGMXvW48l9nKajhz
         TLgw==
X-Forwarded-Encrypted: i=1; AFNElJ8Gh9klUnzgbdfNLRM9nzPlethUSQT/LB5RRulIZNjliHcWT1f8pF0OBAF+rWa/5BlDtj8PAcQJoLVpuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIfVq9uxHsGVT+AvnbuTSjwxk9H6jyoibZrtU+uniJ319paHEJ
	8ajg1M+WPS5AXL47umt4zVCZLkMuvn7wUom/wISeIE636z+0olJFE6jo0drU+l5kv863jA==
X-Gm-Gg: Acq92OEWDjhVGorlo/wv99Q+T+HNW7IYWXYbX5LmXIOC8tPkXYfY2spe8Y+9SZQl4Pz
	Rc1c6gDEUvZPBCvP3Xb7GlfICp2fAXPU79qpPc9GjuUcO+C8P72VSToDWFCBW/yHkNE3bfOBSbO
	TS1lldR8E/sqOXzE7Fg2fhHwE0Y4Wp4Yvks10vG0kbcve92Btnk+bQn0hS0Au2VR/qTZM5qxY2u
	lYg9Xsae/DcM8afCj+UGo0Lg6tD0vcjjRqALsVf1XquAsL9ypYx0vRCMgLZHskUxV+da92JHWju
	WoBbfrxuk7yVrIpkwQNpdB3I9nyIN5QZdRs9bnP5fvslsBbq05HxLQgRvxVYpX+UJYOTvHk0MbR
	m0CO93gkbBH6I9WPCo9ipMUtsgDjW4oSoLPeT4p5sy2mjV/mCzkfLxpaEW7b2S2HVHwx0CEIpig
	+H2BIPtiiC41xPBu3bWdO8aP0eG05BlRYeAtHU
X-Received: by 2002:a05:600c:8183:b0:490:5cd8:d213 with SMTP id 5b1f17b1804b1-490c25c4898mr290734865e9.15.1781006990953;
        Tue, 09 Jun 2026 05:09:50 -0700 (PDT)
Received: from blinky ([46.255.81.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2c9ea37sm581393735e9.0.2026.06.09.05.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:09:50 -0700 (PDT)
Date: Tue, 9 Jun 2026 05:09:48 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: offtkp <parisoplop@gmail.com>, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, conor@kernel.org
Subject: Re: [PATCH v3 RESEND] riscv: hwprobe: allow querying available
 RISCV_HWPROBE_KEY_IMA_EXT_0 bits
Message-ID: <aigCjG1HbSqUTx_F@blinky>
References: <20250814221646.32140-1-parisoplop@gmail.com>
 <20250825170258.24068-1-parisoplop@gmail.com>
 <20250825-6d7eedc4459b72ceb07ce782@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825-6d7eedc4459b72ceb07ce782@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_050953_168616_3091984C 
X-CRM114-Status: GOOD (  51.52  )
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

On Mon, Aug 25, 2025 at 05:00:45PM -0500, Andrew Jones wrote:
> On Mon, Aug 25, 2025 at 08:02:21PM +0300, offtkp wrote:
> > When probing for extensions using RISCV_HWPROBE_KEY_IMA_EXT_0, a missing
> > bit in the resulting bitmask means the extension is not available or the
> > kernel is not recent enough to support the bit. Currently, there's no
> > way to differentiate between the two.
> > 
> > This adds a new riscv_hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL,
> > which returns a bitmask of all the queryable extensions supported by the
> > kernel in RISCV_HWPROBE_KEY_IMA_EXT_0. This can allow programs to use a
> > fallback extension detection method when the bit they want to query is
> > not available in the kernel they are running on.
> > 
> > Signed-off-by: offtkp <parisoplop@gmail.com>
> > ---
> > Changes in v3:
> > - remove the 59 magic number and create the mask as a define
> > 
> > Conversation from v2 to show motivation for this patch as a whole:
> > 
> > > And do you have a real usecase in
> > > mind? I mean which project would benefit from this?
> > Yes, I want this feature for an x86-on-RISC-V userspace emulator
> > called felix86. We do runtime extension detection for our JIT.
> > Currently, for any extension that defines instructions we use the SIGILL
> > method previously described, because there's no way to tell with just
> > a hwprobe call whether a 0 bit means extension not present or kernel
> > too old. But we can't do this for all extensions, some don't define
> > instructions.
> > 
> > The end goal would be being able to detect an extension using hwprobe,
> > and if it's not detectable, notifying the user that we can't detect it and
> > they can mark it as enabled in the emulator's config file.
> 
> As I pointed out on v2, I don't think this patch helps. When the kernel
> is unaware of the extension, then we still know nothing about its
> availability. This is only helpful when the kernel is aware of an
> extension, but, in those cases, the current hwprobe can be trusted, so
> we don't need this.

You are correct to say that when the kernel reports that an extension as
"0" that there is no way for the userspace application to be able to
use the extension, the kernel reporting as "unaware" does not help with
this.

This patch from Paris, however, is not about dynamically increasing the
number of extensions that a userspace application can use but rather
simply about error/debug reporting.

I think this kind of reporting is a valid usecase for a hwprobe feature
and would be able to improve user experience of userspace applications.

- Charlie

> 
> The problem is there's no good way to detect extensions that the kernel
> is unaware of, which means the kernel needs to blindly expose what's in
> the DT/ACPI somehow.
> 
> Thanks,
> drew
> 
> > 
> > 
> > 
> >  Documentation/arch/riscv/hwprobe.rst  |  5 ++++-
> >  arch/riscv/include/asm/hwprobe.h      | 29 ++++++++++++++++++++++++++-
> >  arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
> >  arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
> >  4 files changed, 38 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> > index 2aa9be272d5d..6d77def0a46e 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -360,4 +360,7 @@ The following keys are defined:
> >  
> >      * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
> >          vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
> > -	Instruction Extensions Specification.
> > \ No newline at end of file
> > +	Instruction Extensions Specification.
> > +
> > +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL`: A bitmask containing the extensions
> > +  that can be probed using the :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` key.
> > \ No newline at end of file
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> > index 7fe0a379474a..a06eeec11e2c 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -8,7 +8,34 @@
> >  
> >  #include <uapi/asm/hwprobe.h>
> >  
> > -#define RISCV_HWPROBE_MAX_KEY 13
> > +#define RISCV_HWPROBE_MAX_KEY 14
> > +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE	(RISCV_HWPROBE_IMA_FD | \
> > +	RISCV_HWPROBE_IMA_C | RISCV_HWPROBE_IMA_V | RISCV_HWPROBE_EXT_ZBA | \
> > +	RISCV_HWPROBE_EXT_ZBB | RISCV_HWPROBE_EXT_ZBS | RISCV_HWPROBE_EXT_ZICBOZ | \
> > +	RISCV_HWPROBE_EXT_ZBC | RISCV_HWPROBE_EXT_ZBKB | RISCV_HWPROBE_EXT_ZBKC | \
> > +	RISCV_HWPROBE_EXT_ZBKX | RISCV_HWPROBE_EXT_ZKND | RISCV_HWPROBE_EXT_ZKNE | \
> > +	RISCV_HWPROBE_EXT_ZKNH | RISCV_HWPROBE_EXT_ZKSED | \
> > +	RISCV_HWPROBE_EXT_ZKSH | RISCV_HWPROBE_EXT_ZKT | RISCV_HWPROBE_EXT_ZVBB | \
> > +	RISCV_HWPROBE_EXT_ZVBC | RISCV_HWPROBE_EXT_ZVKB | RISCV_HWPROBE_EXT_ZVKG | \
> > +	RISCV_HWPROBE_EXT_ZVKNED | RISCV_HWPROBE_EXT_ZVKNHA | \
> > +	RISCV_HWPROBE_EXT_ZVKNHB | RISCV_HWPROBE_EXT_ZVKSED | \
> > +	RISCV_HWPROBE_EXT_ZVKSH | RISCV_HWPROBE_EXT_ZVKT | \
> > +	RISCV_HWPROBE_EXT_ZFH | RISCV_HWPROBE_EXT_ZFHMIN | \
> > +	RISCV_HWPROBE_EXT_ZIHINTNTL | RISCV_HWPROBE_EXT_ZVFH | \
> > +	RISCV_HWPROBE_EXT_ZVFHMIN | RISCV_HWPROBE_EXT_ZFA | \
> > +	RISCV_HWPROBE_EXT_ZTSO | RISCV_HWPROBE_EXT_ZACAS | \
> > +	RISCV_HWPROBE_EXT_ZICOND | RISCV_HWPROBE_EXT_ZIHINTPAUSE | \
> > +	RISCV_HWPROBE_EXT_ZVE32X | RISCV_HWPROBE_EXT_ZVE32F | \
> > +	RISCV_HWPROBE_EXT_ZVE64X | RISCV_HWPROBE_EXT_ZVE64F | \
> > +	RISCV_HWPROBE_EXT_ZVE64D | RISCV_HWPROBE_EXT_ZIMOP | \
> > +	RISCV_HWPROBE_EXT_ZCA | RISCV_HWPROBE_EXT_ZCB | RISCV_HWPROBE_EXT_ZCD | \
> > +	RISCV_HWPROBE_EXT_ZCF | RISCV_HWPROBE_EXT_ZCMOP | \
> > +	RISCV_HWPROBE_EXT_ZAWRS | RISCV_HWPROBE_EXT_SUPM | \
> > +	RISCV_HWPROBE_EXT_ZICNTR | RISCV_HWPROBE_EXT_ZIHPM | \
> > +	RISCV_HWPROBE_EXT_ZFBFMIN | RISCV_HWPROBE_EXT_ZVFBFMIN | \
> > +	RISCV_HWPROBE_EXT_ZVFBFWMA | RISCV_HWPROBE_EXT_ZICBOM | \
> > +	RISCV_HWPROBE_EXT_ZAAMO | RISCV_HWPROBE_EXT_ZALRSC | \
> > +	RISCV_HWPROBE_EXT_ZABHA)
> >  
> >  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> >  {
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> > index aaf6ad970499..a3b92df4dc05 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -82,6 +82,7 @@ struct riscv_hwprobe {
> >  #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
> >  #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
> >  #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
> > +/* Change RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE when adding items. */
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> > @@ -106,6 +107,7 @@ struct riscv_hwprobe {
> >  #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	11
> >  #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
> >  #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
> > +#define RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL 14
> >  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >  
> >  /* Flags */
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> > index 0b170e18a2be..40e7fa5f85f3 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -310,6 +310,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >  		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> >  		break;
> >  
> > +	case RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL:
> > +		pair->value = RISCV_HWPROBE_KEY_IMA_EXT_0_AVAIL_VALUE;
> > +		break;
> > +
> >  	/*
> >  	 * For forward compatibility, unknown keys don't fail the whole
> >  	 * call, but get their element key set to -1 and value set to 0
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
