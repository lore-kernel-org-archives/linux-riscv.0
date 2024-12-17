Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD26AE77183
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 00:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5Ym3sf72OpduEgESI9dCvT/0kUrcHx7rbQW2y24NYQ=; b=MZi6+cDrWBMMuv
	5fY/pu/341daBwCtucI88s4h5INJSjQnlhTNTc37eh0kul+assHVQB41zyPEA8n/DhGlasAHbfQef
	NolGu4QM5V8eB11OOMvJhpYMYXXdmw4KEQ+1gc3Bhfm4BPt+WGcZ6gz00ir6lrC4NlBRZ7h+hc5yD
	t4dFdWzV+JaOah571FV7tZNbJv4sGOIrgPqTggmM2+qPoBf6VG7QZhQXcFYC27LYjufQnqmdJgdoU
	AKNWAbRDRnbJwgofb6Z9BOMPpCLRQDHqg0LLLyPFmOxVZjC4SaIicUP8BDjltJZsxwh83FC+qTBsi
	PtyRtMlJWf2YNf8C3TdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLpJ-0000000Bo5q-0J6R;
	Tue, 17 Dec 2024 00:52:41 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNLdw-0000000BkvH-1R6j
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 00:40:58 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6d8fd060e27so40349636d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 16:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734396055; x=1735000855; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0/Cbl6nhU596TlRfXtw+zhpPruCALp8m+NWfU1RZMcs=;
        b=eskrH9bQ+C9+Ryf11by5d1VJpYXm0E2rF/7xUq9UnVON1rOrf+f7pBfjP20CzYlLFF
         4HTf5EJap1z08j8XHJV8RL5411v/6KYId2TPAIHaAgNTothdeyIoSKM0pzfdUWEsDUb+
         Z1+OskM6Ux59v9zyndyAxOYkfK+y5jNyynBHiudcWPp64JCD+bASUeJkIkirPrP4EaRR
         Mr3+1FpQTldBPOho+K6S5n+sCQZSwQRa6dM6iUtB+PFsa15JpnebI2ewijisxoKHVdf5
         8fsgTjuQM5pDIQnyyIXx2nCXN3YKbkveTlEagDsj1dd/GemCSsgBTy2vkRLoSIa+2h9D
         2Zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396055; x=1735000855;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/Cbl6nhU596TlRfXtw+zhpPruCALp8m+NWfU1RZMcs=;
        b=gcv8KxTCtBT4mp99Kmns1FeH2u4IliDHBobWRnPbnu0WX+anl8XfmNeRoQjZ1+arUH
         fsPnJ54a0hft74hGv++XYYJjna5arKxCgaEcqJ4wUOwE+/1Ft6DCa8UE/9QxXUKXwa1b
         mZdGi/6dKfAt/CvdwF+EJW0txV1lAKoGvCncnOxeDWucpRUG0+7Mk/9QzmyCcSm5IfNV
         vfgFUOeok59gOT9cL8AvqjlfH/fCkFPYMiaIahsr0FwrVi9bGSwyMveMWN4y11nIH8Pf
         FiOo3DyekhhIMB8mR7BbYVDuGzwYgRvYhFs+p7EIK+/nau09xxoiov/UQhNzMq+7XKsy
         cQDg==
X-Forwarded-Encrypted: i=1; AJvYcCW2WTuMPa4JTdyGjEliBeddD5ZcRUHN74IuO6NSjNOm6IlPM5zox52v6K/7aBt29NcjhaYKK7Wqpx733A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEs3l0ZfBi0c/a39kob6lBCou91M9HEmUbiqqIbx9ZsqUDCHXe
	I1XGZkIgpnVSgJK5+uUed43QK6ahDAEaDPuQUh0FkGHt7lGXIw5W
X-Gm-Gg: ASbGnctPokEld46kAYgWKF17fHvl7yWrSNK3l5cUmbuby74zs46J/H/Oui8dQtu1Aer
	6wlGBiBtNNbqSEDbhHCLgvnXPTkGKg9HzBPmB5q9KxxEwKhVXjfd6VdrMTHOBg41fMjQwNy1P99
	kQemmxdwSWY4qK7+ae6r3A+2cB852sfdoRxdwFEMS2YccItVsu4m9D/0D37sW5crfydlnn4S56T
	m/2Rb/oqs7GIoKdfey0r1bGmknXrxZi
