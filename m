Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA59C98312
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQ8ypxAJNVyg3PMIBrtg6BUyL7MkPzpOy/DxQ1SSO8U=; b=Rh2jh5W5REo2nt
	+1xNpJuUZ7HgddJ5Equ9nzyVJgCLiY0+KIMamujtLyKBy1wGJonjuHUwNC5i7OUt/hb4TjJTmVLUs
	dwL/rHUaOGyB3iM+y31Lpe09lxVXdnrF+jW7cD9CWDV/57/gt3+TLnO+gLWvKH+EeZSP7OUQ1srAH
	fmfRY6xmIxRapA6q2upQOCWdNtZs8T3SGS7K9QjQkzBGidz89sUf1ghEEUgNn+/uRYFdpo5DNoYpO
	0uDBbKkwDX5rFnLHaPqJDBy7/MtXoAGpaSa20F0Gqngsvj8jKj3wINtVIFCCdS2lQuqZJK0JTIDPC
	W276pwL4wAFk27PW+3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OhG-00000008fA2-2znP;
	Wed, 23 Sep 2026 15:15:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ogy-00000008eiC-0EXU
	for linux-riscv@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=; b=SzE5C7qhp4A67Ze0stLidTmjmz
	/QC0SzcrtV0k3ovyxSiOAhAHxPnOZMCAdzLoI2VyBr4QYkTGCBCk6oWPGHZhjn3mSYp9Mb8hnFA5/
	I+eL5+X7NSjgWmyw6kQC9NLydtIOOxEn//RNa4WDBKDZLWfIAE0mbiEtRI21B27qptPrTVs3afpZ9
	mlH563aaSetOWKzlLGcn44LGXU7PieP3EWk06sagOFqPN+Nuf7E0d5Q6FzBng/ARrZXcpY+6dDVdh
	I08ur/tDngQrBNYK1ai4/Wup4ljw+2zvPtjNHIUeVYOSAA6UKEEeEtu5U5FoifzKNTgEyQ4VSVZEe
	wStp2eIg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Ogu-0000000Eugw-1iYj
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 15:15:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbkoh3295824
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 15:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=; b=JRSw9gHfksg88Qsw
	N6ZIdbTQRXx/1fkxcWYaIMUbHvUMs9Ay2q8ex07vCBv5ce0kyLXKG4wcDn67DMnk
	BX7tlRuXwPVrXVAEleHZTD2c1PzsDrN+34cNJBoQHdaCA58jPzBKhzfvXGjJ7Vdy
	Cieri7vNBZSrGbxDTaHjT3reAehRtAStPq4g5Vn46f2acTrEDIgOJwt41O0aS+hm
	RyZcOaNLzBO5s0ruqu+eRHQ9yBWr/ji1M8yL2frfH20T+wv2ZtIQ839v1eMyoxvl
	A8v7vCIa1qHu4VVrTYQg+7nYnieAJRhYEDmi+5V0Qx1oa847yNImud/w4FJOsqgY
	o7lJBg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm9h1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 15:15:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98304865f02so876117241.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176521; x=1790781321; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=;
        b=grdpoK8t74asyaNxMYjQ+8sCg+09+/1V6GzT+VjHZV8XjsLjSjQADML7edEDmmrw8C
         jKYPKOgoZlTpEjr11oTMKiHJUYp8QSJ/m3dtNTOO4s8T4oKALVqp9bW+fAL77a8+wCdm
         rf45gGUcAWH2d/FgLhyqfYrJ69lk3eAH5DXYu8nfsvfvxNYgGobMvt8iLfThbTbHCJE7
         z+qDixlJiZM+/XYm+GNLvB9uQWCvK3gn+l2WWfLxOiFQc6rXRbSeAu674dGp9bSZ8Q9s
         tYjjV+2ftNPShmL9eeN8bFZWWgYlbk1Gj1fO4Q2VL92fKYhenYtmofnak+2SaspSQC3d
         PNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176521; x=1790781321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=;
        b=DaFZ19RihwEJFV4+Lc8syhAYwWtEUxbMZ6/ulY9CRw/Ax942Z7sR++ELFEXv62GGSM
         +APn/9jAiOaLqHTo9HbjEEE/1dp0b2hbxP4+aN4Mn/G5TRWsBsyBveueBwy5Sy9DmQoI
         fuyjEBl3Rm/jd5QTOgRZI9jF2CHNyO4zbJXD2d+AbbNYOtjlm1jjxUZFZiD+boWeRZIo
         L04y4jv6TrF4gFdAUsvz6g1zT///rVxrKQZpGy1NbmtuEVc9A5cpQ97cINvjvhjTm3vI
         WrlpmuqfIL8upcHnziN58Hdjf+QJues9kRhb1t5HlTHeJu6d87E8+rcYyCFlK/O7la6I
         daEA==
