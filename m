Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C56C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVLmVZwLcRsGwJtRYhcFplfJPQWbX63cD5eCip3jRj0=; b=geXQ9/A+7+o3ac
	piGM36WbgQcmKttiT4xDbGFRSij5eYBddw5GJxJVhekMUV0ZloQHD25DuH0/4aOPAoRYgoHiEAJDh
	wx9s0EXVAmGujx3yki2iiB7iJDhixMdUvcZ3ETAqLuwKV4vz0p+5Up3pJde5EEntTEQoaLYYpLhQb
	u//NLs+HoeUIz5EiDrna5h21AAcv5iy9VhxySFwx0iKbA85WpP/iSH/fB1Dg7uhDM1YK9Qu9Qrqb4
	Z6v9Q63h61fxDh00Hv/+dMjMF8A6/axe16t6VcL1cZSWUFRysOkWaL3TOKTyzCJBQkFL9UNQ/W12W
	Q6QK5CKsR++vm3AXltzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4uEP-0091Xp-6W; Tue, 13 Dec 2022 01:37:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4uEL-009172-MJ
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 01:37:15 +0000
Received: by mail-pj1-x102e.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so1907208pjp.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 17:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iJwqdDN1RvNeTFiZyaSzmASJkDq0+IG5uFFQ0Vq+pIE=;
        b=UOLR4/D4l8GUzElS0sejD2JapJwiXXo2meP6+lJ4UUi6Oj9CCz+E9FE2qBHGrI7Utw
         7OokGhkdZbKxc3Ctt6ZZXN0i35uOg0peSR+0R+WVwqWr9OVFPJSib+WjKq5pQzui/58i
         Y8s1Y27VjQTtgwC7o5gYdWnjHddNTpRNWzMaZm5tNwUVmLRfMdVKxsEBBWh6ITeGtOW7
         gXOTqvopxiSjsYbG5ApbWUNiAL3dozmKHp10byFJU92ZP4hQWonUzETTShKtTRFN2+Hf
         tAOTXVSSNORLHBQ3eDPsuPXE6+G5eltxPXeLQCSKhU6J5/WfdMsaHX1ArV2nqpfebXr2
         dRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJwqdDN1RvNeTFiZyaSzmASJkDq0+IG5uFFQ0Vq+pIE=;
        b=TnewWYNqZwy5F/jcIKf01ygjCFNwBgDqgtA3fOFQazjCAYjnyjIGoA4IZqYo9QcpNf
         i1BmphTO9GL5l5gt1UBGkBZeYWFcdVCQDL1oGYzadp5Dz/UomrcJwcrAkcTiHWIYYdTK
         X0l+TEzXaSVJDk+B5a5CUEWskv07imdtqwSjIKLwnwjehD9RPOty+xdDaETjQ1tqWvD+
         AxLF5Glu2gZiGx/ayYe3DtWTbrQychiQRP+pNQIjWpGSXZlhQWsJ1ktbOaIs8j7Ov9Vj
         7hetMwJGLEpeirTZIHRDbhBIz27n0Ptn5b5bVa+IN5/x2wZlD2p0DcM/agYh7eLZqo3G
         Qj1Q==
X-Gm-Message-State: ANoB5pmAM0Ht/nwj227vheOdqKxuR+qNGroDhtqVJsTvUX9xhV1IpJIP
	6h8mJ5nrmldxfENFZJE001fS6OsAUVD4X8pTQj2kxA==
X-Google-Smtp-Source: AA0mqf59hLKHWHycEAofu9/939ZBb87HK2lBuOCJYN0Zs3K9cbu8MbXmw0OtELFZfn97VUt5D/c7xWXV2p8gd3eTyxg=
X-Received: by 2002:a17:902:f092:b0:189:9b43:a082 with SMTP id
 p18-20020a170902f09200b001899b43a082mr45842703pla.95.1670895428992; Mon, 12
 Dec 2022 17:37:08 -0800 (PST)
MIME-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com> <20221213001653.3852042-12-seanjc@google.com>
In-Reply-To: <20221213001653.3852042-12-seanjc@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 12 Dec 2022 17:36:58 -0800
Message-ID: <CAKwvOdnRQQb9YbH=MgDymBmmjYgajc8tkyjbJVxjpA5zDZpNTQ@mail.gmail.com>
Subject: Re: [PATCH 11/14] KVM: selftests: Disable "gnu-variable-sized-type-not-at-end"
 warning
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_173713_779686_A3E10439 
X-CRM114-Status: GOOD (  17.31  )
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

On Mon, Dec 12, 2022 at 4:17 PM Sean Christopherson <seanjc@google.com> wrote:
>
> Disable gnu-variable-sized-type-not-at-end so that tests and libraries
> can create overlays of variable sized arrays at the end of structs when
> using a fixed number of entries, e.g. to get/set a single MSR.
>
> It's possible to fudge around the warning, e.g. by defining a custom
> struct that hardcodes the number of entries, but that is a burden for
> both developers and readers of the code.
>
> lib/x86_64/processor.c:664:19: warning: field 'header' with variable sized type 'struct kvm_msrs'
> not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>                 struct kvm_msrs header;
>                                 ^
> lib/x86_64/processor.c:772:19: warning: field 'header' with variable sized type 'struct kvm_msrs'
> not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>                 struct kvm_msrs header;
>                                 ^
> lib/x86_64/processor.c:787:19: warning: field 'header' with variable sized type 'struct kvm_msrs'
> not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>                 struct kvm_msrs header;
>                                 ^
> 3 warnings generated.
>
> x86_64/hyperv_tlb_flush.c:54:18: warning: field 'hv_vp_set' with variable sized type 'struct hv_vpset'
> not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>         struct hv_vpset hv_vp_set;
>                         ^
> 1 warning generated.
>
> x86_64/xen_shinfo_test.c:137:25: warning: field 'info' with variable sized type 'struct kvm_irq_routing'
> not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>         struct kvm_irq_routing info;
>                                ^
> 1 warning generated.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 2487db21b177..9cff99a1cb2e 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -196,6 +196,7 @@ else
>  LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
>  endif
>  CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
> +       -Wno-gnu-variable-sized-type-not-at-end \

This is a clang-specific warning. This will need to be wrapped in a
cc-option check.

tools/build/Build.include seems to redefine that make macro, so be
sure to test it first.

>         -fno-builtin-memcmp -fno-builtin-memcpy -fno-builtin-memset \
>         -fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
>         -I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
> --
> 2.39.0.rc1.256.g54fd8350bd-goog
>
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
