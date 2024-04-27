Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F2FC4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 15:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfGg/iSbCJnkPkxGFR0sSdySUGvL3HF8wR7gDV/hrYc=; b=L62fGDel4O08XruZ7tmt0BBpU0
	JYc+zkhtx+wkYzEJzXias9orHgXytqOLckQt7i9d45etLXyUWWG4mtb29eTbNNtDzFvXNURy04dee
	+fST5RgStR+RtaQ3VfrufaUfoWkzOWie8LxbvlJ8Uwb4M+3MBZ4gcu9jlzL1fY/kq+RogJ5uItVZ6
	nvZq5BBKercHpNPDrNXfDk9Dt+lNs1ADUWnY8uF/coS2AdxVJqOoG56aKmxcu20XcNGaORnry+0cd
	WKmURC0o1qfYgA2Qr+wZKScIAPEALN4zBVqJ1PFIVDxF0BnAXDn+cSBPPcAD8RkTmgVKWaOv1ApE0
	V/T3w/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0k64-0000000Fk2a-3bGx;
	Sat, 27 Apr 2024 15:36:16 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0k5z-0000000Fk10-3O7k
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 15:36:14 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2a2d248a2e1so3057766a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Apr 2024 08:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714232167; x=1714836967; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zTJw2A6adNJVmUl2COe/T/6PCi87dKKLBY/6yf/6PZY=;
        b=OBAct+DyeO6KmC/1ixr4SAnyJSuXIhV9/Fc6jPskIgyiF3/ZCtNLQOu3T3mjnmC3+B
         w+1dz8isUkf+U5CTTx97GmWFSLPS1LzXHIMDKIySvGkqq1VeF+h3SKlRMyw3XQ1dOKCu
         wFJ+067FkyEB3labWTn2S3JaveZnAUZs1OXZ3p2i8NsLkZajrutXwjjrUida/S396D7r
         EtUczpBhrSU/I/ymcd1K98LAxmi1YpCKQ8fWtDqHXMcK0UxjpLAE8DnYU9i4hmBjjGSX
         gUv0Yhb0otuZt0+/9QFMq3D6ACs9lHK/I+a13FcxunUMod6VMoAQCOwuG+9Rjmu1QQWR
         l8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714232167; x=1714836967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zTJw2A6adNJVmUl2COe/T/6PCi87dKKLBY/6yf/6PZY=;
        b=EKL7W5+ayIYouwTRMEFLvzTyzRqar+pzftqm1y0y3oZ8v8BMW0zbXDI3fXc6KIBiqs
         9Rwis9hUNDgOxeSOmMTZwjIAEH+aYI+kRMboUW0qegihde74PI6Qf3e//06b0+Ofaaez
         4Hd0DF6vUTjCkIaLG75Am/cgH1UhRQb9I+Rw1pDz92l4bi+22/xKaY2zbwd+NEs1Liom
         rY14YZlbWokfPds1zL53dJA94Alfuj0DY4kBZu/F7ByUjrdvNN0sgjgnfxes8fGFUAZI
         eymmkalgibywOOOfBncrgQMFAx9bY8Dp4ZPYJZ1ZLLC4DEEQ2jG6ui/Jl6yu5o4kV434
         g+gA==
X-Forwarded-Encrypted: i=1; AJvYcCWRnX1MGFJ1kePE4nTCUR0sxP6IcX/asWq1ZIMldIJ2hXfRobRanZpHq1fYcyXODEZPU8vb7o6QRE2SCRD27HMOfyYwk3wCgdJEhjAtxDm0
X-Gm-Message-State: AOJu0YzqVeJ9kk4CXjxuI6uu2PgdLn1pHrSLpL2CZQbz+weKgwkVG7AT
	WOui6ygWucItCh4ONuFoN9z5ZP/NhEPigAtAnsjAOVl3mrbazGBxARonHpokr+Y=
X-Google-Smtp-Source: AGHT+IF6xNtPoqawhIMLLPfVYL8r6zdUx0EVLZnU+vKFPxJUtAEJkdQ96JtmkdV5ZJvwpBa+CNpRDw==
X-Received: by 2002:a17:90a:4610:b0:2a7:329c:7976 with SMTP id w16-20020a17090a461000b002a7329c7976mr7869349pjg.8.1714232166957;
        Sat, 27 Apr 2024 08:36:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r6-20020a17090a5c8600b002ade3490b4asm10494669pji.22.2024.04.27.08.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 08:36:06 -0700 (PDT)
