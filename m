Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B62CC6B2A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 12:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nD/VzTfPiqo79aVrlQIeX3sZ21ZDl9HYkJ5i8mZ1ig=; b=sgbYYtG0Z36DBc
	upWD6aqWpbUDHkfz1uVwRdIeWiLtLKZL+egtzxLBO69BSe8QEWtYTPfffYNc38HgXTRaJ6CaZjg79
	J1PxBPbTNuZDSR2mEWcQHp30Hdo7Aw6d5XR6Q5/2vN5cajE/YvJsQJGfg88wZDDxf8Qjy0rzx9Bq5
	6tW076aYK83UjOzopg6lZUG/8GSLIn8vbLupXd549skJlP2wYXl5ivCbUoQAbssrTpBraUNiK4zUd
	OVigwSQ9nrUwqkQch2coNMsa3Ygg9hdYpe/zdbz3298CPVp1JNvRNGJSbj3vkd5qvle1gIwCous7N
	CXNL0hFMzUuhdDxBKJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyEg-0000000FS2I-2tQA;
	Wed, 14 Oct 2026 12:37:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyEW-0000000FRqc-0F9B
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Oct 2026 12:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=; b=Lo+OkIjcF3rSzBiWgx6OgJAZGp
	5yNdjSpGCd9CG0W5hoSJg8bpx0hUIDP1SSch6l5p3mfulDl4xv5xZqAKopgyvhU9UQGMR8WUNQut1
	3y+XkemQrrr1nD5g/H/Be7gHhVhbexYFmWvGs6/T6eOLG+l42CR0z31EYkSGgnzqPLUItTVk2BSUx
	Njh1IT0n7fs0bixiWZZzOQZrwcRVBNl2KwGU3mwpmKfILSElYMhNTD4OP2uWUl1y8avkVATwi8HwI
	mE9xu2YJBBRxsBI6aWb0doVnd16xTChcLnBf+BWOcCwe1utyyMSGhJNGV09+OamxR335LGNhviFIK
	9osa2rGA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGyES-0000000Gkmd-3XTx
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 12:37:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAZNCW806673
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 12:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=; b=X9h8osMaq9D2iy0z
	2PFcQUD4l7Qq6HwRsE6sklUHygN3xTYsLtJv/3QFURff7GmrxJPUqFa3/taifgY7
	cor4ZebDvuqyrYmKTP9av8sjIqANT1vJScz98DPcCpIo2MqH0bXGiURQGyRyPesA
	sQ02BXTdCGyED5WI4uE2KVkDjNPPkb+ytUE7GJD9RYmATyxLNCW1xQ8IrCO2adG/
	ZKTPbV3JXkHLgG2jqz+1p4eKORYqG+rFZHh5yqVhFgfEQyMUOzOJinQ/xAV8ORr/
	1CpcI9HFRGnVIF7zfV72FM0xJ1MpNH2/ok8q4RGSAkhnYdVqcTUjfd468+0oEiqq
	JU9vIA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bf7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 12:37:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so1112255985a.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981437; x=1792586237; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=;
        b=CN/6/FQ0yTJCM68udW/9yRoTx1UeDbMiyow0Z7P5Nb/XBAOa/lbjo5R9a3r9SI7cg6
         XMzcnWeaQMK+m1agIu7Zr0UQauk0ypYXU2GIDr7kBHIuAfsDFCTH7ditJZjRwqWe/3xl
         c8uLi5sAksHqEmSyRPfN7331WC0In+FfqqlOnh0dfgcWrC004Jicn10lI29XltH8i8sr
         Rcwo923hba1A6L0pSlUrTLjQhoXWsm91RAOegBNQrqQOdi/PHT5txTu01dEu6suOHw5M
         oeE1kAQPnrItQ6Ec4BGsK9b78DsipLlO0a0GWCUS4lVhfUxOZ9T6hqnQul9v6Bj3A5sD
         Ezvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981437; x=1792586237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSpZvDklAuE7Px+3pmBQmNRMPaP/hmhQOnKgPjG2M9Q=;
        b=BGwQeLkI/+03u9KX/eU1/ctl1Bq5spfArXMk/1ALYxvU+KTnGV1En4hISAQs8Fx9rr
         LSbMTa7DEMzkmI5UliCDQ6y5TFfD9NMY4blPRh1Filcc6y0jWI6vD7pMD43B6j0vcdj8
         jaE9oExvwGRYoynbFsXpqehQ37CatsoxDcDMIHmScFv8G7fgTzBhg3nzh5B5Lw50L0nZ
         PGggltgSpCydqnEP8gnVTWyENtB48NSXB6za5u7cEqPJueqKYGOACutSupamJH7MU3mq
         3DEczvCr6fHhW0siZbq3q4BVcSjOc5BbTFxM/OvQEQMm+8RzIiarPp9+BPyRjGo0sKkM
         HA2Q==
X-Forwarded-Encrypted: i=1; AKwUvBx0YmeUGUIi4oYD2MFGMO5iTNd9dbqLjV6U9X2JcUWRRi9aQY5MCKM+I3fU2n7cyzWirb1ewSyuq+nc3w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIX4Vq3Il5JgLw90TUwdoRpfzinQqhmoqtHUwXdHAaiw6mZKhm9
	bou1tX7WhEJ82uHrlSHlwM3ZAFMFAJ3wuqK8AjsWCo7ds5inAuTibCnzx7E3146hoCy6GLu1meq
	GsgtvxEHPgmD6rNjB4FfLfKa+hCaPiWfBv9iHyJ8fNlAnV/UlMte8i4LnJKzfVczAvPZiyDw=
