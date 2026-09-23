Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B724C98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4Y1Dwg1aHtzwU5ZRcHx5w9dfoLw6uQSJS614mNxqjM=; b=Mqi6sdxQEBqbpJ
	Zddzjd7TFO1g4zMy1CM5BUzZz4wuFOnhXgIMKuAr8g7IdFLH4nxeMKqjbiG4YuhG/qq7ABzSIBZG3
	spH1JGESE0f7hKJ34rQHDZRCS8TEVdprS5AHTEqHtlVvf9XvhxaiJIbmqTx6PAcib5ao/xrVJJGli
	cZRnfZLOXwFdk7/wNMe9iOItB0mKgL8xwIZFP/hSyHFeIra5u2i4VXW9elm5EB31d5sYwb7KVRSbo
	e5gjQsEDe6X62qAAn3IiNwvcEfGu4zuXdHytTiNsOkJP6KfNeMuL7qUrJLgcjrddAfJqGZE8osbk/
	MI52Oi1WEAuE+yLE55Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ogb-00000008eHK-0Eay;
	Wed, 23 Sep 2026 15:15:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OgY-00000008eGJ-315l
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 15:15:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbShv3295490
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 15:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9UR2dTT1MgkrWsYz4e8MugIDq9vhO6USeCZW8zDLR4=; b=N6R11wVDDRegxGy8
	zyMG7bN81RYwU3rXgmPicR8oDXcCtY8JyyUggDfZSfhdKPkwuVHhi/530+B9Ob0U
	oLDa4tcmSeYyDmcq91IqcbpQCsjvSltj1ZoTMtStLasx00kYxlvwdbmbd1JomxPB
	Od99UE67F8+vsgs27anJix93oASB79NCwRFmyUVxpiA2ltsY8Of6TeKECpTgGH2v
	DY3hqpHwgiR0Ea8jmJR9kb6PiGMaGvJNwtGuzUl5LjKX4jywoQ+K4KD7u1liSQVo
	PYCwDpBWituC8qt+AUwiKABucs2nPcIzVs6aPOEKwPFs3LK3xEUiNqhkKiMXLEK0
	UpLodg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm9gxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 15:15:01 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980989f5030so964607241.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176501; x=1790781301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9UR2dTT1MgkrWsYz4e8MugIDq9vhO6USeCZW8zDLR4=;
        b=hnSBIVEh/2eqgtQ+iIfcSjsMCGf9Sfeg+nb09EFrTGQAo+9D8W2Z/LSvDn2EMP1P5+
         tNVOd6m+x28KKGwU0xNk+xGvePVaeBjxDQ6P2qT0qwhGyuUINW/Oo1uxl8r26p09ksVT
         /VKG3PQ/ygJQtDt7K4NeLRrvt95b8nZtFwsdbYm7fZ7TEOqvPWmwb8HxrpAjoErYhRCk
         KJnAzJ85pv7PItZc4xboAPm0AderWw9pTp6WK2fWAJOiqS7aod0eS5m19njcA6CXxHLV
         N5rzOGBIWc6uvfXCVJsjDh4ozCk1SY1URNlg9MhJ4em/0l2RB2+ht/hQz2R0JYhXh82X
         wOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176501; x=1790781301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9UR2dTT1MgkrWsYz4e8MugIDq9vhO6USeCZW8zDLR4=;
        b=obswJaxMH409pnpwM8i9tUIOnRNJ7t4bJnEPhzSlvvbFH0V0wFyHSDaTbgCIiZe8UD
         uZa2DIcD1wlbKkzgQfB1jh+iiKEt8ybj7etf5v29x5D6elds2XruI2zfcA7uK2JkOdwX
         KDF8YbKi4xDcJrZJV8HwzFHAUVWJu7WWlQcmVHI1EkBC+4ywNzRjiVl14kXw5c4jGSy5
         U9XbNu4YVRVJlrgha+CHYrsuWLqNVU04dQ1JrmgLrrh5oDqHyRsCCj4AT51xcZYbC7ow
         clHCOfxZCjStwQAVKCwF276Js+eXxmVmd4ZdWtSHLVJHoSID4G0UYcMjLt3hGQLxn8MC
         Cibw==
X-Forwarded-Encrypted: i=1; AKwUvBybT1PiCV9onad3vA4a24F3lUG6pbynCFrSiUQOjB+zamlRAsU1rsn3LarLHhAQ4SGt9MuqbqIidAzSLQ==@lists.infradead.org
X-Gm-Message-State: AFuF++m475HmqktuZrnmCaeGTR6kozCR3jONDkeyV2GHAT+l+WTYrmaH
	qKCWV06oy8YiUUYJ7g+uuTjl2FTrVGh6DnEFCwtpVAqmWFJmfjRW5J2tTfzwYsFaLSh9DyofTOQ
	YX4YvK151wUUmxSQPMxOVnkDHFB832aJpbYbFFNQc6MCi6hJ5wG1BXoeGyAVNnXge7Pz0Gp4=
X-Gm-Gg: AYBFou3+qleuuwGUlVyxUFrI75QGtsww2b3tEWE3OShRHFUrGcSqEQlRfosq748NB9C
	9qmjab9xjY1W5xYgnC3n3sKQU12ub826cm1cAjRGh24Nm4ISd9xL+YwiAByTDD/kvZBlCHFtt1Y
	zptTO/+ri7e4IiKhJS5x/axsoFE9Qe1r69uQ0vPfLCRMW7wLHamw17CdX/0Dq/3Qu5j6wf8M458
	IuSnxaAkCihXaU6eRZ2msTwY4K3wb959RF7vWwSkS8T5xZK7GMagyQ1RLpAxn/zU/+SIKp7BKZl
	u5OO+AuprUgGiAILytx1ZVZt74a2YhIXQo58DXvNNZljhml0igTYyu7Lhl2PGboVGcIPPr36rKW
	I1n8ni0EYxz24sq+9Hq/VBuC3IVBa
