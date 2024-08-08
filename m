Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5254C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 06:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bD67Oasq7plfSrYBTwJGwH1/Fo+s+X1318bC4gOyDkU=; b=ZQrB9MKr1p3MC4
	FhG4Iobr2VHWvzon2kXIEAHfSqsVI3HDBYwz7Rpxiso/y9IIcsgvV9eVecQkEKGC/DeB/F1Gz8Ft/
	o0kVMrOqZ8rziwNqntA427yEsNaugGy/lVfS+yOsgiZ96jvMQlOubHNqRQSrpnI7nAdCmG+bnxRvX
	AF2Ivr+m28+im3+0l2FykFfzODuWmNy2sB0YKwis1FAjEJaGzx2L7ZBLsMe1WmjAa3ujynPpf7QR6
	KiGRDaNsR7TFyEKmrN3M/xAQ0Cnbm7KsgP7/bcBtfDdn2y877gQuPmox1gWAB1uH6q7LcDlFUd8eh
	McrJhnkgRxppRFVmaAGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbwZc-00000007Dvb-07Rd;
	Thu, 08 Aug 2024 06:24:32 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbwZ1-00000007DnI-17FY
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 06:23:57 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70d399da0b5so549884b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 23:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723098234; x=1723703034; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WK8rtcyRr8ddH6sUXU5fxnXTw/gvxfa7lKvESZemSbI=;
        b=SWlouRuV/05rstbdUqAgxVOK8L4IsXib8yC8MPtvN3++VoMdVBtYRfkP4ZkNJE2Vcd
         ww8kCWPvRIF0Py7FVsfHbSV1FnvqK01yX6SdZ8OhepyNmzeAzLRu8weNbcb3thLZilNk
         UeSzu5NeJtFSIqK3EU3Y5a1Ip+wnsCG2YNRXU92Oq0XuyL3B+0LFNx/bv2SOgDLRTgmJ
         jCp3MXYRe2BdgHLdq1XNdSgq7LgezewvmHNitjbubSvZkvimt1NVziE6tIYyImwyVKHd
         EvZuzDQ1tgJS8dmc4r8lIBaj3MgzOhoz4cZDnW3iS2v2n0d0GonjH9c4Vx1sp3ls69wX
         OpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723098234; x=1723703034;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WK8rtcyRr8ddH6sUXU5fxnXTw/gvxfa7lKvESZemSbI=;
        b=agV1kBChHSgdrVMjwPEh9K4hRbke3PGWK3Skt0635MjdPVf6RxMdTELG4IkHJwK/Mp
         t/PrMXGNmgHyCZ0tEYYQGsDIO0rwtiZVRbs+GQOoY/cYqYreqG+9w7zm9WYBynU/Zf2o
         qwE+xAyImknvJSlpAniqFCqcy2DZKXFCsvcYNHSITLuizbYE2JkgPVszDi4Ajv6Aq/86
         WFSM/EjrqqAeI9d47inzswyJduZzyu4aiQmB2/gh4X0vu7b2/6aOAQsIwKTuzy1g8vpc
         3R1sfUoG/48GHaq/s4RcpDtNultzuVvvoTeDZTz0pDhM7H3J9tR2LnGkUUX+u2DolT+b
         XOAw==
X-Forwarded-Encrypted: i=1; AJvYcCVY7bE1W33vcwrrESPugGeqdvhKku0r0MJMKxYoLiVv7DHNsZZTPDYRlhB/s9sdPkBRPrJqtjPfcETzyrmOdomA+PY8DNuDs0Pd553W+EBA
X-Gm-Message-State: AOJu0YwWl+YxYpLR5o9uyHTy47fp2E4xG2hCqpeDVwOXEN/ygHvQMv9S
	4vlTk4NOLzj78rB/rXOq5lkpZNhnnPgNoV2Rbhk6mSvA8iGF5lXxRGT/x+KlD1I=
X-Google-Smtp-Source: AGHT+IFYw3pObWR57BLXtwXu43FaZ7f39AGJpk9DJobImXbFcvJMmOT0vZh2bJKK6Qf6HCB4wbBa5w==
X-Received: by 2002:a05:6a20:7f8a:b0:1c3:ce0f:bfb2 with SMTP id adf61e73a8af0-1c6fcec8890mr851553637.23.1723098234214;
        Wed, 07 Aug 2024 23:23:54 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:ed46:7c69:6cee:3c20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e89ffsm480393b3a.180.2024.08.07.23.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 23:23:53 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Andrew Morton
 <akpm@linux-foundation.org>,  Marc Zyngier <maz@kernel.org>,  Oliver Upton
 <oliver.upton@linux.dev>,  James Morse <james.morse@arm.com>,  Suzuki K
 Poulose <suzuki.poulose@arm.com>,  Arnd Bergmann <arnd@arndb.de>,  Oleg
 Nesterov <oleg@redhat.com>,  Eric Biederman <ebiederm@xmission.com>,
  Shuah Khan <shuah@kernel.org>,  "Rick P. Edgecombe"
 <rick.p.edgecombe@intel.com>,  Deepak Gupta <debug@rivosinc.com>,  Ard
 Biesheuvel <ardb@kernel.org>,  Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
  Kees Cook <kees@kernel.org>,  "H.J. Lu" <hjl.tools@gmail.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Florian Weimer <fweimer@redhat.com>,
  Christian Brauner <brauner@kernel.org>,  Ross Burton
 <ross.burton@arm.com>,  linux-arm-kernel@lists.infradead.org,
  linux-doc@vger.kernel.org,  kvmarm@lists.linux.dev,
  linux-fsdevel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-mm@kvack.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 38/40] kselftest/arm64: Add a GCS stress test
In-Reply-To: <ZrP-9gHsvVHr2Y5B@finisterre.sirena.org.uk> (Mark Brown's message
	of "Thu, 8 Aug 2024 00:10:46 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-38-699e2bd2190b@kernel.org>
	<877ccsdkjp.fsf@linaro.org>
	<ZrP-9gHsvVHr2Y5B@finisterre.sirena.org.uk>
Date: Thu, 08 Aug 2024 03:23:50 -0300
Message-ID: <87y157cz2h.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_232355_333280_CF3C81A6 
X-CRM114-Status: GOOD (  13.87  )
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

> On Wed, Aug 07, 2024 at 07:39:54PM -0300, Thiago Jung Bauermann wrote:
> 
>> # # Thread-4870: Failed to enable GCS
>
> which is printed if a basic PR_SET_SHADOW_STACK_STATUS fails immediately
> the program starts executing:
>
> function _start
>         // Run with GCS
>         mov     x0, PR_SET_SHADOW_STACK_STATUS
>         mov     x1, PR_SHADOW_STACK_ENABLE
>         mov     x2, xzr
>         mov     x3, xzr
>         mov     x4, xzr
>         mov     x5, xzr
>         mov     x8, #__NR_prctl
>         svc     #0
>         cbz     x0, 1f
>         puts    "Failed to enable GCS\n"
>         b       abort
>
> the defines for which all seem up to date (and unlikely to fail in
> system or config specific fashions).  What happens if you try to execute
> the gcs-stress-thread binary directly, does strace show anything
> interesting?  If you instrument arch_set_shadow_stack_status() in the
> kernel does it show anything?

Thank you for the pointer. It turned out that I accidentally ran the
selftests binaries from the v9 version instead of the v10 version, and
the gcs-stress-thread binary failed because it was using the old value
for PR_SET_SHADOW_STACK_STATUS.

Using the v10 version of the selftests the gcs-stress test passes. Sorry
for the false alarm.

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
