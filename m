Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B673C48BF8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 02:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hh6kqFWX18FnsOIM3sdgrd7w19Fb2tyFju3eagA43zo=; b=e6An43KlTXa1DfNVC6XqowGxiT
	No2kc1TRsQP7JyraUQwfpMjO5PczC60wL+OgrGqZQ0y9QADUkg2OlDoIJhjaNBnnby46zVP6BMCOT
	bRGctehbCi6HJvrOWOOwI9w7Xkifw5pKW2R/5wpi9lDR21t+ItEvu1g1uF+5truAo8VKvd2wnwv22
	MJ+3KbDs1E4VP1nvcfk4uYTuB79x7bJlaXijvYu4m6LMjvcl9PiXG2uSP78FDuNKtzdGzP2Du4PIz
	orD+i86MCqL2CXAYM4ESxNhCw6/hfcO31eg4lA0507AfH1wSXskkzc4rnWz5KKod/FyyHmhW/qls0
	PbozgvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFUD-0000000Coeq-0ZPT;
	Tue, 20 Feb 2024 02:03:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFU9-0000000Cobg-17Q8
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 02:03:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d746856d85so29223525ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 18:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708394628; x=1708999428; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Ut8HYrvCDFac0esrbFqk2cfgA544kkLlPQaAT6Wttz0=;
        b=NWEwhQ3FvDMPLc85NvnZXGvUBDVxFEvbD2O0331iNnqDQqEM0kPEjw1J6aZQpa78pa
         fGkcgfnnkpF2AbJt/3KqwrtN2pighKuOCTlD83W2YQtxdnR4S5VnDEFUEj2F/iqqkF3q
         RLVvgArnNTIVpez6ScG8Md0LeYN2ZySLpjmj+IoT1Nflaa35dIvIU5T4czQ9UoUhUfmc
         m1AWJMXfHezCwf8CgpjoqfZ77IkN9opE8I12q+bcj/Siyxc2rq9KwF7e/wfF6Uv78Wa9
         iU3QTz+OezEr1KKZK0dsnE79mRnIeBio/YulErXeax5MnGYQPLaufqQy4f+pm5M+jIcs
         utsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708394628; x=1708999428;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ut8HYrvCDFac0esrbFqk2cfgA544kkLlPQaAT6Wttz0=;
        b=qEwtjnhT0MIanXqxq7dE4fTOv0NuhRlXd65y5akclHeGF/YwgsHzU3D2vNCQow0DiT
         hICLRC5OPdZxkLz6JsKzdM6vp1ANxO3ZtnupX17Z41ND98MByNkoo9qfTFs9fF1s2EGS
         aWB52HlxpZpCVn1jEXHSJMKrqzeM+9s/Z+aqbHtFy3BGvyT12/sq43Ol4HxqknSRd7Vi
         y7uUhLeYADOXn79y2lbq/DO3oOHyBRxqXNIOzTIcSzfk7LCLvMMf3S0PPy5ZrU2GPRCN
         XBLO4+9mHAjlFGphjeGg3DT971KOkZ4xmwbJRsx1JjOWfKaWGVB9N8TQw0lzY0N9OWEv
         wO/w==
X-Forwarded-Encrypted: i=1; AJvYcCWX3KazsIkasxA1spJEVDvQh/m0BIEH7FS93ZR+KcL1qUhOS2DTknlVgMRSy/V2HmnMMgYP04MiTFLvrRmnUPvch641iM+/cfDz0qZJgbBv
X-Gm-Message-State: AOJu0Yzr8siOYpFLQMiZJn/6q28OCazxv2adJhWMgSmDwZvvwb1nFYqw
	4HIuQAaYwYrPDNkWR8JcHMzb0rSp3VX6JyA9xTjCkQKraXT5p4m5mFKQ/Kq1KZs=
X-Google-Smtp-Source: AGHT+IGPIHUy8hPqScHiSoGgxRjrCJE9JJnAWETOMrecbYtciaMsbgwu6AZ9cPzFGRlUwvHmQwNF1w==
X-Received: by 2002:a17:902:e5c3:b0:1db:fcc8:7d96 with SMTP id u3-20020a170902e5c300b001dbfcc87d96mr4258933plf.14.1708394628501;
        Mon, 19 Feb 2024 18:03:48 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a328:9cae:8aed:4821])
        by smtp.gmail.com with ESMTPSA id kg3-20020a170903060300b001dbbd4ee1f6sm5058425plb.11.2024.02.19.18.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 18:03:48 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-23-c9fec77673ef@kernel.org>
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
Subject: Re: [PATCH v8 23/38] arm64/signal: Set up and restore the GCS
 context for signal handlers
In-reply-to: <20240203-arm64-gcs-v8-23-c9fec77673ef@kernel.org>
Date: Mon, 19 Feb 2024 23:03:46 -0300
Message-ID: <87zfvv7uyl.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_180353_334296_A63899B2 
X-CRM114-Status: GOOD (  14.56  )
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

> +#ifdef CONFIG_ARM64_GCS
> +static int gcs_restore_signal(void)
> +{
> +	u64 gcspr_el0, cap;
> +	int ret;
> +
> +	if (!system_supports_gcs())
> +		return 0;
> +
> +	if (!(current->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))
> +		return 0;
> +
> +	gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
> +
> +	/*
> +	 * GCSPR_EL0 should be pointing at a capped GCS, read the cap...
> +	 */
> +	gcsb_dsync();
> +	ret = copy_from_user(&cap, (__user void*)gcspr_el0, sizeof(cap));
> +	if (ret)
> +		return -EFAULT;
> +
> +	/*
> +	 * ...then check that the cap is the actual GCS before
> +	 * restoring it.
> +	 */
> +	if (!gcs_signal_cap_valid(gcspr_el0, cap))
> +		return -EINVAL;
> +
> +	/* Invalidate the token to prevent reuse */
> +	put_user_gcs(0, (__user void*)gcspr_el0, &ret);
> +	if (ret != 0)
> +		return -EFAULT;

You had mentioned that "ideally we'd be doing a compare and exchange
here to substitute in a zero". Is a compare and exchange not necessary
anymore, or is it just being left for later? In the latter case, a TODO
or FIXME comment mentioning it would be useful here.

> +
> +	current->thread.gcspr_el0 = gcspr_el0 + sizeof(cap);
> +	write_sysreg_s(current->thread.gcspr_el0, SYS_GCSPR_EL0);
> +
> +	return 0;
> +}

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
