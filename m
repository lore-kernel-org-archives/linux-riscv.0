Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CB9C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:01:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F06B82073E
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y+1rBvyO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="SZPcne1M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F06B82073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=wf3MgK4HHdxX4IK7QdI3ZCAdOIEkALuNwjcJ4QVHhEE=; b=y+1rBvyO2dzj3Hb5aUU698CGS
	D6WjdfTrYhFhWuTE8ldrQl4WMU/l/l9smPFiZLXWPQ8G/wdjuAKw8haV2gepmw6AmljVvEyyCvzSN
	bf1W5uTllXyQJRebTdROJMuhZjpn42BCbLiqqhYxzOTm5Un1AA+E4I2E+23UCQPdE+R8HdexlXyc8
	Hwm21YXcgVyUYODKvVD45LJdA2RUx5InACLs0jxyijv1QR58hp0h6nCF/W++mV9P15m0UFAcqq9Bo
	3PG7OaaTQ3IQ/Ew2XXM6cOhwfaDckES3l5D/B4pWqzVjQ82mV3D5kVCI8aEEnU7rFdamJBOfyx727
	Bjmxj+Kqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k38jr-0000cW-41; Wed, 05 Aug 2020 02:01:07 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k38jp-0000bc-4e
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 02:01:06 +0000
Received: by mail-pj1-x1043.google.com with SMTP id lx9so3448564pjb.2
 for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2020 19:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9ujgTMErOugXJGLDOW+6kfeYveYxratHKMd3vkXVWx0=;
 b=SZPcne1M50q0PQsXDWDtWz8D11+ycf6bA7dSil5IILr+SLunUljaOJFchbTtuaLHVs
 HS1s20pNXJSMkCI4p0Za6DYKdjPyHbzgpI4NSPuAVQbE7N0yDpfZYLPp2z+w5phIbCa+
 XkLVAol1Ar6wcAZ06qvsvZ8o20Bu3Czgia06yT29l0BDv0H3W9CY+XYh4qadBg/bjpLt
 4qHagYTVE+rtR24HVKbGSHwRraa1pkPzCe3NW/u1Ua3eZZOoCSX/pDOWYSaL/qzhgiWz
 LzJZIjmKcyeJi8d09LpbDidY7GnqoT7XKNzrcgrQd6+CJaUppHwJNcyaKJ4UhDeixAmi
 THgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9ujgTMErOugXJGLDOW+6kfeYveYxratHKMd3vkXVWx0=;
 b=bBLeL+w6DRLtLjtGpRmFUo11VDRRREP7q9/MXkubqkAi44inIb1mql3qBpo+xwpeTE
 4u570j5HrCI5dtTgOMn4VqON15t5XjApLg093+OwEyKz3sETdpSS4Wt7Jtyhenz0zydF
 iRXvWbiGy5KOhyqxkX8Ge7hwQR3m/ireCKCSbJsFhIk0sdOsbiB7mjut6YQasjICBGVz
 O/7zXRe5efgysn6N+Fpevf87/gn33hfYm4qZPSgHwPeBx11c/WYWVYWeoKq2O3IJsZfu
 bgzllcDuQ5H+ij5B5hfgDzBBhVHNjURyDhIz/qpz++Bk5d4muffGQmcHqzDphJStLIeo
 8XPg==
X-Gm-Message-State: AOAM533xAPrrtHXYm2vK6Vnzorra7APk8HGnpZ+hrbYjrKf3ZAzJ5tC6
 6nzGExmeMU5w3l/VvT0FncJOpodt6w4=
X-Google-Smtp-Source: ABdhPJyVJl4QcVGhokReQnuV4IXkI6Z39+gx4n24p6Pb3SibpWq0c/KjqoNX86NC77LZeQZTPUza7w==
X-Received: by 2002:a17:90b:1493:: with SMTP id
 js19mr817438pjb.223.1596592861678; 
 Tue, 04 Aug 2020 19:01:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 198sm602494pfz.120.2020.08.04.19.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 19:01:01 -0700 (PDT)
Date: Tue, 04 Aug 2020 19:01:01 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Aug 2020 18:58:47 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: ptrace: Use the correct API for `fcsr' access
In-Reply-To: <alpine.DEB.2.20.2007232213510.4462@tpp.orcam.me.uk>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: macro@wdc.com
Message-ID: <mhng-611be025-6e03-46a1-8a8a-6f6eeea04f57@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_220105_216297_E4ED47EB 
X-CRM114-Status: GOOD (  24.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2020 16:22:15 PDT (-0700), macro@wdc.com wrote:
> Adjust the calls to `user_regset_copyout' and `user_regset_copyin' in
> `riscv_fpr_get' and `riscv_fpr_set' respectively so as to use @start_pos
> and @end_pos according to API documentation in <linux/regset.h>, that is
> to point at the beginning and the end respectively of the data chunk to
> be copied.  Update @data accordingly, also for the first call, to make
> it clear which structure member is accessed.
>
> We currently have @start_pos fixed at 0 across all calls, which works as
> a result of the implementation, in particular because we have no padding
> between the FP general registers and the FP control and status register,
> but appears not to have been the intent of the API and is not what other
> ports do, requiring one to study the copy handlers to understand what is
> going on here.
>
> Signed-off-by: Maciej W. Rozycki <macro@wdc.com>
> Fixes: b8c8a9590e4f ("RISC-V: Add FP register ptrace support for gdb.")
> Cc: stable@vger.kernel.org # 4.20+
> ---
>  arch/riscv/kernel/ptrace.c |   14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> linux-riscv-ptrace-fcsr.diff
> Index: linux-hv/arch/riscv/kernel/ptrace.c
> ===================================================================
> --- linux-hv.orig/arch/riscv/kernel/ptrace.c
> +++ linux-hv/arch/riscv/kernel/ptrace.c
> @@ -61,10 +61,13 @@ static int riscv_fpr_get(struct task_str
>  	int ret;
>  	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
>
> -	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &fstate->f, 0,
>  				  offsetof(struct __riscv_d_ext_state, fcsr));

As far as I can tell the current code works correctly, it just requires
knowledge of the layout of __riscv_d_ext_state to determine that it functions
correctly.  This new code still requires that knowledge: the first blob copies
the F registers, but only works if the CSR is after the registers.  If we fix
both of those the code seems easier to read, but I don't think splitting the
difference helps any.

So I guess what I'm saying is: maybe that second line should be changed to
something like "ARRAY_SIZE(fstate->f)"?

>  	if (!ret) {
> -		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
> +					  &fstate->fcsr,
> +					  offsetof(struct __riscv_d_ext_state,
> +						   fcsr),
>  					  offsetof(struct __riscv_d_ext_state, fcsr) +
>  					  sizeof(fstate->fcsr));
>  	}
> @@ -80,10 +83,13 @@ static int riscv_fpr_set(struct task_str
>  	int ret;
>  	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
>
> -	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &fstate->f, 0,
>  				 offsetof(struct __riscv_d_ext_state, fcsr));
>  	if (!ret) {
> -		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
> +					 &fstate->fcsr,
> +					 offsetof(struct __riscv_d_ext_state,
> +						  fcsr),
>  					 offsetof(struct __riscv_d_ext_state, fcsr) +
>  					 sizeof(fstate->fcsr));
>  	}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
