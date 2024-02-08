Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93605C4829D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 03:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dr0iavxSbU3k8K8HmSky6A5ZFRaW2604IbFQKCqnvnc=; b=TJHLCm1RlbJkXk
	CmnrZbIhYNBjAAuLOIFtVfQG4tOg8AaZb7+ntAC4xQuhXmHLcb3Obal5eH90CPi9JB4hUINEnWt3w
	wmqH9/OmxOxT6Ggt1MtcsJvrKjC+vWNPFeyXLMG4jfIL5D1x/GlxzksSFMobxDjzyxZPOed9xFNhi
	cFG/hHeIf7AwJyC/9MBHQN1YDG9CRm9jMpJ9Mi2rFZGpERoj9Y7DUp6Zi+29wdI+Fa+fzd24XNht+
	Ja7xEBo/qGKmgRR13N8fL7hQsw8fudgl3tN9uKFUAryfUOvUczSqINStYqAS4F5jmzsKAVNUxNRMO
	4fctN4GmrnjWkESgP/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXvL3-0000000CZU8-1TpM;
	Thu, 08 Feb 2024 03:44:37 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXvL0-0000000CZTW-2xNH
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 03:44:36 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6dc8b280155so815372a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 19:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707363872; x=1707968672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgQFqqRtn8DN2VavanqDsLoINugSVlcio4jRu34SR/A=;
        b=ffDtSOqoCH0ADAx1QdKrhcEphIBvWi2kUq0aj2gWjrfTGIzikU0+vDExJDU19Y54nO
         Gi2yCpUhqgkmcXDJO3MISdchIy6JPdL5TTBA8Cs+czlL7yvPSci1rLyqbSEvlI+eXwwp
         /pOYUyYyOV/zMkAMlxwDFY2+SQ2XW6DR0h1ewZx3Z3CBKlwbyZ34p/NWsA5cF81/LxZ+
         YJQOvA1egFPfp1zwa3+tFtPi2qYR/kcDDFQDfWzgtO4mOG4g6/DlyYlEWQy+PqSDO28A
         eWtz8iohat9eNCjgkuK4nwZJmoRCESgnIWk7AzWNMTxhjUgfsF98EeFVr6FkE2Yz18Ys
         mzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707363872; x=1707968672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgQFqqRtn8DN2VavanqDsLoINugSVlcio4jRu34SR/A=;
        b=SlFlsTLFmpkJFHckQMajnzjZFRh/8iWVPscwqp9436tHaNCMDbH5/igINixITTRAGv
         HqinyP+OzxFKtFai8umE+eUPz7ZwK0/Ts7KrQE0OEfr57QS4o5Y9gv5aeHgnrV0RBwyE
         zC8NtnsZGyNHrxxb1PD/RhJ2vHErmj+mpwNrxQCN9wf6DSL/U9Qyn5w1iDtN4AtFlqW4
         w4SlNK8ip3amFXN2xZEVnBzVbfxfA4uWLfffn01PZAWOAix3M7Gpj+jL9qaFkJ7ejLHD
         o3g0OhEnZ/6/R0Q/m6ka0IWkN0erCUJBVWnNvuOyT88ZlgkG2pRjAXOixvHaOpAXSDb2
         nXWQ==
X-Gm-Message-State: AOJu0YzlsvIf8QrzM1Dwm93QPvb0duT9yae9t8Gv4JJSbLeOVlXWKGFo
	3eTVselebiZ3gU19+aotO4yiUXM2P2zcOZVp4JYDfZ6zQMgrg3fL1nF/tY910LxS9HxeOYF5r+V
	wPPo=
