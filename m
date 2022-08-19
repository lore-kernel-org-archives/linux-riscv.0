Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECF3C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 16:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N26foQczCw+hjncGhCw4n2DIL7vq1G9jRLjM3EevHtM=; b=D/0WRI3z7HVTCd
	/H1ihgkfQqTIf6qCZ1CmUwxI+3g6w5XqZMYb1iXevnR31Oc6bknU+OMP1Br6tqw4/A4jx3T8Yewoa
	d5XOsnH+Wm8IL5QmT6oq8vOuQwFi+nwQjOyEhvfZTR6jEULQK8vxUd/yvEfeyroLjjKfvlErAPg6e
	SWgpCtTkQsoyispIh7XzEml79k2TsGA33wd2yWpM1LsWSFtqJ5r8vS05UvEybBPqzhSSq/s45GLgn
	QFaqqgaE4xcHxniElMuMtD5lJ7psGbQUKqm4TjYg1fM6PfjkvsOkJh+aQZtu37vacoj0k/o4N6oVs
	2lr24esNFcoZWuwaOmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP4bm-00AFDr-R2; Fri, 19 Aug 2022 16:12:30 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP4bj-00AEuK-Qo
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 16:12:29 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-33387bf0c4aso133205297b3.11
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 09:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=C0GWzj365wE2sR7xJX1mOB/d9C1PQzA2HDwoU7ywZuE=;
        b=C8rxUGor26d4pLtnEfWBFLrobr0zohYJN0RmYiPmeejX1B5WIjYxlIW6O6vpwvR1kl
         3uyk2b69rpX1Z3KkgD3NkX1UoIyiYooWrnZ6e7S7ptV0p9zUkVWpISqr0vV4dh6XhLMo
         E/w7i0Od1rZfz4/HXc07NbXbPwaU3YJg3txrbrh6/mjobSJcCr/bsWdBDVEacMmKXqAR
         ks00PMAhxsmPvbjHWRuvDJvT0i4MbZWIBfJl6VOxH8utFU8fi+hxR2qvbZ+V3nh5ZB2Z
         QBUwOkvnNc6PVLu7I6vwOjRs/zkpKfYc3BrO7YAqAjfgYZFMAZ7OdpFJnQAUhunI4M92
         Tv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=C0GWzj365wE2sR7xJX1mOB/d9C1PQzA2HDwoU7ywZuE=;
        b=j/rVovCHbznkyN4sNVfrjjAHRsfKaO6zPs2dIKQcZ8hh4Z+qEIuVXgbvP77RzmB/Xq
         /XSX89RfILIlsMOsfzqDaZGtBCPI+u3GZrkAfAzsyHr7UgLstnkFlkvILjF5jIWd6n0v
         dyQhZxbuP6UvlqaDXqzlhS/9m5p/kLlqwww5WaCepgjUoH2HrMlFMm+/JV6Wu7IZN24Y
         3KnSWUqeHsYgGI4tDPd3+hN58JjX1sVTfiFe25zRgPULMPJeaUBsZSJJcUjRkL3etxkz
         SCxNULq9/KZECfCUOcPKeiieZ536o4m7QRLsfBijgOx019FSQIJYCiCrU3JgziH90Efb
         ODhg==
X-Gm-Message-State: ACgBeo2Zal+hjY/HznxqiM253gTOEatJhtTBfRlcyN2x5XnKk07T7gdg
	otDImiPVY9fexKclZyEmYhcdjqMg+UmwbOdFujaywg==
X-Google-Smtp-Source: AA6agR4cI9mNUD+gm+cIqyleTiDxTP2r6qU3PI1eMiuXZNFUEQ8DnMtoNGS2ptGOR81qvDTW+PP72cquB+zEajJtuZA=
X-Received: by 2002:a5b:850:0:b0:68c:5798:a927 with SMTP id
 v16-20020a5b0850000000b0068c5798a927mr8403287ybq.8.1660925547310; Fri, 19 Aug
 2022 09:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220814141237.493457-1-mail@conchuod.ie> <20220814141237.493457-3-mail@conchuod.ie>
In-Reply-To: <20220814141237.493457-3-mail@conchuod.ie>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 Aug 2022 21:42:15 +0530
Message-ID: <CAAhSdy2bc4StpxUu6CgqygLG4FgzkN+VhsEavkge4rvJjPqNng@mail.gmail.com>
Subject: Re: [PATCH 2/4] riscv: kvm: move extern sbi_ext declarations to a header
To: Conor Dooley <mail@conchuod.ie>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Tong Tiangen <tongtiangen@huawei.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_091227_893550_9C8C9139 
X-CRM114-Status: GOOD (  17.47  )
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
> Sparse complains about missing statics in the declarations of several
> variables:
> arch/riscv/kvm/vcpu_sbi_replace.c:38:37: warning: symbol 'vcpu_sbi_ext_time' was not declared. Should it be static?
> arch/riscv/kvm/vcpu_sbi_replace.c:73:37: warning: symbol 'vcpu_sbi_ext_ipi' was not declared. Should it be static?
> arch/riscv/kvm/vcpu_sbi_replace.c:126:37: warning: symbol 'vcpu_sbi_ext_rfence' was not declared. Should it be static?
> arch/riscv/kvm/vcpu_sbi_replace.c:170:37: warning: symbol 'vcpu_sbi_ext_srst' was not declared. Should it be static?
> arch/riscv/kvm/vcpu_sbi_base.c:69:37: warning: symbol 'vcpu_sbi_ext_base' was not declared. Should it be static?
> arch/riscv/kvm/vcpu_sbi_base.c:90:37: warning: symbol 'vcpu_sbi_ext_experimental' was not declared. Should it be static?
> arch/riscv/kvm/vcpu_sbi_base.c:96:37: warning: symbol 'vcpu_sbi_ext_vendor' was not declared. Should it be static?
> arch/riscv/kvm/vcpu_sbi_hsm.c:115:37: warning: symbol 'vcpu_sbi_ext_hsm' was not declared. Should it be static?
>
> These variables are however used in vcpu_sbi.c where they are declared
> as extern. Move them to kvm_vcpu_sbi.h which is handily already
> included by the three other files.
>
> Fixes: a046c2d8578c ("RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to its own file")
> Fixes: 5f862df5585c ("RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v0.2")
> Fixes: 3e1d86569c21 ("RISC-V: KVM: Add SBI HSM extension in KVM")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

I have queued this fix for 6.0-rc1

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 12 ++++++++++++
>  arch/riscv/kvm/vcpu_sbi.c             | 12 +-----------
>  2 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 83d6d4d2b1df..26a446a34057 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -33,4 +33,16 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
>                                      u32 type, u64 flags);
>  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
>
> +#ifdef CONFIG_RISCV_SBI_V01
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
> +#endif
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
> +
>  #endif /* __RISCV_KVM_VCPU_SBI_H__ */
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index d45e7da3f0d3..f96991d230bf 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -32,23 +32,13 @@ static int kvm_linux_err_map_sbi(int err)
>         };
>  }
>
> -#ifdef CONFIG_RISCV_SBI_V01
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
> -#else
> +#ifndef CONFIG_RISCV_SBI_V01
>  static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
>         .extid_start = -1UL,
>         .extid_end = -1UL,
>         .handler = NULL,
>  };
>  #endif
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>
>  static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
>         &vcpu_sbi_ext_v01,
> --
> 2.37.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
