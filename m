Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5D4F4645C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=54THg+zvSo7Lj64Cpk/tEYNsgxkTbtYAPlVh7x3Ywqo=; b=Pkek+WrDuPFc5Z
	DHI9NerjpV7lJLbFDZTa1B1SCSZJEh0+krA7FufChTWjDkhJ7dCLIATetLi29UEsq2zPpNTy6u2uw
	244dJKK/xvDTcUdV2XkRVgtyQAkv7k0KHD29tXI2IcOy+UfpvmhSRPAm89j4urFbsuaN6tyDM2tBx
	Yq1RpQd/kLiAgzurmO3s7Kd9vtgKryk4D4NCvDu3YdqaUgIc2wllb5/A76P973du4Rf8eRASGfXwa
	TKyupcavnFE31jAeVEeN+oxsxMhEd8klHi4ct61vWyo4+9UU1qzFY3x+SaglN0rDoWMJ3iCKsSC0w
	vEddEqyky/Y4Oe/00G9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hX-00000003sXz-0apl;
	Mon, 16 Mar 2026 12:05:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26hU-00000003sWJ-3MQw
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 12:05:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBfBYB1282129
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 12:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZTO8oEFgM9U9IXKc2x7wkL
	2nE65XsgEjr+eYsx8KzP0=; b=CHd/RzAkbeqYCeeBnwrKadFqVVT+izjbOh8IU0
	+i2q3Ll2H6RT/fHqi41I/b6TtTo56lZ5Jv5HloGZzrXmhiwaqdGKuyG5wZtdEFJF
	NwQ7wvCWKj98nGC8VwQG1gyJkYFjhJWsguqFoy6HDEluzpdTaRCqIhYO1NZo5/de
	T/6jf+u+6x6yADh06M5e1/cDtLlXBVAdlB12+cCJcWE553k9ZSiNwjA5dzSD1tUl
	7YvHfZwccw4//SNMQwHbR7FCERRouKm00fPG+OWnmRZSvFGbdZ05mTSGATt6SqpX
	qhtNZpyGP6Vdm5YBUzpIqaFAUmpwZAk2RoFyTnU6MgFzFL9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc5g69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 12:05:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fa82ebb9so152666746d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662735; x=1774267535; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTO8oEFgM9U9IXKc2x7wkL2nE65XsgEjr+eYsx8KzP0=;
        b=LozwTQqbYxrzeiFz+DF0ErecIdxAPySTuWjstx6rGnAq8lfm6fDP63Sc7nbKSlyO6V
         NzbOAGv8SZRXtSDjlgantqHSSJiOcWYIJgkH4chpC2Ol9l8X46EYxCem0PeaqFWJRKF7
         P15dxOHZo7qfO22tgbp/spCKN0N64WrcSd9sqs9kfMEFyZs21gt1NwxABmB1RZyGYtJV
         rbQz58hE1ZepFr5t/hPjZy7xotuSO2sXbbTX8Jdk+I/bNA/qZEAwQtFP0K8GBd5BMEiJ
         xy7+7bt4OUZo/+gM3mCsNKY8A9Ix314kKmcADU1tjJ62cFfOiIBN1y3KUDt+azXat7K+
         eLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662735; x=1774267535;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTO8oEFgM9U9IXKc2x7wkL2nE65XsgEjr+eYsx8KzP0=;
        b=UFCB5W0YSweka8lBtcxjYJTb4gZb5lKTzm7EmmukJ/0j8TZwIERSiS9IKNPfEWrH8j
         fywM/7MDlEbISU3nZOmFsHtNPobSHp4mT8PXdYKWd6CpTtCIJ/DxlU7ydyvRPS72EiMR
         I0dFoensESZ+TlMWhRpZ7qgqdbxkVhGjFZUwK+tBgwr2MPhLYDPllfM75F7aIFXjq8BV
         h70LNz6bleZrZuapVa6UEE6bl9gbhh71A8blxFl02ytQn7Do4TUShwWVYRjdJVKFX08V
         fnFw58/iom8lQRbb08PizQtUPQoMXKY+w6KtrlnpY1REHUapByxV9psPCxhCqIdpxN3D
         sf5g==
X-Forwarded-Encrypted: i=1; AJvYcCXRmrFyj9TrMkTIQrzme1iLSEXfnGSyUvezbRPl4XFGcKXl0/8/Fkr0SpiU65B2r39f9GHFnClF9ixuMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhqulo1dmUq0vjTlc/xHr0GYFFsnOY7LoL9XqT+HpEwJrNdvPL
	+sjjLuR2qlLpyFARGn8SGHy3tdJFU5Igy9+rdZ1toBO2xO8bzjDVvFo+x8V/lfDnVWZYzRiWgus
	Vb02l+XacGTID/V7ROl/ToqYpfnbIu/5Me2gqoHW5NO/GT1zMhPxZDnEgOSpD5alFEiNo0Qo=
X-Gm-Gg: ATEYQzwVh8uf4FTIOrIHFWtVDKRhoaYWa2Pvzzwmm1mdZX0eH+c89Sejc+2qkvWHdTt
	Bd9+g/qUNLghSVyPjoY2qW1hqrOc7h7zV8KeA/6+nntlKk4d+rnHVwxgyjZs5f2al40B2hE817Z
	zG6JIR+kgwnZMOhmf4jQy32J+7SNQ7XhcsngCuUNsYdf+ARTADdFW4nDTUhOet1jDWBO3EsJrRv
	GZbceDuSpB3vBt3Mhe6w6gGCgdx3Gww21v6OmlXw4Z+FN+ipSZhGlgXHkxkdzIupzBM1jXbkm5F
	9SjYDAF0hrsCDtv3hExe8EMzLlI2N/HtlvTOOJOmwBdzJrRqcKDKS6Vkj7Eq9Ps9ne54M+NsK2S
	8OMptQvJsiEteD2pFTlM7Fx80QsuSIfUI/reRfJbBxcqmeldZgnI=
