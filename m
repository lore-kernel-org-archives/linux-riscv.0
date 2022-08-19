Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660E6C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 20:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HzUmDGEzClbbbB8G92cqO3y9T9xQ/Tr2nR6Ou0YEIs=; b=yODzl1Rs2Pb708
	Q7kCptdzTvIR8L3uu+/et2TQeH05kRUZmrODGmt3VZQUIa56BoEPzvRP6snrX3aAW+58UM2XEdZWe
	LdhWct/H1RMZ9PnlbH8RUQ6vqG6jZbfcq/X8UJ7Kyv0Y8xusAFfJOWvbDFPlBKoKe/Pss+ZnNoiA0
	jyaTOj0cIqwTM7QojBKQQrbj0OpXfq+irY43C4WrJsaKDfam7oTqrhfPnjdgpzxYvvcXbXRn8xUoi
	8h6YHG0bv7KgK7Zr44vkKbxH8b74zgLe4ETTicn5KHqFSQhESKRIHMU+QRP/wbiEmrAjtsBU+ylUi
	PTWWFyTRKE6M3UeSs7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP8Ix-00Bs7p-Fx; Fri, 19 Aug 2022 20:09:19 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP8Is-00Bs2h-Uv
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 20:09:18 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3375488624aso120648777b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 13:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YuF+xqYANb0UpSKdFXaPIjdGoUsETegDwAlHIfHh17s=;
        b=SmwVsSxLi/TN3be8ePf4Zt26MSe+mpgAQ9Yj1M7BSIb+2/45bT5dcu90JsXbPBl5vH
         caJzUu+A8tA+CqBs274jJpfoLUC/7GmPmhVg8b6otV8Dg+XUbZaq4LVnJUo5r2JnpOd1
         oZC+HNnX9iXvL2IpKtVVL/slYa6BOXTlJ7kWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YuF+xqYANb0UpSKdFXaPIjdGoUsETegDwAlHIfHh17s=;
        b=r+b4oqfsORysfxaTA9e84lNbUImGbJdupkDvOPBqV8XKaIcPTK/2e4koVNCKQLI3ou
         Su2R0aoCsIhRN1WBedjtK072R6JJGPzOurybiK+jJ0plcLRfm0YctqtBDKt9T5x7KfCX
         9+CjvTACSqU66ZIbzpnPLs+FDFUtZ4L2jcjH/wkbAnS6e0tPkuV5EU/ypmYbjJY4wZ8x
         pZrZXDAj4pybpR7C7VNTiS+Ycs6IWASDdMfNSEI/WRlGbHJ8UBhpDx+263VW9e3pmgPF
         jwf6yACPL3h99Q8ic36liInGaruHw5ge3H4+4UVBREyFQzqnMVs97cQzAFZRJar9aUNM
         r6pA==
X-Gm-Message-State: ACgBeo3GnsHnY7DJ8LbSgHe4vsK05f93ZI90Jkb0J/N86prgZAnkyeGC
	WW2k6A9IQzettfg+dreCvRBKmU6lp/7qKCJmeq1X
X-Google-Smtp-Source: AA6agR7wQ8oKJPNlIuB55kWztWUPT4TZ4pt1foHS2qP00B5/o+HsUbPTDI0y9sCaodK5ZH30pxM3xwnr92xLtnZ6tlU=
X-Received: by 2002:a25:5105:0:b0:692:17f6:62b6 with SMTP id
 f5-20020a255105000000b0069217f662b6mr8381453ybb.361.1660939752536; Fri, 19
 Aug 2022 13:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220814141237.493457-1-mail@conchuod.ie> <20220814141237.493457-2-mail@conchuod.ie>
In-Reply-To: <20220814141237.493457-2-mail@conchuod.ie>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 19 Aug 2022 13:09:01 -0700
Message-ID: <CAOnJCU+gvVfqN6DHQRMtJ82xU4ZajHrANfeDjt21i9Om4r43eg@mail.gmail.com>
Subject: Re: [PATCH 1/4] riscv: kvm: vcpu_timer: fix unused variable warnings
To: Conor Dooley <mail@conchuod.ie>
Cc: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Tong Tiangen <tongtiangen@huawei.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_130915_406075_A96C7777 
X-CRM114-Status: GOOD (  15.81  )
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

On Sun, Aug 14, 2022 at 7:12 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> In two places, csr is set but never used:
>
> arch/riscv/kvm/vcpu_timer.c:302:23: warning: variable 'csr' set but not used [-Wunused-but-set-variable]
>         struct kvm_vcpu_csr *csr;
>                              ^
> arch/riscv/kvm/vcpu_timer.c:327:23: warning: variable 'csr' set but not used [-Wunused-but-set-variable]
>         struct kvm_vcpu_csr *csr;
>                              ^
>
> Remove the variable.
>
> Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kvm/vcpu_timer.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index 16f50c46ba39..185f2386a747 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -299,7 +299,6 @@ static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
>
>  void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
>  {
> -       struct kvm_vcpu_csr *csr;
>         struct kvm_vcpu_timer *t = &vcpu->arch.timer;
>
>         kvm_riscv_vcpu_update_timedelta(vcpu);
> @@ -307,7 +306,6 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
>         if (!t->sstc_enabled)
>                 return;
>
> -       csr = &vcpu->arch.guest_csr;
>  #if defined(CONFIG_32BIT)
>         csr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
>         csr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
> @@ -324,13 +322,11 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
>
>  void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
>  {
> -       struct kvm_vcpu_csr *csr;
>         struct kvm_vcpu_timer *t = &vcpu->arch.timer;
>
>         if (!t->sstc_enabled)
>                 return;
>
> -       csr = &vcpu->arch.guest_csr;
>         t = &vcpu->arch.timer;
>  #if defined(CONFIG_32BIT)
>         t->next_cycles = csr_read(CSR_VSTIMECMP);
> --
> 2.37.1
>

Thanks for fixing this. Sorry for missing those.


--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