Date: Sat, 27 Apr 2024 08:36:04 -0700
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
Message-ID: <Zi0bZPoNIYbanIfO@debug.ba.rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-7-cleger@rivosinc.com>
 <ZixSFLZYZaf8BKHP@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZixSFLZYZaf8BKHP@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_083611_873020_B0CCD73E 
X-CRM114-Status: GOOD (  11.72  )
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

On Fri, Apr 26, 2024 at 06:17:08PM -0700, Deepak Gupta wrote:
>On Thu, Apr 18, 2024 at 04:26:45PM +0200, Cl=E9ment L=E9ger wrote:
>>Add support in KVM SBI FWFT extension to allow VS-mode to request double
>>trap enabling. Double traps can then be generated by VS-mode, allowing
>>M-mode to redirect them to S-mode.
>>
>>Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
>>---
>>arch/riscv/include/asm/csr.h               |  1 +
>>arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  2 +-
>>arch/riscv/kvm/vcpu_sbi_fwft.c             | 41 ++++++++++++++++++++++
>>3 files changed, 43 insertions(+), 1 deletion(-)
>>
>>diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>>index 905cdf894a57..ee1b73655bec 100644
>>--- a/arch/riscv/include/asm/csr.h
>>+++ b/arch/riscv/include/asm/csr.h
>>@@ -196,6 +196,7 @@
>>/* xENVCFG flags */
>>#define ENVCFG_STCE			(_AC(1, ULL) << 63)
>>#define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
>>+#define ENVCFG_DTE			(_AC(1, ULL) << 59)
>>#define ENVCFG_CBZE			(_AC(1, UL) << 7)
>>#define ENVCFG_CBCFE			(_AC(1, UL) << 6)
>>#define ENVCFG_CBIE_SHIFT		4
>>diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/incl=
ude/asm/kvm_vcpu_sbi_fwft.h
>>index 7dc1b80c7e6c..a9e20d655126 100644
>>--- a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>>+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>>@@ -11,7 +11,7 @@
>>
>>#include <asm/sbi.h>
>>
>>-#define KVM_SBI_FWFT_FEATURE_COUNT	1
>>+#define KVM_SBI_FWFT_FEATURE_COUNT	2
>>
>>struct kvm_sbi_fwft_config;
>>struct kvm_vcpu;
>>diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
>>index b9b7f8fa6d22..9e8e397eb02f 100644
>>--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
>>+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
>>@@ -9,10 +9,19 @@
>>#include <linux/errno.h>
>>#include <linux/err.h>
>>#include <linux/kvm_host.h>
>>+#include <linux/riscv_dbltrp.h>
>>#include <asm/sbi.h>
>>#include <asm/kvm_vcpu_sbi.h>
>>#include <asm/kvm_vcpu_sbi_fwft.h>
>>
>>+#ifdef CONFIG_32BIT
>>+# define CSR_HENVCFG_DBLTRP	CSR_HENVCFGH
>>+# define DBLTRP_DTE	(ENVCFG_DTE >> 32)
>>+#else
>>+# define CSR_HENVCFG_DBLTRP	CSR_HENVCFG
>>+# define DBLTRP_DTE	ENVCFG_DTE
>>+#endif
>>+
>>#define MIS_DELEG (1UL << EXC_LOAD_MISALIGNED | 1UL << EXC_STORE_MISALIGN=
ED)
>>
>>static int kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
>>@@ -36,6 +45,33 @@ static int kvm_sbi_fwft_get_misaligned_delegation(stru=
ct kvm_vcpu *vcpu,
>>	return SBI_SUCCESS;
>>}
>>
>>+static int kvm_sbi_fwft_set_double_trap(struct kvm_vcpu *vcpu,
>>+					struct kvm_sbi_fwft_config *conf,
>>+					unsigned long value)
>>+{
>>+	if (!riscv_double_trap_enabled())
>>+		return SBI_ERR_NOT_SUPPORTED;
>
>Why its required to check whether host has enabled double trap for itself ?
>It's orthogonal to guest asking hypervisor to enable double trap.
>
>Probably you need a check here whether underlying FW supports handling dou=
ble
>trap.
>
>Am I missing something here?
>

On this I am indeed missing that menvcfg.DTE has to be 1 for any less priv.
So, nevermind on this comment. Sorry about that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
