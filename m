Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFDFC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 04:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uMe5PJ0Z30l0AwZL/fesiYIRrAlGpi7AqBe7I7YyHVo=; b=V+VAkGltXJLXw3ic3bN94z2piM
	VVgCOA3GJWwqHCrEOJYT4/MydedvZ3UGH5FQD/LmNyXrRB3FV5OpHQAB6isdToLR9zy4DTMCAmFqF
	qiPHk4Cszwwlw5HFb5QTyt5VeF3O8EMFL+cvYFG9yL4oV4d+Ycsi04+KzMXvl4jigvPlMIc6LWssM
	6S1/a77lG9bRvbQ0PXBnt1phDepQUU6BwO/bFtssXwLr622mRlS1XbUpGBw9k67ZsaviKVyiLF7py
	HiImKWYWdT7Lyyy8XvswkFk3BAsFKLPzHKbtHGRILbtZ7ydPpbd9L3G+Y7RZX7UJuqkLhBGiAbc4/
	ra5UDUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFnxs-00G6Zg-2E;
	Wed, 20 Dec 2023 04:13:48 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFnxp-00G6Ym-2j
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 04:13:47 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d045097b4cso22827525ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 20:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703045623; x=1703650423; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=mNVWdMSAqfvpbN5g4IovRqwuhzgdiEbCZgrhc7x2wjc=;
        b=GLxVO+Tx+LMsu5B+VV0uJq+WmEq7LmHWaG/pUjSGC4AoOVh3yPZAFhSmtbCm6Sm8e1
         L8Y5sngWr1hDfDW80rAjkXS3PCaENG05utcRTtMw9W7xAY+bAJhqucd2GbaV9zxwnoJq
         SEhXm5ukGWNop7bMEJp2QrRH1buGHM5nY0hiTjxEcZxlc33KZFPnq2zwkXSIRx9y83QK
         ht774XpDRHIDvwUYwmqbFivj1dsTMBaFDLjvOq1Dt3qn0PvjbBzOlIOaBc5q2Hyp12FN
         8xv9YGNd7uhm9bXzLh4eFTtuhLIO1G5GZYS3nIDpz4Bj+IpC6yGnt+xK+QWU8x+v8YFB
         bO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703045623; x=1703650423;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNVWdMSAqfvpbN5g4IovRqwuhzgdiEbCZgrhc7x2wjc=;
        b=GnMU2hqj2e+1/fuGiWTol80e6OSes8sdNEx5WauGIBGvh+3VCsXsn8RmrQgc++1gLm
         4Sb+KaE32/yrZpEnbAqiIHwntUUsiVCxBemCWDZ1eX7HVGz7AOPu+4k/EEl/Led7s58B
         MOQU6Xzw9tDh1yFRfat4rtSiwC3Y7bG0ZrdG46CmeqQygkiU0NsSgXEfihpplLegGheh
         s/mwwXMhnVPvhoi1JemxuscR/+ezWHYpQLAcIh53QdMXkLYnSjM9iORRWvBuYUtxAXcP
         tkWt41hy8GoPta9AfxaB3yxxn+L6o1gdWhqRYMJyww9I9uH6hWQibzaYL3ZrxyOzLV1j
         ZSyg==
X-Gm-Message-State: AOJu0YySf2Wi+jqaMgYlZ/GC0Yi88mJF+rzPPDlFIm0ahj6lfjR0gNWR
	qBy9AsF2rqIgwRY3wzHYn2uqJQ==
X-Google-Smtp-Source: AGHT+IGTH7Uz/NcmceVfotUGElTRFy6BFXANyvxa2H36ukICplsk22hKc23OStWdWx3+9daWWuC7hQ==
X-Received: by 2002:a17:903:22c1:b0:1d3:c025:c99e with SMTP id y1-20020a17090322c100b001d3c025c99emr2935918plg.63.1703045623531;
        Tue, 19 Dec 2023 20:13:43 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:8f60:ee5a:d698:1116])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902dace00b001d08e08003esm21884208plx.174.2023.12.19.20.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 20:13:42 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
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
Subject: Re: [PATCH v7 00/39] arm64/gcs: Provide support for GCS in userspace
In-reply-to: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
Date: Wed, 20 Dec 2023 01:13:41 -0300
Message-ID: <874jgdh5oq.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_201345_922632_CFAF0603 
X-CRM114-Status: GOOD (  12.43  )
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

>       arm64/mm: Restructure arch_validate_flags() for extensibility
>       prctl: arch-agnostic prctl for shadow stack
>       mman: Add map_shadow_stack() flags
>       arm64: Document boot requirements for Guarded Control Stacks
>       arm64/gcs: Document the ABI for Guarded Control Stacks
>       arm64/sysreg: Add new system registers for GCS
>       arm64/sysreg: Add definitions for architected GCS caps
>       arm64/gcs: Add manual encodings of GCS instructions
>       arm64/gcs: Provide put_user_gcs()
>       arm64/cpufeature: Runtime detection of Guarded Control Stack (GCS)
>       arm64/mm: Allocate PIE slots for EL0 guarded control stack
>       mm: Define VM_SHADOW_STACK for arm64 when we support GCS
>       arm64/mm: Map pages for guarded control stack
>       KVM: arm64: Manage GCS registers for guests
>       arm64/gcs: Allow GCS usage at EL0 and EL1
>       arm64/idreg: Add overrride for GCS
>       arm64/hwcap: Add hwcap for GCS
>       arm64/traps: Handle GCS exceptions
>       arm64/mm: Handle GCS data aborts
>       arm64/gcs: Context switch GCS state for EL0
>       arm64/gcs: Allocate a new GCS for threads with GCS enabled
>       arm64/gcs: Implement shadow stack prctl() interface
>       arm64/mm: Implement map_shadow_stack()
>       arm64/signal: Set up and restore the GCS context for signal handlers
>       arm64/signal: Expose GCS state in signal frames
>       arm64/ptrace: Expose GCS via ptrace and core files
>       arm64: Add Kconfig for Guarded Control Stack (GCS)
>       kselftest/arm64: Verify the GCS hwcap
>       kselftest/arm64: Add GCS as a detected feature in the signal tests
>       kselftest/arm64: Add framework support for GCS to signal handling tests
>       kselftest/arm64: Allow signals tests to specify an expected si_code
>       kselftest/arm64: Always run signals tests with GCS enabled
>       kselftest/arm64: Add very basic GCS test program
>       kselftest/arm64: Add a GCS test program built with the system libc
>       kselftest/arm64: Add test coverage for GCS mode locking
>       selftests/arm64: Add GCS signal tests
>       kselftest/arm64: Add a GCS stress test
>       kselftest/arm64: Enable GCS for the FP stress tests
>       kselftest/clone3: Enable GCS in the clone3 selftests

Not sure if this is warranted, so sorry for the potential spam:

I don't have any comments on the patches I haven't replied to.

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
