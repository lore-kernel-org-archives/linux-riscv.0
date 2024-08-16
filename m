Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28BDC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 12:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcRpvQmTk8jGGo3qKo5FJot5kVzRVnyfqCR6ofvq3Ac=; b=r5yPA9zezR8Qf7
	T+WSgqWYuKnhx+fH/0C6aUKMZCBlOjjnTkL1Ml00c0QGsdWBj3LTLKaaY3CoxMW3QmpQCIHvrqtMg
	Lyi6JeEEkx+PE1EtrEA6KgfFO2gJ7XujCPzfM43ZiwhY4MQF4sR5H9a1I41cde7XOoT2cyaM3AIHz
	F/NRAbxO4T1ylsdxs+YyPMW0p98H5zHxjP5Gt8LyZ1sEsT3AUfGgSs4YyI5HRS31S4f6wl07woLtm
	ShSnHMLNP7675MpMDdxWfotzwPeBbj3qcsIN7I54WRgbASM13qnUE9AI1Bwz7FgOqBFniZLsr27LG
	dqQ7EIIwRZVQOJ+zlSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevsM-0000000CqK8-0L31;
	Fri, 16 Aug 2024 12:16:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seupS-0000000Chqa-0d5Q;
	Fri, 16 Aug 2024 11:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7325B620AD;
	Fri, 16 Aug 2024 11:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB36CC32782;
	Fri, 16 Aug 2024 11:09:03 +0000 (UTC)
Date: Fri, 16 Aug 2024 12:09:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 05/40] arm64/gcs: Document the ABI for Guarded
 Control Stacks
Message-ID: <Zr8zTTrJ6M0SCvCV@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-5-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-5-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_040910_668739_C46FDAA9 
X-CRM114-Status: GOOD (  23.82  )
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

On Thu, Aug 01, 2024 at 01:06:32PM +0100, Mark Brown wrote:
> +1.  General
> +-----------
[...]
> +* EL0 GCS entries with bit 63 set are reserved for use, one such use is defined

Maybe "reserved for specific uses". The proposed sentenced feels like
it's missing something.

> +  below for signals and should be ignored when parsing the stack if not
> +  understood.
[...]
> +3.  Allocation of Guarded Control Stacks
> +----------------------------------------
> +
> +* When GCS is enabled for a thread a new Guarded Control Stack will be
> +  allocated for it of size RLIMIT_STACK or 2 gigabytes, whichever is
> +  smaller.
> +
> +* When a new thread is created by a thread which has GCS enabled then a
> +  new Guarded Control Stack will be allocated for the new thread with
> +  half the size of the standard stack.

Is the half size still the case? It also seems a bit inconsistent to
have RLIMIT_STACK when GCS is enabled and half the stack size when a new
thread is created.

[...]
> +* When a thread is freed the Guarded Control Stack initially allocated for
> +  that thread will be freed.  Note carefully that if the stack has been
> +  switched this may not be the stack currently in use by the thread.

Is this true for shadow stacks explicitly allocated by the user with
map_shadow_stack()?

> +4.  Signal handling
> +--------------------
> +
> +* A new signal frame record gcs_context encodes the current GCS mode and
> +  pointer for the interrupted context on signal delivery.  This will always
> +  be present on systems that support GCS.
> +
> +* The record contains a flag field which reports the current GCS configuration
> +  for the interrupted context as PR_GET_SHADOW_STACK_STATUS would.
> +
> +* The signal handler is run with the same GCS configuration as the interrupted
> +  context.
> +
> +* When GCS is enabled for the interrupted thread a signal handling specific
> +  GCS cap token will be written to the GCS, this is an architectural GCS cap
> +  token with bit 63 set and the token type (bits 0..11) all clear.  The
> +  GCSPR_EL0 reported in the signal frame will point to this cap token.
> +
> +* The signal handler will use the same GCS as the interrupted context.

I assume this is true even with sigaltstack. Not easy to have
alternative shadow stack without additional ABI.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
