Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CC8C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 22:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqzISvg71hRv29tlNl123M8BmHer5NksNDfB8y6j1f4=; b=P7IxKKG+H9EnZt
	R3FAAzggSfv3aphyQ3kGRElVv7TgAtcZ03O4la1RiJDjksnhdJk/bnXaUV59KdoRfQpoP79eYq+Gl
	o25iWsKc6VGdj9qfHKebl8jTT82L59/kjqT/jWeMYC6Jce0Pc4Q5i8Iqf8PRmZ/KBksywclZfclJF
	H4gcLfZSbbOvXJUY/skhKANY5YqH52kLHyi06GyjlxesA8pSK573FIh45WYzcdGW+QntLVpwKasX/
	RvRaB01/x7ejdgK+KhP3DeZA35haSQ6s43n5mz4lfjcOkEV/fXRtQFVjTMR/OK05SKX1tn7iMGULt
	nkR4rfoVyQ0gFUA4c5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRfX-00000005i77-3gUC;
	Wed, 29 May 2024 22:21:15 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRfV-00000005i6U-25R3
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 22:21:14 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6f8ecafd28cso241747b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 15:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717021272; x=1717626072; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+33JepHINIVhbAh8qOzaJpAIf0uqs6BRQtkDENj6cbg=;
        b=lhKjctUtLsxb+kJeWL5Jn5sbjoZ3JdGrBL5b2gGZslK4AXtQWylwOfL3NTDHgagLUn
         9ld8890LjyaYq2JH03M5WeCpaX3zRO1/zGtygeQpuy65X2VmOhFOCM7mZV4a9THETqek
         18ys+lNQrRbhVLgQ3AX4wIyYnkl+ZnVURq5Tv2zrx5zNmjDcTsprRQ6+Gi6pcPqTzL1r
         n5XYU/EVZVm5k33uQ5lD1+5u9+ec2EYM8F9orZ+3j78x44eMLl4fL6i2zpqGXUuXNvs7
         NZRV+N9qq4t93nJtc0kN8ehU8SF/ldVUY1iXblZTrdsI1En61PvEIGvzm+WqJh4OLVTu
         OR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021272; x=1717626072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+33JepHINIVhbAh8qOzaJpAIf0uqs6BRQtkDENj6cbg=;
        b=S//KPLbpxvxCKCmB/qCxKKto1sPn8ciMHr+n+BX7IjIuZ31k5uc/lZXH0F9QH5rkBJ
         pzV0JKhz6LT6pV7+f8MgqaEua/O9qhOC4c7Z7IRpdMOiUYWVHM/R83mDohVkqTRNW+46
         1BDnxLMlamtq28HOqlu1t3NY4zbGllF31ktCJZOPKzGTuqobEaOpnclxt+4W5Cek3b+C
         mP4rdyvbyfgz23zpvOQJqHZGe9BWV5vP7xM3Rillz/IOmP2SNMtGbnYp7jbMlMk/2rZc
         KMQpa2Z2DWUB4mtDRujwFKopR0IVlpBENdJUjc+g5LlemIyDV9XQ7VCPOy1uF6wBm7/C
         71fg==
X-Forwarded-Encrypted: i=1; AJvYcCUTWndI/dCN6wbvD233D7ViUvM7M4hmddEOt90xgIUYjdthhsT10kLO1bDXMaoX08wO5FMsxzJpwfM05bJbDC5+tByzRQYXBWXsNSMy/35s
X-Gm-Message-State: AOJu0Yz9xxUWlG9k41XuTech3BeroUGvFsXNGsiQdu3Xt7ctLB15J/Y3
	9S4UJEacghFDRZNbLQbdDU8Bt34EgMRDgjhVFSax8gBa+n76+SbBrJBKrTeY6nU=
X-Google-Smtp-Source: AGHT+IGI+L6uEPqPqWpCYsDTU2d/epzJLqI8Fa4/v+SZQaArW3EwTo3rCZNunG+pitvTJAace7dG0A==
X-Received: by 2002:a05:6a20:5651:b0:1b1:e35f:3eeb with SMTP id adf61e73a8af0-1b26460d454mr361563637.46.1717021272535;
        Wed, 29 May 2024 15:21:12 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:32f9:8d5b:110a:1952])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7022ca54847sm533889b3a.183.2024.05.29.15.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 15:21:11 -0700 (PDT)
Date: Wed, 29 May 2024 15:21:09 -0700
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
Message-ID: <ZleqVUhDW+xgiTwu@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-3-cleger@rivosinc.com>
 <ZlenZ+NvXxOxvqEO@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlenZ+NvXxOxvqEO@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_152113_571844_C3A9E700 
X-CRM114-Status: GOOD (  22.04  )
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

On Wed, May 29, 2024 at 03:08:39PM -0700, Charlie Jenkins wrote:
> On Fri, May 17, 2024 at 04:52:42PM +0200, Cl=E9ment L=E9ger wrote:
> > Add parsing for Zimop ISA extension which was ratified in commit
> > 58220614a5f of the riscv-isa-manual.
> > =

> > Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 1 +
> >  arch/riscv/kernel/cpufeature.c | 1 +
> >  2 files changed, 2 insertions(+)
> > =

> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index 1f2d2599c655..b1896dade74c 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -80,6 +80,7 @@
> >  #define RISCV_ISA_EXT_ZFA		71
> >  #define RISCV_ISA_EXT_ZTSO		72
> >  #define RISCV_ISA_EXT_ZACAS		73
> > +#define RISCV_ISA_EXT_ZIMOP		74
> =

> Since my changes for removing xandespmu haven't landed here yet I think
> you should keep RISCV_ISA_EXT_XANDESPMU in the diff here and make
> RISCV_ISA_EXT_ZIMOP have a key of 75. Palmer can probably resolve the
> conflicting keys when these two series are merged.
> =

> - Charlie

I missed that other patches in this series were based off my
xtheadvector changes. It's not in the cover letter that there is a
dependency though. What do you need from that series for this series to
work?

- Charlie

> =

> >  =

> >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >  =

> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 2993318b8ea2..41f8ae22e7a0 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -241,6 +241,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >  	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
> >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> > +	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
> >  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> >  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> >  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> > -- =

> > 2.43.0
> > =

> > =

> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
