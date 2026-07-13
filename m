Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD55C44508
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDtI12/V2qSEOmR6fyAgA7z7TxjTLuBWpYhY24+w+zo=; b=bK8hRjiIiVnMME
	EWb14ZZUNPJ6a+lm60qLBwfynC+a1TzYVhr9SD+y4zLyHt9khRYldYlX+YKUPA0USJGwn9hY/hLBo
	hGKVe9oXbvLrRsk0ycsDxrcbNUrOmfbxkcZ5/NB156eFtn2XvAkAtFLSixj9vrU6M5+yYgvLrtKGF
	Un6wVZIz3HA23+ykxqkXm2ujVFJvRF6SAdZVqIfT45djYe2HEbKGSFHGycZzejPcmAVxrch479/M3
	f3UI1TIlg+LY7TTZfz/HEXTJ7fP1fKNEcDn00zHOWTvaStaGl1da+MmELVT37tdBm2jWWc0bVX1EB
	ms20eAKCXIev6aXeeWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbc-00000009NQc-0Z4A;
	Mon, 13 Jul 2026 13:21:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbZ-00000009NIM-11o3
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Jul 2026 13:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=yeVMyNe9TjARPe0Y9fPOo793ZYBqYiewRqF8uOogSw8=; b=sKHOSOH3Pa7YHqu/plue8bCGkY
	cvFgRI8HKU5eGJsxh1fMPZCNy0RgNj6gAzxMWvto3o9uoAt8FDVDW17SAMiLuiGUwiw/s2NEgsxOS
	8mMhWIyDrA0g2tppWmmndNq8+yUnwrUdJh19WAW7u42vSuwquadfBr/sAQlY5ssJV98c4c9uKPCcs
	0xLf1inZvKqJMgkmX8CJjxL4Do+1xITdT7xW9/GLqUCnqy2heGXH+ZUfmc7i0m8l8r9kYPBCobNaU
	rvv63tFoGuE7W6yogvEHvm6Jp9x68NvcoacN7OxmTQKnu6TsspUQX9g43qXJ+DiE4QVBzGDr9LvJ/
	FOmDHxew==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbO-0000000CylV-3Nzx
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 13:21:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEo6t1517677
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 13:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yeVMyNe9TjARPe0Y9fPOo793ZYBqYiewRqF8uOogSw8=; b=WIXXOyOxPcY/6uH7
	YspmEMtq4EsjVkScNCDoDgCmY9QAYr10vOyKzk5e2vgJ612uM0PNP0AOqU+AP0AQ
	qprhyVosWxBwOQZkGJWA+uTLGgt5BtHYoZVugpmVCs5h6A8mP647ItUq5Tg8xfFq
	xR/whPFOhRmpA0SKGeWoEJSpvdfute4RDON5++sRMuBAlA75RywpKItKW2f8hR69
	fAyhznK3Dwff4yBg6QrrQO9bC4T9q1qrKMU91GUZwpErRSefxSOHGCW1APgHNk3J
	vAHF1kNevob9Z+G05bHcTCmtgAC2bcg+ug+7fqCNXL4rrMeGhe9ixS5LLZy9rTtH
	buz3EA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsscax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 13:21:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso37115551cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 06:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948900; x=1784553700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeVMyNe9TjARPe0Y9fPOo793ZYBqYiewRqF8uOogSw8=;
        b=Qgmy+KQg+80EzfTk4+xM4iE1HdnJsjTdounNZ9mmlcpczSXJuRFLhu//tjAWNmJmvk
         vhjwvYR7QWwnHof1VGQzTELY7LfSnH0aBxOdF3S2Ip7K+2ZZKygOUdAdbjp8cIKgOk1m
         hRJo9prUnljvUxSBU7VmFfXwzL8x/XuOP4JZBVOOwpwCe+9V52FbeHA3esjYBkJpf7sA
         MQsi9erTAecyj3RcK+m1DBBbACJiFAMTnAPlD3LUTXWniS7Uwt7y5kAYfhupIdV2W151
         doZtyBAsHRSGY167SOWNxEB62LXDtVcfqLyrtUHAgGeMg6NeEiy8Qh6/cvYb4nVmlMkW
         UEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948900; x=1784553700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yeVMyNe9TjARPe0Y9fPOo793ZYBqYiewRqF8uOogSw8=;
        b=C/LMTN4uru2hNXJLn6TyU1YLtDUkBftLPbC3FarsWvTHr8dwAVpxLw33e6EckAl8tr
         DPcs9SWLOlzKs9xPTIuuOMBMs5zRPvo0saV9F13NxVjGrPEtBBqs9rbQPKrf0uB+V5hd
         njM1iRzSyHcY1fDiIIvZ50sOXR8RKE5pvSq7SubApL+00BqHcIH3DoQSDGfp2z5PDqka
         JJaicQWL8LqgeJ7qgZmW1dEvPR9gJxPmP8XdgL2RM6Un2xW97od0xurf7EqE9R4eBfx4
         DlCeKfnn8l84fzCYLikG/0p2zbVSx9xiBWbYu3GqdxLxFzn9aWAio+DLyqBPXzWCFiWB
         ZOOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqi4WNTpiO9zSjKjjPudNw1nlHDdjtXWkmjOh7GvBL0CJdOWIMDiUg0NPk7QZusNLM1luUzMMXJQHTK1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz+iXULDvug+atvssVYyXSaKU7tpOVqRc1hpx5jIXA2dvFBGZM
	zYD91fyza7nfuVCJ2bkIcI+oycofFj/19XH3bfr9tOcQ9MTQSlQEAOShTskA597WlZPWuZliByL
	xzQ20itebByhDaJYRoOpmW7y19kRCvO4Zkzh7InJ9kbr18Nj85Vr/xMyblfrck0BxxyGnGbU=
