Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390DAC79FAE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMvp3n6y5KheUm4Yav3UIZZLCmotOOeE1o1G25zg/1w=; b=mFEZj/2E3YWiJo
	giVfrRKWQY2LBN/mXOh3ZHMwPqK9OX4xgvaoEzmJ9UquUp78IgMyn7sgk4kRIiP7cgCEJy1V8xaNS
	RHvLiGeQlkpw21Qmh8PXdIZFvVtPQ1dXPL7jDn42uUVRpXZ9EEEeKoQdX4M2ZueQACtgn44w4Krko
	OGD4a4PH9FE3pIPjr+8u4SzZE4Q0ySbrQxrAFbTubtP1fOROrxxdeB8NnhiTG3ARGPrhFoyrEqyaZ
	vKiNCuRaQ1ke8LqLkBq31c0ksBjzk8rGmbdhrfv7AoHeeqaYUGjWRZse17Enol1vXWj6jkWRI/aiM
	yPBJMZmn62WuY5MYP0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xH4-00000009MIO-1FDl;
	Tue, 08 Sep 2026 14:58:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xGv-00000009MCS-3BGu
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Sep 2026 14:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=; b=JZQPXWtWipWrzDBW1ZDnXzXOKs
	EnN1gZEH9UwlCX7AG6/IfTM0cj7Q2nKHaSnzSGZe0Bbz5fQqdd1il1BQ7qfuvbqEsaGHzRs/WN+Zf
	e1CYhuRYXeh2zNCpeUnMUrUWVaieH3fTPgQPTJyMmaMHJNkUDPplEj6FIsUpDTEo5FciCrTuraHKb
	xM2gFgDKgCvp7mtNo4nmQO/7MLUdDQhhcGb4X04nBi8bbqVU7o8f+3zhOgS4TtgsE1X8++xPf64XL
	u/1m4ly2hACMpnx0XsP7XF1DVJ3ip2c+P2NgyjGJ+QISLqy8iCFlR8R/FzyKREQPJ/KryEsESA0z6
	jDw7U9Bg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xGs-0000000HZXj-2JbT
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 14:58:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjCAK3192358
	for <linux-riscv@lists.infradead.org>; Tue, 8 Sep 2026 14:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=; b=kTCIk8j3aHSmnyqY
	9b9gAQZQARWVR3bSRn/kfttx9qeVk826CqCyiJd6aRp1CZxK//jlGlUhPXPPIy2A
	aaiiqRq/66s/ABM+d/LJjRY5eyqbmvwns0JFx6u0RUhMxE45AFN06bhLhWzxo22M
	mVLWczys72gHIPS793OZ+o4ATDbtATe+mSW1aB5GcgP5QZ/QGXumCoLMAKcFau2F
	2kf/ks5UlsmIbBiISLBy33wz8b80JHwLe9FtVYGxTshU9RX2DuSqaapuTmFcn2hf
	PYKZLnfB54w6+Z3ljGEg+wx0pThcjPftNaGb7B+emkgfjsIl3ToB5sYGMZowR8BU
	oL66XA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1chjs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2026 14:57:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93915f50a5cso1122313185a.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879479; x=1789484279; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=;
        b=ah20zlwKcqmlMrOWeHMcxVC+C19l2ba10TDXmk/cwgYBddp3hNjhOzpF12lMKVmQhS
         B5VjKMcM13b9zrWTqq+pHfKTXbgkQOG0AzCMUo7lcG5VzY9CfYLzUu+CWr53fYydbS25
         5LhGDCDnuoaoc4Re5KFU1hhTKwlzz9k3rQi6WoBGZCliOXMnKlrYqVJahdrVcY1xLnE/
         lvydXXZgDxQ035s3gwhK5YMqO3awEmphm68Uls7p5Q1KJ7tC1CBjdWxqb9bK+hwvCON+
         NKQ0bnaY6b+/A5ciCxHqLRmYtRmkjwWkXpYMcY7anHCAQdKUsuwDxHZZbc/0xW506ono
         kMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879479; x=1789484279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=;
        b=RXT1wmiF+fpT6yHDyPppCNu59VKgdQRSIapZWAMeCdX+Vncp+w52S0xnpisfw8EsZU
         /p9E5vSig2dyYO0upHLDf1bMD0aNTZuHQRPfm5QXzsTYPSn0usTF4SI4iufE+oxFmzuj
         yPitlajXEQLq8Y09ZTrkmrbJLuDQm9g7i+Xs9bn2TqNwVUjkj2bVLZ0zzzm/+DbjWL2H
         tUVqTL94d1MNnxgUpHeyi92o0Ke/yuzDWd7BVEi156tkDrnDuey2wwnIH9uKXNuMvYqD
         VQVRoH/ybv1hljhknOtAhowyRYpHY4V3GGtzq4Uk/WiiaeRXDzh1IiMtSXMNhrrnfU25
         Csog==
X-Forwarded-Encrypted: i=1; AKwUvBwuiDAcsW4VnbiFSzH1arHGoBIItGHDe7evd4WI3DNQRfJu2Npz9Ynrrdr/2pUNBmAjtVtiSK+CVmd9dQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nDahiekPktwlZLgt4o14fUaLcQeG3SfcOYk81GGDzXk3ZBVbSU
	GegcWTgIgrRoykTMjtoHa9OqBvbOMZJ+JXIR0+opYfM3zLWceF6T+0EnlJKew+/78invnxgxj3+
	kXoU6kwJKWKrAuemdZQdxXokETxVPY/iFWPlRIYGiZlNC4G4acumJRaegBs2KND1kJeo51rI=
