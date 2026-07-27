Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E071C5321C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwVngljqNkoIVp0S6fgCYDg7pnmlVBBCcPSCKWT7/l8=; b=cLVVo17p19X885
	wKYBRa6qLFOzUx9dHuACIl3u0dzAJB1lzUddq7aczoF3stTEkjLA+Hak/KJy4RLaQKq5pNWLYFz6c
	HePdDihTguiPJo3Wy+xyPxEQzkLgx2e1cscUDH6OkjWbA3UigUHYMHI9GbD8cOaeCwnGhQq0HAcSs
	eU8g8HrTS3AaTJdcR/S+Jkj8gmBJhd41hz59MknsIoF8hZlzPuNetNHlQOCP6zBGOYM5zkWJ6TYw4
	rurFRSvJpOPdkUorIInFYdZHW4dmVqSEaVmUjsXs0hhAf55OUlOC1cSJZevw10IjWs/tZR90kQIdj
	QhZ4G/8VWTpJCje2QEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKYm-00000002ilU-1z8X;
	Mon, 27 Jul 2026 12:35:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKYj-00000002ijI-1sOB
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 12:35:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMCGw3322527
	for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 12:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=44rzlthw92Pyb3IiSzSQiDvH
	WraFwPuyNqv1IZJTnr0=; b=OvlEfZJa2Gb68W5vnOidmz+1rY7r3EwR1TsK6esL
	APGXdea8+9tVyHs8yQGHF79EJ9vB1o7oM5tkOQbg2VmmnAl4g2L4Hogu+o1Jq0pQ
	Hl5xDaNCJtnQAqTl9BQpU1p+JlYoPGBbeNABgvpqZErCs29WsCvuUmeor/oc774y
	pQl8Kr02kzLsQKIdnv/2FpP9MtpyWiVwdzAE+LE9Xsy2J2FngW47uTv/junf8/M3
	KWWbLvr9ssvqfhwGLZK9wtPcEb279z0UiEgMeBg3sj48POOil+FL6h1l8RtmuE2i
	8ePEY9kzaAlWC3Aaj0oDbw8IpORtKdSOidkjSr+wAaktKw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2gvyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 12:35:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so1795193a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785155751; x=1785760551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=;
        b=fW+m7tCmF3oRdlDVqnbBBbyLF/FWLkaslVU0IQrvTk0d1SMfTwRDyJFHOu5YbYOIQe
         pFk5Zyz/y6PZVWiNLYAu1EZ6rdYtuCEDu1Sgy+FotDwGRHKbI4REL8QRqLoEP9ZZgRO/
         IPJe6JNX7oA7E4cHfh0p9bqEjzggGAB7RBzM9mnFJx+kZwAcMIZvw62y1GFE/sYzLQ0I
         C16pXQNI2KK6w0WbrPeXEz/bCe43d1LHsrvNIkkfd6TsFTCYpC6MSjgNpk/X3pPq4FsK
         pIYTnwslLK7DtWTgqdxZHa3hsrSeI7l9ZYdcWIVDILVNckBGuXed5I9+25Gum3bjhNQg
         cAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155751; x=1785760551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=;
        b=CVHu6Lv6FEQC/dzb0NZEx7vtX3rcAn+6Xs/QnlNnsDruhFpfG5uFu59PMh7edFD+dc
         BWk/3xrDicEI3+J+txav4NloH07Gby8rZFJGGToreQSDJYswnLfVDIitulzh+5dfjqLe
         yhI9U5pLCdi7D1ZckTTcIMUOjg3owM9dY5Qqy53Ls8ekw9Dez4jrAoLbi7ktQxAdclk9
         xzbzmmeiZfOwJ4OsD5bHdzRYmUvnA5c6kzUwnlMgDZmS6mWO3mEDX+vwTx+r9wtWjY1P
         RlqqArta+jteQFQo25r6txPmW6ujdVo2eDgwFNNhSpFerHkryX8XmrVmJ9n6Ajk64dUv
         fs0A==
