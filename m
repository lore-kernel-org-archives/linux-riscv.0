Return-Path: <SRS0=UGSk=BF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F04C433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2020 12:49:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A792076A
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2020 12:49:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kdJ7/NSL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="gwsElXHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70A792076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rxeoDRwf9aKOTY7D3ekms4JUSlH2fOH/lQ3PtTj5y0c=; b=kdJ7/NSLujI6TuRFQaGKSdw/T
	QeoaKwPTmTfH47yj9/hP/kCS5DxilfNnCbJ5jDlD5exlCGkMhLxagk+2Ci/8A6gjpnjKPnVt9doO0
	1Yhy/mAj5tRKWmGxTiaLZqFVJ+DYx6h5nRtofp+IolaiFGKcV8ti43btUdRjlQaIRhcnWviDuzHvw
	6CJdAoJmVZeobH834pb992FGfF68WY1jNsZm0YbdTeHySOkjj+BjXUgfH1Q2FyYJfBmvXkdVHgRSO
	GXrofkVxI+sN2S4Tv4bvJsCnEX/GBw5iURBELhVThBtd8X4LfdMk0GLkpOHDTT/aCOHiNO8hbpYch
	L2uFbWKIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzg5G-0003Bl-9w; Sun, 26 Jul 2020 12:48:54 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzg5E-0003B3-A6
 for linux-riscv@lists.infradead.org; Sun, 26 Jul 2020 12:48:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id t142so5769172wmt.4
 for <linux-riscv@lists.infradead.org>; Sun, 26 Jul 2020 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rCLczGQIxWKiTkxHU6NiarIhxc9Z+JmjQxED80qEJss=;
 b=gwsElXHX2E2bUDww3ab3IoZnn76R5AZW2fLMad++U/SfNz2BQysjn9tmQWLc68si09
 vjvfu12vgyKudVHKrUiZ5jfldqlKc8Wj28ZbK0upIQvgG5/tXeW3EpZimmGZGW2ExcKJ
 qP553zFfDrJdUvHw8f0LhdqsapqLZD7UtlzRre2tgNZMRe2O+1x8zy1B8/0hCRv1kHxv
 YPkUSzFVgMQNOnLyjSHr+G4o/H9zQ9UtallmpbnPciV2SfNw8hqZ5/VHB4SBaosZh/vD
 01OTENe/iN0DPo/jtmvNS4QD/YrdszGynX1Fb+bIQnmFxhzWGbsV1U1nzbekl4PX/7Qr
 NIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rCLczGQIxWKiTkxHU6NiarIhxc9Z+JmjQxED80qEJss=;
 b=MPNtb42/J9XWH8pqYmmwLqFCcixDmJrQkspRXpy7kNOyZWahMS+REkDwtcH30Up2lP
 ex38b5O5qnquoz4d496lmrdPlb0cqGBtrLOyBLlu2W7X+e7BeL4oD8hwtYmHkEVeTNEv
 TGdMCzbUzGVAzI6MAvKLNEcShlDQx+RbtNPVmNd04ZHnBtXbPPRuIzCZZNDaY0IO57Zs
 TyNHv4XrPU5Avr+lbXBd5R5UleBFoXqspMzaVrOPxzN+FZBw9uK4VYaS4kweWT1zGvMx
 Gx8cuZGvUIWC5H/tSdCNhEIJWBYCJpzfkI04moSL2ygplJbRkiWu918BzYSuPIFVn5Mr
 nmkA==
X-Gm-Message-State: AOAM5336Y/QaXynGUERrKdSajanS9FPHWcSlTTPcuqQc6g1enisiqgoW
 zDqXb9hNNfG9z32BmPoW6Cg8nuv0GJ7gL0LpHORyxA==
X-Google-Smtp-Source: ABdhPJwhqkhQturWmZRFMqSZv9GNE6rrK3X7LahzNQkb0Zo4Tkad6SpMIBWX4YYc/OAmqOhmFgHIsVezEkmX8Si7Pes=
X-Received: by 2002:a1c:6689:: with SMTP id a131mr5266820wmc.157.1595767730427; 
 Sun, 26 Jul 2020 05:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200724085441.1514-1-jiangyifei@huawei.com>
 <20200724085441.1514-2-jiangyifei@huawei.com>
In-Reply-To: <20200724085441.1514-2-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 26 Jul 2020 18:18:38 +0530
Message-ID: <CAAhSdy08NEMR2jjJ-FVixyWMOpQ4+V-P9k2xuyO+Xu5OWKrmFQ@mail.gmail.com>
Subject: Re: [RFC 1/2] RISC-V: KVM: enable ioeventfd capability and compile
 for risc-v
To: Yifei Jiang <jiangyifei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_084852_480770_53C22062 
X-CRM114-Status: GOOD (  12.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 KVM General <kvm@vger.kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 limingwang@huawei.com, Atish Patra <atish.patra@wdc.com>,
 "Zhangxiaofeng \(F\)" <victor.zhangxiaofeng@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, wu.wubin@huawei.com,
 "dengkai \(A\)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Please change subject to:
"RISC-V: KVM: enable ioeventfd capability"

Also add 1-2 sentences of commit description.

On Fri, Jul 24, 2020 at 2:25 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  arch/riscv/kvm/Kconfig  | 2 ++
>  arch/riscv/kvm/Makefile | 2 +-
>  arch/riscv/kvm/vm.c     | 1 +
>  3 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 2356dc52ebb3..95d85d893ab6 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -4,6 +4,7 @@
>  #
>
>  source "virt/kvm/Kconfig"
> +source "drivers/vhost/Kconfig"
>
>  menuconfig VIRTUALIZATION
>         bool "Virtualization"
> @@ -26,6 +27,7 @@ config KVM
>         select KVM_MMIO
>         select HAVE_KVM_VCPU_ASYNC_IOCTL
>         select SRCU
> +       select HAVE_KVM_EVENTFD
>         help
>           Support hosting virtualized guest machines.
>
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index b56dc1650d2c..3ad46fe44900 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -2,7 +2,7 @@
>  # Makefile for RISC-V KVM support
>  #
>
> -common-objs-y = $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o)
> +common-objs-y = $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o eventfd.o)
>
>  ccflags-y := -Ivirt/kvm -Iarch/riscv/kvm
>
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 4f2498198cb5..473299e71f68 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -52,6 +52,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         int r;
>
>         switch (ext) {
> +       case KVM_CAP_IOEVENTFD:
>         case KVM_CAP_DEVICE_CTRL:
>         case KVM_CAP_USER_MEMORY:
>         case KVM_CAP_SYNC_MMU:
> --
> 2.19.1
>
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
