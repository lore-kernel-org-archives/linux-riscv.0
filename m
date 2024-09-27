Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39A5CDD1B1
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jmZnWSRKwsb9j0PgH1A2Q2XTmbwT+TmfaVv76ho0FU=; b=c8rAzyqPIwnOfV
	zOD5fghgO1l5fP+sSRy9Nry1STuSkpsaqJhMhEGADx9tRbkCOodPTrfYTwb0tMe84kK3DVtNtB0UP
	zKNniqq0F2EC35yWpI88AXSbvZZM0s64G+wi8u/gBueT3Z51EnWMz2SnhSWEYGFTZo7d0Fsp2KRcw
	Oc9z7gjCLQowvpKACP7AC8KP4dGQbN5zXesTNdOqMCDEvPsZ9M/O/JuhHK3Xy5Ig/TPslFAyEMPsT
	7LdrMaFk+Q9e4kTyMSlmhUXj+FStLT5TWfmumA2Xm0X4Bd3CruwdikgNwNbm5knMMOOXAMZX1Cz5D
	MuGPPIoCLhmgJwT1/OMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suBES-0000000BKTs-0Q8I;
	Fri, 27 Sep 2024 13:42:04 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suBEO-0000000BKRG-2tRm
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 13:42:02 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-2e08085596eso1944009a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1727444519; x=1728049319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/yqPChQyX7MOum1UYAETN40UEWggulMYnRGOrfdjTw=;
        b=P9EujWa5QbdnN2DQ4twUxa+2cmSd620ybYGtLB5mSA4O2KKl9j4WWBGwQ5sPQbfXgR
         D4dXixpsc241UJx7ZR8+XFcjmq+pv2GFz4IkgLerdnDuWyjSPMoutsr+8Rfy7gwTpoqz
         hpKRDJF3kOSZIMrYOnaLIpr4Clia+ufgeBMd3MIPFn1zTUWDuyP9o/1GwDtHG+0UIP7j
         fmRs3T6V5DwpkaRp/s4CEZ8HU4DfjS7w9j7z9xXLyVfQMN2m4j3k4wd6Ds4uoeI3mNQU
         KYM0zsweq3pV/cYj/zDyUWaPOILIgoP9l/d8gImEIF6Sac+mTDfsDWPMUkWDSHZituA2
         oKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727444519; x=1728049319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/yqPChQyX7MOum1UYAETN40UEWggulMYnRGOrfdjTw=;
        b=N1d2nHZPW4Ngmm+xDv/7TVtow0+EWzca7fU/QIoZXhS+sCKDLZZR2VtZwC4gdbKPmb
         FoxfH+BskUV/RcL3AzlT4GoXOZvnOOup7I/uYdJSesLpRPF1ywBiAWdJsl9aYDewYAKn
         iO2doYUPodSoCSOQwq/yr/g2+cAZwS7UfTuOIr9dP94a/CX7xVvkLFsxpeUGTpK0xshi
         ViLEDgDmuGXE0GneKtNpfBk17ZNmPKnRzMWYqq4Exm8BNFI2kVcsmjfmCVFJ7Nsrb8VT
         kRpXeUlSuJGzRhiRJZrLcCEUb07z+GqKKtMWTw31UXNZe1hdRgdyeMFa5bz65HUUCNtR
         xviA==
X-Forwarded-Encrypted: i=1; AJvYcCXef8VxjU5xTnpIk5wBWgX7/VmRfAo6RZ4ySvHh+z6vYVN66GqxyJPSywgfgpJnQV+r6By0D56hGvggaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZfhFfJ6kz0hi2Pr5EYyXoMbU3UgdKcrJNv/T9sAJAve639oYq
	TRGBuuNxK56dcl0eZkI5GS5BsozYscODjZjVHqJc9VC3X9ENj58qSMmXTG1DF/k=
X-Google-Smtp-Source: AGHT+IHabM478iaczeNhXVUodHzrMPBemfKWA5fTgJkjCbr2r/xavEqWXUBcqPn4lkdWJWZph5i48Q==
X-Received: by 2002:a17:90a:8d10:b0:2d2:453:12cb with SMTP id 98e67ed59e1d1-2e0b8879624mr4212103a91.2.1727444519527;
        Fri, 27 Sep 2024 06:41:59 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e16d6d2sm5671744a91.2.2024.09.27.06.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 06:41:58 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 27 Sep 2024 21:41:44 +0800
