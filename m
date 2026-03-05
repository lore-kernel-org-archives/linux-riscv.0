Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13174EEF30C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 06:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQhw9H8JiXRDJ+GsAajuBRJWYZQ9OOt9OpAum/Dyzb8=; b=UR0My0V6jNZAMV
	7vFsTC24wue0/xYP5bBYuktmQb8epi7YLKcJPHw6u10XVoFDEKaqLSdnaRbffZHDS3q10zUrV3Xh7
	sM1sweP1I+Z9h65BoU9isSzSqs2y43F6nsrte2TwIPcA6pha57rMuy3dMTzUe6lOOSFeCflPuQxr+
	tyuRlCS6weSXDxInbjsVv1V20wQPjam5eioj1jCoiZct6yrgBC9w0b/nYR4OlAif7za1p62FLdEXE
	fFgl0QCOPJ46z9+mAyLrfwf1+gvyEOSwED/ZRSJS9YpxSYvQXHXNtDTTSM/0uzacaZlwUnT/s7jIH
	XikBU6OhpRNezENi36OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy255-00000000zs9-1t07;
	Thu, 05 Mar 2026 06:21:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy252-00000000zqL-2S65
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 06:21:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BWKq2665096
	for <linux-riscv@lists.infradead.org>; Thu, 5 Mar 2026 06:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgaCGe2HP5UpbVXKB+EsAI8njddCU+iXqu2dkviOtjA=; b=ju9HgQ8QDLzph2X2
	xcDGeWw8SDOnOkvNNbt49XN4ZK+XhDud5SLcq0Ghl1tvktnW2BjVxoexEvKd3IQg
	QDZZ8u0G2DkHpJ5Uck7sp2jum/GBWLKHCaigUwZ003HZm1LismPGqN1kyiGdphzd
	cQxtKl3qS39B+ozKyzA+57WMI4NcvDONPwoguFukPRUOEHrsuBaC8BHxGSXaOWY+
	E+Y3H/bDoKGtm/uPPpMmUw9NIox+WUwghBOxxcLzwOoSPeZeuQFD5nN2daV3jl6q
	nM8T2ttith7sadvyGNney6CIhS3wwj2SoMler+1/clVjqTX8YwYWXqEXmnlGHfxP
	G41tfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb1gfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 06:21:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358f058973fso7324677a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 22:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691663; x=1773296463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgaCGe2HP5UpbVXKB+EsAI8njddCU+iXqu2dkviOtjA=;
        b=MTwXBHF63cyQEZ3ldv7g4PpsD7HQIR2tQZYPupCb0Z9cBkVrxLr3vbq2u4X2xTAqOp
         luaj1uIIuapGHPfn4dV6XKT3VpcOgSYIMn9lEiTyr67ZrVABvsb86qQsk4PmjeFh2bAH
         73jXjRwcpvI9Ka8lB310tvsJgjsZ7KQk0uTDAeU+mMF3qpCinw7QG1giERY0qelshLI2
         OF4uO5XZbdsCrloVp64YhdonB7JL4oQuekyFVsbDKgwfxqwu31Eikjwx1Q3zGji8P+H8
         J65Sj2i7EB4cOSRICewAXuJ+QWRy7fNYnFBXekRSVlVEPdvnb/28sRstK9VdajHCwjaw
         9HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691663; x=1773296463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgaCGe2HP5UpbVXKB+EsAI8njddCU+iXqu2dkviOtjA=;
        b=WWZtDwQNqhXVdxNGMA+swBLAqExQWW1OuWxyZE2CBOhtG+4BAdH/9IT2MNA8/eCo6l
         Dxk7Xv2CmrWL/hxeMubA06NWdxXsBYDvyTjrc2s68K+iGrG6KF8B8eOe3HRf3Z83D9iM
         BGH4uBBG85uO9gupz0q2VbSVbj78QqBFSDDz+1q+1eXYmv6fanjWIjjp4VcXT30jTXrC
         PGDzMdJ1mKICLOwvkHx6HbyDUzTHOniEZSKpOL4Lyg/WnVsAzagDXaxoHBzXoC67zvk2
         oU7DSD0Wdacqp0p+aRSUSL+dweHvqrWZYZO8+Jdj8Oxl0jLkC2Pe+/Pxedsyrau8YXtR
         M5PA==
