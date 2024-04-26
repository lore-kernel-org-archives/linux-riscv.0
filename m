Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CA3C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 00:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6Qx2gQiSuHgK5nIe8JXqtibIvofcUlgZuf0tETIx64=; b=oqFLAw0vaxDak+2pS3JR1NiD7R
	b2aa9PJK4b5bkLwVwNnSJGw1EOO3/Kd/qBHODid3Up7j3YxsB+GCN4t1DqSlpdjAqQ37C1JAIFpiV
	8X9xqTZxWPrDCsxxgsdBz/nsRbDUSIpPCjnhNugUSwXaUJKI5tZG9obQqxgUqHyK3AEEtBvm9ZXTl
	7RqZCs4B/qtgD87szcb2CPLBH6M2Lobs2vj1b5Vv47tPkyNNr23MtQ+xwRRDTOJyw62XAyx19IU6v
	TVYEoHV1WSJbqjrT5H84q7MUoEJQti/4CpnU0bmdjpbDToXz0ptGEHbE1OVOgoy8y/8M2XFbQIgAU
	0pQQHxIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0VUN-0000000EPy8-0DTw;
	Sat, 27 Apr 2024 00:00:23 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0VUC-0000000EPs8-1yly
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 00:00:21 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso2506284b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 17:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714176002; x=1714780802; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9nKgoSM0sp6sf/g9BAlOnduSP6+NwHasqsoAKKtprFI=;
        b=JlNiKdFUf8O1hdYI8mOzvBJ8S5hAP2fBcNPrDfKpWXZ2Vq3f2cToYNSG3fHuNUeuQ8
         BAXwwaBJiiCrs7xcYXOtemlVALAQNax9xwcMDzQwAi89PmOy6tEDAAyHzxyrJFRSdIVp
         OhsT7ubNeRKAd54shawJW0RCPsCniWj3JDvM/rZydJkvUv1SuZyBRIv697v6OI4lH6Bp
         N4C30mwASSSZOrlqrTU8gJzghNq+plYjCzv0tTgEmexQfCdxmbZQS8o0MPOrWSvWSa1q
         XrNsfdSdt/qPPv/bEgBNPSFuFMSqSDZIPYaDutqVYP0ndprjmKiXmJcmgrZlW84exkoy
         gvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714176002; x=1714780802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nKgoSM0sp6sf/g9BAlOnduSP6+NwHasqsoAKKtprFI=;
        b=f7VpVCSpn2XuarTNTVwySpSNp6C6KWlKXkYNEyAnA6flpKzpBanosseXNI3LrGQZTg
         RsSiWiJnbtisN6SlC5l3xhUFQni7FXcgA4/A3TPrDUf0Ofb5nBFlFIlVaKm4+MaRV05n
         jJaM8h778aAKD9R7y4vsXdoqI5/P6FJ4G5i1dCpTGtIr5XA7JGKFHbyCemabOtVN+k00
         6oDH5B4nZfqXraWmGUgkQX439RIuWuJU3R4RBogNzw3gX7ksSA274E5R5EYqTENz6Pdq
         8T+gGZdnexTqnuLamh8B1ayUAjKMbG2PPDRzC1byu1yx3frpJKMsJH9wtFUcDHo2H4J1
         Z3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7HtDhmDbCRkdAwEt8B7otJpVsF3ZbiRyBQ3hw3Pi3kqegmn+60yRklyzkMnkhcKR5jeoVrocVJkopvRtGySw1A5QUt1aWO46qKHO/s7h
X-Gm-Message-State: AOJu0Yx5fnm//sdMFxGk+EsjIvZW0VllYS74CmLii9BWQ7UcYXF8N5QU
	JXEPIN49VkdINIsU18GeeHEqKxIYYAuNpqMmzZBzIECJKW59hYvQVVMrPcJ7lTM=
X-Google-Smtp-Source: AGHT+IEsvRMCuekQ94DgQvZ05hh6aZ5npO3dcKp41Wr8dxgq9snbGePJb3r1rT7TaB8/2W1ubLy8lw==
X-Received: by 2002:a05:6a00:1395:b0:6ed:416d:e9a with SMTP id t21-20020a056a00139500b006ed416d0e9amr5962735pfg.7.1714176001896;
        Fri, 26 Apr 2024 17:00:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b12-20020a056a00114c00b006ecfc3a8d6csm15313819pfm.124.2024.04.26.17.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 17:00:01 -0700 (PDT)
