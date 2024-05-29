Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481B1C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 22:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6By6/iIgLSzI/3iVTSnigWe1nnokwRlmLXXBetD084E=; b=Cwp6+4/PMAdWhs
	VNRS2kyVy/CVyt5MxV8JRRG1Onl7NtUTt5Ii3SAwRJLk+so+EziZX0r6bk4rI1oHQvpXmknjitCnB
	3e0Z/bBeVNpHcNAKq/xALr016088J6rD6P4ovNiH3Qu/nzg3aTSUl+mWFl217WH4ODlSAN6hXN5+X
	PfwDD+DmiWNjQBw9teDCKnKoF2NXqV2h41O/QxQ4OH2dz6MFruVugViNsQA3XO58dawg3nCqF4pZ1
	LeH1OD2toXhKUM007QjOtQQisMrWK6UFVVpUscz7Q5MFZ6sc7vBN8eTsKuHBeph5fAJvTYNBb3p/R
	f+RvfmWK4kEm2TEN1DHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRTW-00000005gDM-0P7q;
	Wed, 29 May 2024 22:08:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRTQ-00000005gAf-2PFZ
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 22:08:47 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-701d854b8dfso242334b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 15:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717020522; x=1717625322; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RdCGT44mhuV5q5NuFAR9fXiN471X1L/TiMRJsZFqU8M=;
        b=dqWiohflYnXmDKKV5Q5ndCjIw4IbxdwEx4SIOSl2NRQFOzT8juTkwkhOpBSOhlvLuh
         LbGNJT+cmnM6lp5uIG6dggjqoZ1dhA7AGp4uVmw06AqsQVrVtRcelAO8ZM4/2ZAHRveD
         Z3CproiHUIeb8V6zKEe1mjMFuLkoB3ivqAxitiVJPcYv7rshyRtdvy13/4W6m64mGgIt
         C0UATuKofHMswauVpKjVQTRStd9no/sBSbCG+taO2HyqTjBJZ/xixyIszfQFzuY4z+I8
         kCu3HZkWMFMdKxSPTxFfeumXEtLhn7qeFoOrYfrReYsy3Tjbxa1VycUqH3ucpVkdMzkg
         8jfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717020522; x=1717625322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdCGT44mhuV5q5NuFAR9fXiN471X1L/TiMRJsZFqU8M=;
        b=smTtDxbaYJbCcoIFyJ1LAbHSdDBppDzOCPnGz+9/I4eO68yYhml0fkJ+IOeWGkYyAo
         Ffept2TTIhbPFmXwi3m8vklS+dEewt5C87l9zc4Oxt3dMJVclD4oW8SwUczzNF1MaZ8r
         HPGboeq3TSgUo5Pg6qpuWe39mXsBL33oLJz9kgTmIR+ta3oAJhZcQAAknuHNI2P48Q1q
         ACQWbD0S39BbMYaTwmYtopfoobzDUKBeKP7HmKDXU7xzXLAseI3IF92VHSNWrE0QFyzs
         LfyY1GVl3JwtzlMUidBef07OpOCyerGAMotTfBplwQXBCbC50O/omNQicEbJW7FepZQB
         lvPg==
X-Forwarded-Encrypted: i=1; AJvYcCXputomd3RzXbalZ9ja70swo0iQOZ2WzFmiW7Xz8vS1sgXI9R5bxPf+oGPSlNdighnd7GH6shIJw4A9p3k5Q9VgRt/YV4Ud4JiPn0sofiXz
X-Gm-Message-State: AOJu0Yx9SuTYj2jiQiOmTZrs5iuUuLwsFgnwSNjs1xwPL/j8xrNHrZOj
	3IqQx3OXU3RUI6B6k+h45U1/YBMJLcR9Ixjl1gRU1qnLfxT/MFJQCH8UG/RuFMY=
X-Google-Smtp-Source: AGHT+IFVbGuLQ9kLYtGQbBJcQAfO3Ny7PuBQS6jGLtBxl1ZSStjATPWV48xKuwi+JBDh4QC6bwbmFQ==
X-Received: by 2002:a05:6a20:f3a7:b0:1b0:278e:34a6 with SMTP id adf61e73a8af0-1b264636f38mr300967637.49.1717020522470;
        Wed, 29 May 2024 15:08:42 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:32f9:8d5b:110a:1952])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fc3552ffsm8482750b3a.80.2024.05.29.15.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 15:08:42 -0700 (PDT)
Date: Wed, 29 May 2024 15:08:39 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 02/16] riscv: add ISA extension parsing for Zimop
Message-ID: <ZlenZ+NvXxOxvqEO@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517145302.971019-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_150844_671157_B51F774E 
X-CRM114-Status: GOOD (  18.28  )
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

On Fri, May 17, 2024 at 04:52:42PM +0200, Cl=E9ment L=E9ger wrote:
> Add parsing for Zimop ISA extension which was ratified in commit
> 58220614a5f of the riscv-isa-manual.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 1f2d2599c655..b1896dade74c 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -80,6 +80,7 @@
>  #define RISCV_ISA_EXT_ZFA		71
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
> +#define RISCV_ISA_EXT_ZIMOP		74

Since my changes for removing xandespmu haven't landed here yet I think
you should keep RISCV_ISA_EXT_XANDESPMU in the diff here and make
RISCV_ISA_EXT_ZIMOP have a key of 75. Palmer can probably resolve the
conflicting keys when these two series are merged.

- Charlie

>  =

>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  =

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 2993318b8ea2..41f8ae22e7a0 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -241,6 +241,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> +	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
>  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> -- =

> 2.43.0
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
