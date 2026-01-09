Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F84CD232F6
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIPjQXfI83tAHSe/Je33OZV2+uP7RVsmTuZTMiZeNn4=; b=bOf6crnVqvN488
	2QZg1VXnkEodNGk9S/0/SBI+kWLVV25UcSGiiTLSGfHckcrD2GifhXzN5LCHCkDo+MB5DGK5iNy6i
	dOEdIHTRjDMS1NiHjl2Gyj07M/hr1LDxQMIB/n2O3eo0JK66XFSPgB6VxN48FzoGgnA7ye4ITsXbV
	PFQfS3tjzcTzq9gFAOsSaalZMISQkeHhSTaftuv+wxqYGvOE2bID31w1eVnKde9S7dTxHUTSpQB2D
	Sw5y6MXF3K/lcMOK4MffSrElGfVRvjohRM0A25CVe/f/6omTCdP00zwLlf4D1mtw+0BCuq6fe6ASX
	8klXc1soPjVu55hoCZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OM-00000001xC2-0Ptt;
	Fri, 09 Jan 2026 09:02:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OJ-00000001xAw-0xJa
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:02:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6094t2YA2706815
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m2SLt+ibhBF
	eKeTazqX12oxB+MUF6EudEtGynVS4dKk=; b=VLYnbIfi+3ZbXTAor5IETt3WWB6
	pieuPY13RqGZL2vjDCN6I3r2xswRglaQbWCepMrq3DT0vLSx0INPxWUHNHxYekOo
	AO6cUKlzhACVZaqMR4K6n9z6y6H5v4oQZG2FkglLrcR3JxaJRKEhjAiKKtsyzfUl
	1Q5gAlKqiHIduWatuQRpDsqyFIrcA7uT+rKs8gQbCd55YtY4q+0EUeta2qDXUO5b
	SAnsUkazdaXPvyhmDHsoO+cVqRIMpL77FfOGb97LBC50kFv1jR+AoUzy98ye77ST
	yzRJyAhd57Y9rXZuQNC26xpFU16wFNmpL3qKYSIDpNzNK/19aXugTegD8Vw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj9hquy2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:02:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81c68fef4d4so3379171b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949362; x=1768554162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2SLt+ibhBFeKeTazqX12oxB+MUF6EudEtGynVS4dKk=;
        b=NYYuSDzL7Z4yhQMGbYHJbA3M7FLCKiLMC9Z8840l9CXSggKf2NIeVv3zT0h5nZo8W9
         2bq8AVCFoRuHrS3PsWUHirdL/hIfzwuWHHtwNgKAzneWo1bAeYyOe2mX7+B9IhhZt5s6
         AnDB58A2fJ1sGFhd6Jrh7PS6HCwgMnYLuuoPnftH1n1BQ55BrD8GvsPoJMOPD/LVgzRs
         C9mfLibQ74iOYy5by78gDpgZ+7OG2JZ2v0hvuhEf8RIEkGB2KeqrGJpjcIfs6DFjzEyn
         NzoflTP5bwqVObKuwen0lXhj2KJQVjjRvqkIEcNuUb+kIuIOsuuTxrMgT3YGsudTixWx
         s8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949362; x=1768554162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2SLt+ibhBFeKeTazqX12oxB+MUF6EudEtGynVS4dKk=;
        b=AfpmMg9Prntla7gg4zqzIcvDifyGd2qdL/8UGZmXVUoKqaJx6rjrYvN+u8yuOzaDBa
         4V/qUu8ReJdzLjfhBK35/IA9c/zxyAzx49BAffXGYAlyq7BP0wDTMDRUsL1Z9WysyJlM
         GMn+i6X2h72M23M2xba+umNAo3vsotMZHdt9VHqrPemNWJzrgT2wo1/QHAV4VlVmygtJ
         RiPj/dR7VWdItJWIkAQgVE68Ygu5Hn0U77gU1JYJ5aAlIrjuZn0ZKqSQh7EuRSekdl2N
         3mRD9H+lTBE0nuLYIAdFV+hBesxhnot3YdxY5CUlWfgHVHaX+CslB+UO7Anw+p+MmEOR
         KoNQ==
X-Gm-Message-State: AOJu0YwWQ2dD+qgktXj0VnuhvsQQhH4qTajtcW0IAxPOFygazObkCkNn
	UdgQ+rI6/g9X6kyH6bPkRP6dC3G9WgG9sLglf2gyOhROSsn/7tVIBNjF57dErdVyB5EIkyESIbL
	9klXASxBmYfxcUg3IfOsWVgkRiOYA8WupzfonDqoMeFACGjj5k5nqi5/y7v+pSUhCv+KI3qcLxP
	Rrk6s=
