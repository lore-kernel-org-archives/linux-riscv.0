Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB53AC79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vWriUSCMFNSAA7uc/6aziQKtAsaw7Kt5Pgc8IPg3nA=; b=mS3b3chheEZUkH
	wAjLa3EsIjB7Nb8/P4kJwZjILMQq80efm66ep0LgSlNgybgEPwJ+7elMC3hBaaCY7oj+4nb/5HGQq
	X+Gzjvq1idTQ9JZwnYE5u2QC9si/hom+yyTZQUhvgx7aCe72+T8Tk1goJ+hMFl+JpbDA5HJ5nOuz9
	p+yxmJCk0R4kMdnwp0SukjURQcR5vmGm3YWyhnX7KDVWOSb4dkfy1uAuMzi/PI58sLCWIC9cMb8fe
	TyEEppm6U8c+BJ45/i4zIX6pLxHMo+d/TtHhAx/ZK6KepLdbXypZ+5hNqt9HoZ503u9GnjoQhusZU
	RRcFfQ3Po6QKPtYKvH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xHT-00000009MnR-3pvZ;
	Tue, 08 Sep 2026 14:58:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xH8-00000009MOq-3Byr
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 14:58:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjGTA3627422
	for <linux-riscv@lists.infradead.org>; Tue, 8 Sep 2026 14:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0N7yiitrW6dR7p59PNZxxyK3pZtNPXwOVD0qGLv/uw=; b=UrNdHwA16moFMjxf
	fJMD7pH4j0/lZ0U+AgJVseFdFW4hLsnlOMdoR8Iobss+OloYgzBNeMoBUZOMDjYS
	N56805fokNTB/bpnz8TJv9pQUhiYoRKNrzkNbjhkMUE3qLMTtgHjLQ5vAXizYydr
	IW/DH8y6a4dQq/Gg6Gw/YclNkuv6eaPdQ13pKuChIJQc1QRqm63HT9ZKlIl2/y4W
	Y/mQht2pu4kkJy3loTphjQF0/1HdO0BBpfPMnzOS4xSIU9jNccw4s3zO7R0Iz8Pj
	w98506pIY5mq3j/8EmKgnocSZ/is7sS39+oSAnfkAZhy2MbHIXmzuFHKCPXbaH4p
	5diaRg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7j7t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2026 14:58:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb32961e3so2721562241.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2026 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879497; x=1789484297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0N7yiitrW6dR7p59PNZxxyK3pZtNPXwOVD0qGLv/uw=;
        b=PasbNqAyYt7SiUbQ8uYFb795FGotYoif73nmmB+ZT6cdYO0Grc0XwAfiu4SoRFrQI6
         lGt/88+ZtdKj6e9hQues52vqzfBQNgHCAQYUMdX0tpQDMK3l2Qxj4la5aE3Mri6nIN6B
         NF8mMxE8jEzF9Y78irsA4URuSqo0BrHQeKlHB1bEuqXtOr7EJpzMa/QYu6l3Y54Tpep+
         8ZXNjuIrqoBX/b/ldgZsaWYsnNAFJ6+6aLX7f8lr+RSkFg0/y/Mv1HWS9AwDaj6tMNvz
         TmqMaOCJckP/EEqywN4tNsjWDr8yJFXC2PmHIvTwLBO0XYivedXrn1Bqi4IfuwVQSd32
         04RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879497; x=1789484297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0N7yiitrW6dR7p59PNZxxyK3pZtNPXwOVD0qGLv/uw=;
        b=rsRLjtI2zEv8DcQvulr0bFuO55BHS72NR7l+0ibmg/5MTWuMJbK4LYtncCZwTs4Uhy
         nqpDdQmSk6z3D7SACdfH0SK/cdFh3/w3MGBFMMILeAbfovhP+6QPR9UBzDislsclDld0
         gdi6zySCFNy8Qx0+ZcHLiHed3r9W2TmMNQg2GzYMnnCB+T4zVJJudFtz/5lgo6N1WLze
         CRsQlCl0FliPFSI8GV5q79VPSUGwlXW6AcutwfvCFWjo9pk0i6lnMSRFnbT30/a521Hd
         b68oC5YdoGaclHMFqJrGJR6ZnXBX4bHlbvxnI4ihNY/jJR7Kt73WDxC/U4uJ0tBarjRG
         ch4Q==
