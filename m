Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CD0D15DBC
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGP4sYktj3m51Z8UrcNYY8Keo20optsA92S2dNstgn8=; b=Zvu3dCj04ChKGP4JrM7xBO3vfK
	3P0OOm2ntfKjntz3xjts2hpRvBh21bjyLKxGYGKWbgbXh5yaQZ9/ex40h8z3oxQSLXtzBflumWu7N
	YpxKa8BCPLY+CGvNC75oj2BZwAs3OcPf3jK5B2Tk/tTYYZCrxBgZg7EaNrnDSzTYSSSs1rWw7jFYe
	HwYzynPn8yk5cdKUKNNLQlqEcKz7S5cxbrYJ7jl0WrFFw94i64LbreDze24NJhEz0/qBrzbrMi5w4
	4/NYMXy5xKaT/8LMuWOJS4sKxz0j9jlr5z1OgUJ3FpQoOZBZpz8AZTLwBL3v/iiJAzATuRQaeSAkW
	aYqVcN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqVv-00000006r8d-2WHh;
	Wed, 03 Dec 2025 17:19:39 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqVq-00000006r7n-3Q5T
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 17:19:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-29555415c5fso57205ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 09:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764782374; x=1765387174; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntk4xZMcJdx9GyxuuhaDbNEO4dKaRG4g/4/eVizjmMk=;
        b=cG3nXSy/adSKaeLBrkfwp0oHpHTxWca9CT9AyKydQokU9hv+QhiOVam0fgyxQObw3j
         s+ijTsLlndRgZqJewSrNvNfth0Dk0ukPaLBYvFDa4KXLHxeC8hD6Jsz5WJOsWLBDF8zu
         mDcoeM0MDOOwx4ZoVrV8WWQoqmr0YZRf0JlkxYs/WR1JKoZLOwcXWJLxWRPanMdVN/Gb
         M3pQ0UZSmZUsK+03BIYnRe1rQktW25rmA8E1HTrjeieEv81pj5VDUkb4FnaN1x7pJ55N
         yZM8ys00s+d22JsN+3eGplNkyiaLkPGsTUuLfXvwz4RLdP5XGlC9MTZ4+ynKv79TzJaL
         doog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764782374; x=1765387174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntk4xZMcJdx9GyxuuhaDbNEO4dKaRG4g/4/eVizjmMk=;
        b=MSsMNF7M0fRMShAQmbP9uuvDyvgV4NxWSyOHpbQHhndOaKWiAjEpQg2X4z1zHXP2xE
         nt1lchIw1R3csayL4vug5n3KJkzrFOM9xNnNd9kxjyo6XQBKnJt/gpG8ol9qAjZ1X1yE
         CIledpTtqgf4vWuiP3oFW6OEiI6ggHNMYOWwfQfeBMeKhUEpiY+aZXDQl/jcXIm0sQuT
         Cm+jjVbfSimQZfj22GCveflnVRcwHCpihnP0WWQVMSyGC5KKp6k+q/GiLTmgrrOibOQQ
         fbSHOW1DwM5upsbbU69fQD7rv28Y6V/z+ZFO/aluNVYyQRBNFjvJtny+lljhpiGkkyKy
         SC0w==
X-Forwarded-Encrypted: i=1; AJvYcCWxgMEiaRMBRSZaCO7XQE9Cw50SFxxeCdhU62xZSHA/cQKrKMInPFkKM+1FeYB4RcDlaitdeB6eZtD9Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMo+iqJ7os6izOobpN/gPOSnyx654R+n/LpBp50RUt4UbGEd2G
	vC4dbucy7xU87rF8J/oFMDIzKFZs0kqaUgirFkkxYOYiKEPlBprO1LXK8zBJyyc9RpY=
X-Gm-Gg: ASbGncsD6cxEYkQ34fYijST8FFwJWtgzHg/v8lI2cF7X6TvHqyAqOfE+nkPcfc9tOb1
	FNgAMpIvLJTWSZWI+rufJQTvHdoGgKPi7RLO7e9YhmKOQqt1CW4WS/vcO2VLuaMGkPsL41ZWijM
	daVY6ruOROWCRUDxMo/1Y8TTLk/TwpnhQP5fiBkH/UQUmkgseArmq5HuEMnjVaz8FVU1jF+i8RZ
	WazcKAp0ZbwezvggQU67Rz2VlUOozeTjzgRK4PnMPEDWbuQXS5Vz/YmZ+BJZjFlTBPENL4AWwHd
	EsEmNR1DR3adbO4mqVLZEoDYdI+PEQ9qy2EoT9ZfglEp3CskdpykccusIiNgbFydM+8o36ug36b
	poDFn8mI5jvbCrSScQDtUyQjzxVl0rYz+5ZSWDKiY+whwDVbykfs9JtX3uJQbvbXvdxQ2BQqe83
	f1UHULiLpjsKVOEnnj1lkW
X-Google-Smtp-Source: AGHT+IEJ2Iti/5YvIxdDWKb+Z7naCD/zlmjgrBAtvofU3TTuAmsOEg1X1az1RgMcBWVQzA1qII+ZbQ==
X-Received: by 2002:a17:903:40cf:b0:29d:65ed:f481 with SMTP id d9443c01a7336-29d681418femr39682905ad.0.1764782373529;
        Wed, 03 Dec 2025 09:19:33 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce442691sm188814395ad.28.2025.12.03.09.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:19:33 -0800 (PST)
