Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C0AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vmx2gPtlhITMTNcF9so+JHlVBIZ526JtvRbftN32rZs=; b=hiw/Us1Ae8mT5D
	UBPY2VVFjxdQ+LfXL1bkyl+43a/W5J1bJdmQ88qC21rTFEPaLenaG+1NcQlyCBo3jyPQKRfRRsBgF
	y8rAgdRySTGbjypL6opveEfxmcj+5lHgz7S3kIXdqC8/z4R8WjHJ/ljpNIEgfs90cULpj3o9qvGCP
	iqdRsDKWALOnasAjneijFtAYr3IjEu41mDK3wvBbX1yGEdyN4rnAEOdfBvB1UrVnq4kMbPs4TFNTo
	XxDjpissHguyCPnytdlcyjY6Se3yUs28U/XLpdvXg82njbfzhdrRaMGdzlRGoPud5FROGrDjzEqOe
	eOXme8z5T/YxYL365r4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbdeB-00HXrK-Dx; Tue, 05 Apr 2022 07:30:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbdSi-00HS4Y-Jj
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 07:18:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id k23so5299329wrd.8
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 00:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SWmIF7kdZQxOjvhVF27iSPZYouYPyeTWvrXCvBCoo6M=;
 b=0J2XyiFI8hdOaU2qz1ah0ep9G8tAOnRKLZ6ukhI9wkUUo5KnuOQbgSO39MPE+PxSaB
 9fcCB22vkp4p2Jdpl7epatdu/IwwsG9xRFG2SwyTCN+cpHriPBOGT/AKUPpuWy7fEuiY
 FzcMI0o+dtoUMfwOq08y1Kw7kpkXYyUZOrIpMNT1feIrO+Rh7tighQYA7aaD6T7QiiSq
 9DY2OOtK0QP/SEvUIQDPuB8zsSZ0Em0pmi8MMmHCPVlZCGQa75UypwxrnnT+r5toac+U
 FgCrpJLlWeg1dgw8SkcY9FbRtdnJvx/Upq8B+DHwAntkGhm7NtuJppmAqEy2SBCRcBcZ
 bHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SWmIF7kdZQxOjvhVF27iSPZYouYPyeTWvrXCvBCoo6M=;
 b=Pyy2ojfGE05T+iCb0nr4QLC+oHJ1Tf//uIotdyhdNnrIJCql8zu/h1Q0Hh4ZRJYWta
 oacV3VZ1Vv8s+0YRJNo+OlqMIHLYBp+TqpHh2BEfKNNk48BpKyW8MNoQ+ZcGkEpLsnlb
 6aE8MFX1nNIjvc3ENuHH6UwvK2ClqSOPWirtcxUIDpbZRr2TiZLEzPiW6MOX5rpVAh4Y
 0QeyGxVmUi70TP1HQOZl0RRbMXqb7lAj/jmcHj7LLs4lbc0ri/By/mcunvRMNIF4B2lN
 jpdi77ICRdMvyqu9HDGQKmOCO9RrYUZL2OOpdAtBj6rSBHNaAxDB6YFLoaJBXFVp82go
 hl5A==
X-Gm-Message-State: AOAM532EWN0qlcBKw5kTqe2t1+vbwjXfKTn2Al2MmM2OdlS0ZKwA2lfQ
 mHCfySEfqp+SrMW0Hbib2JytVB6KxsAK+NKbXlBqCA==
X-Google-Smtp-Source: ABdhPJxEY7vXcjMbr9oQrtXXmbTMIbRAKE4OTBjGL+A63xeISLJrnIJ5bBgyZuPVxJhL+9+JmuYgJizmKmiifNf9NNM=
X-Received: by 2002:adf:f88e:0:b0:206:ce5:af99 with SMTP id
 u14-20020adff88e000000b002060ce5af99mr1455734wrp.313.1649143121363; Tue, 05
 Apr 2022 00:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220329072911.1692766-1-apatel@ventanamicro.com>
 <20220329072911.1692766-3-apatel@ventanamicro.com>
In-Reply-To: <20220329072911.1692766-3-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Apr 2022 12:48:28 +0530
Message-ID: <CAAhSdy0ZZAVPr68VK2k+0HQDZHyaCGTv1FgQKHqh2=T1wYzZtg@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: selftests: riscv: Fix alignment of the
 guest_hang() function
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 KVM General <kvm@vger.kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_001848_680677_8A10C282 
X-CRM114-Status: GOOD (  17.07  )
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

On Tue, Mar 29, 2022 at 12:59 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The guest_hang() function is used as the default exception handler
> for various KVM selftests applications by setting it's address in
> the vstvec CSR. The vstvec CSR requires exception handler base address
> to be at least 4-byte aligned so this patch fixes alignment of the
> guest_hang() function.
>
> Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V
> 64-bit")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

I have queued this patch for RC fixes.

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index d377f2603d98..3961487a4870 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -268,7 +268,7 @@ void vcpu_dump(FILE *stream, struct kvm_vm *vm, uint32_t vcpuid, uint8_t indent)
>                 core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
>  }
>
> -static void guest_hang(void)
> +static void __aligned(16) guest_hang(void)
>  {
>         while (1)
>                 ;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
