Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3083AC04FF8
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84qin7GbAWbyus1/xcyFhOJPfDT+OOzI59CuxEktd9A=; b=SZOl9hVWRr8gqs
	GHC2i2xVeihVL/biWiGCt9a5rG8PXtlFbBwoxnTUXRLmpbXVGHUtvsNNoscast25wgGser8L1KlVM
	Pk8ZKwjVwKgKALW8/IgSr5iosndmEdenCB6jFENItqvRDCbQ3/IKKV2sXtFpTuOnTFKuL38tRKORc
	BWO9xkHBz978FK8SbEGvKHfWEPEtQfOlO/yXcsYlrlL2l4oiFZ2YLZ9NFZY6goSjcm8q4WbacWCOL
	CNkmvKWrfFAxX+J0s6LbV6TthxLl0fEq8n0wiTRBKgW+jixQaF9G3e7ov29SVj7Q00D26v43tnHXI
	P5NVpdA6seqhCKvgkzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzByA-0000000GYNu-1n87;
	Tue, 23 Apr 2024 08:57:42 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzBy6-0000000GYKU-0Nn2;
	Tue, 23 Apr 2024 08:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713862656;
	bh=8DzYTWeR1MFLHFT73kWX3M2k0VGpj5e6788N1mCfWks=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=0m7xbwAuFCRZIYDNvnWtD5eJOkrf68SA+gwQQt04r4jJauSM2UG2ME2BaMD3Gu+Qp
	 PkAcVeGivyAlyl9eaiR0AhKoPy8W4sMjKqy8on3ig6xfTae8tzSZ6NKhEvNNigHfSK
	 KR7inMbFiTGX+PuckTGLTXzSDDNuHzR6TRjPOAcBGuTr5l3FkpYyCUzDetm0FKqpKb
	 a8Z9HRooZNI/7CxxXvjvjnpZPNcON8w2t3rxlWlnvcm2b2d0+Epy9jVmAnGGSMCw7U
	 MotP90H7HqrsgrHem01kTEN7yLhX5QYiDm4p+Of5ED3bSzeEYOpR+XoCYl0XxnDk+f
	 e7TmfzPNyxd8Q==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 39F6F3781183;
	Tue, 23 Apr 2024 08:57:28 +0000 (UTC)
Message-ID: <4f4ca27c-846e-4f8a-928d-fa680c51361c@collabora.com>
Date: Tue, 23 Apr 2024 13:58:02 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, samuel.holland@sifive.com,
 Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v8 19/24] KVM: riscv: selftests: Add Sscofpmf to
 get-reg-list test
To: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org
References: <20240420151741.962500-1-atishp@rivosinc.com>
 <20240420151741.962500-20-atishp@rivosinc.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20240420151741.962500-20-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_015738_303778_A00C8C33 
X-CRM114-Status: GOOD (  11.39  )
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

On 4/20/24 8:17 PM, Atish Patra wrote:
> The KVM RISC-V allows Sscofpmf extension for Guest/VM so let us
> add this extension to get-reg-list test.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
LGTM

Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index b882b7b9b785..222198dd6d04 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -43,6 +43,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
> @@ -408,6 +409,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(V),
>  		KVM_ISA_EXT_ARR(SMSTATEEN),
>  		KVM_ISA_EXT_ARR(SSAIA),
> +		KVM_ISA_EXT_ARR(SSCOFPMF),
>  		KVM_ISA_EXT_ARR(SSTC),
>  		KVM_ISA_EXT_ARR(SVINVAL),
>  		KVM_ISA_EXT_ARR(SVNAPOT),
> @@ -931,6 +933,7 @@ KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
>  KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
>  KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
>  KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
> +KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
>  KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
> @@ -986,6 +989,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_fp_d,
>  	&config_h,
>  	&config_smstateen,
> +	&config_sscofpmf,
>  	&config_sstc,
>  	&config_svinval,
>  	&config_svnapot,

-- 
BR,
Muhammad Usama Anjum

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
