Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47457C44509
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMvp3n6y5KheUm4Yav3UIZZLCmotOOeE1o1G25zg/1w=; b=F6z1MX2Jr7aVSk
	my3ZoF1VfSrdBhMsoP1kKf5YlmvtkUrxpaaFdShjPMdBLjiBcyrCuTXxFNlahBBRew5FSTIW0CtxX
	eaEzZNhaz/apWm8nRG3TpQA6yFR3XuDXbfcT9c4Cw+q5HY6/du7Z61RNBClFDJk7H6iNaCYxw4rw9
	sXDdWqd5ngTyZmiHNVWAE4e7v7dreFvTqqorrB0TkQE9CnRxlAgcxxVdfXIj2LNlBFg101WZGPhqe
	4H0d5n6Pp9ureVJYZHG3/V2P5eP/rM0I0OmadD1FBlMHTVUKzVoROssDpXJZoDnJf/5ecfZcnogC0
	TA1p5QzU+0r7eKE3eE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGaw-00000009MIW-3usn;
	Mon, 13 Jul 2026 13:21:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGar-00000009MEB-48Yy
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 13:21:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEBqk1429201
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=; b=HRMgAGLmTEjLL7NM
	fyUok4F7YQcqnppTYtirZjwB8UYNicMU6F1+I7N5ozfZx2/JtO+LcXq4XYQxgWGW
	ThUPjmF70f942+VTtukuLP+HPSK/avuY6favBLTLI19Qv6JfHRrCru8sMnGHeIiG
	voP3rzkT0P0xj7F7snSJX25ArsOqtqZeVvU8nSdc1t3AC3VJCMDLwYwVbIlta/oZ
	5bKurWfOHT2SvIt2fHQQtW13/NkuuRvNSyeIAPx4eR7j7U2g+I5SecH0oNslpZ12
	hFwzxIYh+Pa1/g5okCPXjEuXOQTJJdsLzxBwkiSFOhnXSoqCH/+UTcElkIB90IK9
	c2+k/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn18bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 13:21:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso62729241cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948868; x=1784553668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=;
        b=gkeknHm2zTtqDNPTTSsRSruiso+CZ72oRNpn3KR8Kca5tHxnzPqjx3239RfSg/bQ3A
         SuUUP17k+bhPIBfcacaPAaqWO+ujGtFsCDKKVtngY739Ixi3+r/mkVb5pX8K+V8t8bPk
         WiYBQplLlH0XGUylpXJd6XpuYobrmHcecGMEHv6nvKqUOCrgnEkKscr98Bhs8JI0SAei
         HkXg8A2dMzS7d5KMW35EXW7JdH6JKAnxPyhlz1+PpQtcRkH8hS1+COXWS1/2Yna0Y/6s
         502yKiA+1kriVAjgUuz3ZDN1hoOaCozSJzsvya1Pxv22e0pTcvUy3ZdHSR1t4dQeYfcv
         1cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948868; x=1784553668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=;
        b=QshWyY9+O1DFtIJY08KU1WRqD6aLMTtNn4ErVH0wNvigS0okesJg2rcnytu2V0LjFr
         oUwwHGQ8cEdCtBL19sHEihin9JGAHXFafL9Uf5ux+CnC35B6xeMI4/T2+PUBx/nFtDAZ
         AeiZvKMkBmtQWE5kDQBs4Z5zqSjuTgNSHOvFKRA5F9y2TpMJd5gUv2Ohbt+pDVx+ZmH9
         sJeONabV1HuQjK9PZHe0Lr/klSV32dRhwjPQbmGfHCHBH6YSTFMZZerySZiHUc6JM2J7
         kdYpor1B+ZTBfpVfUzBKK7ZJINiM99M5yCfwNzpR4W/vS8amOdhLgTExYjY9FDsTA2RX
         Ubbw==
X-Forwarded-Encrypted: i=1; AHgh+RqrqlCY/ISytD9TtUwS+VsVhwOitL9luKeGFiFMab8rrzJUV0d35pw2vleA7V4Q+85IqUomw5Nc37h+Fg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk6H2fCuk1uam/73tZUE4Hcu/GLIobbol98wUTSw5CwXIMJf+P
	vUEOSagnDalb5AHQna4FrE9Erh04ygh+2wnA+ZeIgRj8Fr2Hxtd18/FIR81m4FHvQFEkgHjAbFg
	QtUSlRLhuYImtO/IM1imfP1kuuwubKmyjusXgezt0AnTzrkt4lorlA/2CgFSy2RY4bk/SD+c=
X-Gm-Gg: AfdE7cnMI/NWJyxpG/AWzuh3gE3fFHdqm61miIQq/vzN3iZ5gfjsktD42WKYcifcBYj
	x5jwQSoza/DKAe1a/ksYWSVeTy7nnUlhb0AGZNIfwgZTlvd8Jz1s9hv5BwbnrE4DJJOwyNNSmjr
	L9uY9WCLWTspRPUjpqlZQSQLvdl/JelFukySRBIueC0D0JJ6zdM+ORX9squ7+0PVYw1mSvPQkvG
	2a09w6WD37Nn83AVwVTPVqSD+qw5FVOutWeuhEE0xTquOMgprBNbwLuDVALSj7qjFuepxqDDh2N
	R8G8fFOmGz7CQfvdQKnnh2s/95kmWR3cEKAOKUkF8uf8ljSfyDQstf9PVbLmDIWbY4eAIRpFBS5
	K828FQhE0jz40spcLBwHsy9gCV15yh8TByN7NgnuF