X-Forwarded-Encrypted: i=1; AHgh+RpKGEJl4HOxPAzjAzBuNRj06mqd57WrwotSMZ2QxnMx7gk1LwSBoa+qUhnaAQCIr0JWQ+uG6xnsDxRBJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2caDXvjp2T3DSA6CEBQed1w7OcY6Es8fKWpRcnazQNB8V6Y44
	RJ5mDqsWkAOS+9Za+jsNLWazB6bMxTrufvDWV6At8cIPgXq34mjYJOGtmCql0ELSkFOMFyvYD+v
	RnPwaHAQpcP4x3L4gKnEmeQKvYxD2RIymtmKdsUzFKit54717Fy3pkQexG+vo+Ks/u4HT8hE=
X-Gm-Gg: AR+sD13OigSleoGExFREqSNCTJfCxGUHw+E14a3SSetWu18AwbhO9gqGiQY1v1ERjWB
	c7JBRmm4cjzR2GNJWaU+JTCn9EOYXPWV12ERmpKZ3LjXePLLVcgP9p2UkJMjgvYOZ26CXYw7p3D
	AB57Lo0nSC7beqgL3EX6d+Itf1F1VZFeOn0Mt8peXO1BdQ0vCllMa1Cmtnqya0zjo31ZELBj1FG
	fC1UhpF14bgnRLysr1qW0yMbgsCxdMZL7F9RSf2JFMcpW6i6z5ObeanyQLbMWxposoE+bXwEDLD
	X5XuPBBnGmLHnTXg49NvxuerNiCkpXnsnDl5+sMH0LuJ3//nRyLLaRJrGqKLycMQ73UjK8l0f/7
	8VXHImr0fadDTr9xP7aJpICZkJ/A=
X-Received: by 2002:a05:6a21:3990:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c67d9b4670mr7490790637.2.1785155750448;
        Mon, 27 Jul 2026 05:35:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c67d9b4670mr7490750637.2.1785155749813;
        Mon, 27 Jul 2026 05:35:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm29439425eec.28.2026.07.27.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:35:49 -0700 (PDT)
Date: Mon, 27 Jul 2026 18:05:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] soc: qcom: smem: Use 'unsigned int' instead of
 'unsigned'
Message-ID: <20260727123533.hz53oknuy3xwzw5z@hu-mojha-hyd.qualcomm.com>
References: <20260727-topic-smem_dramc-v5-0-66188b3e338d@oss.qualcomm.com>
 <20260727-topic-smem_dramc-v5-1-66188b3e338d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260727-topic-smem_dramc-v5-1-66188b3e338d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyMiBTYWx0ZWRfX4mOWQKRjXP7r
 ahVsWFLXCg+pjrG9W2IVTc4B2/YPQ8J4VF5WXTtFtF/HyrKdiYC965jGeYvS8nDUgosVaDBtVp9
 7UOYpEGguiabMTqsusr5nePPh96Tt68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyMiBTYWx0ZWRfX6WTY497Wpep3
 lVFCB+AmsHLRccee94ioESyTaspexmrXNc2Spbuq0LkdwgJofyEcd+DAw5VlUMYnAakECuXsC5D
 o44azCqawpQJTuItl50JQSaHyrUhLvGDM78uGuOq5Q7ql6rD0mgh8Ao30vloNf3fyETr1UupghV
 K0T3cJmzH7zi1J5TLKoA/vuU5mJabPAK0wNFZPd+dnXhqzO/9TF9g6S0P+hT0RkPhBWSCen5gLy
 qtvRezSKSONhJBgLKcDFp3vGs8gUzvyUJE5SUKYj9WWmSRhnInPRRM37essStlmtyBrsKcSloUK
 e2NMkIVw2vdjmsp4aREE9SYQjpUbvGShEvba7MIFaPoOGewETgDRotsmYNhDPr+qNWKgI9UBUb9
 Lm/8FwVxMuBIydYnjtrmMyKk/9wIaXZw4fxAXwlCuC2N73xbUr5s2j47x5Siw6E+4u1AHFjt4g/
 OrU+JHACs8Pvdcy8CbQ==
X-Proofpoint-GUID: psIIbQ2bpJnMNbt21IKGXXTsqTxQ0dBP
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a6750a7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EZmpetop0t0RzpqVzL8A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: psIIbQ2bpJnMNbt21IKGXXTsqTxQ0dBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053553_595274_EEAF8DA0 
X-CRM114-Status: GOOD (  11.68  )
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

On Mon, Jul 27, 2026 at 11:59:27AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> checkpatch.pl reports:
> 
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> 
> Convert the SMEM driver to use the less ambiguous type instead.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
