Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5947FFCB61B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jk71OddIOkgilvMVHUZ98tPBCsmhQ8GaTTgYGRMOxzE=; b=ww2nGxryt8Yi7n
	NHKmjYAfx2TDzNXfr3tNvh9skGCnGjPI9YfWb4u4mKjGB85qSLsdRcAuY0PASyVXp3awUWRgfNihO
	gsrohwhddO28kQSBDyps5RHIyjD6szY+QmyuUC76eohcViioigaUR66v5T3Zntp7OLBkEUYLsvznj
	6DSGhk1b5AboOHxMWYDJW3rutCsQYnfz4h0Hn1Xac/xPV3BpywTrBfrsuFDVZZbJtyRrftWGZOEP0
	5mGdsaZxFnGAT+wTioRbxVYS/oBbYeYgEfAR+N3nBEgGC0kj9lgEXxbXwKFP/ym4dQpya9rv7aTFt
	h+ZrOcvblfKAKiP5UDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOO-000000043rA-40mZ;
	Fri, 06 Mar 2026 15:47:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOL-000000043pq-0sUJ
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 15:47:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FTBxC026101
	for <linux-riscv@lists.infradead.org>; Fri, 6 Mar 2026 15:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s7+GDpIdG2iguwUQE64k+F
	OMd/bKz4kwkSaaXmdUVO0=; b=VZfYEMdQLwm3iGAC8DTJYKn9ThXfpZxkj8H5O9
	CxC6cxr3IAoE1xNSfDYa4MPhmG6nCTd+gUJmCMhCaV/RU0LiRWTkJ7hHrS+AULiw
	OaBh1VseKUHqqHAGdPDpFybbsMTxBeDzf3sU6AppYKVicsaAljTT99rK/1zp+DMJ
	QFh6FPfkB83m9Nu8o2CxdxQUnlQwm+8gOK/GIYGv2LpH1oM8ASFq+ESsbB2SsDD7
	1WKZykouR/FN9jI6kUmrg7iBn/w8kxjL+Zr842gMr6ckoywG0wngMn+3CL6WSPFD
	D8FblqQjRiKAp1YWk+n9mSbHqJhp7bf835XLtHl0xj4RdhrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43cym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 15:47:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c711251ac5so5137681185a.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812023; x=1773416823; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7+GDpIdG2iguwUQE64k+FOMd/bKz4kwkSaaXmdUVO0=;
        b=fiED5vpmkpWmFmdRj2w/+LHk0IyqFpf+nQaOj/JlhPcO7h83pR4mafxu2ZJZEGfvba
         d1DVKPjVPU9BtOZRiV19TUOZmm6PwKuI0+MAxSAYTjIyXviWro5/JAV/JSiP2ZLvopm5
         50+/gIs6CJsccNOtpUFskHXQpADads06HgVNNi+fhd2zp+j4d7XJ90ppGXW6fSLrXPAU
         8+/xbMY62/yVD7Y5NpUWwTYyjRKHY9GsvNJsg6m7GebZd2zr+kXJAOl29DPTX7QSvMle
         3lqzG6JF1No7ebKYTVny7cyfZokJe+yYx1yWgSktc1eugnj9lOlfz9JCpIfL5cbv7+5U
         IzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812023; x=1773416823;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7+GDpIdG2iguwUQE64k+FOMd/bKz4kwkSaaXmdUVO0=;
        b=mdIu5WUbMnNvgmHuNkLu5mcsZj+PvJbUnTjGCcDPDbKcDsSjPiUghA2khO62mjpvks
         L+VEM8woukN2uIT1bG1WSha2K6OXNpJl7rGqijPwioQkqzwfAq8+JYuEME7D1EUkyWBc
         RN65Oa2PEsG5bhGizCDTyP3C7LUnm9BGsS0jYEoij26DHLV5vWIeP3v8lsA1XjeKXEHp
         JPXdkSGAe8IYdSH2PM0TC4rdNIFQ1C+3xyF9w56NcB9puaX4t7KJvcPoDyq/TEhL0qIz
         qEGK0ESoHTiSSvh1U1qLk4CW9utgqnDEtL6glGhi5AATfmGXTrTaN8mxAhd6tPXYVTrT
         cMfg==
X-Forwarded-Encrypted: i=1; AJvYcCWJCS4GM1EoG3ruAa43E1uUzAzCk4uf7i3EmaWNLDJ4jX0sPyzhvZrGEoV3BSQIOHSrdKx+mmiFwmEUjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqOgdUwWuXIJpCIwiNEO2fl6v7m0UFWs/JE7wVHZwz/917hemk
	X6nKMPZL5F5vdmkGPc9pvvGdkK5QpquMblouQgLNQRPZYTDrdq7dF5uhLVY8tKRD0CZabhwpXjY
	hAFDc4Y1WyT5faOTKokC+5iyy7TDy96AWMUS0LU1khejISWJmcIWsfOkCAAEPGkcA2/WC6vc=
X-Gm-Gg: ATEYQzwpXtDWUUttWjBy0MJGJxLAFDsoZa0jPL0Bc4eA6t0Nkv3RDopGPGyxpllDXHD
	puu2OGIw0WfITiISG+A0cjhdCV8f1AGLkEx67WySReTLEhXaus7yvW8wlBiV+h9qyTgWXD+ufh4
	ndbqDTHFNoP2qXuj2J8f3mNk9BEwdEbFQtZhUGtxC/6ePVHozlMt9wGK2iaU/WYuOlIGNOL3CQv
	BE2cAtchmUA4UqOVHNd7yjkHeZkQxACOmddociUcTnhLJEZhRPbWKP42LHlYZceYztg3ZB6+vqE
	/L0GITmXmZ0RTdoq5hc3XBM5zjJIl2+YO/yCUSzYh6vkgO+c32jbdZ88ba88p3g7JGvfhEhogXL
	M5GR0DSGQiBL6ku1OgosQRkk3nNQaba2zJmsVnf+JrKZorp+8OpGX
