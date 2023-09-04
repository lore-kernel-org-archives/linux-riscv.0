Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DB6C83F3F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6RJ42TnpW0jmAVgCwJ8mxH7ALSqfgki0lB79WbUt30=; b=PEeuVNg73tS+SG
	t82jHwldt07p+SunWXGsAoG8UUlJ0oeNsS4NqrvRiA1jAroClVbSRZsPQNnJ3ae7sBUF3R2hMMA77
	0zxXIEIsp+awfRi14wAZMaZ2OTYsljXwSoGVNw6V80DNbGpjj1rHICDLum4U9qI4HaMO3K82Kbbhy
	h6iwjkrYUb61S+GxQ72MqSW4YUJx6eDKHv4uEf1VSKunJ70z0f4TgLmyl227G83YbXKUwFI5P2u+B
	exHGQ9fqGknbtSurl2DQeV26btww3TYZeuHJSk901RsCv642hbl4QsuRJP250z/IQOiCNb5wkmo1t
	BEDZ/KfH6gh6MNIqEd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd7Yt-003z78-0Y;
	Mon, 04 Sep 2023 11:16:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd7Yp-003z5r-2g
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 11:16:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-313e742a787so818391f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693826161; x=1694430961; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9GCAlEvdvaQhIuQIQlH6uZieVhDq0JG0Q/Lab40q3Y=;
        b=n3yFjOEWMnVje2jozvVCG7dssfADJmXKyb/M4iVxHtVqzhZPUwJwDRSfXF3V1Om+la
         UgmtmIkYEnxPMSk8KbopX/OIw2JFb840r27RWkOd8IIdi+/FaqrxuR8N/U3AoxCYgvdH
         ekS5dhAOgszTZCHAh7uLmlrSapQyY7KovRZ/agV4jLZ8UohQNGt+suVTwjNSOpZJyUQh
         iKFMg0c0THeMlGXNKHRUn8EYqnAFy4MpfnwNsIZmR7xuN5p4FDr6X/utlCPwlda65GLo
         3SXIEu0YQ1gqLG24Yk0twLIa5tStChwfoKMLpMiLj+d6tE8yWD7zaqM4y2RaUQGV2nWr
         I1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693826161; x=1694430961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9GCAlEvdvaQhIuQIQlH6uZieVhDq0JG0Q/Lab40q3Y=;
        b=aZkEe1z+9EesGmF5SBEQO+io/NrorPEnHy+SVdgStrBhpr7kSRqh9sM7r+id1kxIa4
         61ZCLM3+21iSafTsQV02enGkothRc+lwYDZRUE31kVNwOIxeNixsxyl4PYVBO8Vt25Ii
         6JvrgSGVTLIHwA4eNticzABc2BoYvMbXoOkz9pWADwZ11BplPF+2qSrTOPiYG+hLs4F6
         XML8urP6Cj959KRM7dw/LiSOSLyhR0iTdwAks4Va9aWZLpB+PtPm7k+QA5DN9FNdTft2
         /o9GIHeW6Y8DUOwkBtArtBp/TCqR0ZFEhRzMBD+5tGXw0c0TRl57wiiTFARl0FbQQEql
         ZsCQ==
X-Gm-Message-State: AOJu0YysYgQSNeIqGi3ybDcAm/naYLEnswCZTzUHd6rtkMJHeOWGT0PZ
	XiB1AaLirHBw3Q19mt4qiLpFTA==
X-Google-Smtp-Source: AGHT+IHR3qJF/WADy7jFXe6yIqtW0lGNRVyiw5VlYSS4H2pPf8Rp4EorJnHY9mZBl7rKv7MV9xXpWQ==
X-Received: by 2002:adf:ee90:0:b0:319:6b56:94d9 with SMTP id b16-20020adfee90000000b003196b5694d9mr8511545wro.2.1693826161050;
        Mon, 04 Sep 2023 04:16:01 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x18-20020adfec12000000b0031989784d96sm14281097wrn.76.2023.09.04.04.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 04:15:59 -0700 (PDT)
