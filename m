Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D370C28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MERrByITmu30CTQyCVCOp/o4EtYuoR8VppIVfsWNhOM=; b=hHjjesUM0KL9Ir
	ODXKw6vWV5q9ihqUgrTYGPiCWjcdn0MwxLccW6yK06xVBrch7qLtmhvZch5eJguMT5GrGIZNhPlpA
	9HVIJggy0keZvILYpJVTEeha7/+C61d/dKetOXXAzF/ZsXwspio1CUnplRx7FqE+J5M7/dcZD1UQR
	RKmrAxqRQV8LcTd8rHhOIY2RRTCPAMARzpMjTMLYPIVqcHAMejYRz+vg00uDw6nSaNitEXc1D31+d
	pUPLeyydgn7STrqQkoyNma4Hd48BXHBTtvClMQ+9s+AOPgFSHtdIhv+CqvGeLk/FCXby6rwehIEVA
	Gat0xz9VSXQZbllDEHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3nz-0000000E6Xf-10HB;
	Fri, 14 Mar 2025 12:06:23 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3k2-0000000E5ma-18Bu
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 12:02:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f403edb4eso1136404f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741953737; x=1742558537; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KiKvhRrb/Taq72fdOcKbw7HOX5fTF1yEq4aGHxD5ojg=;
        b=ZXRCxI9QfY417TIZGlq6Fvkmof5cRxIPpRJl1TdJgWZH9eEqZyfd764XKG2mwlhTpf
         srYQKJypUvn4rpZglM0/zFOTTT6s9ev8PtSxCAf8G4yoHvDFjbAL5+Y3QSB3q7X1P1LV
         AKqNQJAOsfNTUPBTRfpNjYGUAcjcZuLyBTK4Ou67KXda+i4yc6cl9sQ1RXRFr3bGGK1Q
         ITAjn8kRMF3LJ2BCgURy/2XHxkMas/NneowSDsYGf+kbdafqOiqaCGD64Hum7IiRalvP
         8/PSIS+21ezaTw8z3Uca+8h/5Vc0T0rs4YVJhehaF80X6B/2s3nU/vzxTxTh13hsoCyX
         HlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741953737; x=1742558537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiKvhRrb/Taq72fdOcKbw7HOX5fTF1yEq4aGHxD5ojg=;
        b=pG7/PtD3gXAfYr1lLZG+9twoQHQYCGT/JGsC1OoNlCL//1b6bf5HtBDzDq9MtbkDjH
         oY94E0OkrSFVuLgr8/rwaGfkP+A1frhvRWT804z3fFROOxIMWniLrNayLbv1p1hiHM8O
         32fk2NiuzTPrk+kFcdh7u9Sl4XEpTgWKVYRa3O2R+wqXOM1+Z/suontXjRbOrt1n2Ob7
         CX+kt5523uslJfxuId/ZPeJvL+S4JLxmAbvAArmVAQMTCIVSPDTWKkqU9ZHLkMhdPcZK
         r134CVKyxiEzIHo0Qr0BcCyg0GUmxg4pkP2QX1MjY9LMybzAJkirANBFbZOG5K9mW6tc
         qG4g==
X-Forwarded-Encrypted: i=1; AJvYcCWeVmINzjRkEEjheFMjsF9n+Eq1CRIYB9dwH3bAF/t7ISPkemeV6LXIXspOs/2sFFpLGHe2L8DE3VeAJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg7uJPD9VtPkV9brRHUOVBhyeqHRLtFZzpkC012aAoTXQLKZfY
	fz2w2aYOev/HK8q5TFr0zeSu7U6Z4yHJk7bNkYWbbRatJTLikvU+YXTgaooqKeQ=
