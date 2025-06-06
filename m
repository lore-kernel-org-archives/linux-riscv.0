Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BB3C5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAtctizWcFiq47FFyR+s7vb8HgvKJwPTUxG/CAW4m7g=; b=vtZYohoVAdVaVnTahVmqqxXXmZ
	RvtMj9FlRjzPjif4LmjIpOpQiq/11y6JFE9LBljryGAoh7TsrjWJr7eIQEDoiXpV3Rh6WZ7VG9Jnr
	zPLhzG3pg488I5aTFvJxxyNmIMrty4343Z9sjtRZIucR2G9GBbCeKm9UQta5ZIEQ/YLjh6G1OvHGd
	wTMLHjSjXc3xriVgx3SWfYoqUGZRgRLEtClOSODRmYnEYE65ES/QYalT1vGMZmU664/+97lGlkue5
	i0atmB6vKyPdDBB+9xZe0n1sWp/OGOIOBR67J7cNjPlSAaUC3nFsHzyxeyY+uov657jJ8CitZhKmt
	qHHfkQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNaOc-00000000gTA-1GAt;
	Fri, 06 Jun 2025 16:58:22 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNaOZ-00000000gSh-3Nw2
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 16:58:21 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-234c5b57557so22202295ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 09:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749229099; x=1749833899; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BcxjZScvM2lKpgQY852iFru4i2EtNEedlu5deP8M4Ro=;
        b=WXS/bh5eCzPsFOeoCbBBF47VRfN2Vgez6nkHoxEEhMocxavb0QT9jy0HV30mFTRe1i
         DobRpPkCCTIK3VFOvEgcrgkQDbjxxBWA/WqxoKVlvQe6T2TMLhYBhYl201LbuCrvRK96
         dLA1a1B/2FMlQ/HqqPx7jfepMFAphznxZ6glsPVQcftEFFNC+oCk7S0Q7ggOvEYtVhMh
         Ba2MPWeLvo2VaojJCyLtPjYRc8r3l2wjgEpFzQlcVfIDdzYYZL+oFZUaqsMaZJZHsvPt
         zVTAi37WZbP2z+4iwnkbOC+QlaVXDgPL6NYwZVtECKuKqM8ZPUmLYzyH+KxXu/BmVP+E
         2itA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749229099; x=1749833899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcxjZScvM2lKpgQY852iFru4i2EtNEedlu5deP8M4Ro=;
        b=JoGa1V1vkX7vn83IpWwDd3LRGXcGzgK3F1T/Uu9TRtOgRSwbSIp3QixSJf6TJ23cFr
         IUUVagiF/eDnxmWitzBgIflrmFj72XLSZbgf/cTxwfiM2aLdfeeQuAxZYRWO2iCz0ohe
         VXnnGoPC5bYJxUW5TIqsariU1ATTD5oXYNu8jgsJadRHNaGEWFcthdoah8DC5ZUsxl42
         Cg4I3a4x/83qyP+UArjq72u8TJcX2JgNLlSI8v3hhziUHkvC7JUTCSO17PBAtZgQCnNt
         71tgrZ4HBeS2YdhaJWZqUgvK/p6A9CT+8Ptpe8y6Hh38QgNOIBt9L+zZVJQ17zHCGwHD
         4xYw==
X-Forwarded-Encrypted: i=1; AJvYcCWquVO+ceCd6M5IOGpCo87NUPY+cWmrAs/0uoyp+GoN/b7M+6NZu337Q74pjW9x5PlRaKWFO7tuNWR2jQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw/+85BwTryMc827VFGnnJK7O4/g9M0TGfIaHDczFdXW0sJ3ic
	XtV+IWDxEd0dnLV1X38nOIRDiypsx5wWYNmaSoAwmgiB+OduBjR91pXzsPtaPgK9yZI=
