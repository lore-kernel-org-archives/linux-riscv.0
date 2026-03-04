Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFF7EFCE53
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 23:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8+uCiREcmJ4ByrEk1vsBsf4hBJ7gZHj/QEiwocQSik=; b=bqVMvXWm8ZBdX+
	eg3vzdyGgQJXxK0iSGhLYAmBKoJq9zvCPPqw2b46tPFOBrWedfjASDBya/1lN0kJHyz3jKzGuLg8e
	AU8/p3cRsWxAU+N9JgnRYShYAdHuE8QTKS0SAQzeK9M/AWUU2HJoxXgzKqFBCBCOSWWFjndNthSUf
	4EeEGuqfEvALnB8BDcJgJ9y3pXlEq/ZNPAV+enEfKaoaCj3jRU5UAuRtYWBT9lo8ge6cOeSaiwnCU
	RaI1unaCI/+Z0dfP+RjqHOTvvDB1TzEQezgyYq6UbMNXhmSqHsJTwuebYU4Xy+1iWos0ATfE5n3gW
	hfHx4Xs7YvaurHHKtZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw2E-00000000eUT-08hL;
	Wed, 04 Mar 2026 23:53:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw26-00000000eQ2-2gf6
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 23:53:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHQwt3838681
	for <linux-riscv@lists.infradead.org>; Wed, 4 Mar 2026 23:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V50tlCURGOSWEpUNVC/f5JBG
	lAu9WVw1+uCs3+cXy8Q=; b=bHnTZhnFYn/tiIi8J4ULThpsgbab7UrmgW5OOJJi
	m7XwaAv8gzL5i/PPJCFmKWpARNfKhBWcj2eQ98Jty0ias+PktBjqdKCkXAPaELNj
	a0Gl+BUEEowrMPAKllx/ORmbxKvdbnv06gsWNMRC4vNwMWDRsN+/Umbybcd+e88B
	r/+5sfU/Jr5rGByjhLIWV29LUZnpLgy3RQf4wS6C8MkG2aHm4Hpng0Hc/lXMymq8
	+xAymHfPQW0I/zSIuwudwEu/Xyt9EGrksONWTgra0NIIeQgGca3xHZntcQ/B1uyx
	S9yybI9F7OtwJgszxO8ID4FgfjHXJVcqqpvfDRNL7lu1yA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m12h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 23:53:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso5525854085a.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 15:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668417; x=1773273217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=;
        b=J9wd2uZWy5gz4IoBFr9hzd30sSQmVfnpABgYEshS5i7mAGrqQRmgj+AZ85/5uW4mhF
         FMhI+CuRrw3Ah1E+50Aq0Su3VVY1mcD89uueMdQibZXWG6xsybzjXoqbJANSs0dskjv4
         V9VhSUACbpxZ6lQKatwtw52qFPny3q5FxpNueabHOM5sQ6VWBDOFS2aiDNzmkD3u4mxf
         IsxLbi8wtMG3gzAPa8CgcAG0obDJeuomuCUGfbYTXS5Hac3HpvCZyknKhXZnMqo177NZ
         jtb6Tghxr41mCphqhY0jgAGrFq/CDToRWzMTo1XCTm4DHjpT4DnUAQsMy50VTxTo3dd/
         tvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668417; x=1773273217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=;
        b=EJ6wrTs2t0CPpE/cvYlpozH/yf4rRDp/WofPVQOTbDLyLxmS61sLszrzDuAvKEcngU
         gkxPg8lT0Y9OdzaASiH6tPbCTGnCDEPMFRbStIpiNZl+bUXuyTw62Agoy+Ov1VCpCZcE
         /sdal3lmDTt8at66OixYkeJwiuYCeJDL2iu4CmZg5O4eF10G0W4IOxoRTSoy4YFQHJ1m
         B7G5a9C2t066wkXhIllfNgzGNJ1wA31Hcphqm60DSzsTeCqTxAAlbxJF98VHW64NuX6Z
         /jAxC7QJXEfiILv9spR0gFLPjW3+mDtGPh5OMq1aVwyb6ziRYXhV61Iq9qnX8YmbbsiJ
         Yp9w==