X-Gm-Gg: AfdE7cnxCQYwmgoo/wRpWVTHCETKCLn5G2/ssF4AL6DIc4DOJK+Tqkw6C2wA6uf5tjx
	9zXk6jS9zqX93CMO6okgc0FDg8/erQ4Ta1fSYwi8Mu/DVkt0gLjjaAl8xDuiCRHTEoZ7wKbGnRG
	2KeVMaJd0FpL62X2/OmU1c4hFKFvDwla2Uve1E+ns5N0jf8ODxGvSitgBQofysezpBdgubRcxi3
	hk+RQqjpGuJCqjvWvk0rmU3RYNt3oYriVIgMvSMhmF0afKbdNF9NRqvrY/FvMh5HlEPhtgMas+S
	L8jU1M7M7qd5AYLaiRq/PwIHWPzFGgiNGvxbbltXdwoht2nmfweJ1Bu1+aEjRfMWn9xaT5WTFSR
	SpXwniRVh+MmfLoy+BXmyBiz2Tjo4vFSDx6wI7z2F
X-Received: by 2002:ac8:5906:0:b0:51c:83ee:e430 with SMTP id d75a77b69052e-51cbf27d077mr82111261cf.75.1783948899557;
        Mon, 13 Jul 2026 06:21:39 -0700 (PDT)
X-Received: by 2002:ac8:5906:0:b0:51c:83ee:e430 with SMTP id d75a77b69052e-51cbf27d077mr82110871cf.75.1783948898998;
        Mon, 13 Jul 2026 06:21:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:38 +0200
Subject: [PATCH net-next v13 09/10] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
MIME-Version: 1.0
Message-Id: <20260713-qcom-sa8255p-emac-v13-9-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EAxunbRoSIjMpRidqvpZlLzZZE6DSdUqesz/iChrZZg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY8eAHgdXzJBsyYLnRoL/gARQ2r6YXiSBRqm
 uvjeUqJMw6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmPAAKCRAFnS7L/zaE
 w5mlD/9Hee+mpb6N30jSOqXPT9G2dVaUHw3Eq6xGBWr7V4wl0WevRfEyXoPDgFNJ+i07BCEmn+C
 uIDBa9vHZfQk4OsrFJHBQSVLXyOJjfMq6Y0VSBXIU2mK6Fdc9gfGxbC6zkMT5LaEaxxs9clFKO5
 zbr/2jYRP6paz42u+O+qptNuxf7HZqCd1kzhtd8tWhZiH3Ak0kB/qWJaeGGWn4c5qeFq6s5IPWK
 xxwNNxHZc3tThDoOME4e8bgfjMBU+Hh0toewP590kj+B0TcxsWQdf1EJPmJI3RbdUJtANLITPTI
 xt7IKhMqP7Xqe2mSLExfnRfAlwUg+4KDTfVwKIdILrYYXzMnDfaGFUQPW9dzOToz/WW9L283fWV
 k600Lcf4ja3lGDWKpVKLa364jRRqO0iDmTjZ0H4+0KC+fkJqPKhkNAFyt009y0ZaQEpFhMNz9PW
 cjnPYQQpvKA1m74Csi87o8JD2RvOsGZRDz6nFC1sH33Gm7tWz/VWeZE3USiEw8zzjgYW90aTVOi
 MAV552EaHpgsUv/CGRer88C206e3bpo226M5SrINvgau+6m1T8tKEyf3i9ZLnhBs78LC+40PIef
 pu0+JWJhzgnj1Phv3esN0vUgyjRaqfPxHng8tqga2BT+BAWMwHFkWv//a6KZx8QIHWb7v+GsOWM
 lA+PS9kCH6vzjfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54e664 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=dj4JEN0qHmgdNMwDfcEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: xYKssQLUeurqgSQCzFbB0G05-6wfm3mY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXyLvu67va4Wgn
 uuEr/LMFkpC7tK33a7v0cuPuPZEoAkSmJE+IlNqmUGqjWDn0hxaPxmJUB1Ruu7bCuLHf7Q0YJ6G
 lcmBuF1mf1niJ+Mx1nkAuAh+v8uJDXA=
