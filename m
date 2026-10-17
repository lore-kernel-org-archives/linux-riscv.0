Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84178CCF2C1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5pJbF+5WsnybcUXBR9Bw+l+frOfwgNzH97CaTki/Rg=; b=Zq+sOZqx6AfGI4
	DOIhh2aPfJHpnfniMEH4WFc1+raZJ6u1SJqaLiBKm0GNN0gnG7cyHV3KE1p3Oa12T3cyjKLC46BnV
	qmYlTSYqkbUmVjE6u5CbZnUwsJSBox8aEPP7SthMYiXanrAgfItD7ONBV3y2Xsb6U2K/g1sxLTMFX
	HB8B4sd88rD5bfW9AzalTEfc6vnAKQJgF8T6sPF8b+oehHYSs3Bieow2Astp1ObdYpOGGixSBpciH
	R3ixZT4Ee888YddEdrQcLkX68PjDbA6c36ZgbER3qRBFFtcAMLxsBnRs8kcrF57nsXnllXo5GdzmR
	XdN6KXU9Dalog1fTZP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Uk-00000004wn2-2Ndk;
	Sat, 17 Oct 2026 16:42:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Uh-00000004wjq-1aV1
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 16:42:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9smV1332658
	for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 16:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A5QXkyLgqve2yg7aR0QbgBy6
	tWTAd+S8xlmq02cu4VU=; b=lNhoZ5KmND8CPcI2ztJrmEz30rkXHlfA6ZXPZ/BF
	dIjaldaBjswQDQz152ahMBvv8elLhUYIikte8R33fvDM1XFYB4bJJwxbmkydvHs9
	eShIPCBWf8E5pwxIyBHGeuDQy6qdqbdVggs0w6DviKRSBV4mr+P3cTJTp4wdY74Z
	5KS3ymg6PgRQRKbX/+YVIu7Re+hZZAA+q5SytRzeNXF0f5SCG5w6ckx/tUicRxJW
	NwxJhIQeClRVZ0OtvWLuWHL0rqEzv6Gfy7aqB1TktkhdKtYwuruOrhAkDsgnYJJ5
	WmRvDQrRAWN6umuhYE7m35Y2hOg40tfgMs8wZ1wwrVlYWw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnsnns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 16:42:50 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1863220c88.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255369; x=1792860169; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=KHHRRs9D9rXxwuqStD72wm0lV8UbC9/+xsXoWFejfstpoY2ng3UpEUh4VTUJ6VUe5Z
         BVFqFQ1rtfv8Z1lSfwY+vwTYDVI6yf2+Sg2R+hcF+KYZ0+6fgKJpZ0oqWBzq57MiGSJ1
         cqYqakSV5AzsVKLRxZkOHPTGC9bqSNA1zFo5558/rG8jG+thrBwW9G7/skx0bop+zq/r
         Re4zS4R4wcpUkjYb8v5rrIWR4NdvhDUa+614Jvb3q017u+Nt3tSqHcHsXsk+Bilkra0t
         xEMoTBuoETFYF6Ng/RXrjxKCRYUILeBgzBifug5f46XooI/AMGekq287lDAlxtXb6tXp
         31Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255369; x=1792860169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=oNuWpJc6tM09zswLhCLN3I3wEsqrQyQ7/LSGN2eBgzGC1jTS3teGwQDzhTPainkgtw
         h29tRaN13HvzOHuVXZE0a9LjMvlxm5nZSmyXN77KYF2bxcwNrljP99JbhpAdUqxnv9sm
         Ouv20+gRqBrzBEp4gvIEq7K+3fuIAZv72sS+JsWwEVUtccF6VgvAGlr+J/PLbRlJSB7z
         roZQhN1rDM1mtgLI92yvxyH3fRY8fEbDmv3lyE6rCieb+pEKE+x2XqoqwXlL/+lyESDW
         w8WhbGQttZx2DFvwlhUpKNTAvN5AyG2XhQozTRQ8fVPuLZTdXE+8sa94/RIK7qKthhro
         tYMg==
