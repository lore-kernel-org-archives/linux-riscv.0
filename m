Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1557EC19F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XvV3Iiph1fIoTKk0jUe7El3KyEaWvFnqbWk8u3FUtA=; b=31+HjH6MxWfqrB
	Z1v/SQUvjcmAPMjeS9u3B+OiPqpHq54OK1WmMMM/nFt0cXuZUT0n9QPU5IfBNkatc5q7LOVS2kiz0
	iL29qDMH+DkYFZsNwE2DJibRoLTWe2kFriJ4K/T0SMFQWti+9bReuiPULysNbcrpf+RR0GKawdKHg
	6aex3Ze6DxIMvg1ZxY1NHuaGtLZ+L4LR6RT/QPtRlcTUtll8JPoDQZfdliflA6RjpFDcnM34vR0h+
	AiLJIGdsp8pg3HkNk/5VX/S69Vg4Xtaa9LvhM7DbmWi72jLkmFGNGl9e9zxTLwcey2z4DXICt5bF6
	F+7wCWRhp5+bUujJMCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZW6-00000006kV8-2uNo;
	Thu, 27 Feb 2025 08:45:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZVD-00000006kED-1OaT
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 08:44:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso3959955e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 00:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740645858; x=1741250658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0eD4WdY2Ar0Qpt9c3iLvWQtqo0+f9AP00jRPqQ8lu4I=;
        b=OKT6GhxdWfPDuOXDV1TN7i351aXz77WEsvwcWksK2W5k2S2/XppnhiloYuWwPxUk6f
         Q7se1dHHgP9JajrfEFn9uOLc8SFL80hGUseyk6CFAOTPyEdgHgcSdfAR19REjaLNBmfD
         WGO8sSXVpkgy2nN6Pu/kSvpxOnscmR7LL5pIAFyaoSXH9gvrfJOOTOrXlotRK5l3PMfr
         I3xqvWEAGYuTnkhh00IPeMWlAjgry0GkHwHocG+g0MayY2aJVgnkaPTowHSNUa5ZTHjy
         viZv//gaN0Or8ZWLfzqVybbQsbZaTEFmcbr4rzwBbeKHfkn4f8eR5ikSPR5po1XYmpyw
         kfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740645858; x=1741250658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0eD4WdY2Ar0Qpt9c3iLvWQtqo0+f9AP00jRPqQ8lu4I=;
        b=YIYUCELCXliUCKptY9AZsYTCOG2cu4YILC0ZTXPCoHeNI8f0iZqnIg0sbzHA0bs+M4
         zv6E4PwE2vsBQYaBOFEumqgbF2KDnis4WOKda3mTNOoDmvL1gURhFBZFODN84ss0WcVQ
         TcVj21EX2P9a6JZely6TqVC+VVVOFbLr6YYoMrKAtqetd7+Os2ezsUckH+ddJgHBnwxI
         gEoD8iBr/YDgWK18Z9JzVC1YhtVGp29WNLItbnPny+0ez1JAaphHXeT2IcsvoxR5xzfQ
         eNn6J31TfZJMjNqzkcd8BYaauD66x2XJJ5hZVxk754m17sv8pgaVs+7fP9yxYff8D3Br
         2bpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLdd4Ox2BYyLbGDSv37zksDkadwzp6y/lLnNpj80A0o9Zwe/H9Riqntw7rrSfLghPvtV1qCrti5uyxFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2fIHTxR9tFcaIogNTfKBpFe3wYO8WyXXwyT8Utp3QVg+8Qe2k
	jxXST3wK9uFSqrk/vx2k5telhPrxJSBXyecETJrTCdmTO9yk7AEO6siLR95FxRs=
X-Gm-Gg: ASbGnctw4Ie2u6dp8O7ruWE2U4PV2Ksa4IiJBiw/xHfeyVWs3Jrzf09Q9rGOK3RP7ng
	49MjAWb7NxooAN6dezSqWtQW+98GzlZimo11gzgbRa73VTuOZdHIpOgl/AMgk7r2pE1wf7+V52n
	H7tNe/udeSB1aCLLRAXQy8tDkyLoDkp+h6OLkNVX1SmLZItvgkawufVpy5t5Tk3aLKM/hTRqGC1
	k4EF/jYCGz7v0veGlVH/TOQKimeouEAX7PXZcc7RdcooXrHU9G6p8smzpt+Le3Y8eF8McfsiFMa
	AibtipSNYjUYIw==
X-Google-Smtp-Source: AGHT+IG7ml0QUrxxm1q148UuaevZWwyImW/BG/iHf4sSOi4FAdGUGP1loq2o5+xFJijpyPDy5kgSvA==
X-Received: by 2002:a05:600c:3c86:b0:439:9377:fa29 with SMTP id 5b1f17b1804b1-43ab903fe5bmr54754285e9.31.1740645857622;
        Thu, 27 Feb 2025 00:44:17 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::8cf0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f990esm15612155e9.5.2025.02.27.00.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:44:16 -0800 (PST)
Date: Thu, 27 Feb 2025 09:44:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] KVM: riscv: selftests: Do not start the counter in
 the overflow handler
Message-ID: <20250227-3799414d0651c86f6a815046@orel>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
 <20250226-kvm_pmu_improve-v1-2-74c058c2bf6d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226-kvm_pmu_improve-v1-2-74c058c2bf6d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_004419_374526_F3164F3E 
X-CRM114-Status: GOOD (  19.17  )
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

On Wed, Feb 26, 2025 at 12:25:04PM -0800, Atish Patra wrote:
> There is no need to start the counter in the overflow handler as we
> intend to trigger precise number of LCOFI interrupts through these
> tests. The overflow irq handler has already stopped the counter. As
> a result, the stop call from the test function may return already
> supported error which is fine as well.
  ^ stopped

> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index f45c0ecc902d..284bc80193bd 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -118,8 +118,8 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
>  
>  	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, counter, 1, stop_flags,
>  			0, 0, 0);
> -	__GUEST_ASSERT(ret.error == 0, "Unable to stop counter %ld error %ld\n",
> -			       counter, ret.error);
> +	__GUEST_ASSERT(ret.error == 0 || ret.error == SBI_ERR_ALREADY_STOPPED,
> +		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
>  }
>  
>  static void guest_illegal_exception_handler(struct ex_regs *regs)
> @@ -137,7 +137,6 @@ static void guest_irq_handler(struct ex_regs *regs)
>  	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
>  	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
>  	unsigned long overflown_mask;
> -	unsigned long counter_val = 0;
>  
>  	/* Validate that we are in the correct irq handler */
>  	GUEST_ASSERT_EQ(irq_num, IRQ_PMU_OVF);
> @@ -151,10 +150,6 @@ static void guest_irq_handler(struct ex_regs *regs)
>  	GUEST_ASSERT(overflown_mask & 0x01);
>  
>  	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
> -
> -	counter_val = READ_ONCE(snapshot_data->ctr_values[0]);
> -	/* Now start the counter to mimick the real driver behavior */
> -	start_counter(counter_in_use, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_val);
>  }
>  
>  static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
> 
> -- 
> 2.43.0
>

Other than the commit message,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
