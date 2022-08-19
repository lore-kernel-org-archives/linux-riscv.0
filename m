Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931FDC32772
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+px908+WXC5UHP4iY/aJH8SsFvwt1JxedwZs+v8xNQ=; b=4cRzs5QJ5BTMl/
	85/GTibPXj2JbGW2YeQ+7Wt13Oi/MxfViF0s9bGMVHRYdki48Ve2hDSGPKHM3LlXkZq/j7HjjiRUp
	SMy9NKxiZjW0kZbygzPU6gWcjUnNyg5xI8+sSe2njeKH7ZOH6Zvyhd3Zv6vyg3/GlHLo6y5ChmoW5
	agTGcnCnxKhBnIsgAmQo7KOJbfi0NDqf+pfy2b0xyMNZtTDpQiHDGXHpHpWaRhT44JV8m5onQcydo
	CDqRsqs9tjJVJDj23f3SJ5up7h1KZiKGz3i100C5xMnrggORUVwg74begAyMYDxWQS4Cl43H/EG12
	ADWuwJghKVMsmi091agg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP4bO-00AEzB-Lq; Fri, 19 Aug 2022 16:12:06 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP4bL-00AEuL-3M
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 16:12:04 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-334dc616f86so133637677b3.8
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XijIKPSG6kvk8NxvmjtmY8phogA8Jwg+9VLOMKAfxBo=;
        b=KoQdAvLdqtvHerjKo8zZBjTL/cHkXCa4FZvixhiHnVBVmGjebrzzmMPcNii2PopeJ3
         jSRjeiydxGpUrOqqd7ApmQYIVlnt4yfIbWSCa6jbq2bOlXUppHIzLKc5X58O03S/GmBf
         4Y5oQycOJCylvDSGcTTYOwIP3IrmdyTzegkl8VYWTdOpbRSdMfqytx4M336a9/8L9DR/
         aXvpM9EL5VVLIuXP2Cwz9Wi0w7PPNMB09fppbAHD4GeqhOhQsJhaKGSTGt2bhIEPHK3T
         C5zBz/NHIPWjZdrf+xzBg/cz4L+Q8pzRn//FLLD38Iny+JGgkAP/WYob23oW/00WNtp4
         aCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XijIKPSG6kvk8NxvmjtmY8phogA8Jwg+9VLOMKAfxBo=;
        b=C/5Mbfib/LPNa6NHr8dgeBk0ypq0V2fqnqpPaJeWN5mWx2i36MxIwnhxr8lZQhHYSB
         isw6TkWqeJwzYl3AiwV9/NeYZLGR1XDp+zn3gj2m5V7ZnuXENqlGC0L5ZI9KbUsbrOck
         cv8lIB14gL4iGXEehUM6dMD36WqWBEXfTYJmQl/2s9D2IYCIoUdLFa59CNZJIGlKn/HX
         bnXqJ1k5md7zvJZPjsVvYGt+CPRa8CjC0RI6bgYQFBMKqyNjApotlKp9drnM/JoFG26s
         rz/O5uXb6apFQOOU5vyrjnJwv6k3Xgbqm0IPn9HCXCOJXh9bxhgNoZxbGalWOtrINupA
         wKIA==
X-Gm-Message-State: ACgBeo0Bp0PEWbDd0UV3ol2NX8J069ZVIt2JhQv4PGg6YfW7hCOmfpWw
	oiiTqUpAGJQuuAwSqRPDR7riU5bM4VHOa+Cb2jw+rQ==
X-Google-Smtp-Source: AA6agR7JuD2dimnGRGHFVLmW+yzm9h4JA2K68J6n4uTdZ2bc1pJuMlF2Ky547pqa9ml0uDdDALfemeQvwqzG18V8dJM=
X-Received: by 2002:a05:6902:70a:b0:695:6d71:ecd6 with SMTP id
 k10-20020a056902070a00b006956d71ecd6mr318886ybt.619.1660925518203; Fri, 19
 Aug 2022 09:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220814141237.493457-1-mail@conchuod.ie> <20220814141237.493457-2-mail@conchuod.ie>
In-Reply-To: <20220814141237.493457-2-mail@conchuod.ie>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 Aug 2022 21:41:46 +0530
Message-ID: <CAAhSdy1qEJR_d5ynbptsCVOA5fk+dPyZ0mzT7-y-RXtQjMni_Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] riscv: kvm: vcpu_timer: fix unused variable warnings
To: Conor Dooley <mail@conchuod.ie>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Tong Tiangen <tongtiangen@huawei.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_091203_403134_A5F875EA 
X-CRM114-Status: GOOD (  15.31  )
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

On Sun, Aug 14, 2022 at 7:42 PM Conor Dooley <mail@conchuod.ie> wrote:
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

I have queued this fix for 6.0-rc1

Thanks,
Anup

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
