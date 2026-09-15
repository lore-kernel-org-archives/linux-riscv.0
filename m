Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F389C88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 09:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mt6/OjGie4Md6F4RdXEgucdo7kbaAvOfLUo49kH7IuA=; b=mXpuxCzMnWaRFx
	SQ5YcHVNmKuHvDBspPmq/gKLf3DW4RSl8w2+loMl3KUSRGeXCf/HpmeWGzv8snvLJy1PBynpPuhA7
	BhKkiNPVVvJR7szZMm/3MYBfWbIz0RpNJCFhP6Ae6H7U2a+7MlXcBk/u9MLW98Ko9ucQTTztabSbr
	E78F6hZNqvHQpNSU9ZotWRq4cUGKIW3nDtkZRnUNakq0axLX9Dzu9iRW5nSBURnAyaJkvOQlyYGFI
	rwMZ+0wQc4VsAu9LRfZ1sSICulD9PlaKWeiRKbDvrH7wIWLDcKhfBE7gTvKrsDLgGgQUASC57w84U
	SASGKapmoNq5VzSW0yTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PGX-00000005lFg-0Ray;
	Tue, 15 Sep 2026 09:15:50 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PGU-00000005lFC-3L06
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 09:15:47 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747f05ffdso322415ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463746; x=1790068546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KyTzZj9bu9m6y51EDmw17tS/R3K9wAgV1FMAvLd0wJ0=;
        b=h1z7YnbjkpQ2S97KSkO9iLujwRNQ9RsfMTZq5bd2yt1XU3Zn3s1KToTcfQCVhkfnXt
         MJJHQxqEbgTesV+k15sWukfFBy05DJeyk2l/97jMYGo5RmMGm88baT8fci3bgHsHh4xs
         nSI5PnvwY3FOp5ZWHEhwY4TTmiX39nl2fAGPg9HYAn7C9DYW7OWr81O7AHfpoeBmbQO+
         f4hcFco4BvgprFQDndza6ds1/DUbCgBIlR9xn2+nvXADcx2VvxVPdkCy+xtzkODD+p9e
         iRMm7X760DSjdpuR/8WT0BoRQjbCLbkxwMATKK6fekBq2kx+ZNIt7Kl3tpdRuid0/+TS
         407A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463746; x=1790068546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KyTzZj9bu9m6y51EDmw17tS/R3K9wAgV1FMAvLd0wJ0=;
        b=qTCkW0slf5/kf7BGYOsadyvqeJWd6YxrJ+9zyjBcG9Br8vj7NxrjRmWJBq0wcP8eke
         7pup9Zi4JVLMBwMoZq2J6Y9p7SDu3Q6oqJYMuorCKB6PG84Ye5FRXq4/rqOr3VimlAwm
         PkkWPcKCOAgqZtEYJsDhIhvqDhfh0T3FC5hST0SW82xRpWez3t1FLenVHei7mZH8K2lL
         RF0dnV/+GhpGq1olIR+uQHymP7e/hjk6nwqqXmIOApUoH99qGLptwSLk/dPlRBMqfpuD
         SmzYbQWzeXN3Q7vtvhJEo1NNdvXKmFLC6GpwMErdX7dCvnUNPU4P1lybvzvRL88dtUoO
         19xQ==
X-Forwarded-Encrypted: i=1; AKwUvBynJ9rzlEu7f1kl3x2SMWexVUGDb+XYFCA4V7QuTP5lRDhCGB/WF8c6LKYeH5d1CyxN2Zx1WgaU7o1KLg==@lists.infradead.org
X-Gm-Message-State: AFuF++kT6OcvEKsHHa9sU0Hxr3MnUPf+Z5W8tvoKT0TeJnpzeL8GsB1v
	PClLEhftWi8MjKbtK//HQU+aRqEFXaODBX2Ay4dtBX7ZFcNh4X4dSgVt
X-Gm-Gg: AYBFou2sU/L7G5VAwRxfQuk6gNf65Mz/RxOG/k4T8qRVHlbLhM+9SJZDGyGUgFghsdN
	pEcW1trdMesWzocLxfoCR1qjp9Ubs020R+kXA8lsIASiKqWDVA6WeNL5v/Er7iQsSsYtztBgPzK
	FALQCSsWJrem7KzCxot/orNzg13RpU0bc1A5SwhTZiTP0WooB4qhXxqc26z/pKKX66UkblaPyye
	AEha7CkR9W5drRXZKdzfPQCNJ62smugvpFD1+ODQRDvCLbrcveQttCT8Vjd9WSOfUV53LSMAudU
	H+uefYiM8zHe3J2TllIg292Xcbho3jP0WJNN9AMkn5LPXIFQt4IHgXUChBc3nWI2izxSuwXvQJe
	a2A6gAl8rkSWeNhEswjZOFRwOYz9thKbzK4K7hvPmNZjxUv1b4LKOKOZ8MZJz4f63uX8tZ3Mhue
	HKhSjaYRwbZGceaKKAHKRS5g96OxvvtMdfDb4BlZjhKpCs5S/RBOpMG4iL1sT/SXp8fsJxUK2Me
	879wrbl0uIygrk0t0/ZlFOBVklEtmLs5zBs1mBnJjg=
