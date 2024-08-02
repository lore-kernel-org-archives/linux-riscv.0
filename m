Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59102C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=degiYc9nWV4zi77PwhlMniJgCFtHDMtmPt3bgXr1wOM=; b=1pGXWUgapGc0l7
	wwn0A/qrIWN33UHpdy/SQznqAFa0EP8N9ONJhzIK9E8rvlXiacpbwd8KtJVyo29NFlhBeHKNGtAKF
	R7ehjfCJo3UfQTdI/lChtkdth0NssqCOOTFsaInCtAJEz4r74MM3vKcchzP2VWz5k33v2hGry1ha+
	llHoDeQJf7H+PCEwpDj5YcegtMLHSvhjYeDuegkkcv6un/ju7CspSMX47gdPNYmNYxZr0e+MLh9c7
	AbDraLqUI+Anh46oGelfGbSN6uvlUdJ1i0kILkk2CkR1FjxKq34fbU2Hq7taWSzqtqyl95OyHqS0D
	1Ux8JZVc3i0TnDhJlctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZul8-00000009OXo-3OkF;
	Fri, 02 Aug 2024 16:04:02 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZul5-00000009OWO-2ujw
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 16:04:01 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52efd8807aaso12304079e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 09:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722614634; x=1723219434; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaYp+4ySrYqox0C2LwNhC4Vws80twAVdjJbOgnZz/S0=;
        b=kOwPMhVr/RPkVVqOX/CqOByJ9agPIBYovivXu2mYoRlnrPIhfLGj9xBkJAatsz5h0u
         YBHRD93p8migoZPDJxw4vicUGi+ZMf+joXl97lSbtvBgXmFEyp9NKosxvedw5wH05VcN
         vIhbivd5ZwRxGdnCWNIlVcDWUq1//BZ6+7VA10PCKoGYuQYGJhZHhL91nBeylgmoHDOj
         nkLcPw0gn3fXyrQSqcCNRzxE+dM71cLiXz4s2awA3vzZPMTSTdrB/fflI8VEAHNHRFy5
         VARpXMzvQRwG6u623ktOJl2uReZT6bpJB2bi+zwZvvXfa3aeTCrdmgIqdLKpASZqylvZ
         zSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722614634; x=1723219434;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaYp+4ySrYqox0C2LwNhC4Vws80twAVdjJbOgnZz/S0=;
        b=QiuC/Cuvj157csySL3upQzZk+SRHyJ54jAvzl557TDTIX8Hp0GQuC47BXo1umlwpsL
         APfy7l5bk20WvTTIUfAeex3flUgifHCdP6l1qEMoCy3OEkP/K0YgysgXFHKxqYRqv6a5
         NR2+HN6IZixdoa8vyUrpTw/CbIdCkVig8Amx1LgD8wjc106CG/cxwPw0R6dOqYJRzKAd
         2cGRZ8mXvesL65HC8xvvtvI/JgJ7VUPx9l28R5uTtr+99iVCriC0Rf5Dpn8ZbyvlTm7Q
         yyJ9zOS9Ohx+HFvljs3hmDv51mcHp7/iaRqmi5Lv2ffjA6TQ0DMxFNDAv2Px9i5e6Z61
         /07A==
X-Forwarded-Encrypted: i=1; AJvYcCWp0ntteGdd/oynBETt/94Z8PHw0m98KjrsNxt3nctLROyJT+lcOS7fvVu2gdPSnuuAmA+kf/fJe99bNaq7/6j9KNrHI5OHcsBeIZlbNwHV
X-Gm-Message-State: AOJu0YxIfIG3/gcd2UsfopJuYsMETCcxsxvgudUWaYJlY7Ub1yGp8c0N
	mx1H2781Ai+2Q31lqKxUu5P572iq52lQbZAUnQP3XmJGUveYDtydPQEpeTER4XY=
X-Google-Smtp-Source: AGHT+IHar+PPGcrxDNcjSr1um3g+3xRCfTrmLOXPeIhwAHJBP67s3XLeWwHx6hWOKLC6el1844qAfg==
X-Received: by 2002:a05:6512:3ba0:b0:52f:c14e:2533 with SMTP id 2adb3069b0e04-530bb3c79e9mr2525031e87.48.1722614633808;
        Fri, 02 Aug 2024 09:03:53 -0700 (PDT)
