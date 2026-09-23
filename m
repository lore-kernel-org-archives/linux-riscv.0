Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A158C9830E
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 15:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eezU4NRBEjIcFk4qJ+OoicKmBoWv4WVeU5Nh9tFVOuE=; b=j52qXXiuCgocRR
	uJpZvku/PSaA7ZffdZXwJwuJvM3XvyOxj/q6xUr9HOS15oxo+lmnCFrtUiNHp/hVkt5EZjeQY23tC
	X2Ug/nbzYi5somKFgAxOuF99HfHK2nV5gGDhxA4rgfjoTBkavEBizUvZz+zkDbu2siGYlZg85j9U3
	MtjD7/K9Hf4Vi1x7p0W2UfIzZLNcA/EenDbheeOQ14tI8/255TZ8dXay//X09sS62Xy0LMk2p9eJz
	NYSFfgd8XsSTTnw6Pv0xs+QqurEH+r4ArJV1tRRhpgHZ93cdiB1lIWg7fzML9VVjnYr9iJWc2vwvO
	vLja7I8Kv1R9CcSPO0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oh0-00000008em4-0OUy;
	Wed, 23 Sep 2026 15:15:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ogr-00000008eWI-0bjd
	for linux-riscv@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=QbX1HXxNcdWSzC0zsAJr0VKkQa
	1SRGSkHjF+rkpHBtNSOuPOM2j8GFmU4UZWdtgfsxtdP2NGGkHK+Ryiy9k+cZbQzb9WSW0wO8LGqLc
	+qBCIJ3Q+W+y8QcVREi7rxOPvS+zd5dutYyNDiLBDQFol7PdVqKnBxMfiQtyPrU9wakAY8Dpp2G8D
	qdD8l5YyQ025AfcqzP0ns8uWEBMCttyPWRobNR7iMienfyetmSbJLA27JS2alNGtmsdjBiclB+k39
	GEqjK7Ems8DmaMAcE3oHFttiRk2ejSxAAKZ6Yz0zu3Ph6xZ0sPF7ayrYjUXL4impXbBr2oZeBEbq5
	XgJ3tJSw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Ogn-0000000Eudm-1qnI
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 15:15:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKfmB322172
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 15:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=oaYnBI4FY86JFFj3
	NUUpWuY4PVq1DwIYGrcirTaLqvcQk/tmiNCY6/X9tXRqfDyhxo2AxQmecmdOPRo+
	6XoTmN005WvzxmivYvjDXyhSSOLn7TZEm05ri3XmUUtOpRhIQ4DRmS+q5BjFm1GY
	EaVVKxuos1j8XiiBf0t3znXt9blhwYVawv9yR1Qq0y2VD6pxmqEVd+9oIwpiNwlQ
	dcrF0fIILFrB0X+oABM5Qc/qSuZjk4kTc/ElbGTRrjhVpnzhRxMK4o5MyHvVbcu8
	x1zwYIk7NDQnfqHz851x0gX00BMUOi2nxJ63Frq30NfAsKsXZuOPyXSEyshW9Tps
	aIbaTA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsghdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 15:15:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c8337b12d0so447054e0c.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176514; x=1790781314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=fzWlUEqwBIS59MlBPyxvHjvH7WpLXvmtLYj7EdalA8TgRiiSNv62TiRJ2dRLuqZ00g
         om3Ph9L4SLyS5UxjFRe6IO/9oj70VfMcUWJ4ReOOp9hyusTOHOUnYVHa3e7QqlDXJ6Dt
         5w6y7+p2Nr0yYNfPTROsShExA3psOxwQRf0A4GmqCarRol6lMeAr/gPTQ8q+ty3tpcJr
         XYQp0R9TiMhN6ypqjPTUueycp6fxdCYMBxIp1PnQ07adTzmAgOVdq7Bn5ccMH9Adg8D0
         cuzRDoZz+R/Y+9rka/MwlJPnDDPd1LWJCi5De0UNPr83oXQiXr6ziW/CBH6fzmvenC7d
         zAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176514; x=1790781314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=uq2DVWV6zNWZDUhBGWWjSA849Fh01AnAVjzWmc9U6zMMGs9tHnhvRAJF4E4j0RRnWC
         WajUVZeysh3m5met0EuEYtovdO5Oh/yhV9ut25RBCsgXN6ha1P0bJXEjSDbXYHnvZnbN
         dCQa21bSUI68qtSC7TITpfa7ZNabUVzvwHfxwNJS2A7BwZ3B3xRi1k5UsyR1txK2LdbF
         etKZ8j6OR1+Er+pfiZZthxRf65G/9L2NR6XxNsXa0w9J7Ra7OECv9q+3/S2fX2cuIeRk
         WNTdc0A5t8EPjpCjGNyNMQBHnsKqQmFDFOuNWaeYXUesFY0+0He1Vtf2mwLHGLwyfFrm
         hI+A==
X-Forwarded-Encrypted: i=1; AKwUvBzVbTJDni/e6bCj7rMi9XVc+EI6/9eKvhi4yxMISLpx61CZVq1yB4Mp6m1WFfd11jcdBXrRmijfoRy+jA==@lists.infradead.org
X-Gm-Message-State: AFuF++kd0DE40lYYSa1uOCSQnqtRYQ3TVI25E86c3mfJSxteeV7tlzPe
	5DFGFvAxIPKKglQsSe0E1SUFFr3phjk01UpadST/qQ0+vRHsq872m8AaFHJcSPUJZRpajMM6TqO
	5K9Rcwhj1Lq5Yr0Z6RhBjR1RM8s9eWcZgsL5cEYcc/uUZWnVe+buq46xtTnTrARTOeH2Dqng=
