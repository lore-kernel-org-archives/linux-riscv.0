Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA978C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gxZff650v6KfgNqTNAQINxxSK7MhcGuOfDnKnEYEVg=; b=nFREx6HuYkSV6O
	rAwWuToeeCM90O3rZo2FkvtFajWb5JYGllXy+AfKiIHF2LqIProWE0iLJTJ2BuQywN8lh0MQXCFrc
	r5uYsJxUut26N40fRA4n9jLXBHvTAVVDOeRiivHQj/lTfJnjChHCcCgtzCiq9qkywnPOPNT74pCV8
	RA1wjKxxkUdot0iO+If+Ru+YxpBentjjEVW9F+1nyxxq1f7NUcs09wMo060qKtOf1Z41h6OiKCgxC
	tP1BF2ImvXHzjJAxJ94kWF7u3HCI3k0adOmeHayhb4pdBTBY4Ua4o0WwlIX3nxftBtksnEEdWRYlW
	mmbIX8k21MdMNTl0Hgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbKR-00GIbr-Q7; Thu, 02 Feb 2023 15:16:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbKP-00GIae-Fm
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 15:16:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id y1so2033220wru.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 07:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kFKtikxweyiapl+IexctfEvOemBJ00V0d++S9NjR+cA=;
        b=Xxoh56A0bGbr6ATBS+F/o7XGC9BVns5iYvUq1bgY1JH3FFR2ms2tOlDI/KrPgl6x1/
         CtUjKGWTSzFfyzOyDbToAsSzXeThYgu6/Sg5uH60HUXXpVx+tGj6993mBkC9ch9FL/cZ
         lCj4mPFpEV6XvuV4Jd1c2n7eeKvgwml3FjysuBGFh4N3q8cNhGQ4oFlpx9ObLO3BZ8Di
         WV8d2+WzrxtJYPSs+gU6wxiLUbbh/K2pno3etTmUnQTF1fFaFLxwFSk3/cZka4uYoMtB
         DKPFEoHS45dhjS9NsQSRMTBPR3NEjmY/eWBZk9uPu1rNllZpEh5PN+kTZoPJZIS1PUqQ
         8lJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFKtikxweyiapl+IexctfEvOemBJ00V0d++S9NjR+cA=;
        b=D6MKVcEH5dxEKfYoZJlJOL/ANUJmNijB0N6PdG/7HsDlClof+UxXsLrwAWcKEgeFdJ
         qz0j+dTPGcAKRBatGzOlEWCtSD4G7ROSGnpQUNDvKiiTfeaSLTuHJmQnMj2o1VH6ywYc
         oHpgJpK2jZ00HYcXJy9q2zvR7+ediG4YL0cb6aJEKAsq1vuD9Hz16BukHsjB1LqJqlGy
         Dvo9+fijBRPwx7kDmixhlNInGMfBektWCc69Cs3GYbm2X4XBbdM0s8z0UMaQSYEzesw1
         We/TbUafcswN11CkfQKReDrGkLZycdM8IkD0Ci/xnpgtWPIhKUxw+XJXjfKg39xTNcKI
         DkZQ==
X-Gm-Message-State: AO0yUKXzA8MuctV3dKzKkxXTIBP6DaKrbNPmB1m38Cq+eAn3TsCnd6Li
	RLFHydc8dYsRFE+YJipNZCtBeQ==
X-Google-Smtp-Source: AK7set9YcrVZ/I2ivVOBp6ZoJ4SQrCDwR3cYdEI9FCeixtQZ93JzJvaZ6A2Tfoc6K8O9v/+aSTjmzw==
X-Received: by 2002:a5d:4d85:0:b0:2be:3ccd:7f37 with SMTP id b5-20020a5d4d85000000b002be3ccd7f37mr5600723wru.52.1675351002561;
        Thu, 02 Feb 2023 07:16:42 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a13-20020adfeecd000000b002bbedd60a9asm19927404wrp.77.2023.02.02.07.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 07:16:42 -0800 (PST)
Date: Thu, 2 Feb 2023 16:16:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>, Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 04/14] RISC-V: KVM: Define a probe function for SBI
 extension data structures
Message-ID: <20230202151641.6edhtlf7fz7xsmdy@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-5-atishp@rivosinc.com>
 <20230202151433.kspo2g7cqsccoqsq@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230202151433.kspo2g7cqsccoqsq@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_071645_547364_08C18C3F 
X-CRM114-Status: GOOD (  28.46  )
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

On Thu, Feb 02, 2023 at 04:14:35PM +0100, Andrew Jones wrote:
> On Wed, Feb 01, 2023 at 03:12:40PM -0800, Atish Patra wrote:
> > Currently the probe function just checks if an SBI extension is
> > registered or not. However, the extension may not want to advertise
> > itself depending on some other condition.
> > An additional extension specific probe function will allow
> > extensions to decide if they want to be advertised to the caller or
> > not. Any extension that does not require additional dependency checks
> > can avoid implementing this function.
> > 
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
> >  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > index f79478a..45ba341 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > @@ -29,6 +29,9 @@ struct kvm_vcpu_sbi_extension {
> >  	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >  		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
> >  		       bool *exit);
> > +
> > +	/* Extension specific probe function */
> > +	unsigned long (*probe)(struct kvm_vcpu *vcpu);
> >  };
> >  
> >  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> > diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> > index 5d65c63..846d518 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_base.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> > @@ -19,6 +19,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >  {
> >  	int ret = 0;
> >  	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> > +	const struct kvm_vcpu_sbi_extension *sbi_ext;
> >  
> >  	switch (cp->a6) {
> >  	case SBI_EXT_BASE_GET_SPEC_VERSION:
> > @@ -43,8 +44,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >  			 */
> >  			kvm_riscv_vcpu_sbi_forward(vcpu, run);
> >  			*exit = true;
> > -		} else
> > -			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
> > +		} else {
> > +			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
> > +			if (sbi_ext) {
> > +				if (sbi_ext->probe)
> > +					*out_val = sbi_ext->probe(vcpu);
> > +				else
> > +					*out_val = 1;
> > +			} else
> > +				*out_val = 0;
> 
> Conor points out elsewhere that we need {} on both arms if one arm needs
> it. We actually don't need {} on either arm, though, or even the if, if
> we rewrite as
> 
>  *out_val = sbi_ext && sbi_ext->probe ? sbi_ext->probe(vcpu) : !!sbi_ext;

I sent too soon, I meant to add

In any case,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


> 
> Thanks,
> drew
> 
> > +		}
> >  		break;
> >  	case SBI_EXT_BASE_GET_MVENDORID:
> >  		*out_val = vcpu->arch.mvendorid;
> > -- 
> > 2.25.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
