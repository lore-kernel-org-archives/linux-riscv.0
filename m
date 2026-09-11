Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DD8C88E4D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 17:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6A1FOj7OSXJPPY7jBTU7pjywU/BCa62CqWHf42hqK0=; b=hcHd2/FHE4FiA0
	YILYzkA/7R9cO9sWpRRMNlBgESHwbvDpjBYvNI3j7WJ7ZkMRDwbhDO6bVQ8/82LhjmcwqmnDByD1A
	7PbFsuWsPFYOO/b3Jqpo2TYB3iqkWl5LkhRKYDG4IwDdDPchFqtOtDADpByf/AKHgUkAKBBpk9Jxv
	siZYGvPWtqSL2/OcoYMoeWtYkU7//x4q3i1KWYMZBrCjQuj+Bba05iGS7dYG6067b63ZiDXQoJ65K
	R4RgkNjFInTfDBAv7yDoaRwFSte3lqBTnqQOaoJzCafpqYUl869OS3Tc3spRi2u8lSGCjpRVDFhZf
	CcGcHHaFQqC5N0kn8e4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5588-0000000HMM2-49fW;
	Fri, 11 Sep 2026 17:33:40 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5586-0000000HMKY-08lW
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 17:33:39 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so927755e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789148015; x=1789752815; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oHkfE3imp4BQyC9rRB22q5PBnbDLbNtc6L6K0uF99Ik=;
        b=rdaYx5+n/oa4sKcHlYou+zWdQM1o0T+WcUYcJq3BDo9W8VF6R1tc6i4uxEIIoc9OzX
         JGCMYkUXPS/GqC8AbKNv2HnlZ6kMg5EsgK+dAQ4QGQrBgUf+wGX6s0skl4TmrhUmaamt
         pJaOyXsPsxyQdehTizVhNC7iq+WFUPFn8HAcs+dTFWHxjedcBWBxDu0k6Tq9VfjJx62g
         q27wf86rxZDVWhIctVL2uojcEvwNWfQ6Jy62XeztjqaEqLjtrqVtHGHH57zF8anHFj4g
         8BeX4TXv5oFbL8ouEdYd3dYFC8aGaGyRmnCmMD+FcOQdrY0YqP3yA0MerFthhHoXYC0W
         EKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148015; x=1789752815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHkfE3imp4BQyC9rRB22q5PBnbDLbNtc6L6K0uF99Ik=;
        b=lsRhoEZyRu4K+xr2MkqLrlpLDC4RzT2KRSFJeo46ETK/H86O+nxBYmw4G5pqf56MxI
         pgkNv5CLyeGS2dzlkWLvECAuxw9+cZmCxuQQMxoXEPavNkWdhT3pOnopglLLwFaFk9Qj
         Lc6oMd7uX9iYCMF3j14W40rkWK+lCbglNP7TMQWgwzYfRyZaOb9qfFTIpVGuQONtwQXH
         DDH0dTPMeCGTpR+NmmltPLcJj4opvYQOZixth7LAaFNb7P80QthWkmY00jIEECkizVS1
         WY38sPGF+T/OMe8L15wnUDPZ+qJdKQK2PcJHET88zn43u8qE0m3IlhA63ioplv17/gXk
         xGVA==
X-Forwarded-Encrypted: i=1; AKwUvByFdqznjgtA3OdfT2wRUzQDp6xOddU21NriHLvccRxRp6TOyNMo/Q4rrEIjHwU9RoowdJ3jcut2/1Rwpw==@lists.infradead.org
X-Gm-Message-State: AFuF++kPjddvzNZuFz8N1mU8ZqJFdraslvk/GX+T2Ejdm+2HfWFcdMrx
	UJ9yZvJvUOK3p1G3edgJNuH7in8YZYVU8Hz4hrNk0m22YXCAvv1DYfHA
X-Gm-Gg: AYBFou01uklo0BcXjxdwzHFZ++6xtJS+EUpDWlT/2hiP8kU+rUBBs0VIN85hSAC2rK1
	DmkvjAUbjqCKlIysBL8KkpeJ1P5HbeECiT3nUGFekVOvkpNDMK5avl39Lxo+WdyUYHazTU9GwLw
	SQGL0wpzoN0xz9iCcIopFcSZcEGsdB46ZIkcMbilq/hjD0lXvZM6PVmLsDoMAqGk9gM2Q4XmdCU
	sZBb+qKXeiUmDr1aOM+PiljzSQayZJ9G8dzUlhLCBYuoyrDptmwU1/5D4G1jEIDi458+eCklsRw
	U5lmi3inEcHQLCvxT7Te5hmpF5THAU/WHaQE32ImF5t+nGjeEP/FtEuS4uFpzTpCpJzAd33kYZp
	igLdo3Kpw0fRIKYuzDLboePOaHuU9VosP82b0ZWPQ8tbuGC6uPGz9SiYNGdreyYiV83+h35hoHJ
	RACmqmn0ukSkfe5vhMMVrIzdsLQwezaSnDMW8/42ZVB9CGdolU7ZAw9YeopHfV9K92zAxTlGwU2
	j6YRIpzRWAzxSpyaFIfpb9RlvO+nGGcyJmC
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e6198734emr158528945e9.6.1789148015226;
        Fri, 11 Sep 2026 10:33:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm80821885e9.2.2026.09.11.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:33:34 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:33:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nathan Chancellor <nathan@kernel.org>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <20260911183333.1df0f2e2@pumpkin>
In-Reply-To: <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
	<20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_103338_094868_E9EFE89F 
X-CRM114-Status: GOOD (  10.89  )
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

On Thu, 10 Sep 2026 17:42:35 +0200
Nicolas Schier <n.schier@fritz.com> wrote:

...
> Yes, skimming through the patch, I thought about that, too.  Moving more 
> cc option checks to Kconfig will make building out-of-tree kmods with a 
> different compiler more dangerous.  Maybe we will have to make the 
> warning in Makefile's prepare (external kmods) target a bit louder.

One problem is that distributions have a nasty habit of shipping kernels
that are compiled with a different compiler version to they actually
ship as a compiler.
In some cases the versions are clearly the same - but the version
strings differ.

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
