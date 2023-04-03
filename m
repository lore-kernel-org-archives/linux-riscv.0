Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F1AC77B60
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 09:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+RSxnvd8KeEBskE9t471rNyqnYKGkiPR35C/1bxeIQ=; b=SU4DRgxykh2Mkp
	xBhV+wl1SBkoc62+Ap9Y4VrbTAwtBK5Qof06vTdagBoX5DqSPprXGsbqMppTFtWE1HaLqXjbICqsN
	ZtawoLLtYbmYRE9WPh4MatpWxnFbbsUps/cPEpobAmp7/v3eyXUt+SW4fuWiezNtTH1+1yWADv0gq
	AXKwKqvAPgs3ErThP3vGRlEht8Ysyrewqh2fxqLksNNPfjZ5AuF9wABDmzDAtnw3ZacMFCHUp048Q
	ulQ9ppB2XRXZr54O5b1rN8PViHNf2ZZUve7ZyqlRI2AWvZBUlaM/l18Le7P74OkF+uMP5Vgv1+Yp2
	EkCotrRH6ozVXl5drrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZP-00EjZS-1Y;
	Mon, 03 Apr 2023 09:33:47 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZL-00EjTt-0n
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 09:33:45 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-17ab3a48158so30103085fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 02:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680514418; x=1683106418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgGBfD1W6b+btvEiU+YcKALiNsxE4ZvieFO4n+dcEoQ=;
        b=fjcMHYE2IfIQ+WQ6ELeWkN6nM3qLxL/znmXBFtw2Cd8Mqn5rG3/MFBFnHvLwt0mzeL
         rPPk279snCspJirExdHkRYXhcjsxoeIvSAdxnOZYZlhCUbMFKS/Qx0bxTaeMHsoRf7Kd
         /iG6SnkVGDwgyNV7XvQvBJSsKFnSo1v5CdTDd3XqB+82rrAV3PvkjAVbiQKtGDSkGRvG
         SzOFppRMwn7rhR4zu+6ddOCzayiKgKux7rDWMTZMm1dhgnVPJdt//x6BKvLOv2IIK34b
         /YIJ3O0H9mx3eANSbjno67qjwYAtFIZUZ/a/uQ27wvE1riYLG/Tch1IWN16ofsSyQKiL
         CHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680514418; x=1683106418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgGBfD1W6b+btvEiU+YcKALiNsxE4ZvieFO4n+dcEoQ=;
        b=LyeGWifn/3FeD0CjMumvPJYnB5/WfLdzx4xpLR6VdE40MiTVwRwEaQc4LX3QyQANvc
         kip4PQl/u64BVgSnn1twTYa+gBK2pSReG1liIV6P93H70ArR8eE5fkqcuQEQTS7neGPR
         T32TiVkdU+NsUjReKImhyo8AUm3FOlkF7wrNN2e9vrm9FPxRi+rkVkkQuMd/JKKgmWTM
         hWhXRCCydhlmDP8VAVsHpU2Wu3dI7Nn5Uwp1Qj3xI1XrvA0wVCcAjmtvQ7hS0RRqqOdV
         TTHlcuXBhQWOMSV+y3Yi4MmjAYFPur0E1/Iv+YgljMOjQ0GNcKRkNK7Kw8Q651P4NMl+
         MiyQ==
X-Gm-Message-State: AAQBX9cBQ1/wDjb0aReFCbJbrBt0PFXmudIKvjPmCNFog5bFGk4UHu3v
	MGanonRQnQGTuCteCfGOfsIzug==
X-Google-Smtp-Source: AK7set+ltL2X5guCtdTgJstf6Dn50g2Ksxi76SfvWGtGURX2OaR9ISpgLg9Bp+05N0nhVsw99aEzOw==
X-Received: by 2002:a05:6870:14d3:b0:17a:58ba:dbcc with SMTP id l19-20020a05687014d300b0017a58badbccmr19968566oab.59.1680514416574;
        Mon, 03 Apr 2023 02:33:36 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id f5-20020a9d6c05000000b006a154373578sm3953953otq.39.2023.04.03.02.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:33:36 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 2/8] RISC-V: Detect AIA CSRs from ISA string
Date: Mon,  3 Apr 2023 15:03:04 +0530
Message-Id: <20230403093310.2271142-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403093310.2271142-1-apatel@ventanamicro.com>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_023343_281703_763BC7EE 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
and Ssaia (S-mode AIA CSRs).

We extend the ISA string parsing to detect Smaia and Ssaia extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpu.c        | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6263a0de1c6a..9c8ae4399565 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -42,6 +42,8 @@
 #define RISCV_ISA_EXT_ZBB		30
 #define RISCV_ISA_EXT_ZICBOM		31
 #define RISCV_ISA_EXT_ZIHINTPAUSE	32
+#define RISCV_ISA_EXT_SSAIA		33
+#define RISCV_ISA_EXT_SMAIA		34
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 8400f0cc9704..7d20036bcc6c 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -188,8 +188,10 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 59d58ee0f68d..1b13a5823b90 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -221,8 +221,10 @@ void __init riscv_fill_hwcap(void)
 				}
 			} else {
 				/* sorted alphabetically */
+				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
+				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
