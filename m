Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2F8C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpH2BLj2b15fkulcQ2ZwrrvPz3j5Qg6cLwjt365PsXY=; b=dZy3jLD4IIBn1N
	d1vsI+WIGV6ae9zXln3Ij04UmvzTPc7QUT4iWTxicJL+A94xjvtbB/IOC3xmTYZcYoM4ZOl0gh4Xl
	e9EZfN2YUcEy07TtUQ5ZC+J237liWxXpU3cjxRtF4YpM1impZhoe5XZWvoj46ldEjBFrXjXGwBjBi
	L8BbnpVARU686UKCvMsc89gLfkOlfNQ5iLg7ktTc3elqFgGT+WrThfiwNqO88rp1pk0Nosci1a/Pp
	LYIjMFZSsOrrFaRi4hZgOWFxMcBPstessPc6Vic1VnjTCvrS/y4CKR1HbQbiAWlAAHT7OpEqSlYi9
	7nTv478wyvLpfSGOSs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n25qY-000FYY-L3; Tue, 28 Dec 2021 06:20:30 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n25qW-000FXD-9i
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 06:20:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 n10-20020a7bc5ca000000b00345c520d38eso9395207wmk.1
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 22:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O5m6I1+e/fTravXWaM/DR1a+IZkwqzGyxUYHprrFJVo=;
 b=bnLjTnAxvgWOVF84U5Yxqqzb7N8OpgqFseDIG18DsC2weLGdpYeiorRfvLme+3H3Wj
 e9z4Uph6f+N+cbnzqXE6ZU87HGt5QGpfcIRaMGKpUWTm7EQVOzEL6R/P11zFFmFGFlNY
 KRj+nMBRPsd/qw3NAET7uXBMsQggbAhusGYeUEekhMIN5jUmR1AdJY/1SkHlxNn3pD07
 7GJC9WMCyBwenw3fpzAglpT8U7ceZENxBx1hpoosIJnnCUcusNkimv8wRDVrAqrsB41p
 bvbvOibSS1DHL0SqeWZGbBkxK/sKTfqmAukEjBHp/jrShKjZvwbPJf5m5YulHz6hzEcJ
 CSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O5m6I1+e/fTravXWaM/DR1a+IZkwqzGyxUYHprrFJVo=;
 b=ZI2Vrrq4JXoxRQPOUeei60H7X1xWQUD4zeVT+gxAdXp/amAkAE95/uhm0ZxNwzt78o
 NO0m/KWT4g5Cm6M22IN7+Z62xZHFrTl7QVWHJheYYtHo8Lxyv0JnREW0NJUdF23BgS/Q
 GwEMs/KI4Or0uMdE8moGNsjNvzcmqYHeWJYb/lDbBIo51hPuOIB9GLE8EMMopuHYufAn
 2aJqvKlUr7rMxL7m6YEZcJnqJ6eAjemzzdI6GGUIlLW8tfCKhVKj++CxDLaRlGhk/0rr
 YdnVwBdq5qmDlWRSDTN6LwjWCG68HeAoxRc2wzROyxPuIMl7uXASnb5sE51++tbwMq0E
 mdIQ==
X-Gm-Message-State: AOAM530rFfPU4+v/VZgWtL/HYoiVr8yJFeHfs+/brwT/VUuPUme/JNjW
 gPLLeZwWtGGyhJAnOyQ+KveS5FfHCy02RDd2SEQPmQ==
X-Google-Smtp-Source: ABdhPJxShEPXSHMDLpX+ZXACyVmaSjYjAuKiTpyen4bSDSjamxzNsqKq6fBZdoR4fZD7LmMdF4bKoMIrXSZydRh8fKs=
X-Received: by 2002:a7b:c243:: with SMTP id b3mr15737850wmj.61.1640672425557; 
 Mon, 27 Dec 2021 22:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20211224073604.1085464-1-anup.patel@wdc.com>
 <20211224073604.1085464-2-anup.patel@wdc.com>
In-Reply-To: <20211224073604.1085464-2-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Dec 2021 11:50:12 +0530
Message-ID: <CAAhSdy2MGEhn+Mbg=rKZO9nkHcV28Fro-sL3YH_9+S-ZCzXgqA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] RISC-V: KVM: Forward SBI experimental and vendor
 extensions
To: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_222028_425527_2C0176CA 
X-CRM114-Status: GOOD (  17.67  )
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

On Fri, Dec 24, 2021 at 1:06 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The SBI experimental extension space is for temporary (or experimental)
> stuff whereas SBI vendor extension space is for hardware vendor specific
> stuff. Both these SBI extension spaces won't be standardized by the SBI
> specification so let's blindly forward such SBI calls to the userspace.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-and-tested-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for 5.17

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi.c      |  4 ++++
>  arch/riscv/kvm/vcpu_sbi_base.c | 27 +++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index f62d25bc9733..78aa3db76225 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -46,6 +46,8 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>
>  static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_v01,
> @@ -54,6 +56,8 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_ipi,
>         &vcpu_sbi_ext_rfence,
>         &vcpu_sbi_ext_hsm,
> +       &vcpu_sbi_ext_experimental,
> +       &vcpu_sbi_ext_vendor,
>  };
>
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index d1ec08fe7289..4ecf377f483b 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -70,3 +70,30 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
>         .extid_end = SBI_EXT_BASE,
>         .handler = kvm_sbi_ext_base_handler,
>  };
> +
> +static int kvm_sbi_ext_forward_handler(struct kvm_vcpu *vcpu,
> +                                       struct kvm_run *run,
> +                                       unsigned long *out_val,
> +                                       struct kvm_cpu_trap *utrap,
> +                                       bool *exit)
> +{
> +       /*
> +        * Both SBI experimental and vendor extensions are
> +        * unconditionally forwarded to userspace.
> +        */
> +       kvm_riscv_vcpu_sbi_forward(vcpu, run);
> +       *exit = true;
> +       return 0;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental = {
> +       .extid_start = SBI_EXT_EXPERIMENTAL_START,
> +       .extid_end = SBI_EXT_EXPERIMENTAL_END,
> +       .handler = kvm_sbi_ext_forward_handler,
> +};
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor = {
> +       .extid_start = SBI_EXT_VENDOR_START,
> +       .extid_end = SBI_EXT_VENDOR_END,
> +       .handler = kvm_sbi_ext_forward_handler,
> +};
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
