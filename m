Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13162C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 22:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GA1oqAszcgrIWIiY2syFx5v8fQNQQ6cOgLBNi8jek60=; b=bpAN/lfkgxIgXf
	4EpxwjP0Z4kejHKjDTf1OVopbONWpyIfRwe9PxDf2nInydyQ1W0zd5R2E97CuN8A4GJv2ANZwe7ka
	nGSFYU66GU4Ow0LXlgX1jCr0yaT7ZTfOPFdekHbmJq1+wXH9pimHpR3znMZ9L9rrZeflxfeEw2tB4
	x5uMzIFedF8N/JIOlIcxFbaJrBVy1jxihB/V8aDOyUarLAIx3pvRl8o+rAJC7rNhUB4F2GjIKLTSy
	ATVgDI9Lzrz1FLc2LYhnSAgqXrak9LKp12QDQaaXzOHQX6kix7g71dBo5ULL84T9on1xBI1sQOzMd
	ukOkfd7bEKFN5ea1LrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbpGp-00000006Szo-1pJV;
	Wed, 07 Aug 2024 22:36:39 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbpGl-00000006Syj-3oed
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 22:36:37 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7093d565310so224376a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 15:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723070195; x=1723674995; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5xqVBE75uTakMohQNNM+Ob3mwTWILCE117tt64StnA=;
        b=IqHzHm+Ou8EdNpmCCubLjiRfSSZP1X6GmvZ5LZ3VI3CWOCPc2Q8NXxH139ChM7SgL2
         fSDMHz9NMMIKMmFuA9hICd8Ecx82fqE+W79v/hU18gqFN+NU6x5AmcHVYvrfYo13hPZo
         sNrTbaPT/EkPdCCXLpqWgltRdfi01MlVuxLiFj8GXvs0LMZIAM5pU73klcD1gr7Zkz/z
         Se24ARJTkiBD45IWJiTNsGVUSRFCtn8BTnBfESQr0D5JCuN8f9daBRS5YSLXBc/FmuxU
         DPstP+3PgiEFuvkqjSLEYGVMEasA+/uUizg20MxABfXU+wxA3KKZCsPN4uipya9Zs6WQ
         ozOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723070195; x=1723674995;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5xqVBE75uTakMohQNNM+Ob3mwTWILCE117tt64StnA=;
        b=c9MqX/45rMWFPASwQwlo/2yND7+RSnGkYsrUx4TkE9hr+oV0Fd/KfhNvx/i4zfP6ds
         4dV7ccrtRFk5/Lm9YofQj2yCotpX4v4VXuHHMWApKLZUEnywB+LXG/RHXefLLgyCOPte
         QJTWGKUBVrjjFKKskyOa81kGFnsw+34ZG1SKQwRPyz/LxjdZlN8BwJtRU9kdtrotqnrd
         lCPXv31jHOqPMgmGmP/oZF7oGPsy/ld+hbxSam9moShsYUm75CeA0pwSDiyvobb2Fhka
         CL7jUG4376bJ+Wv3GPx2wemDJDIn8Q+MozuFkDwZBCcxr5/uJLLdLR8aKNUbcesUNAud
         L7fA==
X-Forwarded-Encrypted: i=1; AJvYcCWTUKNDxQI061UW1Ptwaz3rHNX8x3pH9IGboFblYCCMP9oLPbxs/hI0AoQ2rzZDzMSNYxGynUVaGlcb5KJuSAr/rFf/VEQVOGEtmjEM9DD3
X-Gm-Message-State: AOJu0Yy6mh+BeEcIAI8+4d6gt5Dt7ZbBalbSiLY3/rmACcUEKU085Z7v
	FFnscb+4wLYMUC677nXEbEKb4YmeJSVkv+CYrmkUPC76ZskvYcOSqS+WBrnXifg=
X-Google-Smtp-Source: AGHT+IGTBDVQAm3GArH3otwegCgx4BHN1ZL2N8yxYA8F/kedHOZ4Afd+CPHaShh6RvNkbAtiESu5bQ==
X-Received: by 2002:a05:6358:70c1:b0:1aa:b860:f10e with SMTP id e5c5f4694b2df-1b15cf91432mr25702255d.15.1723070194758;
        Wed, 07 Aug 2024 15:36:34 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:6c30:472f:18a6:cae1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b7654be293sm7403332a12.91.2024.08.07.15.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 15:36:34 -0700 (PDT)
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
Subject: Re: [PATCH v10 37/40] kselftest/arm64: Add GCS signal tests
In-Reply-To: <20240801-arm64-gcs-v10-37-699e2bd2190b@kernel.org> (Mark Brown's
	message of "Thu, 01 Aug 2024 13:07:04 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-37-699e2bd2190b@kernel.org>
Date: Wed, 07 Aug 2024 19:36:31 -0300
Message-ID: <87bk24dkpc.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_153635_975631_AE822C0A 
X-CRM114-Status: UNSURE (   9.70  )
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

The gcs_exception_fault, gcs_frame and gcs_write_fault tests pass on my
FVP setup:

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
