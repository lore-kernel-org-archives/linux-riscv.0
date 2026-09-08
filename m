Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D710C79F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQ8ypxAJNVyg3PMIBrtg6BUyL7MkPzpOy/DxQ1SSO8U=; b=YYEZQLlFnvhOgA
	poInq36elkBPi+nnn+MupBsSnBKR9ObfAkzRVUblFccnyFJAfb6bTg7un8Bc1r3oxjY8+Jhda8oWA
	FMTpCjgoUWTqA5yIEWrlrwIO4JC2vddJPkCwmdgH6yU3rAliF/aYgfJlpEg+7W1+aeu/PppRzk/hc
	V8gsxsvFe4jIl/HBsUgR10QYoLiKDZ6UhzOGPuVnlrCScafzm9WG5ZpHfkzCAoUR60TarrzABLDVB
	2VNFm7PpwGLlWVjM+zHeMHdmWkaGkVbZYjWme/vS4cQ2t9yEEJjbiQxj0I40CMDjlwgtZKxWP/UMx
	S0SgliNAdLGKULfEROkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xHy-00000009NIW-0cPL;
	Tue, 08 Sep 2026 14:59:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xHE-00000009MVw-1Ksk
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 14:58:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjCDv3192343
	for <linux-riscv@lists.infradead.org>; Tue, 8 Sep 2026 14:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=; b=H4z/o2yJC8UxZGCR
	xFEzscQSudfM9SE2UJKDj33hKZAhPS4KJN5C7jSDj0KE2WH9bTteqK1WehXS555c
	NV5XBETqwu0m9nxq7N9I/i4w+6XBrFHHVv1zb4aSmgT9+VdhVg371doikM1t9ekE
	gJQRLT9SCDJnIAEaTaIpbbqL0g91IXLFJuqpERHD90LTo8c/ATGEedbgWYCkAqpz
	sag4MwP9RCWlT75VK4ztVYFsEKEKACz6+8wTfVjq9ZIzCAFKfPcZRV706mvaHUIb
	TfbweBveylWP1sVjsRKPXB/4eDrAVscj1upzAlq7YDP6M4TDtyD8UC9glf4E2pvb
	CSwhRA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1chjvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2026 14:58:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7819910f8adso4061337137.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2026 07:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879503; x=1789484303; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=;
        b=CzJHQjdcGO1oBzuZhSDXKBr5kRxXuTU3giVLXEq30zdMReh6sKrxnJD1lFTe1tQJjV
         q0UJxklB5EoIdJo38W5EttJ/lekb7KmRVWwJ7s5dyAlhbU49Q0h4z8HkxB7B13Lg8aBK
         cAmMJ+JjA4JzggeJlNXv+IKOjMJjHGHxXwut8GefYlNHLlGwBrvUkQ0OSK6H/F91umNO
         K1ZPFTFxPG4WvJp8s+yHuNfovQFI0b2do6N396sQnmHz3uJFBWahcWQxlDIw+wmrYu9v
         OsdgJfGHLqejMdkrQmTeplkn3RbCQ3TUvjYpZjSzxzUL7WrXFatni9em8coYZSIjOdQw
         7Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879503; x=1789484303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=;
        b=r22NdNAjZFUoT8lfMrdZ8i18YF5FOCgoj401dSJ5TT4YyQRg94E2nZe6yoy4m8MQKN
         4yqpzycoHO1yR7gwPZXuiFIX2f4z8Z1/61rQp/5EwwwiRjIv1uQwAyNkGq0cBf5F+miy
         gyDmYNbkY9gldGM5C0jnRjH+bzroNOXABhwQQ92+NnHYzR1+CnP1i0HWMEPDTi21qm7b
         l58uwz/N8n8l1zRyHPvHZpLVe5X7FjFMTA+5MVbwvxGmrqrsptnsrL93Dlko6JRSUQmF
         HcUTmKBgfvMcqu9wJCrzqM9/KvFvy2yWJES9CEP9SNCdXKhVKS8L+SonS1uxK7LecD0L
         qN8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmulIPIPpxUjlZnLRjlgafG8+x55+DJZfgWbFyS1dftq8ZPue0nQD3q5x1vTEhQ2ZOdHPGJK8WVNuhDw==@lists.infradead.org
