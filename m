Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F274FCB61D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 15:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ax6JO8JxBWkxM+ZyMhYDE1FaOwFihFWHrB4bfZ1Ra4E=; b=c7yxw3d9xdeI3v
	kPurJFZPFAPZAMbIPJMHbjqu2iOr6+k4frW4MJyUNlogzNX/5aIdIXfinSc5/PZAlL808guNiPd5z
	FhPVaA+cfvGJ+DUwtiChuf2cfQAEoOE799ao0LSWBCE5ecLrJGEy3YcTl/Q6GcJO0UiZTPXxuEr2r
	gQN8LwPsqB/C0F10AP4kxmzpiLuMgdNhFtJ/UnTgZpiyBKfDtwC8c476ltVvCL8CzR5meFt8cgAgb
	M57S5Vtgo6uH0eHMKYo4bY+a34FHXB98qx+2scEYO4HG19Fr+Xef/glYGn2hMGBoAUsRtsRnjMsEs
	e0QLEEHzMTnkgj9pV+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOd-0000000444O-0y9E;
	Fri, 06 Mar 2026 15:47:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOY-000000043zY-3d3i
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 15:47:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT6091687432
	for <linux-riscv@lists.infradead.org>; Fri, 6 Mar 2026 15:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XmLtfnfEU442apLkQZEiJc7Yi7ztievqViAzTb+cZV8=; b=UTTNVO4CaNDJi/JS
	L878uYw4+Pjqakz504j6ghi3XiYjIPgE0YiL7yGzPZUtduxaUoBVJSQOVjfW2Fn4
	Ete0Hww61VIDr5A2UKQkagbqClJowXCX8bzidyoBs7IQQXPg0y+2IVWI5ctvHTla
	zDdYcQkd8G7YrFUCNj4/tbI+MwCZ+ClxYHW/kk6njvmJCcwHbopBTVAYXWlR7LhW
	n5FoCib5dK4p2WxTI0XmVWC+3TW9nMYxT/VgDaKxRXl5iokQBn/4e1Fau4o0Yu+3
	HKLHPKIKoVuZ2RD+NNNUCbHD1b6x6siXLDgdbFDlKusf9M/gaNZ/0F5VCwjacKS3
	5JDvzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14gssf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 15:47:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71304beb4so1535971685a.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 07:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812037; x=1773416837; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmLtfnfEU442apLkQZEiJc7Yi7ztievqViAzTb+cZV8=;
        b=c7PXLiej3wWZ9fsbfiZtMThccRXJWQWWpOpvzpx012PSIiNXjbKxGEQwFwGc3tN0o8
         nL4L9Pq1oVs+EGcQIdqZSVijZB88/uMCGRiXlDeHfi6OCIWgGZotZSdFM4JF37wrFeq6
         qQ0Tg4SlmWmvdu57SkgBzI2AmygdYpD/sNSl+RvOaNKSIo0lZDRHmSsAJ1Fvp5NDPbgw
         8vG+onKLO6wxV9W5WIftgyciLB98NBKynugzigmPNzuGhzGxEFikGroIHQb1QCzbSPZp
         XJ42Yg/+kxaqMvEDMwKoSk6Ru03aPGPgS3MsvNdshAXsFlMG/r9L1QvKlp/HnWKGvbn7
         nrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812037; x=1773416837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XmLtfnfEU442apLkQZEiJc7Yi7ztievqViAzTb+cZV8=;
        b=uCwpQbY2pWIW0j4FudOgNGlWC/DAK8oC2xxuGM6HBCRsUrGMCnkbvtrzy1SV/a8OQX
         KcbG/M7AI7kztW9kpss/gLGo/kLAa50Ezn4sf4Yj89LnPo0fV5VaOmUyGQE3mvTSjurZ
         L1C9ByKQQVTD0OPkx8P3DZsvE3OMY1CV5MmCMCNFKrspScghS/FbL4B4nyk5e7rgEIDl
         YI0PBo9zQ9n3dsQDWu+kBtjKpZ4m8QYTUK+q1zBr9IdONKF8NsRx9Zok1mIeiDqOG+/E
         Lhsv57BcN5/wAg3fFj7qM1at8l/L8tAM/Y4zJK7O8XwkY3AblnhR1UJznlHD4X6Cy8GU
         q7wg==
X-Forwarded-Encrypted: i=1; AJvYcCVr/iIOoJ40MGQ6MI2cPZd+f0MegJcd8VmXzKPzV3B7LQay4gpP7B1imqO4WTD/Y1jr4tFddOYTXfr2pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY2wenES5YDqkSfN3c5qOYhXJ70wVJvxYtcUGgaNHidoO7IEyt
	brwx/Xxn/27E5Yht6iSKLDgQXKpmMwERtg1exfRXMkxz7Q5z5Whfl7XGjw4nW7eNy9ZnoGPB9tY
	VkKPfOGz3zWqL23xbykFAaOs9OFdW0HdElwWGyEtSRxur2v7IVyS7VQeRgU1IxosDLlHz4UE=