X-Gm-Gg: ASbGncthcVFgR2ZgpuwQY2+KzjJTP/u+t043zTB0yK/8WJp6nUs2mqaMcZx/eJVHvOP
	QVr/5F4RaIN9YHSutvxsv5hLxZNGxIpRxblwYCOQG/lt6jJs0GiSiqn4ZA5W8DKXLF7I2neNR6D
	mDPCqJXL7CT8l0wxr1p43Iop3urgVykYom2qDvjm4gHl5+a14Xt20jh0Nn32/UASZjCznr/th+v
	biMS/KT1BF2nZH1pmEoiiB0IyHjIkr5BwC26FhRPR54t8CeVYaVUHJ0wEbRzgpfcX7cVWXZ7iso
	XqgCg4KM9qPirIj0Btw6D3sV0FIHcgH+
X-Google-Smtp-Source: AGHT+IGDT22UVNAcE40RgfSq2VmR6JimLpd4/ZEJSqqFul3nbrXtD+Up4CuV3WGzrZnYVB9JFFtoWA==
X-Received: by 2002:a05:6000:2ac:b0:390:e853:85bd with SMTP id ffacd0b85a97d-3971ffb22c0mr3063778f8f.48.1741953736471;
        Fri, 14 Mar 2025 05:02:16 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ec14bsm5302335f8f.100.2025.03.14.05.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 05:02:16 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:02:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 02/17] riscv: sbi: add FWFT extension interface
Message-ID: <20250314-10d8d58329aceac21e727ebe@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-3-cleger@rivosinc.com>
 <20250313-5c22df0c08337905367fa125@orel>
 <dad465de-e5da-4ebb-8395-ea9e181a6f57@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dad465de-e5da-4ebb-8395-ea9e181a6f57@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_050218_310282_112E5F3F 
X-CRM114-Status: GOOD (  38.99  )
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

On Fri, Mar 14, 2025 at 12:33:55PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 13/03/2025 13:39, Andrew Jones wrote:
> > On Mon, Mar 10, 2025 at 04:12:09PM +0100, Cl=E9ment L=E9ger wrote:
> >> This SBI extensions enables supervisor mode to control feature that are
> >> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> >> DTE, etc).
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> ---
> >>  arch/riscv/include/asm/sbi.h |  5 ++
> >>  arch/riscv/kernel/sbi.c      | 97 ++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 102 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi=
.h
> >> index bb077d0c912f..fc87c609c11a 100644
> >> --- a/arch/riscv/include/asm/sbi.h
> >> +++ b/arch/riscv/include/asm/sbi.h
> >> @@ -503,6 +503,11 @@ int sbi_remote_hfence_vvma_asid(const struct cpum=
ask *cpu_mask,
> >>  				unsigned long asid);
> >>  long sbi_probe_extension(int ext);
> >>  =

