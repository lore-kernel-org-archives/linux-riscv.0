Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A8C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvhWoBjode182IX3rvBPcwDd8qT3cLsW+wqCkWTsuZs=; b=rsm7OrqQvJk27m
	5Jgb1sAtNTvz4iswV487iPuZcMbFFypgpglGnTjkKTKvIBUlbZkylKBxEHNFj2osV8EJpDd9uaeoG
	JSJt8nKTmd5e1glcJDRpd3w5En2B5eWOmGxleDUzn372ONmXyH3wgZojqc29XDh/8k/d79nNSsO6D
	J20E6f+HWkwYh/w71QpAlwMmNpCKDmz6Amco0lp30Qr4KZqKztqbYqIC9xRdg35Su/VLGn9S2C+91
	lWWSF22PDhqhjNrG61sawlOJAuPGdLHdW6QhnnJVgMqiX5UZ2XLsJhdqARI5m/2Ra2IHbLQdWLIPs
	TGMuwF4Ujj6JNV0u+4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HTf-0000000Bnvn-3nt3;
	Fri, 26 Apr 2024 09:02:43 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HTc-0000000BnuQ-0iwo
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 09:02:42 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso264508166b.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714122157; x=1714726957; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5cmdr7rr4QFZS2PzQg0uqFLEwvPrpxobM8THii525BU=;
        b=lAaak+YbIiA1cvvDI0zL94BwVcmJqxVJ7WxEucA36VfHEiHsxpDgzsvZkJeqQ7xRP6
         OA+Wa0QKm1k6pnIHUgFj/I2f9n18vCrLQvOEVHLdWFeFhGDvEMDvceDOKcfWwM0MoNhz
         COuxH9IdgQVH/HP9ARNqtR4Y/x2fPlpM65V/1z2ikW6LTKQwqJJrRvZ5C/VFOyfP2YDX
         QtWVZMZGBS958y7o3OGj9MlcGeEoVZ511nwsrwGpQFZs+d1/cDk7NzNCtjln7YUwptn6
         j61hx+WvuPWNwNpDRzeawwHMjkRfj9eS9nWSs02p4lnnLbhPT5LP60k8jbHRxCSM4KsU
         TQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714122157; x=1714726957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cmdr7rr4QFZS2PzQg0uqFLEwvPrpxobM8THii525BU=;
        b=jLh5glh41imeYudSzZyn5rzAfPsEP6Ku64srM9gDU2kau4IevkZ2RhvkfGNKuXaMzf
         FG3WrtdbBY9VvlRZPEvjNhde5GZc4g+RXPg1moc5Otbd4TR15Ep54Xw5acypUwHGrZC+
         bFAXoxw4YwEMA+zgGHGjGuGEb2DtQWJwRH+uZjutAylbT1soCTQ3e6FGexSzJJUOINQX
         1ga6NX8qqJfD4X6runRKevPApIuHY+0IlgDrMbKDF2eDg30w51hWzHj5oAni6PUOu4nA
         p7opF9bzL3tUknqdupeq8oS5sdhx6LZ5giYwCzlo0Vj2viNiRfkFt6KTvBIJd4CkiWke
         pqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp9j2uuX3QClmPiY1GIwKBouxJHBBolGaT2H8K+WfhmUFd1Fvkxr8Cs2cKiOgwCsLBYWjDM35Jlz4mJbxKVLG406VJ6Xp+epsM+kKMPcDp
X-Gm-Message-State: AOJu0YwR41YEYt9vHb30Txi6H+OioY4r2Yft5u0rltQ8x0Zs8ZmZ9xaY
	RPQKvvSaoRtcTWjWq17KcHleiSn7dc1NOhDH1Ubuft/B/IqPLU6NYzIxb6rf17g=
X-Google-Smtp-Source: AGHT+IG63NkJc6p1bxym4HDcpur9jISULVtE0j/y7bASzKsfhFZof8hQmBOhF4j5tAzb0EGQcmN2Zg==
X-Received: by 2002:a17:906:410a:b0:a58:aea7:df78 with SMTP id j10-20020a170906410a00b00a58aea7df78mr1541901ejk.6.1714122156900;
        Fri, 26 Apr 2024 02:02:36 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906311100b00a5599f3a057sm7714032ejx.107.2024.04.26.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 02:02:36 -0700 (PDT)
Date: Fri, 26 Apr 2024 11:02:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <20240426-d8aba0211e882568ccc761df@orel>
References: <20240424-cpufeature_fixes-v1-0-585e73d2226b@rivosinc.com>
 <20240424-cpufeature_fixes-v1-1-585e73d2226b@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424-cpufeature_fixes-v1-1-585e73d2226b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020240_241299_0A90EFD5 
X-CRM114-Status: GOOD (  14.35  )
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

On Wed, Apr 24, 2024 at 09:19:54AM GMT, Charlie Jenkins wrote:
...
> +	/*
> +	 * Naively assume that all harts have the same mvendorid/marchid as the
> +	 * boot hart.

This comment isn't necessary, since we don't have to assume all harts have
the same IDs. This information is currently being collected specifically
for thead. So, we can state in a comment below, where the information is
used, that we assume when the boot hart is thead, then we don't want to
enable V on any hart (whatever their IDs are).

Thanks,
drew

> +	 */
> +	boot_vendorid = riscv_get_mvendorid();
> +	boot_archid = riscv_get_marchid();
> +
>  	for_each_possible_cpu(cpu) {
>  		struct riscv_isainfo *isainfo = &hart_isa[cpu];
>  		unsigned long this_hwcap = 0;
> @@ -544,8 +553,7 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
>  		 * CPU cores with the ratified spec will contain non-zero
>  		 * marchid.
>  		 */
> -		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
> -		    riscv_cached_marchid(cpu) == 0x0) {
> +		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
>  			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
>  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
>  		}
> 
> -- 
> 2.44.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