Received: from mutt (c-9b0ee555.07-21-73746f28.bbcust.telenor.se. [85.229.14.155])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba07dc7sm266293e87.16.2024.08.02.09.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 09:03:44 -0700 (PDT)
Date: Fri, 2 Aug 2024 18:03:27 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH v10 00/40] arm64/gcs: Provide support for GCS in userspace
Message-ID: <20240802160326.GA36502@mutt>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_090359_767948_D19D30BE 
X-CRM114-Status: GOOD (  36.38  )
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

On 2024-08-01 13:06, Mark Brown wrote:
> The arm64 Guarded Control Stack (GCS) feature provides support for
> hardware protected stacks of return addresses, intended to provide
> hardening against return oriented programming (ROP) attacks and to make
> it easier to gather call stacks for applications such as profiling.
> 
> When GCS is active a secondary stack called the Guarded Control Stack is
> maintained, protected with a memory attribute which means that it can
> only be written with specific GCS operations.  The current GCS pointer
> can not be directly written to by userspace.  When a BL is executed the
> value stored in LR is also pushed onto the GCS, and when a RET is
> executed the top of the GCS is popped and compared to LR with a fault
> being raised if the values do not match.  GCS operations may only be
> performed on GCS pages, a data abort is generated if they are not.
> 
> The combination of hardware enforcement and lack of extra instructions
> in the function entry and exit paths should result in something which
> has less overhead and is more difficult to attack than a purely software
> implementation like clang's shadow stacks.
> 
> This series implements support for use of GCS by userspace, along with
> support for use of GCS within KVM guests.  It does not enable use of GCS
> by either EL1 or EL2, this will be implemented separately.  Executables
> are started without GCS and must use a prctl() to enable it, it is
> expected that this will be done very early in application execution by
> the dynamic linker or other startup code.  For dynamic linking this will
> be done by checking that everything in the executable is marked as GCS
> compatible.
> 
> x86 has an equivalent feature called shadow stacks, this series depends
> on the x86 patches for generic memory management support for the new
> guarded/shadow stack page type and shares APIs as much as possible.  As
> there has been extensive discussion with the wider community around the
> ABI for shadow stacks I have as far as practical kept implementation
> decisions close to those for x86, anticipating that review would lead to
> similar conclusions in the absence of strong reasoning for divergence.
> 
> The main divergence I am concious of is that x86 allows shadow stack to
> be enabled and disabled repeatedly, freeing the shadow stack for the
> thread whenever disabled, while this implementation keeps the GCS
> allocated after disable but refuses to reenable it.  This is to avoid
> races with things actively walking the GCS during a disable, we do
> anticipate that some systems will wish to disable GCS at runtime but are
> not aware of any demand for subsequently reenabling it.
> 
> x86 uses an arch_prctl() to manage enable and disable, since only x86
> and S/390 use arch_prctl() a generic prctl() was proposed[1] as part of a
> patch set for the equivalent RISC-V Zicfiss feature which I initially
> adopted fairly directly but following review feedback has been revised
> quite a bit.
> 
> We currently maintain the x86 pattern of implicitly allocating a shadow
> stack for threads started with shadow stack enabled, there has been some
> discussion of removing this support and requiring the use of clone3()
> with explicit allocation of shadow stacks instead.  I have no strong
> feelings either way, implicit allocation is not really consistent with
> anything else we do and creates the potential for errors around thread
> exit but on the other hand it is existing ABI on x86 and minimises the
> changes needed in userspace code.
> 
> glibc and bionic changes using this ABI have been implemented and
> tested.  Headless Android systems have been validated and Ross Burton
> has used this code has been used to bring up a Yocto system with GCS
> enabed as standard, a test implementation of V8 support has also been
> done.
> 
> There is an open issue with support for CRIU, on x86 this required the
> ability to set the GCS mode via ptrace.  This series supports
> configuring mode bits other than enable/disable via ptrace but it needs
> to be confirmed if this is sufficient.
> 
> The series depends on support for shadow stacks in clone3(), that series
> includes the addition of ARCH_HAS_USER_SHADOW_STACK.
> 
>    https://lore.kernel.org/r/20240731-clone3-shadow-stack-v7-0-a9532eebfb1d@kernel.org
> 

Verified this patchset on a FVP.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


Cheers,
Anders

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
