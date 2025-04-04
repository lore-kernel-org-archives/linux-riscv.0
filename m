Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283CAC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 18:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqFxJiixir52paptTYL7lT4yfkq/BQa1fMf4v/YTAkk=; b=dUiaC6cp2Xkr9e
	tdO/Fa0uFlqSlax8lmVRdx89i9iSMnjyjPs/ayxF52JAQX1iS9g/akMwFhb+ENt1vRznY0Qm+p17A
	kXA8UPW7gZ9uuxt4zPyw0aroCfzbzIlL+wfJu7ERksC2ffDewdtPiaxj6+HKKj24QulIIMnK/6Dg/
	pQBpsod0EPVDyNnIxbat+QnEzNVQymVIcsRO0v2I8wRvTgRHFOQMTdaRcW0nt5CbI3u1zYcJo3P4Y
	g+uN40ZI5vtIuGtzNMMhOOMTfGS8aeWj2SBbmKZx3dZBUJnqn4IElviUNwlB1IQEXPSqfCwNwsWJ/
	OEhmqT63C1anHXNCwe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mCr-0000000CZCH-0kRU;
	Fri, 04 Apr 2025 18:55:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mCI-0000000CZ6J-2Q4r
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 18:55:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2260c91576aso20667525ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1743792921; x=1744397721; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=32troSjWvB/PDlVrpO70BnGFukXnYd/0VAcsVL2VxIE=;
        b=X/Ci/ZAMdZdz3fCJOUbw2P3bBtzN/dzaI2BA0FJMVc4a23pRCqQ9luaDE5B3Z6p43s
         0X0kRsrxcNAB4YKM2oWga0zngSxZ9w61DGV8tC1hFrL5XrIVAAJZB9p0sU51sNF+gnzt
         rEnZMQR8rIkY9yVVPXooi5tPs3xsRoFRma8uoPXPJZrJmqJBvrCipUFLP09VQOqDiZHE
         GvANJuvUoecRtsqKrgkd+/5/E6QH7aa1Kz3Q4dHqDPJfOG+y9xr6pjiDEbtgkLlxD58E
         ZbyGEuD2lB8udsdF+HFWtj7go6cGymCOENFjA+zSuopgBGohxJ2/MU5tTP4/5G5rKMDh
         5KeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743792921; x=1744397721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32troSjWvB/PDlVrpO70BnGFukXnYd/0VAcsVL2VxIE=;
        b=mb8urjrQlEpRoC6/eK2h/8BcpUT6sXJjyjazGgWhwZzSePhHYN9NGN9wJrFRUOaaAL
         cVW7EHAvx0ABVw8QhVhBNstL6uqY5HYpneeYjZOXx40+b0J4WgAr+9XbmjzTzQ6FQ91l
         BznyII++6UXtxU3ZPN+bL+DVRkH7IVxNKeEnklhF3mnsVHclAJPayFVom4jGjIudtJ1V
         N54zR158IZEkwMZwz7vGP0p9kb/su4mNILn5H4K2c0AIiO+O2L2Vfs1atVf8uchNhDnF
         vcz80Z8rHb3S9flAc/hQOq4mbAT3Px1bkNZq/V+pQLQGs5u/Pg8s2tYepbW7f+pUpgYc
         s5VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEXvmzlAwTmdWhYtpsJsrQTu/YKJeg8lh2AZetCCvspAvsvKRvXHR4F9GwArhHPEDFGnE9ugyYr02OWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeD9MhgVBd7eaVJZN+uD+OckN141caTeBplta8qd5pPQqB4gb+
	qj2ffLiizeCJdR3OJLDX4D3AmQP+3aHSH3FQbg0SdZEpbMMpUXePPnUh3NtuV2I=
X-Gm-Gg: ASbGncuZlFY8cF0ElS2vIZmF3XfRaz0E5fxqa8BtU+0+yPR6M2yenxuEF3w2s9nDm9o
	LefGCNxqJ8giFci9cRv/xOklFKUXxT6D998Qb0UXzP+vQfaB1gTBNW/UQNaPzADVHuYbvwngjkR
	nVFzpBQ/3Gdm3dN/88UmZKFFRviJOopRc6sxLeMutorZLLSQt5k3nA6yrdQ1G4QLVAsJ0Lor245
	0ibTUZ2UfOVTt0x3um2S8qf64n0FgYaPhniNL3O6aGtHDxVRQj/tcDn5rnuMZjJbNPBk/irunM5
	3fQxN7htxXr8+RUQzi1G56hlnhpW01R2yFc=
X-Google-Smtp-Source: AGHT+IECmYP3SjonjrfaeQPGWit3y+M9U7cHmSeJkMMAtjCbnPOJUL/PaAkD08+LqlcqZzBhgLpMMw==
X-Received: by 2002:a17:902:ef10:b0:216:53fa:634f with SMTP id d9443c01a7336-22a8a1d4617mr66236245ad.48.1743792921190;
        Fri, 04 Apr 2025 11:55:21 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e4c2sm35763515ad.199.2025.04.04.11.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 11:55:20 -0700 (PDT)
Date: Fri, 4 Apr 2025 11:55:17 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, ulf.hansson@linaro.org,
	m.szyprowski@samsung.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 5/5] riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
Message-ID: <Z/ArFVx6l5Urh9KV@x1>
References: <20250311171900.1549916-1-m.wilczynski@samsung.com>
 <CGME20250311172035eucas1p104dcbae706bec735194a1dc4a30db969@eucas1p1.samsung.com>
 <20250311171900.1549916-6-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250311171900.1549916-6-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_115522_813719_E23F3A0B 
X-CRM114-Status: GOOD (  16.50  )
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

On Tue, Mar 11, 2025 at 06:19:00PM +0100, Michal Wilczynski wrote:
> T-Head SoCs feature separate power domains (power islands) for major
> components like the GPU, Audio, and NPU. To manage the power states of
> these components effectively, the kernel requires generic power domain
> support.
> 
> This commit enables `CONFIG_PM_GENERIC_DOMAINS` for T-Head SoCs,
> allowing the power domain driver for these components to be compiled and
> integrated. This ensures proper power management and energy efficiency
> on T-Head platforms.
> 
> By selecting `PM_GENERIC_DOMAINS`, we provide the necessary framework
> for the power domain drivers to function correctly on RISC-V
> architecture with T-Head SoCs.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/Kconfig.socs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450..83833ded8908 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -53,6 +53,7 @@ config ARCH_THEAD
>  	bool "T-HEAD RISC-V SoCs"
>  	depends on MMU && !XIP_KERNEL
>  	select ERRATA_THEAD
> +	select PM_GENERIC_DOMAINS if PM
>  	help
>  	  This enables support for the RISC-V based T-HEAD SoCs.
>  
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

Conor - would you be able to take this Kconfig.socs patch?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
