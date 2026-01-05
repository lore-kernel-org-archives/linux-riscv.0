Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B066C79F8A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 12:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHlxlemIGjUllCbWnhh4SRT7v9XPB6KWoY7zqXNUHHg=; b=p5WARg9yOurPNf
	zzA6VBH9pwheFGju3ve7EemBhXIT+Xaz8pppYalifzbaQiFdlx5BEDCDei0T6QTLC8Tp9O/dMKIXi
	FbstGPonuept1zZQFPTsLNat/WOYMiyuJWCvgIssbFXcNga0de7bWxCIcVIYFMqPktkSX0fD2qjmO
	pPVP5Pi8gH+QUvEn8wi8WL2BATqqsNLzmYZdV9ZuUwTMsoGw4zZQr5fJAW4JBkoKnk0ZZ0Hg+5OXH
	pHYmMxk8CBX8kutJ5jsZLzaNPCC7V9ca8jyro64u5OdhtF18iuG0Ixhz940ywkYIYTZwDHaXT9AFO
	WGEOMsK552OuJVFbGubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjhB-0000000BHKv-1yRI;
	Mon, 05 Jan 2026 12:28:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjh8-0000000BHIN-0OLn
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 12:28:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605851iO978645
	for <linux-riscv@lists.infradead.org>; Mon, 5 Jan 2026 12:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBFYHO0C6Kk6N+QrFXXXFlcKOp9qo98Yeql0J+xKQe0=; b=eBI69wSI/osXsl7O
	qRyjkGuMysg9O8lz8xtVuXcwubY6v2F+C0GRWT/5z+rQWNGoubCdc5CbZO5V3A78
	oJY2G9setfBVLvNV0mif9MQoSJohxQ5sKNax5Vc0kTxtLL0IM+/ASxpaw35NtVSI
	WcDZA9xEQDSjgTiGZTQvxB+/JEeLykLrybV/mJzd7XHo4MHsJ8dh421HL6uJmSy0
	uYSi9CQT4XiUJV+8MGK5sPAXV9pONYMVWIYC81S8NQVLBBVrDFSUYe4NSsJCCOwz
	nbMe2tWAePT4ihOqcDDRF2C2dOGKL8LV4EEKEMxbd6eazd9rQpJvwjHXrArs5kx5
	hvuG7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg9ftgr3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 12:28:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2381ea85so310360785ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 04:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767616100; x=1768220900; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBFYHO0C6Kk6N+QrFXXXFlcKOp9qo98Yeql0J+xKQe0=;
        b=XHKUYffxVCxt0R1rt36o4IO9VHH6YcZhAGBlcHixGoyUbOJql1/1k18vuJoBCXTQiy
         rpsQbWKSXGaAsqqI/FJuTevNO1V6vCUaael7l9Hh3aqsNAvyq1wl+0Wm/nkuI043MArU
         9sC5iEaktoNP6XolM35qrQjW3Uc/X8LHU3xQyvN6dQqbj17gifX8O3sFqmaOMrRyMvrt
         KZOWMk0ScksKUAwWsdX9gfoqZFXNdrnpqi5Yqn1nRborSUs1kK+2rYkl4m/a2qEJrth6
         SwXc9bVnoNrqvV54M/iEyXXNQgMt9L+Ow9c7zPtlTgyJlwxYdTnN1kI0N+PjYrxRPx6R
         5kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616100; x=1768220900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBFYHO0C6Kk6N+QrFXXXFlcKOp9qo98Yeql0J+xKQe0=;
        b=Mg65hSDsyNbkhi5edmhOkRW6iSs6Wdc5lqA7mBASideFda/HzJF+lYZP9hv+7+YOlK
         xGCgcwMdVG6emdnk3sT63lVeQFTL2FYDM/ZLtEgSxLsYAIP6x859WvdlwSsS/G3o7X45
         VRRf4Zo7H+5gyqE4M7RCRQ9r5C66i8OqhZIaFmpsJk2UzoivNzzq8tUHg+UKDwiF0Uuc
         Yt5ZARqOYPe5sJpIo4ev7W3oisngOnwI+t3zle1rJAua8XV2J2jVBZCsBZK4WNCQm9Im
         jMiVn+GlMCYCp+qJIAPl1O4wR4EVlVM/shNtPM2t8VxbR8CsJc2emdiV3suYwpamwymk
         R1dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtOpsz9NOJr0A1WQZaXZPpGett0VvC4egteY1ADFOgOYfzdltmoZcyS2RVZeWl+hyQZNJUApWpgmu5Vw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlTVIlJ+iq7dkVi/y0rtVucZqBqemY44s8xLX4wCRA3d4R9jLq
	vx7C8Vp28V48fCt8G+sV3zM69qSTHZK21QVJdsJOg1i3ifHRweftoZQwXf9cKx2UhoKNrSBV8EQ
	IBxwEZ6FFEiZ5N5GpBnMFthj0L/NlBxA890m14UvylfsTHf4xGVoqNsjyaM3SGSReiWXgMDs=
