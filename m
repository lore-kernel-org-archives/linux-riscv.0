Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A86C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 05:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yiKxJZfD5fbbl2iW7e6XivfsXsoGX7WcVz/4lU3if5U=; b=k1p2caaDzvZE3w
	n+BiuYAWN/+hZacMFfCrjsgOHMP9IpRNyGNCQAKLRaCA4DWu6SpTbhPHB6356bNNn89PbpVvJH/7t
	fI9EUxHv43GGQm8Tk3IP2hcWWLlH35IR7GmcGfnsg0O4mGYbpDWuxymMevbHg973mEebLKIgmx16F
	yBpoS4GOV03syfPL+0XaCWV1eMhWTjpv/Ge91XB2XMSemvKLq3jhz90IGDlAD1BnVLj9xSjEsAF7r
	pz4guMo8xxnKTCHqJEtylq3zbytEEPVJ8uPosQb78Kgq3QLhh1VR1Oe6dE/iH/QilKfq/nrY9W+PW
	3QBLmtek1wVQuOcbw0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my615-008fd6-8x; Fri, 17 Dec 2021 05:42:51 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my612-008fbt-6e
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 05:42:49 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id j2so3211678ybg.9
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 21:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NSzRgyKxQMByJDnhlFllsd6YBcOS/JIx8Ap+A3lLZVg=;
 b=IRPPeiVShrf2EHVF/zr+4wNVsvaB3yZ09DlCKxTDHT/IYnuRNWSJspvOYQqf6SQW32
 TergXgX2aWeH6nRMclgctg1HXcpL4ABn2DGUFSWbhgYU3MPCf13INK4Q9x9DYFFf+H4S
 pYuqEWXwrJ4PkMuareW6NigdpZhNmcTCB9e0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NSzRgyKxQMByJDnhlFllsd6YBcOS/JIx8Ap+A3lLZVg=;
 b=LTQmarZkdrepj6qLCoKr3FIIG2cBo49EaR4qq5TASSMDWbDg91kzAc3r6TSLyJwl1n
 hY8J5mI1PnodtCJVCR0LIdKMk29JJF0bAgQPktiymqojKnA2omnmVZ+NN0yJMlv/uQb6
 zMIT/XiOIHYzY//kqm+Z6FgX/i7tXJR7RgExgMro2UPy5Di5dSgls0jm+9jo7MIlFBGB
 dMufkhiO5MrTJM9Y0PoMSnUfRk6b7o3uheyg7TdpJsreiXZx7afAPhIsi2hE3YDDKF55
 pFdo6b32XbIkAJR9K/ch+YFsR/EoJ9Z9c1VQ9nfVObZhwEeIabt8Q/Zc9ZsMnLUiqw2R
 KPRg==
X-Gm-Message-State: AOAM533r6t6Q1StZjyZvOrX5CVfOOKXO9cxGX1VfQMwYFK4cNwI4bl9d
 46qdG1Un5CMTIXAlfi01jjhG3NJrG6Au53RXRG9F
X-Google-Smtp-Source: ABdhPJzmQEGSsZWBthsTvOSELeG8VS6EgUDmAeiuIV8vOPQMT9GShkXgjRb8/dyL69PldIEwTWjMSAxbclT2NqOHX4w=
X-Received: by 2002:a05:6902:568:: with SMTP id
 a8mr2394655ybt.472.1639719766471; 
 Thu, 16 Dec 2021 21:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20211129075451.418122-1-anup.patel@wdc.com>
 <20211129075451.418122-2-anup.patel@wdc.com>
In-Reply-To: <20211129075451.418122-2-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 16 Dec 2021 21:42:35 -0800
Message-ID: <CAOnJCU+=SfN0e-prQsrR8BHfcs7hP9Ab61cnD-yOEZZQ2Gh9cA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] RISC-V: KVM: Forward SBI experimental and vendor
 extensions
To: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_214248_321035_4EB069DA 
X-CRM114-Status: GOOD (  17.38  )
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

On Mon, Nov 29, 2021 at 12:10 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The SBI experimental extension space is for temporary (or experimental)
> stuff whereas SBI vendor extension space is for hardware vendor specific
> stuff. Both these SBI extension spaces won't be standardized by the SBI
> specification so let's blindly forward such SBI calls to the userspace.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
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
> index 641015549d12..ac0537d479d8 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -68,3 +68,30 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>

--
Regards,
Atish

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