X-Gm-Message-State: AFuF++kSbnY7CC2wBufiTOpWBllGjaFy3V/KrYm10q5gNxBuf5HgyLtc
	5OfhDpjpm3aGGKMoPmMH96I0xf64g+39ypfJfjls5xfPSlhMWYLtY/f6QXSwkiBUynIqd9IYgjk
	Co/zdAf404Nxt7bqOI+O67sKmZkbXbwjw4rrOqgnBRNwQFgykrrIFZ1ZJRqCAO8U4Tzw4FA8=
X-Gm-Gg: AYBFou0eGEmVwVCyxm/LDGv3fyC5CGEz45X7TYe5BcnuYJCcu+7XiOrxhxMeQhQW3Zb
	L0JqKqAiehS0Y+hrJxFx6HeFq7R1a+d++ixP6B5iAd8KA4l67esDEtQHN7gY9ZZLaTrlAgUN/Fk
	Wn5nXMm4JWXO2urc/p3EO7TyXLv+4Sb4iHJWYUCs/wY0nhuMrEYCZRdLlt+99URxGEbdVD6m+KV
	QHlEFHcLCFR/5nfMSjw4AsNGwftqUzOpTDqrc2kQwrsKi5Tm43VImvImxA4WrODxUAgISDyhRbW
	eUNDOYeJOgLiA8or10/BRzNwcDrlq28OMGRd09fnEuI9VoIsQAOopOX7TAw3BTTkgwbDHQGzaiO
	K9eslpJokXyppXgu8FWnirp7u0gPW
X-Received: by 2002:a05:6102:f8a:b0:786:c86c:8fe4 with SMTP id ada2fe7eead31-78a4ab73095mr13389858137.13.1788879502538;
        Tue, 08 Sep 2026 07:58:22 -0700 (PDT)
X-Received: by 2002:a05:6102:f8a:b0:786:c86c:8fe4 with SMTP id ada2fe7eead31-78a4ab73095mr13389825137.13.1788879502058;
        Tue, 08 Sep 2026 07:58:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:27 +0200
Subject: [PATCH net-next v14 08/10] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
MIME-Version: 1.0
Message-Id: <20260908-qcom-sa8255p-emac-v14-8-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5580;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t8otp0UprQhPEc27ImF7K2VwOwzg/wYCq64pw1qmrCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJuBKnVHFtZhqYV5cvtIg87432RnUOnGpPR4
 KNi1esqCMiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAibgAKCRAFnS7L/zaE
 w+RKD/9nKk4RbOiPwu72iSEC6P5rVRbk4NCQNHhGDOO/pS3t52XnDZN53QDIv1Te628qJngsc57
 8PqQrDbGBZ3drp18j/Wf4d4bPE/VOmL9/7pTMWUFPo4eCSdN+E/VaVdFYNFaC5j5aKR60wufH5H
 poMkZterOA+riDCRpuGSE7SUnuk+leapL6jTXZyGky7LJwXjf9RrKoxeDvIEc2AdaQpSTb3TkT2
 zfdBXskiwa0IFdoZ/lhafp/RkG3Ivoj/SiQ6VqFKhlX7ntU0YX+K5Uey3cewN7CvtnPBfNHfnBW
 n1M5YzUjl0EjGS3IwQ61I+WWA+nr0yklYcOn2jm9wkfwzqtLtkXPsDiLUY+PfQjl/6NQtZc2Ocx
 fMIg+4lLrycfuNyPtx/s2N+lrG+hp8/m+ntdhT/rplaS8oQ5G9M3CkneokV+QgH0jYhVmtSiaxB
 X7s63o7FbfBmlD4J3KzfUOCVsxtKCvOZb77Fk2eY+SMPfGNr3Cgr4q/9bF8FAGdRFRW4W/7KDlr
 JIYdwN0ucOfYIjAX5RK7OxN1LLAjm1nmmj4Z5yS0yunSjfYR4XXAkm7FQIhnjuv7lpDNFQdXQDY
 dG4QEyZZ4SpWKwKzofroNl18WCUG22Q9CxmdEmNzLTGfcVpTG204fH0bUweOl3FFpkr2tc3EQdT
 mn3+xDJLA5yTXSQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6aa0228f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7cvh1xCDNGPN4v1KGpUA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: pKfDr0UBFd2zFqdlBaiio8YzwcfKt6Ez
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXwr681XHzF4fa
 5QvnHo7iZRvMDn2g1uksK0psYbsak5QV00HhzdT8L+xKCL5ayKrJj3poKGtsTcjxZKSAgTLmy45
 Pi5QLLJhXHs5cQ/5jC5MQ7tFE+xKLNA=