X-Gm-Gg: ATEYQzybOYTjKEVgVeDI0Zx5+Xd6erIqFSLTXJ6dOdBjvcJjTAoDskhUzS74w6NOMom
	d68RoqPWXPUyOKJ1qIATNpfzGmuCzDzLWOqSyWaLIS0+aDj+BwHOAnrR9pzQ4oyfCbYzNRVvQOj
	9frXhu1EOxkvjULW5HHxFjvWl7O2qOKenhpiruOGSycqLrs2U1/gHTNPljNbvXzr9Ud9Tk0aNC9
	ijHnZxW28Yt5jl0dg2K6hckhAOyLFF5xRxCS0TnhUlDjp/aF+pTFXoCtX7JtXOPh4Y2lty18XGT
	LjHO80Ysqkf7qX2jDsiF+pVfUVSLhLf7N/52MTn0A3G2dZKg+EqibdkXlc2hGaN+OV7PmmAB2IJ
	pWR13pZq6Ix3CrLQr7urBoKq24Kq4n/kEH/ShUuPyvqAHFbQvfMgS
X-Received: by 2002:a05:620a:1a9d:b0:8c6:ff02:d825 with SMTP id af79cd13be357-8cd6d4419a6mr323524885a.48.1772812036967;
        Fri, 06 Mar 2026 07:47:16 -0800 (PST)
X-Received: by 2002:a05:620a:1a9d:b0:8c6:ff02:d825 with SMTP id af79cd13be357-8cd6d4419a6mr323514485a.48.1772812036228;
        Fri, 06 Mar 2026 07:47:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:41 +0100
Subject: [PATCH net-next v7 3/7] net: stmmac: qcom-ethqos: wrap emac driver
 data in additional structure
MIME-Version: 1.0
Message-Id: <20260306-qcom-sa8255p-emac-v7-3-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
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
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5789;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wjuY+nOeBuf7mJQjJak4IPNUsbeUnM9wcneFMYKnYnc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbs0hciUhqJotPp9cNlrSb8egHKq2Du+9zv6
 7JyZbENsVOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar27AAKCRAFnS7L/zaE
 w9OND/9OfvQ3mT6kO2oe78LPFKJXd1gPD9CBX9zYbKWOqGtvyZhcFn5M9wNuCCwZKf4/muZb5LM
 6XrndpRCIqmfqjVkKKzaJd1b7hQ4ndEzuwUuUTajxWki+r2VmRiiWfmoAcDH2ddy2ZyPEaHHmlH
 z3OXaI8elMDsUivSMJ7mbD0sedazpwANeUQsodb1uiY7CJ3LKfMRfYqBbofivgrKDWMRBX7or/J
 hKlBzx/BCt2uxb/qC+wxcjB9iWlq8bo3mFxONcWS0gM2DcfrNJlo8QvaQixQ019WvW+OMJKC+i/
 BMtRKsHA0Zwq3JbRNurH4bl7yHh1hJ8rSunrcZOiIjLCmV3qLv3E3S+JJJF2tBR2ECaaS3VaWS8
 o0cR8ag8AJRjBex4YrD9XYT2BItD7mx6ZYDn0iHhaln0cs8BrJkfm6Lkh9/MxtnZkDgLJfKuzZ+
 YiIAVABIZq8WhFD/pero9PYeqXKpD5+9MLk/eu3WLm8aqfWSLkHmNJocpRJNN9Zx3jT2f1gtSGd
 1zaeNRNiE+Hx4drnVD6LIu7g073v8zNCeJErJlW7pGvhHlisQI9A+IESfzH8aFEjOTmGPLNWl+1
 noOxzcb1BV+olTlJV0PiVuVQq+T5Y6WEplqqhJgNBO1UjGn6a7eKHrc5HlQpFUCzantNeV3pICx
 U/m/FhecQPQ5R5g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfXxZ3uEDRZzkch
 25jmeqBsGoGDpEwD5w5a72tZCmi7tqXpTrcdnmLrUS5lY8PEMDmCfMmHrgsaw3nH0vH5nEGK0Vz
 jv8/lLVzvwQr1OxAFouCYSj8Bi1UpFKm+dDcPMqJhgSWtFktyzG34i1VrFLhaHBiF+KsFv4QHeD
 2jprSzzpkVZgtGY1VXkgQZ84G1AApm8XequwczpYWw0P/+jAJB9otuu63f0j42IjazqWYUBaXss
 3+sJwBlBBMtd2qdrzt0FDq2dIoDyamBmh7a/a60OL2wF3/wmg8pGtDwJKQzkgxJtdoEE2pY4r2e
 KUk/ogtHEw6NzOhjGH3PhxqaQ6Ayd4BsF0IgGk1GQnkKHGwD+sH7tIG/7Pmz2LOjq2by+9tvkuO
 AGzxqAxO4GXZTLBbXLYugy5IVNpZ7s+UW8sRFBHulsjRZQEslWSkm7l7m+a4P6E2JjbVCzgnil3
 PBaUdX9QsUecPtjSE4w==
X-Proofpoint-GUID: SaA2f6gSQ-xARI0MQUDx5CIsZr2OTZSo
X-Proofpoint-ORIG-GUID: SaA2f6gSQ-xARI0MQUDx5CIsZr2OTZSo
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69aaf706 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_074719_841985_8450D66E 
X-CRM114-Status: GOOD (  17.26  )
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

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 51 ++++++++++++++++------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 219ea36fe01e6d41299649defe569de034859288..ae7e088b122753fefa24fd2ca715151fd56e6376 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -224,6 +228,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -240,6 +248,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -272,6 +284,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -307,6 +323,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -730,7 +750,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -779,13 +800,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	drv_data = data->drv_data;
+
+	ethqos->por = drv_data->por;
+	ethqos->num_por = drv_data->num_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -813,14 +836,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -835,10 +858,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
