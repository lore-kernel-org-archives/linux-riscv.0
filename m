Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9115C9830B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vRwcsdrQLpEMR1Fcg+ko//UAleFUAWAabg3k/mGDynM=; b=Gdp4y9TUcH95pV
	GkxnSgRDxqxqTYhLX8nOqxqJVVdp2UAaqmBa5BXHSaDYUCUgyZeoM5IM2iG9s5ZXThcKBAP50BxTF
	yeiwIPSOxj5YX/LK9sItM5rTFCIkqw742EZddxcXq2Ra4JNS2t4jzwyamnI6asRowCCtSO5J3ZWMJ
	KNILw54xcgUq3mwKcJhraJPhlL55hbudPv5EpbDyUHifpfKsjZZtcJCfVnr2OyJ6Fi/F7Ymkl9PL0
	bJwF3Fj2KBaQRxZk76N1/Tmy3wzzU93NHWTFOfWKglze6oIwlGlXmtOxEWFHdghGvBr9KEDwNy2Wx
	r9pvzHFDun2s8BhHYJyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OgZ-00000008eGa-0GgW;
	Wed, 23 Sep 2026 15:15:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OgW-00000008eF0-0cEm
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 15:15:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUQo2443305
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 15:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yi7zkx2L2x0jJucRLt+eu9
	FDB7gUieAYrIxOpUP9teg=; b=XA6Z8BcTaN0A6k1aAMtxd/aKKzO7tbM0pwqiEC
	AXHemIQF6kAS1tFES7qtTdtc+LEHLr45wdBN7BTspcMdYoJaTB4Ixc5mOisRQjvd
	uXHsCAiP/Uj+OiVJhVShIWfgNjry7glMbw2qdPSRypXylyZVjRwf+FboNcobuJ34
	R9oMIAtsx9gwKSH7qcoGQQONfdTHHrpDn3ToJEGJqG13wuuyOJ2iBAEND5AdHRHR
	BS3rBu58u2lp/GtiVzRp0wc8RGpUBWiCllTq9zM8rJIHwV6xuPbtYdE84ffG5oBq
	Wzjh6uh6cAk6NZTPQKd0A4bm3CpAPoo/hLgvfeqqVVejOMCg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7hgkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 15:14:58 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e99615e0dso840456241.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176497; x=1790781297; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yi7zkx2L2x0jJucRLt+eu9FDB7gUieAYrIxOpUP9teg=;
        b=VvnZ/ZBSeN32uzEkGov+3JTkF6gV4VER8o1XLvsQCG3sOE+1WSfmL4lsthI3IMpQ+a
         TtTeJsYTdWbqOMsrFEalu341zNigmd2FMpT45Jn5DoJg8FdDaMa55vviUf4ooN6ulw3I
         lrvtQZAQD5Yyzi5vfXdfKxB26Pq2VkUGGoFeciGD9GEyruzDzosktD8fr+M9Gh3tQAyN
         tJQBACDfz9YOj2W4Fh0Qe2Ba4V+f86gkif3sQfgBAYmfQ86X0eZj09dyIKgseD+PY50W
         0SXkaPzsi/TbM4v/duNZdTC8b2h6UhhEVlqPCiS4txipWPYwpQ8SdAusjCCUNxDaEGwj
         sNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176497; x=1790781297;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yi7zkx2L2x0jJucRLt+eu9FDB7gUieAYrIxOpUP9teg=;
        b=m1XR7fxWnXXvYFi/otpvY610ev3PhZfomVOmQXEV7r2/KC+3qEwInxFpdUkmXPkMgL
         LQ+85c19s8wt0KAdlBbVwsbZZqB2MQNXvoUSegEDKn28dEtPuRTrnygtXqe9fI9omReL
         tGTFxRE79xHgyjNVBCDZdt29Oi7HSsvKlHFlGZbTphh+fS8uB4iCICn2lmElXMLzCGIN
         JcuCfDqAnOwgPffrZosR/BxQsHlJZRY+Dqwo+1QHQCALfYaOqL6f3xzeNZ23H6iTlgXj
         ul2LLjN7HKs71ZKh9+HzER8jNZiNWi21YeEkGJIbOb0k5sQOe/XJmq8fjwnKWcyms8M/
         i7ug==
X-Forwarded-Encrypted: i=1; AKwUvBz1KZlrRC0kW/+ZLPe6Ny+2MPxkkFLWXlEiXz47S6IX1HcpeXQc5S2x1UH8cvenRNCfODNz7UySTxdxXg==@lists.infradead.org
X-Gm-Message-State: AFuF++nKG4NRsR9rIxeq2LywuZAIYGSmvMsPgwRT9sFV0TUKMam9QS09
	F9BB5DAisAUGhx6ucp3etTQMUbi/R+j3HPSfyrvgzsFcOa4xXVlqP3a+oL4dB6NSgIPebmV+1Wn
	F/132lNE/0qlWLkuHHKZh5pOJJCxqjpqlkGGQmwX1zWIJfvPKjIGhQHHvIRJyss4zkNf/E/0=
