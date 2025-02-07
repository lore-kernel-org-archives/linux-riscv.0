Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9BFC02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Y2JAc87OJKqvEjLgkRcvdgGCtECujBEPkdwgQEA/fw=; b=hHfwimM0oQyTnQ
	8r/2WhcbavCroJp69XU1H94m4ahM45TzvCbb25eatElrOomFayMHWvIP70p0vySGqTtMcv9wuPaod
	I9vIzBxZgmFpTZnhcbCPKjTMvLcOu2YLkQWzxBFWsRfv/uCXdD5LQceat8qMOZWbjroIe5xPQ7hBz
	HM1mbJR/18qtt1lKrAEe8j7D+9n+im1B0FLVVUoxd6hWPKHJTWxAKvrTcb8lezf4aCiKfViRp8XAk
	Vi3hmX/g+CZfkuI7+0ygDamiDYSmFG46rTfe1xDLFBWOwpMEJy2ANn7hBhRr43C7nFdUEPnFf692H
	MnH3B9XN50QnuApebGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSsm-0000000AeQk-3tnU;
	Fri, 07 Feb 2025 18:15:17 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSsk-0000000AePe-0Nyj
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 18:15:15 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f664af5so25968785e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 10:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738952112; x=1739556912; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hfNNfTRcuZ50Awu1MA8ah0JjMk2WSG6zS37X4vbd0AI=;
        b=Zj6TuJbUHSneBH7sW/irxkQaCgTmnVxi7lvkLvJJONxuP8aUD/Wg1pIeXDoC+M+yw1
         4zBrpmvZFx9MLT+KRrWg+qHFlRv045/VCfqxEldToxmixsBPare5ec+Oalgj4j3ee7N2
         Jgv3duPTbf4wjsiTnYK45Z1cZ/FfIUOEUscuzwMae/L5QOy/QpYwnELZprOxLsiAzcMM
         9kxeAptShHE417m3L3Ko4Myc5SNJSs/JzhoXB86OseC0Z5aQcWPdKXyXLjCrnY9Li47c
         VZd2DqgNVduKlW/hW1Yb0TjQ9ZKUD2MTvbsVncF+e8WQ3RsXTpfDG5DJOWjTZBEJE6/o
         mDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738952112; x=1739556912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfNNfTRcuZ50Awu1MA8ah0JjMk2WSG6zS37X4vbd0AI=;
        b=ax7cjHZ8Ebz2vWPxupPtt6pE/sUJhAywU5lFAKnJm+enIfmioINHEm7NOkSeShs6Gm
         +7F4CZovSWphcyB2bq5M5+GQ+ommf5/UHfIqETXWIzvpICjWPV+8qVOAtUNDLKFYkurs
         D7igd7TBvkHpZhk+OZUqMTTx0E7az8t9WGaXxNtPJULKAZCr8lSqP0Uzv2GBYEEQ3GTD
         uvJRFzK3fSmWB93Jpb4XbK4B0+ztAFpsfpGcxD06TK9d/AWIHPUg4FmbO/P+BSPIBUtd
         kGTU93PnMW9214SqpEN8Y3wDEZynrBrStoN4SsQY+yn38S0bXm1tvlVUqNmL2U09T63m
         1m0A==
X-Gm-Message-State: AOJu0YyojqoB4KpMGJxysHJf713uzlTUY9SIQbZmZm5nkOO0g6rLFNRk
	/EUfdhYmAw/ubeJH3tFiANXEGmNMDEVhRbB4Gp3rvC7rsN4PSXwO5fVj+if2ZyE=
X-Gm-Gg: ASbGncv04+9SHG56Yga6G20aFPqSb7Kjfro6vXVgYjDlvWH+kZPzhDB5X0eHvS+JBOb
	T0eDBr5iA/U6haGZ2yQuxfEIE9qQ55VvJcf1qKIeedYQwwJMKEQdz7H9Ysb0ktXFFilR8r53T7W
	1yOLqtsDlO0XCidWLCHTBazImX86Em2gh/QGeZp4XOPaZuiZsMi9/3RzFA03Vs+Xzq8R/vBM32R
	DwOKBvbtNFrla5HVPMkkiJGY0njUrad3driwXTx/HZEhNqegmyfm18p6tQIWsuWniE1Kp84V6mo
	dPZSsuR9kBeEoFIOPhbG