Date: Mon, 4 Sep 2023 13:15:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Greentime Hu <greentime.hu@sifive.com>, wchen <waylingii@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Lei Wang <lei4.wang@intel.com>, Vipin Sharma <vipinsh@google.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Like Xu <likexu@tencent.com>, Peter Gonda <pgonda@google.com>, 
	Thomas Huth <thuth@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, 
	zhang songyi <zhang.songyi@zte.com.cn>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/8] KVM: selftests: Unify the codes for guest
 exception handling
Message-ID: <20230904-ba5051a5bf17d17f2711d7dc@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <7affb0387d7272573f7093de7887872e1fb5979b.1693659382.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7affb0387d7272573f7093de7887872e1fb5979b.1693659382.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_041603_891806_53A262B7 
X-CRM114-Status: GOOD (  14.41  )
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

On Sat, Sep 02, 2023 at 08:59:23PM +0800, Haibo Xu wrote:
> Rename the vm_init_descriptor_tables() and vcpu_init_vector_tables()
                                             ^ vcpu_init_descriptor_tables()

> prototypes to vm_init_vector_tables() and vcpu_init_vector_tables()
> respectively, so that we can use common names for the architectures
> (x86/aarch64/riscv) and then put them in a common header.
> 
> By the way, vm_install_exception_handler() prototype were also moved to
> the common header since they are commonly used across the architectures.
> 
> The patch is a preparation to share the guest exception handling codes
> in riscv.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/aarch64/arch_timer.c          | 4 ++--
>  tools/testing/selftests/kvm/aarch64/debug-exceptions.c    | 4 ++--
>  tools/testing/selftests/kvm/aarch64/page_fault_test.c     | 4 ++--
>  tools/testing/selftests/kvm/aarch64/vgic_irq.c            | 4 ++--
>  tools/testing/selftests/kvm/include/aarch64/processor.h   | 8 +-------
>  tools/testing/selftests/kvm/include/kvm_util_base.h       | 7 +++++++
>  tools/testing/selftests/kvm/include/x86_64/processor.h    | 5 -----
>  tools/testing/selftests/kvm/lib/aarch64/processor.c       | 6 +++---
>  tools/testing/selftests/kvm/lib/x86_64/processor.c        | 4 ++--
>  tools/testing/selftests/kvm/x86_64/amx_test.c             | 4 ++--
>  tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c   | 4 ++--
>  tools/testing/selftests/kvm/x86_64/hyperv_evmcs.c         | 4 ++--
>  tools/testing/selftests/kvm/x86_64/hyperv_features.c      | 8 ++++----
>  tools/testing/selftests/kvm/x86_64/hyperv_ipi.c           | 6 +++---
>  tools/testing/selftests/kvm/x86_64/kvm_pv_test.c          | 4 ++--
>  tools/testing/selftests/kvm/x86_64/monitor_mwait_test.c   | 4 ++--
>  .../testing/selftests/kvm/x86_64/pmu_event_filter_test.c  | 8 ++++----
>  .../kvm/x86_64/smaller_maxphyaddr_emulation_test.c        | 4 ++--
>  tools/testing/selftests/kvm/x86_64/svm_int_ctl_test.c     | 4 ++--
>  .../selftests/kvm/x86_64/svm_nested_shutdown_test.c       | 4 ++--
>  .../selftests/kvm/x86_64/svm_nested_soft_inject_test.c    | 4 ++--
>  tools/testing/selftests/kvm/x86_64/ucna_injection_test.c  | 8 ++++----
>  .../selftests/kvm/x86_64/userspace_msr_exit_test.c        | 4 ++--
>  .../kvm/x86_64/vmx_exception_with_invalid_guest_state.c   | 4 ++--
>  tools/testing/selftests/kvm/x86_64/vmx_pmu_caps_test.c    | 4 ++--
>  tools/testing/selftests/kvm/x86_64/xapic_ipi_test.c       | 4 ++--
>  tools/testing/selftests/kvm/x86_64/xcr0_cpuid_test.c      | 4 ++--
>  tools/testing/selftests/kvm/x86_64/xen_shinfo_test.c      | 4 ++--
>  28 files changed, 66 insertions(+), 70 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
