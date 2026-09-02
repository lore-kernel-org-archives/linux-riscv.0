Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A479BC61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:From:To:Subject:
	Mime-Version:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Er8ZMHUKoTTMsYgvpxjkIzh2WZPLJJKV0x+b3pQNpUw=; b=ynM
	PrTyGKizJ39uybC8iz02fxfQw+HX1fTv5Oe4QjpYR52okogo0I2jMO/Np9Wx16AhrmakBeWUwnGow
	n0111LxIZHGE4cfSyGdesBCoyOX6wjfjX2Wtav8yD0AY0loVHqGVSePsmAUv6ej28eS7mb8ippVJU
	7GfaV22u/0lkrA9cqQGRKXi96AufIAvf9h6tWi1MZ8PXS52RsfMhM9NostVEdygDtbv5uW7v6KYRe
	gnmjxFGxYyfs7jvNNhb32rRxejvwz9Oy5DNxtGWAKFaKHQpDE34Kgo7Zk/tpOfZQPWpqwN3h7pVBl
	l+eHgP8mV8YaeXRBWKYQt6HBOyDU8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gR4-0000000E6s7-1RNk;
	Wed, 02 Sep 2026 08:35:10 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gR2-0000000E6qm-0Z8H
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 08:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788338094; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=wD9RsUO9lSPScERFohkjXD33MGWV4xKAf1UmItB58WI=;
 b=OY6sZyRk8hVXuV3bclp/Y8HIul8+Ic907idxBrDqUK85wrgKrsmt+VPFqgnWUgWnDDgZO8
 Ik+hcC2jgXOrI63FDib9/ixl0R2Yy5PmjaLWwLVmJdAAFO2VSrTRIGvyEVE/oB1J3l8wUc
 hqEjwbev6dZ0diSr3d+W1PQjxdhx1er4SLVE1YoZWwIUq6x4NnDq8eHmavgTbhv/ffbl2o
 iDGGjXSWyVfWdowdwmjMqg6qGuJR9mtLmZZY6+0PYtx1qEEUjqXTHpA4R3a600Jld9+j0S
 zUtthVM5GFZBQM4Lx9UOER/fYsudHjsqc2nwA0QB1SQcdzszO4uuaoQLmvoasw==
Cc: <yuchao.46@picoheart.com>, <zhanjie9@hisilicon.com>, 
	<yang.yicong@picoheart.com>, <geshijian@picoheart.com>
Mime-Version: 1.0
Subject: [PATCH] ACPI: RISC-V: CPPC: Implement cpc_read_ffh_fb_ctrs()
X-Original-From: Yufan Dou <douyufan@picoheart.com>
X-Lms-Return-Path: <lba+26a97dfac+7ba75e+lists.infradead.org+douyufan@picoheart.com>
To: "Sunil V L" <sunilvl@ventanamicro.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, "Len Brown" <lenb@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<linux-acpi@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
From: "Yufan Dou" <douyufan@picoheart.com>
Message-Id: <20260902083450.2348-1-douyufan@picoheart.com>
X-Mailer: git-send-email 2.53.0
Date: Wed,  2 Sep 2026 16:34:50 +0800
Received: from 5CG30262N9-QAP.localdomain ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Wed, 02 Sep 2026 16:34:51 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_013508_370798_E55493DC 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On RISC-V, each cpc_read_ffh() for a CSR-type FFH register sends a
separate IPI to the target hart via smp_call_function_single().
cppc_get_perf_ctrs() therefore samples the delivered and reference
counters in two separate IPIs, at two different instants. The skew
between the two sampling points distorts the delivered/reference
ratio and thus the frequency reported by cpufreq.

Implement the cpc_read_ffh_fb_ctrs() hook to read both CSR counters
back-to-back in a single IPI, which narrows the sampling window to a
few instructions and halves the number of cross-CPU calls. This
improves the accuracy of the reported frequency in the same way as
the arm64 implementation of the hook, which reads both AMU counters
in a single counters_read_on_cpu() call.

SBI-type FFH registers still fall back to individual reads, since
pairing them would not reduce the number of SBI calls on the target
hart.

Testing was performed while CPU1 was kept busy with:

  # stress-ng --cpu 1 --taskset 1

On a CPU with cpuinfo_max_freq of 3000000 kHz:

Before:

  Maximum observed cpuinfo_cur_freq: 3201369 kHz
  Maximum observed error:            +201369 kHz (+6.71%)

After:

  Maximum observed cpuinfo_cur_freq: 3009646 kHz
  Maximum observed error:              +9646 kHz (+0.32%)

The maximum observed error is reduced by 95.2%.

Signed-off-by: Yufan Dou <douyufan@picoheart.com>
---
 drivers/acpi/riscv/cppc.c | 47 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
index 42c1a9052470..2ca98fa69e9a 100644
--- a/drivers/acpi/riscv/cppc.c
+++ b/drivers/acpi/riscv/cppc.c
@@ -85,6 +85,20 @@ static void cppc_ffh_csr_write(void *write_data)
 	data->ret.error = -EINVAL;
 }
 
+struct sbi_cppc_fb_ctrs_data {
+	struct sbi_cppc_data first;
+	struct sbi_cppc_data second;
+};
+
+static void cppc_ffh_csr_read_fb_ctrs(void *read_data)
+{
+	struct sbi_cppc_fb_ctrs_data *data = read_data;
+
+	cppc_ffh_csr_read(&data->first);
+	if (!data->first.ret.error)
+		cppc_ffh_csr_read(&data->second);
+}
+
 /*
  * Refer to drivers/acpi/cppc_acpi.c for the description of the functions
  * below.
@@ -125,6 +139,39 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
 	return -EINVAL;
 }
 
+int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
+			 struct cpc_reg *reg2, u64 *val2)
+{
+	struct sbi_cppc_fb_ctrs_data data;
+	int ret;
+
+	if (WARN_ON_ONCE(irqs_disabled()))
+		return -EPERM;
+
+	/* Only CSR counters can be paired within a single IPI. */
+	if (FFH_CPPC_TYPE(reg1->address) != FFH_CPPC_CSR ||
+	    FFH_CPPC_TYPE(reg2->address) != FFH_CPPC_CSR)
+		return -EOPNOTSUPP;
+
+	data.first.reg = FFH_CPPC_CSR_NUM(reg1->address);
+	data.second.reg = FFH_CPPC_CSR_NUM(reg2->address);
+
+	ret = smp_call_function_single(cpu, cppc_ffh_csr_read_fb_ctrs,
+				       &data, 1);
+	if (ret)
+		return ret;
+
+	if (data.first.ret.error)
+		return data.first.ret.error;
+	if (data.second.ret.error)
+		return data.second.ret.error;
+
+	*val1 = data.first.ret.value;
+	*val2 = data.second.ret.value;
+
+	return 0;
+}
+
 int cpc_write_ffh(int cpu, struct cpc_reg *reg, u64 val)
 {
 	struct sbi_cppc_data data;

base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