X-Forwarded-Encrypted: i=1; AKwUvBxQg9yazW5SK5z3JzXAF9PHVWO47vF2cZTl6175NFHcTYYC4VT2ejYaDiJa6W9WAWcTWKLCJO042C10dA==@lists.infradead.org
X-Gm-Message-State: AFuF++nLF3WTGcHjDEg7On/wLny1mbsvD2gvXu9IarJMVd50n6eS0f6J
	AEUeJsJfQCsgAb47twr0abfM+L83PG8kUe2rlZhrJh1cu2ddmNZrAixr6u+WSV+idrjmVMm0KQc
	6y2QCUbzd8xpykKtbpotdXn27p3iRpnR4WanaRWyvivyNAbihB9QmdBzT0jeGyDQOGyVNFr8=
X-Gm-Gg: AYBFou0mICZeh/Vob6/F7COUHwgm8JvJYp2X+1ADeN/HRY+kRdBnGHqBFl7IGVTtpjg
	phVivvXL48r486QunjtRrENKdZwPt5mQC2R7L8+R/gnJZMfQeuCY9cBoMral5xpMPEwuwJHawTg
	lg+Cl62G9wSQnfr1gF9/yu7oByj2l14l2TIaZ/Gsmvo/zqKr5xjLmEmCksZ8y1jO+fL+1f+TPKn
	7tAn+iBwacMV/W6QoPvkO4/5DUTfLsB30HdP9YDp08X/h5y5ZO7Ri+qSpr547zh91JgXVxskUVC
	sm+c2vO4tieHdw1j1QSLoxigR3tyB5FH4kDNz1pm9WpnFu1hfGuFxKCDDaJ68kQh+Q9W4945Jr/
	nWvCfUxEswmkOUsbZYTFFLeeu7PROwT0nm9jNTs0=
X-Received: by 2002:a05:6122:f90:b0:5c9:a60c:2739 with SMTP id 71dfb90a1353d-5c9f167a1famr3436193e0c.17.1790176521359;
        Wed, 23 Sep 2026 08:15:21 -0700 (PDT)
X-Received: by 2002:a05:6122:f90:b0:5c9:a60c:2739 with SMTP id 71dfb90a1353d-5c9f167a1famr3436135e0c.17.1790176520881;
        Wed, 23 Sep 2026 08:15:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:41 +0200
Subject: [PATCH net-next v15 7/9] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
MIME-Version: 1.0
Message-Id: <20260923-qcom-sa8255p-emac-v15-7-e82f33720737@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5580;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t8otp0UprQhPEc27ImF7K2VwOwzg/wYCq64pw1qmrCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+zqJdKQLT3kgkxuoLKDYmAZKJ8awFaUBTtwW
 s9Dw0UlefuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs6gAKCRAFnS7L/zaE
 w5fVEAClmsIFOqD2eSakxDBGvKI2IkGXhpQSX+NyQ1nAfxyxTdGYE9togbFFyeMNpWh/36r1D10
 OJ8aPAKyntdp1JaJUytuUuUSpndi98YrXV2ziu48uMXVvekAkxk+BzpfQOoLJXnF6cLYssvwPl+
 gNSnYU1kV6asKEdfkIsINhPXnka0cF8BLgqj+MasxjRfYMSxA3ONzUWKiQQ4pZRyak1LhTtEiYY
 dI1h8GxbBNnE/K/U+7jhD28w6zW5nS1+Wp0NRY+WHNVoH6If+uAWm3Elhh2yFkR48kmQxRmWQDr
 XOoXvC5OpgQ/ckOyzvddVkiGdwye8Jq0lVXvWv3zv2x4uJjKno2hUASosWFGDVqVpf6bvfzzsG9
 IN1jB4M7DeeJpwJbyiSVTsqMmmtZXbIrYyToBzDJZB5kjYEY3wcLTA58RUE/LwbwUEBYxLi49bJ
 XiKNEPDBUa3BNMtbQlnB/wpOdZIg+TUZQA7Oaw5nO84BA9UD8S0FVfx7nj6xznB8nY3U4knMYN2
 aVIifs4mXZreeG8ydGpV9ZEJ+VM5VYT9wQtG4kSC2Gu/S93ZZ/x5iGwdPiXf8xJf2AtHa52kHej
 Otvl8kAb+QPX7rjmOb2NijCtcHWpMyUijq3I72rdIK2kMS8rZ6pZcc3Pt4WfkHta91krio/p1M0
 cmqZGAgdL4kRTHQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX22TQV3Sj3Lbf
 EpEA8ULFvM2O2ilpuibaVvZH+X3CqAReuB4PWhTD3KkYCxcNzCDBM6ZliiUfBvFJLc3h3iLqs1n
 UFaO7lR9gSdzkkRgFQggzh29O25qiYg=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3ed0a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7cvh1xCDNGPN4v1KGpUA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: mF6HiiBuuRl3fybmRChiTi21Z49UKnQR