X-Gm-Gg: AY/fxX6HhGAko07xMpp2ODOXSgJeVMTZ6IkxwaUvxvRT8kjHLRjSv94H7wB2d9pgeUL
	SY6ApdLQGhHLJtfXzpzQHjP/h2BaX08fUjqsG6OZLJW1k8gw/fFAx21d6jtLP7LhW2wxmuZexjM
	T/S4euxD1eue5rgQBIQROUaKLjuuRnwl6fBrO5h05FnkVcZcVLZg3q5wX1Mp2NqWuCZJZEdRm4H
	HwhkL9axd6o93tJmcVdsw49PEydtvdR8Yydpq/Vssebhh5HAAoA4+Ask23v4wMIgq/EvKP9aNER
	oFeHo4ITIfL5l2r/dDDycDs0VVdoWLB1HjhNLxJM+ZKOou9cGjsvTZQvoOFrLbK36mHX0vvffDe
	tjEtd5ndES6uJPL3k0kdV2ODVrXlp8tdIfN8=
X-Received: by 2002:a17:903:2f82:b0:2a2:f2e6:cc54 with SMTP id d9443c01a7336-2a2f2e6cc7bmr512249595ad.4.1767616099593;
        Mon, 05 Jan 2026 04:28:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0UKyUvXerMX21bnjBAhF6AG6XXCayaIe7tQngiVFg2WkvJ67HwAbgKGU99xM74jozlgyeNA==
X-Received: by 2002:a17:903:2f82:b0:2a2:f2e6:cc54 with SMTP id d9443c01a7336-2a2f2e6cc7bmr512249235ad.4.1767616098933;
        Mon, 05 Jan 2026 04:28:18 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a10sm448109275ad.26.2026.01.05.04.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:28:18 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 17:57:54 +0530
