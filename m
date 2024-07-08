Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67682C3DA45
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 23:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nEVAlst6mEAsGybdhJsftlF/Okg7ADGluZE4qO4fVI=; b=EfiOEyAQzw3mRJ
	HlYC7TdQ5JjVJHHI+371jIp6OT0SQM0xx8a1rGAZMBbkSeMkhjfhw+gByJD8QrSNvFsE8y+8WWFI4
	reXEWcRBqpluwFxl2e0mX7MOxFkDD58PU0WynBnKTeC4uboUPsNX38UTQJV31jd+Xce5e1ljgFjp9
	WdiHZgedGssC56jMEjRBYEXQcm4VVRIX4yGXUvLbkDrvhbLiCr5urLmAe/oFcHv4hK7EreyfmS7Li
	1HwD0lAHZmWH1SfdZJB+E5msZ7xAoDYHJodvrHhIlv4r0lDxQvfjGmDQs4kf7cl0l4pyZLEFBW3Re
	kXlucU0zmXXVSAQW5qSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQy6j-00000005MG3-22sz;
	Mon, 08 Jul 2024 23:49:21 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQy6S-00000005MBU-2uoo
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 23:49:07 +0000
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2c9a10728abso2433414a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jul 2024 16:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720482543; x=1721087343;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTCvURDHt1Ehhy2ogJ4G2eNRAbN+TU2XGb1d5J/SBYc=;
        b=VB3PdnO376faD2zhG0kIa4UdXhYRaNdRenR6dv/CprJ9nwQnBo/3Wi+nIDUGltGwuj
         d4ePHBkv459gOuZownaUSmqAjKhfg+AFKDIjR3+YHDcsYUvVzJzzV5IZ7T+HDCinNdtH
         dT+uJfY+i9035kc2mZeI87fBwEMruJaRcun7q/LB9V8BH8zSL+w1MMZjGwV4PBQ8+zCQ
         omz96NyoCVhDWYxa14mPXNvEJaRR7qDTnVzjbpCqgKN3j6EUYUAuMjrZ6oMrlZbS1DKQ
         +r+VOdUXozryBYTEBfV/hV2P9oUFtl+ltgz9Thsp2bIhByfyeGgEvnZAyqns/Qr5Af20
         9ENA==
X-Forwarded-Encrypted: i=1; AJvYcCV+2fHaxxJqXL6pl34hQAtue+5d81AKhCmu4LpkZqcgDVemRadVJu2PtFURlvHUsuSEf2TnTzTV0kRniQO5Dme7R1uLzSmz0wlF1Hp0PiK0
X-Gm-Message-State: AOJu0YyU6YQWxrIGOhFZmu5LyHl3dQORhem+szUYiDIjH2WdtaYVpk1z
	IY7Z2VKPGvfr8PYtPPYzvWkxWXeH30bs5wI+rZ+jWh5pz1eNOcQro5NZDgpK/n4=
X-Google-Smtp-Source: AGHT+IF2sRCcp1Qt2ncA7/dcBS7eQVYhbuVP4CESqTDlDqz8AWSIBYQ0ftySS6HXoODFEfyN2bXeTQ==
X-Received: by 2002:a17:90a:a10d:b0:2c4:dfa6:df00 with SMTP id 98e67ed59e1d1-2ca35be0661mr981011a91.8.1720482542878;
        Mon, 08 Jul 2024 16:49:02 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca344c399csm596679a91.5.2024.07.08.16.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 16:49:02 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Celeste Liu <coelacanthushex@gmail.com>, Heinrich Schuchardt
 <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, Guo
 Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Sven Joachim
 <svenjoac@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich
 Felker <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Tony
 Lindgren <tony@atomide.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Mykola Lysenko <mykolal@fb.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org
Subject: Re: [PATCH 6/6] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2855/tegra/omap2plus
In-Reply-To: <20240530111947.549474-14-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
 <20240530111947.549474-14-CoelacanthusHex@gmail.com>
Date: Mon, 08 Jul 2024 16:49:01 -0700
Message-ID: <7hv81f78cy.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_164904_747457_37A27A6C 
X-CRM114-Status: GOOD (  14.60  )
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
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, Lennart Poettering <lennart@poettering.net>, bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Celeste Liu <coelacanthushex@gmail.com> writes:

> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
> with systemd") said it's because of recommendation from systemd. But
> systemd changed their recommendation later.[1]
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
> support it.
>
> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>
> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
> ---
>  arch/arm/configs/bcm2835_defconfig   | 1 -
>  arch/arm/configs/omap2plus_defconfig | 1 -
>  arch/arm/configs/tegra_defconfig     | 1 -

For omap2plus_defconfig:

Acked-by: Kevin Hilman <khilman@baylibre.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
