Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0F2C79F8B
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 12:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=akhPo73tt2aojNiVMprPTrDLaJBC7qgoErSKzztD7+Q=; b=aHD0pIzIe1Gxxw
	6atgWR1YtZ4u7XLn10hVL3WPQj5Zpgq2i3dQSUf9aav7vrtzZ5fjro2eJbz6NGkWem4yOmUC+Y+i9
	2hl6b0HVHfJoMtV94EnvbSExZiCkT/MHpMTqj5kz7/P5CkLCkbv1RZTWq+SK9lZmGSUmjXpnkBqrg
	cvtYMBYAl3/R12yflkAGXIDgHuT+xwyrXiNN3UwFfGY/ANyHlG4fM6iPhSWvgXoiaSbYLgA0F5hUA
	3/0XYzyjRwTfnRqRR5dqjSN7wNu4cJWHjOWediX8w4idJICpql7wKQTywByZaGckmF3zYtLsL/St8
	Rcer6iNma0B/5CJiRsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjh1-0000000BHGI-44Em;
	Mon, 05 Jan 2026 12:28:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjgy-0000000BHEu-2fSH
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 12:28:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058KRo53798532
	for <linux-riscv@lists.infradead.org>; Mon, 5 Jan 2026 12:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FhnBgqCd894h4xDDyalypD
	S1B5tbKhHsA76XEw2zZxU=; b=QPZyalOnblB4vaPsgrD/LCt8SvD882UV71zW0z
	XdlhiHYZwBkV7qbOm/nIGDNyp1udmWPc/kfJhuFovga4cXZILGzTRMCrnd9sGi9G
	cqpDsVGpjjO6wUbZIegEEwTOGky17bZME8R++zkstSucabaNjDewwvMyAcy5pSbl
	vP8wXu4nQMBeTHu0GeVH9XN8MO07EqDd4LIN3BbaAnE57IAJE/AtaYt4W8e209IB
	OI53NTZVNBTkoU8Yh6A/xWlqDS+Uu6GUT0AfohJ3Cnyv6jz/4hwF37US6bUh6l9y
	qPFVFC2m5lpT/lmtabxI21tm+4/wuCPim44/h0NY6/1++Ifg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0hx5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 12:28:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a31087af17so315766825ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 04:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767616089; x=1768220889; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhnBgqCd894h4xDDyalypDS1B5tbKhHsA76XEw2zZxU=;
        b=gsdZhsvo+TnGnOWU6E/sZmYhZH/fj2ASLW42hc7p8KBNMMOD+fHpNEr07dc68unQIs
         Tj7rpFYs0OZpGbIH5a8XAbQFD6AtFtpi9vwTJXdp3Ln9KSLeGlacnUnDVzGcAqkhP4IP
         fWS9dZriyHM2WFoe3g2SEsxbZ/lgVvNSaltekwh9heoCtkT0dFUghyFoKunkryVoIkK4
         nmz4QxFV4WeHjtvUOsVtGx8ZvISYfdEb3lBCpkRjRy/fD+2CQhrpYKyax6C7cKD1lhzz
         YAh5SrTEsVdxpUCBn+cpogkXBiSW9aYBXdPiNVlDa7ZpFB3GQPuoUJi1YMl6n+asb0VP
         YmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616089; x=1768220889;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhnBgqCd894h4xDDyalypDS1B5tbKhHsA76XEw2zZxU=;
        b=HE9wbdQym1xD9qEvCHOASePyT/SW2AK9C68dm/lAD5uquYjIDx9gMYp8WhxapfCzGG
         qi4PUyouzN3+r+bf7/+d91qiYBmpCMDu4H1uqmykrzlNzRuXP7PS88bTyXI9INgqSdSC
         jyR2c9GoeSyhAF0fclZ4zoG482enHcphKMU6toHD5oabAh9J+C65iBB/oswXR7uutDzU
         rBZEvIYdMoprnYP9ub1H5ZMkZvDDDf+d35hXIlJP/EG5fKSx8D5bD1iihh93iw8ZXu6i
         uCEMaCbHR6VOBTajfFCkgavUzWfLPh6p9eJzZWJCXO3C1qIFRNzS57N9yufjlVgxxiD0
         b8fw==
X-Forwarded-Encrypted: i=1; AJvYcCWmuX1NJyjiYmKooOD3TvhFBbOonAuCqw0z/uaPy9PQd+Qjp0mPybA72ZFssC8si8u6wmlkl9In27/0lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YylOQU/4XUINy3jDj/Q1wUI0bL+yBXqxrvZ0p2QsllCgva46kA6
	aE7/SVqrF8XfXmFDG8BN64NUAVwvDwXtjEQdnGBXFw9nULr2gMudaQzk/5xdbHDF6WQQn1WbFcR
	ZSJACGsTf+n1vPQASZ8APsaDbXXsPsAuUw1UjpKrbdb2k5FPZKt1JcJ3fucJ5zEA1lJTYApM=