X-Proofpoint-GUID: pKfDr0UBFd2zFqdlBaiio8YzwcfKt6Ez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXwEwf0VMWET0f
 QtIVdhX3l0WxH/s2e4ghpeaWcURdS5uikDKqH7+yFxc6Qa+p7MTzGAYThls/NSqd7t7VVQ8a8iX
 dVHOrrWxeMfpG88T8Dm0j0N5NtlY62FGtp8vC/5W7tVdwP8dXHG4w84L5PIsqj39Ee9bWD8gkcX
 PVe6WQprHHJPlpL1zgbcVmrCUt9DIRTDbrn/k29+X6gKyuCPYqi0EDp00VNnHBO/x8hc/InarD9
 279e8f1U6cffxfsSaWMfwyTrFG1hrhLjHTeWrpmelxAuPTBEpMkiBwK6ioiS8R6/QLeniPR4uCt
 gbyUb0bwVd0cHT+5j9rcvd8lRYH8zn+iBbkkM7pUKSDrX3V0GdOqcQ4DNAd32HvyZ170JJW1T1M
 BgV6pohnijd4RVGM8dd9xfV9qRIkPhPm9CZ7+/znsVk4aNlVWXSG38tXSFbE1NIN2HJPqgo0Ul1
 0zDqpWCRHxxLD4r2J/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_075824_582946_E42BDD6A 
X-CRM114-Status: GOOD (  21.39  )
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

Instead of needlessly copying the fields of ethqos_emac_driver_data into
struct qcom_ethqos, just use the address of the former as a reference.
It's .rodata after all. This is done in order to avoid having either two
calls to of_device_get_match_data() or having to extend the latter with
another field when adding support for SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 37 ++++++++--------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e067ceee016217c49d3b3d572fd9f33e562d1a75..ab1bcb7eb18e22f01556c190f7d8cd8eeba4d0c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,12 +103,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
-
-	const struct ethqos_emac_por *rgmii_por;
-	unsigned int num_rgmii_por;
-	bool rgmii_config_loopback_en;
-	bool has_emac_ge_3;
-	bool needs_sgmii_loopback;
+	const struct ethqos_emac_driver_data *data;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -189,7 +184,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
-	if (!ethqos->needs_sgmii_loopback ||
+	if (!ethqos->data->needs_sgmii_loopback ||
 	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
 	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
@@ -323,7 +318,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	/* Set DLL_EN */
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_MCLK_GATING_EN,
 			      SDCC_HC_REG_DLL_CONFIG);
 
@@ -353,7 +348,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_HC_REG_DLL_CONFIG2);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
 			      SDCC_HC_REG_DLL_CONFIG2);
 
@@ -433,7 +428,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
+	if (speed == SPEED_1000 || ethqos->data->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 	else
@@ -457,7 +452,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
 		 *  (2 * RX delay ns)
 		 */
-		if (ethqos->has_emac_ge_3) {
+		if (ethqos->data->has_emac_ge_3) {
 			/* 0.9 ns */
 			prg_rclk_dly = 115;
 		} else {
@@ -473,7 +468,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
-	if (ethqos->rgmii_config_loopback_en)
+	if (ethqos->data->rgmii_config_loopback_en)
 		loopback = RGMII_CONFIG_LOOPBACK_EN;
 	else
 		loopback = 0;
@@ -496,9 +491,9 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_rgmii_por; i++)
-		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
-			     ethqos->rgmii_por[i].offset);
+	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
+			     ethqos->data->rgmii_por[i].offset);
 
 	ethqos_set_func_clk_en(ethqos);
 
@@ -512,7 +507,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->has_emac_ge_3) {
+	if (ethqos->data->has_emac_ge_3) {
 		if (speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
@@ -539,7 +534,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		if (!ethqos->has_emac_ge_3)
+		if (!ethqos->data->has_emac_ge_3)
 			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
 				      SDCC_USR_CTL);
 
@@ -750,11 +745,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	ethqos->data = data;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
@@ -791,7 +782,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
+	if (data->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
