Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61861C98314
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dCuU5A2VyYWcivuiw2H5nFf4viqFH7/bsRf8sU129Y=; b=pUl4TT8hDE5UTS
	I3ETT1z/NMssQ87tZqdoMEaouMmKfik7U0LNDd5mG5laqQ8mc+gSQc4r0owVykO9kHsYH/yua/qXi
	1Q3HaU0AZEUM9+bbfJxqpJrGSriQ8AZfRpuY0w4SY7ve0uVRj/HZ3XJmWU9vsupm6iXktQ8y0mviW
	G8SwMEAzcd0QxB3irbF5snKbSSCDDtYiBhp6vJ7pQ2ozjAmDlS1ItLp5R9pbMbWhPGELN2oxy3+e5
	VqQHHKExM+g48K4ouXv5sL5ZN+043rWtfIGpNDBQWf6euIZIkJt+f+LL7x+eGjQLOqortTmR1u+Vx
	38Gdv6STod23+p8pL0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1W-0000000AJEe-3JfO;
	Thu, 24 Sep 2026 07:37:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1T-0000000AJDX-47iW
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 07:37:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e9J92420873
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qPsTlQAM/LB
	nJylXg8OveQ+2HeryYn1OqFxtCZ6vpxA=; b=SGWP3EFXzqW2CbC0eoctGT8Jq2/
	dnut85dn8ztldhowjK0vriSqCD2uXChvmsgOEkhjzSZstsy8/AMhVYNZCwXGF7M3
	e685BogjiciCNsQSPmxw8wRIJlS1TNBahME2++C12ASkU0vNscbqPgYK5AIC07jo
	7Ydn0jcYTq3WBlQGANptp8MpjdbZKe576gW+xm1lwo1TB3FeFprIClMcTMYGrYBS
	iILgMCQe2aLRszr1pdHQXgTEJf+w8z8OPn3DXCdClNv4yZAsYrMLEOFwgvcBCspc
	ssuQ5LDI4ggg2wKyBOXiEr9sN/86/mvInNeaeOnMMwsVJK+dgsOvHA095Kw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuhadv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-333543ac378so2104241eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 00:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235459; x=1790840259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPsTlQAM/LBnJylXg8OveQ+2HeryYn1OqFxtCZ6vpxA=;
        b=VCOh1wKmUUt7seCQ5m+QOTIdVX8L2hYYz74olQGfOuhpORpfoZzB6Bo1RmnxjL5Tq7
         2lH+0+UCy2uLpGkvuhGYn1tmBQbca61X3fZE973hSYuaaenU07O1PNKn42oX4kLR3TtK
         oQxBfwoTM2u8YD4crmlJUN6wFL4fdMgUrAJPADZAFxAPai8ZieOIY1HQdoS2h/YL6Lb0
         XJRh7XZgs2JY64GEtc0OZR6xNDzIJG21Yp4wlA7OW/0ORB45Nkf/ZCnareT8qDZ46e2D
         Q2c6thrJpEmieztv9vGM/2lHRs8UyFwqDkIYAhBNArWXV9T9QXyya3XSsuOj23Wailsf
         qPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235459; x=1790840259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPsTlQAM/LBnJylXg8OveQ+2HeryYn1OqFxtCZ6vpxA=;
        b=1rYzgAC3TISLH9NE+hiEVHnUT5i73CBcEDMys4D7hN7lKqEEJ4Iuuy0wB82Hu5QTGu
         YT47aLYc3Ixp6fluEWsQZM4t/WXqWJnDBhywkSYN3G1uWLAMIAhPeGnr9x9lznV2TSGM
         bTH6TTHXhw/vluGJURSMpK5/KcQ5YiRMu3S/uA3wYUATIey3JK0OK9QU5N9qo/neTk73
         XhhHWbORmTZ2UQgm1DG3SVjhEy3Tb06k3uczl+gd97dC4kde8Zy8tUbf88d4aJP2gV19
         BeeVfe0F2V9j/NM3jcQMs83j8MIg2RbQbuEhHPDj3EBf1bVGvdT48Aqf/RCG93MbVioi
         Qt1w==
X-Gm-Message-State: AFuF++kPsuH9c4kFQT9oHNh+ncF65m/w6+H4X+t+W6LwgviSDVR/VdO0
	UK5ZklYT3gfFF8rxGumRir2WhNFm/RZyWoBpuRMkF2hM4iDBPtwoNznOYOgU7eLI24fpLwg/COk
	RQAIkKoLUpjaLPfzu5hpLHuSh7SCG5oIHTZz9tllW7VSP0zxW4hWzTAJ0VwW4ey13TXToha/5uV
	zoNWg=