X-Received: by 2002:a17:903:3b86:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2dd83851a2emr4167135ad.10.1789463745776;
        Tue, 15 Sep 2026 02:15:45 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4a7f17ecsm47233025ad.14.2026.09.15.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:15:45 -0700 (PDT)
Date: Tue, 15 Sep 2026 14:45:34 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kees@kernel.org, ritesh.list@gmail.com, amachhiw@linux.ibm.com, 
	mahesh@linux.ibm.com, nikhilks@linux.ibm.com, robh@kernel.org, sayalip@linux.ibm.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH V2] powerpc/kasan: require memintrinsic prefix support
 for KASAN
Message-ID: <aqkMYJXu7mV40baM@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260911180536.3234640-2-mkchauras@gmail.com>
 <508afce0-d479-46f3-a2af-d7e6cdb65232@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <508afce0-d479-46f3-a2af-d7e6cdb65232@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_021546_861942_F3F9611A 
X-CRM114-Status: GOOD (  27.43  )
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

> > - cputable.c, prom_init.c: the original comments said "use memcpy() so
> >    GCC emits __memcpy() under KASAN". The real reason is that these run
> >    pre-relocation: the destination pointer is PTRRELOC-adjusted to its
> >    current physical address, and the kernel is loaded at a different
> >    address than it was linked at. A struct assignment (*t = *s) may cause
> >    the compiler to emit an implicit memcpy() call that resolves through
> >    the unrelocated virtual symbol address -- before the MMU mapping is set
> >    up -- jumping to garbage. An explicit memcpy(t, ...) uses the already-
> >    corrected pointer and is safe. Update the comments accordingly.
> 
> Nope, see my other email.
> 
Got it. I'll remove this.
> > diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
> > index 6f6801da9dc1..233b5c650d1e 100644
> > --- a/arch/powerpc/kernel/cputable.c
> > +++ b/arch/powerpc/kernel/cputable.c
> > @@ -36,8 +36,12 @@ void __init set_cur_cpu_spec(struct cpu_spec *s)
> >   	t = PTRRELOC(t);
> >   	/*
> > -	 * use memcpy() instead of *t = *s so that GCC replaces it
> > -	 * by __memcpy() when KASAN is active
> > +	 * Use memcpy() instead of *t = *s because t is a PTRRELOC-adjusted
> > +	 * pointer and this code runs before the MMU mapping is established.
> > +	 * A struct assignment is a compiler-generated aggregate copy whose
> > +	 * implementation is not under our control in relocation-sensitive code;
> > +	 * memcpy() ensures the adjusted pointer is explicitly passed to the
> > +	 * copy routine.
> 
> This comment is wrong, see my response to your explanation. I think the
> comment should be removed completely, now it is possible to use *t = *s
> without any issue again.
> 
> 
yeah i'll fix this.
> >   	 */
> >   	memcpy(t, s, sizeof(*t));
> > @@ -55,7 +59,11 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
> >   	/*
> >   	 * Copy everything, then do fixups. Use memcpy() instead of *t = *s
> > -	 * so that GCC replaces it by __memcpy() when KASAN is active
> > +	 * because t is a PTRRELOC-adjusted pointer and this code runs before
> > +	 * the MMU mapping is established. A struct assignment is a
> > +	 * compiler-generated aggregate copy whose implementation is not under
> > +	 * our control in relocation-sensitive code; memcpy() ensures the
> > +	 * adjusted pointer is explicitly passed to the copy routine.
> 
> Same
> 
Sure.
> >   	 */
> >   	memcpy(t, s, sizeof(*t));
> > diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> > index eb9f556b0937..d6d7f1ede319 100644
> > --- a/arch/powerpc/kernel/prom_init.c
> > +++ b/arch/powerpc/kernel/prom_init.c
> > @@ -1363,10 +1363,12 @@ static void __init prom_check_platform_support(void)
> >   				       "ibm,arch-vec-5-platform-support");
> >   	/*
> > -	 * First copy the architecture vec template
> > -	 *
> > -	 * use memcpy() instead of *vec = *vec_template so that GCC replaces it
> > -	 * by __memcpy() when KASAN is active
> > +	 * First copy the architecture vec template. Use memcpy() instead of
> > +	 * a struct assignment because this code runs before the MMU mapping
> > +	 * is established. A struct assignment is a compiler-generated
> > +	 * aggregate copy whose implementation is not under our control in
> > +	 * relocation-sensitive code; memcpy() ensures the adjusted pointer
> > +	 * is explicitly passed to the copy routine.
> 
> Same.
> 
Sure.
> >   	 */
> >   	memcpy(&ibm_architecture_vec, &ibm_architecture_vec_template,
> >   	       sizeof(ibm_architecture_vec));
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