> >> +int sbi_fwft_all_cpus_set(u32 feature, unsigned long value, unsigned =
long flags,
> >> +			  bool revert_on_failure);
> >> +int sbi_fwft_get(u32 feature, unsigned long *value);
> >> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flag=
s);
> >> +
> >>  /* Check if current SBI specification version is 0.1 or not */
> >>  static inline int sbi_spec_is_0_1(void)
> >>  {
> >> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> >> index 1989b8cade1b..256910db1307 100644
> >> --- a/arch/riscv/kernel/sbi.c
> >> +++ b/arch/riscv/kernel/sbi.c
> >> @@ -299,6 +299,103 @@ static int __sbi_rfence_v02(int fid, const struc=
t cpumask *cpu_mask,
> >>  	return 0;
> >>  }
> >>  =

> >> +int sbi_fwft_get(u32 feature, unsigned long *value)
> >> +{
> >> +	return -EOPNOTSUPP;
> >> +}
> >> +
> >> +/**
> >> + * sbi_fwft_set() - Set a feature on all online cpus
> > =

> > copy+paste of description from sbi_fwft_all_cpus_set(). This function
> > only sets the feature on the calling hart.
> > =

> >> + * @feature: The feature to be set
> >> + * @value: The feature value to be set
> >> + * @flags: FWFT feature set flags
> >> + *
> >> + * Return: 0 on success, appropriate linux error code otherwise.
> >> + */
> >> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flag=
s)
> >> +{
> >> +	return -EOPNOTSUPP;
> >> +}
> >> +
> >> +struct fwft_set_req {
> >> +	u32 feature;
> >> +	unsigned long value;
> >> +	unsigned long flags;
> >> +	cpumask_t mask;
> >> +};
> >> +
> >> +static void cpu_sbi_fwft_set(void *arg)
> >> +{
> >> +	struct fwft_set_req *req =3D arg;
> >> +
> >> +	if (sbi_fwft_set(req->feature, req->value, req->flags))
> >> +		cpumask_clear_cpu(smp_processor_id(), &req->mask);
> >> +}
> >> +
> >> +static int sbi_fwft_feature_local_set(u32 feature, unsigned long valu=
e,
> >> +				      unsigned long flags,
> >> +				      bool revert_on_fail)
> >> +{
> >> +	int ret;
> >> +	unsigned long prev_value;
> >> +	cpumask_t tmp;
> >> +	struct fwft_set_req req =3D {
> >> +		.feature =3D feature,
> >> +		.value =3D value,
> >> +		.flags =3D flags,
> >> +	};
> >> +
> >> +	cpumask_copy(&req.mask, cpu_online_mask);
> >> +
> >> +	/* We can not revert if features are locked */
> >> +	if (revert_on_fail && flags & SBI_FWFT_SET_FLAG_LOCK)
> > =

> > Should use () around the flags &. I thought checkpatch complained about
> > that?
> > =

> >> +		return -EINVAL;
> >> +
> >> +	/* Reset value is the same for all cpus, read it once. */
> > =

> > How do we know we're reading the reset value? sbi_fwft_all_cpus_set() m=
ay
> > be called multiple times on the same feature. And harts may have had
> > sbi_fwft_set() called on them independently. I think we should drop the
> > whole prev_value optimization.
> =

> That's actually used for revert_on_failure as well not only the
> optimization.

At least the comment should drop the word 'Reset' and if there's a chance
that not all harts having the same value then we should call get on all
of them. (We'll probably want SBI FWFT functions which operate on
hartmasks eventually.)

> =

> > =

> >> +	ret =3D sbi_fwft_get(feature, &prev_value);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* Feature might already be set to the value we want */
> >> +	if (prev_value =3D=3D value)
> >> +		return 0;
> >> +
> >> +	on_each_cpu_mask(&req.mask, cpu_sbi_fwft_set, &req, 1);
> >> +	if (cpumask_equal(&req.mask, cpu_online_mask))
> >> +		return 0;
> >> +
> >> +	pr_err("Failed to set feature %x for all online cpus, reverting\n",
> >> +	       feature);
> > =

> > nit: I'd let the above line stick out. We have 100 chars.
> > =

> >> +
> >> +	req.value =3D prev_value;
> >> +	cpumask_copy(&tmp, &req.mask);
> >> +	on_each_cpu_mask(&req.mask, cpu_sbi_fwft_set, &req, 1);
> >> +	if (cpumask_equal(&req.mask, &tmp))
> >> +		return 0;
> > =

> > I'm not sure we want the revert_on_fail support either. What happens wh=
en
> > the revert fails and we return -EINVAL below? Also returning zero when
> > revert succeeds means the caller won't know if we successfully set what
> > we wanted or just successfully reverted.
> =

> So that might actually be needed for features that needs to be enabled
> on all hart or not enabled at all. If we fail to enable all of them,
> them the hart will be in some non coherent state between the harts.
> The returned error code though is wrong and I'm not sure we would have a
> way to gracefully handle revertion failure (except maybe panicking ?).

How about offlining all harts which don't have the desired state, along
with complaining loudly to the boot log.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