X-Gm-Gg: AY/fxX6Vm2lwOJSw+6iLW4xR257uVMNw+S9qe2/ZQJZuJLVNwvVgMBYtooJaxkg+Xcn
	nhMmsUAPq/Lh4Sp43Re+Cmc0prSa0HLj4aJDoHiLnGntgxuflTkroDb/nRY8l5pk4TWFGNr8J3G
	Lk5VQkskkiTh9KdRH896PkfSbbg7fu7N9DR24xiOTg/rx4tQCUJpcfbeEQ3S8z+5JM3d+y54VN7
	BAsuiu5W2nDXaXnz6bHfSZaZVRyYfrQrssPUu3WKf4ExIQHxkaIh3O7ceAFPOf0YaxoJj6qPlG3
	vN9P+3DREaZ4khtWi4AUtyOJXw7S32r187fm6hJXOWmhRvERAsaZ3hvX+q44G5PGdFvfnePlDIJ
	tLjU1911iRejdjsRLDSVeKo6Xu3vWzb88igk=
X-Received: by 2002:a17:902:e5ca:b0:29e:bf7b:7f36 with SMTP id d9443c01a7336-2a2f2a41a08mr391760935ad.58.1767616089407;
        Mon, 05 Jan 2026 04:28:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IET+z4gvln2AUwlbFjFw+MzhBkeuBLY3bqxJej2pC+/8tWtSlxole94SJbnplA8xuBW7zdQcg==
X-Received: by 2002:a17:902:e5ca:b0:29e:bf7b:7f36 with SMTP id d9443c01a7336-2a2f2a41a08mr391760755ad.58.1767616088758;
        Mon, 05 Jan 2026 04:28:08 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a10sm448109275ad.26.2026.01.05.04.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:28:08 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] PCI: dwc: Add multi-port controller support
Date: Mon, 05 Jan 2026 17:57:53 +0530
Message-Id: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEmuW2kC/3WOy24DIQxFfyViXSJsMBm66n9UXQDjSZCaTArpq
 FU0/15IF53msbF0LZ9zfRaFc+IinldnkXlKJY2HGuBpJeLOH7YsU1+zQIUECpTsT/Loc6Wk6wK
 pyNANEUS9P2Ye0tfF9fpW8y6V05i/L+oJ2vbXAmAWlgmkkp1G6nUcYBP4ZSxl/fHp3+O436/ra
 O4K2tqO12Ak6513JpAZbsH2xYR/zfhfgE1gbPSBSTOEBwK9FOilQFeB7gk1RUIi++j1Brpr0BA
 RO2vYdfFO8zzPPxbKniedAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767616078; l=1933;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=oOdjw5Byp9hHCPO/ockAN81t86SXy2F/vEnb3wQ8Fiw=;
 b=WU8lb1IRlgnKDoA9DoKTUmSQTgI6f7zeHzmNW0Tkt7aRJYhehUZTwlR+K5OXYgJ0gdfAFYhjX
 qSneDuM7UF2AaUjsAqusdejjuvDVr2QpTc2oXVQufADAoi3I1PrM2Fo
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695bae5a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k2kXPNx1VYhKFT5-HLMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfX9MSjiD2fHte0
 nE7GFPQN9AmKy0EtkQOxjPGEi97mwy2fJZ0LrmsPsJKs0cBDKJWcGd/fAq/dgXlFAu3idQDmLJR
 x49QKfV/SBA1IT2eCjg+YyORKZ8sgde+0MnpVtB/FPW07kaCZvPX0wqGuzAIcSdWXYUhauTJcPu
 5XZbMONR+c4RFExFzDHVEGVdY5sVNJZcq539IpFWLqAeA43TFp/bE5cwhMnOxvP+3/dC2lH1Yz4
 v3GejS8gGcruSbQoAtPV/t9XaJceMAr3qcblIbOKaBB/yIIH2TiCt2fOS9oMEZW8UqIR5mogCfQ
 WykW5AjPhoU5W3b2Hwj0xRJ4+QB1eQWmDYw9x/x9PY1mUD5mRLQITnz74h/Xr4vLOPKFlH8OOAD
 xXi4MUfTs0eFliXxCsoyvVIscKs4xYAmvLQNVIZqhpmn1RBKNkm8gxR9L7liIhkQVA/EKPSlSjo
 lOfVXOhK8v5bm4v99hw==
X-Proofpoint-GUID: kmLOeZsEKNbF7POFMaDDgygVMaxe8_e5
X-Proofpoint-ORIG-GUID: kmLOeZsEKNbF7POFMaDDgygVMaxe8_e5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_042812_808515_BB391894 
X-CRM114-Status: GOOD (  14.01  )
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
Sumit Kumar (2):
      PCI: API changes for multi-port controller support
      PCI: dwc: Add multi-port controller support

 drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
 drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
 drivers/pci/controller/dwc/pci-meson.c            |   1 -
 drivers/pci/controller/dwc/pcie-designware-host.c | 168 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c      |  32 ++---
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
 16 files changed, 226 insertions(+), 73 deletions(-)
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
