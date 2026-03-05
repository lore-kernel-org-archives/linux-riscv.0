Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C4DEEF30A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 06:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MyvYRQC2ZOLdMSasBxI7G13y8KvhmAeLDNZ79uqKSs=; b=n21dNdn18Why2N
	glK/3MAxqTCKrRYmmzpHqi9q9BAy9NM8SqQA80X6BNVQJ4TqxB6B5Mdz8E/Sy07Ew/6EKZcTbCvpH
	c5/gFLp+kozydjlX9/Ed1XYy3mXl+DjdabhNYsFWYJ9GqjlUjVaxzXq1Tl1QsjDnyLyaSXmWQ9OqW
	LrjAilrqtKIksQHg248rm3d6lMJdCBjAFuMx2boUgrz8SNmFxf6VYw9CEmT1y2XKm2ZCw6ATdKiOZ
	HIBNp8nz0E7HLn0jZI706ZRaQv55B60GoADWlfGib5fREu3qfpq2VJchgkQdXD72MbTzHVdSgkiTv
	tpodFIyGE8pZNbgGHNHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy24v-00000000zoD-0wNb;
	Thu, 05 Mar 2026 06:20:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy24s-00000000zn8-0Frv
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 06:20:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BkA4628695
	for <linux-riscv@lists.infradead.org>; Thu, 5 Mar 2026 06:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zvXOPXCbQlaXN8adhJ+Ra5
	kF6Tz5uWjU0aflLiqlQuE=; b=AD5xkbI9PgWUA3qQDSOVYh7+ftEHbxze0S45yF
	v+S+cN46Y+BxytsEZczdxVlWr9L/TsdO4+K/vepzinK0cJAPVrHTVN+S8+YuuQdy
	WTEjkVaAuUpLBbWaTMPOUTJhtwt6R/d5oSDp+Cn+FGw3Zm/gg6cJ0dPqxmgfoqdT
	Jb8aZGJOCkIcTwZuZmmYEzqGb0Y1H7kdK6zbfMGixNnmKYafidNyygRJFWlusOzF
	IUTMHH7XBf0IN6wGRgYXnk9vurPMi8/KV3m1bcsXDxEHG70a9m5AvOQHroZGinxB
	swa3Veeq9QbfhGe/0AYUzFVE6WFjJ1IBZpSJ/gZIuywdh1dA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m22g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 06:20:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so8720908a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 22:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691652; x=1773296452; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zvXOPXCbQlaXN8adhJ+Ra5kF6Tz5uWjU0aflLiqlQuE=;
        b=bWY4Oup4aQUeHsDsso9xBkn1a8ZmXbVqIX89MH193QAw9k69fV9m/e7MQ4U3MxQ5Ke
         zjZsKFuqCSBCSUOWS3bF8mUXspasmij/fC7wivJWZrc8/DRIhrhvQdztasFTN/zEsW1l
         1GMi73VMH4ZTW7dcH7k6coJOGHoF2uScN3FK5w9RhlCDRLR5/4gIgd3YygUlAVjY0FoK
         aK17GPtljMhauJUHjirJRqJ86v+OgtU+8b2x60005OpibW4LxtQITPFPdoiWsmXkz7mn
         SoKeurFuWXIe8yR1Fc30rWBr83mBWGTNDVs7U85axzoULTG3q93v1kbqR3pDxscLJjuR
         50eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691652; x=1773296452;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvXOPXCbQlaXN8adhJ+Ra5kF6Tz5uWjU0aflLiqlQuE=;
        b=dndpRGuV/yDlDzB2wz+UhgH67nmBwp25eOBCcHXBmtr+SZgXfNq/eYzG2q/DBM3PPr
         R3rxOOPAxN557hvhpMzhRL7E00iNLu6bFrqROuhNFuvz8wc8IY/xbP+9odtS6QSXpATr
         J//E7truNZk7L4IKzotqgyJOIqDS1RYwwqhwjx/kHd4J+2HQagouDA3BtcvpIPhEE38J
         C1UTOYgyeTL/TbQckVIkx7BWsDjjhoF84rglOw10kk7P45LH31WLPlbajVN2wUWWCVcV
         9b69S1pwrjePK+FoOQLE3XwphvP+4HjMJW+aWUVklpoSb1eANgi6WJKZHRBvTDjTMEgh
         XA9g==
