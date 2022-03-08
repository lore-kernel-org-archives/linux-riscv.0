Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44E4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 05:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpMOXYuP3TSuY30zyZA8bbuRfkOqpye2wlEZS+/8fck=; b=cmhgr7z5jgYW2G
	wBV0dIQOE7CR5/W007c8RUrG0Cv4eonf1Mq0M36uig5p4gdiDk9scBLMFya5WfA5DKDW/HFNtXveq
	aKpUEDC81Zx6U25zJjRstTdDJOb4KmdvEM14UJSzyXhDkk4jwh4rpYYoSGH8ZGSIJXH9VkyrVVGFz
	G5nOUW/yD8mIUU+UaSaw8yfb0VyTErhAUWdfeilDAlNZunfswKgYUddFRQtcOz71WTxOJKrny2QQs
	8OrjubqfX2oQU2qE6I9+z8JeR2rbu5Aw6HbhZECGTLqhvH3L/upeLjiA0Al+pIi19y7ceOqjdJ8VK
	tPJw2HnoMjTlE6dGSW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRSqy-002jQl-H8; Tue, 08 Mar 2022 05:57:48 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRSqv-002jPH-K3
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 05:57:47 +0000
Received: by mail-wr1-x431.google.com with SMTP id i8so26667915wrr.8
 for <linux-riscv@lists.infradead.org>; Mon, 07 Mar 2022 21:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIgw1CeMnBUIL/RC29fGtIeWMwiFcbnmOLdGCa76gaY=;
 b=dyvq9P0JTvA5h9bwOZCVBY5lenifpgc/O9PVmslobo52K48eIMdPbQL3M6uKNg281M
 +lkM0gl7OVKvD7qvptTyaWiBj99ozuZByicKHUS5T7G1Iak5aNnOrh6oDpNFvmch18YF
 UiYbwAV5ql7/skjeygZ03JFBTPS8LbT3TShde2YV9aMc/w526q9nwjdiAbNcOKBVuZFM
 LTBM/yoLYFCr+So/Gqt2O7XHXe9JoymfvZBYu3asQGaV2917CGOOH4GrlnZ/q52zuiKN
 u1GG+8BvXTdm3oZWlTi47HUQ9fzztnkbktKIRb4ysX785/wQrwIM6jdxBfjiy2TjJqcc
 fe3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIgw1CeMnBUIL/RC29fGtIeWMwiFcbnmOLdGCa76gaY=;
 b=33T05kS7holw20KE1lqAS0K16ZB9VVOZqm9Yrwuru3iFBKufjsfeBmN5Cz5CsB/6np
 jAU3Wubp9sP5aNHjjtQgYs7iF21Gx8772VEb5TCdo37IsEuQzvhTArYGMgB+16MgSheZ
 vE3AiPsdDtOkhy7I3q845rJs2lSBczcgy7j7yNFlXyh54iUGK11O3rN57ji0YUvSskqG
 o6u+5xQB5eilDjD0MhkObACahpzk02EVguLG9jLT+FTZYrd5qFLLtAt/cj2TGRmSQ6ko
 IsuvQyU/SZHhp8SSuLTfDJPoGWZl6JIlYFZHUqUbOkxOC84PmtAVkwjl9hiHNwj4n04l
 0vyQ==
X-Gm-Message-State: AOAM533y8lmIvbl/P112s/GULfHFdV5Q6/oimpCzHgZ2fIP6Ne45DLaU
 ErBKmp4fxhkKPIxJMSVMtL3ffR2cN1yeF/QM2emGzw==
X-Google-Smtp-Source: ABdhPJyWy1Uyhyu9cuDZx89dRaND7TYseZQ1e/hZSNiya6vyhdBIBdrrXDP7oYGdjQ+148oOJJ8ZEA6K8aOTFu9rDjg=
X-Received: by 2002:adf:b60c:0:b0:1f0:227d:bce with SMTP id
 f12-20020adfb60c000000b001f0227d0bcemr10946306wre.313.1646719062630; Mon, 07
 Mar 2022 21:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20220201082227.361967-1-apatel@ventanamicro.com>
In-Reply-To: <20220201082227.361967-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Mar 2022 11:27:30 +0530
Message-ID: <CAAhSdy3JwLyOoNOubAS2VusNdj6O-CJJNSs+mM8+NvKErtAdmw@mail.gmail.com>
Subject: Re: [PATCH 0/6] KVM RISC-V SBI v0.3 support
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_215745_752777_A2AC2F8B 
X-CRM114-Status: GOOD (  13.36  )
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

On Tue, Feb 1, 2022 at 1:53 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series adds initial support for SBI v0.3 which includes:
> 1) SBI SRST support for Guest
> 2) SBI HSM suspend for Guest
>
> The SBI PMU support is intentionally left out and will be added as
> a separate patch series.
>
> These patches can also be found in riscv_kvm_sbi_v03_v1 branch at:
> https://github.com/avpatel/linux.git

Queued this series for Linux-5.18

Thanks,
Anup

>
> Anup Patel (6):
>   RISC-V: KVM: Upgrade SBI spec version to v0.3
>   RISC-V: KVM: Add common kvm_riscv_vcpu_sbi_system_reset() function
>   RISC-V: KVM: Implement SBI v0.3 SRST extension
>   RISC-V: Add SBI HSM suspend related defines
>   RISC-V: KVM: Add common kvm_riscv_vcpu_wfi() function
>   RISC-V: KVM: Implement SBI HSM suspend call
>
>  arch/riscv/include/asm/kvm_host.h     |  1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  5 ++-
>  arch/riscv/include/asm/sbi.h          | 27 +++++++++++++---
>  arch/riscv/kernel/cpu_ops_sbi.c       |  2 +-
>  arch/riscv/kvm/vcpu_exit.c            | 22 ++++++++++----
>  arch/riscv/kvm/vcpu_sbi.c             | 19 ++++++++++++
>  arch/riscv/kvm/vcpu_sbi_hsm.c         | 18 +++++++++--
>  arch/riscv/kvm/vcpu_sbi_replace.c     | 44 +++++++++++++++++++++++++++
>  arch/riscv/kvm/vcpu_sbi_v01.c         | 18 ++---------
>  9 files changed, 125 insertions(+), 31 deletions(-)
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
