Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA15C369C2
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T28aF61iejfK8Nc6rRfcAYLUS+E5acJ4t5lozwKWIKw=; b=ex5tCcnGFLG7SO
	ApS9NER7fClAEvoa0seNPBWeWf91XCuRrj9qclsTqsnwEHA+Jm5iC1HDQZb9mANGI6NwhZijdMSJk
	T1nzPtWj53c3GQrshbfj235mDFOXe8oXGdsIyNt8FWMxxgd8ojRTvtp8KRi4cHv4wsMQ63Ao1mWv8
	wdsXOsZK99VKgengdmgUvdmHjo4x8HUtjN+pitjqzfbmTUX9noCkEGzrpUUsXxEmkgvXkfPX8aNLq
	fz7Z6o8IC1nGMprDRtuOGZYv3NBNhjMCksp2U9aSVdu0FdAkclicFurg6OoELFKTQ6u/OkcTlxRVS
	oQZ4/Njd/xs5HtFGkqcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wxn-0000000EFqY-0BjN;
	Thu, 24 Apr 2025 13:50:03 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w99-0000000E731-0PSm
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 12:57:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so780464f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745499461; x=1746104261; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oPQSBVtSMsvYsAl+gZRdiR2fvyhUD5u3wJ4ZqhPNu8A=;
        b=Ppf+BWCDbwCltei5tLeZlJEtKcWqDaFbb17B8VdIqkGO6XzdmKtgXSNQqOtDrXTObJ
         XpPKZs5ZQD1Z6NhbbFjogMhPIXHm5dCPB/hJbaHOCK53CuJmbSTJAa9apMmEfLea9PpF
         75apwmRavbZAEOH3ngI0jYLc8glJjhuyD4IRoGIPVJrtIt19K978fV6coSCxCK/h0PIo
         U4191qW+3iUewNQABE3RuqKzdsLHSBqtg+RMJXe78Qzi3qRiJdkLOeADXF0IljnmFhV2
         ZJkCvBlcire9BPosSDQ/fXcS6XKEWwmq44NuCw7qBhjrW718Sg+gNpPzK4mSYbXBI6OD
         3q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499461; x=1746104261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oPQSBVtSMsvYsAl+gZRdiR2fvyhUD5u3wJ4ZqhPNu8A=;
        b=J9RiTVMmF1oXEWsyJDb8LXi6C034yKWhXnJK3634WwSq3kP6BbfWxeZ4gzqOnyrZu7
         34+jtI5OhobcreYHRaaIgG3vNktEuSi4R8xm3Fjr/LRC4fcR1iB66sTyuzGasosveyvr
         jCjGYbHBqNnecnl5/br7oLFVsx7RpdJB76pClmmWV3PbWd2HhWQVJlKOEl3r+NnYX0+w
         TTZXbCZSrvM1aGxFJ9Ho286wDTu8ufonIJi8hTxtijnDEU5FgsvC3a4Ct/VkLToh8QDw
         AwjP+/ZvM0LWZL6Ye1c39fGugHTcZ4kme3h4ehSstx4hPTpXu8yStjz+KvEnAE8H0hfq
         pVPg==
X-Forwarded-Encrypted: i=1; AJvYcCVoXNxQJXbUyzsG8HaCxePFi7OxnFSnf+8+2CqquPrF8xzpLwLwQ4hrDyFmZa9CAB8h5ymHQYlGrQlrUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNMtvor83AO9ECCL0zLnRrpkYRVQM84xGdspQN7jnIJqdR/djd
	ILzDk/JY2OAIoHikKXBcFePmJd1TR1VZnnsY/XPm54JuuCs3Y0i7fOEcAHT4xG0=
X-Gm-Gg: ASbGncssPtwjdMndYEzNsBiQSKLd235OhZEzzaRtp57+ILOAcdIRvLVUVd/QwhlkfQr
	xIgCnObrZC+I9mwtNSS7N8v7/AXPBr7i/hrq3/EGEyKC2mTjKA8molZLMw6IrgSf5Ec84mhTlXU
	hsrRhQFLU5VPmTi7b9t1hDQ5F+BA+kcaX3M35E7lB62sKrSxHbi9d+dMwuvgpzsuRVmAvZa9qUS
	CtcdMDFSPg21FQmALefHdv44/RwOSloASnjz8xB1d3JOQPJuHBKOhz4eSWjt3HkoSxizivcwKX5
	ex27YQNlp66BysLEyehd+5HP6ZeV
X-Google-Smtp-Source: AGHT+IGWv3/WPoD+1AaHzmJVHKE9pYWAl7MImqfR1l23ycVK/8svQHojX4uoV4n0a06YqpUIKi6wnQ==
X-Received: by 2002:a05:6000:1e48:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-3a06cf5f657mr1695750f8f.25.1745499461227;
        Thu, 24 Apr 2025 05:57:41 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54f019sm2068909f8f.96.2025.04.24.05.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:57:40 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:57:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
Message-ID: <20250424-dc96e54988e25abfc2bb9cf8@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-4-cleger@rivosinc.com>
 <20250424-c85c9d2f189fe4470038b519@orel>
 <67e81f13-5e5e-4630-9a3f-73856b952e6e@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67e81f13-5e5e-4630-9a3f-73856b952e6e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_055743_144669_8CE78B41 
X-CRM114-Status: GOOD (  20.12  )
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

On Thu, Apr 24, 2025 at 02:32:01PM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 24/04/2025 13:00, Andrew Jones wrote:
> > On Thu, Apr 17, 2025 at 02:19:50PM +0200, Cl=E9ment L=E9ger wrote:
> >> This SBI extensions enables supervisor mode to control feature that are
> >> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> >> DTE, etc). Add an interface to set local features for a specific cpu
> >> mask as well as for the online cpu mask.
> >>
> >> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>  arch/riscv/include/asm/sbi.h | 17 +++++++++++
> >>  arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 74 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi=
.h
> >> index 7ec249fea880..c8eab315c80e 100644
> >> --- a/arch/riscv/include/asm/sbi.h
> >> +++ b/arch/riscv/include/asm/sbi.h
> >> @@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpum=
ask *cpu_mask,
> >>  				unsigned long asid);
> >>  long sbi_probe_extension(int ext);
> >>  =

> >> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flag=
s);
> >> +int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
> >> +			       unsigned long value, unsigned long flags);
> > =

> > I'm confused by the naming that includes 'local' and 'cpumask' together
> > and...
> > =

> >> +/**
> >> + * sbi_fwft_local_set() - Set a feature on all online cpus
> >> + * @feature: The feature to be set
> >> + * @value: The feature value to be set
> >> + * @flags: FWFT feature set flags
> >> + *
> >> + * Return: 0 on success, appropriate linux error code otherwise.
> >> + */
> >> +static inline int sbi_fwft_local_set(u32 feature, unsigned long value,
> >> +				     unsigned long flags)
> >> +{
> >> +	return sbi_fwft_local_set_cpumask(cpu_online_mask, feature, value, f=
lags);
> > =

> > ...that something named with just 'local' is applied to all online cpus.
> > I've always considered 'local' functions to only affect the calling cpu.
> =

> Yeah I thought of that as well, local here refers to the fact that this
> function applies for a local feature (as described in the SBI
> documentation) but agreed that it's really missleading. Any idea for a
> better naming ?

I'd drop 'local' from these names and when we deal with global features we
can add 'global' to their function names. If we really must have something
now, then maybe 'per_cpu' instead of 'local'.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