X-Received: by 2002:a05:620a:480c:b0:8cd:6175:9b17 with SMTP id af79cd13be357-8cd6d324d9cmr316913185a.3.1772812023150;
        Fri, 06 Mar 2026 07:47:03 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:8cd:6175:9b17 with SMTP id af79cd13be357-8cd6d324d9cmr316900985a.3.1772812022400;
        Fri, 06 Mar 2026 07:47:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Fri, 06 Mar 2026 16:46:38 +0100
Message-Id: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN72qmkC/3XQzW6DMAwA4Fepcl6QnX926ntMPRgIbaRC2oShT
 hXvvozDOgl2sWQ5/hz7ybJPwWf2fniy5OeQQxxLYt8OrL3QePY8dCVnAoQGC4rf2zjwTE5ofeN
 +oJY7ZUBITa1GwUrfLfk+PFbzg41+4qN/TOxUKpeQp5i+1mEzrvXVrRF23Bk5cCnI1m2P3hh3v
 IaRUqxiOq/cLH8JBGH3CFkIq62xTS0kULMh1IvA3e1mVYjeGmMAnG09bQj9l9j9hS4EYCe9JOq
 l2y5iXoTAeo8whVDO9ghOKIP+GHOu7p90LU+HqoSfyxfAAKL4D3CGZKcaQZ2TW+C0LMs3WLN6r
 xACAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4813;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9XdbdEuY3r56nFysWw/+z8F36Fo03OLGA684GE1V7LQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbl89SImz11xHcuz4WDVyxsJu7Xg04hSUq/w
 BshdqAyIB2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar25QAKCRAFnS7L/zaE
 w/ttD/9UXcdtgk6BPmYCk4u4YMb/6T+/x/SMFrWGNcnRTVeKZmKBx4XjiUEWNxvf5vdXE7bS7LI
 3pNu8sde/ehrP/o4h65JxnvK+daDpw2rs1rxMwbf8Osf2XcY4xBuLdhoUkfj6X2E7xkc7OCLDF5
 0GJcZkdvmaL/0qU2JQf1bsrSRnGrI0bz2c+oLTE3kEW2mzFJ3t8ZIHUR5Q8xrSeJubKdIJ9mDC5
 6mfHpHuReCcjyw49JAEkqKZAIhrqunr5JJ6dyIAWPIwqcxsdZ1aeOaBnQXpXnootXhGIm+PO93d
 kGukWxEniA2Gprewa2DHJdYLbCtTS3w5D7Fl3OSIZJ21wDu+kjUeI5SyziMbdj4Z7wXtrB+Jc+U
 Js61MNa07EM9v717I0ht1296Ag55084wrRRZngMtH40//I9x6VshC0VMEIRt9s23cCuV/bVoP2e
 5m+r5Kug4Vn1Jrov/zT/uyi3UU94Z1C8yl4WhipbO8JVGiAw8o+5sBtB+WJIJy7ucZbFs6MlCVa
 CjkVBLpUBQI0ypw49JdCOhl2qe+Kx5IJLBzuTrUxNgaZ4cV67SsTlP760yTMVxNmv67oU7ojW0l
 9InFvM/EOxvqQqfpGCJLI11zBLgGUzSx/uH5Uf5IyATrOA/Bv0VWr/3rEap3MqTV8KG7sMr5MBS
 fYcPCKLAprXrKvg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: vuyEAVRTD7un8uCDc9VaUmQV3DvepvUM
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69aaf6f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8 a=h7uu4O38hj_b6GN6T5YA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX3A0UxK8ryCEC
 bnSLmgYKGWuNTTqN8dMONev+1eklPgXDaDIAwm8WRjITX3bCnVRuLqaA2tXSdroRf9/wGtdigtx
 jwl39PZh5DdnNR8wQK42y1IzLBwaO9iHqFCVNrSJBnFyXoGyV4XggO2bCGdbBGVjjWeIs1qZvK4
 2lrzC1vhloWaOocER9Kg89FwDTA2eGqFG+iVeES3zzdkFncxq+3pDMB4a/VL5Hii8k9pTVXag/P
 bbMnh8dhKUyEpds1xeY3InPTrBYWts32KKZJJs2BqDZoDik6zR6sB3NO2WbA7pPa2gkkso8FCQ2
 d6Y/+19tchv19WBsVkm04MulAPrALxansi8BZ+ZSOHIDmuH23OFmHqq1X0qSTK8JK1ZTRlttCT4
 HnZoxM80W3z94PUPk1zuioyPmdNAqWAD2I8Btwm//00HSUMneV5noys02wceu7tGttW+v/oOodD
 CbUzTI3QcqYfRWGj5qg==
X-Proofpoint-GUID: vuyEAVRTD7un8uCDc9VaUmQV3DvepvUM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_074705_361082_B42D5E5F 
X-CRM114-Status: GOOD (  15.88  )
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
Bartosz Golaszewski (7):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
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
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 ++++++
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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 346 +++++++++++++++++----
 26 files changed, 453 insertions(+), 62 deletions(-)
---
base-commit: cfb9039037a5796e3880d225d657165f378bb2b6
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
