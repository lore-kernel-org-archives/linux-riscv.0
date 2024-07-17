Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5C3C3DA49
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 01:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duN5LXNpF5x/YMoV2JfPLdlzCIH6I+VOm8RLYzRMkkU=; b=iPWMtWE44rdxm8
	o0XYexGnFh/dhOD+C9rJTDQFL63AGvHSkjPFfJgUcp9qGMddz7MmzW6B2hIt/5BvKfyy6hobRVBQY
	pKtHy0lZnYUG53JIREnB8a7ci5wv4Mcyw88WXysfy+BskIqsPq8anFDH4FPwPwbKFcW/yShygMKg9
	kcvd0+4tbMXGHBnwliMl9r1Sa+sEd9Elvwzufs6irhP5X2ztEynn/qfgvqaSDaO/gmFZob8HNqG6W
	GBeme/3WTtQ/SSdZsfw3wlIl7nCxhbC9Ufznnft3XxLAXoZbRRH0P6TK9/XMal30BV19hAvx8/H8n
	oJ5R44ZnJYb77pZj2H3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTtMS-0000000CFlv-23zI;
	Wed, 17 Jul 2024 01:21:40 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTtMP-0000000CFl2-0KOg
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 01:21:38 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-380eb36f5ceso1858605ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 18:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721179296; x=1721784096; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxSuTpzy0m4oHhnzHH3Vl/gMhNpkpWEzqeVsFcwdgKA=;
        b=vm4mpEcFjH2iEcdd79PcfMVeXcyu9K0VMm9U3qnNNU1QHrlDFpaweX7ROmu1UBObxe
         szu2uSwyHx+4fiNDWkQ2ZtAwXBowCe9dBH8tEIJPZf2pPn4cI3C32EcyLzRcb99onJOC
         slShfYYbrv+Rkw1ZMgwURKqp0RzhoWx6dSFoR5YSeXXbkzntoFiynL7ecyxJbZMpFdGL
         dduW+zgunVOebcELZgYgzEalJWdKuH1T+rVze8X1858aDy0HHPhY5U4A0sNWlIzXiT3z
         nNIpbXr/3GcYGBf2rYkM4OTaP0sLnjgQVCf1hYROiedaneayUravuctDmLKvGz0WdDmJ
         bLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721179296; x=1721784096;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxSuTpzy0m4oHhnzHH3Vl/gMhNpkpWEzqeVsFcwdgKA=;
        b=Kj12E0RVKXjNulNMqGtrtX5YBlmKk8ncASKLya2J953CixkX3pxwJLfJCu9hmsvmYS
         +qbZIDzUCT6cabrQVRrB0A+EKuw9ImJZtES17Ewc82X/90GTManZW0ZyGOkj0iF/gYtc
         XiVLQ+PZASIRJ4gg2yCa/92DyT+mK+mFBFPo+dFUEtcvNe2Dd6GGvR1wlgTFCvWarYXj
         7kERYm92/tuXegFOnSszoSZZax8Mzl6f9O967en3/VRjP5jcNS8jPkglzO72/UbDF6p6
         ic+odw50KdVjeIQj27EXpVFm1MN93TbQeyhufltFUP8t9QL8g8aITZl1kOvK8Bw20tyD
         51Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXeBedWj/tgQI6UJDF72/CO1lAkp01hUDraeV91XDmK2EyX8nOiGl08DNebJiyiTWROSUBjxXTsyuyhftC0Fs5l71QiBZV9eh8BnKFuD04d
X-Gm-Message-State: AOJu0YxAFIAR80yoLz52rkV1T8irpSTDZXqC1QhBb0h77uGN+Dpa/pLW
	jLJeXWobPnxSozE2TKIT72R+H5+rm+3YEGAfJee+HpoHiS8Fd+buTdPx1BlY44w=
X-Google-Smtp-Source: AGHT+IFRPVkYVOcZWv1UNdg1RTMru4FboqdZLxvXpxoWV2PdP22CoQ+3xARnx+an75M9dDo1WCR1/Q==
X-Received: by 2002:a05:6e02:13a9:b0:381:3989:214a with SMTP id e9e14a558f8ab-395557ffecfmr5071635ab.10.1721179295925;
        Tue, 16 Jul 2024 18:21:35 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:4ae3:bddc:48f7:36a0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ec7c5ddsm7023267b3a.124.2024.07.16.18.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 18:21:35 -0700 (PDT)
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
Subject: Re: [PATCH v9 05/39] arm64/gcs: Document the ABI for Guarded
 Control Stacks
In-Reply-To: <20240625-arm64-gcs-v9-5-0f634469b8f0@kernel.org> (Mark Brown's
	message of "Tue, 25 Jun 2024 15:57:33 +0100")
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
	<20240625-arm64-gcs-v9-5-0f634469b8f0@kernel.org>
Date: Tue, 16 Jul 2024 22:21:33 -0300
Message-ID: <87msmgu82q.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_182137_302679_25C333DC 
X-CRM114-Status: UNSURE (   6.99  )
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

> +3.  Allocation of Guarded Control Stacks
> +----------------------------------------
> +
> +* When GCS is enabled for a thread a new Guarded Control Stack will be
> +  allocated for it of size RLIMIT_STACK or 4 gigabytes, whichever is

s/4 gigabytes/2 gigabytes/

> +  smaller.

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