X-Proofpoint-GUID: xYKssQLUeurqgSQCzFbB0G05-6wfm3mY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX63zKClGUugZH
 nvWCVdAxpHj1b3CKQSMECeliYHzawekT5FVw4nVIZ21YQyTuntwXruj1yOqkOZWbbYXd9WEZrXr
 bDUDLGb9ot5Rzbfh7bvNOCgBEFCQzVoNb18tsQs6K7ZLNgvvvOgKeuO8BKHn2qPlxg3Bd+NDhWd
 YVjAoh/3E/jnXym5MBXTpcXMuil1lSGSN6E5KGtUeoFNz20rU1qYxJILoLAG8h1s0ugEaKlavFe
 dq/50Erga/3PgTymbakeKQ16vf+FDTZn/klris4sIyxi+p0QWLTZt0mgmMyGHHD/08eoDKH2LN1
 OPO1i1IZgH7dLQg0TgZjbXrwJxLEIC5J2ytP5mX5w5aNGRQiXyfxIl4ZhK/hihcaHeCGpLqjr0J
 OZc7EsAnnwtkgJvzPXEbzfwjmFS8/w8nLCtwt9C3tFUos4ody7dF11qaYDACJoaSJIIzwOnLTZV
 oR08w0MVn8uPC2cJNaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_142144_817649_82FB552D 
X-CRM114-Status: GOOD (  19.62  )
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

Ahead of adding support for firmware-controlled EMAC variants, extend
the ethqos_emac_driver_data structure with a setup() callback, implement
it for the existing models and move all operations not required in SCMI
mode into it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 99 +++++++++++++++-------
 1 file changed, 68 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 43384960278b87a95f14f23c45442d2bbf75d882..3af1608fc21cc7cf6b0ad31952b9f59d6f00a2b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -5,6 +5,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 
@@ -81,6 +82,8 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+struct qcom_ethqos;
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -95,6 +98,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	int (*setup)(struct qcom_ethqos *ethqos,
+		     struct plat_stmmacenet_data *plat_dat);
 };
 
 struct qcom_ethqos {
@@ -200,6 +205,9 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
+
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -214,6 +222,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -230,6 +239,7 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
@@ -262,6 +272,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
@@ -297,6 +308,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -692,6 +704,58 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	ethqos->link_clk = devm_clk_get(dev, ethqos->data->link_clk_name ?: "rgmii");
+	if (IS_ERR(ethqos->link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+				     "Failed to get link_clk\n");
+
+	plat_dat->clks_config = ethqos_clks_config;
+
+	ret = ethqos_clks_config(ethqos, true);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		return ret;
+
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
+	ethqos_set_func_clk_en(ethqos);
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
+	plat_dat->dump_debug_regs = rgmii_dump;
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -713,23 +777,20 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
 
 	ethqos->phy_mode = plat_dat->phy_interface;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
 		break;
 	default:
@@ -739,24 +800,13 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	}
 
 	ethqos->pdev = pdev;
-	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
-	if (IS_ERR(ethqos->rgmii_base))
-		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
-				     "Failed to map rgmii resource\n");
-
 	data = of_device_get_match_data(dev);
 	ethqos->data = data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
-				     "Failed to get link_clk\n");
-
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+	if (WARN_ON(!data->setup))
+		return -EINVAL;
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	ret = data->setup(ethqos, plat_dat);
 	if (ret)
 		return ret;
 
@@ -765,21 +815,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
 				     "Failed to get serdes phy\n");
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
-
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
-	ethqos_set_func_clk_en(ethqos);
-
-	/* The clocks are controlled by firmware, so we don't know for certain
-	 * what clock rate is being used. Hardware documentation mentions that
-	 * the AHB slave clock will be in the range of 50 to 100MHz, which
-	 * equates to a MDC between 1.19 and 2.38MHz.
-	 */
 	plat_dat->clk_csr = STMMAC_CSR_60_100M;
 	plat_dat->bsp_priv = ethqos;
-	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
-	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (data->has_emac_ge_3)

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
