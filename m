Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6902C531CB
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 08:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzrYkg9dqBPNOOvOQRdn8i0Vl4IUU9mEpGOdFZd409c=; b=WYlUMTxwlAGI3J
	oetg8eJcearA80dHz4pM3KxBQnTzF/cMEk+UbCpMF+31HrUAsa/eFjjhNHGnHSISjJI+arQJm58/S
	Gb+aEaQFwizEyjrHvmE6QfKCGvBywis73fXJ3W89knt7ToizuTGde1sK5sSP5Evfqu7obfDCEwKax
	07CQ1qHqEHR7/gq2cunRsdtnHeQ1GpWbYTP2hxygAa/OOQvE2kxVG9WYF0ju9VYrvsvdZDNC2DnM3
	7MN9y15oXcWlDi4s17EjvvjNHfcYKuAowQViadmXTwtT3t938TeQhEX01fKGnB7mXFDJbJmPRvCvp
	W4zbj1z5pF3uR4LLzORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmp6z-0000000DmOj-0j3w;
	Thu, 23 Jul 2026 08:49:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmp6u-0000000DmNL-1URi
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 08:48:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7Bcqw234557
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 08:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BlIAKmpBNkm
	fiGig3OcOdNp1wNn+DxRTEfW9DrwlMq4=; b=eYjEj5kq2w0XXJJoebZdw7WvCwV
	f/9STu8ThTIh3iwCDCNWrvr4VXNQGAjJtfPn7zAzuYcM2HZ+WfaIcBNjqg5DNTuf
	TCo80XLxL0c8AuyXABXX4NTgMHumiFHDbJGnLBkyOrkHHiGdUQf0NmQgVJRiRAGt
	7sE/AWkxCxw51wwyANk96hHWAabTyWiiZmr5Ktos1pCTd4GZ4thSurm3ykz47kVO
	+OJTTEjsHBECiVeLYZOMV7cu950f4IWIUisZHXjvAlAHqpcl8GRWBHOloSYUrKMI
	YUjgpFcdrqi+z0zUn1nj6i95dq1BF4TwKql1D3gvtbmv4avgVk0XhlN2CwA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xu623-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 08:48:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1041838a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 01:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784796535; x=1785401335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BlIAKmpBNkmfiGig3OcOdNp1wNn+DxRTEfW9DrwlMq4=;
        b=UoQsynCka7pnQDmqp/uqnDITs53coC8Ik1ATwny3+rqoAcQoEkxZ+AMq+vgZ7nHawd
         JlpFKBgiV3+v1WiTg0OgRsq6AzXx2g7fJ+y1d3jFVp5BIpH9Ch9JaTdUBB9SKYDxKBJZ
         jECC9+PET96ThzzjThBgtBLyxDEtA/0zWADah/qf0Qcg3Or9wzP9AIoBx2ob3bktWHns
         sHPKObDrIBokCcnKu/A8rJSp1oJvcWKYQ1Yqhl+/NylFrgg8oIbUj6GV7YpLfcxl8vae
         5Njrs/oLIHB9FEp7bYy0hf1VW1FueOEUIUrij1ixNp1dWKRd3qII1Eefoq3FrAZ0Q8AE
         WarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784796535; x=1785401335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BlIAKmpBNkmfiGig3OcOdNp1wNn+DxRTEfW9DrwlMq4=;
        b=JRGDGNidu+LfNDO+qbrJG7GXiI2EYVat3Q5E1/yqgIXyIzLub3+AADzGHE2Ev+Dz6F
         lwjqah8qWxGr668CGOycmh2VKZUJb3nHOopopdrotaO7mbkyxCmOfMwRU8MdGgGUkh1S
         yLEQ4WrL+woxEKC6c71csJyR93zE2+Bu1+ojy68TsM1qKi/l2jqlIVFZchDJUw6HWIRf
         j9gt5LlyfSyyNKIQfU+TIRPaeIaagsEj1VjUB8IwEZtvBxmuajxUJ69RabZOBAuG0EzV
         gPHME8i8lYFkc6Reiy/Dp8pX+FUsZIS/8nvCbTUq/+jzVOI4qr5nSMryJu66Fw8+MuB8
         wYVw==
X-Gm-Message-State: AOJu0YxZ3BuowFK8pwl2UNYMyucPVbb109iwbhlHGqdKeebSOQhTSGmJ
	ZTceKsY+mC9FTn6FrGWZLrHsnnRMYPSC0FpHYKMZH82GiwxFeFgYBosuIUlFdzyZnPz8L5R4pOw
	E6EDqmL19P5GRUaMS9qEZaCWRJoDO1fR6aXoKhDlRs0j8T6UBSlYiYUSRfFjtwKvHcTDs/y590+
	2enEM=
X-Gm-Gg: AR+sD13+Do/QBo/WHA+QdkQXPBgvMuCffE9QrDpiEnkbWY2CPX5GQG8jWOWX8cT/f1U
	/Yw1yFKW9xKkkf5Or8Q80aZos8Vx6CV8V3Vuq9/4479SMsACdpqkajpjZ8JzKTkw5DRtrfAKb4f
	mk/TrussfJReOAUeEi9LYFLrvP8H56XjulWN0h974wc5n0NrXYMl/MyXoQXjGDTdiPQ0TiW+wJw
	MG6QTfHCGeS3weZZbbG3HWOyQRAg3JAYc5Vpcc9uYj7jHxztTWRsFmGN3O0GSXVsxOcLuEI9won
	YC/XX6AlPyFsaC2Dcpqah6+U93zFsMMNpVSTLEYmJCEEuraDTHVV4YfEfDrSBTiRn35zbsGx715
	3r9Z3XY5Fd7puShYA3s+W3HO1v0IYqzI5gD914SBodpmDRJVErIgtxSmTK+XEk/Uli/imeAL+c1
	nfeVdE81NKkkIDLSJhRdw2LYD0
X-Received: by 2002:a17:90a:da8f:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38ec687719bmr2100283a91.30.1784796534308;
        Thu, 23 Jul 2026 01:48:54 -0700 (PDT)
