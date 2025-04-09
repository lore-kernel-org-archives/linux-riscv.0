Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77299C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 15:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7FclkUA5QK5uPajySlIJMHz+vE+dKXCsye3aNH/ONM=; b=kN1033ugBC0oyAAW6dO/hEXBM/
	uDcJF/toz1g+jxJKTvD1xvuQqEe/Ye8DfW7bBG9hdijvsU4kJIDOJio0OOqTDDjxA8J8dkA7rcMdM
	0s3bBlmULNUySNWbKxykcQmncrrOdVG46wqjLkJteSO4BsWW1/IWCD5Z/cPfWSCxbbQOAYXrTbkLR
	Mr+Q6lMVDOHkoB+rcr9qOw6F3DiAKGMgmthFW8M9MSSZXBMAwv/VCwqjuF2J0+IK74Bss0ACOHtFJ
	0LlK05tCPUiwIy1UmkyDHVBY3h3Fh9ThqDCFXC8fsyUUzSKhglieA7i1si/wX7JnLkF8qLP37mg0H
	Bsd1ONZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Wxz-00000007awA-2O6u;
	Wed, 09 Apr 2025 15:03:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WeZ-00000007VmS-3pVV
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 14:43:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-227a8cdd241so80535515ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 07:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744209827; x=1744814627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ow5mA7lTDwDJ/M6E3XEwhzsM01atmOj/MJRSg0pfs/U=;
        b=W/+YPz9IzQnpUedLkLEnX5YMXGHD1hkyMsQDSVXfJ9WQWFmn+q6Gl22E+GZYs7xF4C
         oiOEqhhMxktvtiHhT0hVXKOlnWsBy8Y8HGPxBqKK+jAL3vLCDirbVmX9YEAqq4QnXAnA
         bBSmVUx9xWxT5EBfojpcveM7Sa9OCLaICDfaBf1ohwTWdu8qJi2CJuzn3kMRcPaowgC+
         j+M8+9NB9JWmxUFHdwNLhFCOdxkeC+pPKUcgUxrgl7MFq+lsHK8ArJzZh3uxpGNCGiiN
         R+BPpfTu203wYdeVyir6G44CmHqTy9+0e5cjMyVSIVrpxPjO6n0VGg+UjZ2V4AbltT3d
         Ia5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209827; x=1744814627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow5mA7lTDwDJ/M6E3XEwhzsM01atmOj/MJRSg0pfs/U=;
        b=ndIXD7Y6+7bomgQH5uyuXTNWUwcgtdumFpmhGIbUvHnAw6G600AKuRSbng3FGuU+hA
         N7VhBcETdtS6nAJ5i7faZySDPGkxNLkGPCgpScXz/PaOqxUdRh1nHPVMt8fgxI9HGSjo
         Aip0mjebGsOmVJLdhz3tK8D7dFEoBiLD0wUpxEfNxKMXhLidzPtGihpdX2fLF0m/8KHd
         F+01dJY+ZHiJQzP4aE58G8ZxaiPBhHw/EnMiMV/hbReWulePL/MSqtVkVZHXQTXR5IAF
         q06A54KJfpKDkV6XVuMPaxRZhymr2EV69r2/nosUBWTsnWYM33rRG52BvUrnkOIkB+yV
         l31A==
X-Forwarded-Encrypted: i=1; AJvYcCVXJV1EnzBIlMum6jjRq8XeRtKq1dhI2Xy3SolThqs5eumk+VbSIuqxjKa17CxmzA422N12WZCr+pWPJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbeAenrKzP2JyXYtOVuTd9yYm/dLy7mni6n71WSWl9R+8X4pzd
	jO9Ght1vVNuDvFagj/DfJ+ZiR61Sf8h4wqCKf9xM1PiX6GJR8NVVIDq2vLADv8k=
X-Gm-Gg: ASbGnct2OoG57muoJT9gFoBzEtalVvaRD3w94ja+ZawJBXGKB0PSIaC3swPJeMFkwUf
	XYiWmvwKSXL4k2qpfwt5KqF1WRsspPsMgHzBcLgpDQirEXg2NlmduUkvf6q0c8vCTEZknLJ3EI1
	LXPPwpXqf24MMhhEeaMiEngB8EdmTfwraBpdcVvDZT6bQUxmfKD8ephj7fB1npnE/h8vuTBQ5w0
	JzqT4mB046s9M1ysXzjlGRha24/zQRsKo+ayOum49bR2NfM8nfgvju7tS7o7BVlRftjHLHYThVs
	pbuC9A8sxWqqz5v0mWIUQ6OthAg1kw3d16do2EmDV+893LC9m4s=
X-Google-Smtp-Source: AGHT+IEgaCnvV5qiE5FYgc0Ujjm72QHq4NY5rpvgBrpJwRVGqGD1OFM7I6sIlnm2n2XAV9/GUpCxyg==
X-Received: by 2002:a17:903:32cb:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22ac2a1df5cmr51260355ad.32.1744209826897;
        Wed, 09 Apr 2025 07:43:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb538csm12708815ad.176.2025.04.09.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:43:46 -0700 (PDT)
