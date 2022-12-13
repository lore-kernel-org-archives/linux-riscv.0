Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C70DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 20:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3J9DKu4pLiuVRxQl2Uw3cUdZI/z80ii1Od6NAk9ezoo=; b=DP37Zu9nt9JFW/
	vmI1mG6t2UPYhpoGTnbJdA6ixThUxr0VVCLGiofCiRIWXJPLj4lmbjSN4FUAkRKg3FkjTjARGmxlF
	3OShftshtpYMmz/RlnI5cb+uN+q5obXYBg4K0ISzA/8ipQNc/qhe1JIg+oW7gOpMdTJ1A4m0rOoRe
	gyHy7wYFB2HI4Y+Gn3JH687myPJoIfFKpvQvfq0YffmPY3xawMhrsmwg1lw4+y8h41jxse6W51YM8
	UxctUhcjAm5moJXW2HYXnyIEmcxk3YgaXll7gs+DzU5PTfH6Cs2/aAi4z1mYZA6spCj8tnXiIop03
	sIhpewVbrD3s0JXMTlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5BUk-005agC-Qi; Tue, 13 Dec 2022 20:03:18 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5BUi-005a91-0M
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 20:03:17 +0000
Received: by mail-pj1-x102e.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so4781367pjd.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 12:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SlLKeNs0EWVsu+ptfdWBNmvU18ZVhMR61XWdAxFV9XQ=;
        b=Jgh2h70gyFoI+vZEt+HRyYhvy8YXmJruypdwVRYeOAtwakBPLsrcx6y+QvB3hUhUNm
         v/DiIWAZ3oh+MtBheCrEL++Gyb7HLAT1gDnpqMiVuiB04sbr6RL+4HisIMlXsah7jJHs
         BQh9UrAAjRfz+6OEQK8DW+ZocCeLgGW7E9/YuE4vDZ2U7pCZP9xxdvcW7BRNNE9/dvXk
         UHFZHnLNmVVz3QPKDVMD9nL2tc1Un2n3p3lY72Vrrn4IEro5ne4Mp2Xd+uRIFimABqMP
         9hVMz9Et/jMsgOYssc4gfckHfVOAIkEUwXeMIcmjytkpiwFO3ZODSvpun/Uk3hH9yVpu
         tYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlLKeNs0EWVsu+ptfdWBNmvU18ZVhMR61XWdAxFV9XQ=;
        b=oPFowg4RTBVxZJAeUDwB4hpultxQSFezDWX3tyC1V8Na1aN+T0kTwo31W5y9c55cFo
         75RB4h8pkGvP5Xab8Tc8Hg+60P+tD4e58a5j1I1VLkgM1BaUwIeKL7dPCJRO8gJTHFlD
         PMEyK/2pYjOxGZVLh3Ue74KhZJ4KyQIlQxVX6dy7DdHne3PUZ33qk7V4j+MEpEtAkwOk
         CEd/b58TmGta9Cj/5djn6k9Baq15Nd0O1JF2IySNKr5rQv1ptPzi4Yk6++QJWvseUOi+
         w/mfwk/M4YX51IVzsmli/2W149FsWdh2fA7a3eJAeN3kE+6UMB/kH7Upjw7bPzukFkww
         hkJA==
X-Gm-Message-State: ANoB5pn3AkEER49sdWFsgRQBOAOggQLnOervXrZGviuw4T5sHwZnye2O
	pmj6L+gXLpiE67CRf/kevcWGMg==
X-Google-Smtp-Source: AA0mqf43rfeTLye05owqv8MbDwr9r9xovoe2k6ziCGD54isSIqaMDQrLxrh/vw468kpaItrUN7BQ5g==
X-Received: by 2002:a17:902:7b96:b0:189:858f:b5c0 with SMTP id w22-20020a1709027b9600b00189858fb5c0mr428994pll.0.1670961788301;
        Tue, 13 Dec 2022 12:03:08 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id u5-20020a170903124500b00189667acf19sm289595plh.95.2022.12.13.12.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 12:03:07 -0800 (PST)
Date: Tue, 13 Dec 2022 20:03:03 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: David Matlack <dmatlack@google.com>
Subject: Re: [PATCH 06/14] KVM: selftests: Rename UNAME_M to ARCH_DIR, fill
 explicitly for x86
Message-ID: <Y5jadzKz6Qi9MiI9@google.com>
References: <20221213001653.3852042-1-seanjc@google.com>
 <20221213001653.3852042-7-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221213001653.3852042-7-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_120316_065643_42231462 
X-CRM114-Status: GOOD (  14.11  )
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

+David

On Tue, Dec 13, 2022, Sean Christopherson wrote:
> Rename UNAME_M to ARCH_DIR and explicitly set it directly for x86.  At
> this point, the name of the arch directory really doesn't have anything
> to do with `uname -m`, and UNAME_M is unnecessarily confusing given that
> its purpose is purely to identify the arch specific directory.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> -# No change necessary for x86_64
> -UNAME_M := $(shell uname -m)
> -
> -# Set UNAME_M for arm64 compile/install to work
> -ifeq ($(ARCH),arm64)
> -	UNAME_M := aarch64
> -endif
> -# Set UNAME_M s390x compile/install to work
> -ifeq ($(ARCH),s390)
> -	UNAME_M := s390x
> -endif
> -# Set UNAME_M riscv compile/install to work
> -ifeq ($(ARCH),riscv)
> -	UNAME_M := riscv
> +ifeq ($(ARCH),x86)

As discovered by by David, this breaks doing "ARCH=x86_64 make", which is an
allowed/supported variant in the kernel proper, so this needs to be:

  ifneq (,$(filter $(ARCH),x86 x86_64))

or alternatively

  ifeq ($(ARCH),x86_64)
  ARCH := x86
  endif

Hmm, unless there's a reason to keep ARCH=x86_64, the latter appears to be the
better option as lib.mak doesn't play nice with x86_64 either, e.g. `ARCH=x86_64
LLVM=1 make` fails.  That's arguably a lib.mak bug, but it's trivial to handle
in KVM's makefile so forcing lib.mak to handle both seems unnecessary.

I'll also add a comment to call out that $(ARCH) follows the kernel's terminology
for arch/*, whereas for whatever reason KVM selftests effectively uses `uname -m`
terminology.

One last thought/question, what do y'all think about renaming directories to
follow the kernel proper?  I.e. aarch64=>arm64, s390x=>s390, and x86_64=>x86.
Then $(ARCH_DIR) would go away.  The churn would be unfortunate, but it would be
nice to align with arch/ and tools/arch/.

> +	ARCH_DIR := x86_64
> +else ifeq ($(ARCH),arm64)
> +	ARCH_DIR := aarch64
> +else ifeq ($(ARCH),s390)
> +	ARCH_DIR := s390x
> +else ifeq ($(ARCH),riscv)
> +	ARCH_DIR := riscv
> +else
> +$(error Unknown architecture '$(ARCH)')
>  endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
