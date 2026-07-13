Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E70C44501
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIowFIXkaLZT+7744+hIXJHrncL0yq1gB8aDtxRRWo4=; b=cBUAHo7KyhEU7/
	b833i9erW2IzRfUHoNYDy60a/fBCBsuhdRpvJJNR5lbkK7njZnp9Jn7dZIObqnXx+7u0mUuVPg2QR
	gPUoBs4lwFAKWGGMHLDpjPGS/aKLmyjpOdWxT8/Eia26Xl3rvLusxXZapmzNl3xdV43mTbh1C3unM
	Lk/Nvk8LGjpbK4NLnI4gLuPZx13tPlVsJZeMCXe/2I7LKISmTirjYGgLk4MZqVVidaAMDB7uGf9+2
	QnzoJ0TGSAQPqtLd3UNuPtObASTGrVFFso8PR9Xi6RAkupSvDaz8mT5FIctnOjRsOGQy1ng47f/Ub
	sEpfHmZ+BNmgMSfKIjtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbO-00000009N4G-2Dew;
	Mon, 13 Jul 2026 13:21:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbM-00000009Myy-1qwo
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Jul 2026 13:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=; b=fTo96wAZjRr5MG8qRxB6KeTkhn
	BEws8CAyy+ZzcCQTtmrnLXBjscF43oUlapIWNWrpOf8b2fI6TdrupUExorx2sZoGewvu+qxYX0lc9
	6Xowo6mhEqNb3xvAVa3G8S/riQ3rbvSiF2VMnIxofEfYyepyfCizdzGgKi8jweCQ5cqjZMVvnd8AZ
	nxFjnovnNpHTmQsCKFE6AkEqbLyE0GrZSpv7f+heJcyQCwg1W1YEKpYfF3I/4kRPyrELO8OQVl9DY
	dladQpaVuUTg4JAHoq+gmOz13QasD0SeGwKl79XJYjluiMl6GoxvpXD+8Cd9Vs8nda53A3GZ0iUzq
	c7S2e14g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjGbF-0000000BdYK-1otA
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 13:21:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDg8g1480856
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 13:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=; b=LuHB2LndYAhekP/j
	qqI6yQ1IIvHllU+v/KZAuCsz8E37eSBJ/bOgI8R9w1HloRsQVR/lusbYFphVuRQM
	ncaLznaaOZ+jeHtIqKrsrzK5JCqgTsSRyhCO9cXFZgwr9o6k33sw7mmJQNrb8F7R
	EC4ky7JImgq3CLSrmd3sZh6HesP8U9IIKPPhXIVLimSmDCbIAaSlKexL3PW2Gt1C
	hNXMwOBmK4v7ZEV+ILuRuT4iStzoti5NGJ4uK+4650V8aLn42qktRa1uUbwOZImt
	XTpbLooToXh5GCa7hlWSVWrwLEgxHPy75kUR40ZOGYkjWYalZ4Im/4G8MWbtq+ES
	FVA8Ng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrvgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 13:21:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso52842721cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948890; x=1784553690; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
        b=Qye/34gKVr0KZRLW4EJNup7aLVDaGe7yF3Sw/SkkHN0o4QVJ0R6l0ziyg28aypXK+D
         JFiOEuE16VkndO3MNtyBzviuCqjIiWHvZJaG7qEK2kjchDBGpdPOktOLk12RSbRDvEIG
         DBrRODKROS/qELm6bbmaKcHd/u9KJMLyu2/NZBbjApGfaY6qSBMSiJ1ZoCMlZbvUkLf6
         BEvvgLJMWCcs4Xx5lL96yePb8Ouu/izHkad0L5kWaPgtW7h7JZGIo13QOl1qYIH+2W89
         7IUtjF73jyKV7jf2zfiiWrJq1r94xdtpWe4Rz27v4I6YrfqKi/VfVu3WoXCGEfYSdVqq
         N2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948890; x=1784553690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
        b=Rd4bcbOrMvWnAk+Dv6w/prt8F0G57UWB59hMbkZl+p+6uBSIzkdnNAPxA2M/evjEIr
         Zb/2tRUHi+FkRZA/n9uZH2aijweAdb+mi2hizU4PS3JpFQNaAxQz08xZrbzTbog0h2AH
         ziIASY07Z9EmYQDhcFz3b6nGToqhw/USWi7EYvJ7USBwLt8iB+1S5x7o/Y5PL0XKZzbb
         r8KejKWaA4MrB4z4qgGk4P9zugWxlN+0dYSaJUmxYOp7HbYSmp1BYe13Qm2shd3b9DpU
         Gf3kqh8QSiQFghYY+3BbfukO7Q1xPayZhZkEXZCHFwlP9Knb6dn+EPBtbjVH8j8mxwmn
         bf7g==