X-Received: by 2002:a05:6102:4188:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7ac1e24f078mr2861448137.32.1790176500574;
        Wed, 23 Sep 2026 08:15:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4188:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7ac1e24f078mr2861406137.32.1790176500070;
        Wed, 23 Sep 2026 08:15:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:14:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:35 +0200
Subject: [PATCH net-next v15 1/9] net: phy: aquantia: fix system interface
 type not updated in forced mode
MIME-Version: 1.0
Message-Id: <20260923-qcom-sa8255p-emac-v15-1-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=48a0yspdUEk3xwkcjvTbhXXEU17F+t29neQdikkIdcE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGqz7OOgV0gtRJkZHGdKpH+X0k8DmAZYc5XdGUyaVggrvqRmy
 IkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqs+zjAAoJEAWdLsv/NoTDSakQAI45
 3c0nVh4x3AoEXSUEJkG/9yLxn5l3sftmcI8RwXGnLRW7g3FvPfHVO9kgDsV92QuJB8z+HB7Svuf
 BufupGZa5X5CpNX48nD/7QUdcAxHO8pp/F9l7m+W24YDimBlfYxS7IUrHAn55TRybzGJwMaZvJS
 kNOamqPyyzWoCKj0QQiV5TOeYkS1ydw4mUcyMsZY5tDnfUpwE/xFc3RB8ftI9QSKUMPx61J55qq
 2f1vmvyLtyvoVt6WImg9Ii7cBTL3SWVdKumUjIb19euVf3KEJDZOY0g9vSH+nYxpfFJ7jwkM7Bq
 7VequVxgJEIRnfSGF7VPVqefK0pHsTGZ+wms5ctzDQao6OVgGur58IYfJAcebTZnweW0IyIRnj7
 W6vpWiDjXMrvSApv/PAGnGyY2j2Z4zXMYHLInNarwItTlDdAAKCDdI/EAnbNbGDkTja2obpkHru
 XBK8uqCJwXJKsK9VIyy8GQlls0chF7VQmhzqo6T6pco5dR/9F6AqP4a2qOUi11LEgijlqi5OXkQ
 noSRzO1UbVDQuLaUO4HFNbbALAnXh+ADClkQSikfRUvZLJvgAsNUDo4WvXBP0NvHljJHC35xgfI
 wEf/Kh+whGvzFIwbrXorqRhgdglnrJ+Q4wTs3wmd5jXRaNVp22VJRxAbFtbwXebc/xKKUuuMQgR
 SXihp
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX5u6unyrxrh/v
 xz2fNxGGNihLeu4pgF8SqocI3F2NK0LCyGcmVTKGS3lCvIlsShbJKFLIKyeOPiOFA+39Ozn8I+N
 9vddVRzF5iWq6bg5oq2I36kaBffmjUw=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3ecf5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mooR1oPkU_hlknJbmfEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: QmWE37FzuQkFlcKM9SD9RtHjg5JuNYRw
X-Proofpoint-ORIG-GUID: QmWE37FzuQkFlcKM9SD9RtHjg5JuNYRw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX8FKytM8fz02L
 Kkj4aCex+Bs1ZH1C3USrOCP+38EOzuPBLMwsghcRKj/je6ATGswaT2A73QHk0j3zxiWT+n2LLEX
 eujdIIBsrS6ygHaBa86yukuNPWBaAeOopxhbHMrOKP/oHL8wc125tTmcBZgrexHLt+0cG1lHuiG
 sVmUQ4bJGwL7pWZEDMc9jOp89XW3bXEOp4zP7tPGZqUfd30gxF0VCqbyrcyUsKL6eSKU2ozK47W
 q/7NEoEZ/vd6DGgYWeF+LQDOr40BSoAOgXLzowI5pcGDWrMDBMr5g1OqZMatNe/IKS8J5Glxywb
 9q9TQooEPZBrIn50gUl+qn5kdtlupdPVkMxiO1UmWYbB592VBECVGVnYFXZL6MbMtsOMBArwpWU
 svujXFG9RxyFzvW58zqPhX0ex+8VC8LvEcZj8HXi1m8bEOimo0h8TmGDalieWUxvOO9UWJJkoaZ
 HnfqPFnj9RyFj5niRPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_081502_828725_DC57800E 
X-CRM114-Status: GOOD (  18.70  )
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
 drivers/net/phy/aquantia/aquantia_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc233879ae1fb2a97758b3df9600ce5..096407bebd52a8e644084c3e286fb5dbcfa3f598 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -544,7 +544,7 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	if (!phydev->link || phydev->autoneg == AUTONEG_DISABLE)
+	if (!phydev->link)
 		return 0;
 
 	/* The status register is not immediately correct on line side link up.
@@ -594,6 +594,9 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 
 	phydev->interface = aqr_translate_interface(phydev, interface);
 
+	if (phydev->autoneg == AUTONEG_DISABLE)
+		return 0;
+
 	/* Read rate from vendor register */
 	return aqr_gen1_read_rate(phydev);
 }

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
