Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ED7D767F0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0NRqPH76BGhD70uLneDyP/NiFeIJPrJM+C/STW/EKA=; b=i1Fwc40YJWygas
	n8dcVbLG6vBmbRvwrMiZewqOvjgKxe+/DJ3jl+pvhP8qopNcut2LcNE7Mt0SVoOX3BB615QEBmhoW
	o6pj+ZMnbcDRvQxh1vU30Qy1G1mrdJo/uqwrt0lbWwmbluF7LAcJQEIXYtH8MW7m8Tqcq3hdrvCg3
	Mo1RvGty+NH8oM1oLYHUMPEVrjKlEHdlJRDqdnZkFpDPgRu7tepDHVBbQVEKH8DgukuU7ZjXfz6uE
	aY1CG2SrpTWRiVjKwJQLERTKqqu/O7O+F1Ou0zs6HBFlZ7tl/0wrGMoIMQPzjMTFrr4yjbNdBexrZ
	IAv+jCX5FH3B5XN2C9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYsx-0000000ADBC-1KcD;
	Fri, 19 Dec 2025 11:43:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYsq-0000000AD0j-3xI7
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 11:42:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBPxvW4153970
	for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 11:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=; b=CBHFp77wpmg4I3K7
	Rg/zPjnBug7Mvz8+cpO95J+3tPdoWdrXTCJTbkEtKa23Lbh6i34cVMmpsY+uOueZ
	Vbuil+bTAuzBVjv8uuJDvYsZvF9EvsuEyzaYAVrwdprCSF3TedQpqZuEzy3LPi2y
	ukmz8jEM0pPXOmp6xDA6zka7gU+Y1H1e1CUVxhhQHJqwDOOAVv9Bm+BbFyXS08ef
	wOiGb52r1BhhhIzWcSfbx9TP/WCYP1WYAdMQkQZgw+X1HURHcVFLerNGVDnnfZQF
	GLq3XzzlftyUytUd/QVBiQ5xMbzCRr5j2wnRSxDPNez/Hx801e/L2AD6IVcQKVa0
	p9O9wg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cthu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 11:42:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ff3de05so43151501cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 03:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144575; x=1766749375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=;
        b=bIDQUAeF7siEalF8aO+vyoxiYzOjCw6C7vdMa+d5yVg9vbSxmdn6b7EutT8ejsO/jl
         Eswq61fo0P/1Uvwq/CEXzHgqieW6JUzZaDptYZuXtKWCv9PG6VAHW8R9mskZfZfCabmZ
         MtZB9pIaLUA79wGRANZXQjxt6ewl3+ldQwvHJWiXbsCXB2bAzcyAzksnDkocDnrwm/e0
         jroGuLzZ0gcOhvZj1NVS+lbxSOO+fw4nivffEUFqtloyibgBIQRa+9Rd0boLbak3RCI0
         Ea4cujfk5rW9jz0CkYZqiTkXb+NhHnT6h7H8O1iyCkCLQAuZN65oKbxJ4sU8srBbU8Sh
         T1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144575; x=1766749375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kD1ssSCTHDMOR3VnweMegknREdJvLsJSq4g8eG51V+M=;
        b=kZCpU42zGDZwLKS2UwEWLV17HggTqkngh9PqbgAkAmmhf+1kAEScn+hvkMtCaqo+rB
         Fqt6Ef0hgW+7o7N1oiSZU8vdVTfqoK8upalfqYPfhYa6hxbDNmbpQQHtlu2oiPTWnVPV
         4nSyoTCafsZvQqIdnPoma7EJEapJdVsovAkGodbdrPIzyWEYZpCmvjTHdmakJMHL8Llk
         iXO4hWq+sn4jid9/RWcxOvtobzJJp652PwekHHyRVvElwvgz0wtOXYc2J4sG6Os+gR4K
         9frA5gX0fr+/dQ84aqw4QSlWpNwUv9gr/Xx2Rputf1QqULF7yXh4jro5kD6X+lKbdaAd
         ct0Q==
X-Forwarded-Encrypted: i=1; AJvYcCURCALpksKP0DwhzNT1S2MwoJ5FkImyAf7FkQm2/RjlHcI021G74Hm2L6KHiuGnRxVUxDMCEpDFikD5Nw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl3aij6SiUN6E+yrFEaU5VHHnNF8fyVF0oFD/3cvWysorjxuvp
	h5/ye570MUFMi+IQn8ODJZ3ke0XxBFsKTqfihOhdUY2H9LmaV/0BZ0gvYZoGRHu5NPBuejXbh47
	tCAXntxXZHADGIZhnq5MZqGiPXx1HMtqOWgx+3+o4XUmqbchXcVpcG6N9iRZyLkN0ckue8Ng=
