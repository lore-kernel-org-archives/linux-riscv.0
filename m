Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDC8C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 23:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jg0OWvXqhrhTMTjB/LgjbIO1kRQPk9NIf76mCnsBxsI=; b=OPLfrSsCETQS8d2dsa6Ww+cWM0
	2VWSK0zWYjr+eJssaqKsl5tKFqHanf7zLIMNLAJf7TjQL1dhCtJMhBja/3XwU+cozvbFEIIeSFeuz
	e9JSp6E/KRmj4sTa868iUuDqaSuB4i3g9w6zjSAft5favSTQT4D2yKWhM3y6TW6nBEYAaYhKWSSb4
	tx4uZR0vEujGdSZ0BdmQ9OZaXWcPm314rDgRzrn3LMFEE10y/JPqfGR9i/09bjVrnIefGcPcOwaMs
	effts42MHyBBYfsmV5GyXkW+AABloKgHQi4EkaRyNgP8iV8xq4Dbi919gTb56MqaS/t6nEVwfTA01
	eUm4wQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0VFX-0000000ENwJ-0h4g;
	Fri, 26 Apr 2024 23:45:03 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0VFT-0000000ENuZ-242R
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 23:45:01 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1eab16c8d83so21535985ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 16:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714175094; x=1714779894; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=10+kG8+suMw5wf1kQMOtM4ixrtygd87W4O6yWN3oIlc=;
        b=lbGx1pRKuq5yaKf6uqxC+9NZYIyMITg5G8Eq2QGRCt1Y/Jm9qikR73PO1t2f6uzDBl
         I13oSRNvOvG89I3ctWzyUtlDvuSGGMQocPqRIxKMDt80uqn/TQ2sMyVSpatYX7UaI040
         yMVfgJf8DB8nPvTtrGL56QYOc1EnxpHGOZqR4j9XMQoCytKRMz2k+i0MS6jb4qSPgCOX
         grQ7oUG8qqgHO/zNItb5WiFJgC2OPBmmVGv+2EiZ2yuAd299G3q5i3q5JIy0WcrGcpVQ
         jhlRmPC/yw9NaxBDZlXA92weZxyOBaMIVUEfWLm6ZNvl82WEvJKuhipgJQz3tz7IA95E
         ezAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714175094; x=1714779894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10+kG8+suMw5wf1kQMOtM4ixrtygd87W4O6yWN3oIlc=;
        b=EaJiE+uzvwjPYP6wpGj8ixIFEqlQHgAq2Q8uZqkOtFyU6eCV5Ywmwr9GnV4U2rjtou
         Pl/6s3fBPskDW1kX4YOcNAH5YS6R7QSuOFrjvYD7uhmuDTnAoPJ0iYEpwBXmMUyrmVfP
         5hjOPfpkBrE7eBTXOFxyRiw+rKsWEMln9ceH+2cC4N36gVX/nlN3iJQGvCrxpRkb/zof
         WYHf/MHCpBQLD/BZyWFDjSjfOVoHW8WvXqKUS4VZ+hr9XAVxrkcfeGps7Wuo/v9HJBWF
         /PIepG5FFTOaWju/sWA2R1gUUNnlRNWTRKha1pOwLqCifb1GT3L0nawZ3CuadqZhGaWv
         bAog==
X-Forwarded-Encrypted: i=1; AJvYcCW9/rh1DBPQ6HzXnpEFDkFkKSNxco/gsfVQqbjHrpcVAWVf2fMy3QC81/QpoYix5cS84Nz/kucPz4QapPOZBHONJ8UE3oWUsy7AD53Uu/fl
X-Gm-Message-State: AOJu0YyQeQG4qesUPwVbFdQ3exDpWSozXpUwqZF24PCsJIz608MXoVy7
	MxrJFUykJ9l6zyo2d128OtxyFtYMXRiV3IG1Rx8W6PPYRPPgt2xCj+APKAVq8As=
X-Google-Smtp-Source: AGHT+IGcvjzu0bt6XA9PeX/VVTLN2fLbx6JeHHs9deVeeSpREMfxgrHF5aU2rl341rHMT2bBZ2wf2g==
X-Received: by 2002:a17:902:7b93:b0:1e3:cce4:bfe8 with SMTP id w19-20020a1709027b9300b001e3cce4bfe8mr3587190pll.65.1714175094555;
        Fri, 26 Apr 2024 16:44:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001e97772524asm10657366pls.234.2024.04.26.16.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 16:44:54 -0700 (PDT)