X-Gm-Gg: AYBFou3OJ5JEYmxOhygPsaV1MV/h27Q0IFhOsyJNSGY7SunSmHsGhzVnDq/dvFGzMGA
	YxceCyzlEjs2foLapAhAMFxgM+awkEMjHbKUD/Et6Z3X4otRcycswn5UECW4RA30r3hr2ymCH7A
	NfU9yUTNzy2rcvP00KhTd07/vbWwowWyhe9ATGRVZfVJc3GIUR7jzl1K0QQzIo3D+g6GWMUCsI0
	mnX8zp/H/OZfMI1if05lSqQU3kuOBgAuZyHNFIMSKmRReSvLoTgBFdAQT/+yw4bv95G38yGmH/C
	odxEBtBKq46OuHjFQAKbJMZSlbj6DUAPuYHRNxOq4JI46L85AtBcfYgM/yOAtSXfB4gXICXNK+S
	2zKT0K6a3D2JvpucTaR/dEHkwHs1k0MGNM+PryXsXHmRDQC5t8jq8lzuCYMS+sLi8wj3GG4zKib
	e4nbWDb9gUPtOd+cFeaisxfHJS
X-Received: by 2002:a05:7300:7315:b0:33b:e9a7:d81f with SMTP id 5a478bee46e88-340031cca3cmr1644054eec.11.1790235458666;
        Thu, 24 Sep 2026 00:37:38 -0700 (PDT)
X-Received: by 2002:a05:7300:7315:b0:33b:e9a7:d81f with SMTP id 5a478bee46e88-340031cca3cmr1644026eec.11.1790235458107;
        Thu, 24 Sep 2026 00:37:38 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:37:37 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 2/9] riscv: Define arch_apei_get_mem_attribute for RISC-V
Date: Thu, 24 Sep 2026 13:07:07 +0530
Message-ID: <20260924073714.1650588-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXzmzEBTVRwHUy
 L8xq9IY0X/BR3urDromNsIi5misofJi2PuY2oxd3ITL8Aq4jD093L+i3lT2KHR4koegBCJt2u5b
 Cw++K2hunwyr/rE+uwxF3mzhSCUMneI=
X-Proofpoint-ORIG-GUID: JcDrOJJ_p9E_taC2Fw5IwJjRR02MWd5u
X-Proofpoint-GUID: JcDrOJJ_p9E_taC2Fw5IwJjRR02MWd5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX5xN5ryDldCTz
 X9Dh4CEmXm+WbHR1QqQh2unjjBw+mebaPqYznSPlBwsfmWRa6LUvqV7IQIHppjIgpWJAt4EWgh7
 4xRb4x3RAuav7LtbbuD9Sc55xoghWUCjI0QcCU6WZJoNpnapSLLk6hhW010qE8hPSKSQcS2/lgx
 r84EL0ssecwRD8udFDQGLibrDcct8xBE7l72mawVkAF0E1it95zYbSo1PXJM22GqblGHdBEoyhM
 MwPE1KfNC5dcdhLHKAIltCma6IJMwhNDKaZQELKWNgJIgsnUp2IQCHEKmGJxUx8Ywv/ZbALHOc/
 +GqP3EtYFu5Q6nW4ynWOVhghdGkQ9RHh0V6+LbAdtQzJh5dO5aVbrBEEK+WCohyFLwJinBhi24W
 AKY+XgWExBnVreYGUow75sUDpbt2wz0YeHgNVMdX9yc0AehD+v2C+TC4AOm53aByzZja1YPpY7L
 9yoFoY4hQyTAsLoousQ==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4d343 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=eGWCFza2bnmXRcdnH9YA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_003740_090939_95BABF07 
X-CRM114-Status: GOOD (  14.99  )
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

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/include/asm/acpi.h | 16 ++++++++++++++++
 arch/riscv/kernel/acpi.c      | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index cdefa1f2d67d..c7dee956cdb1 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -16,6 +16,7 @@
 
 /* Basic configuration for ACPI */
 #ifdef CONFIG_ACPI
+pgprot_t __acpi_get_mem_attribute(phys_addr_t addr);
 
 typedef u64 phys_cpuid_t;
 #define PHYS_CPUID_INVALID INVALID_HARTID
@@ -29,6 +30,21 @@ extern int acpi_disabled;
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
index efd52a5d05b5..d1e472ce0878 100644
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