X-Gm-Gg: ASbGncu4MBJd1+oWzULScWy72iy6fazlgajHIcMSW32Oew4K1vDxrfYbCUywI9t+U/j
	mOSoslKKHj/XXkH3jOzFgMPlm/qbNB6aX+5AUQlxe46eCEBUmJABSlnvUhzaQbSUYYu+1129zjT
	wdO9fTxJZ7X76xvTmiQZLn41w3VX7CfmZPw8c7laCoCHTvL0f3TfzwpFpIz9TAeiGwNfaYHJTRk
	r0GSNe3HlQh88K4xl25vDPyE2pJc3UdEvc7pICiagNhZ3rqfSzRIyu/xxSSraxAVxf1fnRD2gr7
	KSyzP9mj9CXIl9ZA64ty3AJwSx1KT8mH2mKvRRCiSGQNDzBHc2KZoR6StAxi+g==
X-Google-Smtp-Source: AGHT+IEFbEqDfqUF5m1o5ZSy4azWIZls70KNFStC8E9KnYlaEsLemZ77jdHc6KP24GJveCrVcgRxfw==
X-Received: by 2002:a17:903:32cf:b0:235:6f7:b918 with SMTP id d9443c01a7336-23601d225cdmr62084635ad.28.1749229098693;
        Fri, 06 Jun 2025 09:58:18 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032ff216sm14585925ad.111.2025.06.06.09.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:58:18 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:58:16 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Ved Shanbhogue <ved@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH RFC v7 1/3] riscv: Add RISC-V Svrsw60t59b extension
 support
Message-ID: <aEMeKIBDKUTUI3B1@debug.ba.rivosinc.com>
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-2-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409095320.224100-2-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_095819_846320_A76D9363 
X-CRM114-Status: GOOD (  11.49  )
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

On Wed, Apr 09, 2025 at 05:53:18PM +0800, Chunyan Zhang wrote:
>The Svrsw60t59b extension allows to free the PTE reserved bits 60
>and 59 for software to use.
>
>Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>---
> arch/riscv/Kconfig             | 13 +++++++++++++
> arch/riscv/include/asm/hwcap.h |  1 +
> arch/riscv/kernel/cpufeature.c |  1 +
> 3 files changed, 15 insertions(+)
>
>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>index bbec87b79309..332fc00243ad 100644
>--- a/arch/riscv/Kconfig
>+++ b/arch/riscv/Kconfig
>@@ -842,6 +842,19 @@ config RISCV_ISA_ZICBOZ
>
> 	   If you don't know what to do here, say Y.
>
>+config RISCV_ISA_SVRSW60T59B
>+	bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
>+	depends on RISCV_ALTERNATIVE

depends on MMU && 64BIT as well.

>+	default y
>+	help
>+	  Adds support to dynamically detect the presence of the SVRSW60T59B
>+	  extension and enable its usage.
>+
>+	  The Svrsw60t59b extension allows to free the PTE reserved bits 60
>+	  and 59 for software to use.
>+
>+	  If you don't know what to do here, say Y.
>+
> config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
> 	def_bool y
> 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
>diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>index e3cbf203cdde..985f6dfc80ed 100644
>--- a/arch/riscv/include/asm/hwcap.h
>+++ b/arch/riscv/include/asm/hwcap.h
>@@ -105,6 +105,7 @@
> #define RISCV_ISA_EXT_ZVFBFWMA		96
> #define RISCV_ISA_EXT_ZAAMO		97
> #define RISCV_ISA_EXT_ZALRSC		98
>+#define RISCV_ISA_EXT_SVRSW60T59B	99
>
> #define RISCV_ISA_EXT_XLINUXENVCFG	127
>
>diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>index 2054f6c4b0ae..0f0f3027d400 100644
>--- a/arch/riscv/kernel/cpufeature.c
>+++ b/arch/riscv/kernel/cpufeature.c
>@@ -523,6 +523,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> 	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
>+	__RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),
> };
>
> const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
>-- 
>2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