X-Forwarded-Encrypted: i=1; AJvYcCUZT/ak7Ooomu8oSBv+IOO5bTOS2bw0IwtHJtJYUqDDE0eD0fIP9r+ytteCcZ8TuzM+umMuqLVuxhZS0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXUQ1bJ5eMEBKQ1//u3WxZidFi1dkZTKUeL1uSfnpjIil1+gnQ
	G9bU4GnP3Obkk5O/vgGLxq9cESKgsenRM4Zg0pLr1MztmZmMlR/72N43yRk660GM1v/K6EDEXcf
	XjzDZmOLKqiJ4OdmJb1JYFbSmatOtyqTJX0FnZsr+Uru5MHQY6vjIA07dKlUVd0Zq/aRI8Yc=
X-Gm-Gg: ATEYQzyfdv2zNBLmlx5v+htc9/cNgMtGWSwiFgDpTX/uzZHPNUD5+HO6pzSnGn/dQL+
	dYDLfdsYgeHpamuqrIzImiXs3jYDkUUN2jdS7Qfox+YLCGKQ/r5TCNbNE8cejGGxOYMp9CoYbHV
	ONGubaQcA8oDHBd4otmLlGflWdIJNFjnh1eW1NMb/6muKusSZqZ6OKws17orTxR1ErHQBw8InLt
	bGfwMp61DG7vX/+sLpGe/asEHyxiVGT/cDLop8ZHxA3gatAjMxdxze+RbPDzUKnyD2l7NLEr+VQ
	2nqfp7q2F+8FHjiw3DH+M7CAdzKnmQvgbwKfFG3nXdoltNZutSfOF6XCjGvg53d1JayasFxpiFv
	pzXWF2kqGdcZYszjTxoRfEf/ktomUJvtX70wqxZEBmyGO0xg=
X-Received: by 2002:a17:90b:5386:b0:354:bfb7:db13 with SMTP id 98e67ed59e1d1-359a6a922b5mr4188012a91.35.1772691663113;
        Wed, 04 Mar 2026 22:21:03 -0800 (PST)
X-Received: by 2002:a17:90b:5386:b0:354:bfb7:db13 with SMTP id 98e67ed59e1d1-359a6a922b5mr4187982a91.35.1772691662515;
        Wed, 04 Mar 2026 22:21:02 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d38ab8sm843378a91.1.2026.03.04.22.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:21:02 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 11:50:36 +0530
Subject: [PATCH v2 1/2] PCI: API changes for multi-port controller support
MIME-Version: 1.0
Message-Id: <20260305-dt-parser-v2-1-85836db8dc06@oss.qualcomm.com>
References: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
In-Reply-To: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772691640; l=3103;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=+S/OPWfD8jiRnySHXDwKPl0Gx38XUkXnA2tMQyqcytY=;
 b=TK72jjuJyknXwVLrSUwewEGuy6eruyMEMLoyVD7ZdXByX5WQ08ffPNtXIK0+Zxd2Jj9MJeA9E
 OHWFPph2BbeAOAPQu90/A9/51gkVzesqs0Q6tFz6anwYgEZlA0RRnh3
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NyBTYWx0ZWRfXwrUwIVEB5f0z
 fhkqccHE4b7kV3OUHH3Fv1wDwUXnPu1H7TSHYfo4g8m15uuviEn0KIBV8nPdSoVetqH9WdELxBS
 AGxaTD6TvuSxfXTWQB/Umn1Wbla0u3TyHK67uW2oYuxSXKar0vWrsgcTIXh6FLEvRlrhvhttimX
 OYDMFLYaW62zyZ6pQJWAbXQna2Fes09lraZECnj0gACLM7rhLpFLx+3ejmqF98q1lTjQIxPX8Rf
 MuvbwPJQuLinuIFYYZ1wN9F0aRjcLBPbWrEfKPCFiayM33wBMg6ZaYFbqKKcRlY3xl80EOEHens
 Ftfc3MGsFFi5BRMkvjQKt16XjBtA/XO1KfUCIT9Cj3dhUqwaPd9/oTOU9I8YAutY4jp16VGfigw
 21W1929Id12K/h3ymE1dcIHrl4Wh0VdAZqNGoyNgQXgvF1j1eDii6VMeX/PwGfXv6P1WGjAtlte
 Q0/O3qlY8spCtoXa3nQ==
X-Proofpoint-GUID: VLlVfeFSGqldJ5OwpgAY4hpYJl7lbJFY
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a920cf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ujblt7VnwxmsJrSXvRcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: VLlVfeFSGqldJ5OwpgAY4hpYJl7lbJFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_222104_622952_2D0E5952 
X-CRM114-Status: GOOD (  16.78  )
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
specified in individual Root Port nodes rather than the controller node,
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
