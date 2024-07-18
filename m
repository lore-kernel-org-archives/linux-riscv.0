Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9773DC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 22:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jj2seODGzRF6TZc6ZqyxoQqDQSMvVFqLxR7GgpZvid0=; b=aByivGrZ75PJpa
	mxIZGOmZ/u0WooVZIvuh2r9KyBblm+ObzmSGz5CO8yrwCbZ8/Mflb/oTBHVYmSmfksQIGltw8DT8Y
	auO8DSrcm0OlZSZshuhFzpSHmnxjV7V4rSTAbdd55qg+zdPojtXKkiJNU9O0B5AYIbQ4jc85SA3AH
	iF8PruEbFWNiBIVNVppGhkrF/ze3oCZ12U4mIM/++YStCeZiEJFLKlpaL3tCQoMkL014iJr9gqHLa
	4CKI60ziLK4ecvZEPU9QnyUhap/zxWoP6dSuXtSjxweHoNjbUCG2HjO1ocW1cGmQ7AcSZhfSZIoZH
	GM7EAXQZYH1yg/7wk40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUZcR-00000000rKx-38fq;
	Thu, 18 Jul 2024 22:28:59 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUZc4-00000000rCJ-0aKl
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 22:28:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fb0d88fdc8so8322855ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 15:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721341715; x=1721946515; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mAFp8cCYrsuMTkT1FWDyABYg4XKo158nqIj+Kj0+oyk=;
        b=NmwOd+SmV8QRx5+FHT5RnKMedqhyV6bmyY+ZAK7Zw4xnEMcNi9+7S88fE4AJFK8Wyb
         x0aqt+dY/eieX6fB6R53c5Vg3H7EBh/kiGfkp3xU3cVmLXv9HlNT153qqwUkY9GmyvfA
         LiT0ToeFK7lgz46LG/m+VaJffuzsdCx4hOlLDm6zsxvXe9TTudr1KUXcSwfrXekBDmVo
         94alg/Jbha7+Py7JyNFB5FEN4duYWiuktewizneMmnzt6LD06VESAUUQG2a7C/sCf/Jo
         iEzStN+Ocfw9QTwwn4XnohqsqY2QCZKHuxeDBQu2O8FCohdjnbFG147RpKnELEH6PdjP
         q/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721341715; x=1721946515;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mAFp8cCYrsuMTkT1FWDyABYg4XKo158nqIj+Kj0+oyk=;
        b=iAK9xDzrxsoQwBUFwsBaTnc8PPHQ8tzACECXDPyNqlgrRCZ5woczM6I984CTDViPb1
         NBEm90S0wpvR+tL6jQNP6SviFNe4Qf5Fknr4kjK6iTRGzx9p6UguoRdr8srCD+kgr7kM
         61TdEW/btuAbFtcgH7+1paJdJ5V2vr18JbzgSBWVA/vBh1G6GPHmKt0xR+QRWvlkXnT1
         rQhu09nfkGjNCZw4F2eTTa8EAPZyI+dg5OXBm8WktGb02yRLQZ9V2+5JhxfkVKJINc2R
         6BqZqqo5wXTORI23obrPtQ5FlzXZ82s1KTasd+pUaIG7sSQeLAe+zw2/r+d+ltHn/xFa
         nLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSayi97PyCeLg3glcZAB9BeoQL+/W2MinnT2BNkIXsqsAI/pGo//IDPGTixy2gTqg1rSLRtDo8O4dr62ujbcpKjshc8CCS7DC8vPjVQjpX
X-Gm-Message-State: AOJu0YzxA4BEmXD3SgYm6H2fQQuJAdoZTF0ikT70tUehPzm1GpZtAo/q
	qtzNlLAeh3CKyqfKPK2i8Dn7sSaqbfozH3n4/rM++7BL2J7pbay4OB+HXVJq1Z4=
X-Google-Smtp-Source: AGHT+IF+55vW6JaqSjwGQi3R1yuf8ZxKtUymaiTTvyr4EyfBefOjisnvw3P8CACe6QPfDEnW0zUgIw==
X-Received: by 2002:a17:902:f707:b0:1fb:37fa:fedb with SMTP id d9443c01a7336-1fc4e154856mr54520445ad.10.1721341714980;
        Thu, 18 Jul 2024 15:28:34 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:15c8:3512:f33c:2f80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b51aebsm849435ad.27.2024.07.18.15.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 15:28:34 -0700 (PDT)
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
Subject: Re: [PATCH v9 35/39] kselftest/arm64: Add a GCS test program built
 with the system libc
In-Reply-To: <a1ee93ab-2168-4228-a4e8-eab02c046bd3@sirena.org.uk> (Mark
	Brown's message of "Thu, 18 Jul 2024 17:16:39 +0100")
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
	<20240625-arm64-gcs-v9-35-0f634469b8f0@kernel.org>
	<87plray8we.fsf@linaro.org>
	<a1ee93ab-2168-4228-a4e8-eab02c046bd3@sirena.org.uk>
Date: Thu, 18 Jul 2024 19:28:32 -0300
Message-ID: <87ed7qxrlb.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_152836_363755_7D35816F 
X-CRM114-Status: UNSURE (   9.34  )
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

> On Thu, Jul 18, 2024 at 01:14:41PM -0300, Thiago Jung Bauermann wrote:
>
>> In my FVP VM, this test gets a GCS SIGSEGV before running the first test:
>
> Do you have THP enabled?  That still doesn't work (I'm expecting it to
> be fixed with -rc1).

I did have it enabled. After turning it off in the kernel config, the
test does pass. But I see 30 lines of "INVALID GCS" in dmesg while
running it. Is it expected?

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