X-Gm-Gg: AYBFou3/LgzglxB3NcfweZBdtri0v/u6D8eYktTLdShOBf+4YauBZwX1l4BbV3C5wi1
	J4f4pDstUmUywnTpEbgQpDPxLZ0Wigl1lLa/bgnDK4OKL0W6hvY9mrhMpfHcl9hIYUvWeXLYwaN
	vmJIfA4CKVqcs0IY3+E+OF3MW4sCfhE0bIsxG04V2PnfvlVOy0IdtH8kM0dridmrKe74ihraaal
	3tPvcBauwwJu52j324YLRx5WUaBkMTc4bTiJ/fII64SUt06LnAVDMN9W0M+IceCOKdDGt2u+KHO
	cSImwYqDYXvaTdNRl8hCOpl1bBBenPAKtDM+ojS/bNVHLwYAD6d+6NPoV+UuACM+xH3yoKli8Gk
	27vIxer/P9fWiGNZehjerEA6xDwGG
X-Received: by 2002:a05:620a:4611:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93ebd0c0178mr2571765185a.3.1791981437340;
        Wed, 14 Oct 2026 05:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-93ebd0c0178mr2571759685a.3.1791981436618;
        Wed, 14 Oct 2026 05:37:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:42 +0200
Subject: [PATCH net-next v16 3/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
MIME-Version: 1.0
Message-Id: <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=J9yeJClaAz5Pqb+CQAyiL1LQKIlwch/5HMt+VwNv+30=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3dnI32DHykdHRara4SxS9EMHllBi8RbNpVvb
 4nM9bknjESJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93ZwAKCRAFnS7L/zaE
 w7dVEACYXQEJ83Q/QRV92yGB7cs5znjC4RvZ8Gfcv+TeLoU4qXA+kMEYugpyaPG1/YjlURDT2ZB
 uAFF8SeBV8Ul11R3yaqpMOdy/Hl7TvT/EtEzZ6o4dzkfE58+4KvCKwJGZiv7Kd8yfw6QS5+a/Lm
 JKKUte4f8WA+SI7SpSpXO2blXJ40JKryYVK5Dy9F8cFK69kDBxcOC0goo6+j3BCbH4ZKku0y4Tv
 HeJ3OWXpkVz2VhcBFRQaWC3sDZ5KsN+DSaQfxTNsgnjI87WXvtyR0M7msV6/0tqCSoIDlN1RjOT
 6JuM3kGD9PqzYuwRy7zmFVsVpLou1oeZpiQqHwjBPHYfgb3SHhtRI4bqhqCvmgqoSWuOF87veTz
 Pcs0S5b6MwESHuClnn0DEXVm+/SOqqMcDXz9BHQERa3gYzglJxWogGmTU2ALIMst4s4GqhuoJ9l
 zbE+Y5xRLfDEJPwI3Tv8OJVjNwhUe8PwTqsecOd2XC0cep7xtLfwFnFmlXJ3b/hLDdGxFzkhRv6
 SGcerBJ4NUdI9sNVqm2xZJ0aRfmhaw5oqL7FnYYlHX6NQsHMkiyiBC1Y4LNYg1vQZ40YDfx5Dgo
 gsQgc+L+xsjrtl8c/6ZfmSizWS0cJ3hykju0KOVf1Y0iqcifh1Ug1TdZlU6TK+tol6J7O3QeqRi
 SK++5yF89e03Oxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: doz-4J1u957p-kl7d08xdkuBG6Re2pqS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX7vJoHah1MxM+
 CzABEBswLkWhX3gcuPUEg8PNrhEn6yZNosdLoBK6OWrrrhwDHKUucnjMqxfjiuduNLpA4SOxlS0
 ZrNB/nDDbF4QO2vxTHPQa4gNNgMCHN0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX6KVPoNDl489R
 BtFan6NEb2s5LqbfM90+sZ+hxJIikgfhO1MMhZTi3gQwujZ+mSLnD9orbB5HB1+ICsG+8j5H6Dw
 YfKujVhfBbp7X+8D9g+7ofGK97Krl5/7idUyHuijUTT5IbD+ykktT6O5kVCefG2pZpw1ueUnkKv
 cK8foJsi2beAu/O6j7LSHYgrYm0ZyTKecJR6EQpNIGjFBK+LE+hGlp34d4mWRidz/tAzzdjHSjl
 gt34CLqytT/rfmJv/hIFCs+dBLQnpMRw3sg7TRZuItpx70a8u89zbAozp6BhXh3KdLH0kUUfYcc
 HlhDPnV+ms6NqmDlWKLCY17KtVGSGx3SJoRQ3T5UPoIRELVOEpGVHGm0i2qa67Cm705Df3W0Hv/
 iJ+JWjGXRydvcKB/bL+jlHu6dI73px2CnQsu01BOp/VaAbsFfOpbFYO/pqG9gb2B+giQYaJvqTA
 kDGELf+ZMYvnEECGFGg==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf777e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: doz-4J1u957p-kl7d08xdkuBG6Re2pqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_133721_464759_98410027 
X-CRM114-Status: GOOD (  17.59  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..e2e611a4d2c06bd567e9d5e353b3a4893623de6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,22 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_SGMII ||
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_2500BASEX) {
+		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+				       ethqos->phy_mode);
+		if (ret)
+			goto err_out;
+	}
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