X-Forwarded-Encrypted: i=1; AJvYcCU1YnQulupyiR7f6iTJ3dZI6tcjEdWXjZpvDU6OpSdvj5FaSIG5rvGLCx4ipNd0wX3q0EmGFTD71reO8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7JRXK7OasUjms6zxoA3Cyk+jN0dzgEjPqaTO7U5oA0keVCMoX
	kRuVeSIuUbtq2J5Nk/apw4IwB7s6iugqIQigLBpzu0p/VB6PN4yPDQErTvwD8m8wPSBvsyJCkmi
	/z5eeH5uoye2NjvZrXmr84NKIKE+RDzIuFquDSEAEkS2KHKJfwy4mKkVbxL1Mv69T9h/UlUY=
X-Gm-Gg: ATEYQzyP+IQJ7hN8QkBD0OtC2pghlv3D7lVvnWy5h4rdx5tIbMnRLKlnaasWl/3lcJY
	bY30vc80W//JBzVVvfWBaMs/Giozlbap6f+wCzFVIaRG5R/Unhm+N8jk1mB57Atr/+NlXVffU6+
	TlJbQMh2EzO0aNz/G6s43al2rRRLeAZQgxmnasl3yK9dtaQIJLHye0v+gFLbiFA3UuR3MJCR0O8
	4GLfeLCwPZZ4R96KGWsIYORrQ2KyO31qWtHcgZTYiE1iyP6bfg+RkdgpmO8c/Cns5cXzP97J3bW
	YhzN8N0L0WuGYSjQqZBQhluntw2fvsqHR6H5G6fI2h+Us3xg1RHoegGwkfCfCKQPoO7hFS1N5Vl
	WPNQ8oKa3GM1CqB2yG4kV4nXUpIrSXmZRqcEJKee9z9HKmOM=
X-Received: by 2002:a17:90a:c107:b0:359:84a3:1942 with SMTP id 98e67ed59e1d1-359b1c31203mr1234066a91.13.1772691652238;
        Wed, 04 Mar 2026 22:20:52 -0800 (PST)
X-Received: by 2002:a17:90a:c107:b0:359:84a3:1942 with SMTP id 98e67ed59e1d1-359b1c31203mr1234022a91.13.1772691651634;
        Wed, 04 Mar 2026 22:20:51 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d38ab8sm843378a91.1.2026.03.04.22.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:20:51 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
Date: Thu, 05 Mar 2026 11:50:35 +0530
Message-Id: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALMgqWkC/32OQU7DMBBFr1J5jSvP2GPirrgHYmFPJtQSbUpcI
 lCVu+OUBSFQNpa+Ne/9f1FFhixF7TYXNciYS+6PNeDdRvE+Hp9F57ZmhQYJDBjdnvUpDpXSoUl
 kWKDpGFS9Pw3S5fer6/Gp5n0u5374uKpHmH+/LABuYRlBG91YpNZyB/dJHvpStq9v8YX7w2Fbn
 9ldQV/bcQ0y+RhicIlc9x9IazABsLecSJB/g/P8Eb8n489mnJud55iErEC6IbBLgV0KbBXYltA
 SExL5W9NnMKxBR0QSvJPQ/DV9mqZP/33nPNYBAAA=
