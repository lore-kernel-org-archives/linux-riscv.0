Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A33C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYkTAkM+ddvUBZEqfvpNWee4XdXYLlN43rQqzLWtS5U=; b=cSynR9Iin8QNoe
	++7hrLkrbuyxcL7DhvgcR4uPzdRxsXs68J/oXmVV01lJ2swN2I+oh5ClnhddIXQXP6U2/Tm6U7F4Q
	f5Xh3VMYZPAW5TF8xgijp1+p/nXFkSm2nXyT3ip2ti4wm8KV47y3kbNy/ulzGEoEE/BH4649UV6wk
	KA8V+90oB7/bcG0De7N1Yvl1ZNHenfmC6mR0/NxCGeXIfRy1H5DRCqWj6fTzP3FGbg/k5IZdcDg4C
	nJt25s8nX6NPwI9+nJEcx/RNsJ7ynTbs0MfCxLqAkg7lkaNX2rdZ1C4Ja47B6XehQJydmADTTXTUB
	HzODU28IpO9xYAqwWQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmKJ-00000009J0m-27zU;
	Wed, 21 Aug 2024 14:28:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmKA-00000009Iv9-0Wv9
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 14:28:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso74092785e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724250512; x=1724855312; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33YdeC3iT8CR+j1SZblDhoqx85c1E/nanH/Mxt/0lc0=;
        b=DG3FS4bku5iYjr6H+uzAmz9zDUxuEEMxGX9M52qnEzHPXsd4+stodWxPNxD/PA3gVz
         CHtdgzCKfORHLeo16lug8gq1odUEuGXtnL8KPTOVo8czWUL+eVZu7NWTrGl0jnqP5Xlw
         MTFWI5ib3Veg1YHGTBCOajG/ftGnszRc2VtLRbZhjksBexxwZGPZRnCfAaqb3uRZf9BK
         5tyLaR8ieFIcGj86KZmJr8Q6np0ac5B80vv+vWTZuJFfJrYEBx+DIhFpT4X5ZGxfm7AR
         iHKRK5Qa7cDGYT89P0Oi3q21mCKx2CxUP+rJGDqEMmasgn3eTfI4BmLuoYKVECjdsidp
         Yx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724250512; x=1724855312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33YdeC3iT8CR+j1SZblDhoqx85c1E/nanH/Mxt/0lc0=;
        b=ngC3ibwq9ENDl2galtlRiP973b9FXjzPMHA5P0LYG5rFQLBfCCaTfD/F1vdSTZHwWz
         EmLFb8mDLi897NcxoPKHJWKkJa4XMLyYzub9vq5ygZ5HgS5eHuWnq+qVcgu9+7DEGDSR
         WiiEbIxyVjpfOV11vrW4tyZ4O/ZL0Y+urCOtPYkChcj5rloKfN5du8wfy18yhf5+i2lT
         hUSWl1b7z8zIuChfLVLwBgCyqX2gqmZz6Gs2NREQlWx+6x1xanOv6Ooj0bhO2Eqm5rKr
         sSqxFgaKVii1WGSwn6r8q/A4tvQGpsS/QRMODuh4QJzv+rl+swylhTs0u4J2Eqy8Z6fk
         tr7A==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6Iw71YeZtp3FmqlP8PZvwBPJso4mgEmVxZCjn+C7L/4Ck207PwvK0U3xUEQbTSweor2r3VbCtosD7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHadlwUVEkZJmNb+2Of4sMx3ZVWLPG136AhnVnjV/3GexteA/Y
	2ixWdf03s03PXzGC3QoHTuXt0m7k/fARt0cDkWgMoawkp/Gkjnk2A06Xh2SKtNM=
X-Google-Smtp-Source: AGHT+IGfr36ocwDwn4or9Mf+dw2bDUy4gQ0Y1c7nRaSul2nHYfbm8Q0aRagSkky5/eY78AVRXeTy4g==
X-Received: by 2002:a05:600c:198b:b0:426:6fd2:e14b with SMTP id 5b1f17b1804b1-42abd21517amr21696485e9.11.1724250512150;
        Wed, 21 Aug 2024 07:28:32 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abed8b6a8sm28505615e9.2.2024.08.21.07.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:28:31 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:28:30 +0200
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
Subject: Re: [PATCH v5 09/13] asm-generic: ticket-lock: Reuse arch_spinlock_t
 of qspinlock
Message-ID: <20240821-e350a1485008ee3263fae985@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-10-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-10-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_072834_196139_4EFC68BD 
X-CRM114-Status: GOOD (  12.57  )
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

On Sun, Aug 18, 2024 at 08:35:34AM GMT, Alexandre Ghiti wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The arch_spinlock_t of qspinlock has contained the atomic_t val, which
> satisfies the ticket-lock requirement. Thus, unify the arch_spinlock_t
> into qspinlock_types.h. This is the preparation for the next combo
> spinlock.
> 
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/linux-riscv/CAK8P3a2rnz9mQqhN6-e0CGUUv9rntRELFdxt_weiD7FxH7fkfQ@mail.gmail.com/
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/asm-generic/spinlock.h       | 14 +++++++-------
>  include/asm-generic/spinlock_types.h | 12 ++----------
>  2 files changed, 9 insertions(+), 17 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
