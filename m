Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C98C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abRE2XQhpN/y7J0Dv/P1BQH77b+pDpUEDTtoKSm9Alo=; b=OM2cfp2kytP142
	1IUa6jsgnoycBfX1Z4ba/YmiA2zCxi/DxNYDx6l2ceQr6gq5bz+1T7k/3HexjTEuwkKEBRY62XAql
	ePKv2tn1ZBYZUe1H8pH1VpqhEWR3lpSJXIn6esG/83O52TlJgsNJmDG26FHeJDYpb0GCTryg7K/2v
	/gGEB3/fwQoD5/K9Sa9RZhbsuO43TD+aAvb96HRO1Iuty4Yqs6+ubeF3o2SHdgc2kb20ONtcgQXvT
	kR9sK2PsL4mXGWcfogW5NWPIPS2bh67ZHLJj/FBSrcRu025pJGqPaQovzOA4zk7/iL03Cz08LfOUP
	GSfOPlhHNJvr+ZZkzGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQiF-00F7df-0S;
	Wed, 13 Dec 2023 14:59:51 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQiC-00F7ce-0T
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 14:59:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33638e7f71aso497400f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 06:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702479586; x=1703084386; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8DBUvhPtbZDawFoEzfTVNDryKtEimlM9O26B02EurUc=;
        b=iHNjfKCcJ01II77fEU/Bb4OgVdY1ULzLJ3qRsxFoFKyspLp/LfH6J5F2z/fSfJhkLj
         jIwMwYNTE6uoj6cKXjQHI6qGWU5R2B6Ofw6kr/hwrw9G5Tu1K5HzV0YE5loqs/g1CsGk
         4yteXnzvwIpCiodt3CDqI9YNaQc4vuFuT9V0H+vxEK8qH5q7d3bgvawkw/EDAVHSOacq
         8lKZGLBO5yuJyhwJxxayXOqmfSRBN+ANakTg4bBLzZC9i8JNkRAdEPaYl87SIo97BVNR
         WC8klFkJIaD9kCvo8hyk3CPr/1Zabf5HCCbpF6WDAv6PbSDOs2iI3/78PN//aV20pX0J
         3KWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479586; x=1703084386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DBUvhPtbZDawFoEzfTVNDryKtEimlM9O26B02EurUc=;
        b=hZzZampe23DSPEVFC0mP2eqWWDPGsgbJy9LjEl8oyYQ+eJMMtFtyuLD4GsVl34x3B6
         K4+82DNPMpeFfqkVIN9xkny0i8sV++6/Naw+Qw65f6LArsKk6IiTMatMNFYJufM0vf2a
         iwA7a+8jkkQyltWK/raheyphfou3XJT2h98vzN9I+XdUiQWydZN5MEklx1QmLLjme/Uu
         hP/9F0BF88LdxtdeZyWK53bFR2Fti1bu94vcYEiiqsuWU+fuzAeD8s2JQSRkHBhNiOlt
         pJpRFtiyOAn8dru1DVgeSDhKoyIVly3PPkT2uStGTGncJfZFIAji0kZTaxozRhB0nlfx
         qqtg==
X-Gm-Message-State: AOJu0Yx21H8aj+f7dGiSYfjfRoc3ZS8tZVrKyLGRE3f8kvJ3t7WGKx0u
	X+3GDzZwRxIbhyRevP94S1M+lRC4lgW73GUvIF0=
X-Google-Smtp-Source: AGHT+IGLUXcjN5NhvYEVkfAJzzQF0Pn/hNoBqUffZURU7B7poOc4GgowWX8hQYY9gAB9PB13DPz48g==
X-Received: by 2002:a5d:4529:0:b0:336:42b2:5988 with SMTP id j9-20020a5d4529000000b0033642b25988mr327330wra.27.1702479586515;
        Wed, 13 Dec 2023 06:59:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d12-20020adfa40c000000b003333fa3d043sm13651788wra.12.2023.12.13.06.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:59:46 -0800 (PST)
Date: Wed, 13 Dec 2023 15:59:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, tjytimi@163.com, alex@ghiti.fr, 
	conor.dooley@microchip.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Haibo Xu <haibo1.xu@intel.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] KVM: riscv: selftests: Add Svadu Extension to
 get-reg-list testt
Message-ID: <20231213-3b68f487a41af1e3f3c96cf2@orel>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
 <20231102120129.11261-5-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231102120129.11261-5-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_065948_181321_E6630B49 
X-CRM114-Status: GOOD (  19.52  )
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

On Thu, Nov 02, 2023 at 12:01:25PM +0000, Yong-Xuan Wang wrote:
> Update the get-reg-list test to test the Svadu Extension is available
> for guest OS.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  .../testing/selftests/kvm/riscv/get-reg-list.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 9f99ea42f45f..972538d76f48 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -49,6 +49,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVADU:
>  		return true;
>  	/* AIA registers are always available when Ssaia can't be disabled */
>  	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
> @@ -340,6 +341,7 @@ static const char *isa_ext_id_to_str(__u64 id)
>  		"KVM_RISCV_ISA_EXT_ZICSR",
>  		"KVM_RISCV_ISA_EXT_ZIFENCEI",
>  		"KVM_RISCV_ISA_EXT_ZIHPM",
> +		"KVM_RISCV_ISA_EXT_SVADU",
>  	};
>  
>  	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) {
> @@ -700,6 +702,10 @@ static __u64 fp_d_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D,
>  };
>  
> +static __u64 svadu_regs[] = {
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVADU,
> +};
> +
>  #define BASE_SUBLIST \
>  	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
>  	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
> @@ -739,6 +745,9 @@ static __u64 fp_d_regs[] = {
>  #define FP_D_REGS_SUBLIST \
>  	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
>  		.regs_n = ARRAY_SIZE(fp_d_regs),}
> +#define SVADU_REGS_SUBLIST \
> +	{"svadu", .feature = KVM_RISCV_ISA_EXT_SVADU, .regs = svadu_regs, \
> +		.regs_n = ARRAY_SIZE(svadu_regs),}
>  
>  static struct vcpu_reg_list h_config = {
>  	.sublists = {
> @@ -876,6 +885,14 @@ static struct vcpu_reg_list fp_d_config = {
>  	},
>  };
>  
> +static struct vcpu_reg_list svadu_config = {
> +	.sublists = {
> +	BASE_SUBLIST,
> +	SVADU_REGS_SUBLIST,
> +	{0},
> +	},
> +};
> +
>  struct vcpu_reg_list *vcpu_configs[] = {
>  	&h_config,
>  	&zicbom_config,
> @@ -894,5 +911,6 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&aia_config,
>  	&fp_f_config,
>  	&fp_d_config,
> +	&svadu_config,
>  };
>  int vcpu_configs_n = ARRAY_SIZE(vcpu_configs);
> -- 
> 2.17.1
>

We should rebase this on [1] since it changes sublist management.

[1] https://lore.kernel.org/all/20231128145357.413321-2-apatel@ventanamicro.com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
