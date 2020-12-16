Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B3CC4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 06:40:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CCD32313F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 06:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CCD32313F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x1GXzSkY0kCAPnRQoSUJtK7D14tfmfWz+D5Rzhy2KWk=; b=3Ggaev5kfOX4NtBR6ZUqP+Sua
	2r+vqSxTIpxgLQbf2fTBSfVRUEIzRK9U/2Q4WACPUqnjlflFyHKVYBE6ztX7p8eV3yM8A3SURSXM+
	5Y5E+6TH3Ftvf15MFe4NinGVSHlh+8jiLCRKmyRgqZwA62b2O16lL2CqoU4zhbkp706/oRc36eNXS
	MjTdYb8V00z52ANin5JXtyAwDjnkzsEwNfIMLZt5hoHykacwAbVLAhFfeZoCCWrP4sKkaP1ynh/10
	C0KR+ZRp+WNoEvDznoekIaFv9zhIbhqoCmZsoKz1aFvZmQTCruwuxAAnGqe5u21C8xHYeZfb78L3R
	F0g/TrfcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpQTb-0004EZ-6y; Wed, 16 Dec 2020 06:39:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpQTX-0004Ds-OC
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 06:39:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id q75so1307974wme.2
 for <linux-riscv@lists.infradead.org>; Tue, 15 Dec 2020 22:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2WX4BJNgPr14mjH5ANRJS9xRn9sZjWoS3pkajHG8ik=;
 b=t9Jk6TN+Xdn7N2J4C9Ul6oyPqO8ZAgwiJ/3y8T8GedM5a5cf5xYyPdM9pHU0GfS7oa
 ct0gLiBiaOAt2BNf+5bXAPAdKD1RrerKcVhA2LzMPJQoAIcvwAeqVXr/mKmXP226mkYb
 ahRQNGQOED2ZwbPTBjEGCy9rsybOSXLtHfTC+QblOyZdctdEvz/KZVgmg5GLm7odTL6v
 UHdN8qIvbWte8niqnnvElbF7jmWMiMNUYcALmRKh7Q3ZL1rqldfcTWIvq6U2vSjnNYzV
 YCtLRY86IUmdsBuPF4qzayylXHbqTRqVMl/E5C86IQ/yOrH0GC3PHps/hu4S3fn6vo6C
 kTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2WX4BJNgPr14mjH5ANRJS9xRn9sZjWoS3pkajHG8ik=;
 b=aPSr5nrkKfX7Wsu9V+OIRUCWBXk8GRrUBllw36mVJbZ2NNOCA4NAQLAmPc6lxNhtAQ
 IBt5VsHavqlQEPZyeQPI2NpPPX3irWzZmRus+7//CAiSs1ci3erxu4y5hkK9e7t96WV4
 RfbB95SXBz6D7DklI4x4lIqOmssrcC2POMwOs1Yi6AVSjZpZqBNXdluZ8fjb+4Gewpvq
 RsZVj3sBj3jlW8RGhSkC6e7ApsatHV/gzd2n9OAmSxHm6wRa5FAtiA6oKwr1za7CBelO
 05q6+UGNoPtPP3UwER7Fo9oGw7g61e5Yxo2fu+zKUNSP9UQg7dij3qXKziLf3Ufcztxk
 V3/A==
X-Gm-Message-State: AOAM533JQ++8Sp5K4J6uZi2dL4rPWzNdBRQNNLAjQfkt9Bti4+eM4XnM
 N2KAB01UWa7b3iI8HGhe+zNeukRUyCfYho9qOKd4gA==
X-Google-Smtp-Source: ABdhPJza0WaG4LzV9VqnXDbFNlAIslEWZ15sdQNLzO6N6ZZqXpkshRy9WqBSeh0M06scmtdZwHOPfU+RfMG2qA3C50A=
X-Received: by 2002:a1c:7f52:: with SMTP id a79mr1654697wmd.157.1608100790213; 
 Tue, 15 Dec 2020 22:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20201203121839.308-1-jiangyifei@huawei.com>
In-Reply-To: <20201203121839.308-1-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Dec 2020 12:09:38 +0530
Message-ID: <CAAhSdy2zdwfOGFUtakhbeDUJBapz6fWPnQptT7nCdyFMSoLyGg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] Implement guest time scaling in RISC-V KVM
To: Yifei Jiang <jiangyifei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_013952_064918_CCA614F2 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: kvm-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 KVM General <kvm@vger.kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>,
 "Zhangxiaofeng \(F\)" <victor.zhangxiaofeng@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, yinyipeng <yinyipeng1@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Wubin \(H\)" <wu.wubin@huawei.com>, "dengkai \(A\)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 3, 2020 at 5:51 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> This series implements guest time scaling based on RDTIME instruction
> emulation so that we can allow migrating Guest/VM across Hosts with
> different time frequency.
>
> Why not through para-virt. From arm's experience[1], para-virt implementation
> doesn't really solve the problem for the following two main reasons:
> - RDTIME not only be used in linux, but also in firmware and userspace.
> - It is difficult to be compatible with nested virtualization.

I think this approach is rather incomplete. Also, I don't see how para-virt
time scaling will be difficult for nested virtualization.

If trap-n-emulate TIME CSR for Guest Linux then it will have significant
performance impact of systems where TIME CSR is implemented in HW.

Best approach will be to have VDSO-style para-virt time-scale SBI calls
(similar to what KVM x86 does). If the Guest software (Linux/Bootloader)
does not enable para-virt time-scaling then we trap-n-emulate TIME CSR
(this series).

Please propose VDSO-style para-virt time-scale SBI call and expand this
this series to provide both:
1. VDSO-style para-virt time-scaling
2. Trap-n-emulation of TIME CSR when #1 is disabled

Regards,
Anup

>
> [1] https://lore.kernel.org/patchwork/cover/1288153/
>
> Yifei Jiang (3):
>   RISC-V: KVM: Change the method of calculating cycles to nanoseconds
>   RISC-V: KVM: Support dynamic time frequency from userspace
>   RISC-V: KVM: Implement guest time scaling
>
>  arch/riscv/include/asm/csr.h            |  3 ++
>  arch/riscv/include/asm/kvm_vcpu_timer.h | 13 +++++--
>  arch/riscv/kvm/vcpu_exit.c              | 35 +++++++++++++++++
>  arch/riscv/kvm/vcpu_timer.c             | 51 ++++++++++++++++++++++---
>  4 files changed, 93 insertions(+), 9 deletions(-)
>
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