X-Google-Smtp-Source: AGHT+IG9/anMAZ6jBKO14yIerC1k3wRGRjYOqfPrrfTTy+DzxQn+cFCYD3jAseCl4Ag2HTXQ0Khgqg==
X-Received: by 2002:a05:600c:1e01:b0:436:6ddf:7a27 with SMTP id 5b1f17b1804b1-439249a843amr36988155e9.23.1738952112152;
        Fri, 07 Feb 2025 10:15:12 -0800 (PST)
Received: from localhost ([2a00:11b1:103b:18b0:943f:8e0:c299:6db0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde33e86sm5200577f8f.97.2025.02.07.10.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 10:15:11 -0800 (PST)
Date: Fri, 7 Feb 2025 19:15:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 6/9] riscv: Fix set up of vector cpu hotplug callback
Message-ID: <20250207-7d43933438bb9a5a2d6002d0@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-17-ajones@ventanamicro.com>
 <00cbde9c-39b4-4445-98af-70dfd1fbd62a@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00cbde9c-39b4-4445-98af-70dfd1fbd62a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_101514_134368_76E7BF40 
X-CRM114-Status: GOOD (  26.39  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2025 at 06:36:28PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 07/02/2025 17:19, Andrew Jones wrote:
> > Whether or not we have RISCV_PROBE_VECTOR_UNALIGNED_ACCESS we need to
> > set up a cpu hotplug callback to check if we have vector at all,
> > since, when we don't have vector, we need to set
> > vector_misaligned_access to unsupported rather than leave it the
> > default of unknown.
> > =

> > Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwpr=
obe")
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/unaligned_access_speed.c | 31 +++++++++++-----------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> > =

> > diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/ke=
rnel/unaligned_access_speed.c
> > index c9d3237649bb..d9d4ca1fadc7 100644
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> > @@ -356,6 +356,20 @@ static void check_vector_unaligned_access(struct w=
ork_struct *work __always_unus
> >  	per_cpu(vector_misaligned_access, cpu) =3D speed;
> >  }
> >  =

> > +/* Measure unaligned access speed on all CPUs present at boot in paral=
lel. */
> > +static int __init vec_check_unaligned_access_speed_all_cpus(void *unus=
ed __always_unused)
> > +{
> > +	schedule_on_each_cpu(check_vector_unaligned_access);
> Hey Andrew,
> =

> While at it, could you add a comment stating that schedule_on_cpu()
> (while documented as really slow) is used due to kernel_vector_begin()
> needing interrupts to be enabled ? I stumbled upon that while reworking
> misaligned.

That should be a separate patch, since this patch is mostly just moving
code (not even this function was "moved", but git-diff prefers to say it
was moved rather than what was actually moved...)

I guess the comment patch you suggest should go in your rework series.

Thanks,
drew

> =

> Thanks,
> =

> Cl=E9ment
> =

> > +
> > +	return 0;
> > +}
> > +#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> > +static int __init vec_check_unaligned_access_speed_all_cpus(void *unus=
ed __always_unused)
> > +{
> > +	return 0;
> > +}
> > +#endif
> > +
> >  static int riscv_online_cpu_vec(unsigned int cpu)
> >  {
> >  	if (!has_vector()) {
> > @@ -363,27 +377,16 @@ static int riscv_online_cpu_vec(unsigned int cpu)
> >  		return 0;
> >  	}
> >  =

> > +#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> >  	if (per_cpu(vector_misaligned_access, cpu) !=3D RISCV_HWPROBE_MISALIG=
NED_VECTOR_UNKNOWN)
> >  		return 0;
> >  =

> >  	check_vector_unaligned_access_emulated(NULL);
> >  	check_vector_unaligned_access(NULL);
> > -	return 0;
> > -}
> > -
> > -/* Measure unaligned access speed on all CPUs present at boot in paral=
lel. */
> > -static int __init vec_check_unaligned_access_speed_all_cpus(void *unus=
ed __always_unused)
> > -{
> > -	schedule_on_each_cpu(check_vector_unaligned_access);
> > +#endif
> >  =

> >  	return 0;
> >  }
> > -#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
> > -static int __init vec_check_unaligned_access_speed_all_cpus(void *unus=
ed __always_unused)
> > -{
> > -	return 0;
> > -}
> > -#endif
> >  =

> >  static int __init check_unaligned_access_all_cpus(void)
> >  {
> > @@ -409,10 +412,8 @@ static int __init check_unaligned_access_all_cpus(=
void)
> >  	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> >  				  riscv_online_cpu, riscv_offline_cpu);
> >  #endif
> > -#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> >  	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
> >  				  riscv_online_cpu_vec, NULL);
> > -#endif
> >  =

> >  	return 0;
> >  }
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