X-Forwarded-Encrypted: i=1; AHgh+RowLioiAcNkBxiCFt5YwG0dtbpd95kqtCXS9NRl9KEixmu+c1MjVr64qa0rKQ/mtRuq2usb8YLhlsd+cg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6fYlZWsq47zSQYwwONXruE5wCQ5Gn4gFcZShqyu11YiOd9oW6
	3GVDlOYJBwyRAaV6sl1Dz6yWKeZr89mQ0VI9liSQJNwqlVYRGfT26bk2KNeH+AXJgfKtjz+PTMz
	pX4j7SRLKuAcx5gyCqXksLVGcaT9o5Lmx3unTSBLZeAwRF/3KDP0Q0EIv5zB7FuVm2WaFVbM=
X-Gm-Gg: AfdE7ckqcC5cdF4ITjVzeaM2DHUQq4UZtvXmXMhnonqgsaJMdGqVWRTmrGuluoyHvvi
	p26xMuFpw05teXKF31LCx2rCirH/6Pe9QpHD6RsNzpT6RlNBQYwko/owQmg3E43Z7Gmm1XANl2O
	NZjPnYdImGtVBfyGF1zeCIXudgZI2YXi/3M9SUKpdNziyHCn1tFYizqlAzrkJrROD6JSw3FZVB1
	kAMdNXxTaaxaBcf87iONWLBbjKGJWiHRhxD7UAgUGRxRrQ4i1a84aiTJYqw1C8kFure81/do6AN
	pOJ0+cBp01WKlsTUAhwjRWwIvvGH0K8FPvXXBFG9y+yoECX2hDYEipVMW8dXICrtbgocwESuwx2
	dj8Ju1vqDxRE6UUREARmIWjOlbAgZU107KcNfo4Ab
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-51caa0bb46fmr141764371cf.19.1783948889504;
        Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-51caa0bb46fmr141763741cf.19.1783948889084;
        Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:35 +0200
Subject: [PATCH net-next v13 06/10] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
MIME-Version: 1.0
Message-Id: <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NA70xnk/UNTcZEimYYDwGN/0JGIaZCh/H15cO1NUAsU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY5/+vs2/qf6ixq4/oND2Zx6UG66WUho2k1N
 BESE3IZZ9yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOQAKCRAFnS7L/zaE
 w287D/9ZdNDg6JWXdurG/2dzivQeLaVo/7EtsCSyerxef3uIlCFZXmkGtM9e5iwQwgajmvVUCn3
 JTuk3xBjg+Z1rKC1kB/R3MjBD8PhEW+E+xtyv0ZfJ0dLazOINtSW3GAlW8X8jCLTZTcdvwEFdzY
 KIC9IY/wiiZ8QSRR+AhHjb5oF9P7v6JqeoqmJjeOZtJfRdnWMv3WpoIwpkP7GEtoICT4ADSsMVw
 dZ7DKd/klrXJmNHOgxtCE3Sa/tiWHW37EyzPjzFDFIJcWktXMWkFucKsCab66xmA8dxOPc8oZCa
 J1xm+gim/rKwzek+BM1739EJ5i9AauUDha1WT5QrTL9P5+3SvZ4zNLwhomOEKkLoZghbp6Pbepc
 XYhKBRQQM4vu1cZJi7F5bb9E4ACR+buWVjXcCeDZANXlHHtlPmOHekz+wJ3Ua1YStpgBkEAzKk2
 dFiek2jbRDX7KFBUTDPBTBIRkqzc+Y7sXl/CwPYbMw8Afeddl8kY4dpRvzG29iFvQmjSVwHcAbe
 Lgkz6aIJy20PcDerwJKefrtBj6Uri6D3O1qhz/Z+7KvVbnD2CZq6zoC940lmSPJUt47jeAh1VDn
 Uu5E/R4SosFE1DGpvef7KgKjGkKrEm7yAWoep/YaYStb2OwTec/khkzbk+W6+0EYIeUbC+syBv2
 3gGFk01Yg1NAiWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: smtaKdO3AYrCbwI-2QvVnQMsBD_v3OMy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX+N6/WcutS2Hc
 GtBOpA95TcPyiI9iK2feH1Uku5yTZ4J/kODrXhTPLMyL/wNViN1eMExC8ORFPrwDcLH2vkoSDGp
 7TZKCUTLJHREslX1v0CroAc/k1RhVSmzfRz9qpPTfZytK0HInwTb1R97V6Vd2SPnSHptj6Y34hZ
 hWhHO0NWEGVKT0GE1wFABW8Zeg9vyPWLf5pU0hq5CGEPxbfNq6mEt/oiOiuggieC0Mr/Vt6iwwL
 C1Pwuas+n44UprEjGPDq0ep8SjzwgZttxz2okexvSrUgHmSRx7twc7uYaLtYNQh3sT2KmyBghFZ
 ugwtHDhFdotB4leHbIV+1asgXaWviC6RWrn4ubgL52bMvhk8xqRn9BO0qOxm5n0z2ZM3Yv+NZ7f
 GxNO5vFYPpdm75zt6JFLVDxsGizfPA86Oy7b43J4UKFS1mDF95+wCqSn+X0DIky9HhfddOd3aa9
 t2bnB/2A3Kunxy93lfg==
