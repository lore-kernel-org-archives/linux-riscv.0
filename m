Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698E8C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 22:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQb2rOnwT3K0tWTjAlvcRyDk7QRopJKKXRYn5szXUG0=; b=hRXvFSpljc9GpV
	GyDBMihoExQTquHI1bbsoTfrAa0yriKVabTpvvP50ncsjUV59AHqBkHQ7e8IFYQCh5Ho5HjCqiK/N
	baq9SPEI7FEwmuGrCSuAMvYI3RJBSptvtZLBwsyrLtNiKCMr6Wq+tT8wer4nXsSKrJlP3BjVDrGJt
	X/ExTh39HNzyOGgRg4CChX7V7YFbSWaDtfCpiHq1lwrx88k2gk6PG2o/g7xedmN6LqyVv5t1d7jlV
	H/Ki5oowzLsz7AVbmDeY4+N44TLrPm+m3dRvvLHwpbbNJTngtK2WoNulE9tPg+pP6nJoBVuwQAa1k
	N0/saIotHtoLnItRy3gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbp3L-00000006QmV-3gJG;
	Wed, 07 Aug 2024 22:22:43 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbp3J-00000006QlY-1uLj
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 22:22:43 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70eae5896bcso318374b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 15:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723069360; x=1723674160; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZVO8jPYcIWWyL3ex1mes3d5ZlFCIJ9T4CxX0DBumqo=;
        b=r4t30SLMQ9d0kBy7KUUY2Ru9T0EfzCcZ2ksZB+h/Q74pVR/cv8qCfnIBw6NN21LXTR
         fqW/g2dVL9NmOwYt0L7POegZHE9hGcZdexbk/As9JLAesS73jGn+HntTOagirIPhtYog
         VoyXkvn2GlWO4W1Y3MZcCRr8wr7AMrtKRmV0jN5E1/9Ao/98RiUioGKN2QNuJEubVstG
         BhtKVTQ23iB3j98UyDb66bv16Udxpws28WWINVq0k0J/DNxEmbgl5EfbuiTFINQCaaFw
         pm2S+boS0gafeG36KfZ8YJYSG/SOwd/aERVOVTce8um9jDVA+gSQRQrheFZ0SzidTJ2Y
         oAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723069360; x=1723674160;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZVO8jPYcIWWyL3ex1mes3d5ZlFCIJ9T4CxX0DBumqo=;
        b=ufLErActnLZ1wT5rxI85tjznuuHEgzIsiuDREcwklsBER/WUZAxF2HFZRlH4K5HuTD
         tdx0dRQdWoXeGH0i+3KttsjSCXc6F+M/2eVNzt4vpU3Q/53u94UcxrHk2S0w/kDTT/j3
         BvQp6dDLG9xndAv40PBEJRi07stRRxuOzhrSLhQFCX57K54jyI72ldEegP8zlMhzkt4j
         nkkkGlRwF/i/VbXxFpwDiqLj6AtxVjYmHyTDUYqnf2nwpYCZjWVxuS1OR/POvl5yU3PQ
         E4n+L7jPdrgzXtAGaYXUhp8+VQf2ARjGaenQH3mAiK9f8Y6N0Pybi9ReFIqyUe6/KfBf
         aY+g==
X-Forwarded-Encrypted: i=1; AJvYcCVgNYpBOC6LZ76hJcZyRrnA5ev4Y0nYmHjbQtYhbWqEKNZVSvu4AHGETbqtgD/Bive+CQvYeSsr2c2MKOk1+9mBuuWNwplLN6Rs+cCQaSTR
X-Gm-Message-State: AOJu0YyQIlz17j7TvFrMItgJ7xMiGu7ebHUFF3HlYy426z4FVPq7PnzI
	iWURwaipntCwppePCr6wZ+bj9IMU45nqz8jPEjQxfYHhjApN5GDUlGpo9MGXBqQ=
X-Google-Smtp-Source: AGHT+IH2Cc0g0B6ra70L5cg48YZJx7srHh+PqfLxpX9PDwnG8XSpUfpqxIf7dyUyWUuyhSQCs84ohw==
X-Received: by 2002:a05:6a00:1302:b0:6f8:e1c0:472f with SMTP id d2e1a72fcca58-710cad5a30emr137306b3a.8.1723069360049;
        Wed, 07 Aug 2024 15:22:40 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:6c30:472f:18a6:cae1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb228d37sm5911b3a.46.2024.08.07.15.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 15:22:39 -0700 (PDT)
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
Subject: Re: [PATCH v10 27/40] kselftest/arm64: Verify the GCS hwcap
In-Reply-To: <20240801-arm64-gcs-v10-27-699e2bd2190b@kernel.org> (Mark Brown's
	message of "Thu, 01 Aug 2024 13:06:54 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-27-699e2bd2190b@kernel.org>
Date: Wed, 07 Aug 2024 19:22:37 -0300
Message-ID: <87zfpodlci.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_152241_529132_3A20D3AD 
X-CRM114-Status: UNSURE (   8.67  )
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

Hello,

Mark Brown <broonie@kernel.org> writes:

> Add coverage of the GCS hwcap to the hwcap selftest, using a read of
> GCSPR_EL0 to generate SIGILL without having to worry about enabling GCS.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/abi/hwcap.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

The hwcap test passes on my FVP setup:

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
