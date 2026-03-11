Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E525D1125854
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 17:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EHy22z7S5DEBquPZdnzCNA6bwxI+uS5udjeVc8DyxBU=; b=rU3s8tBzFTKVXm
	+2b6sXb3+pXK6UssY1oUUvpjXLy7nufC2h6NclxYrhgVcC9LGMWUe0zDS0TUpEQhef0ysQlakWK6I
	AmWETAPIK10gUK7p2Lx/66b9UYDPMtmlGEjH438FwryFX+NUxXlP4GenY16X1kTOz6onZnXL7BN1Z
	tI5Y9+dIvshYSt943SK0dhYiV3oUg0Vlau2oS8bFbRcUpGzZGZ9MgrH3RcEIzI9YKqcXgvbIt9dWQ
	mNoGy/55zsWXyJLBZUW4CZL/THHfnDorbu+G50arIwPOoSKUtwlQU1eNmA2u7rv+TQ/rI43O23bQg
	ocs6wPPcAETT76Ux/Dcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MyZ-0000000Bxq4-058J;
	Wed, 11 Mar 2026 17:04:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0MyW-0000000BxoT-1WUe
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 17:04:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BGba7i294243
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 17:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HaU1Spu8fMrfvtbuBT8OCk
	Qdgf8P6cW2VDQWDXgjkOU=; b=UZqRiKjD46aRSyiWEzVPGMrsQ6dMNou77dVGT0
	xSQOdrWpSK6K4NiHRJqpeJSca0wM6L/5/dPCFRVgE31MHP/MhaykwevSXSyLYLul
	KenGNDuLtJfLgLgzppAMTtK/pJ8r1J6Mf/rt16IteDuG7EWf6McpondpnIiYm2m7
	ikdarIDoKbXM44F2WYATuYnhAVlD60WYh0IzNzzX4H00hrMc+4HZdnKfDl4CFRA5
	NbwMknFFgfMltwpbQFsYJfnpNfiJQhLoBwQlWPPntGafN7xV9t95rCTQtAml1eva
	FVzvG54N4tYxaE5p3KupbNWIreKCcJsLY31T+Pe3Sh0C7mWQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bb9hqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 17:03:59 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94eb58770d2so170600241.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248638; x=1773853438; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HaU1Spu8fMrfvtbuBT8OCkQdgf8P6cW2VDQWDXgjkOU=;
        b=G/6iExvXGHGmHqFXpJpo8Pik3rrxi4zypTfpnHbKAg4iVs25/EJH8nheyUX5iscGkJ
         Nh+x9Nam5B5RdyXBDrIZQ8RXNu7gZpaoFlGBLbe1VL2tW8V5dDV+I+xfsE9daqjVt2DR
         WsKK+Oywsm37xgyg/xtr5CoOCacsK41CFFu1KJO08zSXOQXFIjXtUndKRJRnXM2m9q1q
         FWZJ875MPJ62qKaI8dXZ2m5XZjqBISV589pMZOmWn+vRdJHu1gtIXEd2AKUeTm+V5w7k
         XRvFv1CF6ssjgZR9EdxdpajJBF290/4Gy579uoYATqv7hHpm/hJxQzWMn6Q1Gv9A1CjE
         mLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248638; x=1773853438;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HaU1Spu8fMrfvtbuBT8OCkQdgf8P6cW2VDQWDXgjkOU=;
        b=obLDLoEwIcH7sS/4ZX9/qTMhOFssIcS7athu17WyGsDtcwa5O+MNi0CRQsV2ghbTaI
         aa9lqGg0lEv+6fENCDfFWJj5p3VPZHiCQ1lIFt4IKir9WESi2kuemCPOnYwy7bk2/Lyx
         /kpVjICWItZhqc6rseoI5FmbHznY2Ijk8IUNP+0lUo+Y+jKfdzotvIbtCGduVCLyDyi+
         /+4vIb+qLHqlVbJ6d1avTFtz6hmKueZOx0DIR51NwoXrxrtruNtYC9kIQDEGe8uta08r
         Xkl2fA0bl7Hsa/WZZqFTRVZ2lBFv1seGtCnylmXxJN9Zeg3bH6CGmj/Q12fCxa01a0Ku
         4TLg==
X-Forwarded-Encrypted: i=1; AJvYcCVvIM1fAAk0EKdTRiIz+o6ztpgrQ6QoAq/h44wI1YylOjJFBlVF5AdybMrxjxAO6ahfZuU/fdy51zFyaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu6rzYvXfzIP/imd29lLicAnGx7DEcov+Pjyhn+9XtD9m1jQAS
	SOCz2NZx0ACP9V4CJcIXoDn0oUV0WvXngUQANTLjX5XrXTn7a357hz95AOPY6mvTU1gD41dHOX+
	yuORgqbsfebGNOm4wwsO5qa0SgBJa+F62yshW4K5lgdZRJ2Y84jXe8rVS8vbXolQUHoB6PrU=
X-Gm-Gg: ATEYQzxbp3tnFLNq7DXrANaHm+R4itAKG1/NDYI7wH1y68jiyvTiWtJr58kzcFbgtwG
	rJodTwvHLE54V2H7J5C8LsOFn14iRfXrVtIm+ui9p3EuEtdwmADliDTQuIya77dkrveTvM1ilS7
	3L9XOHC51XHBimIZcv2wj3mKZGXdlKxJq7skaC9scviKk/at9FIa4s/yc3dO3lO6O/6K5jmvnUF
	/Fn1OgfR5HjOQAWbcNzDQi0N8PKoU1EXxt+mlSOnMOP6Q49oqaf8jbQCGIZ5x80kZ9ebcIiHgi3
	81CoPcZCsL0/hn2kz/DPRjJGRJ3fF8XDHIn/0L4lPf4nEbSpveQoiXtYI+42YDqi9kQoHFx3eVY
	BaFrggtB7z/u/GLuy2z9YQZwggreJPBgMsBQxXRY42gIa7ZFg3g3T