Date: Fri, 26 Apr 2024 16:44:51 -0700
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
Subject: Re: [RFC PATCH 1/7] riscv: kvm: add support for FWFT SBI extension
Message-ID: <Ziw8c0X0K3mXjJWK@debug.ba.rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-2-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418142701.1493091-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_164459_647407_18EB4197 
X-CRM114-Status: GOOD (  13.18  )
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

On Thu, Apr 18, 2024 at 04:26:40PM +0200, Cl=E9ment L=E9ger wrote:
>Add support for FWFT extension in KVM
>
>Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
>---
> arch/riscv/include/asm/kvm_host.h          |   5 +
> arch/riscv/include/asm/kvm_vcpu_sbi.h      |   1 +
> arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  37 ++++++
> arch/riscv/include/uapi/asm/kvm.h          |   1 +
> arch/riscv/kvm/Makefile                    |   1 +
> arch/riscv/kvm/vcpu.c                      |   5 +
> arch/riscv/kvm/vcpu_sbi.c                  |   4 +
> arch/riscv/kvm/vcpu_sbi_fwft.c             | 136 +++++++++++++++++++++
> 8 files changed, 190 insertions(+)
> create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> create mode 100644 arch/riscv/kvm/vcpu_sbi_fwft.c
>
>diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kv=
m_host.h
>index 484d04a92fa6..be60aaa07f57 100644
>--- a/arch/riscv/include/asm/kvm_host.h
>+++ b/arch/riscv/include/asm/kvm_host.h
>@@ -19,6 +19,7 @@
> #include <asm/kvm_vcpu_fp.h>
> #include <asm/kvm_vcpu_insn.h>
> #include <asm/kvm_vcpu_sbi.h>
>+#include <asm/kvm_vcpu_sbi_fwft.h>
> #include <asm/kvm_vcpu_timer.h>
> #include <asm/kvm_vcpu_pmu.h>
>
>@@ -169,6 +170,7 @@ struct kvm_vcpu_csr {
> struct kvm_vcpu_config {
> 	u64 henvcfg;
> 	u64 hstateen0;
>+	u64 hedeleg;
> };
>
> struct kvm_vcpu_smstateen_csr {
>@@ -261,6 +263,9 @@ struct kvm_vcpu_arch {
> 	/* Performance monitoring context */
> 	struct kvm_pmu pmu_context;
>
>+	/* Firmware feature SBI extension context */
>+	struct kvm_sbi_fwft fwft_context;
>+
> 	/* 'static' configurations which are set only once */
> 	struct kvm_vcpu_config cfg;
>
>diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/as=
m/kvm_vcpu_sbi.h
>index b96705258cf9..3a33bbacc233 100644
>--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
>+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>@@ -86,6 +86,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_=
srst;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
>+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>
>diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/inclu=
de/asm/kvm_vcpu_sbi_fwft.h
>new file mode 100644
>index 000000000000..7dc1b80c7e6c
>--- /dev/null
>+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>@@ -0,0 +1,37 @@
>+/* SPDX-License-Identifier: GPL-2.0-only */
>+/*
>+ * Copyright (c) 2023 Rivos Inc
>+ *
>+ * Authors:
>+ *     Atish Patra <atishp@rivosinc.com>

nit: probably need to fix Copyright year and Authors here :-)
Same in all new files being introduced.

>+ */
>+
>+#ifndef __KVM_VCPU_RISCV_FWFT_H
>+#define __KVM_VCPU_RISCV_FWFT_H
>+
>+#include <asm/sbi.h>
>+
>+#define KVM_SBI_FWFT_FEATURE_COUNT	1
>+
>+static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu,
>+			    enum sbi_fwft_feature_t feature,
>+			    unsigned long value, unsigned long flags)
>+{
>+	struct kvm_sbi_fwft_config *conf =3D kvm_sbi_fwft_get_config(vcpu,
>+								   feature);
>+	if (!conf)
>+		return SBI_ERR_DENIED;

Curious,
Why denied and not something like NOT_SUPPORTED NOT_AVAILABLE here?

>+
>+	if ((flags & ~SBI_FWFT_SET_FLAG_LOCK) !=3D 0)
>+		return SBI_ERR_INVALID_PARAM;
>+
>+	if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
>+		return SBI_ERR_DENIED;
>+
>+	conf->flags =3D flags;
>+
>+	return conf->feature->set(vcpu, conf, value);
>+}
>+

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
