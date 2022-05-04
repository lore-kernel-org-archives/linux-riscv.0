Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B91BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 02:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWbw2fypmWK8R9bm0ihN6sRsq7grvlgYg1nnhOJvaAo=; b=1vJZ70W8jKsGJg
	ClWGoRfsWGrWr8LBYWRjeJNbI90OGrBVpQS64DUuMoDVWdxoCXCOGgDBIJWmYRsN61p4lnujtidF8
	lcWHYq3hn+UQEqsokeoCnUVjwobui3j7Z2m1lEv83Rr9ITf8T2fU0UI+P7rekBy5jO7r9po4XSntr
	ghmVTgBIRcaaIW7X/oHhkezCYzVJ90XRIpAvwOtYM7SpVKj2xVrO2QNBi/ICWwOGnGZ2OKpukk1La
	ERiQLQGTH8gEfG9rpONucXbzkDWh0rwib8bUm9drqP5pht6pLhA61tDhI8d1UvLYjlcpqHG81C+Nb
	BiJHwJLrSeRfJcdxXAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm4XW-008QPo-Bn; Wed, 04 May 2022 02:14:54 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm4XT-008QOB-8N
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 02:14:52 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id m128so194595ybm.5
 for <linux-riscv@lists.infradead.org>; Tue, 03 May 2022 19:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cI3EnEiByhbyzhbmPT2Do41vovNa54bp0yAEgXmkBD8=;
 b=mmI6KLpp+c3z+QrHZdFKRJi6VoSF3GbpLtggCsIulsB7AubvolFrXmPGCEXTxlZANN
 f3DhMSm2PnbBoAetcz8hC4H9bKeaHz8TGfKNNSG94OErYzJkMD2FdlSJfm7Xj0+v6vUA
 nsviC93U75RbKSwrPBpYDtKRlXaAU8h4VESOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cI3EnEiByhbyzhbmPT2Do41vovNa54bp0yAEgXmkBD8=;
 b=s1Cl4/b68TCXv7xFbao2I4pW+guXPeRiD2ElkRO1AFLy7Dy6K6vO/E3E+XtSdiMRRu
 Jq6mlJ9kVBM/xL2GGIV9ARWsuRkDVzZvmhKkzEdwrKWfaQTxLQqt/edkNo0GbGZowk5b
 luWo1mYSKnPv9d7zAPqmvVSUSwLDLjkbgBzJ+qx1zmTwFFNBD2TCK9Wi2BGAOfSWmVB7
 rUeVkYjQoH3RvMFZr2qR8/y7TV8pebQ6LBFo5iw6lSyG16daxEZEJJNnyR0lXt98m/BD
 MHZKZkIp7poL3OkZzmX/hbsLdsDzjXAOkY55EK2YNB0WnGRBBzFnYQqQKKbdjFhPxkYT
 xN8Q==
X-Gm-Message-State: AOAM533iRB1zfZBP4/4u1mw0CQvhFvN+TGXjVurFQKtgDdaJISHgJl8f
 WyCiM6ifu21lGBgTwMZgxogrDR9oLQWWqoZ5h4Aj
X-Google-Smtp-Source: ABdhPJzutpVfXiertcAqEmQCd3u67RbEUlBKorJvKcoQ99nnjZTFxngHiLoSZ+nRRmPEImrirNk0UXweW8E5SV84HvY=
X-Received: by 2002:a25:9247:0:b0:645:ddd5:a182 with SMTP id
 e7-20020a259247000000b00645ddd5a182mr16046065ybo.289.1651630489026; Tue, 03
 May 2022 19:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112450.155624-1-apatel@ventanamicro.com>
 <20220420112450.155624-4-apatel@ventanamicro.com>
In-Reply-To: <20220420112450.155624-4-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 May 2022 19:14:38 -0700
Message-ID: <CAOnJCU+sDbJERnrcTUiLowvpfRDJ=-YPkc2dxzbfsD+qFBMUKw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] RISC-V: KVM: Treat SBI HFENCE calls as NOPs
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_191451_339664_141850B0 
X-CRM114-Status: GOOD (  15.60  )
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

On Wed, Apr 20, 2022 at 4:25 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should treat SBI HFENCE calls as NOPs until nested virtualization
> is supported by KVM RISC-V. This will help us test booting a hypervisor
> under KVM RISC-V.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_sbi_replace.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> index 0f217365c287..3c1dcd38358e 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -117,7 +117,11 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
>         case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
>         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
>         case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
> -       /* TODO: implement for nested hypervisor case */
> +               /*
> +                * Until nested virtualization is implemented, the
> +                * SBI HFENCE calls should be treated as NOPs
> +                */
> +               break;
>         default:
>                 ret = -EOPNOTSUPP;
>         }
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
