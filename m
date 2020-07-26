Return-Path: <SRS0=UGSk=BF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6497AC433E3
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2020 12:59:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 302672065E
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2020 12:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gJPnRhAj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="e3qylBuP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 302672065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qH37ZUyyfJfhUHAtJ72DdCvpj6kYx5tS/LjBLmqHoss=; b=gJPnRhAjC1GKZgGAuFJeVJc4c
	P/EXrGFaNa9uFU6pGhEA6AX0lZAVAP6E7nWeWNU5t54tQJI/qh8ASfqgWdDDoIHy+dCR71EpPzaFE
	xfmceKKY5C6xftWD28JSrvip7g9TcnIc3UwN5M8kt1IGQ6FVsft/xmmImI5ki0iIsX0cpG2p7YSVH
	natGhWA4dorb7WGQRUL/Qy9EngHDaAsoSVVcR89bxGCYjq4UfElT5GYoMPA6nlXfvcyLuj7U1RpLz
	dh3+Nqb8ktz/6rFvWMS+cL9C9OFUUvPpV/6+sOvREQr1VfEqKSRs5fRuM6QTjusELAMyyHVeJ6ezW
	4Y0hUi7jA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzgFE-0004Xw-4x; Sun, 26 Jul 2020 12:59:12 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzgFC-0004XG-0s
 for linux-riscv@lists.infradead.org; Sun, 26 Jul 2020 12:59:10 +0000
Received: by mail-wr1-x444.google.com with SMTP id a14so12270361wra.5
 for <linux-riscv@lists.infradead.org>; Sun, 26 Jul 2020 05:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aJ0QTk1kAr2FXG3tNKxMDTj3E6xC0tBqD5CEm/p3JFE=;
 b=e3qylBuPPyd36kYi09rS61kEhLJtEb/XiQOym4M3xymiMBeoHEsRYf7Cl7PEyEpyzg
 c6RjEdgiKjPRk80f99amxldvIWn8kAn2HrIK+4WB97VzHtKsfAq4IidLgJqkLaPb8vf2
 lgOrGq2sfuOHdd2NQeeywpEG7BhiYWAOtFlnHV9PhGwA855BfYE19uhn8Cud4Mvvd23l
 pKb4vFdCWBWOzwXwFnKBv/Wod/PlT0wyvHouPqYCoQQpUfqTUYylmYyoq5AYUZC3dbBp
 LxEonSSWb6BKqUxWs+cLg65BjTqzXH6n5wq0JqZqrEzIBxAzVyPpSfVirsjtlJylWK0p
 256A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aJ0QTk1kAr2FXG3tNKxMDTj3E6xC0tBqD5CEm/p3JFE=;
 b=q3s81BtyQhhN+n3U1ISKAbI96XDKKsxpGa+1iyEW3V6r1YzXbcFAnWbGEW+DEz3JRh
 fonE9Mj9/iObmpQi2HR3OO8kyUqOowp5B/T7tsiU/koAylFlcbptJNZz2NWcvK0gopd+
 R64nn0mbI2gusifRMAbgpdowirRXAu0v8pvXd58HES/e7/lAjpdcovF4YB3TdnVKIAii
 /+sw7b+8hdHa9QmAyyC84zZI2GJdjSCm8qgqPtpVTCLD5PLq6m6v4t8XakO8ODTZMGmt
 qieiRTNkUm8aB4nNeiHeyQVdQ5WFbexJhFbpylGGmpyOi4qcci+v+z9alZngzViVkOZx
 cGhw==
X-Gm-Message-State: AOAM531I3KIMnMu9Cr2kEvi8LRBgqTe3mEzafX1Lt8euv+Jah7BUruni
 SuK1CF5p0JRg/ENTGOESv+x3fop7bgnbkdopYs7d2A==