Date: Wed, 3 Dec 2025 09:19:28 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, ajones@ventanamicro.com, atishp@atishpatra.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] RISC-V: KVM: Allow zicfiss/zicfilp exts for Guest/VM
Message-ID: <aTBxIBZ0Jwn67OcV@debug.ba.rivosinc.com>
References: <cover.1764509485.git.zhouquan@iscas.ac.cn>
 <103e156ea1f2201db52034e370a907f46edafb83.1764509485.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <103e156ea1f2201db52034e370a907f46edafb83.1764509485.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_091935_054047_4A26C51B 
X-CRM114-Status: GOOD (  13.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 01, 2025 at 09:28:25AM +0800, zhouquan@iscas.ac.cn wrote:
>From: Quan Zhou <zhouquan@iscas.ac.cn>
>
>Extend the KVM ISA extension ONE_REG interface to allow KVM user
>space to detect and enable zicfiss/zicfilp exts for Guest/VM,
>the rules defined in the spec [1] are as follows:
>---
>1) Zicfiss extension introduces the SSE field (bit 3) in henvcfg.
>If the SSE field is set to 1, the Zicfiss extension is activated
>in VS-mode. When the SSE field is 0, the Zicfiss extension remains
>inactive in VS-mode.
>
>2) Zicfilp extension introduces the LPE field (bit 2) in henvcfg.
>When the LPE field is set to 1, the Zicfilp extension is enabled
>in VS-mode. When the LPE field is 0, the Zicfilp extension is not
>enabled in VS-mode.
>
>[1] - https://github.com/riscv/riscv-cfi
>
>Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
>---
> arch/riscv/include/uapi/asm/kvm.h | 2 ++
> arch/riscv/kvm/vcpu.c             | 6 ++++++
> arch/riscv/kvm/vcpu_onereg.c      | 2 ++
> 3 files changed, 10 insertions(+)
>
>diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
>index 759a4852c09a..7ca087848a43 100644
>--- a/arch/riscv/include/uapi/asm/kvm.h
>+++ b/arch/riscv/include/uapi/asm/kvm.h
>@@ -190,6 +190,8 @@ enum KVM_RISCV_ISA_EXT_ID {
> 	KVM_RISCV_ISA_EXT_ZFBFMIN,
> 	KVM_RISCV_ISA_EXT_ZVFBFMIN,
> 	KVM_RISCV_ISA_EXT_ZVFBFWMA,
>+	KVM_RISCV_ISA_EXT_ZICFILP,
>+	KVM_RISCV_ISA_EXT_ZICFISS,
> 	KVM_RISCV_ISA_EXT_MAX,
> };
>
>diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
>index 5ce35aba6069..098d77f9a886 100644
>--- a/arch/riscv/kvm/vcpu.c
>+++ b/arch/riscv/kvm/vcpu.c
>@@ -557,6 +557,12 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
> 	if (riscv_isa_extension_available(isa, ZICBOZ))
> 		cfg->henvcfg |= ENVCFG_CBZE;
>
>+	if (riscv_isa_extension_available(isa, ZICFILP))
>+		cfg->henvcfg |= ENVCFG_LPE;

Blindly enabling landing pad enforcement on guest kernel will lead to issues
(a guest kernel might not be ready and compiled with landing pad enforcement).
It must be done via a SSE interface where enable is requested by guest kernel.

>+
>+	if (riscv_isa_extension_available(isa, ZICFISS))
>+		cfg->henvcfg |= ENVCFG_SSE;

Same comment on shadow stack enable. While usually shadow stack usage is optin
where explicityl sspush/sspopchk/ssamoswap has to be part of codegen to use the
extension and not modifying existing instruction behavior (like zicfilp does on
`jalr`)
There is a situaion during early boot of kernel where shadow stack permissions
for init shadow stack might not have been configured (or satp == BARE at that
time), in those cases `sspush/sspopchk` in guest kernel will start faulting.

So enabling shadow stack should also be done via SSE interface.

That's how user cfi patchsets also do.

>+
> 	if (riscv_isa_extension_available(isa, SVADU) &&
> 	    !riscv_isa_extension_available(isa, SVADE))
> 		cfg->henvcfg |= ENVCFG_ADUE;
>diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
>index 865dae903aa0..3d05a4bafd9b 100644
>--- a/arch/riscv/kvm/vcpu_onereg.c
>+++ b/arch/riscv/kvm/vcpu_onereg.c
>@@ -72,6 +72,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
> 	KVM_ISA_EXT_ARR(ZICBOP),
> 	KVM_ISA_EXT_ARR(ZICBOZ),
> 	KVM_ISA_EXT_ARR(ZICCRSE),
>+	KVM_ISA_EXT_ARR(ZICFILP),
>+	KVM_ISA_EXT_ARR(ZICFISS),
> 	KVM_ISA_EXT_ARR(ZICNTR),
> 	KVM_ISA_EXT_ARR(ZICOND),
> 	KVM_ISA_EXT_ARR(ZICSR),
>-- 
>2.34.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
