Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB32AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Dec 2021 03:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leISyzBAJe88hyx4fsaCdV1QxFmM0FYn0PdI7ulan9Y=; b=Gho9d7hroFzOgK
	pfgBzdx/1pcAOPVbVY5qxRH/khbvb8Die9lfO59F6QJol3IhtYmxggKjrlrpEi62tOtMgggmBG50+
	AjeYLzDAGS+LfjWjphD1MbRpNAwcgZzeYFy3McU1+Xa1Y82xydqCe3h2XPWdZKxwv0AAxAi9QOE5e
	DVRWgipsLVA8OaGds8kW+xsWdqtQSNb6McnO/CeLtwaqn88DpashVp4M9AeOXr4lyYAZFMsXzo1bm
	zHTvlxNEQMClgCLev0FryCXOzNn653NaJLohKl3kJ71d1RB7eu7gQY77MkDzn7KmobIqsfM10xklE
	1EEyKYLibjQqeL4xp2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvtGC-004WIR-CR; Sat, 11 Dec 2021 03:41:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvtG7-004WGo-7P
 for linux-riscv@lists.infradead.org; Sat, 11 Dec 2021 03:41:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id t18so17940496wrg.11
 for <linux-riscv@lists.infradead.org>; Fri, 10 Dec 2021 19:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EO75poJK2xgDITlrG7RVKgMYEM37BaniCA9cW2F8IAE=;
 b=UUDpGaZ4TlqJucB7PlMbEakgQYttvolbBk2bus1Xxo0uqDAkjBhl6iolgunNvqfE4U
 3KMqZsunqRx3/AcboOFf5R27X31eWeINs/lCdD0CN8XoBYreShHbrLW7XS8g2GI4cW6a
 /XIe8l8fwtz17Yzq3YFS59etRNEVvfce/S12CxewPjX9R7+NV+Mzwy55+yF8c43a8rHT
 P+B+9Bq+1n6YJYgJCOEaFak1CQozKjbeQHcE6+Objr962V5BNP2bjfK+cKL0xHYt+iYf
 8BZizLTYTR72actmkvGRv0lVG7Zz42wUizEILE+4S6d+kPg/YiunXbps391KW8V9kpk5
 nupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EO75poJK2xgDITlrG7RVKgMYEM37BaniCA9cW2F8IAE=;
 b=bDh2O2Jday7qSmwS0etHIk9ECTMbfwl2wO6eLdkzrtY5DhAdjVgxXbVv2v13LUgH5s
 o9F6tDdyKRI/hZev2R9kATNU3E2SX2RYnc7emmTarRku21xbqv09HP1Gy2PM9KzO53ir
 tAUYFfLnmQIBHjgvKYArelFx3bfUHCla8uRreo0ro+zb14+PqwIcN1/rVkdWaDHOl0jw
 gKPMVEKRUmvudERjk3lAFGxEVv2c9Qvpt0wU+n6QmzhywBvFsprukAw/8tkPHRozqJCg
 xBP7ENmPKbIetQe74VBuHoGWPFTctmeTwTEl1tbOoCeulfzgQTPnEKVbjrJ0dkmOgyhh
 eFoQ==
X-Gm-Message-State: AOAM5331oQCVqJtcqYlOKG4BEGwURvdBdH0/mi5U1RlKIP/iKZPxJ/S8
 GbVW/Ot5LuXkWEwIOgZ6NtsFHB/uiHpI8iad03cFtQ==
X-Google-Smtp-Source: ABdhPJxU5WTGxoPImoqEQQ34iwc3zq+NMIe3iv94HfKYLahaxjZujpAul0sWWjXgr8vVvi8pSAKSsitBxMOpHCyl5ZY=
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr2303012wrn.690.1639194072549; 
 Fri, 10 Dec 2021 19:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20211129075451.418122-1-anup.patel@wdc.com>
In-Reply-To: <20211129075451.418122-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 11 Dec 2021 09:11:01 +0530
Message-ID: <CAAhSdy3S5HAYh24mH7JpZKSnk4Vjrw2SJToAHaMjyegwiR4XXg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM RISC-V 64-bit selftests support
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_194115_404188_65DAD455 
X-CRM114-Status: GOOD (  13.96  )
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

Hi Paolo,

On Mon, Nov 29, 2021 at 1:40 PM Anup Patel <anup.patel@wdc.com> wrote:
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

Any further comments on this series ?

Regards,
Anup

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
