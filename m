Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CCEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 03:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8Lv5ikOR+KVjGjN4D4DfGmop+foY7v2gWMFOZ1jRiU=; b=I1vevbie/tca1R
	xD2uWmRwOw8O36OYxTzvN2/JzmpjiqyF/6AbIbFxnaFo5vEqS8eSNNHF2ki1AclXWlkeTAqDP4Yxh
	A/aIcsuygTGIhynmwpLMB1ob/OHecNuGBhnxFb2evPtnhyOdj4r3NTF57oc1dSV0TGTi+/1CybSZv
	80h1EBhHf2aeyDtspnolR9dn/8clw3rcIMBbyxv5yDy6C49z+mHaYUv0TKCb/oaCcrKeRjVNB1Jq0
	ZdpoHdmgCcN3ZjRSRyWDjB1yIzZ4hzPtZ/tLSwfcKTIpyOX7Nvkcdy3IJ5lnUy435TjD05Hh5xmcb
	TjgardpflN7q0bhNGelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbDkl-00Cvwy-BN; Mon, 04 Apr 2022 03:51:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbDki-00CvwI-M4
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 03:51:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q19so5576002wrc.6
 for <linux-riscv@lists.infradead.org>; Sun, 03 Apr 2022 20:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r5K6b0sc6oOdX9PQxMtrYXV8USG1YlONAxoBoZNU3l4=;
 b=KK3qDVtl6tM1RC0vWJnjyjAOaBy9HeE8/J3cKTugiWs6TNndA8Vg82MGSJiu79ETZ9
 X+G314yykqvPYI2h4vxy4qqe0E8bDEu6Pk23l8xjJMUNi4sSsIUwyXUPZb3codKUinnS
 7eLz56OFMh+1h+AdCdVcpMxwkT0tCike5pComkqD4oMYKXMz8k3wGwwT7UrbveBFjtRV
 Ql3xXEdAWWyf/cRgLKSfwCvFdjvS0exmaL4XX1iOCKrs/N84Me5KcmEyAJsWdb4YGTs4
 8yDSipiD22wqji5E7+BXbjOGj1jhfghTr1RjRNbedQ0BdvxbxVt2GRKJULuUKAon/jNy
 T/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r5K6b0sc6oOdX9PQxMtrYXV8USG1YlONAxoBoZNU3l4=;
 b=8F7dR7qO44qcWGHRuk8OeHWG0I8LuXSd8pblzE8icEheKUDOgPjjHgKQYyfrKX+bUK
 j3C1f3PA4ZihLrjkH/aSYAWIoXgkQGYOgKpdUG2tugAuFza08deublUXlo1VxMyQGv2y
 Kh5M5rt0HSBfhqVMNHllnVQY/gdl0YhvunAMV9yPUdQsZJXy+lvykJODZrYrnDeBhl2z
 6I8ifchrzoqs5OyV79LbD5h1QhdKghKTb28KfWuwJJak2qjOPX7zz7A43c9UmDnHPAr5
 KpUXEo2CgfabhyKu/j9Bns0m8TWfA8CkinSbpsRzOKA5CCi706Ypdp4z1NceqBu1mB1A
 wE0Q==
X-Gm-Message-State: AOAM532SUpFsiCsZDKTf/z3sRaAPPhg8FRriCM53BBnrkR9Hj7tz8Ja4
 moaUhcgEOfAGWEKfe2koLDcXjPVGlLrIxNDpcicv0w==
X-Google-Smtp-Source: ABdhPJy03E7/LbI9hh3U5hDa7d5BQW5aEeRI/tPy/1Eq7sLg6T5XYwIswOiGCVJ6FybEoaUugQyf7PY6NWQ6q5tyzFU=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr15660633wrz.690.1649044297423; Sun, 03
 Apr 2022 20:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220317035521.272486-1-apatel@ventanamicro.com>
In-Reply-To: <20220317035521.272486-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Apr 2022 09:20:27 +0530
Message-ID: <CAAhSdy35a5PrdSzonK6EeH0nynFxvvUzScaYRPeA=CmG5yuz+Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Don't clear hgatp CSR in kvm_arch_vcpu_put()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 KVM General <kvm@vger.kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_205141_184039_89B8E6ED 
X-CRM114-Status: GOOD (  15.76  )
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

On Thu, Mar 17, 2022 at 9:25 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We might have RISC-V systems (such as QEMU) where VMID is not part
> of the TLB entry tag so these systems will have to flush all TLB
> entries upon any change in hgatp.VMID.
>
> Currently, we zero-out hgatp CSR in kvm_arch_vcpu_put() and we
> re-program hgatp CSR in kvm_arch_vcpu_load(). For above described
> systems, this will flush all TLB entries whenever VCPU exits to
> user-space hence reducing performance.
>
> This patch fixes above described performance issue by not clearing
> hgatp CSR in kvm_arch_vcpu_put().
>
> Fixes: 34bde9d8b9e6 ("RISC-V: KVM: Implement VCPU world-switch")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

I have queued this patch for RC fixes.

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 624166004e36..6785aef4cbd4 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -653,8 +653,6 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>                                      vcpu->arch.isa);
>         kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
>
> -       csr_write(CSR_HGATP, 0);
> -
>         csr->vsstatus = csr_read(CSR_VSSTATUS);
>         csr->vsie = csr_read(CSR_VSIE);
>         csr->vstvec = csr_read(CSR_VSTVEC);
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