X-Received: by 2002:a05:622a:188e:b0:509:44c3:5fed with SMTP id d75a77b69052e-50957e19ee3mr168189951cf.55.1773662734832;
        Mon, 16 Mar 2026 05:05:34 -0700 (PDT)
X-Received: by 2002:a05:622a:188e:b0:509:44c3:5fed with SMTP id d75a77b69052e-50957e19ee3mr168188921cf.55.1773662734122;
        Mon, 16 Mar 2026 05:05:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v9 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Mon, 16 Mar 2026 13:05:05 +0100
Message-Id: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPLxt2kC/3XRzW7CMAwH8FdBOS/Idj67E+8x7ZC2KUSCFpquY
 kK8+7xKG0gNl0iWk1/+Tm4ixzHFLN43NzHGOeU09FxUbxvRHEK/jzK1XAsCMuBAy0sznGQOnow
 5y3gKjfTaAikTGoMk+Nx5jF26LuaH6OMk+3idxCd3DilPw/i9XDbj0l/cCqHgzihBKgquajqM1
 vrdMfVhHLbDuF+4Wf0TCORKhGLCGWddXZGCUK8I/SCwON2smeictRbAuyaGFWGeiWIKwwRgq6I
 KoVN+PYh9EIRVibBMaO86BE/aYtwNOW8vX+HIW09bXn5fngELiPQK8DaoVtcUWq/WwJLE/SWxo
 MCWIMdQyxCggkrX7gXknyDEEuQZMp7I1fy/gL4A3e/3HwJbTX6iAgAA
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5129;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y9SagpHtwSqLjLqYl4+F6GAhqKsdJGhPJiiBMRVaavA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/H8/X1k5rC93OtyTAwV3ieYmektEfP7MBb+n
 UWiYZZoia+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfx/AAKCRAFnS7L/zaE
 wwZ1D/4xMTyYcGhAR1m/ZUSSROeAm18yb6kSHCx4q+HuqEOojcNBj8xZ0Zq96OYXOsewE/KlgAM
 AT6VxF7sU13r7Bd0R4czSppMwKQrSZ1O5cYE2Zq00bhWN6pEpzhXrLD2F/xclOFqvtG7qyo0V9D
 kkH0wQbgAv1niUQ3rmsHfpScQdwGfB5nTtK91G6rB2SmqashJ3fxt4ryAx9p9UfaQm6jVnS8GGt
 ANEh5zCeLGk537LhuPdPplywv6x+SilDVVS51qaHQFcdQgy1JNQsCgSJ4IeSqsVZx+PAtaLROuz
 tq6+5mh51TtnPJEOoFLPExNDboTjPxFdp7Qac5DFFSeCRedTWMnPeJ/64ttuzoPMl1vU2/V1jRz
 A51R03PY9Lg472nqY7VQvTmL+R+FlzB7xmYAh7MElCdroPM0OeZbJGsMBYdEckVoJx2gAUdUv7C
 4IBR78NgXL2NAo6DOWkETAvLjpNFfcZcpmpgl1dbqDBOJ3UoG1zrvcp/QEZGTP4n5EBoIF8WNxO
 WGUkBHq9qFWiZ5OStxtifR/3G0sPoFfAysqPSjkwfDnNpfjNLIkXwGdsFC/8S266yGB/fZvPHqA
 9qhdXCUQLd7RrWdEPWy29dIHcXVyz6sYUtuqko/h0HWpPeXExE7yt99G8y9KXwkdgbKYNl8WBVK
 xqYGG8BwBcw5sKg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7f210 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=11IwEMuB_qlnYAimh1cA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: 6_flKPHHSyQP3FeeerrlcJu3ZsO-G2pT
X-Proofpoint-ORIG-GUID: 6_flKPHHSyQP3FeeerrlcJu3ZsO-G2pT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfX16TiUxIVb6t8
 LZkKyla/4uq6Y4tIqSz101TZz2aW/8uKAw6xUiPc6OoIEoCmUGhYRWmxc7VyQSRCs/BS1nADL8i
 dwi+3NkvDZe2B2MmmxrbylcsJ+VP2meNlr+H8I96jCePoleOS3Rb2tmuLQHFtXqQshxUQ0hG6mZ
 ytAHQnJzGyMqibtmgWNblPTyjtPf6spPKSyG/bi5aXpyAxYpU+ELVcg4sWjKH+RTov6KG/EABTj
 jMaki0YywMNWaWuLwT3GFv1FSW69zywnpGt3BdDc85wXe95irnP4BNuj/WZiDnRTk1ZtvEeIK8K
 Hlq4eWmMBqQRd5sOn8tFPRsTsFjmZiNlZRN3T11LVlAICBEwzTxyhBCcBFOl51S42RC08ZtRk3u
 A4JnMvSvohSVaWo/gGOB6eKyUVR+Ls5YQx2ewgBQ610UCrMn22su80CpFe+UpC2T3xVXZ8LkLIC
 M40iwYPtPwNF/yavheg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_050536_950186_80D498A6 
X-CRM114-Status: GOOD (  18.41  )
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
Bartosz Golaszewski (6):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 +++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 401 +++++++++++++++++----
 26 files changed, 498 insertions(+), 72 deletions(-)
---
base-commit: dac1315bf558e4895665aa1c278fd30113ca119d
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
