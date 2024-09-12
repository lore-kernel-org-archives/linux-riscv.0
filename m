Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79702EEE262
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 20:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBpDzcN8M3sJbQgNSOU6to5fCwbdo+PjkTT7wYubSRU=; b=TisLAkjhjvGdei
	bMG4BbN1tEUgfgOfToS+g7WlV5/zFKKeILKMEr8xaC1iUEFzfmEqlAtojmgXNSCsj7PhydSNsIiVB
	GCSOn7bVP9c1ypxn7mYpHv2prPgTd1UFKkYWaw7PdNoukrC+VKjZd47rTt9s4bw1Q3zCBKE+haTkc
	lwWVVNbdVzf+graFzQt9mHpNwJPKFiRg+8+6STc7GAdPRxKSMEzzMF/wZASDpWLXFM3XaXpAkJH6c
	2eBMFmjTawAKYtk73/BQyW8AikhNJgPSmvwxeUskG4t5eAhiB5/pifohDoCzOt3VJek3U3VTcbgMb
	LS+N8v2PCQrRcHs1WNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqtI-0000000EEam-34jG;
	Thu, 12 Sep 2024 20:58:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqtG-0000000EEZN-2UMo
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 20:58:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20551e2f1f8so2221505ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726174689; x=1726779489; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=awElkTLWK6u37rMcH6vV+9dmrRY/uH5yY9ycJ6GvqvQ=;
        b=GuEVcMAuRYq6YYT26ep9Ol1MhzMck2TgX07Jc8ig5GT3r68GfrRZGOc0+jH8pctPjo
         pHEJZurPCfDK5bjxb7s5eojem9KPCguPVGBb1/NPeUtb7g4muebXyDNVlagpwLwVkygw
         VcpFEhDN3XhKzmABCcDh6FiXvJ8y9OwYZAu0+44HiaWM0rEvhn2CHfRvCKElatPseK2L
         fm5S74HpngkGUrELWvPkGaNHFfam61OBjpkYZB5i6Co058W4/M9Z1d8M/MP78Uno9DE2
         OaU7HLjhuQKKzfUrDAO1VftiLZUWSygVDYTGy2bvE29Y3+yFkp/kf62t77/05FFv9Ey8
         dIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174689; x=1726779489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awElkTLWK6u37rMcH6vV+9dmrRY/uH5yY9ycJ6GvqvQ=;
        b=N2gecU2pvSvNrRsvV0KX/JWKkRkaD90H1GqaRGma4vZN2/JlWFFzx5YDN27Udi3a4f
         MNCAsegbqyO79dAm2Hgm6CxmB/96NzPuqXSvFYoo8y44yASIkvJrFrNrAR+QjZmMhitW
         /SuKzpT9F+8CmSi7Dsw9vBgs4GvTJw7uL1uW1/DiAK9K3cBmbAWRHfGTOFQI1SBfyeRp
         Mx7Juc/V9F61Vthy9AV2UCugVXgw21TPmTGEiedLFuPgbdXKmJhcvBjDVMBBjHXKb4BZ
         72cgzumcOM6wP6KSGdjaKI/N+l4LMmd7tdoX3C1bk3Al/opUfAwRTBVLkxJPM5hOfiFR
         eVAg==
X-Forwarded-Encrypted: i=1; AJvYcCWCtfsMu0qNFU3YddL9D9y+gZ93Y3lWEn6oRU+OzZq2jLylGfEwl5Yp+RxOmuR0DDw5aU+sRqJdh+FhpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYCzSKV3LnvK3iSlt6ZhyMbFdjVw1wOzjtQgVpTE++FSJDhp63
	FQYVmMV9T0gV7BKQG9NIaY3J8ba1U0RjlIXgMtLPz+PEiBahyxeJ6lGpyk/zfCM=
X-Google-Smtp-Source: AGHT+IFNbFNRlMUVnmzvIAqMYOHLNoYiu39w2cW+++5PhbuKhP72IpMktdJxCrIrvKb5Z0jSCotKrw==
X-Received: by 2002:a17:902:f60e:b0:205:809c:d490 with SMTP id d9443c01a7336-20781d61d67mr8439965ad.16.1726174689001;
        Thu, 12 Sep 2024 13:58:09 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b0097desm18030445ad.247.2024.09.12.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 13:58:08 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:58:05 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Tony Lindgren <tony@atomide.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Message-ID: <ZuNV3ewTH63lb972@ghost>
References: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
 <20240910-fix-riscv-rt_group_sched-v3-1-486e75e5ae6d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910-fix-riscv-rt_group_sched-v3-1-486e75e5ae6d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_135810_699040_CA86EDE6 
X-CRM114-Status: GOOD (  23.10  )
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

On Tue, Sep 10, 2024 at 08:51:07PM +0800, Celeste Liu wrote:
> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> introduced it because of Docker, but Docker has removed this requirement
> since [1] (2023-04-19).
> 
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> needs an RT budget assigned, otherwise the processes in it will not be able to
> get RT at all. The problem with RT group scheduling is that it requires the
> budget assigned but there's no way we could assign a default budget, since the
> values to assign are both upper and lower time limits, are absolute, and need to
> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> with values that would work by default in the general case.[2]
> 
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
> can only be enabled when all RT processes are in the root cgroup. But it will
> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
> 
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
> support it.[3]
> 
> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
> 
> Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>

Acked-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 12dc8c73a8acfaa5c8f442968a807de303428d9e..de85c3ab261e6d62b2089a3c89bdc9d1b34fa792 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
>  CONFIG_MEMCG=y
>  CONFIG_CGROUP_SCHED=y
>  CONFIG_CFS_BANDWIDTH=y
> -CONFIG_RT_GROUP_SCHED=y
>  CONFIG_CGROUP_PIDS=y
>  CONFIG_CGROUP_FREEZER=y
>  CONFIG_CGROUP_HUGETLB=y
> 
> -- 
> 2.46.0
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
