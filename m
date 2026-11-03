Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095E4606D81D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ap0XuMx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWWjy+ZV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I8Y1FRUD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4pfFWWl5d0mmlJpMH9oFxRtte8A9S54C/tHVecxILBU=; b=4ap0XuMxNH0KGt4efo8cdS6t/Y
	qb1vLomMrIeSvL91H14vOCw3T5vHCjWsOB65IHo/57Em0UvZ+csGgii2PoyFj/C6fyrpo2dXK+9kG
	zBbht90MC78nFcaxSvjQZsNCOv0peRwfMpxGEHBiqSooJSOADkxnaucAoGSlzk1t8tWD0Cu7k8Seb
	CDfd9U0FSHEgGPsJa6N8gYa910aAO66LJyxEQQ09ZaUfhr+9fHS7Su3j4UiJvY6jLtwslfnWDQXXA
	67xxAAcKFNQEKzBW+SLJn2uUYKgWgKbpxX7ltV6e5JU6/t9m+XugERxu6vw7JMOp+/IcWuimT7IA0
	PIQQOX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD5T-00000002Hr0-2Rw7;
	Tue, 03 Nov 2026 11:53:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOD5R-00000002Hpx-0JJR
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 11:53:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3A9xIF3130752
	for <linux-riscv@lists.infradead.org>; Tue, 3 Nov 2026 11:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=; b=MWWjy+ZVi2QdM7hV
	mqTyO4PsXxS1DeaTU7F0pAhk8eTinZvdhnDH3UY2nWUpcmotKOOoNSkfFYno6zvP
	REV6ABDEPV1Mi6FxJu8o8aHXxbGZ4bqB5mDrgZsk6oUaMDz/uw8uPELXjz6h/pe9
	XHsfsSXDnizijPjlIkO1rH/9HbhyfxvkHInASLwANmxINNEuUt1A8Iq3uXhv8gzD
	jtrLtrSdpmgIjQyTpzH4p2jGLgzKVv405S9fxEOkSFBSK17afQ5ypntnmcE+zZde
	OxDAZWtoPjUvNfQ/RumMUqU3vTm1o3B2J1r3WtcAYbHiubHCK8T8v5pdvCyKmcS2
	dVepVA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94csjj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 11:53:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60a365440so2563418a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 03:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706835; x=1794311635; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=I8Y1FRUD4qiovavsoJnvCFs2CA827zI7s3jNHBpCexRAyRLauP5uxvRwmzefDyndOB
         4rb0MLT+LxcDmBqKxOkonE0HLOax8Xg8D8SaMbBZIZWTxxCgt6hJA1lS1Kkz7co66Q7B
         Nq0rKzQWL3eSmvJbQ7PDni972I+RnwLPuCBxmQVZeKSoNI5+dmziPnlNKO3pYK+TPCxE
         DDCEUZ2jBQby7dD6nSSCOi9oYjnWPtnkpOyrdaHgp0MmAXSqLvZ6WrAN7atNifSOjC8d
         AmZpywRgR/jPd0deCq4DJsrpd+nGPUE7h90ClvsbCfx/cWjVM0EyOw+RYpgESpDM+jpU
         HKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706835; x=1794311635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgssI0xYpOMAH5iVIdleET+YzqyBmZcZ+a8GZf98ttY=;
        b=dZG9sCjAYgzZBKtDv+GMfYdHuNfnkFTM5EuRDl27uyZbDSzNRrTkN/1T8MBWb9foRb
         vg/9/S1ZNJuXM3AO7XHKVSmV83cGPpNoiB8b6+zoSjXmO7vDWrFgCI0y2e1ORafJQ8xS
         1WWWjtAd/+nVmDGDCsyPu6jrLlfhECMMrCcvxRrBfDuWK5lnh3GMdiYIwtbsgJqNMcro
         dyYd20ZJjlXPpZtUFr44ZMOp4BkH6zKr9HEZqRuKQhoFjYp/WAJD1KQcw3n9sIKebZ+j
         uaQ7Vye4kLT0Lfl1Fpp8V/rmxURerEnnF4OogcrdMGyalN5LZ9C87pcSn0SQBGsqTuQ+
         P1Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzYFzjTxcPzXqR+kYOUrgM2Y3g19nya5dtxnLChuzlBPF4qPJ1QGn2A55jo4M0/nHgj9+fOB6LBP4gcrQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/pp7tjphZONyVc9Ot4j+JSThDk15CxTeZGU9fgIjsc4Jz2mu3t
	eWalrPgzRjgBLNoYP4I+1TNa2qS10eVsR+Qe5uYOCEWv+0VeTDMalbeIXWDPA8hStnD2kGvUv18
	+0OhVuYZypJxgyrC7hXL01cx9aSYqfHiRmba/Ujk5UxL+EKwCwigittCjRE5YpoOQd5EiTG0=