X-Google-Smtp-Source: AGHT+IFjlHavhWPup7PYJT9N7NM8bEbqLWCujII2gri7ZdjsWeFP1Oce1YQLQy+5HsbVwzgWEwWqJg==
X-Received: by 2002:a05:6214:2123:b0:6d8:a1fe:7293 with SMTP id 6a1803df08f44-6dc9686b652mr266239766d6.42.1734396054914;
        Mon, 16 Dec 2024 16:40:54 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd257215sm33097316d6.41.2024.12.16.16.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:54 -0800 (PST)
Date: Tue, 17 Dec 2024 08:40:37 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@gmail.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: hwprobe: export bfloat16 ISA extension
Message-ID: <sh3fu66fltjccbygbdxilbos4bi5wqk2cdiihc6ixnodsbxtox@rezkyqnpp5yv>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-4-inochiama@gmail.com>
 <tencent_8F35B6F07D09566A873982E0E2C76085280A@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_8F35B6F07D09566A873982E0E2C76085280A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_164056_433043_35919E9C 
X-CRM114-Status: GOOD (  20.66  )
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

On Tue, Dec 17, 2024 at 12:00:23AM +0800, Yangyu Chen wrote:
> Possible conflict with: https://lore.kernel.org/linux-riscv/20241111-v5_u=
ser_cfi_series-v8-22-dce14aa30207@rivosinc.com/
> =


Yeah, I know the conflict. As the time of merging these patch is
uncertain, what I can do now is to match the upstream code.

Regards,
Inochi

> On 12/6/24 13:58, Inochi Amaoto wrote:
> > Export Zfbmin, Zvfbfmin, Zvfbfwma ISA extension through hwprobe.
> > =

> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> > ---
> >   Documentation/arch/riscv/hwprobe.rst  | 12 ++++++++++++
> >   arch/riscv/include/uapi/asm/hwprobe.h |  3 +++
> >   arch/riscv/kernel/sys_hwprobe.c       |  3 +++
> >   3 files changed, 18 insertions(+)
> > =

> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/=
riscv/hwprobe.rst
> > index 955fbcd19ce9..a9cb40e407a4 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -242,6 +242,18 @@ The following keys are defined:
> >     * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supporte=
d as
> >          defined in version 1.0 of the RISC-V Pointer Masking extension=
s.
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
> >   * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns simila=
r values to
> >        :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key=
 was
> >        mistakenly classified as a bitmask rather than a value.
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include=
/uapi/asm/hwprobe.h
> > index 3af142b99f77..aecc1c800d54 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -73,6 +73,9 @@ struct riscv_hwprobe {
> >   #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
> >   #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
> >   #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
> > +#define		RISCV_HWPROBE_EXT_ZFBFMIN	(1ULL << 50)
> > +#define		RISCV_HWPROBE_EXT_ZVFBFMIN	(1ULL << 51)
> > +#define		RISCV_HWPROBE_EXT_ZVFBFWMA	(1ULL << 52)
> >   #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> >   #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> >   #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index cb93adfffc48..bd215f58bd1b 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -131,6 +131,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
> >   			EXT_KEY(ZVE64D);
> >   			EXT_KEY(ZVE64F);
> >   			EXT_KEY(ZVE64X);
> > +			EXT_KEY(ZVFBFMIN);
> > +			EXT_KEY(ZVFBFWMA);
> >   			EXT_KEY(ZVFH);
> >   			EXT_KEY(ZVFHMIN);
> >   			EXT_KEY(ZVKB);
> > @@ -147,6 +149,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
> >   			EXT_KEY(ZCD);
> >   			EXT_KEY(ZCF);
> >   			EXT_KEY(ZFA);
> > +			EXT_KEY(ZFBFMIN);
> >   			EXT_KEY(ZFH);
> >   			EXT_KEY(ZFHMIN);
> >   		}
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