X-Gm-Gg: AYBFou3pCXFh4M85rUWoPIQPDB597jQqbt3eoiN3JByamwhh1khry/BcgiRh1AesmkC
	fxWRVElND7lKuNllnLDKA4yzrahm+O7rS0ofpTO+Zil5DDxtHdIZROb1v0vgQEzcwB34ykIuuAl
	QsROigTmqCi8IOPbZQ/ljPa7u4t5f2XPoYs1aX7MYEPa0QzKOO+dJLfnB1jNPSyEV570HJoV787
	NZnPjuTYOlr3RMbxeiGFWdqnsnhcUT3J0ScSboCMU8CwQr7g69fyN1JXHfsuodUzoWW+Fo7c/S1
	QcxQWnc3niHcSmuMmE1HFR0K/ZztQlSTui8HoyZdMwnvIawPRErxNJ1ZBqRpmMsGJ+ASGwl+6zz
	Hyc1xgVI5Tm7/9k8IAZCosEIcvklZ
X-Received: by 2002:a05:6102:5808:b0:7a3:b2c2:2e70 with SMTP id ada2fe7eead31-7ac0ca15c29mr2614067137.11.1790176497220;
        Wed, 23 Sep 2026 08:14:57 -0700 (PDT)
X-Received: by 2002:a05:6102:5808:b0:7a3:b2c2:2e70 with SMTP id ada2fe7eead31-7ac0ca15c29mr2614047137.11.1790176496602;
        Wed, 23 Sep 2026 08:14:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:14:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v15 0/9] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Wed, 23 Sep 2026 17:14:34 +0200
Message-Id: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANrss2oC/3XTwW7kIAwA0F+pcl5GtgEbeup/rPYACbSROkmbz
 EZdVfPvSyLtJtKQCxIQXmxsvps5TX2am+en72ZKSz/341AmaH88Ne1bGF6T6ruy0BCQBQGjPtv
 xqubgyNoPla6hVc4wkLahtUhNOfcxpdx/bejPZkg3NaSvW/Or7Lz1822c/mx/W3Db31yPUHEXV
 KA0BfFtxsTsXt77IUzjZZxeN27R/wkEkhqhCyFWWKInDSE+EGYnsJrdYgqRhZkBnLQpPBD2SFS
 jsIUA7HTSIWTtHhPhnSD0NYILYZxkBEeGMb2M83z5/B3ey6fXSxnWmy8AAyKdAY6D7kyk0Dn9C
 GyRyL9IGDRwDZICdQUC1OBNlBPIHSDEGuQKZB2RxFJfQHcC+SNUjcgXqLXOa5OEc6YTCOEgka5
 2HKz94jVQJO0C8hmFO8VULRiu3YtRcvQ2Wsz+jKKdkvqNl4KCKr0TMbWZPOAZpQ8U1hNcHwSiz
 469T9mlM8rslAdXpdaHkVpCimIkSFeh7vf7X8YAZytjBAAA
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
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8129;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vnN+T2XbeWk5toset9VU4nTIVfbU8DZj0FMpypnlf4Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+zeOf2G7l8EXFcfVOAE+buElY5SFrPnn9wRC
 Evx9qRwltOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs3gAKCRAFnS7L/zaE
 w2TzD/9IIAk691KeBGEP5+gjr367MR9d6SS6IzzDpKNK8TFMzVaIsurZAnAS83j1rB17e7CiFcl
 OGz5i/BLZ9JcMNJRpHAJKKF23IdkFl1qxyzNgwXIAMAaXTcDvwTLUYgzzu2lGPbU1qUV3JmSLPu
 sTW5wvKTofo88VRNvuGegni7FRQnxAPhyj88ddvgs/veq3y5ldWsEK+ROUS3XQb9Cez8Joet9wo
 kVB0RtmP8l0+/fEF5XnM/iIWH07Cr2da2zwX/RUrUihkF26i3yUPrXRe20MGvetGg1vUVB/eT2p
 nnVM5xK3pQzVpTkPjVvfiSDNCAszd1ZU5q0eljGgVNUZ543eLw9WMtCAgAGFlvp6zk4SsZEJWiS
 LTA+UNgvxL1qDrBz0dLAiuZa0xP9TpTJCdey6ExoUEesZIIFHKr7L5ZKcusm5cNWJd1wsPe23d0
 M8128gvf/+PrbRQVafyn0jud+BgsQ0v0MPJT45bvf9m5Axej41IMwqj3pxlgrnn3hkFZ1npZlaN
 LzvmDPIvuOGArc453fn7+VDq6mEjGIZ91LXv/h5kf4LHcrOX0fItMbA8/HL0YXQIhIJ00iAQ2Rh
 zPYBLvlmFdbLA+razK5mu7GGFHMpDREhm7NxTTMUGv3dWBujH0/3ZIrkPAMEqD7LlxN8JiCRcpl
 5dtzQeKEkgtW7PQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: MsJbjnsovDvwtpilHNdfYWfrUp1C25d4
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3ecf2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=LD4EYYuP07UOpJRtIbAA:9 a=johg_cs5QguPD8jS:21 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX2eK0EfpguglC
 sDU4yI6g0YGEqUACUg09CoPhP/XkDw/2q+h0AXNvT/DHC7OOb3Ci4ZXYWqjVjq50iCzSDb1lp/V
 Torj5teiU8EeHGjE7rzx+qtD513ORSN36uKLQKndZOkKdhARjx+uafQvTh6VU1bQLvjWImh6zGU
 S9JqCCxxMSu+LLNvbR5RLP5vRBGwZBDpmuSWqvOMM6aBWbWMJ/GG+VJpnkcyTklTVdcIP7vA029
 Gtj0htFh5OeHfW1P4TxnDztYfkFk18NKuPuLT4TmrlfmbE42QKVxNDGMr+X04xGHDO0N27pR8DR
 ICTFZjxq/4dIWdUwYjmSwSMksQL1qYSiv+uG1gv5AgDSRnaNBwt+KS/OHAmX1OAMmdwSldCJ64q
 tueaikatFC/Ye3Z8KfWmduaTpKCImxh2I3+O8z6hJK7xo77r4lIck+ySPmQCX05FQLjGAMSFUq9
 K4ajwoi+C9YvJnUOO7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX+B/a9iIGAXEh
 n/R4AGHXzdBpBNSPe0qbF13eprboT4JjrZ7sInwLpAEzFKoTcEoe4vcwl7wBBNpRN5BE2gmujpq
 TvNqPgTEAgtFbV9ul/7+E6yuYXdYQrY=
