Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7700C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 01:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxSQky10daDdC5tFGgIo8UBCp39w1fnXg/tDjFp2wRw=; b=lFsk2VBpPerK3guNFWPOWqwH6k
	+i/wZzr7ghix7KkdPGMHUjQ79BM9qNq3Whij5FpKXLQK/BFB6248YHROHidfu/+mgzvM67Z5XdhKW
	1zceY/QqjYwmOWyj6Iu3myu6APWQuJp/XVMsL1GdY1Sue2miESeyvo8vNQuIKP3aRZPh1qYhNg/V1
	Uny1SWjpob2gwre24RUn54YmCdCOI8dre7OlNGVu2ahstgVYiLFUhMCg/GqIOHhl4PjaGi3KCSPoB
	OFIevKTdQnyRGBjq7oW20Eotic0w8Z+F1S4HYpaICfaxraQ48gyVbGQVoxy/f8mgDUdP4kt5W1bG3
	CNwzOP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Wgq-0000000EYbG-0c9u;
	Sat, 27 Apr 2024 01:17:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Wgi-0000000EYaU-1eHr
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 01:17:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e834159f40so22226175ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 18:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714180631; x=1714785431; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gFg92GezPFh0mv6IYrarbWQAPQNkfvXf7+vfg6UWTLc=;
        b=xG3En4GM3VD3pO65/JPQ8f65L9eNNQWVuibXD1gwH+i1gvM7OHcIaBiQJIdyO/YKEZ
         yfrD9I+j5bjgZcSZcoKiJZT1WZzhQG3t5MqSQ3Xy1S7jYMRngIhUc28o2IrvKqrie+zM
         gXp9bL7fJ1qktrCkk3Zsuo3J6hYcrcI2BO/9UqSMrOiMKwlGLlPzXfLLIOKP3gUj0iom
         AqlzhZ2Zbd0PXJJrczPoToBxb7K5P9jvnjkTy4voejr9wYJxw9isWGKjoQsphN6IcRsR
         WHKiQarrXLgd1M3TOupoZDkJoEWWZ++UYMBm+W2mSVS5pJEAPjBHNfAY6ZpZe+xaAvvK
         /MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714180631; x=1714785431;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFg92GezPFh0mv6IYrarbWQAPQNkfvXf7+vfg6UWTLc=;
        b=CAA2prjh/+xjFit+2qKNVuC7POSTaI1bMj1/DFolyj8sU12FPOVdlSfoTDP6oYWlsd
         qQzWKTnWav+0eEmymJ1pJHuVHyVECDM/rTs9P9vVMWtluEGIf1JudGTfGsGysoEbB65T
         kltZll5Kyo6o/IM7Drj9eYuzv56jd819xDio6/kpSbP/2zwnNTz0NPhA7iZhszL8Amn7
         E7FPUNJO+LlWWt6HOQnEV14i4VJUIp4bJJZZkEWr4mi31tK7S4F2aWgXYJArARIxyuZc
         lAIRtJ2Khs+wEoyqwXvcz6pISBpi9+Xv7Jri6z4whWMwsysYCvQk57ZdVxeLpmrBpwnB
         d5uw==
X-Forwarded-Encrypted: i=1; AJvYcCVPgAdh6NaGFXUjVJYJO0Bs5xUXBldgUnel9H/odDZ/of/gmBQbs6asJHXSBwSqrP2c3eO0SYoLReUFaM/JoVLK84J+Orn1/ZrkbKzLiIB3
X-Gm-Message-State: AOJu0Yw+nGvK5AiHqVifhMPSFTVroTP1Xh50pys910VTJTLBZzQB7Iv1
	l2r43/WO6csgqmXn5SxRR/nVq196O03Z1VaYLUX7btH9zUPOdfZY08lTminfPO0=
X-Google-Smtp-Source: AGHT+IFShfk0g+JEaLyl2jF/RXq/ZXlGfv0o6Yy5A1krdr9Ne2WG7D/ikaciV2cGwvKkdC2eOZn6Qg==
X-Received: by 2002:a17:903:11c8:b0:1eb:7dc:7097 with SMTP id q8-20020a17090311c800b001eb07dc7097mr3484408plh.48.1714180631148;
        Fri, 26 Apr 2024 18:17:11 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001e3e081d07esm16424391plb.179.2024.04.26.18.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 18:17:10 -0700 (PDT)
Date: Fri, 26 Apr 2024 18:17:08 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [RFC PATCH 6/7] riscv: kvm: add SBI FWFT support for
 SBI_FWFT_DOUBLE_TRAP_ENABLE
