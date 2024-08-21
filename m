Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D29C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 14:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvusWjlmShw5/LDE7J1Ciyl8spcGTl0chwPy6s91Y7E=; b=DwqyAV5By3FIOq
	mcUkBGa75X0yGdkYekj4IkAj3zp9GG9M33bUxftnRkX1HCvP6yKbK6VYqNIlDkY1wY7Ed0yLB1t3r
	bbHnAnR9Od/aDDDIJfwG+T76eotc49fiAfVGeIt1vwSHFGUcf5mDFfFFmiUsB6VHR+1EiTRYEIGGU
	MocfBB0+uOKLNu/e1DoipWM7ZZqsdAbLUNgiKb0XEorENMI0k3i8mf798pXkf3mZdNOz2oTv0fnMa
	Mv48dTHzWjmXjvrkZ3dzVOsnYixQkfA3jITv7E9EGutPokGqtfplXNr4ICeWCZ1a9Hxi+XFP94hpY
	iR+ZFoWC3YojwELBVt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmOJ-00000009K5s-0fAu;
	Wed, 21 Aug 2024 14:32:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmOG-00000009K5F-3M11
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 14:32:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42816ca797fso56042835e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 07:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724250767; x=1724855567; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BzH0Ti5/cSa4VdiVvC7Ftff2LpcTCcyPmlVuI+QhSpA=;
        b=mYlq5SC7ZPWO4hk3oSIc4Fq8PpXcTUv/qlpUuhXxuaycscmeGMq32mUwReZGTsKoBk
         lyCYhfkno/k9RkSSSYN+nHbw5mzHfH8KEY7iv07U9zfjgF8CG06UZ3Wm4relGrCkfuIX
         6VrVIpcNtxuj2TP+/tV5LdI6/mfg/47lUJAmOiDPYGSFcJQrECi/YAG4zo2keWBckT0Q
         vxbl7bXHkG4KRikeslMRbvGgkdBqW/ckFyd4JHD4oyaJaggTvNCh2TWAOBn8jRELT1IF
         IiEorTxgtEvR9fepFJG7PVWU+xOo1mArRCx8dqPminlCwQkFZaOX7p8n2JtlpwrPqPJ3
         UNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724250767; x=1724855567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzH0Ti5/cSa4VdiVvC7Ftff2LpcTCcyPmlVuI+QhSpA=;
        b=BhV+acPd1+5oMQUPoiBQQ6uglW7yjO3J4FWZ/ApCoQdUnQy/Q/zViEJI7+UWjirv74
         ZJKGQNYwr40fQICGtNlEOpjb8R6/WkAYK1d+zCWMyjE1TGdUIvM1cUjyaV5/P6PfogCv
         SNn1dAUZS9g6Q365rnDoW4F6kyReWcc2NxOEHkRr4EvzUhRvribMNyPdGhTHvww+n6r8
         Qg5mVOiIduaatGHAYra0xmY7r48ROhpA3Kjp9QEAMWhaTLPcBlEucu39Rc8cnublWNqr
         Z7ZeR4C5AnBrjdGbc0KMARyBnVeGXF0CDO+GX1+C5UPLTavRE61uhn6pw3k4/1b6P1aO
         Uywg==
X-Forwarded-Encrypted: i=1; AJvYcCXSWZUfQbruHU7y48oUP0YQBh4JGxuAIRs8OGDqOUL1gfPy51IEADhTz7jjVsyUueQadOB3yLmdTh0Eyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfru/g5eKaQpyruKD5DJv59DUJapVtI+ANyIRxiuGnsyf5gmOe
	F7PnEFBDvUNO+miQXcBBSNa8wCWnyd+MtDHoHCBvhpWPE+M0dwwzm8xG+SRGDoE=
X-Google-Smtp-Source: AGHT+IG9h6I3OGfk/BYjIhaBWJg+eWFf3tj96tXLfu1MoIVwYfpY3HO/tLKYhUHQR2BfZETfuvcMOA==
X-Received: by 2002:a5d:5184:0:b0:368:65ad:529 with SMTP id ffacd0b85a97d-372fd5929f0mr1701638f8f.17.1724250766402;
        Wed, 21 Aug 2024 07:32:46 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abefcb674sm27234295e9.32.2024.08.21.07.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:32:46 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:32:45 +0200
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
	linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH v5 10/13] asm-generic: ticket-lock: Add separate
 ticket-lock.h
Message-ID: <20240821-8dc1f3151679f2e35255683b@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-11-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-11-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_073248_859688_5CEE6733 
X-CRM114-Status: GOOD (  11.47  )
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

On Sun, Aug 18, 2024 at 08:35:35AM GMT, Alexandre Ghiti wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add a separate ticket-lock.h to include multiple spinlock versions and
> select one at compile time or runtime.
> 
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/linux-riscv/CAK8P3a2rnz9mQqhN6-e0CGUUv9rntRELFdxt_weiD7FxH7fkfQ@mail.gmail.com/
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/asm-generic/spinlock.h        |  87 +---------------------
>  include/asm-generic/ticket_spinlock.h | 103 ++++++++++++++++++++++++++
>  2 files changed, 104 insertions(+), 86 deletions(-)
>  create mode 100644 include/asm-generic/ticket_spinlock.h
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