X-Forwarded-Encrypted: i=1; AKwUvBw57dsTOK6T9w9IXJmldHpQw83nlxpvd5rt5KNn01Rz3OqPTuLaTf4NuGuF4DWpj7I/vGkf8zsoKTkpGw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKeesvxKca6l4/YP9ijXBHE/UlNRUnMtaRtPqGV07tSCnuBCquU
	aA2lKy6cMsQ544gmoDy5e6hetosW0SFajPIjy0IQzU1TNXYJN+UVs1/lOE2eHawym1ArzkSRc2Q
	kZAX0UVxklC2lBw2Jf8nFG2HKBMPO+n6BLR6fhNB5zte2che02stWtIxWTTmfoX1K6GpZsWI=
X-Gm-Gg: AYBFou1Cf3Pk1koPAC0Ck6FqlmNOQx5Gg4KGH51iSj1uaV5VjtxHsP3V42o9RDCgNiy
	kSjhlmCDn3p2sutyXWir3vF15s6ZYQXV48DhtChnFY4+xADEuzd5TkMgAqFhW27npdQVFxJiPZW
	LeDvHE/FJF5PCkC+GNEiPTP6Bf5FZHiqeFe4KpXsIN4/VqApe4+9nA3VOP8ukasddi1UDqCwUOP
	DAYkoKL+kjD47jMhLqP1LxeBryCf47brZuIt9yxsknSjYysW+aEiRu2e4IeMOzdXY7BgpqTOkxX
	9ZaFgf4rlBRRbp15uso8RI+IMUhd4ZBF97weRKzpggU4eYE1DGVMEROJOhTwGdLWZlmEVYj0hBk
	Le29VE33OI8tHTw==
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689793c88.45.1792255369365;
        Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689692c88.45.1792255368055;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm15041602c88.5.2026.10.17.09.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:47 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:12:32 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 5/7] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Message-ID: <atOleDtybJde/UE8@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad3a58a cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XX1oeNa5M8xgm1Jp0F0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: rEENHKcHWFn17VRPk-yBro0vJZqmWmvw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX+u5fy/ggz1D7
 AcnKaLkOAkQZMQdeMkMasQE0+T2NR1xRMQCUFd2VNbCMw8uJpNH9cGMck8Ux/gzmD1zS7pU3hZz
 Cruw5WT5XOnuKxCogi1V6VQL4i3jTGU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXyEbByNO+fba7
 AkhPvVq+a2b/vr6kSOMq+ivCrYAcFYjZqZLX/vMDadxH2GDRmHdsSfsRek0+f3kgdQWurrx0Dsz
 LdzJB+NARIfMkAJxW8k1JbLWqsX0xtRoeutmR7d6ofmMehQftic0x8QoZ+sIwxgBRh5zvcDR6oe
 oqnV4tDF82GHnYGxX4bf8fcH43IV+hCoQfYiXN6aw/vQYzjaI8jMSLVBgEQOynjyfiu9eo5UhUX
 uR5N2UOkif3DwOkgQmxz57QRLF6VwE2wBYTH621s4CSwxyIoB0yBrwWXhe1zgP30J6Q8AibFQbC
 Aq+nY+H0z4bz/2hQSuJ8JmL3AIM/yeA1VzHzaVUE8trL8O3HHsK9ILLI2Reasr/phiptnD6aHAC
 5YgKzO9qxu65X97VY6//9u/2Vb8l82lX71KRtPIL5Wcz8hS7mBXD96zR7iSIh1MkPRHrs3Ayz4m
 G5EZULA8w93VCNs8yHg==
X-Proofpoint-ORIG-GUID: rEENHKcHWFn17VRPk-yBro0vJZqmWmvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_094251_531297_0FA1A920 
X-CRM114-Status: GOOD (  13.29  )
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

On Wed, Oct 14, 2026 at 02:36:44PM +0200, Bartosz Golaszewski wrote:
> Instead of needlessly copying the fields of ethqos_emac_driver_data into
> struct qcom_ethqos, just use the address of the former as a reference.
> It's .rodata after all. This is done in order to avoid having either two
> calls to of_device_get_match_data() or having to extend the latter with
> another field when adding support for SCMI.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

After testing it on a couple of legacy non-SCMI boards, I did not find
any issues with this patch, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