X-Gm-Gg: AYBFou1UI0d98tkjj1HITxM4BSvAuuMeGpaZepH7JUjNvJmjXFbscvXmS2VKMK47Pc2
	+eynRKZ9qOawmfjV7r2rjNt9inom1/O9xSj1ICSed+Uj1+eX1sQtQT+JbY8bHM8e375qSxtIytF
	uuo/6MD70Eky/TVx83UHRb2WpNrSc/xx8u8KB4lyY6fnyonsjNFjS1OHOvtGtkyfDdoF/t9Uzqv
	71xrutYtSRS1WmVYn+REkcUPSO5D9sKeMpgORc35I9RWDJ/14zgJ0RaJuBV+kUj2EdnoPgc7i1X
	jU804vy0k8RhePHrk/6l4aTmVIgRgwIVvvZPN+2nbyNX0fuuLxL+BrVWq2RCDJJ+5QI64MbHJUv
	k+D3AM171Z12uOtGQFmiM2NAD/l7R
X-Received: by 2002:a05:6122:e442:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5c9f15a8529mr3242467e0c.7.1790176514334;
        Wed, 23 Sep 2026 08:15:14 -0700 (PDT)
X-Received: by 2002:a05:6122:e442:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5c9f15a8529mr3242398e0c.7.1790176513783;
        Wed, 23 Sep 2026 08:15:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:39 +0200
Subject: [PATCH net-next v15 5/9] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
MIME-Version: 1.0
Message-Id: <20260923-qcom-sa8255p-emac-v15-5-e82f33720737@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+znmxfJ65EaHdReTe9c8RxTkoxpSJy+BciHI
 ooUHTBSphqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs5wAKCRAFnS7L/zaE
 w7eGD/9me0usFPzjz9Ap74v8M7uevU7NNQu8WYdLzpmJBCHqK46zb9X3Qs31qUKCdGnsbihLbjr
 i7C+wf7iDiXNppsWiIlCGYG4rcfZr4DVYR31Lynd5rZ9PcdXo0M7xf2aFf4DsojYNa9fye3g3do
 TSI32h1enIQKeNqFocyf8COvMtqtaAdDYXnQOFzIfulM1+e5AWjLLse+e+ppmzj3tu3PJUlkjEw
 s/RVWFLLFDAhl+1Qb13GOnrTJjMPrr+0gb8aAX0ApIh21VxiWlk/lkP/UMboIQjsDMyr/0E5Tk7
 1M+nCLSLRLuJPVpgimvvWmeQWrc8t6tE+avihxWVQjF1yPTWqG6YnG5PPmhJK4visB5CI5gE+Qr
 3eI0RmGvllLQifmGqzMC6ivwn3DI5Fljv5hug3bePkXBkjR4eF91PptFTM+rRu4LU1RdWwKYpCU
 uTYPakyKgugnnE3+ga/iY/SfTfJUJaBscMdUW6G4VE3rDiM+0hg3onBrwKkxQ6iWwFqM81uTgJ6
 UdOBGv9yzdFuevJdpJe7T2JDJ32Zp+zGmbdn6jr6OAiyxz8uUgq+bYrYSCeB/jXsDjUtvQ+1Mbz
 PHjDsbKrjzuRXy32lDmtrXX0dukM9pTbcJN2PXKbKJJjF5Y3FtYhPaHU4ryuGcX9Lr9HyNGtWWX
 PHxpgsRslwWmWhA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX5mq7OtIVpQcq
 O881Wcb1tutNyY8UKU917p7p4q9exMQM4gmVRVaQnSigsbctjw3OBv7g8cyz+iSf36BCKJgkfNn
 2F7q/QAFyhZw1ILPmeCv5BSwMljcqKGZPCl4aEKcK5gvNqWYplt1OxRXLzTTyJsYwTBDFStCHVC
 weMM0wyoE5LkF/CH31EFjdnTaUvp0HTvTPv5O093wRVGZOO9yt0qUzA+v5gMQbQyRaTISnyUGAA
 CcsHxYT58UlmdnV/qKmTatKsVIBOfBV323TvMacg1ScK4uyMFXHMATeWbJuG0QRPpNmLk/eL36T
 cAlNKp5Rm72aCCMgQ78jMzxhbip43+ifsvjbtwKiDrXX8G5tqkiZ+uSh6csR4R+hsp5jSvMbAA7
 k74LeQvaNQgBVINXASxGa6ed61xZw1FfJ7NSeJyUaw5HfUEGsvvi0RT1aXkSFqXXCQpRl08jm/z
 /Smdo7aPcEQ9RWHVlmw==
X-Proofpoint-GUID: TBuan-DFs8ZJdfXK2F785cOJvsTEG2Ab
X-Proofpoint-ORIG-GUID: TBuan-DFs8ZJdfXK2F785cOJvsTEG2Ab
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3ed03 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfXwU01I5gXLzHC
 1jAgAU8sOI63vYT2AZk6xVCBDi4C4XCz88lNrBKclPk3J4piqU9mBDbPiuNtyI5nsnRG/YzT+JV
 9xv5kqs4fQiGCjFzUAoTr/6pDzlxvIM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_161518_102991_55182BB2 
X-CRM114-Status: GOOD (  16.63  )
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

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