X-Proofpoint-GUID: MsJbjnsovDvwtpilHNdfYWfrUp1C25d4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_081500_291089_8FBC9FF1 
X-CRM114-Status: GOOD (  20.94  )
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

This iteration addresses several issues raised by Sashiko. Some are not
addressed as they were false positives (nothing in the PHY driver ever
calls phy_runtime_get() on the parent device) or I decided they make no
sense - like the suggestion to remove the power-domain-names property
because there's only one power domain.

--

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v15:
- Squash patches 6 and 7 to avoid a potential hang-on-resume regression
  (Sashiko)
- Fix the AUTONEG_DISABLE early return path in forced mode (Sashiko)
- Fix Kconfig dependencies on generic power domains (Sashiko)
- Set the performance level back to 0 on unbind in the PHY driver
  (Sashiko)
- Use devm_pm_runtime_enable() where applicable
- Link to v14: https://patch.msgid.link/20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com

Changes in v14:
- let genpd's own runtime suspend/resume callbacks own the perf state entirely
  by calling dev_pm_genpd_set_performance_state() in set_mode()
  unconditionally in the sgmii PHY driver
- drop usleep_range() from the PHY driver when setting the state as the level
  setting is already synchronous
- add missing power-domains limits for ma35d1/k3-dwmac
- fix ordering of clearing the sgmii loopback
- configure the wrapper clocks synchronously in scmi setup
- Link to v13: https://patch.msgid.link/20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com

Changes in v13:
- Reapply OPP on speed change in the PHY driver
- Use linux/device-id/of.h instead of mod_devicetable.h
- Fix the "invalid PTP clock rate" warning on sa8255p
- Add commits necessary to allow correct link speed change with SCMI
- Link to v12: https://patch.msgid.link/20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com

Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

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
Bartosz Golaszewski (9):
      net: phy: aquantia: fix system interface type not updated in forced mode
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
      net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()
      net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
      net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml         |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 +++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/spacemit,k3-dwmac.yaml |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 ++++
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 263 ++++++++++++++++-----
 drivers/net/phy/aquantia/aquantia_main.c           |   5 +-
 drivers/phy/qualcomm/Kconfig                       |  10 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 117 +++++++++
 32 files changed, 570 insertions(+), 58 deletions(-)
---
base-commit: ab8dad6c8262729415164de729ba533466fc3649
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
