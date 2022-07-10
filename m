Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67A6C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 19:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHEO+lFEJr1FLOnhSEvC1NEiMhbAG1jzj4nwDfH0+Rk=; b=XBifjDwDqeKn75
	GRTfz/JURZv5CbXik6ozAu7GGmLDIb2UQVZeyF7A+O7baeYKqXAGk6iLtJghs+05FgLTV+Wwa3AlR
	Ncbie5H2h04KSRaG3z4IlcdroFRnSge1pherhP92BYGfBLrLXTQ45/lsCXUwUjElctoY5dFO6FJv3
	vWmrFrX9vGjqSEWTgVdnnZlge0YK8k3CGHQ+3RH17fEwZSDfQDszZsD7eCeXS2sWbWcaHcFZ8J3+q
	UhEmVQ4yazuDCcfA0nmmIQkFAHVD99rxoH+3voVAH1U8clvFKJkJ/WBpkgWCaPENpi0thsLCPFw10
	+oBFUNbakGMGFXJdN35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAcFU-00D615-SI; Sun, 10 Jul 2022 19:05:44 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAcFS-00D5z5-2C
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 19:05:43 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31bf3656517so30348677b3.12
        for <linux-riscv@lists.infradead.org>; Sun, 10 Jul 2022 12:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tkZ9euRFpN6RPFPNbwsacD82kKvLsZ80aQxI2epTktI=;
        b=L+RFTeLRQS0mezNdJHzI7btiFmANc6Tyji1uh+iIfM2RQA568qOWxJLcPkB/geHXey
         LYEiB/wcmktqV95Fmt2nxRwshkuSHKiY1rOB0rKj6dMVyVI5tWtGqq6uQKuZ/s3SbwDX
         vCEs8dEfgL3PtT+azgXyVO7NCPKhC5j2HYfzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tkZ9euRFpN6RPFPNbwsacD82kKvLsZ80aQxI2epTktI=;
        b=ffC4CtqoOKd+TmxVu5A2Ka2Nu1uGTeyoR5YKWsaZZIM5pDiHPumUOuaQIk875IFv4z
         xBZrdvhi+xphBWGY4/vhxOrZ3ZQJ7vFSGJdlltlHiQysbiAkiLzS1xDajaB6nhXiIEWG
         H3AsU9FuCwGt4nFWJnFCeCPP8DvBjJ7Y/JxVDYU2oL1OFazIGdCr14ccDuZF9XZ3BzjB
         y9AE06ND78MvVqH49d/LLexH8YEffmQzXHecgyy7cBZVSK6GUCmlnFzBkaxjJfcNaNCx
         hJsk6j4I0r+2jlLiB/IO2xqiZaqeUmYnl0ufK9nTJvjyAIHJyGDaKsyIFemOnGqz7fVP
         cmkw==
X-Gm-Message-State: AJIora80qkM3d9IOh6SZSvRC3noKv9EdU+/EZDNCuxe7OtiiymhGHxY2
	Zsd0HQWAT6U7SGARPL0PRX7h3pXlKGwMx2M60lfy
X-Google-Smtp-Source: AGRyM1uVUA8FMVdx45iYEpWXOWp2xYWyipOGYnB/UnRRjpUjaOOkD/wxeAFO8Da722n+T98mGBQQPN/JACPirmWJRAk=
X-Received: by 2002:a81:1514:0:b0:31c:a84b:350a with SMTP id
 20-20020a811514000000b0031ca84b350amr16064656ywv.400.1657479939850; Sun, 10
 Jul 2022 12:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220710151105.687193-1-apatel@ventanamicro.com>
In-Reply-To: <20220710151105.687193-1-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 10 Jul 2022 12:05:29 -0700
Message-ID: <CAOnJCUJHDd7i1BN0KwzQzHNGkBFQBYje1RGKQt4Yuus8HZJPeg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Bin Meng <bmeng.cn@gmail.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_120542_256096_21A24EDD 
X-CRM114-Status: GOOD (  18.27  )
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

On Sun, Jul 10, 2022 at 8:11 AM Anup Patel <apatel@ventanamicro.com> wrote:
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
