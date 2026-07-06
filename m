Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D5BC43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0o7GmfycaRmqK2myggj313sZ7mVuJyVztDqG+YbcnE=; b=yAK0I3czpi6OKI
	Za3Qi5XBMd/wOJmI12KdR9M0C5Pc0w3XWYjr+S6PwutgQbTtPRVMud+AohSvngSku9L5/XeiX3sg5
	1Dl65bCGlpjovy+kceYZyruOwUUT8CmIW068Ddg3iVWUaxQEhPRY0yvLrD6CjuNa+V0gt5CTl0i5b
	Ovo9hR1Yim0dDefd2iFaPX89olMXtn6wuTFaKA9Q97h2/nu4lf8AjBk48d8jim5/R7mucD9VJZ9sP
	He7dtX+T3oKMynSvBcmCRp5v59yxk2I6+lH4pp0rWCEcOnCpdPAX/oxk3HNohp21n+vSw+jdzfwrn
	oDM+hZoTKGCmxDWnIaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjG9-0000000CZWE-3DHV;
	Mon, 06 Jul 2026 13:21:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjG2-0000000CZHF-0HB6
	for linux-riscv@bombadil.infradead.org;
	Mon, 06 Jul 2026 13:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=; b=p0f+NExMXVqTsChA78MlqRabfn
	i9ntOzPgKN6DYgNUBeJBfrYlT1zqkh2mh0svcpkt0QGnNKmKuE2D+pu1UsjV/M/o4Rvx3Oahu7Syb
	N5giJv89T4sk/sy64JpWPj6BYM0RzNI7u6Pysh1lj1V4BTXBAv/NxfvTokZXAVhJzI8H0ZDaVFL4N
	E03aN5zR2U4MAziZGi9jRHVrnuBZaW+as/+nGfMB+j2BUKlhZ5hRzmSe0QXurtn6VsONxBzJ2BsTE
	rYyAo5vZXnGZWkrFHF3nYF9pIx4r03aLpYn2EoYptoXw1SejmLpCZnm6wP+nPI0qsgBlzhI+gFWHw
	gIgm8qEQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgjFx-00000006aAJ-0dms
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 13:21:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax7uI245538
	for <linux-riscv@lists.infradead.org>; Mon, 6 Jul 2026 13:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=; b=or4nvSXMp6OqVfrb
	eTPyTd+JNIs5/y38nBtVyWwIiW27rsBdQRdvx0sqzDSt1N13hZdTRnfo3Os6Hc8U
	Y/gk63ZssPZx3V1THQq8OpawsmWcXnUX9kWKPu8qJZpYArT2IiRRxuNPXXcrvR0f
	+7tqkw2pHa2e1blkbCqdhFPwUcX1XSZNNqFS0yzqksjTvbvPrVa8ZbtkuA3Mv96R
	kqAOYnJhAaM1A7UYZBsEg0GK4J5pLn/PgeXTlkEpgO1kvSfFfDeYNfoawKv9eEBL
	JGtvkUNAI+9L6k7Fyx+WBSoZt+2d0I3j9JhzEJ6amrd6l5hLWYDqGzNeaT/hNHiG
	XAl5uQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gqnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 13:21:00 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a1912d5c85so3873114e0c.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344059; x=1783948859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
        b=fPPJ/ceoHvOT6wkUZN0/Tm5vr+CP98yTuzJKnZ+VvvLlCn+f2o8USmAqKLxd34t3CX
         XD4SqxrMmMPVLo3vkq4uBVOp2GcJj7k0qmQAgFrJlEGviskZNfbDSb0URyeE0aFbQv3A
         vr7hFvdyR+W5fgCRRpHvPjJYiGYmLfOaDhb3pRd3vC+ePWMfbn2f5ZfF61XjbeUW1ljN
         G1E1Ym8mXhq3QSkr2hXKXzZYDx6irHnnApqrbj7Ao3g2lRhh1mYeqKpPJlftDou688/k
         roLvpQHTJi5KHXoSxKQLPV73KBl0Y8fH7hM5G0QSfBk3rWevSbSansUcDit/EyRHSNFs
         HqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344059; x=1783948859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
        b=QjRQ7KoyKqErIgmIXh9+M7kNVAu3MKlucKMq3ug09q6pWFW1mb7Mmrz5FNlhaewdI/
         OPCbYUsU4rfMZ6LusFiGtydmusX5fbuoFXjOEx+mZ9WRfzmYb1fsU5EKVZCTl6YJbMCF
         N8Gpcupduo+MfirFxDb8OxE6G3GaAe+n6GbPBcftbLSmwWa5HcvUqseaIaxHKI+83apc
         rFdomjPNkf7nErWKozgdX4E5pI3Wi3DpB9Jh8fTiQrKhdEbxN1yH8xNNvoRpSVAUhoEj
         /l+MkiMvxwk8FO1x+6f21fRMl+a5zPmeIqzUAsP2JmEncuamcZ75pBXTBGx/aIVNi2Qf
         8b8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqHUV4pKxKyL5dgM6zSuf060CeAzDnANhsIu9Q+d3FAMAIRN9nBcqFRfN+eAVv++JSLjBHqtUQpFk0FwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2IQbE9M1DCahFJRwsZfbca+beZ7w/LN3c0bktmpcTzrJkfaXj
	3L8gMX+TtbvWUSRz59thG8B3r+gUWeTPp7JN7zntsSX30YVGn66b5V8fLGikN6xF5XDmrw2sNys
	lM0MSaYz3UNzRSck5/L/5BIg9EsZt5QqXe8TQRDZG3mb5TiQMsYcq925BUdQ9s+1cEFU75V0=
