Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AE8C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 22:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+AOlwkljPSBY8fzaZyp5sFJZsUdedtwuC4PZtmoNuA=; b=diqzUw7ONLGAD+
	G6G0DYCVES5A9yMJIBb3RF0m6kbUnL/I4RI4I/xQ7sRTYxCTke03s0Au7nSwRD/2PxOYBEW16e3ac
	qbcpYiwA1+6vQ/wUGkA4m3OeI2tAhN6LsXZpRDa928LKOHktgtIWAtQe3pZRywVIiXh3A2lVY00qh
	WJ8SABilRs+id5womqYHAj/+E78gtmSIJhzAEcmp64x6K6lKgOrB+GPLXUu5xUyf9pDom4m7arRes
	h/t5bRVU//drl55Fue2E8qlNZrWcw2lZnOEjvNgbSXhOx6VinXFvvJOHuEQ807QA1KuoUx6LKKcR2
	O5A06fcSH2QxMCjUVYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbpED-00000006SOm-07Xr;
	Wed, 07 Aug 2024 22:33:57 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbpCD-00000006S8T-1AUs
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 22:33:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fed72d23a7so3908865ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723069912; x=1723674712; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eqn3LooEfKQSn1SPZrgXd7kK5ryU/WoLiCmXsEwtkWo=;
        b=pzleMLRPQfg6ZNapAvXQ1/9uqMCwh/MriafuR0yeKCmBA666DWkeK5E9XSDaeDzIHt
         79K7ckZgwxKhW/PoRGfCRI24/Rr7x+irSXm4uKT6XlUVAnpoBF9Ih3t2gcnGwk82K97B
         YAamQ8e1Sg0M4qYpHHdwrh6sv/7I2h3w5IV1w0DWPxwixspG7zu7nlfJTXOqoiDJmOdZ
         vj1acNjcFi+AJnh76E7iFAo84GBsHHttkODw6EpvzYFiVcxICybmUaYmuLTGqYhnpdCf
         87i5I4cOVWlgK13hna2x7a3Ymzj6RgU9Xj9jb1TSl4SXmbuWbnPphUXQS0s1L/bHCN7o
         +Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723069912; x=1723674712;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eqn3LooEfKQSn1SPZrgXd7kK5ryU/WoLiCmXsEwtkWo=;
        b=I2xI1KRMrhVNocCyx5FpBQer7MhKMvR7uRBnwCNQHPNzihJGrgGvePknsLbl61noO6
         70q75jIv0SRPCsCuOgBlZp3IRieA1anS/3R9ET39WFdMsz2VeGLrudq2FEcYGh3u5ut3
         rgFMxDuLBU7Ck0wS8yLF3etwam5HUcuGtfTS+5RZ5+Ga82DmlFj8EoxFZWbgTzv7oqFO
         97d+CjZqE3yqbKoAiCeVTgLN3m87/Q6LEQUtqSdh/2+JmjuCkGHlGTuSJLMOmsxy/yER
         JcLxFCKnSh1+0JPzxkiR3Z8GLoUPW/wAeDtgqX/Up098zxOZsepLg+RV0wO4mLjhkSgt
         z0HA==
X-Forwarded-Encrypted: i=1; AJvYcCVyzvSjUL2ADiSmcw/2mYMLdGdCyUYasDRlhNiWIE6ZP3Whvjy1ah4Ajvvfr3+tzuLfnoXYPsN/s/hMIYodfL2gY/WjqtuMYRUchPbTf9+1
X-Gm-Message-State: AOJu0Yw8OLFqD8r8qdSvb3se41oD1phZZulx9fmOQ3IKV2zysIvUFjqo
	XDOe/qufkKgDMkqdO2FU1M74RS+CHrEQpRKcgIAHZneTupiS79mPiAH4yCFZyb8=
X-Google-Smtp-Source: AGHT+IHHjhsk2z4q9vmLjR7LsBMy2oppwwN+j14R3XW5fxPpM7oxaFufcdUW3gDCZ50Rjxk+EmoCcA==
X-Received: by 2002:a17:902:d2cc:b0:1fd:6a00:582e with SMTP id d9443c01a7336-200952641bemr1402985ad.30.1723069911749;
        Wed, 07 Aug 2024 15:31:51 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:6c30:472f:18a6:cae1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5917767fsm111712115ad.183.2024.08.07.15.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 15:31:51 -0700 (PDT)
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
Subject: Re: [PATCH v10 34/40] kselftest/arm64: Add very basic GCS test program
In-Reply-To: <20240801-arm64-gcs-v10-34-699e2bd2190b@kernel.org> (Mark Brown's
	message of "Thu, 01 Aug 2024 13:07:01 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-34-699e2bd2190b@kernel.org>
Date: Wed, 07 Aug 2024 19:31:49 -0300
Message-ID: <87o764dkx6.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_153153_344736_B6ACBA7F 
X-CRM114-Status: UNSURE (   9.03  )
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

> This test program just covers the basic GCS ABI, covering aspects of the
> ABI as standalone features without attempting to integrate things.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/Makefile        |   2 +-
>  tools/testing/selftests/arm64/gcs/.gitignore  |   1 +
>  tools/testing/selftests/arm64/gcs/Makefile    |  18 ++
>  tools/testing/selftests/arm64/gcs/basic-gcs.c | 357 ++++++++++++++++++++++++++
>  tools/testing/selftests/arm64/gcs/gcs-util.h  |  90 +++++++
>  5 files changed, 467 insertions(+), 1 deletion(-)

The basic-gcs test passes on my FVP setup:

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
