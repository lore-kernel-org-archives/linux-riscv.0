Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47349C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 23:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwNsYqdNrbIoih+RakfdM5euzocV1655QRTCkXOuq3E=; b=N++NdefInapF8m
	BdrQkEl9JXiH7xG48hIV4UXrhx6NaEes8f0EDfGgEBxyyT7ZkczrT2V2KyUfKpTviQwDPvcLP2lKV
	RIJsy9tmxGM+ZgUlSON1n37JAiHSQ/obGOX1YJrLclTVG1PJAlxEv09IaGb2AqVijGwkge0SteDmK
	pkqkrHCAHzI5xlg6RKF5atTLAeyvPZfaB/+XVM25JtBr7JQ03reQWN0Z+1ZHh4nftTHKSr/+EOwXY
	sOUyI2hhhgokVqonzDPGuW7C3G5MceJjD30pOedV5e8fN97NRZiBNzi57uV+hwT36fO0XUY0MFhge
	RfSrwB1PTt4TqNsO3Zzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUaAT-00000000vV2-2E83;
	Thu, 18 Jul 2024 23:04:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUaA6-00000000vMO-12Vm
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 23:03:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fc424901dbso13279215ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 16:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721343825; x=1721948625; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pz/gqH3g6k+Tlg5PlSG754DQsZEyo/RAObvbOwwmn1M=;
        b=g8NiuGYM97OSdbA4uMbKDeVzvi01AkZmuIh2yD6Cm8oZtr1Rgnu0Je/DynPv5WyiZo
         cQHLKSOhloGLhUjfw4aSHSOAZ0flfOlBHZRpTW3MSfWulu8dX2AZ7+WtYxU5rYIC0bk1
         Dcn5uvFpdju184Kw/AepApmF4eH3sDzpDoDj0dJ7vgrb+gq8hjILHLXFwTrh0FQP8atu
         hO91Rae5wBFK0vTBzDSJf6RHG4lK2AOrwdR3xpLIPRlpQjsCds9L3R2v1lPf/jSA5qLj
         DjlmfQBrlwaaEnZkU5M0nqdLCr+X0g+ZryCMAlniBfV530NExnMpW9m3cId5bXJ5XtG5
         i3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721343825; x=1721948625;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pz/gqH3g6k+Tlg5PlSG754DQsZEyo/RAObvbOwwmn1M=;
        b=MATh5ooFZtvJR0u5uplHJ1ul5xQXZRLW/Txv+Sry32AR4h44OWNogaQpWDUgRds+Q0
         qWIm1HZDfmD8ap5YF3wO27+GI30cB87IsWanpvXTwSw0N5ytzc5wTfKIp951dOtRaD3B
         V3YVgyPE78/fR5v4Vi+l45Gj/Rgpiqumg3J27cY7SPdQUni74NkuZ1xdqpJbbGs9ufia
         CS5mQCnmbHuW0xpdd12VnnU06to0aKr0pSYbyCKgrVn7IcfK4IEgh7azhKOtZIatPkMw
         QryJ3+NmeqF4ck2s3+RbsSRzG4sDkmf1DMdHqfYtXTXAaYyADHbabbJdZXC6rdn27qYW
         hBMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiS5C2bt4PRBRKho6fO5YRIcSdXd3Sys/9kh2BeYTP1HB5H9kl7GIXMQvqG3VXATFi1o6qUIGINe5wijeftnIYiu+qjXwA0mbFtXBqxSA7
X-Gm-Message-State: AOJu0YxSP/Lecmhth0B+7DYs4QyIMvrMWvbF6i3Hv6hgrAwpWhQtWmqy
	F6YkzKfy2va7Kn6o1lxwg3pBBPHdycgfTBUSRsIBOaCC+OOLMZPLdWfHemCWBjI=
X-Google-Smtp-Source: AGHT+IF1+3P0pRgwkXsR0FAWIIytKywrIML3Fqxwpp1fn6IdRgXx4TsuO6HiuiBf9bLph6vSY6g+qA==
X-Received: by 2002:a17:902:d48d:b0:1fb:24ea:fe02 with SMTP id d9443c01a7336-1fc4e16ab7emr52140735ad.18.1721343825147;
        Thu, 18 Jul 2024 16:03:45 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:15c8:3512:f33c:2f80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b8693asm1105435ad.72.2024.07.18.16.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 16:03:44 -0700 (PDT)
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
Subject: Re: [PATCH v9 37/39] kselftest/arm64: Add GCS signal tests
In-Reply-To: <20240625-arm64-gcs-v9-37-0f634469b8f0@kernel.org> (Mark Brown's
	message of "Tue, 25 Jun 2024 15:58:05 +0100")
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
	<20240625-arm64-gcs-v9-37-0f634469b8f0@kernel.org>
Date: Thu, 18 Jul 2024 20:03:41 -0300
Message-ID: <87a5iexpyq.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_160346_331430_F485E334 
X-CRM114-Status: GOOD (  10.97  )
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

> Do some testing of the signal handling for GCS, checking that a GCS
> frame has the expected information in it and that the expected signals
> are delivered with invalid operations.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/signal/.gitignore    |  1 +
>  .../selftests/arm64/signal/test_signals_utils.h    | 10 +++
>  .../arm64/signal/testcases/gcs_exception_fault.c   | 62 +++++++++++++++
>  .../selftests/arm64/signal/testcases/gcs_frame.c   | 88 ++++++++++++++++++++++
>  .../arm64/signal/testcases/gcs_write_fault.c       | 67 ++++++++++++++++
>  5 files changed, 228 insertions(+)

The gcs_write_fault test fails for me, even without THP:

$ sudo ./run_kselftest.sh -t arm64:gcs_write_fault
TAP version 13
1..1
# timeout set to 45
# selftests: arm64: gcs_write_fault
# # GCS write fault :: Normal writes to a GCS segfault
# Registered handlers for all signals.
# Detected MINSTKSIGSZ:4720
# Required Features: [ GCS ] supported
# Incompatible Features: [] absent
# Testcase initialized.
# Read value 0x0
# SIG_OK -- SP:0xFFFFCF1292D0  si_addr@:0xffffba645000  si_code:10  token@:(nil)  offset:-281473808879616
# si_code != SEGV_ACCERR...test is probably broken!
# -- RX UNEXPECTED SIGNAL: 6 code -6 address 0xf76
# ==>> completed. FAIL(0)
not ok 1 selftests: arm64: gcs_write_fault # exit=1

It also generates an "INVALID GCS" line in dmesg.

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
