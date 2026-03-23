Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD70F4610C
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFzk/vDJrMGLhdVC9RgrgQBiI70XjLSwDTYS5QLWPGQ=; b=wv/6AD9cog3k1H
	5rDhiS83v9i181MoyoAM40pQcZNBYOZjShFfSMXrjDReCVOiIMZwSPFfZudNggmmHfwnMBTgauyRM
	MF7kjEg1mcJ7q6EI7zo0pl2K/dUs/qoBUzaaAwv4semDhNw0W3IKZbnRFf5ncsVnpuc6EGn6Q0h0H
	EOQNLuhSUi6VEwkEhlvQ2tBW2SLL3iqvTrUSGBSnQcpPddtecVUakJkEz68++3TetK2c6Nismt9t1
	9Qz1i/HbMpn2BjBZpNINLuAfScllOxSCFlbEqnrLmCZgcI8rDipDyIcInyjVqhKAL26XZAJYnrowB
	NTFT68dFH4FWqfseWCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fDz-0000000GmzN-1uMp;
	Mon, 23 Mar 2026 13:21:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fDo-0000000Gml2-3H9j
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 13:21:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83ri61364245
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 13:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=; b=UbFh3hgl5FsVLM3B
	sm9Hu660ve6IIfQnn+MGoS318CqYS7004KEd2g+JiA9TBEaTA4AB0j0lrCREtzTK
	kp3p52jOtl3brB+7oxWbJP9czqVkJv+xKREZbLHfPyhYe0WsvVIkBSGxQJ7eN7B6
	qsqJLuKNoy+TrSe3YWICA15j+LRpRXtNB0VpDVmg4CWyJxckQxM1H6mHKmNb9Cuf
	78cmsiKqXgvbA2rLptc0GxCuC9RRCGC1QS3kwslCdv43rXULLwrUUrnPWuNjrzFd
	gmMgsD9mM/i2z30FMJ34+tmBV1mmaZy5G4OeVNvu2sceQQutJBgE/BaThgn55pqc
	lxkS1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p793ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 13:21:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so207828991cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 06:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272091; x=1774876891; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
        b=JeDz+3KMEd0qirgaqFDX9xKgTOj5puSozMqBKXrtLI2EAyhAP+UjocnI5dxSOwTzgd
         K6DKWsIJyCpoE4AdLD7yNBPLrKTcNdkE/UN7OE8hCnl10x3PZLzVGMgoodD//xzwibgp
         B3OQ7WJ671GNIBsbyTQWrBAcjO2k62m5G7AKG+h0+GiSnFBQgdhQsrDchYMmd5ZeZGp8
         XSiCpGl/PPB2Ww5kKebVzEMaBZSX0kmrCSkukzS5X5n1MDiZJ3w2aFAVoLZXcCVnDwXl
         ktEN0Vcgi47cEUGNhi1pXgk1m6+uqVn5WDT3WAlMnIjqTac6wS1tSoKjOkm6OP1jNgRg
         l6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272091; x=1774876891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
        b=dmNtsbLyQs3nRET9Hi74S2jgFUw+hMmpZV5If9HWF2bGla40+3ZEg677dknoFWG0JP
         3vxV5wmZ/I3746dlr+AnCr74NrGEcEa2W1As0uo/ejrwk7Wu8H260HxrdwMkR2zv6++q
         yHHOgNmDb7C52VdbtaguST9y4n1iRNYBj/tmAGGgqjlUr59LHYpjCTAMcKCaw+moaJgD
         f7CJzvzH7EPfHhuAOOo7ZkTKec66RuKl4xiFuCMSNuxLvaAg38gkM1hsvmSsBQXrQVjN
         stHgZpy2EPfuZm2dF+6p/3UkHpaSCyP9FMBbMip1bNoqXd91ebMRXUnjyda8eG7+F7oM
         dzIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRhRlNjEiRKbvyuNIl22W8JYol5WUcF3Xe8ggmDu+vSM9I8m8FD9FP+OdQwoqiAOMfuB5tY8Z6Xa8Iog==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAqFUbJIj1M5EhucyICHrzs2ETJ0XBSF8rByoOMBiKWmzzGJIw
	u05o2bfdC/OJpTydxpD52BAYVSknmvJ9bn85hRd7ALD+lr0crmSWblcBt81QS7pv73qNSgRDdMd
	e7jxPGeDLIwoG6Ei2JZXXrC17SM2Vap2hf7J9c09L6GZzAnMJ/sIogPF0Wn366Puuso4hNyA=
X-Gm-Gg: ATEYQzybtU+t4OKTd80xdx69FDa1ce4jpejcHhUCMCNombdfV4KMSRydjgRYhnDR3rb
	vlRjfdJNjn7wIfU4BoS2m1cj9dq0thxCV4buCW7LG9meVObUa7FVvrtD7g+Q1h9LDC+Y/nmiEHt
	d3THF9DSOcvYZQEkZGjr8keTtY7Ur4SGX5s1tXJxx3QZiwE3RPZvdoZl04/Gu12k/QrfZ4p6DKV
	x7MuNTSRBgNybukIqnSl9OtRYRWXWiEP+gYHtW3ipmZ2oyy+umTQCmm4LfYfDE2aWFuBLc5ZYqm
	HvA0D7GoOU6Mb7zjZW9K5gH9BQDYbbGtaPDLl50/E9YT7WKVu3SNP3iGsP9K1glZyGof3z9r7JO
	9z+RDNDnouL6ykhzOGudRACL6fvPSGbYluZORgv89TS1pvOAQe90z
