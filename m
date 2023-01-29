Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1AAC61D97
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jan 2023 12:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqQnVem3aFpbNCwUJyig2apjq4JhTI8leLmiW3PO4Ds=; b=dnSOC/+vtuJ5/O
	HXG6UW4AXhSLuSjgtG/XJ69VowreKaZUDoUQ+kiXM2cOkbodC0bt9hxJgSgTFuxefr0Tsq16K855b
	ibC7TG5ix6D+dUB2PI98PqEwgXRTceQOUXnIY8WfqVV5lBftNGS6Mck7GdmROxTUpu9jqr8MFtvxl
	TgD+vs0rIrDvJaro59NN3VDlLbeo8fBCTnaxgGrVT29urSUEAZ3Q2dJ+RoWXd2+th7BJ/kVd5RhPt
	hTTI5EoRetVUcUuBr3F8s+gVkpCCLUUx01UTDwq1JKqNnOANw6lkl5CNooKmu9SkQlaKLbTImAtOE
	BRq3ae9L3tZl7MDRW+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM6ur-001Qvb-R9; Sun, 29 Jan 2023 12:36:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM6um-001Qu2-Bo
	for linux-riscv@lists.infradead.org; Sun, 29 Jan 2023 12:36:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id qw12so8893251ejc.2
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 04:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pon3MbPPW13P0zNvYCd1smE05PP2P+jwr/geqehNzwE=;
        b=NhkuOfB0ra/AVj6j2EVFceBuFWItZkPYikE2pzqJ6Zb0E9Y5TN/8qH2vVwbALlL/n2
         XnWF7FqbsQrX8yG6z7gdiye1PfgdSRbBOUuzr5zYIXG5/HLudCCRaqut3pJOsPZXJc+G
         G6QsqPS7Q4QvSuaKK5Pf4FwwPL91+uJPw7r26FceO4Dfpxk1tHvfHbpq+mVeMqDpheWb
         CdC46mTCMan0NFCDEKcAEdxs5CKmqc3Q1YpUgg72vgO/6DCsywnKpDauA13yA6Vx/rhw
         4p22AxAKKP6EhmJ5jwk/XP1c3SUu1ewaQjqmzwhC8UX3SX2hBNfaZPSqJf+oz8FmU5fB
         /cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pon3MbPPW13P0zNvYCd1smE05PP2P+jwr/geqehNzwE=;
        b=wACe7nwR7NlsPR9vhyQgNwOkq/3ajdqCDmVMblNGCpo4B7fDgWtG1ZgrNFWQ6FIWIo
         P2IYOzJTWZCSBjSOjsLZ4/9EvFV83QOw/9bv4TwBnnmvf81gYRftef8C0ZqfJTTtN6+p
         6TPUuqTyy4fQo2p1VSWCBP7v82QmVde1jCIgg3Bd9IfYfk/guVCZ00cOHVb+hoCU/Vw0
         At4e5S/mZXEh2E8PmSiY2ZoB8iQkoLE0Nxi1tApnYfnJEx5xDG32nU+CoPatSW03fJKi
         S7mWbJXNrrqMZYStwOt7tYwFvojp7CDSTV2kJYG214iH1NivV8k5rJOMGa+FHLc+KcNd
         Hclg==
X-Gm-Message-State: AFqh2kqpiyxIG3CNWdxf1yCS6dFgBqYgAijStNInit45P8hmd3jClVBf
	2ZB4APC9UuTI1D0w7koHKN6xIDpnRcr0IHuvjwKMOg==
X-Google-Smtp-Source: AMrXdXvB3OmLcvEfxFlWKF6yDJduujeg3HFdqoO8lqh4sAOeyWvSijhDyFKCWrJUJ1Xhhmu2uSm7mtH1XcFgoyIBMcg=
X-Received: by 2002:a17:906:6a8e:b0:86e:3764:4f80 with SMTP id
 p14-20020a1709066a8e00b0086e37644f80mr5739206ejr.239.1674995766162; Sun, 29
 Jan 2023 04:36:06 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-10-atishp@rivosinc.com>
In-Reply-To: <20230127182558.2416400-10-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 29 Jan 2023 18:05:55 +0530
Message-ID: <CAAhSdy086ftqg_WXoAJJuXF0WFRpdiM5ipkOG1=XodDa7cZAPg@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] RISC-V: KVM: Make PMU functionality depend on Sscofpmf
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_043608_422155_8D184F83 
X-CRM114-Status: GOOD (  17.73  )
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

On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> The privilege mode filtering feature must be available in the host so
> that the host can inhibit the counters while the execution is in HS mode.
> Otherwise, the guests may have access to critical guest information.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_pmu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index d3fd551..7713927 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -79,6 +79,14 @@ int kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
>         struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>         struct kvm_pmc *pmc;
>
> +       /*
> +        * PMU functionality should be only available to guests if privilege mode
> +        * filtering is available in the host. Otherwise, guest will always count
> +        * events while the execution is in hypervisor mode.
> +        */
> +       if (!riscv_isa_extension_available(NULL, SSCOFPMF))
> +               return 0;
> +
>         ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
>         if (ret < 0)
>                 return ret;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