X-Gm-Gg: AY/fxX6XvM6cCMfWFlLq7LOLmM4WAVfeSx7oK37E2FN5k05SPv0PKRlWaiMgk8gshed
	Tf9mslPNqm5mD1j5WDc0NTs09rRlN0o03iI3Bhf91jvxiJ3QOgRAOuaf08vCdT1dzgX8h2ihMCC
	nw5ouPHI1UGwNWxmB65/b3cDrsq1l40wuLqBGzZcZzs1ZKNswcaxAe81s0nGhnLcGkTrytRSQRB
	+HvCprBgYyiSCe4SbthpXOsBsLgY208330Qal4d5hZzFZWq51PgIAnenyr7T3Fu9EPzXtivoFW8
	f+xKMe2N2WpXWyDp2V2sJvA0DMBcnYxALSMeMS49/UxNUzw9QtnhDv1KTrI4nIuwHAuRJ5NTcV3
	3cjvLcv4xLOuG7NvBKf+tINCMVOWAGlSusXNysM0=
X-Received: by 2002:a05:622a:198b:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4f4abd8ca70mr31652471cf.44.1766144575409;
        Fri, 19 Dec 2025 03:42:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXqKhXyGW/sOCylHSqPsU9xZo9abZxVRQYCYTMt6lSiNRCCt2ixMu9EsVynhaWcGrEf/49ww==
X-Received: by 2002:a05:622a:198b:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4f4abd8ca70mr31652031cf.44.1766144574971;
        Fri, 19 Dec 2025 03:42:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:42:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:19 +0100
Subject: [PATCH v6 4/7] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
MIME-Version: 1.0
Message-Id: <20251219-qcom-sa8255p-emac-v6-4-487f1082461e@oss.qualcomm.com>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3459;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xDKLLZ/nGakVrTmQ+/4MLzBk+KmOo6dAa2oHorRw58A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTosU5uN+G2JPXQO6N/VK1p008Oy6bofZoKjo
 4TC9E8cTb6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6LAAKCRAFnS7L/zaE
 w8KcD/9ZLZTgUdutIP1az4i2m9SlSrbZuBpSxCTk3tVAOh+pTUXnqxh44wcriaptAi7CAdjYTsW
 bvBu0uld9h2v02gfR7d7KST7DXd3WuHxsE0CEWVvEipG5rJeroe12tLfcoLVHhJSkHS+WKFR2j0
 NtOFNStGn6A2142OljZTa1/9PatjKIgBxSTTuFskeqOs3+2IhIH+P1/rOkFDM7nLIUicSRdpDI/
 luhS8I1dCa2N87ZP8osUOpu1J5AuCCed9LJQtnLGDXJRpHHwX7SIqXdB2lEFcWuTyOtBdK4x5to
 /zAzDREVu73NkkoUL9WeaR7LMcCgvujivWWJOzuENtUoJCQi667HIb7ewTqvBJcGf2s63hxySAv
 st7UtHOzFtJZ+1ic90B0fOoFJWEHhiMhljyfNlCHt9htbxgKwLyFbr+ny2zKTdvUF/FFgllMFA3
 m/s0PKyeVehgH84mFxxFScJN7BxGZsxxHgEMPGCX8iJfeMQ+HLuz5pBtLPRGMD+g6MW3oRi2prr
 3MhkAUBFVRYpQAjjL1QYYPX3UhWVkBdxnv4/L6D25Ut2s3PpOX92lI+Vt7zECxME9g3x9xJbW9w
 xSnslNc5kfLfVgheENGgHolGcNe+tosRYeTSnd8MkMX4aCyqXAmez9E/q4e9EzmM7LaHsqEkrYi
 YE8Hk92iOl8+j3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: LthrYgvah6hSPF2YUDNoLiW-ZUUaO1z8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX+btvot1GNytH
 Y/guqTg6RYR/uYLJDeqaNl43hKvIJ364jbh6uecRAnrwl2Sh6kqXpt9bNbBkbYEY5nDWD3+O8ab
 92kfnz7LpZngRjLjZW6cpT7e3MM5v2/5qJ96FQWEpZE7MDHQswL2V/Bd2VygtZPCbjJ1bpuSq8Q
 hzwsJTJjUfRwu/e6sdmomQqCw0nUAmQupvfyBmCOpqJJo0bNBLYCUxV7zT0y1f63zabzPLswAGu
 iy5gn/K6Gv/zbsOwQw4KfWRxWcjQh/1c2jwDz/gZOFQbCDr7r4n6yAiDchg0Xi+2oPvuYtXO892
 rMZhAdAXSCFakgf4mX399jZJnMba5MmUNBWwd4mAVqBid4llDexlxU0wECaK4kFWu1eZMZCzK6Z
 Ib/sI8dEb4pQUtSwZtPO7yISwSbyuVufAG46JM77ucIQU7x8t5pjf+nH2IyL6yqdHa8JfuzgsXY
 BU1+whyBbEups4uL6kg==
X-Proofpoint-ORIG-GUID: LthrYgvah6hSPF2YUDNoLiW-ZUUaO1z8
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69453a40 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fthQcs0maGYz3WdgJrEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_034257_076792_3826B776 
X-CRM114-Status: GOOD (  17.96  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e0f0eca94342..54458ff5c910 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -303,7 +307,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -324,8 +327,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -744,11 +752,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -796,6 +806,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -803,7 +816,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
