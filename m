Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF45CD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZEQ3mk8U3JHJJdJ+rAEebeI/gz/SnQjLLiiL+whdes=; b=hLdJyIPr6eybEE
	bLqaFBqllaj44byuSsKd3kpB4mpSotUSjGXNcla0ZTHMxOd2uEnVNvN/lkRQD4zd49NCQCg+0VP4B
	ViMzW1/joRkaFUlmwQoxoU1ERJCBPsxhJhfdtJaRmcdwrfZA6aYlOciX+//3TJkqwI5HWotNwqAE+
	ARzbUfZBJ/oLIitxSv7HoNYLMxcod4VHqk3KlLySTspPVE5qh/OTAU4ZVP/rp2NxRmS4cXUU1dv/K
	eVA8lthaLIBfextAFPTE/mi0KLjGIrPA/hIkvXvJXgwvg5ELieuaTuJrO9Eb33Kjp025sWxGXIEnq
	bH2K1M/q2+A/hDBTukag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5CC-00000001mAa-1855;
	Wed, 13 May 2026 08:44:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5C9-00000001m9F-2eVe
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:43:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pG842331553
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZktuxFKbZoJ
	xn+4CgM4kaOVJh9P4Xaw+uozUmzXsWPk=; b=khGZ0Nnyp4YYx9eMqzTrHGOSLJt
	yp6TarjLJRwnDAd9pOEmLPPBDiwreDO3XEuzRiFgosLbCmKgyMCPghK9Z8N3btH6
	od4Z5l+o9xne+x0N2Hmkr7gr/SwsBBdDmjZBE+KzkJH5mZqTqME0qMMmm45yXG3N
	iYbAlGvE//QJRO9HXDkbTcDuPQ0jI8nYobZncMMMh1OTd1pN4ZJFPlsXYTYJl3SI
	Sh3mPtZYU2u6Utf1cyxRbZl72JbjXV5h7IpUGZA5neNsZN10uN58bsTW3kgzs/yG
	LFYsJrwcCOhF/VzgOdVfGmHgu25JW7pXF6uxxNnmHO6wPxj+o1PAm0X4G8g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43ypc8ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:43:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9b8137828so69499155ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661835; x=1779266635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZktuxFKbZoJxn+4CgM4kaOVJh9P4Xaw+uozUmzXsWPk=;
        b=C1WzNRdIzYdo2bdzsrvWXRQnF6+bIZewR/dv0MFuxxAxG/4GKrBNcM+4+5q1nRheWl
         gtMyr1Pbsiqcss+v9zBjoilNBWfDBYtRWiioA0vOu+eT0ouDklbeKwKbbdDPeps0yeqZ
         rnVGgRXBrNMgQDhJaspLp1TwVOrHN25tyVPiv3Eedlx4wRCq6QIg2/gLHmFyhyms5Hd9
         C38UqtgIqSFsCtNvpjubAqfa+Q8Z7GBNwzMxTlTrutpSectoW/Wp8ogKv7izRaQuh88R
         hTo7uU0XfozUtoIvBli9MYl/6/tj8tH7x+iCIyNttWlPySNEPMp3Q+Nr4Pz5vERqtRV2
         RF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661835; x=1779266635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZktuxFKbZoJxn+4CgM4kaOVJh9P4Xaw+uozUmzXsWPk=;
        b=rOBkjhce9Fshy0QFKES/f7yxy6+d4xbZCEwJx2z6P2TJuzpFyWGmcn00wfQLBzNaKU
         fHsJKIG8EPLlxqxr4KBZ3mJHZFy7a9teCIuImj/ApcfMS23CzBBerAoxRGx+oa84tqIm
         4rU/g03Wq8qT2Sy1ntOLtX3rhKSvLsXRu9gz2w9v9JH/sHbY/qQN/vE6nTKZ6dT+pMDT
         M3OLzdGQLjhLYYrGUQW160kA9CQygzKW82EhlJwU+co0lXw2m72x4aD2Y3nV0PfTdoXT
         EhgUMWj1NhCTd1KkR4luGVWWJ4hVSQBkt4LnOkUF314NprZNeJDNAi7n3fC/1+xBSaA6
         qDWw==
X-Gm-Message-State: AOJu0Yx2Zx4VaGbd4LoLAXVfdSjMKHbn0t619nCVfQvAh/Ckb+QHbwky
	x0AQACPkzW10WE5ni5Iinwfp4k1PyRntZaTZCbnyL2Rx3k/O3mMGxH6bu+jYQDobNlahTz665rV
	QDQuMN39bi3jngZ+vhyMa4Xm5ykx6OcJhGV6mAmKPdYK6YDShV3YNuL2hU44ZgAfyB22dlNTJTK
	3lbd8=