X-Received: by 2002:a17:90a:da8f:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38ec687719bmr2100237a91.30.1784796533519;
        Thu, 23 Jul 2026 01:48:53 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130ce035sm13852140c88.13.2026.07.23.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 01:48:53 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 1/3] riscv: Introduce support for hardware break/watchpoints
Date: Thu, 23 Jul 2026 14:18:38 +0530
Message-ID: <20260723084841.2988456-2-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 7JVgGfIe0cpx_5xiljgy9PCmwJf_b27b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NyBTYWx0ZWRfX0ep6h99vRsKK
 wGl2mj93B/7YRl13Du3inM1F5hARP8qwxSlpukc6Mehh7zOKkmXLnse8ThAi5d1dIzepUpFpbOl
 A9CJgLQpyxch21rEWpBwXKehKtJC2Y0=
X-Proofpoint-GUID: 7JVgGfIe0cpx_5xiljgy9PCmwJf_b27b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NyBTYWx0ZWRfX/zlPTio0jZ0V
 ePFTQ2VnhYB61B6YIBba8G75895SjRBOIQ5C6SANcRn6HIUDf5nqsPNGx5UkNRL++7QyMB3BqCC
 UPdx3FzDv/sdEvGUwvk/zNOkoW/edI+2tPKexggTEX4cG9RNM7qb0TknfUrwby7YgZmf/5xUqdV
 oQp5fckHvjrrFjDsVuhQ/rChySnxjPFlhhTdlH8BRRXcGcdFgXRJAZ4iHMjh0L4DNHZ2vhNAcPx
 mTMw4GnJmKwWkjISHAqylrVnNNsQuMJ9FPXOEFufsZl7n52/js/kGnLwRjrW2CdC9uBxbayGss6
 HYjbKZ8qnnDHKNtw90kzxzMpj5s+Zozvq1SoNHPv51Ym0P4JxqIGdak1U1XWIpVFSAD1/ZRKnw/
 DsHO293SaZMUGmYZsAwmmlGCZd8maLxpzmP8pX7PriSaD1NROpuo2ROZ2RplZ5cttqd6pvifhZ5
 LpLbt7x8LBlzCC6coCA==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61d577 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dTl6RCdMvzwMMP5_MCoA:9 a=O8hF6Hzn-FEA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_014856_408612_895AF2BC 
X-CRM114-Status: GOOD (  17.41  )
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

RISC-V hardware breakpoint framework is built on top of perf subsystem
and uses SBI debug trigger extension to
install/uninstall/update/enable/disable hardware triggers as specified
in Sdtrig ISA extension.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/Kconfig                     |   1 +
 arch/riscv/include/asm/hw_breakpoint.h | 337 +++++++++++
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/hw_breakpoint.c      | 738 +++++++++++++++++++++++++
 arch/riscv/kernel/traps.c              |   6 +
 6 files changed, 1085 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f7028caaeae0..a624dacdaf12 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -172,6 +172,7 @@ config RISCV
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU
+	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KERNEL_BZIP2 if !EFI_ZBOOT
 	select HAVE_KERNEL_GZIP if !EFI_ZBOOT
diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
new file mode 100644
index 000000000000..66a2df679f30
--- /dev/null
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -0,0 +1,337 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef __RISCV_HW_BREAKPOINT_H
+#define __RISCV_HW_BREAKPOINT_H
+
+struct task_struct;
+
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+
+#include <uapi/linux/hw_breakpoint.h>
+
+/* Maximum number of hardware breakpoints supported */
+#define RISCV_HW_BP_NUM_MAX 32
+
+#if __riscv_xlen == 64
+#define cpu_to_le cpu_to_le64
+#define le_to_cpu le64_to_cpu
+#elif __riscv_xlen == 32
+#define cpu_to_le cpu_to_le32
+#define le_to_cpu le32_to_cpu
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+#define RISCV_DBTR_BIT(_prefix, _name)		\
+	RISCV_DBTR_##_prefix##_##_name##_BIT
+
+#define RISCV_DBTR_BIT_MASK(_prefix, _name)		\
+	RISCV_DBTR_##_prefix##_name##_BIT_MASK
+
+#define RISCV_DBTR_BIT_MASK_VAL(_prefix, _name, _width)	\
+	(((1UL << (_width)) - 1) << RISCV_DBTR_BIT(_prefix, _name))
+
+#define CLEAR_DBTR_BIT(_target, _prefix, _bit_name)	\
+	__clear_bit(RISCV_DBTR_BIT(_prefix, _bit_name), &(_target))
+
+#define SET_DBTR_BIT(_target, _prefix, _bit_name)	\
+	__set_bit(RISCV_DBTR_BIT(_prefix, _bit_name), &(_target))
+
+#define RISCV_DBTR_EXEC		(0x1UL << 0)
+#define RISCV_DBTR_LOAD		(0x1UL << 1)
+#define RISCV_DBTR_STORE	(0x1UL << 2)
+#define RISCV_DBTR_LDST		(RISCV_DBTR_LOAD | RISCV_DBTR_STORE)
+
+enum {
+	RISCV_DBTR_TRIG_NONE = 0,
+	RISCV_DBTR_TRIG_LEGACY,
+	RISCV_DBTR_TRIG_MCONTROL,
+	RISCV_DBTR_TRIG_ICOUNT,
+	RISCV_DBTR_TRIG_ITRIGGER,
+	RISCV_DBTR_TRIG_ETRIGGER,
+	RISCV_DBTR_TRIG_MCONTROL6,
+};
+
+/* Trigger Data 1 */
+enum {
+	RISCV_DBTR_BIT(TDATA1, DATA)   = 0,
+#if __riscv_xlen == 64
+	RISCV_DBTR_BIT(TDATA1, DMODE)  = 59,
+	RISCV_DBTR_BIT(TDATA1, TYPE)   = 60,
+#elif __riscv_xlen == 32
+	RISCV_DBTR_BIT(TDATA1, DMODE)  = 27,
+	RISCV_DBTR_BIT(TDATA1, TYPE)   = 28,
+#else
+	#error "Unknown __riscv_xlen"
+#endif
+};
+
+enum {
+#if __riscv_xlen == 64
+	RISCV_DBTR_BIT_MASK(TDATA1, DATA) = RISCV_DBTR_BIT_MASK_VAL(TDATA1, DATA, 59),
+#elif __riscv_xlen == 32
+	RISCV_DBTR_BIT_MASK(TDATA1, DATA) = RISCV_DBTR_BIT_MASK_VAL(TDATA1, DATA,  27),
+#else
+	#error "Unknown __riscv_xlen"
+#endif
+	RISCV_DBTR_BIT_MASK(TDAT1, DMODE) = RISCV_DBTR_BIT_MASK_VAL(TDATA1, DMODE, 1),
+	RISCV_DBTR_BIT_MASK(TDATA1, TYPE) = RISCV_DBTR_BIT_MASK_VAL(TDATA1, TYPE,  4),
+};
+
+/* MC - Match Control Type Register */
+enum {
+	RISCV_DBTR_BIT(MC, LOAD)     = 0,
+	RISCV_DBTR_BIT(MC, STORE)    = 1,
+	RISCV_DBTR_BIT(MC, EXEC)     = 2,
+	RISCV_DBTR_BIT(MC, U)        = 3,
+	RISCV_DBTR_BIT(MC, S)        = 4,
+	RISCV_DBTR_BIT(MC, RES2)     = 5,
+	RISCV_DBTR_BIT(MC, M)        = 6,
+	RISCV_DBTR_BIT(MC, MATCH)    = 7,
+	RISCV_DBTR_BIT(MC, CHAIN)    = 11,
+	RISCV_DBTR_BIT(MC, ACTION)   = 12,
+	RISCV_DBTR_BIT(MC, SIZELO)   = 16,
+	RISCV_DBTR_BIT(MC, TIMING)   = 18,
+	RISCV_DBTR_BIT(MC, SELECT)   = 19,
+	RISCV_DBTR_BIT(MC, HIT)      = 20,
+#if __riscv_xlen >= 64
+	RISCV_DBTR_BIT(MC, SIZEHI) = 21,
+#endif
+#if __riscv_xlen == 64
+	RISCV_DBTR_BIT(MC, MASKMAX) = 53,
+	RISCV_DBTR_BIT(MC, DMODE)   = 59,
+	RISCV_DBTR_BIT(MC, TYPE)    = 60,
+#elif __riscv_xlen == 32
+	RISCV_DBTR_BIT(MC, MASKMAX) = 21,
+	RISCV_DBTR_BIT(MC, DMODE)   = 27,
+	RISCV_DBTR_BIT(MC, TYPE)    = 28,
+#else
+	#error "Unknown riscv xlen"
+#endif
+};
+
+enum {
+	RISCV_DBTR_BIT_MASK(MC, LOAD) = RISCV_DBTR_BIT_MASK_VAL(MC, LOAD, 1),
+	RISCV_DBTR_BIT_MASK(MC, STORE) = RISCV_DBTR_BIT_MASK_VAL(MC, STORE, 1),
+	RISCV_DBTR_BIT_MASK(MC, EXEC) = RISCV_DBTR_BIT_MASK_VAL(MC, EXEC, 1),
+	RISCV_DBTR_BIT_MASK(MC, U) = RISCV_DBTR_BIT_MASK_VAL(MC, U, 1),
+	RISCV_DBTR_BIT_MASK(MC, S) = RISCV_DBTR_BIT_MASK_VAL(MC, S, 1),
+	RISCV_DBTR_BIT_MASK(MC, RES2) = RISCV_DBTR_BIT_MASK_VAL(MC, RES2, 1),
+	RISCV_DBTR_BIT_MASK(MC, M) = RISCV_DBTR_BIT_MASK_VAL(MC, M, 1),
+	RISCV_DBTR_BIT_MASK(MC, MATCH) = RISCV_DBTR_BIT_MASK_VAL(MC, MATCH, 4),
+	RISCV_DBTR_BIT_MASK(MC, CHAIN) = RISCV_DBTR_BIT_MASK_VAL(MC, CHAIN, 1),
+	RISCV_DBTR_BIT_MASK(MC, ACTION) = RISCV_DBTR_BIT_MASK_VAL(MC, ACTION, 4),
+	RISCV_DBTR_BIT_MASK(MC, SIZELO) = RISCV_DBTR_BIT_MASK_VAL(MC, SIZELO, 2),
+	RISCV_DBTR_BIT_MASK(MC, TIMING) = RISCV_DBTR_BIT_MASK_VAL(MC, TIMING, 1),
+	RISCV_DBTR_BIT_MASK(MC, SELECT) = RISCV_DBTR_BIT_MASK_VAL(MC, SELECT, 1),
+	RISCV_DBTR_BIT_MASK(MC, HIT) = RISCV_DBTR_BIT_MASK_VAL(MC, HIT, 1),
+#if __riscv_xlen >= 64
+	RISCV_DBTR_BIT_MASK(MC, SIZEHI) = RISCV_DBTR_BIT_MASK_VAL(MC, SIZEHI,  2),
+#endif
+	RISCV_DBTR_BIT_MASK(MC, MASKMAX) = RISCV_DBTR_BIT_MASK_VAL(MC, MASKMAX, 6),
+	RISCV_DBTR_BIT_MASK(MC, DMODE) = RISCV_DBTR_BIT_MASK_VAL(MC, DMODE, 1),
+	RISCV_DBTR_BIT_MASK(MC, TYPE) = RISCV_DBTR_BIT_MASK_VAL(MC, TYPE, 4),
+};
+
+/* MC6 - Match Control 6 Type Register */
+enum {
+	RISCV_DBTR_BIT(MC6, LOAD)    = 0,
+	RISCV_DBTR_BIT(MC6, STORE)   = 1,
+	RISCV_DBTR_BIT(MC6, EXEC)    = 2,
+	RISCV_DBTR_BIT(MC6, U)       = 3,
+	RISCV_DBTR_BIT(MC6, S)       = 4,
+	RISCV_DBTR_BIT(MC6, RES2)    = 5,
+	RISCV_DBTR_BIT(MC6, M)       = 6,
+	RISCV_DBTR_BIT(MC6, MATCH)   = 7,
+	RISCV_DBTR_BIT(MC6, CHAIN)   = 11,
+	RISCV_DBTR_BIT(MC6, ACTION)  = 12,
+	RISCV_DBTR_BIT(MC6, SIZE)    = 16,
+	RISCV_DBTR_BIT(MC6, TIMING)  = 20,
+	RISCV_DBTR_BIT(MC6, SELECT)  = 21,
+	RISCV_DBTR_BIT(MC6, HIT)     = 22,
+	RISCV_DBTR_BIT(MC6, VU)      = 23,
+	RISCV_DBTR_BIT(MC6, VS)      = 24,
+#if __riscv_xlen == 64
+	RISCV_DBTR_BIT(MC6, DMODE)   = 59,
+	RISCV_DBTR_BIT(MC6, TYPE)    = 60,
+#elif __riscv_xlen == 32
+	RISCV_DBTR_BIT(MC6, DMODE)   = 27,
+	RISCV_DBTR_BIT(MC6, TYPE)    = 28,
+#else
+	#error "Unknown riscv xlen"
+#endif
+};
+
+enum {
+	RISCV_DBTR_BIT_MASK(MC6, LOAD) = RISCV_DBTR_BIT_MASK_VAL(MC6, LOAD, 1),
+	RISCV_DBTR_BIT_MASK(MC6, STORE) = RISCV_DBTR_BIT_MASK_VAL(MC6, STORE,  1),
+	RISCV_DBTR_BIT_MASK(MC6, EXEC) = RISCV_DBTR_BIT_MASK_VAL(MC6, EXEC, 1),
+	RISCV_DBTR_BIT_MASK(MC6, U) = RISCV_DBTR_BIT_MASK_VAL(MC6, U, 1),
+	RISCV_DBTR_BIT_MASK(MC6, S) = RISCV_DBTR_BIT_MASK_VAL(MC6, S, 1),
+	RISCV_DBTR_BIT_MASK(MC6, RES2) = RISCV_DBTR_BIT_MASK_VAL(MC6, RES2, 1),
+	RISCV_DBTR_BIT_MASK(MC6, M) = RISCV_DBTR_BIT_MASK_VAL(MC6, M, 1),
+	RISCV_DBTR_BIT_MASK(MC6, MATCH) = RISCV_DBTR_BIT_MASK_VAL(MC6, MATCH, 4),
+	RISCV_DBTR_BIT_MASK(MC6, CHAIN) = RISCV_DBTR_BIT_MASK_VAL(MC6, CHAIN, 1),
+	RISCV_DBTR_BIT_MASK(MC6, ACTION) = RISCV_DBTR_BIT_MASK_VAL(MC6, ACTION, 4),
+	RISCV_DBTR_BIT_MASK(MC6, SIZE) = RISCV_DBTR_BIT_MASK_VAL(MC6, SIZE, 4),
+	RISCV_DBTR_BIT_MASK(MC6, TIMING) = RISCV_DBTR_BIT_MASK_VAL(MC6, TIMING, 1),
+	RISCV_DBTR_BIT_MASK(MC6, SELECT) = RISCV_DBTR_BIT_MASK_VAL(MC6, SELECT, 1),
+	RISCV_DBTR_BIT_MASK(MC6, HIT) = RISCV_DBTR_BIT_MASK_VAL(MC6, HIT, 1),
+	RISCV_DBTR_BIT_MASK(MC6, VU) = RISCV_DBTR_BIT_MASK_VAL(MC6, VU, 1),
+	RISCV_DBTR_BIT_MASK(MC6, VS) = RISCV_DBTR_BIT_MASK_VAL(MC6, VS, 1),
+#if __riscv_xlen == 64
+	RISCV_DBTR_BIT_MASK(MC6, DMODE) = RISCV_DBTR_BIT_MASK_VAL(MC6, DMODE, 1),
+	RISCV_DBTR_BIT_MASK(MC6, TYPE) = RISCV_DBTR_BIT_MASK_VAL(MC6, TYPE, 4),
+#elif __riscv_xlen == 32
+	RISCV_DBTR_BIT_MASK(MC6, DMODE) = RISCV_DBTR_BIT_MASK_VAL(MC6, DMODE, 1),
+	RISCV_DBTR_BIT_MASK(MC6, TYPE) = RISCV_DBTR_BIT_MASK_VAL(MC6, TYPE, 4),
+#else
+	#error "Unknown riscv xlen"
+#endif
+};
+
+#define RISCV_DBTR_SET_TDATA1_TYPE(_t1, _type)				\
+	({								\
+		typeof(_t1) (td1t1) = (_t1);				\
+		(td1t1) &= ~RISCV_DBTR_BIT_MASK(TDATA1, TYPE);		\
+		(td1t1) |= (((unsigned long)(_type)			\
+			     << RISCV_DBTR_BIT(TDATA1, TYPE))		\
+			    & RISCV_DBTR_BIT_MASK(TDATA1, TYPE));	\
+		(td1t1);						\
+	})
+
+#define RISCV_DBTR_SET_MC_TYPE(_t1, _type)				\
+	({								\
+		typeof(_t1) (mct1) = (_t1);				\
+		(mct1) &= ~RISCV_DBTR_BIT_MASK(MC, TYPE);		\
+		(mct1) |= (((unsigned long)(_type)			\
+			    << RISCV_DBTR_BIT(MC, TYPE))		\
+			   & RISCV_DBTR_BIT_MASK(MC, TYPE));		\
+		(mct1);							\
+	})
+
+#define RISCV_DBTR_SET_MC6_TYPE(_t1, _type)				\
+	({								\
+		typeof(_t1) (mc6t1) = (_t1);				\
+		(mc6t1) &= ~RISCV_DBTR_BIT_MASK(MC6, TYPE);		\
+		(mc6t1) |= (((unsigned long)(_type)			\
+			     << RISCV_DBTR_BIT(MC6, TYPE))		\
+			    & RISCV_DBTR_BIT_MASK(MC6, TYPE));		\
+		(mc6t1);						\
+	})
+
+#define RISCV_DBTR_SET_MC_EXEC_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC, EXEC)
+
+#define RISCV_DBTR_SET_MC_LOAD_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC, LOAD)
+
+#define RISCV_DBTR_SET_MC_STORE_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC, STORE)
+
+#define RISCV_DBTR_SET_MC_SIZELO(_t1, _val)				\
+	({								\
+		typeof(_t1) (mcslt1) = (_t1);				\
+		mcslt1 &= ~RISCV_DBTR_BIT_MASK(MC, SIZELO);		\
+		mcslt1 |= (((_val) << RISCV_DBTR_BIT(MC, SIZELO))	\
+			   & RISCV_DBTR_BIT_MASK(MC, SIZELO));		\
+		(mcslt1);						\
+	})
+
+#if __riscv_xlen >= 64
+#define RISCV_DBTR_SET_MC_SIZEHI(_t1, _val)				\
+	({								\
+		typeof(_t1) (mcsht1) = (_t1);				\
+		mcsht1 &= ~RISCV_DBTR_BIT_MASK(MC, SIZEHI);		\
+		mcsht1 |= (((_val) << RISCV_DBTR_BIT(MC, SIZEHI))	\
+			   & RISCV_DBTR_BIT_MASK(MC, SIZEHI));		\
+		(mcsht1);						\
+	})
+#else
+/* SIZEHI does not exist in the rv32 mcontrol layout; nothing to set. */
+#define RISCV_DBTR_SET_MC_SIZEHI(_t1, _val) ((void)(_val), (_t1))
+#endif
+
+#define RISCV_DBTR_SET_MC6_EXEC_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC6, EXEC)
+
+#define RISCV_DBTR_SET_MC6_LOAD_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC6, LOAD)
+
+#define RISCV_DBTR_SET_MC6_STORE_BIT(_t1)		\
+	SET_DBTR_BIT(_t1, MC6, STORE)
+
+#define RISCV_DBTR_SET_MC6_SIZE(_t1, _val)				\
+	({								\
+		typeof(_t1) (mc6szt1) = (_t1);				\
+		(mc6szt1) &= ~RISCV_DBTR_BIT_MASK(MC6, SIZE);		\
+		(mc6szt1) |= (((_val) << RISCV_DBTR_BIT(MC6, SIZE))	\
+			      & RISCV_DBTR_BIT_MASK(MC6, SIZE));	\
+		(mc6szt1);						\
+	})
+
+struct arch_hw_breakpoint {
+	unsigned long address;
+	unsigned long len;
+	unsigned int type;
+
+	/* Trigger configuration data */
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
+struct perf_event_attr;
+struct notifier_block;
+struct perf_event;
+struct pt_regs;
+
+int hw_breakpoint_slots(int type);
+int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
+int hw_breakpoint_arch_parse(struct perf_event *bp,
+			     const struct perf_event_attr *attr,
+			     struct arch_hw_breakpoint *hw);
+int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
+				    unsigned long val, void *data);
+
+void arch_enable_hw_breakpoint(struct perf_event *bp);
+void arch_update_hw_breakpoint(struct perf_event *bp);
+void arch_disable_hw_breakpoint(struct perf_event *bp);
+int arch_install_hw_breakpoint(struct perf_event *bp);
+void arch_uninstall_hw_breakpoint(struct perf_event *bp);
+void hw_breakpoint_pmu_read(struct perf_event *bp);
+void clear_ptrace_hw_breakpoint(struct task_struct *tsk);
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
+
+#else
+
+int hw_breakpoint_slots(int type)
+{
+	return 0;
+}
+
+static inline void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+}
+
+static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+}
+
+void arch_enable_hw_breakpoint(struct perf_event *bp)
+{
+}
+
+void arch_update_hw_breakpoint(struct perf_event *bp)
+{
+}
+
+void arch_disable_hw_breakpoint(struct perf_event *bp)
+{
+}
+
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+#endif /* __RISCV_HW_BREAKPOINT_H */
diff --git a/arch/riscv/include/asm/kdebug.h b/arch/riscv/include/asm/kdebug.h
index 85ac00411f6e..53e989781aa1 100644
--- a/arch/riscv/include/asm/kdebug.h
+++ b/arch/riscv/include/asm/kdebug.h
@@ -6,7 +6,8 @@
 enum die_val {
 	DIE_UNUSED,
 	DIE_TRAP,
-	DIE_OOPS
+	DIE_OOPS,
+	DIE_DEBUG
 };
 
 #endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index cabb99cadfb6..590a280762c9 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
+obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
 ifeq ($(CONFIG_RISCV_SBI), y)
 obj-$(CONFIG_SMP)		+= sbi-ipi.o
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
new file mode 100644
index 000000000000..2d7914f50c5f
--- /dev/null
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -0,0 +1,738 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Qualcomm Technologies, Inc.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/hw_breakpoint.h>
+#include <linux/perf_event.h>
+#include <linux/spinlock.h>
+#include <linux/percpu.h>
+#include <linux/kdebug.h>
+#include <linux/bitops.h>
+#include <linux/cpu.h>
+#include <linux/cpuhotplug.h>
+
+#include <asm/sbi.h>
+
+/* Registered per-cpu bp/wp */
+static DEFINE_PER_CPU(struct perf_event *, pcpu_hw_bp_events[RISCV_HW_BP_NUM_MAX]);
+static DEFINE_PER_CPU(unsigned long, ecall_lock_flags);
+static DEFINE_PER_CPU(raw_spinlock_t, ecall_lock);
+
+/* Per-cpu shared memory between S and M mode */
+static union sbi_dbtr_shmem_entry __percpu *sbi_dbtr_shmem;
+
+/* number of debug triggers on this cpu . */
+static int dbtr_total_num __ro_after_init;
+static int dbtr_type __ro_after_init;
+static int dbtr_init __ro_after_init;
+
+#if __riscv_xlen == 64
+#define MEM_HI(_m)	0
+#define MEM_LO(_m)	((u64)(_m))
+#elif __riscv_xlen == 32
+#define MEM_HI(_m)	((u64)(_m) >> 32)
+#define MEM_LO(_m)	((u64)(_m) & 0xFFFFFFFFUL)
+#else
+#error "Unknown __riscv_xlen"
+#endif
+
+static int arch_smp_setup_sbi_shmem(unsigned int cpu)
+{
+	union sbi_dbtr_shmem_entry *dbtr_shmem;
+	phys_addr_t shmem_pa;
+	struct sbiret ret;
+	int rc = 0;
+
+	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
+	if (!dbtr_shmem) {
+		pr_err("Invalid per-cpu shared memory for debug triggers\n");
+		return -ENODEV;
+	}
+
+	shmem_pa = per_cpu_ptr_to_phys(dbtr_shmem);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
+			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
+
+	if (ret.error) {
+		switch (ret.error) {
+		case SBI_ERR_DENIED:
+			pr_warn("Access denied for shared memory at %pa\n",
+				&shmem_pa);
+			rc = -EPERM;
+			break;
+
+		case SBI_ERR_INVALID_PARAM:
+		case SBI_ERR_INVALID_ADDRESS:
+			pr_warn("Invalid address parameter (%lu)\n",
+				ret.error);
+			rc = -EINVAL;
+			break;
+
+		case SBI_ERR_ALREADY_AVAILABLE:
+			pr_warn("Shared memory is already set\n");
+			rc = -EADDRINUSE;
+			break;
+
+		case SBI_ERR_FAILURE:
+			pr_err("Internal sdtrig state error\n");
+			rc = -ENXIO;
+			break;
+
+		default:
+			pr_warn("Unknown error %lu\n", ret.error);
+			rc = -ENXIO;
+			break;
+		}
+	} else {
+		pr_info("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
+	}
+
+	return rc;
+}
+
+static int arch_smp_teardown_sbi_shmem(unsigned int cpu)
+{
+	struct sbiret ret;
+
+	/* Disable shared memory */
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
+			-1UL, -1UL, 0, 0, 0, 0);
+
+	if (ret.error) {
+		switch (ret.error) {
+		case SBI_ERR_DENIED:
+			pr_err("Access denied for shared memory.\n");
+			break;
+
+		case SBI_ERR_INVALID_PARAM:
+		case SBI_ERR_INVALID_ADDRESS:
+			pr_err("Invalid address parameter (%lu)\n", ret.error);
+			break;
+
+		case SBI_ERR_ALREADY_AVAILABLE:
+			pr_err("Shared memory is already set\n");
+			break;
+		case SBI_ERR_FAILURE:
+			pr_err("Internal sdtrig state error\n");
+			break;
+		default:
+			pr_err("Unknown error %lu\n", ret.error);
+			break;
+		}
+	} else {
+		pr_warn("CPU %d: HW Breakpoint shared memory disabled.\n", cpu);
+	}
+
+	return 0;
+}
+
+static void init_sbi_dbtr(void)
+{
+	unsigned long tdata1;
+	struct sbiret ret;
+
+	if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
+		pr_warn("SBI_EXT_DBTR is not supported\n");
+		dbtr_total_num = 0;
+		goto done;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			0, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect triggers\n");
+		dbtr_total_num = 0;
+		goto done;
+	}
+
+	tdata1 = 0;
+	tdata1 = RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL6);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect mcontrol6 triggers\n");
+	} else if (!ret.value) {
+		pr_warn("Type 6 triggers not available\n");
+	} else {
+		dbtr_total_num = ret.value;
+		dbtr_type = RISCV_DBTR_TRIG_MCONTROL6;
+		pr_warn("Mcontrol6 trigger available.\n");
+		goto done;
+	}
+
+	/* fallback to type 2 triggers if type 6 is not available */
+
+	tdata1 = 0;
+	tdata1 = RISCV_DBTR_SET_TDATA1_TYPE(tdata1, RISCV_DBTR_TRIG_MCONTROL);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect mcontrol triggers\n");
+	} else if (!ret.value) {
+		pr_warn("Type 2 triggers not available\n");
+	} else {
+		dbtr_total_num = ret.value;
+		dbtr_type = RISCV_DBTR_TRIG_MCONTROL;
+		goto done;
+	}
+
+done:
+	dbtr_init = 1;
+}
+
+int hw_breakpoint_slots(int type)
+{
+	/*
+	 * We can be called early, so don't rely on
+	 * static variables being initialised.
+	 */
+
+	if (!dbtr_init)
+		init_sbi_dbtr();
+
+	return dbtr_total_num;
+}
+
+int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw)
+{
+	unsigned int len;
+	unsigned long va;
+
+	va = hw->address;
+	len = hw->len;
+
+	return (va >= TASK_SIZE) && ((va + len - 1) >= TASK_SIZE);
+}
+
+static int rv_init_mcontrol_trigger(const struct perf_event_attr *attr,
+				    struct arch_hw_breakpoint *hw)
+{
+	switch (attr->bp_type) {
+	case HW_BREAKPOINT_X:
+		hw->type = RISCV_DBTR_EXEC;
+		RISCV_DBTR_SET_MC_EXEC_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RISCV_DBTR_LOAD;
+		RISCV_DBTR_SET_MC_LOAD_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RISCV_DBTR_STORE;
+		RISCV_DBTR_SET_MC_STORE_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RISCV_DBTR_LDST;
+		RISCV_DBTR_SET_MC_LOAD_BIT(hw->tdata1);
+		RISCV_DBTR_SET_MC_STORE_BIT(hw->tdata1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (attr->bp_type == HW_BREAKPOINT_X) {
+		/*
+		 * Userspace debuggers can request execute breakpoints with
+		 * bp_len == 2 for compressed/non-aligned instruction
+		 * addresses. Program execute triggers with "match any size"
+		 * to avoid missing valid instruction fetches.
+		 */
+		hw->len = 0;
+		hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 0);
+		hw->tdata1 = RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 0);
+	} else {
+		switch (attr->bp_len) {
+		case HW_BREAKPOINT_LEN_1:
+			hw->len = 1;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
+			break;
+		case HW_BREAKPOINT_LEN_2:
+			hw->len = 2;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 2);
+			break;
+		case HW_BREAKPOINT_LEN_4:
+			hw->len = 4;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 3);
+			break;
+#if __riscv_xlen >= 64
+		case HW_BREAKPOINT_LEN_8:
+			hw->len = 8;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 1);
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 1);
+			break;
+#endif
+		/* Set to match any size */
+		default:
+			hw->len = 0;
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZELO(hw->tdata1, 0);
+			hw->tdata1 = RISCV_DBTR_SET_MC_SIZEHI(hw->tdata1, 0);
+			break;
+		}
+	}
+
+	hw->tdata1 = RISCV_DBTR_SET_MC_TYPE(hw->tdata1, RISCV_DBTR_TRIG_MCONTROL);
+
+	CLEAR_DBTR_BIT(hw->tdata1, MC, DMODE);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, TIMING);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, SELECT);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, ACTION);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, CHAIN);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, MATCH);
+	CLEAR_DBTR_BIT(hw->tdata1, MC, M);
+
+	SET_DBTR_BIT(hw->tdata1, MC, S);
+	SET_DBTR_BIT(hw->tdata1, MC, U);
+
+	return 0;
+}
+
+static int rv_init_mcontrol6_trigger(const struct perf_event_attr *attr,
+				     struct arch_hw_breakpoint *hw)
+{
+	switch (attr->bp_type) {
+	case HW_BREAKPOINT_X:
+		hw->type = RISCV_DBTR_EXEC;
+		RISCV_DBTR_SET_MC6_EXEC_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RISCV_DBTR_LOAD;
+		RISCV_DBTR_SET_MC6_LOAD_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RISCV_DBTR_STORE;
+		RISCV_DBTR_SET_MC6_STORE_BIT(hw->tdata1);
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RISCV_DBTR_LDST;
+		RISCV_DBTR_SET_MC6_STORE_BIT(hw->tdata1);
+		RISCV_DBTR_SET_MC6_LOAD_BIT(hw->tdata1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (attr->bp_type == HW_BREAKPOINT_X) {
+		/* See rv_init_mcontrol_trigger() for rationale. */
+		hw->len = 0;
+		hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 0);
+	} else {
+		switch (attr->bp_len) {
+		case HW_BREAKPOINT_LEN_1:
+			hw->len = 1;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 1);
+			break;
+		case HW_BREAKPOINT_LEN_2:
+			hw->len = 2;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 2);
+			break;
+		case HW_BREAKPOINT_LEN_4:
+			hw->len = 4;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 3);
+			break;
+#if __riscv_xlen >= 64
+		case HW_BREAKPOINT_LEN_8:
+			hw->len = 8;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 5);
+			break;
+#endif
+		/* Set to match any size */
+		default:
+			hw->len = 0;
+			hw->tdata1 = RISCV_DBTR_SET_MC6_SIZE(hw->tdata1, 0);
+		}
+	}
+
+	hw->tdata1 = RISCV_DBTR_SET_MC6_TYPE(hw->tdata1, RISCV_DBTR_TRIG_MCONTROL6);
+
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, DMODE);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, TIMING);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, SELECT);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, ACTION);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, CHAIN);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, MATCH);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, M);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, VS);
+	CLEAR_DBTR_BIT(hw->tdata1, MC6, VU);
+
+	SET_DBTR_BIT(hw->tdata1, MC6, S);
+	SET_DBTR_BIT(hw->tdata1, MC6, U);
+
+	return 0;
+}
+
+int hw_breakpoint_arch_parse(struct perf_event *bp,
+			     const struct perf_event_attr *attr,
+			     struct arch_hw_breakpoint *hw)
+{
+	int ret;
+
+	/* Breakpoint address */
+	hw->address = attr->bp_addr;
+	hw->tdata2 = attr->bp_addr;
+	hw->tdata3 = 0x0;
+
+	switch (dbtr_type) {
+	case RISCV_DBTR_TRIG_MCONTROL:
+		ret = rv_init_mcontrol_trigger(attr, hw);
+		break;
+	case RISCV_DBTR_TRIG_MCONTROL6:
+		ret = rv_init_mcontrol6_trigger(attr, hw);
+		break;
+	default:
+		pr_warn("Unsupported trigger type\n");
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+/*
+ * HW Breakpoint/watchpoint handler
+ */
+static int hw_breakpoint_handler(struct die_args *args)
+{
+	int ret = NOTIFY_DONE;
+	struct arch_hw_breakpoint *bp;
+	struct perf_event *event;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		event = this_cpu_read(pcpu_hw_bp_events[i]);
+		if (!event)
+			continue;
+
+		bp = counter_arch_bp(event);
+		switch (bp->type) {
+		/* Breakpoint */
+		case RISCV_DBTR_EXEC:
+			if (bp->address == args->regs->epc) {
+				perf_bp_event(event, args->regs);
+				ret = NOTIFY_STOP;
+			}
+			break;
+
+		/* Watchpoint */
+		case RISCV_DBTR_LOAD:
+		case RISCV_DBTR_STORE:
+		case RISCV_DBTR_LDST:
+		{
+			unsigned long stval = csr_read(CSR_STVAL);
+			unsigned long bp_start = bp->address;
+			unsigned long bp_len = bp->len ?: 1;
+			unsigned long bp_end = bp_start + bp_len - 1;
+			unsigned long stval_end = stval + sizeof(long) - 1;
+			unsigned long tdata1;
+			bool hit = false;
+			struct sbiret sret;
+			union sbi_dbtr_shmem_entry *shmem;
+
+			if (bp_end < bp_start)
+				bp_end = ~0UL;
+			if (stval_end < stval)
+				stval_end = ~0UL;
+
+			/*
+			 * Prefer tdata1.hit from SBI trigger readout whenever
+			 * possible. Fall back to address-based matching if HIT
+			 * isn't observed/supported.
+			 */
+			raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+					      *this_cpu_ptr(&ecall_lock_flags));
+			shmem = this_cpu_ptr(sbi_dbtr_shmem);
+			sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
+					 i, 1, 0, 0, 0, 0);
+			if (!sret.error) {
+				tdata1 = le_to_cpu(shmem->data.tdata1);
+
+				if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL)
+					hit = !!(tdata1 & RISCV_DBTR_BIT_MASK(MC, HIT));
+				else if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL6)
+					hit = !!(tdata1 & RISCV_DBTR_BIT_MASK(MC6, HIT));
+			}
+			raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+						   *this_cpu_ptr(&ecall_lock_flags));
+
+			/*
+			 * Sdtrig may report STVAL as the lowest accessed
+			 * address while the watchpoint can match a higher byte
+			 * in the same access.
+			 */
+			if (hit ||
+			    (stval >= bp_start && stval <= bp_end) ||
+			    (bp_start >= stval && bp_start <= stval_end)) {
+				perf_bp_event(event, args->regs);
+				ret = NOTIFY_STOP;
+			}
+			break;
+		}
+
+		default:
+			pr_warn("Unknown type: %u\n", bp->type);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
+				    unsigned long val, void *data)
+{
+	if (val != DIE_DEBUG)
+		return NOTIFY_DONE;
+
+	return hw_breakpoint_handler(data);
+}
+
+/* atomic: counter->ctx->lock is held */
+int arch_install_hw_breakpoint(struct perf_event *event)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
+	struct sbi_dbtr_data_msg *xmit;
+	struct sbi_dbtr_id_msg *recv;
+	struct perf_event **slot;
+	unsigned long idx;
+	struct sbiret ret;
+	int err = 0;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	xmit = &shmem->data;
+	recv = &shmem->id;
+	xmit->tdata1 = cpu_to_le(bp->tdata1);
+	xmit->tdata2 = cpu_to_le(bp->tdata2);
+	xmit->tdata3 = cpu_to_le(bp->tdata3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_INSTALL,
+			1, 0, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to install trigger\n");
+		err = -EIO;
+		goto done;
+	}
+
+	idx = le_to_cpu(recv->idx);
+	if (idx >= dbtr_total_num) {
+		pr_warn("Invalid trigger index %lu\n", idx);
+		err = -EINVAL;
+		goto done;
+	}
+
+	slot = this_cpu_ptr(&pcpu_hw_bp_events[idx]);
+	if (*slot) {
+		pr_warn("Slot %lu is in use\n", idx);
+		err = -EBUSY;
+		goto done;
+	}
+
+	/* Save the event - to be looked up in handler */
+	*slot = event;
+
+done:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+	return err;
+}
+
+/* atomic: counter->ctx->lock is held */
+void arch_uninstall_hw_breakpoint(struct perf_event *event)
+{
+	struct sbiret ret;
+	int i;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		struct perf_event **slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event) {
+			*slot = NULL;
+			break;
+		}
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		goto out;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UNINSTALL,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to uninstall trigger %d.\n", i);
+		goto out;
+	}
+
+ out:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+}
+
+void arch_enable_hw_breakpoint(struct perf_event *event)
+{
+	struct sbiret ret;
+	int i;
+	struct perf_event **slot;
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		goto out;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_ENABLE,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to install trigger %d\n", i);
+		goto out;
+	}
+
+ out:
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+}
+EXPORT_SYMBOL_GPL(arch_enable_hw_breakpoint);
+
+void arch_update_hw_breakpoint(struct perf_event *event)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
+	struct sbi_dbtr_data_msg *xmit;
+	struct perf_event **slot;
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		return;
+	}
+
+	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+			      *this_cpu_ptr(&ecall_lock_flags));
+
+	xmit = &shmem->data;
+	xmit->tdata1 = cpu_to_le(bp->tdata1);
+	xmit->tdata2 = cpu_to_le(bp->tdata2);
+	xmit->tdata3 = cpu_to_le(bp->tdata3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_UPDATE,
+			i, 1, 0, 0, 0, 0);
+	if (ret.error)
+		pr_warn("Failed to update trigger %d.\n", i);
+
+	raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+				   *this_cpu_ptr(&ecall_lock_flags));
+}
+EXPORT_SYMBOL_GPL(arch_update_hw_breakpoint);
+
+void arch_disable_hw_breakpoint(struct perf_event *event)
+{
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		struct perf_event **slot = this_cpu_ptr(&pcpu_hw_bp_events[i]);
+
+		if (*slot == event)
+			break;
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("Breakpoint not installed.\n");
+		return;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_DISABLE,
+			i, 1, 0, 0, 0, 0);
+
+	if (ret.error) {
+		pr_warn("Failed to uninstall trigger %d.\n", i);
+		return;
+	}
+}
+EXPORT_SYMBOL_GPL(arch_disable_hw_breakpoint);
+
+void hw_breakpoint_pmu_read(struct perf_event *bp)
+{
+}
+
+void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+}
+
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+}
+
+static int __init arch_hw_breakpoint_init(void)
+{
+	unsigned int cpu;
+	int rc = 0;
+
+	for_each_possible_cpu(cpu)
+		raw_spin_lock_init(&per_cpu(ecall_lock, cpu));
+
+	if (!dbtr_init)
+		init_sbi_dbtr();
+
+	if (dbtr_total_num) {
+		pr_info("Total number of type %d triggers: %u\n",
+			dbtr_type, dbtr_total_num);
+	} else {
+		pr_info("No hardware triggers available\n");
+		goto out;
+	}
+
+	/* Allocate per-cpu shared memory */
+	sbi_dbtr_shmem = __alloc_percpu(sizeof(*sbi_dbtr_shmem) * dbtr_total_num,
+					PAGE_SIZE);
+
+	if (!sbi_dbtr_shmem) {
+		pr_warn("Failed to allocate shared memory.\n");
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	/* Hotplug handler to register/unregister shared memory with SBI */
+	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+			       "riscv/hw_breakpoint:prepare",
+			       arch_smp_setup_sbi_shmem,
+			       arch_smp_teardown_sbi_shmem);
+
+	if (rc < 0) {
+		pr_warn("Failed to setup CPU hotplug state\n");
+		free_percpu(sbi_dbtr_shmem);
+		return rc;
+	}
+ out:
+	return rc;
+}
+arch_initcall(arch_hw_breakpoint_init);
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8c62c771a656..029fd66a285e 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -286,6 +286,12 @@ void handle_break(struct pt_regs *regs)
 	if (probe_breakpoint_handler(regs))
 		return;
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
+	    == NOTIFY_STOP)
+		return;
+#endif
+
 	current->thread.bad_cause = regs->cause;
 
 	if (user_mode(regs))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
