Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83239C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 22:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yC++x3tzHg+ylImv3eeQGs0TulNDEoxss5r+zkMcc4=; b=pQGFlMhP4VaP9q
	Wcw8V5jzIgrpe+oMGu/5OMxyXOUUicUNOFqdec0X3xRvaiIgK+sh53cEjkL9GkpEM4rRBQpH/L0MV
	UigObptbfnqGdjSzogFZTwWwHivQLQsLZa4PIVAXlPjPIH1BqWWgMFse6gIhQtA6f9ES+yBtpvySe
	eO8ATG+gyBtDEnymiW4pCcc23qhaNnwkzfl/+TS5Y/dsPAyUymyJLt2FNZNvOptAOKKD2HiJl1RLV
	ucoZYCABBHpObICumquqe0icCp6h4RyswRR9IYbtRChFeXMF6Ue4yBJ2g1p2lOPiauIv2V0hdg/sM
	7fK3RAIb342F7Qnfzyjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbpF5-00000006Sec-3rZz;
	Wed, 07 Aug 2024 22:34:51 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbpEV-00000006STK-0Y7U
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 22:34:17 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-75a6c290528so257053a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 15:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723070054; x=1723674854; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lfrHG1WH6erSaIaipwT8ciCPWYlneUqYmls1urpaYsI=;
        b=O4DYeZm5riL0ePhEqo0Y61LC2O54Ek006lEaMHcMr/hntEDENNStnLi7/o1McjkpPG
         XAmLcnDySuSa6lKSAeINIyM80Hst1UXHyyTlOEW8NMOrrsFhcYEeafYULQ60WLHCsODY
         8FbG2hN4B29boAMX6mfuwQn3RAhsOv+a2kMyPJlMQYk222NV5fUrN5mKpbIRfNnS0PAU
         XSR7c6ChVXWIGE4TV+6jUJ982jmpGG5WIaN4+65Q+ORHHYX2QucKYjgFEswkhsjnMBo/
         1+zmJ/e0sf4Z6TM1+ckdteMfjMbYt/UJy0EhXSzh13aZ6Ro/nms1cB3Q3uXf+1sIFuBi
         sKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723070054; x=1723674854;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfrHG1WH6erSaIaipwT8ciCPWYlneUqYmls1urpaYsI=;
        b=b9Qwb8ks+w1i05MDKDo9m9OsYSEvwsyo/BBttkLg3aXa5CsYRG5YC2nl2pW+p0JZCV
         vHf/mZXhZ+u8zyxAwGphVLOvJ58+hOR0IvuiSa4skxWOxu2fkO/2W5FNuDzz+/Tf74fP
         /8v6xyPeF4PoRKwJini8glUzi6Etk0JIq1dphZENlhZN9c0tXeS/Eq+xNi2SJ8qn8ZoW
         x8TiAgEAohKP1hhzqSuSHbNbp0grVHcIl4K2ZIYuFFUP4VJTy2cifudhvzckKoUiQXQM
         39as+b/uaCWrTuQW0VNZ8muaqkVZv/eDRUCE5j18BGpIbSWRsWP8IIZMErG0FXrNsJN5
         2slA==
X-Forwarded-Encrypted: i=1; AJvYcCU4vbEG1mJK1XmLK3P0A7p5ZNgx5j7p96ZpySHS3SIF1q8Dgreh2EJqTr1THoC0Avt3debLxgWfKlyt+3hJf8TGthgL94UapvYPcbVEJuIK
X-Gm-Message-State: AOJu0YzY/VFZGNaKHTnva0VcqE/9YMBuhECXLnoRWOrFR3IXMHGx51Zz
	N7MAbLCdtNjRCfTpko9Qv/Iler4yOX6KaxHZwRQTDP+p7s00NEaP9oti6GKCjyo=
X-Google-Smtp-Source: AGHT+IG39+No54Rw/miCMksXv5QcGuWzil+DCVtmW0Rz/pFwmk6IgrNbAr9fPsdspRzM1slcOMQVlg==
X-Received: by 2002:a05:6a20:c21:b0:1c2:912f:ca70 with SMTP id adf61e73a8af0-1c69966e0b6mr16020999637.42.1723070053844;
        Wed, 07 Aug 2024 15:34:13 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:6c30:472f:18a6:cae1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59176eb6sm111615725ad.196.2024.08.07.15.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 15:34:13 -0700 (PDT)
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
Subject: Re: [PATCH v10 36/40] kselftest/arm64: Add test coverage for GCS
 mode locking
In-Reply-To: <20240801-arm64-gcs-v10-36-699e2bd2190b@kernel.org> (Mark Brown's
	message of "Thu, 01 Aug 2024 13:07:03 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-36-699e2bd2190b@kernel.org>
Date: Wed, 07 Aug 2024 19:34:11 -0300
Message-ID: <87frrgdkt8.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_153415_224599_4ADDFA85 
X-CRM114-Status: GOOD (  16.68  )
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

> Verify that we can lock individual GCS mode bits, that other modes
> aren't affected and as a side effect also that every combination of
> modes can be enabled.
>
> Normally the inability to reenable GCS after disabling it would be an
> issue with testing but fortunately the kselftest_harness runs each test
> within a fork()ed child.  This can be inconvenient for some kinds of
> testing but here it means that each test is in a separate thread and
> therefore won't be affected by other tests in the suite.
>
> Once we get toolchains with support for enabling GCS by default we will
> need to take care to not do that in the build system but there are no
> such toolchains yet so it is not yet an issue.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/gcs/.gitignore    |   1 +
>  tools/testing/selftests/arm64/gcs/Makefile      |   2 +-
>  tools/testing/selftests/arm64/gcs/gcs-locking.c | 200 ++++++++++++++++++++++++
>  3 files changed, 202 insertions(+), 1 deletion(-)

The gcs-locking test passes on my FVP setup:

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