X-Google-Smtp-Source: AGHT+IEfZsi4VFdiHkosdFblRNJZ6ug/fDhuHf9RN1g49321kfYYXE2DyiQ0S/JGPMdQKZlCivRcjg==
X-Received: by 2002:a05:6830:14c7:b0:6dd:eb91:81da with SMTP id t7-20020a05683014c700b006ddeb9181damr9033857otq.27.1707363872124;
        Wed, 07 Feb 2024 19:44:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOfWQSg4aYubBJ9v3sf9Cx1SR3gQ2gpcdir88xRdk68u5pP4oK8imbfLZtAw/e0q5aRsjjXtLVxtju5iS1qOvlx8NRGMSwAW3tGs99IOYolVgEtm9KzcsveTydkdp/BYWRlutNgxRYrIaBwm6nnZJSnOcvAHg8hN49lxk3zL2tOZLy0jYnhaRga0RaWFVxNA/c3M/0qmNK+QOoLrpnYPlmmZ1RxI95mPPlIClf3HJRtFki6TGfMDf1VYkwSMHCECZ96wV3A9CP00Qs6uEtkwxk/b7kVe6MUG/vRe58892WE07AF5eJXhUPEgpVl11u/gUkn7bXi1G7WoRkYKfY3FRl7WLSCJRjs6nmkeW+EfUDOhW6f8KMql2ywNLY6Kf75Bi7R9zr8iQb1eQStYVlWsOo8yuZ02LsvWTPWypu2gLagYLq9rD2UP3MZ4SMkK+J5vZvlF/0
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id g10-20020a056830160a00b006ddbfc37c87sm443595otr.49.2024.02.07.19.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:44:29 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 -next 1/3] ACPI: RISC-V: Add CPPC driver
Date: Thu,  8 Feb 2024 09:14:12 +0530
Message-Id: <20240208034414.22579-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208034414.22579-1-sunilvl@ventanamicro.com>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_194434_774258_8D356F45 
X-CRM114-Status: GOOD (  17.72  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add cpufreq driver based on ACPI CPPC for RISC-V. The driver uses either
SBI CPPC interfaces or the CSRs to access the CPPC registers as defined
by the RISC-V FFH spec.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/Makefile |   1 +
 drivers/acpi/riscv/cppc.c   | 157 ++++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 drivers/acpi/riscv/cppc.c

diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index 7309d92dd477..86b0925f612d 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y					+= rhct.o
 obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
+obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
new file mode 100644
index 000000000000..4cdff387deff
--- /dev/null
+++ b/drivers/acpi/riscv/cppc.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Implement CPPC FFH helper routines for RISC-V.
+ *
+ * Copyright (C) 2024 Ventana Micro Systems Inc.
+ */
+
+#include <acpi/cppc_acpi.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+
+#define SBI_EXT_CPPC 0x43505043
+
+/* CPPC interfaces defined in SBI spec */
+#define SBI_CPPC_PROBE			0x0
+#define SBI_CPPC_READ			0x1
+#define SBI_CPPC_READ_HI		0x2
+#define SBI_CPPC_WRITE			0x3
+
+/* RISC-V FFH definitions from RISC-V FFH spec */
+#define FFH_CPPC_TYPE(r)		(((r) & GENMASK_ULL(63, 60)) >> 60)
+#define FFH_CPPC_SBI_REG(r)		((r) & GENMASK(31, 0))
+#define FFH_CPPC_CSR_NUM(r)		((r) & GENMASK(11, 0))
+
+#define FFH_CPPC_SBI			0x1
+#define FFH_CPPC_CSR			0x2
+
+struct sbi_cppc_data {
+	u64 val;
+	u32 reg;
+	struct sbiret ret;
+};
+
+static bool cppc_ext_present;
+
+static int __init sbi_cppc_init(void)
+{
+	if (sbi_spec_version >= sbi_mk_version(2, 0) &&
+	    sbi_probe_extension(SBI_EXT_CPPC) > 0) {
+		pr_info("SBI CPPC extension detected\n");
+		cppc_ext_present = true;
+	} else {
+		pr_info("SBI CPPC extension NOT detected!!\n");
+		cppc_ext_present = false;
+	}
+
+	return 0;
+}
+device_initcall(sbi_cppc_init);
+
+static void sbi_cppc_read(void *read_data)
+{
+	struct sbi_cppc_data *data = (struct sbi_cppc_data *)read_data;
+
+	data->ret = sbi_ecall(SBI_EXT_CPPC, SBI_CPPC_READ,
+			      data->reg, 0, 0, 0, 0, 0);
+}
+
+static void sbi_cppc_write(void *write_data)
+{
+	struct sbi_cppc_data *data = (struct sbi_cppc_data *)write_data;
+
+	data->ret = sbi_ecall(SBI_EXT_CPPC, SBI_CPPC_WRITE,
+			      data->reg, data->val, 0, 0, 0, 0);
+}
+
+static void cppc_ffh_csr_read(void *read_data)
+{
+	struct sbi_cppc_data *data = (struct sbi_cppc_data *)read_data;
+
+	switch (data->reg) {
+	/* Support only TIME CSR for now */
+	case CSR_TIME:
+		data->ret.value = csr_read(CSR_TIME);
+		data->ret.error = 0;
+		break;
+	default:
+		data->ret.error = -EINVAL;
+		break;
+	}
+}
+
+static void cppc_ffh_csr_write(void *write_data)
+{
+	struct sbi_cppc_data *data = (struct sbi_cppc_data *)write_data;
+
+	data->ret.error = -EINVAL;
+}
+
+/*
+ * Refer to drivers/acpi/cppc_acpi.c for the description of the functions
+ * below.
+ */
+bool cpc_ffh_supported(void)
+{
+	return true;
+}
+
+int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
+{
+	struct sbi_cppc_data data;
+
+	if (WARN_ON_ONCE(irqs_disabled()))
+		return -EPERM;
+
+	if (FFH_CPPC_TYPE(reg->address) == FFH_CPPC_SBI) {
+		if (!cppc_ext_present)
+			return -EINVAL;
+
+		data.reg = FFH_CPPC_SBI_REG(reg->address);
+
+		smp_call_function_single(cpu, sbi_cppc_read, &data, 1);
+
+		*val = data.ret.value;
+
+		return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
+	} else if (FFH_CPPC_TYPE(reg->address) == FFH_CPPC_CSR) {
+		data.reg = FFH_CPPC_CSR_NUM(reg->address);
+
+		smp_call_function_single(cpu, cppc_ffh_csr_read, &data, 1);
+
+		*val = data.ret.value;
+
+		return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
+	}
+
+	return -EINVAL;
+}
+
+int cpc_write_ffh(int cpu, struct cpc_reg *reg, u64 val)
+{
+	struct sbi_cppc_data data;
+
+	if (WARN_ON_ONCE(irqs_disabled()))
+		return -EPERM;
+
+	if (FFH_CPPC_TYPE(reg->address) == FFH_CPPC_SBI) {
+		if (!cppc_ext_present)
+			return -EINVAL;
+
+		data.reg = FFH_CPPC_SBI_REG(reg->address);
+		data.val = val;
+
+		smp_call_function_single(cpu, sbi_cppc_write, &data, 1);
+
+		return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
+	} else if (FFH_CPPC_TYPE(reg->address) == FFH_CPPC_CSR) {
+		data.reg = FFH_CPPC_CSR_NUM(reg->address);
+		data.val = val;
+
+		smp_call_function_single(cpu, cppc_ffh_csr_write, &data, 1);
+
+		return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
+	}
+
+	return -EINVAL;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
