Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF97C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 02:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=95OEUShPouo5Ov2DgPMQL94rrfh1Xo0BDOmL29kVO88=; b=TNCyggeKrVJvJzcZOVQ2u98xZm
	mskTHDjCCMYbbpIHuRDZIicE9gVwJQUhvKcSXSZRYWzsN0+bhfZTauQsKSYvKGZ69djEtglZC34wG
	uHKo+naBX3GlxwF27nO8u5ITccCkS+l5G/QQWi6Yi4FE0Ptq6zgP0JO+GjJP6OqbQGtyD0XC+mz1k
	u7omrreoiJKdLPekXaHnYD1Anq7bNeEmj1RwynCM5PpRADPr7kaEqZhYYD8Vvh6HnC5CLpnjs+tuV
	W6WXubsJVzIdW3leAXcin5OIZddOLby5lWi3zFHjcFM5AGgEHzNbnSMwIipXH8RTaClJ+Nn9g24/Y
	PF2R/WeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFSp-0000000CoDP-1TzS;
	Tue, 20 Feb 2024 02:02:31 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFSm-0000000CoC2-3QYu
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 02:02:30 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e3bdea186cso780606b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 18:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708394545; x=1708999345; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=gGuBNyvpaV2ObDTkL/I2kZTcUQ/VEw4s3L6Fk4TZnkY=;
        b=mbXcT1aM2xaKcKMRNY3crOSTX3RGNXkFzTUdoR4hUmAcFgezdTfwW6JKFYYGaIFL0e
         JmUV+q+uqWTm/1thjcMp4t/vPTzBbxdPNT1ybX0MeYy3/kLVv/3irbqJ0u7pPeexI4Np
         JrlGUMi8JKplPkrqHuIMv8l+S3gOu+lY15dUxhc5/j6uEFulExBXWZs9I4niOOwSXBBm
         erL1XkA0EgD5fte+FphPaMmifzB0iMPzzPuH0zOzLdcwECG7gR7jNJvg2w2BlRe49fdH
         MFhzjQWTge1SD/SzJ2D8UH9rbKVyn3xpkHKhQqxhs5HF01fLGpDHygAT3Opu3Bd6rMfn
         CZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708394545; x=1708999345;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGuBNyvpaV2ObDTkL/I2kZTcUQ/VEw4s3L6Fk4TZnkY=;
        b=QKwOrpsEKZ0VSeEIX54ZTyBR1p1rJoRS4Ei46OGSphaz7G+ziU+P1+72gFALHpw6Ua
         BM9/I0I2iKbPKthXMyZxygKuqlJLp+vOuaSXCFKz/ICHElsUxcvIuom3iXtdImtt69H1
         8DUUrvQzQi+ULkDdRPIgyXYWxHmFBRaZREAlt4R/l30WUqVLfsnh0rsQQs0037U2utZG
         QiV7FlgVGtQ7aU7B/pbbtezx4URQ0/6uccPwvlUYX7RgPbsLZ+YrbP1d9H5tVHujXmBS
         Gn3XemGlKJCG2fxgqBCC9uqvVnS831y2d13BFZUoq0ywl691Nw4FSsX+Mlzlsll7Hi9M
         USgA==
X-Forwarded-Encrypted: i=1; AJvYcCVMNwnEsFRH6S/7UbzMpHVE1vVizVWR7hhi1bnKBz8O6gwvqrd58AZwQZZhhMBPgWGEJQbTwIuSqWwljL8ULbRQ/XCDyhmUmonPndpS29+H
X-Gm-Message-State: AOJu0YyxuqSdc35a3tDQP2SZXklF2fJeH80qaBG4hjmJeXUafEI4mKHW
	29fba/pl/OmrHhDx6yWbsIo4692UITGVC41CfZqyuCjW/3yMHNRcdxRrHY6ePzI=
X-Google-Smtp-Source: AGHT+IF+n0ZLGWj8WZb6XJ83RSBfvZlmkL20FWmLTPsaWPlBrtsNjb413QMtpYGMBguWkAb2CMTxlg==
X-Received: by 2002:a05:6a20:354c:b0:19c:8d73:721e with SMTP id f12-20020a056a20354c00b0019c8d73721emr9670649pze.36.1708394545367;
        Mon, 19 Feb 2024 18:02:25 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a328:9cae:8aed:4821])
        by smtp.gmail.com with ESMTPSA id s8-20020a17090a948800b00299354e8828sm5949155pjo.51.2024.02.19.18.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 18:02:24 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-20-c9fec77673ef@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 20/38] arm64/gcs: Ensure that new threads have a GCS
In-reply-to: <20240203-arm64-gcs-v8-20-c9fec77673ef@kernel.org>
Date: Mon, 19 Feb 2024 23:02:22 -0300
Message-ID: <874je399ld.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_180228_892112_E90BF384 
X-CRM114-Status: GOOD (  24.94  )
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


Mark Brown <broonie@kernel.org> writes:

> When a new thread is created by a thread with GCS enabled the GCS needs
> to be specified along with the regular stack.  clone3() has been
> extended to support this case, allowing userspace to explicitly specify
> the size and location of the GCS.  The specified GCS must have a valid
> GCS token at the top of the stack, as though userspace were pivoting to
> the new GCS.  This will be consumed on use.  At present we do not
> atomically consume the token, this will be addressed in a future
> revision.
>
> Unfortunately plain clone() is not extensible and existing clone3()
> users will not specify a stack so all existing code would be broken if
> we mandated specifying the stack explicitly.  For compatibility with
> these cases and also x86 (which did not initially implement clone3()
> support for shadow stacks) if no GCS is specified we will allocate one
> thread so when a thread is created which has GCS enabled allocate one
  ~~~~~~

This "thread" seems extraneous in the sentence. Remove it?

> for it.  We follow the extensively discussed x86 implementation and
> allocate min(RLIMIT_STACK, 4G).  Since the GCS only stores the call

Isn't it min(RLIMIT_STACK/2, 2G), as seen in gcs_size()? If true, this
size should also be fixed in Documentation/arch/arm64/gcs.rst.

> stack and not any variables this should be more than sufficient for most
> applications.
>
> GCSs allocated via this mechanism then it will be freed when the thread
> exits, those explicitly configured by the user will not.

I'm not sure I parsed this sentence correctly. Is it missing an "If" at
the beginning?

> +unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
> +				     const struct kernel_clone_args *args)
> +{
> +	unsigned long addr, size, gcspr_el0;
> +
> +	/* If the user specified a GCS use it. */
> +	if (args->shadow_stack_size) {
> +		if (!system_supports_gcs())
> +			return (unsigned long)ERR_PTR(-EINVAL);
> +
> +		addr = args->shadow_stack;
> +		size = args->shadow_stack_size;
> +
> +		/*
> +		 * There should be a token, there might be an end of
> +		 * stack marker.
> +		 */
> +		gcspr_el0 = addr + size - (2 * sizeof(u64));
> +		if (!gcs_consume_token(tsk, gcspr_el0)) {

Should this code validate the end of stack marker? Or doesn't it matter
whether the marker is correct or not?

> +			gcspr_el0 += sizeof(u64);
> +			if (!gcs_consume_token(tsk, gcspr_el0))
> +				return (unsigned long)ERR_PTR(-EINVAL);
> +		}
> +
> +		/* Userspace is responsible for unmapping */
> +		tsk->thread.gcspr_el0 = gcspr_el0 + sizeof(u64);
> +	} else {

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