X-Received: by 2002:a05:6102:5489:b0:5dd:c3ec:b75 with SMTP id ada2fe7eead31-601defd5d92mr1452493137.29.1773248638413;
        Wed, 11 Mar 2026 10:03:58 -0700 (PDT)
X-Received: by 2002:a05:6102:5489:b0:5dd:c3ec:b75 with SMTP id ada2fe7eead31-601defd5d92mr1452426137.29.1773248636892;
        Wed, 11 Mar 2026 10:03:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:03:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Wed, 11 Mar 2026 18:03:35 +0100
Message-Id: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGigsWkC/3XQzWrDMAwH8FcpPs9B8ofs7NT3GDsoidMamqSNu
 9BR+u7zAlsH8S4GIfnnv3wXKcwxJPG6u4s5LDHFacyFf9mJ9sjjIcjY5VooUBYcGHlpp0Em9sr
 aswwDt9IbAqUttxaVyPfOc+jjbTXfxBiucgy3q3jPnWNM12n+XB9bcO2vbo1QcBeUILViV7c9B
 iK/P8WR56ma5sPKLfqXQFCuROhMOOvINbXSwM2GME8Ci9stJhO9IyIA79rAG8L+JYopbCYAOx0
 0c6/9dhF6EgrrEkGZMN71CF4ZwrCfUqouH3zKo0OVj++fzwABovoP8MS6M43izustsCZxP0kIN
 FAJchnqMgSooTaNK0CPx+MLjGiqT1kCAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4964;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=m7zsUMUyzNBIWWoKKRwkdq+2rL8U0KXnQkmaFuIW2hk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaBtMYKRG+G1iHDOODwHpPwuweuk13HbVcQie
 3BhK9Dx+wWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgbQAKCRAFnS7L/zaE
 wzDED/4sIY4N6g84JyC+hXEHABm6Gs7uXfGAusaNiIblglss4QUI39l4yWdvkmYj5hBh1GmXeg7
 RCzY/RKCRcpX8eNN2swVYV4b4J+g1k/yVGsvbt5PCw3poYM+KRwzr4zRxrPNNSX+Ew3Td0fLftA
 iUqsCfc3M8Hl4z7A83M7/XOpNMkiG2xxgtBkPpkc0suGiVopZ81LrXFqdnje9+QkQirddqX854q
 iAehIdBx5hualJrCS2cUDLEAen/Y+ycDpfKd7WRWRaOl6lcNEQ0EzGeGHnBP+Vb4WNo78I47X1F
 RD7kNNYf7R3QDOz+RaDT4CBID3hLNW+6QeTCf4HU/GQ4STgvvfJtXBgxVGh7IUrzL0tHU7MmQoF
 WFLikDVyjwj6sq7B3Ro/49jg1K4xX7NvTYUODisvtGtrH7xEKTF0G2DASbJnQBttG4EIBH9cOot
 dY2i4AR6nx6bfaiOUF8aJpqvsQEoZaz3TAIdBLggUnA5MiaYSJN8eNi0/LqsYR4D5kAJP//KL3f
 tZQZUlcJeqnJVz5eQgDxtk2u8VuF96AeLSAMdLN7gr8hxDwvfQt+Vd5hXmELLRmWN9YC6tOiCVt
 QCc+Gu1K4M05ATMBBmWniUawjHUwc7AFfS/nmxKpfjce7ldCDoEMwN4cVBao1RQ9ySZYTCts58l
 e1CLTORfV7tCm0A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: kN32YT7oBV3Y4gQ3TquLL4UsQ07xD_Yr
X-Proofpoint-GUID: kN32YT7oBV3Y4gQ3TquLL4UsQ07xD_Yr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfX+CRFHWf+ls/D
 IkQ3p3vsJqYpbE48LQR2lQtq800N/vOGNwP4OKpNG2UzhQLWpRiKP0QssdgT84mWMKnyjTWA1WZ
 8uZrC++P1wOjD22EvaKNYKP+VB+GDioaAC3+ijfWIE5wwWxpODJupyByllGZcWgfqBwaEsTiSTO
 9eoNj/rFMeoQ691B5hwgEeLnQ7VYlbFkpHqKtGNSBB0Wy9n5q5wElL4UzrgiiUdmCO8Jnh0tlRo
 hElTqfCtJdz3qAWjwWCBTdvd4Uqb00/RnD99lNA4wsMxBtzG+MFDiM1ZPmHrOwGt2RMujgochny
 Hotq8cnZoSi9CpwuWDvhiPONPfgrdmwkmWurr+7BHKb77x6pY3+qxHhyRMrpRjP5CdFakmoMmaX
 oKIyzwn5tsPHBwubuK8iBVAfze1Zq0kyjvRG+4Osg0cUDYGu9vNHNClsIcOYqYF6170eaNo5W94
 D1tC2srZRvaGJZqvvCA==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b1a07f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h7uu4O38hj_b6GN6T5YA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_100400_413793_B7513542 
X-CRM114-Status: GOOD (  18.43  )
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (6):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 +++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 401 +++++++++++++++++----
 26 files changed, 498 insertions(+), 72 deletions(-)
---
base-commit: faa893280833784cf45adcb71d2d38d780b5d909
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