Date: Wed, 9 Apr 2025 07:43:42 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v12 03/28] riscv: zicfiss / zicfilp enumeration
Message-ID: <Z_aHnj2-8OlcRuHd@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-3-e51202b53138@rivosinc.com>
 <cc314da6-8755-4037-846b-01a20b3c68e1@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc314da6-8755-4037-846b-01a20b3c68e1@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_074347_951090_80BA8D7F 
X-CRM114-Status: GOOD (  17.93  )
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

On Mon, Apr 07, 2025 at 05:48:27PM +0200, Alexandre Ghiti wrote:
>
>On 14/03/2025 22:39, Deepak Gupta wrote:
>>This patch adds support for detecting zicfiss and zicfilp. zicfiss and
>>zicfilp stands for unprivleged integer spec extension for shadow stack
>>and branch tracking on indirect branches, respectively.
>>
>>This patch looks for zicfiss and zicfilp in device tree and accordinlgy
>>lights up bit in cpu feature bitmap. Furthermore this patch adds detection
>>utility functions to return whether shadow stack or landing pads are
>>supported by cpu.
>>
>>Reviewed-by: Zong Li <zong.li@sifive.com>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/include/asm/cpufeature.h | 13 +++++++++++++
>>  arch/riscv/include/asm/hwcap.h      |  2 ++
>>  arch/riscv/include/asm/processor.h  |  1 +
>>  arch/riscv/kernel/cpufeature.c      | 13 +++++++++++++
>>  4 files changed, 29 insertions(+)
>>
>>diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
>>index 569140d6e639..69007b8100ca 100644
>>--- a/arch/riscv/include/asm/cpufeature.h
>>+++ b/arch/riscv/include/asm/cpufeature.h
>>@@ -12,6 +12,7 @@
>>  #include <linux/kconfig.h>
>>  #include <linux/percpu-defs.h>
>>  #include <linux/threads.h>
>>+#include <linux/smp.h>
>>  #include <asm/hwcap.h>
>>  #include <asm/cpufeature-macros.h>
>>@@ -137,4 +138,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
>>  	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
>>  }
>>+static inline bool cpu_supports_shadow_stack(void)
>>+{
>>+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
>>+		riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICFISS));
>
>
>I would use riscv_has_extension_unlikely() instead of the cpu specific 
>variant, that would remove the need for #include <linux/smp.h>. Unless 
>you have a good reason to do that?


No I dont remember the reason. I'll fix it.
When I am fixing it, and happpen to remember the reason.
I'll post it.

>
>
>>+}
>>+
>>+static inline bool cpu_supports_indirect_br_lp_instr(void)
>>+{
>>+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
>>+		riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICFILP));
>>+}
>>+
>>  #endif
>>diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>>index 869da082252a..2dc4232bdb3e 100644
>>--- a/arch/riscv/include/asm/hwcap.h
>>+++ b/arch/riscv/include/asm/hwcap.h
>>@@ -100,6 +100,8 @@
>>  #define RISCV_ISA_EXT_ZICCRSE		91
>>  #define RISCV_ISA_EXT_SVADE		92
>>  #define RISCV_ISA_EXT_SVADU		93
>>+#define RISCV_ISA_EXT_ZICFILP		94
>>+#define RISCV_ISA_EXT_ZICFISS		95
>>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>>diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>>index 5f56eb9d114a..e3aba3336e63 100644
>>--- a/arch/riscv/include/asm/processor.h
>>+++ b/arch/riscv/include/asm/processor.h
>>@@ -13,6 +13,7 @@
>>  #include <vdso/processor.h>
>>  #include <asm/ptrace.h>
>>+#include <asm/hwcap.h>
>>  #define arch_get_mmap_end(addr, len, flags)			\
>>  ({								\
>>diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>index c6ba750536c3..82065cc55822 100644
>>--- a/arch/riscv/kernel/cpufeature.c
>>+++ b/arch/riscv/kernel/cpufeature.c
>>@@ -150,6 +150,15 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
>>  	return 0;
>>  }
>>+static int riscv_cfi_validate(const struct riscv_isa_ext_data *data,
>>+			      const unsigned long *isa_bitmap)
>>+{
>>+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
>>+		return -EINVAL;
>>+
>>+	return 0;
>>+}
>>+
>>  static const unsigned int riscv_zk_bundled_exts[] = {
>>  	RISCV_ISA_EXT_ZBKB,
>>  	RISCV_ISA_EXT_ZBKC,
>>@@ -333,6 +342,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
>>  					  riscv_ext_zicboz_validate),
>>  	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>>+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
>>+					  riscv_cfi_validate),
>>+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts,
>>+					  riscv_cfi_validate),
>>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>>
>
>With the above comment fixed, you can add:
>
>Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
>Thanks,
>
>Alex
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
