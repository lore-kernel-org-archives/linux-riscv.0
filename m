Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E02BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yBhVxoXqDrrHgqheYRsAa9qK1M+YgcC5AKaV8hMLBzM=; b=xY4deaJpTWscMlLylnYXMQ+g/N
	Jnlx1PA2suEuCWn1JaQBDxbXHlHGXXReARI70UxDsfJ6NvcOQ6mIyZJJxqqryJkpoNXlopn89vyQZ
	4NSWmOkXEa+V8e9a4lP1p6FLyTv3JnPug/c0UplUCRlWVmZ2XZXfDICZyS8Q0o7leDfq40uG2SpiV
	jdCNO8qBJI3XjnxTQoI8w8IGjeiS7fxL8wDpAg4C46AMHSY14VMi/SAgM5iyeeibc9XH9SwIaxJG9
	eE6REbNf9zC8G+14WOJLyJb9gzZOtYQ5zXZskDejtBDiEfWJgaBp5mPb4xeZ/Ew07DqHClGpnBhe/
	dzlzshbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAyQ6-00BD7T-0D;
	Wed, 06 Dec 2023 20:22:58 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAyQ3-00BD5A-1L
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 20:22:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d06d42a58aso1540555ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 12:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701894172; x=1702498972; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=wEKgHh9Vd3x1VnCH3fKyTqAO4yCFQDcZVScsz606mCI=;
        b=AWx5mWH++SUAzL2k5Jh203eSfTEsFTHsshrjqZCMI/tODECy576aQGp7Vcb2IHKT5I
         bRyxK3cSYpRhKCPjI6TZop/1Ht8m9xX1d8D5SsV7YI3GDw6+fwUFxOdLeEo7P/91fUli
         C5IVBIUoxR/mxjNirmj9WH7UHBvf9iIMQNf4sR/mIrewU5FXsJTLhfIIlx7Rj4a+uJ/i
         9cybFXI0GDFsSlMzeQSGBAXZtglMwJBIJgEiDQisXeQ5V4I/JDCst5bx7flACKMAOgVr
         sX+loI8X+UDLU9rWEu0HaoM3aHTEEqbaWWJ7GGQKuB6swC7NIv6jZUhjIUDQYPCewTJc
         oiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701894172; x=1702498972;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEKgHh9Vd3x1VnCH3fKyTqAO4yCFQDcZVScsz606mCI=;
        b=HJoDzv/9l/BjPhW2KI0gyJWjtu1x0XI8fdHJevs+Ns3R7Ce7Fr9hx3QcoDXCRE2RVM
         cxR5SG4W/ijwPnwJmhNSFRXDpBXwvTs4/29SB7tVIgvSLzZ2RJ7eCsgc42L7DDWswubq
         hesNd9vH5XAlbYtWhMmxdnz5ObauyWd60wEqcXPMBN+kgvh1lG6flgBM7IkPHuh0895w
         7YIy0wCrRvLRexTTbuOd+YNeSmlMzLUhl2wFCMjO79+1+p+nCll05stQkVcqPSkeOQVV
         xszNZVY8dcj0bcVicegH7hpjiI5tykeGHwB+swnLbj6BYPOY3HHDKN2RGc0kNlc70S2w
         PN6w==
X-Gm-Message-State: AOJu0Yx4pYKqHrfmGe1Cevwxe7kx5l1S1xOjpmVAugHCLYdvpKg+LI1F
	MeOi/eZXRHaJMZLEC3jANNhOug==
X-Google-Smtp-Source: AGHT+IG+PGi/Ruq72+ftbttXAOwy9ae3wKn38k1eINbZqpLAyVIquTjmRIENSAWXjKXoIaCS0/BIwA==
X-Received: by 2002:a17:902:d502:b0:1d0:92a0:492b with SMTP id b2-20020a170902d50200b001d092a0492bmr1505448plg.84.1701894171625;
        Wed, 06 Dec 2023 12:22:51 -0800 (PST)
Received: from localhost ([2804:14d:7e22:803e:f0e2:3ff1:8acc:a2d5])
        by smtp.gmail.com with ESMTPSA id z2-20020a170902ee0200b001d071a305ecsm217078plb.245.2023.12.06.12.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 12:22:51 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-21-201c483bd775@kernel.org>
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
Subject: Re: [PATCH v7 21/39] arm64/gcs: Allocate a new GCS for threads with
 GCS enabled
In-reply-to: <20231122-arm64-gcs-v7-21-201c483bd775@kernel.org>
Date: Wed, 06 Dec 2023 17:22:49 -0300
Message-ID: <87il5bhyhy.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_122255_455935_E01A547B 
X-CRM114-Status: GOOD (  15.98  )
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

> When a new thread is created by a thread with GCS enabled the GCS needs
> to be specified along with the regular stack.  clone3() has been
> extended to support this case, allowing userspace to explicitly request
> the size for the GCS to be created, but plain clone() is not extensible
> and existing clone3() users will not specify a size.
>
> For compatibility with these cases and also x86 (which did not initially
> implement clone3() support for shadow stacks) if no GCS is specified we
> will allocate one thread so when a thread is created which has GCS
                    ~~~~~~

This "thread" seems extraneous in the sentence. Remove it?

> enabled allocate one for it.  We follow the extensively discussed x86
> implementation and allocate min(RLIMIT_STACK, 4G).  Since the GCS only

Isn't it min(RLIMIT_STACK/2, 2G)?

> stores the call stack and not any variables this should be more than
> sufficient for most applications.
>
> GCSs allocated via this mechanism then it will be freed when the thread
> exits.

I'm not sure I parsed this sentence correctly. Is it missing an "If" at
the beginning?

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
