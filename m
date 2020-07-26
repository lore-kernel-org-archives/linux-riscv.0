Return-Path: <SRS0=UGSk=BF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8882C433E3
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2020 12:57:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4C1C2065E
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2020 12:57:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ze6KpVgJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="l4ouuUm+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4C1C2065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=akrs86pSGvJINE5LteYjBA5ieGheF5BguydLIY6SxqQ=; b=Ze6KpVgJUGzY+DDWJSlI6INvp
	EsW/gng6jtBPbpKIzBWJcJr+fiNRusUcK92osqvihBm7RC8cP/SfloYksaWTZ3CAHVAMF0HPcvgsM
	GNUSwIysuozAolomSbaXuLlddYyfhx7gN1benRFuQkh1Bi8lHN6ykEepImEqzTHG9Us9bpBCXYVYe
	/qsjv6wSXobWxH3vf/GamO8UcG1Xxa/b0xVh11zhUajiAby72G/K1GlHXngGu/AnfJiK+B1rSxwmU
	pnwhbcdERu2gn83b8+F/7Pt9GW/SeRf7EOEdQfaGAqsqklDrX2FYNVfC+zjObzcAQhpKLh8uz22Xv
	KjbKagpZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzgDc-0004SH-CC; Sun, 26 Jul 2020 12:57:32 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzgDa-0004RC-1O
 for linux-riscv@lists.infradead.org; Sun, 26 Jul 2020 12:57:31 +0000
Received: by mail-wm1-x341.google.com with SMTP id p14so11364336wmg.1
 for <linux-riscv@lists.infradead.org>; Sun, 26 Jul 2020 05:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cj1AA+QajmRenSwYh/8g5RjvZ+1Kfi4azWkbk5rVJMY=;
 b=l4ouuUm+RZKjkDPNsYC7yAU3y2YJaYqK7fRoN7KnpfYrRUJXIdaNeqJraLDSLj+Hsq
 DoCjcYHNOPx4wQ8IoFKBY8oXq+gP6wlJ5S/+4ZJRUZe7F+op3/uY4m7z1/B2VnkOgD5m
 t2uIGFEk+6v+lJhjcexw3MSjbYwv9XzgPyuSk2nG7+0gRoCIhPcpMUQxBQ0CXJeMW7Bq
 Pj3YcVraJh5zWRzVM0CLCI1eEwZtk2hlU89S/EKMlfBzmwOSdLrkBcQe9JB7QgVZ03Q+
 zeks5A6Odx9k1ILsGYWcElYbzhHbp57Sf/ChsiYlNzHYRcSM26Z/AA8OZ33WJhBEDIgd
 p68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cj1AA+QajmRenSwYh/8g5RjvZ+1Kfi4azWkbk5rVJMY=;
 b=DAVQvRCO95nYSzr3Kib9gYSk8PgqoqCK2Zy15R1683M5wPvIkQvDg78jpruF5dqzOo
 MzEUCfI46hro8a7bpY/nDxPb6BAwzpi898yRmVL/bLqQd+349dwcERFXqsShtZDywWJ6
 F0RXPjsZwis1ImcICjHG5gFQKy82y8nNtRjdpVZ4eDBsEF6R6OTUCXPryZ3UhDuXCYC7
 Qoz9PegU9OTuls5aO+NnOBbHD5q8HF3gfi+QNM/i5ovbE8jMLffihznUMo8LM1UrYnrk
 cKBsJAUSC23oaEhNvBoWbznl2omauMF8i2AtgMz/s/KEUub7HFZ9ivzFFK5R/UPVJFvy
 RUuA==
X-Gm-Message-State: AOAM532Wh3gYeEGK6HpDvqMFXCVI04hvMo3mz7LiI4PcQDI4Ing9ZVzw
 a8nLwO4VBbJZQqiSynzv43exJtbgctMH7F+/DAkAQQ==
X-Google-Smtp-Source: ABdhPJwiFhCYXoqV5R1BrUk4cFAFcu/0v8ywSpRptTToyE31Qt/lRbVUr0NbxhMSfFzTA3SQmpsU/BUW05YZkVeyxhw=
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr17178624wmb.134.1595768248343; 
 Sun, 26 Jul 2020 05:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200724085441.1514-1-jiangyifei@huawei.com>
 <20200724085441.1514-3-jiangyifei@huawei.com>
In-Reply-To: <20200724085441.1514-3-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 26 Jul 2020 18:27:16 +0530
Message-ID: <CAAhSdy3q3tNUqSxnFy2tdmXOLJZjt4rMAZirZh88-0BXT7-X1g@mail.gmail.com>
Subject: Re: [RFC 2/2] RISC-V: KVM: read\write kernel mmio device support
To: Yifei Jiang <jiangyifei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_085730_181052_18AC0012 
X-CRM114-Status: GOOD (  17.68  )
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

Move "ret = kvm_io_bus_read()" just before "if (!ret)".

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

Same as above.

Move "ret = kvm_io_bus_write()" just before "if (!ret) {"

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