X-Gm-Gg: AYBFou0wll4DsOii7U0sHexJwE6MUFK00IEC0niC756gxinQACahRhcjDBKzOrbkC3t
	XqfPvH03GWd8ZNyB+VGucK2jUpvEfpFpmkg5YiUqJwfI+J5Tqxn9SSF9TqewxHAvltynoAgoRer
	5sVDEms9PAW2gM7wzXIKj8V14N/yibn4LMvhGDJS7JrrCZQDYtNmWmCvJpWWRH74zhye3nhkOKV
	pOcuJD3LE9QA6WDTnu1emZNgqB1HWbOV2/Hgnd8u375ZysqScRxG2BliQ657wTHkcJ7zcEtZy0E
	SZ9wTVP1vUl54+t2Cl5d1c/dAz/pCepl56pY7cBK7tiVKdHRVCbm/K2fsWYQOGXDo1bpdjp8dOe
	4fiXZwjZXCOlSzuk9NY0vrKirFNfA
X-Received: by 2002:a05:620a:1a20:b0:939:72cb:baee with SMTP id af79cd13be357-93972cbbc65mr2826563685a.37.1788879478617;
        Tue, 08 Sep 2026 07:57:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:939:72cb:baee with SMTP id af79cd13be357-93972cbbc65mr2826558885a.37.1788879478118;
        Tue, 08 Sep 2026 07:57:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:57:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:20 +0200
Subject: [PATCH net-next v14 01/10] net: phy: aquantia: fix system
 interface type not updated in forced mode
MIME-Version: 1.0
Message-Id: <20260908-qcom-sa8255p-emac-v14-1-ec212b747a7d@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jjMtp5SqAas4zIIzp6l5IEc/YbwGv5zChtMnC787rmU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJmPqi3DXcwZqfQ9RcuBKffaeQOMu23z59wG
 LbX6KLmIzSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAiZgAKCRAFnS7L/zaE
 w1eOD/920zuLA7hi4Qy2IBRHuh66/6fGvU4CJZXZ8ZD4vI93p4NDs9EDRQ2eK5JZND/M39YL/eh
 52J1KMNflNj2rwdO9wtNiwHM8YO6NzJZZlpUa7Ak0jx20M07KgXAKYNawKRHhswKAmt3gb8Sv0U
 7R2lyCi5bWTavJEKJLgNvmjrfEnQWTW86v2Qe12MS6XLkR0c7km8NpFwNMTRxMnxHTDgYNFwP2/
 lznNBSoSePeij/ML6f9oklu10rRg9FOzx+41xkEE2odLqbSjDCVGlgIOBX0oJQo+RXjakYifphY
 sGn+nbC+Y0cJXEFw+YPWaN4TO8N7EZjKgatj0E/AX5y5S0CGtri1J31C8NxIAlYMjV1buvk+m49
 qfUC1djmfabNtSorBXWHn6eIotETAu7110pwW1SXS8sJEZqYSaM+UHB6N+CEshJFHnSrEVXaT/2
 x3/y1w97VKXb0+Uev2Wg+1Y7ZmG8lYpdBpbSo4D/ZwbxN92vpw2leV1EfoEopMdH5pVNVUEWzby
 50E9cOb6Xut9TWCp47vnDqWbHrGxpYV+SIhgiE8LQjji3khnrOkZ8Ew8fUysP7pgCSfo9+8xS5d
 APT5j7JXhq/tpsKe9Ow2mrNTveRI7gaS19Aug2BWjajK9kK4xY3fNdUsZfMg4w1pP1+U86iGb2u
 Hwcchsr19M05kMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6aa02277 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mooR1oPkU_hlknJbmfEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: iubVVNicQ0buVhH3bmhA78ae5WFxnoyo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXygx0TterGRc9
 Mej/RTR59ww2QdhjJpzt1Gpp26DlP7yo58VmnbxgZ9QdnvXD0GJbLBEOJuVwSX3VFEsTW9Yo2vx
 CNIEImkoctLDOMVBDwLWx7hJeAryGRE=
X-Proofpoint-GUID: iubVVNicQ0buVhH3bmhA78ae5WFxnoyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX/92RpfsZdzek
 lbwthK4Y233Qfy1dZ/W/HVhFTvyL1lQyCzE9DvT4WG7wlqf0RU7WEQKGbqVmcib7jyfUchuw8JO
 RhBIWXfmDdBBn/0UzIwWbwUCStoDW2JsP97YrQgwYaDNf6NllA1EeRcSDVsFoegAO2ECcbjAfTE
 Jg4UETY3scS0ocTAkCm/bCmZnd6YLV47H1oEDqvVP1vliXMNgYiqZ7jIoxE9XLBNAGatGqKa8XA
 xn9gMTFVyO9CRjWxlFUmMt36FAKI0Ag9ZxWcRUT3xjrAg6ucVyrfr3OGfc35MVihL1oGIL6lRBp
 ZahNtlw2/G1n6Ivqf7lg0lC/OBDH+HUt2Kf2EH7RCm1NZRiCDmLF26psvcJWwS9lr1NuvaDhaJe
 Lp+HKfyQnY6GqcTs6s7BVp2Z5iTeRLVFgAE8BRNvsdLtqMIbK5M4ilYmSBoVEQ5m2aH4WWD8YsI
 eWcVysNilgE7WiL8tFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_155802_872586_D0838B71 
X-CRM114-Status: GOOD (  18.00  )
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