Message-ID: <ZixSFLZYZaf8BKHP@debug.ba.rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-7-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418142701.1493091-7-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_181712_561194_7E497E7F 
X-CRM114-Status: GOOD (  14.50  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2024 at 04:26:45PM +0200, Cl=E9ment L=E9ger wrote:
>Add support in KVM SBI FWFT extension to allow VS-mode to request double
>trap enabling. Double traps can then be generated by VS-mode, allowing
>M-mode to redirect them to S-mode.
>
>Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
>---
> arch/riscv/include/asm/csr.h               |  1 +
> arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  2 +-
> arch/riscv/kvm/vcpu_sbi_fwft.c             | 41 ++++++++++++++++++++++
> 3 files changed, 43 insertions(+), 1 deletion(-)
>
>diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>index 905cdf894a57..ee1b73655bec 100644
>--- a/arch/riscv/include/asm/csr.h
>+++ b/arch/riscv/include/asm/csr.h
>@@ -196,6 +196,7 @@
> /* xENVCFG flags */
> #define ENVCFG_STCE			(_AC(1, ULL) << 63)
> #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
>+#define ENVCFG_DTE			(_AC(1, ULL) << 59)
> #define ENVCFG_CBZE			(_AC(1, UL) << 7)
> #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
> #define ENVCFG_CBIE_SHIFT		4
>diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/inclu=
de/asm/kvm_vcpu_sbi_fwft.h
>index 7dc1b80c7e6c..a9e20d655126 100644
>--- a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>@@ -11,7 +11,7 @@
>
> #include <asm/sbi.h>
>
>-#define KVM_SBI_FWFT_FEATURE_COUNT	1
>+#define KVM_SBI_FWFT_FEATURE_COUNT	2
>
> struct kvm_sbi_fwft_config;
> struct kvm_vcpu;
>diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft=
.c
>index b9b7f8fa6d22..9e8e397eb02f 100644
>--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
>+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
>@@ -9,10 +9,19 @@
> #include <linux/errno.h>
> #include <linux/err.h>
> #include <linux/kvm_host.h>
>+#include <linux/riscv_dbltrp.h>
> #include <asm/sbi.h>
> #include <asm/kvm_vcpu_sbi.h>
> #include <asm/kvm_vcpu_sbi_fwft.h>
>
>+#ifdef CONFIG_32BIT
>+# define CSR_HENVCFG_DBLTRP	CSR_HENVCFGH
>+# define DBLTRP_DTE	(ENVCFG_DTE >> 32)
>+#else
>+# define CSR_HENVCFG_DBLTRP	CSR_HENVCFG
>+# define DBLTRP_DTE	ENVCFG_DTE
>+#endif
>+
> #define MIS_DELEG (1UL << EXC_LOAD_MISALIGNED | 1UL << EXC_STORE_MISALIGN=
ED)
>
> static int kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
>@@ -36,6 +45,33 @@ static int kvm_sbi_fwft_get_misaligned_delegation(struc=
t kvm_vcpu *vcpu,
> 	return SBI_SUCCESS;
> }
>
>+static int kvm_sbi_fwft_set_double_trap(struct kvm_vcpu *vcpu,
>+					struct kvm_sbi_fwft_config *conf,
>+					unsigned long value)
>+{
>+	if (!riscv_double_trap_enabled())
>+		return SBI_ERR_NOT_SUPPORTED;

Why its required to check whether host has enabled double trap for itself ?
It's orthogonal to guest asking hypervisor to enable double trap.

Probably you need a check here whether underlying FW supports handling doub=
le
trap.

Am I missing something here?

>+
>+	if (value)
>+		csr_set(CSR_HENVCFG_DBLTRP, DBLTRP_DTE);
>+	else
>+		csr_clear(CSR_HENVCFG_DBLTRP, DBLTRP_DTE);

I think vcpu->arch.cfg has `henvcfg` field. Can we reflect it there as well=
 so that current
`henvcfg` copy in vcpu arch specifci config is consistent? Otherwise it'll =
be lost when vCPU
is scheduled out and later scheduled back in (on vcpu load)

Furthermore, lets not do feature specific alias names for CSR.

Instead let's keep consistent 64bit image of henvcfg in vcpu->arch.cfg.

And whenever it's time to pick up the setting, pick up logic either perform=
 the writes in
henvcfg. And if required it'll perform henvcfgh too (as `kvm_arch_vcpu_load=
` already does)

>+
>+	return SBI_SUCCESS;
>+}
>+
>+static int kvm_sbi_fwft_get_double_trap(struct kvm_vcpu *vcpu,
>+					struct kvm_sbi_fwft_config *conf,
>+					unsigned long *value)
>+{
>+	if (!riscv_double_trap_enabled())
>+		return SBI_ERR_NOT_SUPPORTED;
>+
>+	*value =3D (csr_read(CSR_HENVCFG_DBLTRP) & DBLTRP_DTE) !=3D 0;
>+
>+	return SBI_SUCCESS;
>+}
>+
> static struct kvm_sbi_fwft_config *
> kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t fe=
ature)
> {
>@@ -111,6 +147,11 @@ static const struct kvm_sbi_fwft_feature features[] =
=3D {
> 		.id =3D SBI_FWFT_MISALIGNED_DELEG,
> 		.set =3D kvm_sbi_fwft_set_misaligned_delegation,
> 		.get =3D kvm_sbi_fwft_get_misaligned_delegation,
>+	},
>+	{
>+		.id =3D SBI_FWFT_DOUBLE_TRAP_ENABLE,
>+		.set =3D kvm_sbi_fwft_set_double_trap,
>+		.get =3D kvm_sbi_fwft_get_double_trap,
> 	}
> };
>
>-- =

>2.43.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
