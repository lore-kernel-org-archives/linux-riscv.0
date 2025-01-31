Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA65AC0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 23:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1QIBn9u9LbWcd6L1DbZhmFyMraC3QHR/oyQ4WVJ8D4=; b=LoYs0cwFq4ONIP
	8p3kqPjD/J8PztcwAeZk5VajmWb16YxEl8gN+CNlDuIi2bsA8PDsOAVrh6UVjGL4EYJuwzUrarETI
	IWUMV9XOIqYyq4FVZr4+ABQFWbBa1UBDFxGFBNgFt8sLriBEVfKgBmHGEcnYcGV3hstoTKo7Chv/S
	0pKWnYeMJTwVOZamdeuX4xlo9EI82MlfPA4SXrbAsuGY6qa5x4697Iu+t/vc9WHz0BbK7NNk5V4gn
	rFEtU0ivqPwGZBeaZhFKrcNnYHQ7IynzMPhjNeO2Mahuymi9tFVL36bQ4xEjWZI1UaFZ8NDoeW1pq
	UOdXly95dTW0IxLxcmXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te0hH-0000000BeLT-2lEW;
	Fri, 31 Jan 2025 23:45:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te0hF-0000000BeL9-2FHu
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 23:45:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-215770613dbso35118245ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 15:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1738367112; x=1738971912; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FDhxU1Wjdu9clsSFdKwJ9yZhDMh/uanXENuaIJxZ5UE=;
        b=R5BKxEtqaPFCfqJS6Qa6v3+7D6E1msa83nhZwGpk4PeV9uBs7dICe83Gv3T0M0gTKQ
         ZRcGbDifCnJt6mroBNobEKNNJ7dE8bYwI7s9l2thuwqDRseJOyp2JYGMhMBYY8P649wO
         5ZUHln0L8mT3Q650thAidFvjL0hDMGWdgG9gV8CQtrmnAsUtamn0a9VD654OhON4JCqL
         P2xG8e+4iTw61C7mla63CwE0H5YyJJ847L270+ClLSPRPz9SrhaCKXCVZMWh2mSiBS7o
         iOiU2GxnyqIDkOaQnbXimZX80iFkmKRp1l39DfIJKdsIVJ8nf/moCvpoYW1DZ4txaICh
         pR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738367112; x=1738971912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDhxU1Wjdu9clsSFdKwJ9yZhDMh/uanXENuaIJxZ5UE=;
        b=rPRgk7Zt1g//lr8FJIOwenWHhb84PWyEQl5zsgvVF7cdpEHxW6G3BbjQAhaSL3x+CW
         26sxHsflfD4y/pQ9S2US5/Hlrm7oMeYU/h1+5irqLnJHuW9Srzs5Yw3JFR1x56bus6q9
         dm4mKU74cRQv5nNU9oXGqb1YjCS6+k++jfpq0zSsjy+X8QR5I2ceFW3SRYVd3z5W96ft
         EnOy0iRYZrCHdr3ZpwkheKwEPtEeVX6LhCntV8BwOBRpBklxBvEO8gtMfGE4lZGVesQl
         n5teOHgXmeAFddPZdoy+cRXaLH39Emqkt/yGPNnQijbR9cixz7hSbB49ujyDoSkcaCqw
         LFUw==
X-Forwarded-Encrypted: i=1; AJvYcCU+nZCYfNLJj2AyJKMtqW8mpSzK/8Fn4jNQKZsGjV2/W8g2YksdG2yPQP8EpTPtXWgC8Tb7xvChGMEbkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEUzk2vo54JULwr5isi+nl8ATcyrP3bZx5uaKw2/gusqgowJQX
	bTo4Vpe65mmhnrFOtZdCDmbZAmeP1eVkpbvmi8REqjTOocCRSe6JevbTbCqbqTFgmr6n4WG6F4w
	l
X-Gm-Gg: ASbGncu2a1k70dJvysOHdFkPei+NWyJMsDdj5xmCyQcY/hWpoRcDUmRZuc5GmqcdTbj
	Z3m6+SHXDSQpLIhhDBREqMxy6/JWo/A1DBkCpIeVQM0aAGUppgLwKoP5BHJCXBVy046Nh+RKRB7
	rCC+tuu47plhHxO+L36TzLnk27XgLKwQP9HzfSwZiez3dkhm4jvOSiOLycezgfjSR8Ok7PCouJA
	iJr0f/RII/yIxn3erYtIQX5h4utkxxWcbOO6r7EomROv943Lv0aMpuScXJzIErw9dGZLfmJdSuP
	h1iNUE3YGYAQBAX4Heia9Q==
X-Google-Smtp-Source: AGHT+IHkTz4Ig+KYTw+rB0uKzYNadppQzCfmbX9cSa8DpGTtUiLQXcciZFMKT3l9NUzEVW9YDmNYKA==
X-Received: by 2002:a05:6a00:179d:b0:72d:a208:d34e with SMTP id d2e1a72fcca58-72fd0c62218mr20830859b3a.18.1738367111971;
        Fri, 31 Jan 2025 15:45:11 -0800 (PST)
Received: from x1 (71-34-94-122.ptld.qwest.net. [71.34.94.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ce907sm3934327b3a.141.2025.01.31.15.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 15:45:11 -0800 (PST)
Date: Fri, 31 Jan 2025 15:45:09 -0800
From: Drew Fustini <drew@pdp7.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
Message-ID: <Z51ghS0eFmvClVYR@x1>
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_154513_844759_2E31CB13 
X-CRM114-Status: GOOD (  10.28  )
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

On Fri, Jan 31, 2025 at 12:08:40PM -0800, Palmer Dabbelt wrote:
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1
> 
> for you to fetch changes up to 101971298be2aa4706c8602bd81066a0f6f2ced5:
> 
>   riscv: add a warning when physical memory address overflows (2025-01-29 18:36:09 -0800)
> 
> ----------------------------------------------------------------
> RISC-V Patches for the 6.14 Merge Window, Part 1
> 
> * The PH1520 pinctrl and dwmac drivers are enabeled in defconfig.

This is my fault that I did a RESEND [1] after Palmer had already
applied the patch. It is already in torvalds master through
soc-defconfig-6.14 [2]. I'm sorry I didn't realize my mistake sooner.

Thanks,
Drew

[1] https://lore.kernel.org/all/Z5wy+NosgbxYk3fN@x1/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/arch/riscv/configs/defconfig

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
