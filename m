Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BD4C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g95T2mAKZoeSP79kkFyBQsUrzStsiEVj+9cCnVHXYCM=; b=nzUo04QobLVMMP
	1JxHRjxM3WbFfAXGrJGXE++Oih/sEM7mSMf0Y0eXdx5ymeD1D9QjjqGOFE02AxzoVdPNdCvkbTq1g
	vJxUS/77TUygklr+TJLFIII7OW+JbFbMJBzVKVhLQc2h271PBGb4yYD+QzyBuDf7+ltLXYu0E2PHw
	W6bY901zUYiDlG9FuYqAdHTNtdFyuCRXs91A9rP0pp3adePa1vaXbmqXkk+Pm4QX5K07XgzfPrz0k
	jK5bW+aMGbzsKybwKFLJoMviftdgISbvq9O+HBDxHPCZrf0HxbIw2kTiDM8ZuqB2Fehoz27Drz7Iv
	1HD47yJrdny+uh0ZpZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5by-00000000UeI-3q8d;
	Wed, 31 Jul 2024 09:27:10 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5bv-00000000UdN-3XMp
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 09:27:09 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52fc4388a64so9323396e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 02:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722418026; x=1723022826; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p7SJK2WN3L6uZyaEdLNNOcGfMCG9Ym2ay5t0xgYijf0=;
        b=OQy3pF/7aEDrOT1LIKQ7uJqFaQTM+qurX2qepLE4bSVff8+ASsjZyT+HCzPcIB5uxG
         cAX+Srep56KENJ3VOJdG/HyNmi4WKjY8LMRsEX0RalCqUjslQcR4JV1WfKcYNF9+GZL2
         WYx1F8MJlmPCdmJ2vHRhEBWJYAZodnxCvQ+U0vvm4ID/zereYAR/BSwMT+06qvP/w+MW
         KjUnFUv55I+V5q3MTqRlFOG7u5Z4fJuQuSTtGD04U9NMiE1Jfht1JK+jETLc4vhGKLg7
         BiAeGIHJ84rMx2AjOh6I/JJLa4a+p37MbT9hj6Cns4fmdy/0Rm1OXtQu/2hd9FSFaWBP
         Wxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722418026; x=1723022826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7SJK2WN3L6uZyaEdLNNOcGfMCG9Ym2ay5t0xgYijf0=;
        b=so6sCKbHtK07Tg3/qtzkAl3ZomqkVsasKqUmuuuEZpkA47kWWH3R1mVoWqznry+dtY
         kpIJ23HoJVUxJh91Cs4sTXN3ZO3JDedM4mzgH6KFeERGk83tEy3qID5+Fm/2wYKQdZQ/
         7W5vx9rAvk/Yo6dQB4MI8m7UfAMUoz90hKjBXpgJwZh4eqUXPrtf4uPt/RVOn5JJ+Mix
         Wah6uGN3vjrUZXLw7yhZ2lKzcyEGtVb4/qKPIkAuxeDYaQdg/T7JNoj7nPFgSvOl7Vev
         N2ModPtJoC5o0IOa1KopTg7c6WujrPaek3J9jkp+4/Xmy8PH0+ACFNDJa1C7esEWc4ET
         5LWw==
X-Forwarded-Encrypted: i=1; AJvYcCUUM/w2uMDDfis1RfQ3gTtySWO0g/B6Tdtpcn8kvywnB13TnTpbpPU7nWKMDMxCGXqS73aTjgN2Im4PiENsqqTTOe+gVcKCJ+vPzwxQGYFj
X-Gm-Message-State: AOJu0YyPO9063ic8CXn+GxQEDcZG/r3GEv5hoU3Rnxkz/TwkhPVRNOit
	co2KQ7MGoT684xT6KMj+njWHU4Vt+7usvxyS5wXBEI9ML8BCsliB+NwjsaRT7GY=
X-Google-Smtp-Source: AGHT+IG3JIOtJ24DzWq2AbHse04McdP7VjBbSLZOo3eV9EeDpYpgjlKyfa2GCIpAnxuCqpt5LCi3OQ==
X-Received: by 2002:a05:6512:292:b0:52f:c13f:23d2 with SMTP id 2adb3069b0e04-5309b2803e4mr8247308e87.25.1722418025413;
        Wed, 31 Jul 2024 02:27:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac64eb3c1esm8451687a12.78.2024.07.31.02.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 02:27:04 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:27:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 05/13] riscv: Implement cmpxchg8/16() using Zabha
Message-ID: <20240731-da4a7d7790e88a6b8960ad3e@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-6-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-6-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_022707_906912_A86B55E5 
X-CRM114-Status: GOOD (  12.69  )
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

On Wed, Jul 31, 2024 at 09:23:57AM GMT, Alexandre Ghiti wrote:
> This adds runtime support for Zabha in cmpxchg8/16() operations.
> 
> Note that in the absence of Zacas support in the toolchain, CAS
> instructions from Zabha won't be used.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               | 18 ++++++++
>  arch/riscv/Makefile              |  3 ++
>  arch/riscv/include/asm/cmpxchg.h | 78 ++++++++++++++++++++------------
>  arch/riscv/include/asm/hwcap.h   |  1 +
>  arch/riscv/kernel/cpufeature.c   |  1 +
>  5 files changed, 72 insertions(+), 29 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
