Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFE5ECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 07:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVwJmAIK8sZRUDELwYkZlcryuBSL9jx6cZ1ROYOj+ys=; b=K3Ithu99Bar/5l
	ypJzUjwyXRHWqf6TmrQAitTKWsRtVICMoMGCrlUA8Flwoja7sZQYD+AmroSROQjm7SjX6AMonRx4k
	szB35MKojrQgaw9hd+z0twGamf7C0mcviPMgdqmMWpgj5lHYKeonm02Z4Vr4myio5UgY+1gAqKX2F
	moeoZOIOvdRordLFefKhiLoNjGeQ33MZsqIrHg9iBWOqvmwP5hMQrMRmLetBoJR5Aw7gjG+v6YWsW
	wdTt8LHnrSC+/OTQHUJb0wzdGbf20NF1YKlh6pntrsgn0jhXgPYA13O96tqVMKdj9md+X8Sh4CdKQ
	Vhf82dy3CZs7zBz/ds1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCCN-000Th0-U3; Thu, 08 Sep 2022 07:43:43 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCCL-000Tg5-IL
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 07:43:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id r18so8833966eja.11
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=s+wdYvBGkWFw8GKxXD1LOmw8mLPf4VgGkpb36tkONuI=;
        b=h3vMPlY+4h/RJNKRFO2A3FdbOGcWz6L4FWjkcG/O7J9H8gjTaE74I+hbXI9YTY2Gz8
         uM/0TSA8jYB9i9lpx7JkPutnNkvAWG4CnZMxG48ZZxGDVDE16hPrVRQyXQJL/A0Pc2SA
         xTMeCL7XiJkzpXbZ0Jr9LRUR8quNOhhf6s3PQxIXU73KB7EPPy8KDaOtrj33EBjlD4RV
         L1ZzYGaD8p7skZDarNLUsu5cYY6OW38SbZwE5G53pG9S3wX6+PrIEVcQNSApK+jZWDkI
         mC1LUHGiK4zfrNEHeHyJWKq9BDhJEVsZSU4AFQv2BFy8fc6ou/6eiARffiif4s/GqmCZ
         Dkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=s+wdYvBGkWFw8GKxXD1LOmw8mLPf4VgGkpb36tkONuI=;
        b=3pzg0wjyB8Gz+VnsaaykEr0JtMx7wu75cdhvOPTRrg5Hcw7lRIIUZSJFxOYJwL+lRK
         M2egx+DLjC7ty8oj4q8KAdlmqNYyFZaz7qPYF/m241Ur7ba9jnqfP5sSHKF9M5xzogIi
         myd1sauqMoGa6CYBSaENB7MEQ1f63bmyeSaaQRTQw2fGiEqZXfGXUYezr0FTKZNapTib
         pxuI3A0Zj7mFjTF/fG3Aun2QtKliqy8qidFIDPUwPn2zmrEbglG6MtZKgZ6q06BhU9dw
         7DeWyRklV1PE4IbmAqHD6WEcpEfj5NM4nouXG40aU+w5KH9XMAfKBIor9YIK4TrZnpye
         XlIg==
X-Gm-Message-State: ACgBeo32RmM4BTsJH+Qxu7f9dd10LjaQjZ76h4s2wJg9QESvNSGO7uwJ
	Wg3e+Y8pDfRUo2sQzh3McKpEHg==
X-Google-Smtp-Source: AA6agR46a989OfYBcmaTAmzgP7L2eh/DehstoR0AxS/MMKSxJiDq/JKi3lrJbKhqozah1otssDlEKQ==
X-Received: by 2002:a17:907:2ccc:b0:741:990f:fe48 with SMTP id hg12-20020a1709072ccc00b00741990ffe48mr4971182ejc.390.1662623019350;
        Thu, 08 Sep 2022 00:43:39 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060cc900b00764a76d5888sm884712ejh.27.2022.09.08.00.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 00:43:38 -0700 (PDT)