X-Received: by 2002:ac8:6f0f:0:b0:51a:8c86:bd40 with SMTP id d75a77b69052e-51cbf2bb069mr93022361cf.61.1783948868273;
        Mon, 13 Jul 2026 06:21:08 -0700 (PDT)
X-Received: by 2002:ac8:6f0f:0:b0:51a:8c86:bd40 with SMTP id d75a77b69052e-51cbf2bb069mr93021511cf.61.1783948867610;
        Mon, 13 Jul 2026 06:21:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:30 +0200
Subject: [PATCH net-next v13 01/10] net: phy: aquantia: fix system
 interface type not updated in forced mode
MIME-Version: 1.0
Message-Id: <20260713-qcom-sa8255p-emac-v13-1-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jjMtp5SqAas4zIIzp6l5IEc/YbwGv5zChtMnC787rmU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOYzzfnrx183EvrDrG4Ij0t7Dbry5xhQDBN63
 sTHPBPheJ+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmMwAKCRAFnS7L/zaE
 w1LgD/9qtqvWaJNIcmSJbF08/P2HiqqtPEBd1s+tyKeMo7yTuSVEomvSt9PQeumZk4luZvppMze
 BCjhLWx+6fOyjhWVSz8HBY65tAA1zD7DNVIs9qguS8J8Eq90NiKvfR7ZDr9usRfnKcKWxsWOHgG
 ojLZ9JC26nL2b+gxoo/vjBbVki55aAeUgxQGZz0qSU//7QXZA+OpLnwhW+P1mMQrYnuPu/MARCm
 bnmW2Z8D+kbpF4vgOOG6KYY6Xx4vv59wa4mGzYwTy5RnJK9fzo2so8pYw/lpa1A9XCm9gbZDWHE
 6NZYLNQLxkY857AQzQnAMtuD1DqADDCt5IKRK8bDQdz1syR8/VCpUd/NCsYwjbqP/4rtmoVYY4+
 nXsBxk4iuXvVwttd2OTIvw+ikxHFh5MNRIEdCJXtbA+nfzjLzy9U816KqDSzeyaAe22+gQoPAwb
 HnblJwwISfQH0LqYA+1jM4JEUC5SH3i4/XD//3GCfNpIZOrN8w4L3W1eopUVXLmIHDDP0Lt9nab
 xvVkp7PypSMfsI0At+9gRMCcikJJwfP+C2oM7ElLMHgQtDj2KemfCVk/c+WGO+bFkvXVAtBcGOR
 /emT2S12yGD/Gctx1pVyNrxdoAYZVAZD+2Zf4YHnVKyivlzdCOl9aa11AjnmAMRcxS2b4nQyJeb
 akLHRgl131BvtYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 5va-eZgk5hf1Xg2MjfppJRTGkPNjObcR
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54e644 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mooR1oPkU_hlknJbmfEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXzz3Gkq14/Gmf
 JSWJbNSw58IIiPInIz9I/djhPbcQ7a4gVTgo28CLw1atIrxDAvFtTAL9JOPsxdTo3sKvABy+tRF
 bh4BP0kzNf00C27ZJCx61KHlqyzca7Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXyz1vikP1C7gj
 lT7sV44R0/fgOgFXkoi2VYFwJtv/Gsk+lvgSMXNctAbXWj0HvdFcNo1tXKTCXtbb3Boqflbk6g3
 ChVJWplYLYv4iHSzQYOgtqYQ1/L1/5e8oyBcIKxCiPNdbSX2LAVjE0bqE0ttABpymho9ADY95oQ
 wO7Tv7c4Jdw+Jefjq6H2g7sYHxu4Idajjh5t9YdefzJp9dWGlLl1x/mPwr8RflUWSoA8XP9WKNB
 oBDk0WJwA6HgcNNkhAwWYnwbXrkroOJxqMX74WnC/WTLDWmAkUfFyyW2HjQnt8Guv+Ra1Z3fehV
 RffWikM1aUJ0nprMlJZBCZhqAgJUsJy1mCijO1wdlbeg9FxDWTksN8lxsOzAVI7DkWUAkRSEXzL
 +8sLcbnul3eVXQUq3e0efNL7ZarOH3FNTTgjmAZsKdiH6PtljOVg4er6/1768lf/H74BIRMEnZG
 ZoocWgzd87ldV8n65Yg==
X-Proofpoint-GUID: 5va-eZgk5hf1Xg2MjfppJRTGkPNjObcR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_062110_177953_60FB76E7 
X-CRM114-Status: GOOD (  17.74  )
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

aqr_gen1_read_status() decodes the MDIO_PHYXS_VEND_IF_STATUS register
to determine which SerDes interface the PHY is currently using on its
system side and stores the result in phydev->interface. phylink relies
on this value to configure the MAC.

The autoneg == AUTONEG_DISABLE check is not correct:
MDIO_PHYXS_VEND_IF_STATUS is set by the PHY firmware based on the
negotiated link speed, not based on whether autoneg was used to reach
it. When the link comes up at 1G in forced mode, the register correctly
reads SGMII, but the early return prevents phydev->interface from being
updated. It stays at whatever value it held before (typically 2500BASE-X
from the initial autoneg run), so phylink configures the MAC for the
wrong interface and the link cannot come up.

Remove the autoneg guard so that the system interface type is always
decoded when the link is up.

Cc: stable@vger.kernel.org
Fixes: 110a2432c520 ("net: phy: aquantia: add downshift support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc233879ae1fb2a97758b3df9600ce5..b720e4e9028cc20823297e8bbd239121aeafa09f 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -544,7 +544,7 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	if (!phydev->link || phydev->autoneg == AUTONEG_DISABLE)
+	if (!phydev->link)
 		return 0;
 
 	/* The status register is not immediately correct on line side link up.

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
