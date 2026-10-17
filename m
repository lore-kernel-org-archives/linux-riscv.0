Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1F5CCF2C4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJ4wuVBa4Y7+SH5f/EZ8MsV0LDy8kgkD6RsixjczF4g=; b=ME9txuawT3HXL3
	qdtDaPr+55nkIit7Bv9PFkQvXVjSJTiv2Hnl4RzB0pXy6doQ/KQCHs41Ctvwl/9S1UM5BoN2kv5l6
	2UfeSddeB3WZ4az87CGA2dKStTomDgzrNfOx1GdDRtaa1XmUHz9QBjquYKe/GFC5j/NTkPdJFAN2z
	yCx02oajJj6HtFRNGPj5e6GJdy33rioW60/4MQ4570rNGWfEfoBvaxU6+CNryfd/c6bwQbG8ipnvw
	LgneFifhqhdAt6L8hWLLLH9SyzS1eUyrrQNSz2LpcH1yZbgt3sm4U6h9GNdiAHrlE8v97dRbDo4iw
	e+oOu86ikgVgNc8uNItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7NB-00000004vpM-2OCl;
	Sat, 17 Oct 2026 16:35:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7N7-00000004vnm-25tp
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 16:35:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGAUWQ941178
	for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 16:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M8Exf5uWUb9cZkvT1EFUDPQ1
	TTQV69aXO+M/fGf49Pw=; b=SvbhEerpHza+8SdmQLIHmI2tzCGBloUXBXclwzhH
	3zvmJVOB8xwyS3hhxJYTNNiBUKV0XY8PSqCFVNpgzc6CSSWCLvfPtkFeAkh9XIK1
	xP0T0+G1nwM3GWS7HSfRWAo/8PcMnsmd7shqnuEJ3rpDIoglzHyWZguFMOBASYUQ
	xSZvhnsNiP058el1npRPaibWiTLs12fbApd83r4HIqKT8fCMA72QZOq1uwE3l8N7
	UFCDy0DUt44epTi+3yVj932X9a0ROrwhjoNKlti0uhJoGJp9p+GEAT/QwlAJKX30
	ztQqKDxqmquratQ7dPnl35V6MTTEyo6UTZRB8hrvMHd/Fg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se18ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 16:35:00 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so3798108c88.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792254900; x=1792859700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=;
        b=joxoQ+w115Ag++LsrGnwW9GgIp7ViMgAFIfQISUIslGla1nScZUjZe3i5eBw19DzKc
         lo30PapsGh++LhMhd27bSKIqFEkX53paxKTiczCYikfDr6BDPLQgFWhTHBuvKwA9xknk
         seEm7rLV+zbP8JnPwK7mMUCLchaI5sNVNqinJFVwJbaw7aLfRUC7S3UiJFaEB4b3a8Tw
         LZo8oDwxj83F+tmtEsuH0rS4ITUcarRyyhi6Wk4d53JTORduj0LrsNB3HreprsYQo3IB
         42Dz/OKlio1ATKrejxF9A5ef5PKJGazKHD5wIlgtKDmO0Hzk60xe7zSsF3n7GPVd5liL
         Jc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792254900; x=1792859700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=;
        b=UM2WwTUnLULfhp9TU9/0bwTWjYrfX0GFpaw49DOJG0VvV2Y8dgHQgkqmxnrqfJfW/Y
         a13AcJNekfEECLTRZUNSj5FMQc67V5BoFsW99bkMc9biVS2tXR975ZoJ6Zhnf1N373K3
         p3NZDvCOJBl1lbyRBp+yxve50LVbO5t1eXSDieR1/8tQFytUfpJXN/D7TZecOPGASEUX
         2Tsm77FgVKmWl8mOhcYSfK1bwXMCZprwfb7xVB2yv6sNBFgaVOu0W+dBRdNiKAxrTBDM
         5Sh4ZYBRHSUaolHgzdBMPoVHbbuwjTOcAH1+EEwTIXo/BWo9sfh+YDM/G2tpf0hJY6Q7
         4oSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLsWwx/Zozoyy7lKlyZbs/At6Nyi8p0ZY0C1XVSZBgI2JL1ha1OuGREXuadLVEGlWcKIB44CrGvBfVsQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLILV8jn8iIFZzpMMq9kRIv+3xYpiP5B7uS0FylMKnwab/cj2xB
	GUcBaYc71Wzmfp+vhq3gn/Ig9Za6aqjFV5uGeF82XdA+b7/fQ/59I692anQbxBkG7LeVpYjqCpe
	thFTi8RzvTSABlvz+Vga+WxI9P1Nr2X4S5vj7L/D9FonjhU39dQm9zKTjR7AzEJfo2bNnQ5g=