Date: Thu, 8 Sep 2022 09:43:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] RISC-V: KVM: Provide UAPI for Zicbom block size
Message-ID: <20220908074337.qsipcynxrvuj4fhg@kamzik>
References: <20220906145842.965488-1-ajones@ventanamicro.com>
 <20220906145842.965488-2-ajones@ventanamicro.com>
 <CAOnJCUJDoAiDhavwisxj4QVGruTb67STb_WqQ5NuojzDwLLqng@mail.gmail.com>
 <CAAhSdy3Bun6wE1wH=n9JejSwoMMzt5wPCMQD=GehQq0eD-Ni5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3Bun6wE1wH=n9JejSwoMMzt5wPCMQD=GehQq0eD-Ni5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_004341_632118_24553806 
X-CRM114-Status: GOOD (  28.95  )
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

On Thu, Sep 08, 2022 at 08:24:32AM +0530, Anup Patel wrote:
> On Thu, Sep 8, 2022 at 4:19 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> >
> >
> > On Tue, Sep 6, 2022 at 7:58 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >>
> >> We're about to allow guests to use the Zicbom extension. KVM
> >> userspace needs to know the cache block size in order to
> >> properly advertise it to the guest. Provide a virtual config
> >> register for userspace to get it with the GET_ONE_REG API, but
> >> setting it cannot be supported, so disallow SET_ONE_REG.
> >>
> >> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>  arch/riscv/include/uapi/asm/kvm.h | 1 +
> >>  arch/riscv/kvm/vcpu.c             | 6 ++++++
> >>  arch/riscv/mm/cacheflush.c        | 1 +
> >>  3 files changed, 8 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> >> index 7351417afd62..b9a4cf36be4b 100644
> >> --- a/arch/riscv/include/uapi/asm/kvm.h
> >> +++ b/arch/riscv/include/uapi/asm/kvm.h
> >> @@ -48,6 +48,7 @@ struct kvm_sregs {
> >>  /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> >>  struct kvm_riscv_config {
> >>         unsigned long isa;
> >> +       unsigned long zicbom_block_size;
> >>  };
> >>
> >>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> >> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> >> index d0f08d5b4282..3f36e79876e7 100644
> >> --- a/arch/riscv/kvm/vcpu.c
> >> +++ b/arch/riscv/kvm/vcpu.c
> >> @@ -18,6 +18,7 @@
> >>  #include <linux/fs.h>
> >>  #include <linux/kvm_host.h>
> >>  #include <asm/csr.h>
> >> +#include <asm/cacheflush.h>
> >>  #include <asm/hwcap.h>
> >>
> >>  const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
> >> @@ -254,6 +255,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
> >>         case KVM_REG_RISCV_CONFIG_REG(isa):
> >>                 reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
> >>                 break;
> >> +       case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> >> +               reg_val = riscv_cbom_block_size;
> >> +               break;
> >
> >
> > Don't we need CONFIG_RISCV_ISA_ZICBOM here ? This one reg interface should only return riscv_cbom_block_size if we enable the parsing. Isn't it ?
> 
> The riscv_cbom_block_size is in the wrong location. This global variable
> should always be available irrespective CONFIG_RISCV_ISA_ZICBOM
> is enabled or not.

Just to clarify, riscv_cbom_block_size *was* in the wrong location, but
after Anup's move patch, which this patch is based on, it's in the right
location.

> 
> Better to check ISA feature flag instead of CONFIG_RISCV_ISA_ZICBOM.

Good suggestion. It does seem reasonable that reading a virtual register,
which is dependent on an ISA feature, should return EINVAL when the ISA
feature isn't present. If that isn't yet documented somewhere, then I'll
add it to my TODO list to document it as well, but I'm not sure we want
to hold up this patch on a documentation patch. For now I'll just spin a
v3 which adds the check.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