X-Proofpoint-ORIG-GUID: mF6HiiBuuRl3fybmRChiTi21Z49UKnQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX6cvU/CFI4WN5
 Nl828TuwRVeiBTUbDL4OmjbsSRHDgfpCRwIGHsqJVgwLJwR6LdSS8Hzf17dBGHBcPsyxM43utm7
 Mfo1rx3RxARDjTz7gszhLhqIYOhrtFlJ+y2BBijQWbeuEUdlLbdF+iPF39nffMVXSHsyt8uLIKu
 X/+ZDJucZpuIg+UC0q3cCpCFP03s/DOw8/kRPARegS2ocn9MojAJYydi79p5cjBPiSYkJLPZ0em
 w7R1ye6P3rcsr/IgZR+cXhUZK8nJnEu1X6WnQuyjwQjQxMlpFof7rI152bM2M2YUCZW8/yl+26u
 MN8cmdntPu9bOlGxtLXhiFsgUJvLe3tsNtj4zG40NbXiDMsPNDuPgTadnmuOvG0dVkXP0LZw5IU
 oIb360ajG+164GXEaffEQMuhUzVg0hLNSOtqqMRzdVwxwBbKH3YXkm5VyKOUD6I0RN4wNsqSIg/
 w3NEHgqSjSRvHRAvJAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_161525_040853_84D06D77 
X-CRM114-Status: GOOD (  20.92  )
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

Instead of needlessly copying the fields of ethqos_emac_driver_data into
struct qcom_ethqos, just use the address of the former as a reference.
It's .rodata after all. This is done in order to avoid having either two
calls to of_device_get_match_data() or having to extend the latter with
another field when adding support for SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 37 ++++++++--------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e067ceee016217c49d3b3d572fd9f33e562d1a75..ab1bcb7eb18e22f01556c190f7d8cd8eeba4d0c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,12 +103,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
-
-	const struct ethqos_emac_por *rgmii_por;
-	unsigned int num_rgmii_por;
-	bool rgmii_config_loopback_en;
-	bool has_emac_ge_3;
-	bool needs_sgmii_loopback;
+	const struct ethqos_emac_driver_data *data;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -189,7 +184,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
-	if (!ethqos->needs_sgmii_loopback ||
+	if (!ethqos->data->needs_sgmii_loopback ||
 	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
 	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
@@ -323,7 +318,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	/* Set DLL_EN */
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_MCLK_GATING_EN,
 			      SDCC_HC_REG_DLL_CONFIG);
 
@@ -353,7 +348,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_HC_REG_DLL_CONFIG2);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
 			      SDCC_HC_REG_DLL_CONFIG2);
 
@@ -433,7 +428,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
+	if (speed == SPEED_1000 || ethqos->data->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 	else
@@ -457,7 +452,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
 		 *  (2 * RX delay ns)
 		 */
-		if (ethqos->has_emac_ge_3) {
+		if (ethqos->data->has_emac_ge_3) {
 			/* 0.9 ns */
 			prg_rclk_dly = 115;
 		} else {
@@ -473,7 +468,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
-	if (ethqos->rgmii_config_loopback_en)
+	if (ethqos->data->rgmii_config_loopback_en)
 		loopback = RGMII_CONFIG_LOOPBACK_EN;
 	else
 		loopback = 0;
@@ -496,9 +491,9 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_rgmii_por; i++)
-		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
-			     ethqos->rgmii_por[i].offset);
+	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
+			     ethqos->data->rgmii_por[i].offset);
 
 	ethqos_set_func_clk_en(ethqos);
 
@@ -512,7 +507,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->has_emac_ge_3) {
+	if (ethqos->data->has_emac_ge_3) {
 		if (speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
@@ -539,7 +534,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		if (!ethqos->has_emac_ge_3)
+		if (!ethqos->data->has_emac_ge_3)
 			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
 				      SDCC_USR_CTL);
 
@@ -750,11 +745,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	ethqos->data = data;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
@@ -791,7 +782,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
+	if (data->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
