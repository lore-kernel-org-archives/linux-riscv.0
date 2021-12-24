Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C893EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Dec 2021 07:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQU4EtBk35ys4pOs9NIuZrvM5q8KkP+1Ek5gZLc8e3E=; b=Ku9E/nOQ4tJ13k
	rr7ENAOWBTHyyrpcPEGaAZqglHoDs5NruEJrelWJWf3QdLTrf4gyIp4+4eNzHy71XD0je85tkFiCY
	ReiSfAPHHqfayk3io2I9BJ4HSnEFdh9jwL5rj8PP5fJJPJkZovdwz2NUr7NkycpPGDmuH1hj8Vav5
	o06L02NUL8JqHF4Ouu+p0CVuEsLtvBh8TXiF0bZwlKzjDZs1TmGcX2I2RVbIEvBczriHw+i9U4A1t
	+2O/bRYbfslY0d1EMBDMdY2n2BcvU49UU2LrcazcUcOLRpio4tYutIQVSJY8v6iMVm0Gs1yLvLb3z
	x30MLNsMrqOJyu9OPi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0f9x-00DrpS-No; Fri, 24 Dec 2021 07:38:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0f9v-00Drng-3L
 for linux-riscv@lists.infradead.org; Fri, 24 Dec 2021 07:38:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id r17so16051570wrc.3
 for <linux-riscv@lists.infradead.org>; Thu, 23 Dec 2021 23:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zehQu19sG8zPf6sTX7xbu4Pim5UWCx0QpvBAMXBdZsM=;
 b=Kc7Vq0z4QdQj5VZQWUJruEHr1vXWKQiy/GE0lgTeAHMJ4QcMlUr277gJ16+XTFn0sT
 bCYygv81STggBYOWNbKSVNP33Mf5gaXHpN6prAkGu49yN9Lc1a2AzJgDyFm+L/j6TY8J
 1TbfOhCJ5PL1CYsdhIUw1iNEc/OPIHjiNth0Rd3IIw0HtxMXHgeiVcCbcoedWKe3Uggb
 Y2P8QXdgyVAnBvghox7tN127eJJHfkYWyxMcYTGkjEHmnvin+ATSuiQ0GcZRWkcgnbPB
 UTMntwFq2Ch2n6jpZn4siAdn3phBB2Lpu8GsYvDbAQAPw6gIQzgS1cCMh0/dWS8B/KRf
 N2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zehQu19sG8zPf6sTX7xbu4Pim5UWCx0QpvBAMXBdZsM=;
 b=wUbl2iWNVvVrRYc5fhheQeyhgL7fnKSSJCoTC2gQvD8WC5mk0p8KSsB7GBTrN8bpnT
 IngOH28JLAlKp0PqxPkE2EoepJf9siFR+IU/XFTv8pnC5rJ9N8c7a6P/aJnUSI9itMB3
 OlkqQhubo0VR6457jVSTL9V1laT6/DYnqHH+orlzbO/HrYqKV966Wxkv7zM9e9zd5gtY
 ZdRElcVpGt9zDA3iRtUWT/JFA4CF9so3oau+cPpVVmkXZgJNrmDH9aqi/H0gW/BRBYMp
 LFICA1tfm8sXYSFfYerOQgR1RGo8LtfZyOLg4FaRfjiDbgSiSkhsEOvI5hgxTH25s5FO
 3fzg==
X-Gm-Message-State: AOAM532OF1p3KIvpuYfQpDoADkLa5TwbXkJhNCtjeeIEHDTZaMtui7eb
 l//85ONNZ7UVEYrY+/CwMpxbOXUHyBSkg+NWO5RONQ==
X-Google-Smtp-Source: ABdhPJyl+RLF9H+jUZa+5CGrWYy5DZy8pF9QpRofT4U/ZZybydpgrPxqo7pr1Asa3GRAZQ7HMCHf7E3gnAL6mmS40iw=
X-Received: by 2002:a5d:4d91:: with SMTP id b17mr3999415wru.214.1640331512744; 
 Thu, 23 Dec 2021 23:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20211224073604.1085464-1-anup.patel@wdc.com>
In-Reply-To: <20211224073604.1085464-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Dec 2021 13:08:21 +0530
Message-ID: <CAAhSdy2Gm96UVZhFMmbER+trrMgi-gFCpMvURR9Thb8NiNd88g@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] KVM RISC-V 64-bit selftests support
To: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_233835_208007_B270805D 
X-CRM114-Status: GOOD (  15.16  )
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

Hi All,

On Fri, Dec 24, 2021 at 1:06 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> This series adds initial support for testing KVM RISC-V 64-bit using
> kernel selftests framework. The PATCH1 & PATCH2 of this series does
> some ground work in KVM RISC-V to implement RISC-V support in the KVM
> selftests whereas remaining patches does required changes in the KVM
> selftests.
>
> These patches can be found in riscv_kvm_selftests_v3 branch at:
> https://github.com/avpatel/linux.git

This is actually v3 series so please ignore the "PATCH v4" subject prefix.

Regards,
Anup

>
> Changes since v2:
>  - Rebased series on Linux-5.16-rc6
>  - Renamed kvm_riscv_stage2_gpa_size() to kvm_riscv_stage2_gpa_bits()
>    in PATCH2
>
> Changes since v1:
>  - Renamed kvm_sbi_ext_expevend_handler() to kvm_sbi_ext_forward_handler()
>    in PATCH1
>  - Renamed KVM_CAP_RISCV_VM_GPA_SIZE to KVM_CAP_VM_GPA_BITS in PATCH2
>    and PATCH4
>
> Anup Patel (4):
>   RISC-V: KVM: Forward SBI experimental and vendor extensions
>   RISC-V: KVM: Add VM capability to allow userspace get GPA bits
>   KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
>   KVM: selftests: Add initial support for RISC-V 64-bit
>
>  arch/riscv/include/asm/kvm_host.h             |   1 +
>  arch/riscv/kvm/mmu.c                          |   5 +
>  arch/riscv/kvm/vcpu_sbi.c                     |   4 +
>  arch/riscv/kvm/vcpu_sbi_base.c                |  27 ++
>  arch/riscv/kvm/vm.c                           |   3 +
>  include/uapi/linux/kvm.h                      |   1 +
>  tools/testing/selftests/kvm/Makefile          |  14 +-
>  .../testing/selftests/kvm/include/kvm_util.h  |  10 +
>  .../selftests/kvm/include/riscv/processor.h   | 135 +++++++
>  tools/testing/selftests/kvm/lib/guest_modes.c |  10 +
>  .../selftests/kvm/lib/riscv/processor.c       | 362 ++++++++++++++++++
>  tools/testing/selftests/kvm/lib/riscv/ucall.c |  87 +++++
>  12 files changed, 658 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/kvm/include/riscv/processor.h
>  create mode 100644 tools/testing/selftests/kvm/lib/riscv/processor.c
>  create mode 100644 tools/testing/selftests/kvm/lib/riscv/ucall.c
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