X-Gm-Gg: AfdE7cnmMwlqkcebtTB2puIrGgpdZBZuajukmpM9czBonPrI2HyYmlrLX5RtfJnmGaY
	toDbl8wo/IqqbMHvbVu75ADI2SHlBTiZtoheYzywY9NjDC4r6JzxQc+7F2fm/XXc7OqhufZrF5Z
	GAh3tC8bmrYh5H8r6d5muznG6JjXMua/sQLAdcnGv7cfqr5QK6UN+ZKBho4rpk1cTJpBf09qyH/
	bFpQJs317ENnKIdHtli4P7MV03/1GVcleicjSsuaEx7IkNXqwMqXYClfL+8eXUDJ7zvVPkrU2/5
	01A1ByKRc28xBHP+g4s7yypqQApISrX9Xnz8OMb4VnExHqKtwNUsRT7GHUcfuSl27CyMoX+ZtMn
	ilblX33rkbet2oX+ovFVhCJF6wygmDuIi9B5D/2JV
X-Received: by 2002:a05:6122:e469:b0:5bd:73b5:6d25 with SMTP id 71dfb90a1353d-5be9074e753mr306802e0c.5.1783344059156;
        Mon, 06 Jul 2026 06:20:59 -0700 (PDT)
X-Received: by 2002:a05:6122:e469:b0:5bd:73b5:6d25 with SMTP id 71dfb90a1353d-5be9074e753mr306757e0c.5.1783344058691;
        Mon, 06 Jul 2026 06:20:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:22 +0200
Subject: [PATCH net-next v12 7/7] net: stmmac: qcom-ethqos: add support for
 sa8255p