X-Received: by 2002:a05:622a:355:b0:50b:4262:763d with SMTP id d75a77b69052e-50b42628ac4mr150309371cf.0.1774272090500;
        Mon, 23 Mar 2026 06:21:30 -0700 (PDT)
X-Received: by 2002:a05:622a:355:b0:50b:4262:763d with SMTP id d75a77b69052e-50b42628ac4mr150308571cf.0.1774272089775;
        Mon, 23 Mar 2026 06:21:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:55 +0100
Subject: [PATCH net-next v10 3/6] net: stmmac: qcom-ethqos: wrap emac
 driver data in additional structure
MIME-Version: 1.0
Message-Id: <20260323-qcom-sa8255p-emac-v10-3-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5840;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEjA6ztNoVJqA2fzdic1acw7AfUASpMj8dS/VFE3Oks=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5IjAVUbJgLZzOY99SxIeC1HEhMu1hNYF6zG
 HWHluc4O+yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+SAAKCRAFnS7L/zaE
 ww2/D/wP/Ex5W2woGWfDOP2LjxhH1VUxu0Ohs5tocx+8/G6QG/C+4a2yI1IUhY87af7fFgWFFj2
 dAthXs1FtkgQKiCFv0F+vPVlLrKN5UqibTQYyxg9b1YoC4WJTO+YETC/JUyCNnFq+QLBFUiA89k
 5HWMANkFZ+7OhxrIVsMoPn6Q1gqkjZzxb3DS35OEOcj7iQMpYtH3P0FOwZfzK4i4Trp9zvUNaY7
 bF5AY5sD3sgyIyHO6STeWk6gIGHdS8JHNxd7e2Y1+1uKT5D3K08MAEO6vdEpgdyvOtbplZb2gez
 WuY7WKFO0gBEMZ8oSAucg2kVnuQLs9HaBXo1jBzfHzUsrULK7fKZfb/0VppKFtepnIqdPrTM625
 RzZL029h0ZKEm+uQmpj1eFszVW6RguALHttCvhNMkBm4pndSKmtENbx6vGDwTUsB9taEBBZQ2/c
 EcHM/H8PGRmPTZnLtEqsqQ9GsOlrLsVT0nVE7k5Ylxff9yc3cMDI+/BMiriP1r2jSVMX7/02/sD
 +2z37I71xy89qZy+laKZPj86GmdgE8S0iePy+g/IyXWsgTzD7ffAPEzN4GdG4ukCUi0W7aCupA0
 +JffBph4I5CUJzHPjC8EuCKpJutok1MxaV9G923sVU0quAwrq9GE8XI5erwKaP8PqKv7sFIN6XE
 u7wQ1WUZHJR5Ahw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c13e5b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hMBQaDoovAotqaqB-Pe-O3eZASX3aejx
X-Proofpoint-GUID: hMBQaDoovAotqaqB-Pe-O3eZASX3aejx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX7n8vajLu4jtr
 n+dAjvr9/wFHeT1/uwsxmZG0rVAtyd0hNBEl/fibUwtoSxvBAiyRe7GuRnimZ8zcTKzKmkBSCE/
 P24GnfkC/XylJv2wjI9Q6m+DP6LmUCmkY9257b3LIvXlfbYjNCJT9YkMjFbi6VIfXOV8fRzlZXf
 3Y6WQPZv0ZiDBkHsJcw2xUcW3MFMuDkYg6k6447hmvdL4jXSjfAg4GCnJ4BhYFyR5vdzi5SO0f2
 0pjLhyTf0OdhskYkR/1NJExQApgnLpezioCKVsOtq/gyeVnjuCd4kVnIf+zt/L6+tT1EFEHyuUV
 Cv7uld8FguvV670YN3uXBSP+hMzjDhXe1j5pvEqyEbW3WStsQnit9Pk5LlmUyST5dU32W4d9Ma/
 PORkJ1YOI9mLdrutVDj5bz4nmIEQ5m57I9APU08s6ifM2MEVpiq1BpDrzFVvczQ4D3M+oka+TqS
 dLsFiUK8CrCWYuIFulw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_062133_025268_B592CDE2 
X-CRM114-Status: GOOD (  18.83  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 +++++++++++++++-------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 66fd2ed2c2c8428694c07d89220d0e1608546791..8fda6c128117d7f5b1dece68c919f2a09a511210 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -223,6 +227,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -239,6 +247,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -271,6 +283,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -306,6 +322,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -728,7 +748,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -778,13 +799,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
-
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	drv_data = data->drv_data;
+	ethqos->rgmii_por = drv_data->rgmii_por;
+	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -815,14 +837,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -837,10 +859,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
