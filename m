Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB58C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 04:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L79EkAMS+SfJh9wMw6roLxm9e4t7vy4BKzeKlsqXhLM=; b=Z+hCkocxHv2ufq
	UomQxD2p5Lhm92F1q3oNS0FI/mWzt6pAIFo6vBpKpeY1JZpAlsi+46hcDTjB6Lo7/TPHIOJ3GCxeu
	yaiGeHWXFO3NmEBN768e7joUqxQMlYvUwxwGfednXB74hQSkfqVIQXFDaCALMILOyvBJpz//j90Ah
	TGcL2Njs0ABVmhi4acBNbV+22LNbDhfTwiZFWWSWdM9G//PV8D/0Zq9K3enqID74I2wNGl077XxaO
	DbWeLazL/ZFWi543tzkipEnfYY72X+5sOCU++64r5W070iJSWW8zC+jNdaMQlxl5JtkW9krcVp3EL
	PYJelyG50UlcuMrHcrvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAkqd-00FqDU-Cl; Mon, 11 Jul 2022 04:16:39 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAkqb-00FqCN-1x
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 04:16:38 +0000
Received: by mail-lj1-x234.google.com with SMTP id w17so3259758ljh.6
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 21:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yokId+kL1XsUAJzXfOxjC7q00UnhVLg0heLq8/CzKNw=;
        b=ZY8Gy+sHLWu8VAYvzEiXRTHT9tuRT7ejaosM1Xw4V3DhLlBw2Af9kiToQwGhgSSWL6
         KuXNkb0i3epNJ4ykkbpocsM2Tan54xsOLECsVy2OIHB0MDmQHKuyDj4aNVG50X/8xmKQ
         4000H37gmgWprf0OeYatZ3qFHZy2hCNnwnbgrE3CgKaSoVtEfndEHG8fCC89B+ZYZ6a+
         n+7N82T0k1KIxO5Jf2nqYhS60Dvv08dfX1qs5sGDQU/HCLb48UqkPYxTkhG2IYioaaBf
         R04SIhoyxkSEoa+ocCn+6DXlkhYEpailJNgOLnS+Vi9bm+K4Bxz9aN8chbL6rkgeH9zz
         mV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yokId+kL1XsUAJzXfOxjC7q00UnhVLg0heLq8/CzKNw=;
        b=EyDqfQZSqCUg146cXppvOEB5wj2CfGw+ga4WO07un7UgAQZSOG8giR8XD1j5O5uBb0
         nDVqT9UPV0Wc3RudmJRn71S0AkfgKVRWoSVQR0qyq4qqL9TYRiKrazsCaNp+H4VhJeMC
         yXsLKskEi2SpKc7MD95XslTtBHJ6EQpNQ+Wryui8dtUt8x/bpj1XC4CBfSoKbXXTW8IX
         s5cnGAxllRJQLV9Vo2zCwi3q11wnT3M4SLFFtTa/deeO+HnrukuIP+MGC2lHTrxRB8Hv
         Zzmxf++SMzxGY3vkxNfRmWtD2cgpvbM/meaoLKycgSGo3lhHzgwp04iQRlkkU6osFcec
         Mqdw==
X-Gm-Message-State: AJIora+WtVpIMlS5KMPh7eh/W4RK1TtYa5bL11zxATyr+W69UtwMVHU+
	4kH040aJGsKeRGcAHP1L8iZnpnIGuagm5FHm9f7S5A==
X-Google-Smtp-Source: AGRyM1uUtWel5vfmZuYAD/gK8/SRSmF+9d0yqlY3PAatmC3KkMAUQM6LA2GseceFzLwP7ShlE/BzxDKqkbySrYf7Apw=
X-Received: by 2002:a2e:9dd3:0:b0:25d:4ee0:f55d with SMTP id
 x19-20020a2e9dd3000000b0025d4ee0f55dmr8524188ljj.266.1657512994653; Sun, 10
 Jul 2022 21:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220710151105.687193-1-apatel@ventanamicro.com>
In-Reply-To: <20220710151105.687193-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 Jul 2022 09:46:19 +0530
Message-ID: <CAK9=C2UjJ8eqXSBzsbpdUn9E=5_6Zp2NAnHts_FaGpxWxN-Krw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_211637_107530_58C35B63 
X-CRM114-Status: GOOD (  18.49  )
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

On Sun, Jul 10, 2022 at 8:41 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The kvm_riscv_check_vcpu_requests() is called with SRCU read lock held
> and for KVM_REQ_SLEEP request it will block the VCPU without releasing
> SRCU read lock. This causes KVM ioctls (such as KVM_IOEVENTFD) from
> other VCPUs of the same Guest/VM to hang/deadlock if there is any
> synchronize_srcu() or synchronize_srcu_expedited() in the path.
>
> To fix the above in kvm_riscv_check_vcpu_requests(), we should do SRCU
> read unlock before blocking the VCPU and do SRCU read lock after VCPU
> wakeup.
>
> Fixes: cce69aff689e ("RISC-V: KVM: Implement VCPU interrupts and
> requests handling")
> Reported-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Thanks everyone for providing Tested-by and Reviewed-by.

I have queued this patch for 5.19-rcX fixes.

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index b7a433c54d0f..5d271b597613 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -845,9 +845,11 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
>
>         if (kvm_request_pending(vcpu)) {
>                 if (kvm_check_request(KVM_REQ_SLEEP, vcpu)) {
> +                       kvm_vcpu_srcu_read_unlock(vcpu);
>                         rcuwait_wait_event(wait,
>                                 (!vcpu->arch.power_off) && (!vcpu->arch.pause),
>                                 TASK_INTERRUPTIBLE);
> +                       kvm_vcpu_srcu_read_lock(vcpu);
>
>                         if (vcpu->arch.power_off || vcpu->arch.pause) {
>                                 /*
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