X-Proofpoint-ORIG-GUID: smtaKdO3AYrCbwI-2QvVnQMsBD_v3OMy
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54e65a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=fYsbkC7JaC8eFfGKQicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX08ZJdvpmzTob
 up+xhqfSlB6gJhRTFQEOlJ6zb+LzLwErUt3x59GLl4pMdkvXmgD+t/v0Ot86TF2ASPBieirsRf+
 mHwBkBmJo+e2N/tAFiTaHNcRQr7D4ZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_142133_824021_36ACD4BB 
X-CRM114-Status: GOOD (  16.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ZXRocW9zLT5waHlfbW9kZSBpcyByZWFkIGJ5IHNlcmRlc19wb3dlcnVwKCkgYW5kCnFjb21fZXRo
cW9zX3NldF9zZ21paV9sb29wYmFjaygpIHRvIGNvbmZpZ3VyZSB0aGUgU2VyRGVzIGFuZCBpdHMK
d3JhcHBlciBmb3IgdGhlIGNvcnJlY3QgaW50ZXJmYWNlLiBJdCBpcyBzZXQgb25jZSBhdCBwcm9i
ZSBmcm9tIHRoZSBEVApwaHktbW9kZSBwcm9wZXJ0eSBhbmQgbmV2ZXIgdXBkYXRlZC4KCnBoeWxp
bmsgcmVzb2x2ZXMgdGhlIGFjdHVhbCBydW50aW1lIGludGVyZmFjZSBhbmQgcGFzc2VzIGl0IHRv
IHRoZQptYWNfZmluaXNoKCkgY2FsbGJhY2suIE9uIHBsYXRmb3JtcyB0aGF0IG9ubHkgZXZlciBv
cGVyYXRlIGF0IG9uZSBzcGVlZAp0aGVzZSB0d28gdmFsdWVzIGFyZSBhbHdheXMgdGhlIHNhbWUs
IGJ1dCB3aGVuIHRoZSBpbnRlcmZhY2UgY2hhbmdlcwphdCBydW50aW1lIC0gZm9yIGV4YW1wbGUg
c3dpdGNoaW5nIGJldHdlZW4gU0dNSUkgYW5kIDI1MDBCQVNFLVgg4oCUIHRoZQpzdG9yZWQgdmFs
dWUgYmVjb21lcyBzdGFsZS4gVGhlIG5leHQgc2VyZGVzX3Bvd2VydXAoKSBjYWxsLCBvbgphIHN1
YnNlcXVlbnQgbGluayBjeWNsZSwgdGhlbiByZWluaXRpYWxpc2VzIHRoZSBTZXJEZXMgdG8gdGhl
IHdyb25nIG1vZGUuCgpVcGRhdGUgZXRocW9zLT5waHlfbW9kZSBmcm9tIHRoZSBpbnRlcmZhY2Ug
YXJndW1lbnQgaW4KZXRocW9zX21hY19maW5pc2hfc2VyZGVzKCkgc28gdGhhdCBpdCBhbHdheXMg
cmVmbGVjdHMgdGhlIGxhc3QKcmVzb2x2ZWQgaW50ZXJmYWNlLgoKU2lnbmVkLW9mZi1ieTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPgot
LS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9z
LmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9z
LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFv
cy5jCmluZGV4IDQ3YjcwYjVlNzA2ZjIyMWMwMWYxYzBhZTNiMWFjYWZhZTY2NDExNjUuLjlkMTky
MDNhZTRiZDdkYzE3YWNhMDY4ZjVlYjg4ZmY4MzBlNGU5MDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwpAQCAt
NjMyLDYgKzYzMiwxMiBAQCBzdGF0aWMgaW50IGV0aHFvc19tYWNfZmluaXNoX3NlcmRlcyhzdHJ1
Y3QgbmV0X2RldmljZSAqbmRldiwgdm9pZCAqcHJpdiwKIAlzdHJ1Y3QgcWNvbV9ldGhxb3MgKmV0
aHFvcyA9IHByaXY7CiAJaW50IHJldCA9IDA7CiAKKwkvKiBUaGUgaW50ZXJmYWNlIG1vZGUgaXMg
b25seSBrbm93biBvbmNlIHBoeWxpbmsgaGFzIHJlc29sdmVkIGl0IGFuZAorCSAqIG1heSBjaGFu
Z2UgYXQgcnVudGltZSwgc28ga2VlcCBpdCBpbiBzeW5jIGZvciBsYXRlcgorCSAqIHNlcmRlc19w
b3dlcnVwKCkvc2VyZGVzX3Bvd2VyZG93bigpIGNhbGxzLgorCSAqLworCWV0aHFvcy0+cGh5X21v
ZGUgPSBpbnRlcmZhY2U7CisKIAlxY29tX2V0aHFvc19zZXRfc2dtaWlfbG9vcGJhY2soZXRocW9z
LCBmYWxzZSk7CiAKIAlpZiAoaW50ZXJmYWNlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9TR01JSSB8
fAoKLS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
