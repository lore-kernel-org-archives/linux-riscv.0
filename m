Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED31C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BBPD5d6I3paHdPVeZBQnX4M2AyO9oUMKmzxIlSynVWo=; b=jXmMFUjffoXHrM6Z2f1xr35KoL
	hZ7jLapQRhAMXVkPK6EJMP6qJZY8TQFGrNOWX4e6ZXuOb1oatCQrwjbHf/Mck1crlXoyF/iwyTaQn
	eWLGOl4yFrQbPEGJcjPVNJeivu7eE6sM9e8VYZyZvvMKKxvs4Hs+H5epoxcKPFDh4MorhBFW+vkCU
	srHT+DoGKNN1wt4Syg6LMfGYeSDxjux/oHBvUFWYhscWIKeGKMK4yoHn249wSV8dOHrSE6MAm4AsQ
	c8RVDvA8hLVIhhteFHJfLx7zbcedqW4kgxS+yzckIRC30CpXLKI1X5fqLVBLnaCJnZUSHpt3VYNgy
	O+WJ/35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAzQc-00BJdk-1D;
	Wed, 06 Dec 2023 21:27:34 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAzQY-00BJb6-2A
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 21:27:32 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cfabcbda7bso10318455ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 13:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701898047; x=1702502847; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=mbZzH+s3JDxV/sloks5umdqEjeI9fKLBWt3znOcMhGI=;
        b=K9JUEDTxMa4byE+WGMCM3A4MAzaKwUfDCdeWNCPz2MgitKtQ14bszh4xvinSAn+d9s
         tnK0JZ9kzq7mA440FDswJ/cFIDJ/Cm9iXN+aRLYxvkhmBgffylZYUsnaXncZ45fFxjah
         LS7tfUQxN0PV7OQ6zE4i4vW3+qMhVNIgtT0yBPf2hwk2MyQWJtgBvP+UEKB/qZmW59Ns
         qxTcBPL5AmhPH+knKbZa7wBNCGtGshJUrWTcv4xxYEmLOO3tvb8RW6TSXiy/XoxfAksU
         gWN5TGjM+iY01I2MzK67P8p0iCcH5X7NhTOlWet55UkX+j+KKAYIIvCkPcxUhsozb/D+
         nAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701898047; x=1702502847;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbZzH+s3JDxV/sloks5umdqEjeI9fKLBWt3znOcMhGI=;
        b=QYS8MYRkYZLEKhpxLq8NmzdL54nrUByLoptZpJaBwwtsBoZeeN4zvm1IeE2Q8inUxA
         EZH6UNvTt45Qw0AVvgo0o+GMotJ0gD1xhnkO/pacKXJzTlAiLdKUvT8BQiofLNzWvCj0
         QS8wcKiNNjWfn0T6xyrr4pnMveDL/+d4/P46vAnWPG6g1/l3WDi5GasTdV9aUxuJGBp+
         r0ONAEyRVkhvUAJZBwIVEPEHjFiow1UxhojMvU7cnhvSEui9/58MoPaWXarRQRYSVQ3Z
         FKvsJ8WXOEWqfYwpZ4R4Wl+2LLTs59e3UgK8/MVMmUh74yQWYAmLiR0o3wZaM8RtcDH8
         yItA==
X-Gm-Message-State: AOJu0YxabJtF1d7GYD+p6zgaR8BNmix0s9Uh1NPcOIrfD+KVNHKBeyj+
	1ne4mTRlZK4x1voyXjgeeTD9AQ==
X-Google-Smtp-Source: AGHT+IGLa8DInnGMjJcXZtON7bZ8pQ8xN1J6vJzQP1zj6zdeB3quK1/DibmWAlo2/mpEotTdJ4e23w==
X-Received: by 2002:a17:902:e80f:b0:1d0:6cfd:d3c4 with SMTP id u15-20020a170902e80f00b001d06cfdd3c4mr2193857plg.17.1701898047545;
        Wed, 06 Dec 2023 13:27:27 -0800 (PST)
Received: from localhost ([2804:14d:7e22:803e:f0e2:3ff1:8acc:a2d5])
        by smtp.gmail.com with ESMTPSA id jj12-20020a170903048c00b001cf6453b237sm259379plb.236.2023.12.06.13.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 13:27:27 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-22-201c483bd775@kernel.org>
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
Subject: Re: [PATCH v7 22/39] arm64/gcs: Implement shadow stack prctl()
 interface
In-reply-to: <20231122-arm64-gcs-v7-22-201c483bd775@kernel.org>
Date: Wed, 06 Dec 2023 18:27:25 -0300
Message-ID: <87edfzhvia.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_132730_704035_E8E46ECD 
X-CRM114-Status: GOOD (  10.13  )
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

> Implement the architecture neutral prtctl() interface for setting the
> shadow stack status, this supports setting and reading the current GCS
> configuration for the current thread.
>
> Userspace can enable basic GCS functionality and additionally also
> support for GCS pushes and arbatrary GCS stores.  It is expected that

s/arbatrary/arbitrary/

> this prctl() will be called very early in application startup, for
> example by the dynamic linker, and not subsequently adjusted during
> normal operation.  Users should carefully note that after enabling GCS
> for a thread GCS will become active with no call stack so it is not
> normally possible to return from the function that invoked the prctl().

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