Date: Fri, 26 Apr 2024 16:59:59 -0700
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
Subject: Re: [RFC PATCH 5/7] riscv: add double trap driver
Message-ID: <Ziw//90J0WfOY/tl@debug.ba.rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418142701.1493091-6-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_170012_651315_ADFB4C75 
X-CRM114-Status: GOOD (  14.53  )
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

On Thu, Apr 18, 2024 at 04:26:44PM +0200, Cl=E9ment L=E9ger wrote:
>Add a small driver to request double trap enabling as well as
>registering a SSE handler for double trap. This will also be used by KVM
>SBI FWFT extension support to detect if it is possible to enable double
>trap in VS-mode.
>
>Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
>---
> arch/riscv/include/asm/sbi.h    |  1 +
> drivers/firmware/Kconfig        |  7 +++
> drivers/firmware/Makefile       |  1 +
> drivers/firmware/riscv_dbltrp.c | 95 +++++++++++++++++++++++++++++++++
> include/linux/riscv_dbltrp.h    | 19 +++++++
> 5 files changed, 123 insertions(+)
> create mode 100644 drivers/firmware/riscv_dbltrp.c
> create mode 100644 include/linux/riscv_dbltrp.h
>
>diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>index 744aa1796c92..9cd4ca66487c 100644
>--- a/arch/riscv/include/asm/sbi.h
>+++ b/arch/riscv/include/asm/sbi.h
>@@ -314,6 +314,7 @@ enum sbi_sse_attr_id {
> #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SPIE	(1 << 2)
>
> #define SBI_SSE_EVENT_LOCAL_RAS		0x00000000
>+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP	0x00000001
> #define SBI_SSE_EVENT_GLOBAL_RAS	0x00008000
> #define SBI_SSE_EVENT_LOCAL_PMU		0x00010000
> #define SBI_SSE_EVENT_LOCAL_SOFTWARE	0xffff0000
>diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>index 59f611288807..a037f6e89942 100644
>--- a/drivers/firmware/Kconfig
>+++ b/drivers/firmware/Kconfig
>@@ -197,6 +197,13 @@ config RISCV_SSE_TEST
> 	  Select if you want to enable SSE extension testing at boot time.
> 	  This will run a series of test which verifies SSE sanity.
>
>+config RISCV_DBLTRP
>+	bool "Enable Double trap handling"
>+	depends on RISCV_SSE && RISCV_SBI
>+	default n
>+	help
>+	  Select if you want to enable SSE double trap handler.
>+
> config SYSFB
> 	bool
> 	select BOOT_VESA_SUPPORT
>diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>index fb7b0c08c56d..ad67a1738c0f 100644
>--- a/drivers/firmware/Makefile
>+++ b/drivers/firmware/Makefile
>@@ -18,6 +18,7 @@ obj-$(CONFIG_RASPBERRYPI_FIRMWARE) +=3D raspberrypi.o
> obj-$(CONFIG_FW_CFG_SYSFS)	+=3D qemu_fw_cfg.o
> obj-$(CONFIG_RISCV_SSE)		+=3D riscv_sse.o
> obj-$(CONFIG_RISCV_SSE_TEST)	+=3D riscv_sse_test.o
>+obj-$(CONFIG_RISCV_DBLTRP)	+=3D riscv_dbltrp.o
> obj-$(CONFIG_SYSFB)		+=3D sysfb.o
> obj-$(CONFIG_SYSFB_SIMPLEFB)	+=3D sysfb_simplefb.o
> obj-$(CONFIG_TI_SCI_PROTOCOL)	+=3D ti_sci.o
>diff --git a/drivers/firmware/riscv_dbltrp.c b/drivers/firmware/riscv_dblt=
rp.c
>new file mode 100644
>index 000000000000..72f9a067e87a
>--- /dev/null
>+++ b/drivers/firmware/riscv_dbltrp.c
>@@ -0,0 +1,95 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+/*
>+ * Copyright (C) 2023 Rivos Inc.
>+ */

nit: fix copyright year
>+
>+#define pr_fmt(fmt) "riscv-dbltrp: " fmt
>+
>+#include <linux/cpu.h>
>+#include <linux/init.h>
>+#include <linux/riscv_dbltrp.h>
>+#include <linux/riscv_sse.h>
>+
>+#include <asm/sbi.h>
>+
>+static bool double_trap_enabled;
>+
>+static int riscv_sse_dbltrp_handle(uint32_t evt, void *arg,
>+				   struct pt_regs *regs)
>+{
>+	__show_regs(regs);
>+	panic("Double trap !\n");
>+
>+	return 0;
Curious:
Does panic return?
What's the point of returning from here?

>+}
>+
>+struct cpu_dbltrp_data {
>+	int error;
>+};
>+
>+static void
>+sbi_cpu_enable_double_trap(void *data)
>+{
>+	struct sbiret ret;
>+	struct cpu_dbltrp_data *cdd =3D data;
>+
>+	ret =3D sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
>+			SBI_FWFT_DOUBLE_TRAP_ENABLE, 1, 0, 0, 0, 0);
>+
>+	if (ret.error) {
>+		cdd->error =3D 1;
>+		pr_err("Failed to enable double trap on cpu %d\n", smp_processor_id());
>+	}
>+}
>+
>+static int sbi_enable_double_trap(void)
>+{
>+	struct cpu_dbltrp_data cdd =3D {0};
>+
>+	on_each_cpu(sbi_cpu_enable_double_trap, &cdd, 1);
>+	if (cdd.error)
>+		return -1;

There is a bug here. If `sbi_cpu_enable_double_trap` failed on all cpus but=
 last cpu.
Then cdd.error would not record error and will be reflect as if double trap=
 was enabled.

Its less likely to happen that FW would return success for one cpu and fail=
 for others.
But there is non-zero probablity here.

>+
>+	double_trap_enabled =3D true;
>+
>+	return 0;
>+}
>+
>+bool riscv_double_trap_enabled(void)
>+{
>+	return double_trap_enabled;
>+}
>+EXPORT_SYMBOL(riscv_double_trap_enabled);
>+
>+static int __init riscv_dbltrp(void)
>+{
>+	struct sse_event *evt;
>+
>+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SSDBLTRP)) {
>+		pr_err("Ssdbltrp extension not available\n");
>+		return 1;
>+	}
>+
>+	if (!sbi_probe_extension(SBI_EXT_FWFT)) {
>+		pr_err("Can not enable double trap, SBI_EXT_FWFT is not available\n");
>+		return 1;
>+	}
>+
>+	if (sbi_enable_double_trap()) {
>+		pr_err("Failed to enable double trap on all cpus\n");
>+		return 1;
>+	}
>+
>+	evt =3D sse_event_register(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, 0,
>+				 riscv_sse_dbltrp_handle, NULL);
>+	if (IS_ERR(evt)) {
>+		pr_err("SSE double trap register failed\n");
>+		return PTR_ERR(evt);
>+	}
>+
>+	sse_event_enable(evt);
>+	pr_info("Double trap handling registered\n");
>+
>+	return 0;
>+}
>+device_initcall(riscv_dbltrp);
>diff --git a/include/linux/riscv_dbltrp.h b/include/linux/riscv_dbltrp.h
>new file mode 100644
>index 000000000000..6de4f43fae6b
>--- /dev/null
>+++ b/include/linux/riscv_dbltrp.h
>@@ -0,0 +1,19 @@
>+/* SPDX-License-Identifier: GPL-2.0 */
>+/*
>+ * Copyright (C) 2023 Rivos Inc.
>+ */
>+
>+#ifndef __LINUX_RISCV_DBLTRP_H
>+#define __LINUX_RISCV_DBLTRP_H
>+
>+#if defined(CONFIG_RISCV_DBLTRP)
>+bool riscv_double_trap_enabled(void);
>+#else
>+
>+static inline bool riscv_double_trap_enabled(void)
>+{
>+	return false;
>+}
>+#endif
>+
>+#endif /* __LINUX_RISCV_DBLTRP_H */
>-- =

>2.43.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