X-Gm-Gg: AY/fxX716+BXctJLp+F5FhXTedVkeDer+tK5sRp9uh2/3RfL5HCjXFoIoCypZ0IvLJq
	yMkaJZrpjdESjvJXPSnoATgsjb1yVNTljC/082SjhC0O7Kgsfilp5nwLhxG9f7Cj+YzQwHJPMQf
	dFs/dZRmK8ejqQaTEj6KrYlDXzUqjYlgXLYdOR1WapTt2xUs7hjsKPbeXBWZ5QwPQK1mVkGEI2U
	5QHRpO9xnpXMEBYbI657+nJ0PJ9olL4hMbO0HSAMdIwxaYpdAysRKihQsrBG4cUrlKyCCPrxOUO
	7jWh9+yRVrODw4cR8Q/ssT019Tf0uhFQE9ruLWcCY2Z0zFfyqzl0JP2Lljc2y02dKnDa9DpxCK/
	Rx+2ysMC/Zd6FC95JD59/NEAUKSOKAgAbhE5poLSU+VwxME/nrCYA8aL0xpRd1W18kg2EDvrxEK
	OCr6y15PlMG5Sv93QjrsmcnqgzG7VQx9Vb6A==
X-Received: by 2002:a05:6a00:299a:b0:817:9a85:549f with SMTP id d2e1a72fcca58-81b7d850288mr9071293b3a.20.1767949361932;
        Fri, 09 Jan 2026 01:02:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIp5ZpFALhNPNu+WcxBmPwkXjHrQyIuUsng8/3QgDICBnsVVjJqmXuPHr0vGK3StfS35fRmA==
X-Received: by 2002:a05:6a00:299a:b0:817:9a85:549f with SMTP id d2e1a72fcca58-81b7d850288mr9071263b3a.20.1767949361442;
        Fri, 09 Jan 2026 01:02:41 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:02:40 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 02/10] riscv: Define arch_apei_get_mem_attribute for RISC-V
Date: Fri,  9 Jan 2026 14:32:16 +0530
Message-ID: <20260109090224.3105465-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=GN8F0+NK c=1 sm=1 tr=0 ts=6960c432 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=I3DjZvlWSiOXn3_7CcgA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: UHBkPMnQZ4b-ZwNj39s-B3PeFhKGEEDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfXzSBTm8+0lUHV
 5rQx4pg+a/asuzP4IipBondt1a5T7ImvmBNQMNbpOiA08ciE5pEBTXNW/WfnTX2LkT9zOpq7UUc
 n+OVkBthur1MIzp8j244AWMKd2zomKiHTTj/7uXoqvV4OP+AlB8qtTx8bgxcm8kTf17qb84QZJX
 Pvs1wBZY5NQYdcn93qpczDKng9YkPlyZ6afGNxc2eg3Rg97pmWpFGAt88c+sV1+RhC9450pn/dv
 zUrEv0kD8AR0qRRqWuvV6aTcEQuSdlZlvVHCdvaVNjmd0Bt5zjuFhtnBKN5WlNMb+nlYcAuh6nj
 Zmweq2AGcUcDDlgIVKn/xPjB03JXV7r73gNS3iuNzCfL3K6FGRApRLF1JaA5q1tG2dJ1YvNkMkz
 fn9EGiUOqk+3mXGDuPkFjAd4/9ZFml0RKEyy0r11rBs7OsKUpapGE9QrgEuQn33hlYZX2KbztwO
 MaVQw8Gussnox+rErcA==
X-Proofpoint-ORIG-GUID: UHBkPMnQZ4b-ZwNj39s-B3PeFhKGEEDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010243_275942_D08C013E 
X-CRM114-Status: GOOD (  12.58  )
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
 arch/riscv/include/asm/acpi.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 6e13695120bc..0c599452ef48 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -27,6 +27,26 @@ extern int acpi_disabled;
 extern int acpi_noirq;
 extern int acpi_pci_disabled;
 
+#ifdef	CONFIG_ACPI_APEI
+/*
+ * acpi_disable_cmcff is used in drivers/acpi/apei/hest.c for disabling
+ * IA-32 Architecture Corrected Machine Check (CMC) Firmware-First mode
+ * with a kernel command line parameter "acpi=nocmcoff". But we don't
+ * have this IA-32 specific feature on ARM64, this definition is only
+ * for compatibility.
+ */
+#define acpi_disable_cmcff 1
+static inline pgprot_t arch_apei_get_mem_attribute(phys_addr_t addr)
+{
+	/*
+	 * Until we have a way to look for EFI memory attributes.
+	 */
+	return PAGE_KERNEL;
+}
+#else /* CONFIG_ACPI_APEI */
+#define acpi_disable_cmcff 0
+#endif /* !CONFIG_ACPI_APEI */
+
 static inline void disable_acpi(void)
 {
 	acpi_disabled = 1;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
