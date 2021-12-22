Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554FBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfpGMoqOLcfNdSTo6RpQHXisOxrH2QLce4qjTuuOx4k=; b=NDzLT8rf+fCU1m
	irCeOKAY3iM/7ujLRZQ64/9QYzskEW7ojDMmI8pmm079rBke1Vl7c1+D84pPnnl+9PedeA/N6LUyO
	BleGeNBXqnk6jy5I4fH7ltCkLfs0PasqjxczYO85iVd4LIQi1Cj9FQVAqSWbXL7/LpKGxj9N0ijO0
	FqBYJ9+LVvEkVY/ER3mAwHRW4Z/AsgxZJNv4G/vAoCG+r5LTnTWfHo8QA6DqkcxCtErvIoZxxx6Ze
	1R0XYgQ5l5YHjnV0gGcJQr/BLyF11Z8A2y/6kN8RpAQ6AE2d/vTzcEg/31UWCpxhO3jnHQ2yL7neQ
	qQU54aV8G0Az7NPjHUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzxLB-009lRl-Q6; Wed, 22 Dec 2021 08:51:17 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzxL7-009lQD-UT
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 08:51:15 +0000
Received: by mail-yb1-xb31.google.com with SMTP id j2so4506477ybg.9
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 00:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m4bMyDhMjrW7YP3vP6EP7M7Hq9hif6A8RG1x3CwDWSE=;
 b=fOPoQSfg9A1N9bBJuTfwQYXKk80Zk1ZWyIC4Djoo7itH4idBIrSa68ZFFbjZBI8KXj
 obOL3n3EoCAvAfhwLF7wegn2J6fL3D5MaoQ+j7OkMDRoXYBflLXTn96N1l97z+rpu1fJ
 nbVKBgDZeRegAG2HqwRHfylaBAmiIwpWWr8Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m4bMyDhMjrW7YP3vP6EP7M7Hq9hif6A8RG1x3CwDWSE=;
 b=FRre43zIGS+vOJgJjEy5qFUvUwC0MoO0K5K71RwBeZVSpFq0BdRlOyXc6g5rT/Q+E/
 vM9xhSC1dWyeQdDIgPuEUwitxZju8CSlc5JRPrZCJJzq3I/0OQnUDSLXD5QJ30lZ+tcL
 AaAm+APx2AL9W8GHVbZA8q7VwlFzAlWG8lmMjLlXzrqq5kwu9a48PnuVpk76BpHLAVKh
 Z6vmZSXjST/JITvNevxZKbLTQu7f1cSfkqSvOwet20kpu+MQYIAJ/CyT3IRrX6lNzif2
 /gMtte8aroP71cF1uRWnDMkVthhH8IMyNbmpSdGyt2eu1qxyOVjdgwHfVM9w1k3cJndA
 al1g==
X-Gm-Message-State: AOAM530XnC4/KJPrTa0LL4FKo0tZSec2lKxqqrm22RZSymhHAtnTUPIG
 Q7xA6iswHSmnAYvp9JFucvIl1RXzLlJAaixF0kme
X-Google-Smtp-Source: ABdhPJzdC7YX0iNUuQiVueEYuv3Xd0/ROt59yvLbD0RAiuHFxH0gOhyt+/pTp0f+VcjsQnQX34B36SNPf+yH6w2i6g8=
X-Received: by 2002:a05:6902:568:: with SMTP id
 a8mr3252723ybt.472.1640163071850; 
 Wed, 22 Dec 2021 00:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20211129075451.418122-1-anup.patel@wdc.com>
In-Reply-To: <20211129075451.418122-1-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 22 Dec 2021 00:51:01 -0800
Message-ID: <CAOnJCULms0Xn3d4d9Rb90L0ACn7iJj9e4OQmxL_ACbirMX4K1w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM RISC-V 64-bit selftests support
To: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_005114_024306_9FC1BC72 
X-CRM114-Status: GOOD (  14.30  )
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

On Mon, Nov 29, 2021 at 12:10 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> This series adds initial support for testing KVM RISC-V 64-bit using
> kernel selftests framework. The PATCH1 & PATCH2 of this series does
> some ground work in KVM RISC-V to implement RISC-V support in the KVM
> selftests whereas remaining patches does required changes in the KVM
> selftests.
>
> These patches can be found in riscv_kvm_selftests_v2 branch at:
> https://github.com/avpatel/linux.git
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

For the entire series,
Tested-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
