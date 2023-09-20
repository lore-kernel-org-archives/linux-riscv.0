Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53835CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEKjjSdCJGpY1XdsEVXI9QeBfSY62FcrYoZSPTP3H7k=; b=XVjGxiB7D0dMEC
	vxNt3ZQDiG5sm/KN7p2UA0w71xhdL6wTrNXrcmGDL50kHkpus52PbNOw4Hkgx0Wjuxm4pvC8egUkH
	ms1Nn/RAHh93T1RigNCO9Qj76KwsolNMw+7ZI2svCDn+XK/7V/oMN24l6IhyTrPR2hj6j1ENtvy4A
	LtXGblJRO+oIHzTQzIg3B06kd/006bJL9JmhOlpJfmkRmul9oRbMmfNpX+99Z7BuwVZZLtN+BLgHC
	ohOEFZiXMviIIaSPxbc0OVGG88C22NWhy0rTB261IyYSXCk9kgp/Vawz32cu7rq1IQO61BqdmXh27
	0p/AcQpNTpTtLkOxn9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirM1-0026ly-02;
	Wed, 20 Sep 2023 07:10:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirLy-0026kW-0H
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:10:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-404c023ef5eso48752945e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695193826; x=1695798626; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYSL2OliA8I9jFK5tlBwpRh/J6O5TRCGMrfD6pOu/aU=;
        b=dRQcLeV6LmDLTjmyep7YCOB2judFZkYHvW7YF8LORjtj6PaJEUKsYFwVEmrc4hxb7O
         QJvSXuIHWZh0/731ESGw5yMhaxZM+uzZfJ5Pw0JlVbCFKlRIcG4mEttM0XzsIQ3Wpcnv
         7WxozrjE8LVhzSp9+D0rIwuIj7KOBhepvI+WxZdRMMHDu4MN6CmgV802vYLIPWSlJH/A
         GNhN5eN1epOryVa37nS6jKvt+nE1NRk1Ai1xqlBg+rmM/n60n/K960d2CEOSdivfIL2J
         bODS3FDKX7z/jByQl0pPtMt8x6L0EJLtVEnmGBWP4JpuTAPg+4Vl2/ee9+tpMsO0YtLT
         Wxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695193826; x=1695798626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYSL2OliA8I9jFK5tlBwpRh/J6O5TRCGMrfD6pOu/aU=;
        b=V1opn2gI0QtAQ7m+N2HTQu1oRuEByzCeJ1uhYIYKeUnYkaTMlfan9zMvHAXzT4ElVc
         BDkj1L60IXS0aK7sDQcVMcwiTtCxEQHldftufqsj1hVgZ1nFWMXAYqSH/EosmYMRn19y
         M63MkviSZPoh42g2LoH5EbpkX15VdGBxvIcJ7k533AQiq2eJqVVSenwlOBhLqJOM+YUS
         VBv37BBHzTkZbVmNiQHuqh4LVtEA1WjS7wTWUpP7GWO9JjpDOH5pyPfdivTvTALhrK/R
         RwziY0e0OkOHLlXMWN4P+XUJ9yby2t0h6Ro58br/GcnEqS8EV6uXeceggWwV9NYuNX2c
         3SFQ==
X-Gm-Message-State: AOJu0YyJNBTj4aUfdU0zX7RSyN1NQdgNe4tfZKwXjrGK7ixORSJZmLKX
	6XSPTHiDeOf6T5FB0rTY2tL4tA==
X-Google-Smtp-Source: AGHT+IHn/mG9ufEsy9VzVESTw3Tyfbt+fkSxQsO9JP93/JoeonJvg8wA6zOSeLnF0Tu99ye6+NcfXQ==
X-Received: by 2002:adf:e990:0:b0:317:5f04:bc00 with SMTP id h16-20020adfe990000000b003175f04bc00mr1683384wrm.27.1695193826024;
        Wed, 20 Sep 2023 00:10:26 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e17-20020adffc51000000b0031435731dfasm17486584wrs.35.2023.09.20.00.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 00:10:25 -0700 (PDT)
Date: Wed, 20 Sep 2023 09:10:19 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Selectively filter-out AIA
 registers
Message-ID: <20230920-c1362aebecf7ef8e36489efa@orel>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-5-apatel@ventanamicro.com>
 <20230920-d524c40b616536d0ad8213c3@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920-d524c40b616536d0ad8213c3@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_001030_171200_159D817F 
X-CRM114-Status: GOOD (  32.81  )
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

On Wed, Sep 20, 2023 at 07:24:16AM +0200, Andrew Jones wrote:
> On Mon, Sep 18, 2023 at 11:36:46PM +0530, Anup Patel wrote:
> > Currently the AIA ONE_REG registers are reported by get-reg-list
> > as new registers for various vcpu_reg_list configs whenever Ssaia
> > is available on the host because Ssaia extension can only be
> > disabled by Smstateen extension which is not always available.
> > 
> > To tackle this, we should filter-out AIA ONE_REG registers only
> > when Ssaia can't be disabled for a VCPU.
> > 
> > Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../selftests/kvm/riscv/get-reg-list.c        | 23 +++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > index 76c0ad11e423..85907c86b835 100644
> > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > @@ -12,6 +12,8 @@
> >  
> >  #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK)
> >  
> > +static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
> > +
> >  bool filter_reg(__u64 reg)
> >  {
> >  	switch (reg & ~REG_MASK) {
> > @@ -48,6 +50,15 @@ bool filter_reg(__u64 reg)
> >  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
> >  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
> >  		return true;
> > +	/* AIA registers are always available when Ssaia can't be disabled */
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(sieh):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
> > +	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
> > +		return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA] ? true : false;
> 
> No need for the '? true : false'
> 
> >  	default:
> >  		break;
> >  	}
> > @@ -71,14 +82,22 @@ static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
> >  
> >  void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> >  {
> > +	int rc;
> >  	struct vcpu_reg_sublist *s;
> > +	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
> 
> nit: I think we prefer reverse xmas tree in kselftests, but whatever.
> 
> > +
> > +	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
> > +		__vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(i), &isa_ext_state[i]);
> >  
> >  	/*
> >  	 * Disable all extensions which were enabled by default
> >  	 * if they were available in the risc-v host.
> >  	 */
> > -	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
> > -		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
> > +	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
> > +		rc = __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
> > +		if (rc && isa_ext_state[i])
> 
> How helpful is it to check that isa_ext_state[i] isn't zero? The value of
> the register could be zero, right? Shouldn't we instead capture the return
> values from __vcpu_get_reg and if the return value is zero for a get,
> but nonzero for a set, then we know we have it, but can't disable it.

Eh, never mind. After sending this, I felt like there was something fishy
about my interpretation of how this works, so I took a second look. The
patch is correct as is, since we're checking for when the ISA extension
is present, but we can't disable it (just like it says it's doing :-) I
was thinking too much about AIA registers and not ISA extension registers.

> 
> > +			isa_ext_cant_disable[i] = true;
> > +	}
> >  
> >  	for_each_sublist(c, s) {
> >  		if (!s->feature)
> > -- 
> > 2.34.1
> >
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