MIME-Version: 1.0
Message-Id: <20260706-qcom-sa8255p-emac-v12-7-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5134;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlpwRA2B5tVQ/D/s7B0Bufz2lMNZ9fNOyqanrb1FAug=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uitXkpHF5K6Rc5H2juaPjDX+WdM0SlZPmHq
 rC+rjBIaBmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurogAKCRAFnS7L/zaE
 w9V6EACRebpawQe2y7q8VZHMF5Y42eILGxBCttoAm5H65PSgUVQIlUwIiie91TITslGf5GkfU4R
 NZDfOFhlHZP8QhMdbPo0XqoQ24wcBD8Q+U5WU908BLcT4J4OCJtcMxuNOp/rdZQE/E93Sv0Hd8l
 OPhrOU0PTH8fhGTchTD2K4tQFgb7pr90RMRAppVv4SKzEiyAUvj0Ul8/wX3Q0nFimqcHscKdkmt
 rbOE3KqwsPawJQX1R0sunanImePVYIuLYlDCRqsd8Gs7bGG7+o3lyInW8dgSXu+lgON9PVN65wI
 mOnx1/MU0yLT4b+RjKoJIYA33MCGDelkZ4HCnA/tfDnSc4IqkBWxnruSz5ISHLkp6sEt3zLNKsL
 lw/xWNA4LE94yiHdgvHNGYEjFx7nqlb7jdBHJWYoQ/Kov5VL2r/XnAk1rbZgJtwFMEn4DrukCKS
 HBfrU5m7X+z4DZ/OZDXgya7jaUGHXIWkEFzxJrPAfxQgzKmnS6ZCrbAkUJ4mGIBXu9cGHjRtUs4
 Bgpp+/XklqZQJ2Ko1981ir6hFumr8jZempLQegHyOBbH8UsA+zWcehfiLbHbBYjDJ1mKUYeLPle
 N+SxIr4y7GDZ1lBVUVVonzUoni7lV8ckMooMvUb3Sc/6osTOnmj5+PxEbF6JTEiBqBxFBHUJDMe
 xp5lM6RKQ6LdHJw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4babbc cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RTgpwGSXUauNkVmvBPUA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXxojNPhztIJpF
 qb4F4p5RjVAppdn/0ljfFRlLorXZtZE36fbK1QjA7LYKCWgRKXR90rOj+53kWxeSJs8C3kRll1A
 HozbkbMYg2ird+GDc0DHm9U7txbJMcXmuDehQjeN3H2jJNGLP0YDGXNz6xC6Q1IFJ68iLq3feIs
 KZcQaITjWUY8GX0aXcqbjgZPxj1/ZuxCVByn77C63RNAOeKS3IMaZCI93mthDERzTJ4iAQDnuF1
 uB4dWqb4wbMEwwz5jXF82dsQUdJpmWYtnvugkPhEBJni33M8KitpBQJECz/cwJndK4xCqsEAhRB
 S9IHCQyEBZPyptQaQ4CF3vdNObZgR+VRqOQPSoQwLfOZEgaAtBBY6HA+M3OzRvPhWFdAPK8Ce5Y
 KS9K5C70i7SFsRz0boOKvJCkl2CLXNRTZf7s16ewzkmMD5//53WZIt+8Wzlhd4rH3H5qjFGe32e
 T4KU/WHUQ+9N1Y8D2IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX/8InZVKDl6zz
 HgVlKSOE3fHeN+nzZ09sAs2EakKcy+krHRfCH5tn1emsABSrtNs23zNuolVlJxuehefnwRFvxOQ
 eqIJHsXgXWY6WXWCFnYWfhZ7mNWofJk=
X-Proofpoint-GUID: eRbYkr45i_peei-_YAlLCYpBhK_5gbka
X-Proofpoint-ORIG-GUID: eRbYkr45i_peei-_YAlLCYpBhK_5gbka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_142106_071271_437A5B91 
X-CRM114-Status: GOOD (  23.47  )
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

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f379570f80680e96f027873cda6a6bca398e22dc..47175670a32631369a2cf8b00388d9359513e090 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -108,6 +108,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -206,6 +207,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -310,6 +313,29 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -749,6 +775,62 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The SerDes lane, its clocks and the MAC AXI/AHB clocks are owned by
+	 * firmware and brought up through the SCMI power domains above. The
+	 * MAC wrapper itself, however is in the kernel's register space: the
+	 * mux that feeds the SerDes recovered RX clock into the MAC's clk_rx_i
+	 * is not configured by firmware. Without it, clk_rx_i never toggles
+	 * and the DMA SW-reset polled in dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Run on every runtime resume, which stmmac performs after the power
+	 * domains are on but before serdes_powerup() and the DMA reset, so the
+	 * wrapper is always configured ahead of the reset.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -836,6 +918,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
