Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D692BCCF2C1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+PTaM5NXnWp5zNEBCbgCv9hx0j0j4sSi0AC4u8Bt8s=; b=vmu03TwzLgwH9Y
	mRmNCdlvMdbo3QNeCXMjMX9PSQqaBMvR2Qu1yZmYUzXaMUvpeJMRVz1Jbaq6OLT/ym9EBf8P36rQA
	KQ3vZWsUWAVN4SWrAFt/Z3KvR8ueGTT6KFJQ4GtQeQmgrqQU5WYoADP1G3mIIQIjF1pZvZUlx1hWq
	eq21vrGF90pfDNcP2WPeD6vetgoetEvcPN4bWPuo7NzFB7CiocdwYEe/qXpdcLv/UK6zX+iZCPlSp
	pA/HD/RNegAMvKNloMBrAi7EwW5gqnCfIxZrM7pqQOrGZVd6a0PNBHETtcKnRAvcGXS37mGCS0XWc
	lrZpcd+FMwzAb6sE2P9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7RU-00000004wL2-1Vhp;
	Sat, 17 Oct 2026 16:39:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7RR-00000004wJW-28p3
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 16:39:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9qEA2031395
	for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 16:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hz4iIDuDhHEcy2mIuGeKuord
	9GLsrFZT6JV2X218PUA=; b=iqcI3njCDzM4e7mRHLw+YV3xmeKx13qdpNpYLO1c
	uKuJcnhcRz3rtqo+XqDGeMCZv2dURNY8sE4Up/wSPorj21shN+H4P4PvOUiE1k4f
	HrKJsV+TXCcL1K6rMrtrXUEtT4Vlu4w4TsY7ngl01CsdTZz1rKlYemGVmnu3eNHV
	+HjThJ6ViFeCJyAVpyHQYmZUV+RGbosOkNtCwmXNHB6OUn0sulMIxvCNKMz7qg71
	VvhPs8OoWfwTc1Wwi9VbA8nr0EEah65QxY+qlhZZrIAZfY7QJDXrV6PujpiUFd11
	LA1oKqK2zNAXkDqjMldYzsbUJ7V6A2GAOrlTldaC5GhPdA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxhbum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 16:39:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3580c07911eso2499251eec.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255167; x=1792859967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=Adqoyl3VEdi+elyTpQ55ybVsDo+2i6wiVEQAeUf0qjeq3771rQH33PjCHsTycFNnUS
         70XUj3JoPgJr3iBJk9KnT/9Qb0UGNpBVjm2BkxX/1B+Joc7fOymUQ2wRfRUU/a4q1iy7
         noBnMJjmkI2pmlQ5t713cKrupHyMNvEptpK549Ho4R/l4gDQOzYsBtU7/4E4qfiH44Pp
         MqOcfTr5n32anVnS7RoOmLlx8T+2bycei36uXOcwJHGaMT2RLQHGEQaRhabN8jFnLdUs
         jmUq5WquyZaew5G9u+B3d82UZw3kQXZdQBs6BIAW2H47tAaFPvEE1Fr1zRBlKXJpLkrZ
         KNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255167; x=1792859967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=TYTyfy1M8sMSGpRPR2cJrxOeKdF5MpWWTNmkhQg8+CIQK/athyF7P9TjcFqH8WgAqA
         Fl6zDAOoJIHwwQA7/FWYqkcZ6OwIN2NcgJ32pmN8O8XQA4VOQmqXDtBvK8pNVAv/r6J1
         UT/pYBYwAQ0mOCOh74zrC9WHXMAO5IzrPxznhgffiXrdqlr9L1xWNzOxhQXvmitjcprZ
         D/aCEqvG4K90Vsv8/ZAvUCQDpovWbxgWHGA3xBxbkmv0Qj+h718oAtZh+YRidZasz9Nk
         3AvOKPV4dV2vdNbJczQTtl6/S7WyPZuwnhjyraxcI+7CZUZ2Ox13YyfEcqyI3WmfOh9V
         4LIw==
X-Forwarded-Encrypted: i=1; AKwUvBySLB0sldXkAzwNFv2T4V7iToOXcUPbsEkw8hZyGACC/qJuWvK6T6ofTmxZTuvHfe5OuVLQh/xQllliEg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJjoyMgLsCEkMtva54wbCetQV1JIdTagdPoyqi3x3QUc8ahFGb3
	mdPOFOBElMTgbb1LA6lwYyAB7dJw40bMionTYsA6gwt+rgdLB0m2mz4SxDA2VW4Xayvi8LEd0Nr
	sLis/EnlzUpDVhY/ICOXHt4loSWl10Ry2ig8CeZiuhGs3kxUsBIUW5z2flkZNpaQ2aXBoQWY=
