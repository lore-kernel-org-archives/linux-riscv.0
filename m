Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12141E68940
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 00:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WURDl88CkFYCKePH5CK8Qin14bhSvG3uOMxMRJK5L8=; b=YPMIX9fVAzVPTB
	rLEQ4adxc0Vr12WHBPcRvvWovwPZQuTM3AuFmFHNtEmzBuV4i/CkPmY/Nmux2TRqaQtNtc3hSaftk
	aIZSNsB4ecLGeTwAYUVxOCwqE6XXdIGP9rZxjnsx21WsS5bJPdalnEZR5tC0u/kBMBZX3GvNePYwW
	M4BgewO6ae/PmKKj80CH9kZTPS883on22OMrp/TyiWCazml9qLF6odB0b5TfwxZ/3jzOU64Zcu27O
	jW+dMCp7jeNc84V7wz2jngl+tRw4kEio0iQB4UrZSyJSbBKnpVJqMH/wsiWS8I26X17/5fdNl8Yi2
	0sUK6FVHCWZ+l26jgbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6JTY-00000002CgC-37NU;
	Thu, 31 Oct 2024 00:55:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6JTA-00000002Cby-09AE
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 00:55:25 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c8c50fdd9so11195635ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 17:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730336123; x=1730940923; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wBeWV7tV4dhN+Dc0nHSthtw8S0qQfB2LgeDtw0O2Ou4=;
        b=gVCvDK+fMlKZwO9vGz5Cgr7G59OjFliryG2Dw+vwhVMj+C3iKCd5Qw7gf20O0KIwIi
         4YqgmByyPWLgFr50dEHxm1Xa5X1c3QQ6MugqbJiIh6bJeEstIW5H+W+8uwN4DRTBdRPT
         eieuC1KOx2gJaOnCDdccDkINdlfH2sslex2nuOiSYcMAbiMvJqhMK08OOfmpjsOxM4nV
         gvfsKG2y3H2ip8BJgoDWPmoXxRUSLZp4vjQxkLGMOHiWT6uwgXL7A+1ZwM+LHvZ0Rw1a
         5Axx1tlTKqVqGb3qYjGB0n7yJgMhcQBi+DrBYBSjzHzpNkvFks2PtVJWzCTx15IPD6FT
         RK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730336123; x=1730940923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBeWV7tV4dhN+Dc0nHSthtw8S0qQfB2LgeDtw0O2Ou4=;
        b=hlTvpF4Ou5DR5G+wF9tP0owowKnpch0pTBCutZ9Rnugh598TFngrIHMkD1r9BTavkk
         WNyDnyVriY3oeJ4RZh6263P/2eB8tNokSvzdDSEZxd1NSpwMy++qORCSHKVLGUiABmEN
         hUxhOpG4ZlYh3PaRY+wz4PBA9Lgyxg1fWiicIyfmyJjS4ztP5P1SwqISsiLm82DPoYi+
         E183wRx4Okr1jTzIlerGY3MKzRzB+EZVhToak5zRX57ygA7f33MQy9iKcT/xGzEBRrW2
         pULD+x+GaAWohkaAdYTLXL79HvRtK9EoET4k+Ni5Kfmz3+d9+fepXVn+DcK/6+rv2CU5
         mnOw==
X-Forwarded-Encrypted: i=1; AJvYcCXNIKrX/w5HH236QIs/rgZlJt0RSduow7YTuww0AlFiObG1U+JUm5kJyoQSo+KQWMsI/na0Xj5umi09PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmaICh8+yYZH/KELcVkIr28NbVpBPyuYri9MbfGSM51HKWm8AX
	pOyj/l2LWGKLlj0JCY9nfm6A1T1a5Jtcea7N04epydttohv+Qwxr
X-Google-Smtp-Source: AGHT+IFEX+rnRSyrXUDoHNwkx7LfXDM9G0tpm8ZaarJqa9LeRXsBMW4+d9L3dOaT+rDyULyvQszO8Q==
X-Received: by 2002:a05:6a21:99a7:b0:1d2:fad2:a537 with SMTP id adf61e73a8af0-1db95019e92mr1050310637.18.1730336122585;
        Wed, 30 Oct 2024 17:55:22 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5f5bsm261059b3a.55.2024.10.30.17.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 17:55:22 -0700 (PDT)
Date: Thu, 31 Oct 2024 08:54:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Andy Chiu <andybnac@gmail.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: hwprobe: export bfloat16 ISA extension
Message-ID: <prcy6rwydyjz55uaw6rorqbjv64kxu2ibaq2dy3xeno4nzfr6e@akhf6btyc7lc>
References: <20241028071746.869740-1-inochiama@gmail.com>
 <20241028071746.869740-4-inochiama@gmail.com>
 <ca1cb4b8-e206-4bc3-adf3-3801fd05f8e8@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca1cb4b8-e206-4bc3-adf3-3801fd05f8e8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_175524_101638_B27717D6 
X-CRM114-Status: GOOD (  19.69  )
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

On Wed, Oct 30, 2024 at 10:48:47AM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 28/10/2024 08:17, Inochi Amaoto wrote:
> > Export Zfbmin, Zvfbfmin, Zvfbfwma ISA extension through hwprobe.
> > =

> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  Documentation/arch/riscv/hwprobe.rst  | 12 ++++++++++++
> >  arch/riscv/include/uapi/asm/hwprobe.h |  3 +++
> >  2 files changed, 15 insertions(+)
> > =

> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/=
riscv/hwprobe.rst
> > index 85b709257918..8c30dd06f3c0 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -239,6 +239,18 @@ The following keys are defined:
> >         ratified in commit 98918c844281 ("Merge pull request #1217 from
> >         riscv/zawrs") of riscv-isa-manual.
> >  =

> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZFBFMIN`: The Zfbfmin extension is sup=
ported as
> > +       defined in the RISC-V ISA manual starting from commit 4dc23d622=
9de
> > +       ("Added Chapter title to BF16").
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFMIN`: The Zvfbfmin extension is s=
upported as
> > +       defined in the RISC-V ISA manual starting from commit 4dc23d622=
9de
> > +       ("Added Chapter title to BF16").
> > +
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFWMA`: The Zvfbfwma extension is s=
upported as
> > +       defined in the RISC-V ISA manual starting from commit 4dc23d622=
9de
> > +       ("Added Chapter title to BF16").
> > +
> >  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar=
 values to
> >       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key =
was
> >       mistakenly classified as a bitmask rather than a value.
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include=
/uapi/asm/hwprobe.h
> > index 1e153cda57db..95d00a065b4e 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -72,6 +72,9 @@ struct riscv_hwprobe {
> >  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
> >  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
> >  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
> > +#define		RISCV_HWPROBE_EXT_ZFBFMIN	(1ULL << 49)
> > +#define		RISCV_HWPROBE_EXT_ZVFBFMIN	(1ULL << 50)
> > +#define		RISCV_HWPROBE_EXT_ZVFBFWMA	(1ULL << 51)
> =

> Hi Inochi,
> =

> These should be added as well in sys_hwprobe.c (see hwprobe_isa_ext0()).
> =

> Thanks,
> =

> Cl=E9ment
> =


OK, I will add it, thanks for the reminder.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
