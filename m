Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FBDC27C44
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lVY/AFF2V3uMpHJ1HdC0SDzJPH3ef0U2aS9i9/uSCQ=; b=O4Y5oKaouFc3/1
	8XtVKQ3J2DCalr2aVyz3JwihbALUd6wmPev4/xzdHZ/XO+d1aV49jmqwVJ3DpIL7ndGOyBWDhIcNS
	GNgX7Tl+IdSJw13pHzlBtAsKLs3txwePo8GD6lIHkBK8fPUKMSFoijwd/+URnkNRVabOVvtb+zYKH
	uZxZyHQtrK7xDq0CJ0l8+mvpNnLvL9hQbUQvhoP8B3/fP/1MgEjouIuZNEqOShEk3IC9Ym6Xa3eWC
	FPoTuVS81ZByjP5FRhVusAA0a1QDMFYevkCAXQMU4HhnikAdGNbcsaaAHfspvizA4qppcyWGvyhR2
	sK3mTDMgUEmLLhaNZ8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCgue-00000007ZI4-0973;
	Thu, 30 May 2024 14:37:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCguZ-00000007ZEi-1AwI
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 14:37:49 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f44b4404dfso8815285ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717079860; x=1717684660; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dr7MGcIZCht+4Sl3Mt64k5vSbdLUfxkiP98jMWV/Dt8=;
        b=3FOKK9oTblAPC7rw+1VG6KUUMFwn9ASdEAKeR3sw/GQATytDMi+aFwPrRIqqvnYMkZ
         LsVsCI4VLuGqGXdgxUT04HWfEMoTAIkDDco9GgpgB2nwZUQk6ysaCzEUnBQHHSHbZIyh
         K1x+DNTkW1Ys6VJyabd43CtVBv2s/TtsFjXRKBezyHW58h2IvEH8MaHQj9DBi6OO3qw0
         6/HanAxKVS+bZIbdKahCy9YKhXSAGPibIuAL5FOFcNxHOZbvbX3UWP42TKANv6vdFmZH
         BPs3Or1UEQX6xp/Ly9walfsIcHn9nYVKZ+E67dBNfXAMCZ+b2krwZQpDMVrATLeBQC/+
         lNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079860; x=1717684660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dr7MGcIZCht+4Sl3Mt64k5vSbdLUfxkiP98jMWV/Dt8=;
        b=gXpOavFT2ht549+wSVZwzqXdtn19+Cgx8QGTBU0x6JCWJKVv0/9mQwTghwktSam9cG
         51nydkxEGEJQ0iaK9Pu0Sy1WVxAy9n/TxTF192PRYUCjt01Jlz/3WphCvI1mRz5x7qIg
         w649nHhScNc84A9+Cq4kC0yAEJtG+OUZ0sOYJ1AgDYhO7Fb8vm3xAuaa7NVHeIJxqLrZ
         P9+GT1xRMBG3fHP0G7HKSkJtfaEFn13LJpjQFV9usGuNDhIGjq4VdzUkZu2c847/ntr6
         RWkCx9TX4IP41Bcsoaoxksm4kRe55lwA7Wzh8YEMA/RQLl0HcC1gXE63Lj3To0lqxdFH
         MU7w==
X-Forwarded-Encrypted: i=1; AJvYcCXR9JPAs2kzHDWLYw3iqg0LVCyU5zdbJjtabPINGjWe4mb5BNPr207mT3sucHfCFcYhMzvu6a2CufZgzyqDSsTsNeYvPXmNqViv5wZMh6Pt
X-Gm-Message-State: AOJu0YxwIBg5ZL42/9PkqvFQ2n21vSxHoQLR88lCTBmDqt/UGtTEXlLV
	BlV/V3OJtlgOXFltUaIkf2afE2XmTM9dAi8X3rysUeFh9gMuTFLGZ1kIJucLZwk=
X-Google-Smtp-Source: AGHT+IG+P79rec/1kndzK6QyUvlapORFmbEhzvdcFqf7CsaBcI6jLUT7w4JzgE6GE/lZheH1bs1ucw==
X-Received: by 2002:a17:903:2307:b0:1f4:98f4:4763 with SMTP id d9443c01a7336-1f619932a97mr28337145ad.53.1717079860232;
        Thu, 30 May 2024 07:37:40 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f466d30277sm103103765ad.63.2024.05.30.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 07:37:39 -0700 (PDT)
Date: Thu, 30 May 2024 07:37:35 -0700
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
Message-ID: <ZliPL4yXBAir5pr2@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-3-cleger@rivosinc.com>
 <ZlenZ+NvXxOxvqEO@ghost>
 <ZleqVUhDW+xgiTwu@ghost>
 <4d23f17e-cc1e-45e3-9ca2-a884baacf207@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d23f17e-cc1e-45e3-9ca2-a884baacf207@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_073747_856793_096F26FB 
X-CRM114-Status: GOOD (  25.38  )
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

On Thu, May 30, 2024 at 10:12:39AM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 30/05/2024 00:21, Charlie Jenkins wrote:
> > On Wed, May 29, 2024 at 03:08:39PM -0700, Charlie Jenkins wrote:
> >> On Fri, May 17, 2024 at 04:52:42PM +0200, Cl=E9ment L=E9ger wrote:
> >>> Add parsing for Zimop ISA extension which was ratified in commit
> >>> 58220614a5f of the riscv-isa-manual.
> >>>
> >>> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >>> ---
> >>>  arch/riscv/include/asm/hwcap.h | 1 +
> >>>  arch/riscv/kernel/cpufeature.c | 1 +
> >>>  2 files changed, 2 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/=
hwcap.h
> >>> index 1f2d2599c655..b1896dade74c 100644
> >>> --- a/arch/riscv/include/asm/hwcap.h
> >>> +++ b/arch/riscv/include/asm/hwcap.h
> >>> @@ -80,6 +80,7 @@
> >>>  #define RISCV_ISA_EXT_ZFA		71
> >>>  #define RISCV_ISA_EXT_ZTSO		72
> >>>  #define RISCV_ISA_EXT_ZACAS		73
> >>> +#define RISCV_ISA_EXT_ZIMOP		74
> >>
> >> Since my changes for removing xandespmu haven't landed here yet I think
> >> you should keep RISCV_ISA_EXT_XANDESPMU in the diff here and make
> >> RISCV_ISA_EXT_ZIMOP have a key of 75. Palmer can probably resolve the
> >> conflicting keys when these two series are merged.
> >>
> >> - Charlie
> > =

> > I missed that other patches in this series were based off my
> > xtheadvector changes. It's not in the cover letter that there is a
> > dependency though. What do you need from that series for this series to
> > work?
> =

> Hey Charlie, I'm not based directly on any of your series, but on
> riscv/for-next which probably already contains your patches.
> =

> Cl=E9ment

There was some churn here so I didn't expect those to be merged, it
looks like a subset of the patches were added to riscv/for-next, sorry
for the confusion!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> =

> > =

> > - Charlie
> > =

> >>
> >>>  =

> >>>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >>>  =

> >>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> >>> index 2993318b8ea2..41f8ae22e7a0 100644
> >>> --- a/arch/riscv/kernel/cpufeature.c
> >>> +++ b/arch/riscv/kernel/cpufeature.c
> >>> @@ -241,6 +241,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> >>>  	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
> >>>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >>>  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> >>> +	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
> >>>  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> >>>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> >>>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> >>> -- =

> >>> 2.43.0
> >>>
> >>>
> >>> _______________________________________________
> >>> linux-riscv mailing list
> >>> linux-riscv@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
