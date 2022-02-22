Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73ACC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 23:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JteLTmftZ/vQZmsimStLAwYXWfp17BV4nsbNlz416w=; b=aOhA/roOx5E2Fc
	58bhxBxBnk1boV0Hz3z7w0X1bNlC5oXIXlKwNwwKMUdclcsWPGT9Mq9QADyCweL86ijOWpcEU4Sq9
	OcKGqwPxnX2CA1lMyQnbcZhGvxtIdkEvVt8F7BAPOQuTQuTXqARC+HbeOP9bq7DARyNqNGMF/A9Rx
	i0gytq//r64aeI66Fi5lKZJ3Lm8O14VcQrfVCHZAxP9Sbgtc/tunx0Ka4qlv///8NHaU+OHMKcXmr
	IlZkSKQAq02glhqI+icEQL2TU3dbIuZ9KVn3kugehrOxcWAYO6jZR10v1JVN9X9fuG8gy1xjEt5KW
	84K48xHOvV6Ra5orwi+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMezu-00BxfR-9O; Tue, 22 Feb 2022 23:55:10 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMezr-00Bxec-8w
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 23:55:08 +0000
Received: by mail-yb1-xb30.google.com with SMTP id e140so44517340ybh.9
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 15:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1Ih26MrSKGdWJCNbpIUtuX1M042QCw2P53iJFNC+sE=;
 b=H6cezHFOFMFRwhzFTu/eU/s08XZwwwOv1ttTWJy9ZJ0fwuhHjou0ABho7Cbc+55Cuq
 fqQybw7pZ5TkFfNHGqHttY4R/ycLZZKjQrVHnQVSW8ue7Z+AosMf5ZpqVpzsNXlxk1JO
 kkvNXbDj1+4do+IXR6IJWMlOyXf5DcoJKaK8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1Ih26MrSKGdWJCNbpIUtuX1M042QCw2P53iJFNC+sE=;
 b=XJ8+hkqWBfKFdJA+t3BWVI7kqyCOQUzRzvf3e7iTMQf1m931akfp2RLY30rLGZalKZ
 PWyZWXZmBC3uQ2sixeCwQnegAW62mR9ySxXI6zs3wKIhOZlRV4yZGUB1Egb+ahbFVLXZ
 bB3S7uvlhTBt43gfESLVbd7BICafaNK0//kigZRivEIGJxOAsw8RF+j4nJ8OuMnjn2yw
 cbdldeLEOPq99I+Sr3BpFYv3GLXLYagtZ4SmX1abrNxyE4DTFVbLPHo2LKyiE6KOi03G
 V8w2KEgZcIZYu8qERasGTipdCtutLwJPruNzFRqIowmDTuqCTSP/EvIS+pLRVP4d2QdI
 e/bA==
X-Gm-Message-State: AOAM5315KzaRmf0G2psFYytr+Uo04B1oY0/RtxEqNITietcF3SNEPpHl
 lnzoiow3QBJrrvIDo876oLbuP2yTErI+L2if5cRQ
X-Google-Smtp-Source: ABdhPJwgrI6MqS59aplM8JIHvAmvlhliVYcWtR0CH17DvQg+mTEY1nGjjpGFUb5uiZSh5/I9MtRVKipnqgr5x9WJh1Y=
X-Received: by 2002:a25:908f:0:b0:624:a2d8:9f81 with SMTP id
 t15-20020a25908f000000b00624a2d89f81mr9785594ybl.417.1645574105992; Tue, 22
 Feb 2022 15:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20220201082227.361967-1-apatel@ventanamicro.com>
 <20220201082227.361967-3-apatel@ventanamicro.com>
In-Reply-To: <20220201082227.361967-3-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 15:54:55 -0800
Message-ID: <CAOnJCU+3U=qBiU-t2c7Y=kPtkKBS3izcxsFssZYsPTnd_0CMAw@mail.gmail.com>
Subject: Re: [PATCH 2/6] RISC-V: KVM: Add common
 kvm_riscv_vcpu_sbi_system_reset() function
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_155507_341506_9FDCBF9D 
X-CRM114-Status: GOOD (  16.02  )
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

On Tue, Feb 1, 2022 at 12:23 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We rename kvm_sbi_system_shutdown() to kvm_riscv_vcpu_sbi_system_reset()
> and move it to vcpu_sbi.c so that it can be shared by SBI v0.1 shutdown
> and SBI v0.3 SRST extension.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
>  arch/riscv/kvm/vcpu_sbi.c             | 17 +++++++++++++++++
>  arch/riscv/kvm/vcpu_sbi_v01.c         | 18 ++----------------
>  3 files changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 04cd81f2ab5b..83d6d4d2b1df 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -28,6 +28,9 @@ struct kvm_vcpu_sbi_extension {
>  };
>
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> +void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
> +                                    struct kvm_run *run,
> +                                    u32 type, u64 flags);
>  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
>
>  #endif /* __RISCV_KVM_VCPU_SBI_H__ */
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 78aa3db76225..11ae4f621f0d 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -79,6 +79,23 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
>         run->riscv_sbi.ret[1] = cp->a1;
>  }
>
> +void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
> +                                    struct kvm_run *run,
> +                                    u32 type, u64 flags)
> +{
> +       unsigned long i;
> +       struct kvm_vcpu *tmp;
> +
> +       kvm_for_each_vcpu(i, tmp, vcpu->kvm)
> +               tmp->arch.power_off = true;
> +       kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
> +
> +       memset(&run->system_event, 0, sizeof(run->system_event));
> +       run->system_event.type = type;
> +       run->system_event.flags = flags;
> +       run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> +}
> +
>  int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
>  {
>         struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
> index 2ab52b6d9ed3..da4d6c99c2cf 100644
> --- a/arch/riscv/kvm/vcpu_sbi_v01.c
> +++ b/arch/riscv/kvm/vcpu_sbi_v01.c
> @@ -14,21 +14,6 @@
>  #include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_sbi.h>
>
> -static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
> -                                   struct kvm_run *run, u32 type)
> -{
> -       unsigned long i;
> -       struct kvm_vcpu *tmp;
> -
> -       kvm_for_each_vcpu(i, tmp, vcpu->kvm)
> -               tmp->arch.power_off = true;
> -       kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
> -
> -       memset(&run->system_event, 0, sizeof(run->system_event));
> -       run->system_event.type = type;
> -       run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
> -}
> -
>  static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                                       unsigned long *out_val,
>                                       struct kvm_cpu_trap *utrap,
> @@ -80,7 +65,8 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 }
>                 break;
>         case SBI_EXT_0_1_SHUTDOWN:
> -               kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
> +               kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
> +                                               KVM_SYSTEM_EVENT_SHUTDOWN, 0);
>                 *exit = true;
>                 break;
>         case SBI_EXT_0_1_REMOTE_FENCE_I:
> --
> 2.25.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