X-Gm-Gg: AYBFou3c59E/yV/CPKeHEZ4W77VabP8tkTQclTg7R+9vmFHIK1DNCpmON+dHsPhFyfU
	giUDHQswgiqjufOTe0e63ISRqeyc0mz+HFXU0DFuAGaYXgCtfikTSvcxYYCUWlGDDRAA7rsXDhb
	EEPqmHh4dXlFTtQX/swy0riBfgqeJCk+DgR5Ju+mOf5JSSwM0EZWDWDoS9tnfBfyVvQZTBk2mJ1
	8szKh7fLiFxKxHBq3sukE2oOai0U4N/6QsbE5yJznP49+LcpR3A4pxDIL36O8C8gik9dBbMZ4xk
	1bVPqMNORm75AiCeG8BA5w4YdwYuIYs8Uoor6TLm/RMLpNeBtIzzHyEwO/jB7uMXk3/RmlHknTU
	SOcNeogyWfFce
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629937eec.32.1792255167270;
        Sat, 17 Oct 2026 09:39:27 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629905eec.32.1792255166648;
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17691508eec.7.2026.10.17.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:09:10 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 4/7] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Message-ID: <atOkrubiz/V7aFiu@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX6gpk3mPc9HW1
 2KdEp/3FMJou2ZfUd0C3Tz2KNK7ttcQH+ZLjV90RoQkyYuB84VHqP6sRMUcmss0YU42Y85LAEqd
 z6ZZ0eHfaRKQ4O4I9dd7Ii6YMiv4yMQ=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad3a4c0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K33ZUWoUxhUzfzW7EYwA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX3LkfHo+7kg0O
 sFgJ/Ap2zTHIDW7KNgfCluTGIgGPuI8jQ7TrgnH6YZAMGG6UGFVLRtpI9oz5wrx/oJD/o8F98gN
 HcGhKbcnVPG5oVLKsLfbRlWjLo+5gMldQOwiMO+sKPvhMquJ7KILcdFjsDSaLOrxBK5qnGgfWO+
 Yo+BJAmWC68dO76fGXokcRX1KQr9W8F7t7UiDvp+OwNwF0sCe4/pynEcow5T9F2z8p+q6Fn74I3
 c/YkolRQEleK9ZHSdb7oG2Jh5pLHvttYV2Cv2ou3eto3i1Mg9lKez75rabN7DDkxRzc/pkBTHLG
 fHUedZ8C4WRGJZ9TtoNQVZ5T01OLnKXDE+I0qc+tMwXX2yTVfu7KsfoOIluhxqoLT1JzaGeViX1
 0gnJbh9yEnXVnskkOBEYRT4zqu+8/miFc/7K1IgfBOwtCYPMkVJyNHKRujdgJiASotM6SL576No
 9FfqncC8AzmFrWol+HQ==
X-Proofpoint-ORIG-GUID: ZMCVz6n4MsImCDLcAkfxWH2rOXG7cha4
X-Proofpoint-GUID: ZMCVz6n4MsImCDLcAkfxWH2rOXG7cha4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_093929_660214_33287C23 
X-CRM114-Status: GOOD (  19.40  )
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

On Wed, Oct 14, 2026 at 02:36:43PM +0200, Bartosz Golaszewski wrote:
> ethqos->phy_mode is read by serdes_powerup() and
> qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
> wrapper for the correct interface. It is set once at probe from the DT
> phy-mode property and never updated.
> 
> phylink resolves the actual runtime interface and passes it to the
> mac_finish() callback. On platforms that only ever operate at one speed
> these two values are always the same, but when the interface changes
> at runtime - for example switching between SGMII and 2500BASE-X - the
> stored value becomes stale. The next serdes_powerup() call, on
> a subsequent link cycle, then reinitializes the SerDes to the wrong mode.
> 
> Update ethqos->phy_mode from the interface argument in
> ethqos_mac_finish_serdes() so that it always reflects the last
> resolved interface.
> 
> With that, we now update the phy_mode to the runtime-resolved interface,
> so any subsequent resume with a 1G SGMII link skips the loopback setup
> and the DMA reset hangs. To remedy this, extend the guard to include
> PHY_INTERFACE_MODE_SGMII.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I am not sure but should this have a Fixes: tag?

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