X-Forwarded-Encrypted: i=1; AKwUvByogHx+dfUQPBa7laBQOGBYL+nIiMvk9Eferz2WWxW5KSRMecfFRZBUcYmO8Js47ChiUk2sXj6Fhp7u0Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kZ0jmHuyAvhVtPggcRrXLtzuE77UWq6ZtcjQNxcASC+FA7sSyM
	uoxSCpIPni9qYveFMks9qNm0eUqAVYlBCSMde0Hfb74Qnj5G9at6u1hYHwtZgBHoivuPvpffl3W
	ogQA8+B/UksypaHQlKAJ0T9uMSZuqhJ0tn2ltKl9T/PfboZeer3NNj79E7Oc8IU9DxdbcJSs=
X-Gm-Gg: AYBFou2LMqgvvs0ovem4Z0SeF9dgECT5UacXzqZEv4lt0s7U9T0B/Gob3XSLrVP2PeK
	P/WRjhvRcX3mg52hXPIenfTjscmVrPq000VDwaFpFSgCyYolp2//e7yfibRF+0ZZ5AScHBK6zCB
	dpka+D2D+d3EwjL1uxpfPWFW5Arvwzlbh/jcaXRKELpXyi/yoaLdHYxcvnTFiYyWM6VkbhJhrl5
	b6UHgvGJsywabOJBW81FmhX30diX2/rMQXzFTZMtLCf6kSIP6Mhpy52NedBY+h/BaAGQLX4Wb0J
	sHbcK146aYVoD3fuLYvJ1JiEJOnhEWj+K0vVWKWlNpgrkzkkZ0F+ZAjNIUrzqwXp9B7FKsrEWmY
	dAAwug54HipTebd+QAnBLnw1KaHg4
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-78a4a72eac3mr14116034137.3.1788879497204;
        Tue, 08 Sep 2026 07:58:17 -0700 (PDT)
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id ada2fe7eead31-78a4a72eac3mr14115998137.3.1788879496786;
        Tue, 08 Sep 2026 07:58:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:25 +0200
Subject: [PATCH net-next v14 06/10] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
MIME-Version: 1.0
Message-Id: <20260908-qcom-sa8255p-emac-v14-6-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DLq5kJ6GnQDKhq8FVuX32328SGe67zNr4t3N9JmNPY4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJs9HybHaSqzBfK2Veao8xyX8UXTlPcezcbj
 QlPlyhTxkiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAibAAKCRAFnS7L/zaE
 w1v+D/9iBpy/Ln8FSiJNFaOgPkx7WGqGjICkj3LljoYYONiLgB2AbbniiS/o11WhO6qaA3KlYCy
 5LpbCtIpTVc8+Hr/pdu+wDKOYKMU1x3Co7RJPcQDRTDBXbAn3UOdmYo48WkNu3mDMU4Dkd3bbw5
 K45RxGgRtI80+uqgWHFtKkKHnUi/KtbJH+4tT+bTmk0bhPQ7fqcgh/q+Pg9ijh4Zmfh6yyOwq7U
 TY6rIOEV6WalGxA0WrT7qNqvvIV4jB42F1qdYuSD4ce3AGZ9iemrKyl7qTE5LfOEMezpQ6lEr5P
 5RRxrJOOFtAHSKMf7H+8q039bFTIzhHKyG2hin3YL0duAYz55SGcBdfcPLxdfPga7JS04y2xkr5
 /04dhHN+1c65cwArcgWGGuCapxI2hvyEJdJEUg0Ny0+ezM3BvVFt8KW4xAa4rcO+mRjvvTFEfhT
 wwRHE77XpXq8zpL4yzW4wHiT023lGqHKQaBfqtJOzpD56dgQlZYX8zIZ/XVnz80DVKdb0VuJ6TI
 Tjtej0zBwwzi2noJhR4vy8malCbdiMtieCLlMibgq/nXB9FCnsQjTIIIn2oZI3uZfPtT8hn2TsF
 ASBniHYS1DB52vO23N8V8cd3Idv3x+i7LCDlX/FL99+cCvn8L/PVicsv9qc7QKgIiy2f2JaIrej
 lGHVVieGgj1UMyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6aa02289 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=fYsbkC7JaC8eFfGKQicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MCBTYWx0ZWRfX2/Ka5aImiaXW
 Amlu8P3Ehhm5y1zLeKVBxwe/j+NYBwtP361jqAhg4xiWurjHYJj6DgKyIC8GOh7mP2o0xShOH73
 mNGk/mrva7YLg9aXoUBB8HgKuJIeTL0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MCBTYWx0ZWRfXwDTnaXoFS/xt
 HYqg7E9+vBhAr3S7PpMGMpa0eOWwEaB85X9gc8+uSPhXnpgjjY8AcYrmgQCwUulZr7kjC/bUz7V
 wvCnZyw9ooBi2Mg22LApgH87DvxteU0+GwFFrsUFt5hVZSXzU/EmbFExIu7aq03MxDRtQUi+v4u
 5q9tMQ/bnBhhmy4aDv5PuE/zogaXcY9WmvCJvB5ZELnvydmmEqtQwuG31HH7SqHKLY1BHwxpuWP
 PYgFwC5PfA3EJXZlLBPDPwh7kpQHefmeZzV9dRpCh4jQLBDHepHHexKtvkyHOymnS8yZDEl6J3N
 WZjtycZSznpfQjLCe+Qs3MJinsoEaG2iQbCHfsyfJCfJ2KAi9pcNnMnzYtF5m8CPgmzAouVbHFo
 fr2kH7o8ZyGInqEO4DAFJttJ5gUlGSg2Z5KmhMtmoZkQBCuRdRM7ByE4CPASPHpK+FRFTtibG97
 CzCagCiYwZw08/mPU3Q==