X-Gm-Gg: AYBFou2AVvoVBkJ+QPvyhAPfQ9UmuUbDg/7BK6ypDTObpzVZAPWoDSr9e7Zc3v5ktEV
	qCd2K69vIPyGltr46bon/Mv5myufzmGbBM5OIn9y2rDRf12E3p731SSiR0scL+yw/EpbpoHy/+g
	D9Wly3RmHgjcmAnzSaFEMHaF2RcbZL/OUVu0FmW/5aP24aHX5sBgwOs/JtcSXxNw/SIVLdOV37P
	Nr8P0XWqy7o7uR5oVXK589rYjrhiW6FydqIlWN5LmnjzNMxH89c6ouBibxu9v+sqDr1R5JdG85B
	lEFA4VM/tW+9gjRp0bnJqPIX2DGXcx6T4rhue9l5FDB97qbf77t4q/YfTpaaIyMyPikL1vjBNEr
	2AbjPS/lMQpL6H0jB5I+30jcucko4st2FaZryJJANnmNsWEOL/eF/7DtnueYvQRNmuQ2FA7K6V0
	Go4Gfg/g==
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480915637.79.1793706834802;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr10480885637.79.1793706834326;
        Tue, 03 Nov 2026 03:53:54 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364cb511sm1161045a12.28.2026.11.03.03.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:53:53 -0800 (PST)
Message-ID: <7a873a59-247f-4e4d-ad30-32bb504da40d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:23:34 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>,
        Ryan Wanner <ryan.wanner@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Vladimir Oltean
 <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
        Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Tudor Ambarus
 <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laxman Dewangan
 <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
        "open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:RENESAS RZ/V2H(P) RSPI DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
        "open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
        "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
        "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: vkoul@kernel.org
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9cb54 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: VIvOFt-JDbdXTEjxUc8A3fqkbfsMOuBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfXy5VCmuWuwu/s
 7c7VqGEyPVxPHOcIfh6Qc14t+j7pI66U1gqJxkc0w1W8p5cgqLlMpITfR4D3A7lDAqniyiXl3/T
 HQYju2/p2jaLn3Op7XibsJ8MJG2EJdJB+OeZb4+aDWEXK7Th4PhXE9Jb4+KSKSANOG/Qop26Q1Z
 raDzY0OY0Ftm4s71MgSQn+P1mOtowKLWmpVtB3WeHBz7R5gLfs+d3mznlrGEWOYXflfPdsZ0Xy0
 XEJKaYgLv9t07eWaOjvYyYzR/lRMS5lfZfE36JjiLUrnR8H2iXGEylgRAs+SraKVgt/XE1/+zRo
 LZtFKVCI++P0Anb36Wzlx3Oq0Co8UGMltq+im3ZxO4Jd2u9bWniGvfa2hcbKG6N8/gVUKVbH1W3
 PBhTc0qM5LNLHGlxRFE6kvqUVhD3M+RGSm7VukUbemjb9LuE9vcX+wNRGJUwR7vg8bUNKXRuKHv
 1vhdoOKcYoa0QtIXpMA==
X-Proofpoint-GUID: VIvOFt-JDbdXTEjxUc8A3fqkbfsMOuBr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfXx+KXZdwBtCzS
 bLm5aFWMPTD5Y0b3HoncHJKtw2Zk1UJqqP++GwnblU2hsCWlS5SuHQH1kubQEQcCAqe3moIzmtw
 CKDi7mMur6g8/c4V/xXR8fCmZdCfEVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_035357_348918_1063AB84 
X-CRM114-Status: GOOD (  11.88  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/2/2026 11:09 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