X-Forwarded-Encrypted: i=1; AJvYcCUIzCdbycf6X1BWQB4xDp2ELS93RDObtM96JHJkChEokyBVzBKq6yHNu3JgCqgOJwefeQx7wzKffry3pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTa9q6LOUgQyea1nXi2d9CJ6yORqu+2Km8OjH6BPDlE4RSe/QB
	P1hUOE0SzxhkzD9m58NMGElN9LMSeSun9PvD6F+aDNwjxUrON2CFjIxGkMA5C5CX//xBMprkKjA
	Dm9qIM3ku4ySg7XkyKusHBl8BDSLI5N6sUwMSLDxCn6+U83+ED2IjI465xPWs3qAI8NV18ZI=
X-Gm-Gg: ATEYQzy3f5jeQ+dhQJvYEJYHR0O0RKucNRF4CGg4Dsnd4J7JvGbi6TRJ7Yl5zTwNw8I
	XInD4pv0NQQF/bQv25sDNm8ElPkfheMGGdxcDLQW/NMqW+xmrYnbizJfctrjXXzCmHoC/8bkyKN
	lMd/RHKDc1rES8KlxoCpwWJyUvQhegn3OS70NY7QH/PmUnJ+76eGfZ54SvuBXTpn2ZIPEuIRY2i
	6g3smJ7ahjdUNZ5OssrlDAMeap2rTA2VpPp7A+ofFurHJRVU7VqLgzVyLJZgIM5SiKsw+DERatr
	LeRC8M5foW2KFYIkjskBDQwkYg8rIa3qUMzOE0W5ySKGc1GAW0Tv4EAAPeRmGJl2cyLHtMAXnp/
	tiIScRA/JXAFmWKVe1E/LqmxMwh3Zodub03d3Dz3jlpJ2WXa4Terp200X9sGGJ7seAzsx7Mv6bP
	+TIAh3BECJnvJ6QWElMzo/QvF++YitO7wI3Ik=
X-Received: by 2002:a05:620a:3727:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cd5afa6707mr498607485a.59.1772668417042;
        Wed, 04 Mar 2026 15:53:37 -0800 (PST)
X-Received: by 2002:a05:620a:3727:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cd5afa6707mr498604985a.59.1772668416537;
        Wed, 04 Mar 2026 15:53:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1296993a0sm933837e87.31.2026.03.04.15.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:53:35 -0800 (PST)
Date: Thu, 5 Mar 2026 01:53:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH phy-next 11/22] drm/msm/dp: remove debugging prints with
 internal struct phy state
Message-ID: <esbforcln7bi4e5enmgwqj7d63usdyoobxyo3hwd4paou56aoc@kjlizz3ubksd>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-12-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-12-vladimir.oltean@nxp.com>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a8c602 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=3ogKHO_BN1K2bhpmqR8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=ST-jHhOKWsTCqRlWije3:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-ORIG-GUID: j7tpRNqNiPZfvtgJMiTCJvLSLIojs0x7
X-Proofpoint-GUID: j7tpRNqNiPZfvtgJMiTCJvLSLIojs0x7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NiBTYWx0ZWRfX2MC0PaVe0EhE
 BL18U2TU+jvcUpW8zHRPl8VfyYPk2ycVHaLl6vOEX92eUPDgZ2yDSu2OSLjXMtF0LFF3TeiznMa
 5ORGQy8OsNSuD+XOqMR0ajZ7Sg8fb6nrAAfIvrnEUFxm/zXwl0KNV7NY7RxS4mKpxhHmxo13PeO
 EZcuYrheqwfsbNiNWjQHHhNZ1cqy5jAGJBs5N7vrdb4tHhcH2B+/0TWqa5TAo86CjgpkFyiEQt1
 V/5I06tjlM9fzGECVMtZpQUiz95pyqmMdkqXh/QguH3+O+922wDhSAq0BkPze52PYfmxTSvVKdT
 nTrB/hfthoHA0Xm9mIDN4GWr0ZvDpZixMj8dq21AC64En0iAXCJAYNHz0eZ4vhEM9DPrFQYN0QI
 5vJUK9WjNxfmKYL0BCZ+K1m/WbWcL1MGX1QBW5t90VcABnHfh4YLZqUq2wZOro/ipJh4lymmpbE
 HZpmLjRUD7W7IwcefBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155338_690078_BD1065DC 
X-CRM114-Status: GOOD (  12.42  )
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

On Wed, Mar 04, 2026 at 07:57:24PM +0200, Vladimir Oltean wrote:
> These do not provide much value, and will become hard to maintain once
> the Generic PHY framework starts hiding the contents of struct phy from
> consumers.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