X-Proofpoint-ORIG-GUID: GtksY-F1GhieeXTAHga8trDasMGXsFD-
X-Proofpoint-GUID: GtksY-F1GhieeXTAHga8trDasMGXsFD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_075820_584118_99C6892A 
X-CRM114-Status: GOOD (  16.76  )
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
cy5jCmluZGV4IDQ3YjcwYjVlNzA2ZjIyMWMwMWYxYzBhZTNiMWFjYWZhZTY2NDExNjUuLmZkNzQx
NGE1MGViNGU3ZDRkNWFkYWQ3ZTkzZDQ5YTU1NTAwYzdmMzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMKKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwpAQCAt
NjM0LDYgKzYzNCwxMiBAQCBzdGF0aWMgaW50IGV0aHFvc19tYWNfZmluaXNoX3NlcmRlcyhzdHJ1
Y3QgbmV0X2RldmljZSAqbmRldiwgdm9pZCAqcHJpdiwKIAogCXFjb21fZXRocW9zX3NldF9zZ21p
aV9sb29wYmFjayhldGhxb3MsIGZhbHNlKTsKIAorCS8qIFRoZSBpbnRlcmZhY2UgbW9kZSBpcyBv
bmx5IGtub3duIG9uY2UgcGh5bGluayBoYXMgcmVzb2x2ZWQgaXQgYW5kCisJICogbWF5IGNoYW5n
ZSBhdCBydW50aW1lLCBzbyBrZWVwIGl0IGluIHN5bmMgZm9yIGxhdGVyCisJICogc2VyZGVzX3Bv
d2VydXAoKS9zZXJkZXNfcG93ZXJkb3duKCkgY2FsbHMuCisJICovCisJZXRocW9zLT5waHlfbW9k
ZSA9IGludGVyZmFjZTsKKwogCWlmIChpbnRlcmZhY2UgPT0gUEhZX0lOVEVSRkFDRV9NT0RFX1NH
TUlJIHx8CiAJICAgIGludGVyZmFjZSA9PSBQSFlfSU5URVJGQUNFX01PREVfMjUwMEJBU0VYKQog
CQlyZXQgPSBwaHlfc2V0X21vZGVfZXh0KGV0aHFvcy0+c2VyZGVzX3BoeSwgUEhZX01PREVfRVRI
RVJORVQsCgotLSAKMi40Ny4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