Subject: [PATCH RFC v2 2/3] riscv: Add Svukte extension support
MIME-Version: 1.0
Message-Id: <20240927-dev-maxh-svukte-rebase-2-v2-2-9afe57c33aee@sifive.com>
References: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
In-Reply-To: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3103; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=2iAOqQjnUXTcZ5Cs8EpYQntXVuHf3Et98OZwyjYbx+4=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBm9rYemwDJvWM0Es7Z0BdQVJl6wPqKNr+icYn8S
 ixNxmwo4PSJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZva2HgAKCRDSA/2dB3lA
 vcTVC/9ZFgIJK+oxCZZJE7Vz0znghLwi7WZa3X3R3Oqf1yywBf3G37oy1p5ti/thDZgLMXxS6Tq
 hPXpTrYShGZRznXe9vclpZaFnaboitKby3ugrzpm6Q+y58OboJoP0ml+GP7cSms6Tl/uLJuOc7F
 g4mtWMwiqacecSkekyhswbCvL7lAOMBzW0lqiQ+I4hCxrh7/zJ+i6bGe1CJ/tdwlTc+PxZwcC3x
 eIJVccd2Hf1c15KRYMsaFK85hiiWzn/D+38vKxfAvP5pEPRCmhbNbnhQ/sgUG/6OlRL8BRYsyu8
 bhGUkRnP4DA/rthVm/hqQ8xefxIlrC94xa9Kh3g7LPe8Noc4Jv+kC+Yb7zHUZXCO3UzvdrhhMO/
 C9ooqjtoz/fDVqcV6VXY+Oqb3QvadyPTAiBTiDya9vQTqyQxmWUxzdQhOMFCHGKloihnXpB58Sn
 9oeYze98ONfxd9i83FVmco+5C01cnnYYMdcu7zUr2nT2HDwKpFt4vaFOrAt/j2xxkrc4s=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_064200_805521_F6983FA0 
X-CRM114-Status: GOOD (  11.66  )
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

Svukte extension introduce senvcfg.UKTE, hstatus.HUKTE.

This patch add CSR bit definition, and detects if Svukte ISA extension
is available, cpufeature will set the correspond bit field so the
svukte-qualified memory accesses are protected in a manner that is
timing-independent of the faulting virtual address.

Since hstatus.HU is not enabled by linux, enabling hstatus.HUKTE will
not be affective.

This patch depends on patch "riscv: Per-thread envcfg CSR support" [1]

Link: https://lore.kernel.org/linux-riscv/20240814081126.956287-1-samuel.holland@sifive.com/ [1]

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/csr.h   | 2 ++
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04e090ff22a11e35be9bc24712f1a8..62b50667d539c50a0bfdadd1c6ab06cda948f6a8 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -122,6 +122,7 @@
 #define HSTATUS_VSXL		_AC(0x300000000, UL)
 #define HSTATUS_VSXL_SHIFT	32
 #endif
+#define HSTATUS_HUKTE		_AC(0x01000000, UL)
 #define HSTATUS_VTSR		_AC(0x00400000, UL)
 #define HSTATUS_VTW		_AC(0x00200000, UL)
 #define HSTATUS_VTVM		_AC(0x00100000, UL)
@@ -195,6 +196,7 @@
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_UKTE			(_AC(1, UL) << 8)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 46d9de54179ed40aa7b1ea0ec011fd6eea7218df..3591a4f40131ff5958c07857a1bd1624723d6550 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,7 @@
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_SVVPTC		86
+#define RISCV_ISA_EXT_SVUKTE		87
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3a8eeaa9310c32fce2141aff534dc4432b32abbe..e0853cae1dc0ba844d5969a42c30d44287e3250a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -381,6 +381,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_SUPERSET(svukte, RISCV_ISA_EXT_SVUKTE, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
 };
 
@@ -921,6 +922,9 @@ void riscv_user_isa_enable(void)
 {
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
 		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVUKTE))
+		current->thread.envcfg |= ENVCFG_UKTE;
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