X-Change-ID: 20251010-dt-parser-98b50ce18fc1
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772691640; l=2442;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=pEc/tNwHOsDbqggAZEgpmAYE5s4SuUbHuqybzx9zRvo=;
 b=t+bdKd9rpg456k4BQVhND8q7IgX2Q/VxxdegM8QDbAtfYkujEJcMPuMBnFidboo8oaraGHI+l
 fGr4D6tEANDBwAWNqyzdV633zxWT7xdh5IMhQ6/B5lDsMAcYO7jFdNS
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a920c4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s_SlZju52n3xP1ZgpLgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: vUuvhmpXdADVXx5E-JUwqfBO-rr_IAue
X-Proofpoint-GUID: vUuvhmpXdADVXx5E-JUwqfBO-rr_IAue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NyBTYWx0ZWRfX1/iF/QN3Ruao
 tYedSp6GgKuikeBrzAtHBBDwFa0Uk9KHtoHax/3S/LqsvaKu6VZPbKT7d0Jhr8EHlyHDT7jYS9O
 Gq7CroFll0y+k+hHpY39w68/18JFcaEA6f+zxvFLZxGgb/F72VF42xmPqMndKlp71I5UrREM40r
 EEWLuPgFE3JN2geDBwGs1r7942qGuCQG38JzQPxHAcEgfqXDNQDz6/nMhQcw4rEvZhXdGrxSHtk
 hYfMXwUynchGv8flkqS/iRe25vVQwOEWviR9ZMLyp0Ak0Hb9+ZclvWOLdjhkIDBilVhrmH9n6LS
 YGkKR6mk+g3nf7HejOFOiU+YB9vPQPxsBAwvDoCpgwbsH3d08sKv9Lt7zm+Yw+mW/MRNDVDcVts
 W2J8db2Tz6FBMzXK3plCg1fYwG+kxd6qYFAGJTPckRRXbWM3qR4zUHN9tYmm9ioSGGFjK4W8Ybe
 reuGOfKjIOVjtp5tWtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_222054_103566_B97975E5 
X-CRM114-Status: GOOD (  15.68  )
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

This series adds support for multi-port PCIe controllers in the DesignWare
driver. Currently, the driver only supports a single Root Port with
controller-level properties, which doesn't work for multi-port controllers
where each port may have different configurations.

This series introduces a per-port structure and parsing API that allows 
each Root Port to be configured independently via pcie@N child nodes in
device tree, while maintaining backward compatibility with existing 
single-port bindings.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v2:
- Fix error code preservation in dw_pcie_resume_noirq() to return actual
  error from dw_pcie_wait_for_link() instead of hardcoded -ETIMEDOUT (Mani).
- Initialize ret variable to -ENOENT in dw_pcie_parse_root_ports() (Mani).
- dw_pcie_host_init(): Remove -ENOENT error skipping to make parsing
  failures fatal for now, add TODO comment about making properties
  optional later (Mani).
- Link to v1: https://lore.kernel.org/r/20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com

---
Sumit Kumar (2):
      PCI: API changes for multi-port controller support
      PCI: dwc: Add multi-port controller support

 drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
 drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
 drivers/pci/controller/dwc/pci-meson.c            |   1 -
 drivers/pci/controller/dwc/pcie-designware-host.c | 175 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c      |  32 ++--
 drivers/pci/controller/dwc/pcie-designware.h      |  17 ++-
 drivers/pci/controller/dwc/pcie-fu740.c           |   6 +-
 drivers/pci/controller/dwc/pcie-intel-gw.c        |  13 +-
 drivers/pci/controller/dwc/pcie-qcom-common.c     |   5 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
 drivers/pci/controller/dwc/pcie-qcom.c            |   4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  13 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c       |   5 +-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   4 +-
 drivers/pci/of.c                                  |   6 +-
 drivers/pci/pci.h                                 |   2 +
 16 files changed, 232 insertions(+), 74 deletions(-)
---
base-commit: 097a6c336d0080725c626fda118ecfec448acd0f
change-id: 20251010-dt-parser-98b50ce18fc1

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