X-Google-Smtp-Source: ABdhPJwkwpK6Km+ushc9A1CmJalY7YDxkaZpWvaeV6P1vmcPyklRXsQahQs5E1vm5UD0ctxrGufZWxwQaQTBXHNbh18=
X-Received: by 2002:adf:f186:: with SMTP id h6mr16468220wro.144.1595768348627; 
 Sun, 26 Jul 2020 05:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200724085441.1514-1-jiangyifei@huawei.com>
 <20200724085441.1514-3-jiangyifei@huawei.com>
In-Reply-To: <20200724085441.1514-3-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 26 Jul 2020 18:28:57 +0530
Message-ID: <CAAhSdy18+3ub9Lw+2v0WEujYkFJ2yU0x=GqZ+PQGe2DrWCR8Bg@mail.gmail.com>
Subject: Re: [RFC 2/2] RISC-V: KVM: read\write kernel mmio device support
To: Yifei Jiang <jiangyifei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_085910_104905_1710D100 
X-CRM114-Status: GOOD (  16.86  )
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

Change subject to:
RISC-V: KVM: kernel mmio read/write support

Also add 1-2 sentences of commit description.

On Fri, Jul 24, 2020 at 2:25 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  arch/riscv/kvm/vcpu_exit.c | 38 ++++++++++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index e97ba96cb0ae..448f11179fa8 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -191,6 +191,8 @@ static int virtual_inst_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  static int emulate_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                         unsigned long fault_addr, unsigned long htinst)
>  {
> +       int ret;
> +       u8 data_buf[8];
>         unsigned long insn;
>         int shift = 0, len = 0;
>         struct kvm_cpu_trap utrap = { 0 };
> @@ -272,19 +274,32 @@ static int emulate_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         vcpu->arch.mmio_decode.len = len;
>         vcpu->arch.mmio_decode.return_handled = 0;
>
> -       /* Exit to userspace for MMIO emulation */
> -       vcpu->stat.mmio_exit_user++;
> -       run->exit_reason = KVM_EXIT_MMIO;
> +       ret = kvm_io_bus_read(vcpu, KVM_MMIO_BUS, fault_addr, len,
> +                                                 data_buf);
> +
>         run->mmio.is_write = false;
>         run->mmio.phys_addr = fault_addr;
>         run->mmio.len = len;
>
> +       if (!ret) {
> +               /* We handled the access successfully in the kernel. */
> +               memcpy(run->mmio.data, data_buf, len);
> +               vcpu->stat.mmio_exit_kernel++;
> +               kvm_riscv_vcpu_mmio_return(vcpu, run);
> +               return 1;
> +       }
> +
> +       /* Exit to userspace for MMIO emulation */
> +       vcpu->stat.mmio_exit_user++;
> +       run->exit_reason = KVM_EXIT_MMIO;
> +
>         return 0;
>  }
>
>  static int emulate_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                          unsigned long fault_addr, unsigned long htinst)
>  {
> +       int ret;
>         u8 data8;
>         u16 data16;
>         u32 data32;
> @@ -378,13 +393,24 @@ static int emulate_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 return -ENOTSUPP;
>         };
>
> -       /* Exit to userspace for MMIO emulation */
> -       vcpu->stat.mmio_exit_user++;
> -       run->exit_reason = KVM_EXIT_MMIO;
> +       ret = kvm_io_bus_write(vcpu, KVM_MMIO_BUS, fault_addr, len,
> +                                                  run->mmio.data);
> +
>         run->mmio.is_write = true;
>         run->mmio.phys_addr = fault_addr;
>         run->mmio.len = len;
>
> +       if (!ret) {
> +               /* We handled the access successfully in the kernel. */
> +               vcpu->stat.mmio_exit_kernel++;
> +               kvm_riscv_vcpu_mmio_return(vcpu, run);
> +               return 1;
> +       }
> +
> +       /* Exit to userspace for MMIO emulation */
> +       vcpu->stat.mmio_exit_user++;
> +       run->exit_reason = KVM_EXIT_MMIO;
> +
>         return 0;
>  }
>
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
