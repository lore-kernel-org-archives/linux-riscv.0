Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 02:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dXuaYPsrgq4rvuAFUOfqprMktfpt/bSfGNMHJTQql18=; b=NmLChVWhbMSBJK0ODIOzK3jUy/
	6GpX3L4L/HShuwuyqKKs67hE7OGDI3sISljF+1XFktuobEVa9rj2qWdlCFAnildnjBoaknfUTHWrQ
	TgM+490Q/M6B+ayluyvxh4w6eat5yHZRvqIILB2GxqrYVfF9j1l4GmCP8f9IBLRs8xyvi0mI4VQS0
	V9Te8FRACjE3DP8CW3z4RqVRTt8SQhlRC9umsVtoIzv/OdlHwFfNa1dme/mOByCReNczg5Vm81Iiu
	tYIq1VxZLj7rIPtYD1o8YNJsLR3Oa6ow8aoexhykoESwXssAzici8TM1VKc/jnB4a0G2oyvPh2ElI
	TuvgRbeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDFFQ-00DR4t-00;
	Wed, 13 Dec 2023 02:45:20 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDFFN-00DR2S-2W
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 02:45:19 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ceba6c4b8dso5230559b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 18:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702435509; x=1703040309; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ7qwCmvq20mGgi3dRymJGPN14h9pbhwL4VM2txPZCM=;
        b=y03+5Mfk5RsKvNrHLfhQKkxBUcrShcIstR2N133bhtKRTqTZC6AeMyyXVhibNZs28H
         cVeu4JDxun8mxG22t+YUIXm0ZKxQDKJk+eifSS3DhozfbXzlaayVL1Cn1SCZLJN7Hbpr
         ZGiFUd6K9+hRIezgKtzFdJpFOpyt1NfxoLkUqf6+ixH837J7BhYx0ZXE4w3KJ3qECJkd
         35C7A8doacNcPqQIlGGqCehC63yUnU9xCd/u7b2vyHYXfx1MKjbgiMF+tywG7NYQ21au
         s7GEgSYRL/TQpMe+Xj6hFBuDUeiy+sFlleLevRgFVKJSvt0KgTtIK+dh82nq1cxM7J+3
         /0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702435509; x=1703040309;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJ7qwCmvq20mGgi3dRymJGPN14h9pbhwL4VM2txPZCM=;
        b=AZdF7kH1dk+lbGcX8/1k1DaaBqUOcyb9vWjJthXyJRMEvFxB8iaUIL9gxHr1vku9WS
         9oqesiNLkZVpOnGj97c3wcHYnnrLaBH57H/mGU/cd837GJ8gLYhvlV6AXdk5QJOJyRGs
         cofm6lHynslqtBHYhmsbkzq2vPfCTPhKW858ShB9y9E6TVU90PvKbMPSc5JRiNnN5SRS
         zaEsI+gMvYjj47uFuW6+ti0J1l18grf/g8vT28/QJF0s1GHTWzIBOpNilgPVC2spAjKt
         zoXvZfVes+4Mrhc8m4qjpcAKUftydm1uqbV3rZmVR9ISUNOlQ9RvJr5cXsw+beF7GfDs
         GN5w==
X-Gm-Message-State: AOJu0YzXDoC3ZkuDGWThZjRcGWlMddj2MKY1kTz5/sFRE2KY4/v/6IG3
	9bs3X+uGjpEmfs0gd12oyyNhBg==
X-Google-Smtp-Source: AGHT+IGi//6HE3KINOZpirefGAX+e3jIHwZFWzUp/AR1xA1scaFysKSWvBw9/QjFkCNOqGCFGdEidA==
X-Received: by 2002:a05:6a00:c81:b0:6cb:a2f4:8579 with SMTP id a1-20020a056a000c8100b006cba2f48579mr8585102pfv.15.1702435509333;
        Tue, 12 Dec 2023 18:45:09 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:cddd:ffc9:f19e:a4dc])
        by smtp.gmail.com with ESMTPSA id y72-20020a62ce4b000000b006cb7bdbc3besm9528817pfg.17.2023.12.12.18.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 18:45:08 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-37-201c483bd775@kernel.org>
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
Subject: Re: [PATCH v7 37/39] kselftest/arm64: Add a GCS stress test
In-reply-to: <20231122-arm64-gcs-v7-37-201c483bd775@kernel.org>
Date: Tue, 12 Dec 2023 23:45:06 -0300
Message-ID: <87zfyex1l9.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_184517_816130_42A44763 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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


I'm going a bit out-of-order to report a build failure in a test:

Mark Brown <broonie@kernel.org> writes:

> +// Recurse x20 times
> +.macro recurse id

I get an assembler error here:

gcc -nostdlib gcs-stress-thread.S -o /home/thiago.bauermann/src/linux/tools/testing/selftests/arm64/gcs/gcs-stress-thread
gcs-stress-thread.S: Assembler messages:
gcs-stress-thread.S:236: Error: unexpected end of file in macro `recurse' definition
make[2]: *** [Makefile:24: /home/thiago.bauermann/src/linux/tools/testing/selftests/arm64/gcs/gcs-stress-thread] Error 1

This is with gas from Ubuntu 22.04, which ships binutils 2.38.

> +function recurse\id
> +	stp	x29, x30, [sp, #-16]!
> +	mov	x29, sp
> +
> +	cmp	x20, 0
> +	beq	1f
> +	sub	x20, x20, 1
> +	bl	recurse\id
> +
> +1:
> +	ldp	x29, x30, [sp], #16
> +
> +	// Do a syscall immediately prior to returning to try to provoke
> +	// scheduling and migration at a point where coherency issues
> +	// might trigger.
> +	mov	x8, #__NR_getpid
> +	svc	#0
> +
> +	ret
> +endfunction
> +.endmacro
> +
> +// Generate and use two copies so we're changing the GCS contents
> +recurse 1
> +recurse 2

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