Subject: [PATCH 1/2] PCI: API changes for multi-port controller support
MIME-Version: 1.0
Message-Id: <20260105-dt-parser-v1-1-b11c63cb5e2c@oss.qualcomm.com>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
In-Reply-To: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Chuanhua Lei <lchuanhua@maxlinear.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767616078; l=3103;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=PpB/m1gJTMQMTX0vFxuSFv/chuv/UflEufPn0M3zptk=;
 b=GZFtZaD7jCyIpCFrp+hdjsax21pknJcBxL8vAxnhFDnfZj47lMwrBRAT21E3qZGvMjJkEW8ux
 BqW2LAmuAn6Bin1Gz5N2VInqCcnD4NPJG2jM/9hN2ngl6jFso9HAv9x
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: YOybHO1ocptIEBsXNa2qf6cc74s6I8zm
X-Authority-Analysis: v=2.4 cv=GboaXAXL c=1 sm=1 tr=0 ts=695bae64 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ujblt7VnwxmsJrSXvRcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YOybHO1ocptIEBsXNa2qf6cc74s6I8zm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfXyQLys5zqRh6I
 vF9Dqy6hOiJ6rbaXR86jWVEvnvr1Y1i9r5TX8wo181PmH2j0EIsAk6dVxWS+bu/EyFnftFAp3/U
 UfWtnykgOR6UvQRmCVVXzPN0LCxIC/C81GJ2ap5daA9m7aD6AOCZDug8WpMp9kRzefmkOlzqcej
 x8kP/rEvI2hcbD+LBlhRu0dxNm2agI1oHdDJmFJhXgUvIhM2P4X6XNF+mqr9mIaUk0s27+aEN8e
 OqaCPMHqY4O7cgusd68xAy+qwsvgsZ4hsDELoryvXJRHmemIw/hY55jT46zeed5+o30z2J9HNdh
 sDdpxcJHObGEaMeToDmhKS4xL6YCJrxCkQB48JORxpAHiU2Kd2xosKMcIA+o7TjTXhh4aozayvY
 qZXAeYKf2VWUWGzDnZiTVpd2hThlpzS5jhFShxuTSmJcIRXSZQUEuB30sWSD3yxcH41xBlNCq/t
 AKh6CXzxxvYdabb8QBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_042822_644188_875D6968 
X-CRM114-Status: GOOD (  16.01  )
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

For multi-port controllers, equalization preset properties should be
specified in individual root port nodes rather than the controller node,
allowing each port to have its own configuration.

Change of_pci_get_equalization_presets() to accept a device_node pointer.
This allows parsing equalization presets from any device tree node,
which is needed for multi-port PCIe controllers.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/pci/of.c  | 6 ++++--
 drivers/pci/pci.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 3579265f119845637e163d9051437c89662762f8..d09eff40b523c920c9ca3eaa64f784765b3c5bf8 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -971,6 +971,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
  * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
  *
  * @dev: Device containing the properties.
+ * @node: Device tree node containing the properties.
  * @presets: Pointer to store the parsed data.
  * @num_lanes: Maximum number of lanes supported.
  *
@@ -981,6 +982,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
  * errno otherwise.
  */
 int of_pci_get_equalization_presets(struct device *dev,
+				    struct device_node *node,
 				    struct pci_eq_presets *presets,
 				    int num_lanes)
 {
@@ -988,7 +990,7 @@ int of_pci_get_equalization_presets(struct device *dev,
 	int ret;
 
 	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
-	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
+	ret = of_property_read_u16_array(node, "eq-presets-8gts",
 					 presets->eq_presets_8gts, num_lanes);
 	if (ret && ret != -EINVAL) {
 		dev_err(dev, "Error reading eq-presets-8gts: %d\n", ret);
@@ -998,7 +1000,7 @@ int of_pci_get_equalization_presets(struct device *dev,
 	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++) {
 		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
 		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
-		ret = of_property_read_u8_array(dev->of_node, name,
+		ret = of_property_read_u8_array(node, name,
 						presets->eq_presets_Ngts[i],
 						num_lanes);
 		if (ret && ret != -EINVAL) {
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 34f65d69662e9f61f0c489ec58de2ce17d21c0c6..72fa6db95b8a75f6e69b8019d1eb2262b6a46c13 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -965,6 +965,7 @@ void pci_release_bus_of_node(struct pci_bus *bus);
 int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
 bool of_pci_supply_present(struct device_node *np);
 int of_pci_get_equalization_presets(struct device *dev,
+				    struct device_node *node,
 				    struct pci_eq_presets *presets,
 				    int num_lanes);
 #else
@@ -1013,6 +1014,7 @@ static inline bool of_pci_supply_present(struct device_node *np)
 }
 
 static inline int of_pci_get_equalization_presets(struct device *dev,
+						  struct device_node *node,
 						  struct pci_eq_presets *presets,
 						  int num_lanes)
 {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