X-Gm-Gg: Acq92OHilOwf2sCQJt14SvFoT16C8BYYjTpAQM8atwJ1eXWD5JB/am4d6egBgObXJjn
	FmfW6HUw89OkSRNvAm4rwxDr8z0nyoRUvV57C9t4rJ2Ag84eLeyGIXeE4Bg+p8l7Xcx8AXB0j4O
	UMyoHkbJUP+50ZaM7/2djlavc1olNUlCC2JYgDEsr5KJaXaYm6QCq1RuwMsIsJZSkdvBmtKPdsx
	uFBdA7ghZYtu2GY9V7RCJLlgsowU10bb+k9hy4XDffImdUiNtl29We55lnLjlORNoJSfFaTgDwS
	yW1hSCEihmZiYqVD6cWnVs250rsx5QFCy57tZ/H2/3h1QV0NFccl4Rz1LbCWekWBOFcxB6YFkI5
	GjjzxST087n8kfagkBuo/MSXqF1fSmKs8QdY2wrUVo0LVXxqbJ6cUYskOnsLKOt/W2eYFnI2Ke2
	TcMXezsVA/wKjr/wa1lHMRgnO9vKzkUvYipHyy4F+R1CkIwQ==
X-Received: by 2002:a17:902:e156:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2bd2fe21b60mr14244565ad.25.1778661835408;
        Wed, 13 May 2026 01:43:55 -0700 (PDT)
X-Received: by 2002:a17:902:e156:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2bd2fe21b60mr14244275ad.25.1778661834836;
        Wed, 13 May 2026 01:43:54 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:43:54 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 02/10] riscv: Define arch_apei_get_mem_attribute for RISC-V
Date: Wed, 13 May 2026 14:13:17 +0530
Message-ID: <20260513084325.2176952-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: JP4hBApQDZ0y4O4chQ7yCZoLygehGEiu
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a0439cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eGWCFza2bnmXRcdnH9YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfX1kL3qBMyY/LS
 2K4kEBf8T1Pp1mXwEqJONjz5E7Po/7OJ1cH3JGi/dFkQm80DQuZ/L5sx7rAMxq4l1QBqCzO4Mq4
 ozt5TYvZHR4lc5xypWuTImnTrNaBqhNG/4CVWWb/rBZ15vXZICF0xcOKXlN5IOC5c1Eb2uYhdGT
 Y6+9vBYgmYJI6/3npaEJA+2u/Bz32b0wUmQ/5RIiGl0R0Z5pplcmJpMM4AqydgBaMSsAx5iMVGN
 jQSh4k+0HXqevNb6vTWg774zJMeTrI90BhlgN36ihPUdYuOeSSGpvpnsVDr1nvY0JC6/uzfMpkn
 mvYiY0APueiSbl98yomEdVuKYIkMl9b6o7/PPI3GsEpU3d0lUUyTopaxZfq++Oc+0DRUmonJP0R
 5EfFYzkSpKq++j68C1po9ZgNvq75hA5WCNHggSO7xqUARibf9YfivlA4QFhDHRCUhBF1Y5nwU6P
 dwWMkngVqbO2oA7uPVA==
X-Proofpoint-GUID: JP4hBApQDZ0y4O4chQ7yCZoLygehGEiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_014357_788183_1C687DA1 
X-CRM114-Status: GOOD (  14.33  )
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

ghes_map function uses arch_apei_get_mem_attribute to get the
protection bits for a given physical address. These protection
bits are then used to map the physical address.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/include/asm/acpi.h | 16 ++++++++++++++++
 arch/riscv/kernel/acpi.c      | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 26ab37c171bc..c142db9f81a7 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -14,6 +14,7 @@
 
 /* Basic configuration for ACPI */
 #ifdef CONFIG_ACPI
+pgprot_t __acpi_get_mem_attribute(phys_addr_t addr);
 
 typedef u64 phys_cpuid_t;
 #define PHYS_CPUID_INVALID INVALID_HARTID
@@ -27,6 +28,21 @@ extern int acpi_disabled;
 extern int acpi_noirq;
 extern int acpi_pci_disabled;
 
+#ifdef	CONFIG_ACPI_APEI
+/*
+ * acpi_disable_cmcff to disable IA-32 Corrected Machine Check (CMC)
+ * Firmware-First mode. It is not required in RISC-V architecture
+ * and is present for compatibility
+ */
+#define acpi_disable_cmcff 1
+static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+{
+	return  __acpi_get_mem_attribute(addr);
+}
+#else /* CONFIG_ACPI_APEI */
+#define acpi_disable_cmcff 0
+#endif /* !CONFIG_ACPI_APEI */
+
 static inline void disable_acpi(void)
 {
 	acpi_disabled = 1;
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 068e0b404b6f..7a6770697999 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -204,6 +204,18 @@ struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
 	return &cpu_madt_rintc[cpu];
 }
 
+pgprot_t __acpi_get_mem_attribute(phys_addr_t addr)
+{
+	u64 attr;
+
+	attr = efi_mem_attributes(addr);
+	if (attr & EFI_MEMORY_WB)
+		return PAGE_KERNEL;
+	if ((attr & EFI_MEMORY_WC) || (attr & EFI_MEMORY_WT))
+		return pgprot_writecombine(PAGE_KERNEL);
+	return PAGE_KERNEL;
+}
+
 /*
  * __acpi_map_table() will be called before paging_init(), so early_ioremap()
  * or early_memremap() should be called here to for ACPI table mapping.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