X-Gm-Gg: AYBFou3N4V4EgNIkFJRI6d9xbgqVTdfUKiUIu4YjTiOWLidI322W8WKcBqUKcBfJB9w
	dli39xyEMi3HTVz7r7L5GZbVnMc9SH7vaqc6uGwPL9y+Lfq2raolA8i8kLpSfBypGMptR8td7pF
	Lwsy5teEXqSNRy8L8E+lWwWDEL33vpAUX4P2fHf+ZA00MpOQiQd2YUvyEB1j4aT+RsxIt4Pirlf
	hnwXc41tsCBO0JpHUCfn6Oe7oBl+Z2vOthrDBGkzbF2HEOWPU09SafGtfpZCQVDIt3B5GVDFV/W
	0kazdJfDt7+hsyjmZX2cnDHRpAag8apnRv50TU9hIEUEX7t3RxLtLqIGmy6damoOYb/ZO8qB2aL
	u/jsp+iNdJ4kL
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr4814766c88.29.1792254899671;
        Sat, 17 Oct 2026 09:34:59 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr4814714c88.29.1792254898926;
        Sat, 17 Oct 2026 09:34:58 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm21415852eec.20.2026.10.17.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:34:58 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:04:43 +0530
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
Subject: Re: [PATCH net-next v16 3/7] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Message-ID: <atOjo+X7y3WniiT3@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dNb9-l7kRR3iovkQbWCalbOeOpTX8O6l
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad3a3b4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6xCJM4BY7YgkIKmfACwA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: dNb9-l7kRR3iovkQbWCalbOeOpTX8O6l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXxHAPisiULGJe
 0qLmumomK8gDw2T/lI+uEIzZL9KqDnbzUQW4yf+gGvIj4bPGylFwBDVKcjJxx9mHwSu2ilyTQ0a
 rJTrcQzTzZ9YNXtvCIhvlST0T5cPf4E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXzrjovnvIR+eo
 ajijsytkP+/6n70J4KZFGb7hnZdGPNxBw+/y66WWjSUHkpEFVxsN2FxG/9Q6VKdZyqQwsFLSr1F
 fZSsBm/cYHi7Wmtx5+qoX+KuO4JMstsseIzVEg9yS1QRwUlCbuVRR1k2elHwgJvppOOAIjMSh9+
 +zAGpg9f5Yg/Bm8uJEpuC2aisLj8KAPS7YBEe2JY7KRKKjW2W9qj/rVVOHoI613hR/pjwdaIh/9
 9YlagNEbnEgfw1eUlcKBKieovK7t76756rhovs/e03tKTP4s5tOyenx9Xa3p7HYkpq/1ne6bfL5
 1pZ3vRH5n98alUhkGi481k4A91uRwsM1Xvsk3UGGHzICeuHNzSbR4DfjIyNzSLKZ1yWZnASQQeI
 Vy5odtkBngHoNwAolLoVupY+04kYlw3YY/0+e8FdXWk4Lf4dd2DeKfze2GvP1FnNGwcGYjYEHon
 UepSz6BdRf0fZwWF5zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_093501_542052_5769ED68 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed, Oct 14, 2026 at 02:36:42PM +0200, Bartosz Golaszewski wrote:
> Call phy_set_mode_ext() before phy_power_on() in
> qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
> SCMI systems this is required for the PHY driver to select the right
> performance level - which translates to the link speed. This is done
> ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

As mentioned in the commit message, this should be harmless for existing
non-SCMI systems and I did not see any issues while testing this series on
IQ 9075 EVK, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
