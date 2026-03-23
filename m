Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA61D58CBE
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 03:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9T7B4PGTrAJUtY8MTlh+Alh1p8cHI0DtXPexqJW8b6Q=; b=WIQmIJKE42UtY1
	uiJ+WIuIcB9Ecq2ddQJYah7QDN+OtZP2eYnCTD9S2sU3rYRvba4ZMGQ6K3j1OPw2Fl3aCwfwYqJoT
	zA6WYdrGc3KATUkR3FJ+C0OPM2GRE+jYvuT1pIW5esgCjUdUHPz4c7/80ooGhkPpz+8X6g5rHWgVA
	THnx/QGWRJWH1UBXxbLbAyXaUxIOz8F1ltOSW49jiotPNHH9zmdql0RNMRqsbkGzWNkCv2Ss9y9xb
	iomjNocZIl3URca5NTLmfb+6v18z/BPe/S/OPk6zmV1yPe7tqKQcL+5iZoGF3E8FmU4I52kHWMN5p
	3oTInRuLUTf9mAhI+waw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WLd-0000000Fxwt-2GbB;
	Mon, 23 Mar 2026 03:53:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WLa-0000000FxwY-33Pj
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 03:53:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MMnSlv2048872
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SBHZmWG2eos/Z0fys+HWZX/5
	ZQMkVDuGUC128e2/3xg=; b=LrBHAcfL5InXVNGkVuV8D/y/OCEI3X9xrtuAI7J8
	x+qYR4bqk4ArExKkf0CYnQl4t4t0psm8dRw08fcMFfs/VbzSI+XQrrO1Yk4BCt3V
	AzQGmiFGb9DUEr7D2Les454qUmqZTHe7TvDn42zsN2ZuzUHCsluZg2QMTgIKXmHT
	+FNj5ZKDNeodnSkjPqkfJUpumYdVpoEW+S8kpA9PP9JbhPiqLNVe9xqNbaTM00bK
	F88ZlNc66ZD5AJAe/gxLH9WKRkbxQPvru8Pnl7MX8zjIcY15dBP7RYy5rA7lGemL
	DFY8zNk5p5FoSHra+6r6vj7DZq0PI/yPM7s5l1Ud9bNzCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kdubm71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:52:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso230181921cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Mar 2026 20:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774237976; x=1774842776; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SBHZmWG2eos/Z0fys+HWZX/5ZQMkVDuGUC128e2/3xg=;
        b=ZYc6BTxP5ZVR/3tFO4S72jOyHyk+VcoKj5uB+yiUMrLkoYnEgap3CO3iSHdc4sbTek
         VBXW465uuOQPJh8gnIzLT5VMvFWHyhsrayq/dia2I4oVtvu5+/okV8yxal6ODtriqkxc
         y3ssEIAFt5LX6OaDGeElpsigF6xpv0Zezxbd3r2FvbiQuKnDv6u1YzY4FsMBnOP9+G3F
         sOlkTAC0p9Bnc35Vsj/+XB9vToVLpYryuzoR5rPAMpXpAJiALgcFqQWcHnTyeST1vesp
         ZrFWrQIKAFat7QHcjCFLkTG9r/gWMHszyPLzNIn4TK0IfWRyCuGcP/HH+2QOtG/KjJkt
         KjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774237976; x=1774842776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBHZmWG2eos/Z0fys+HWZX/5ZQMkVDuGUC128e2/3xg=;
        b=l1mheUJHdajRt20ni7fnBkSznMuIUzlf3PBBUFcipO/zocZzF5b5KASklhmjvAdMdk
         gDjSf3pHLvbwyollr3RlC8Dv2hAlJH6KOewD2I7iNQOaOVF9yD5Olu1FzN4pb6nESojq
         joH76yeSxg7bkghgP0YKDxM/yTeAt3lI8RUYYemubrTbhUkDBTpd7ZHeZ936rhCSkGVv
         lTkTLuRv5gBWLCUAufPSVqXbNRROdFmTUfxOevTNq04+gZ2G3Lqzj3wLzLOngiUkNYlW
         FnFUEx3viHdj88Wsq8L7Ez4uLNzlIyl0/XqX4MAzxT3HEuSTYXqhNs3v8rmCfrOf8WUm
         hcRA==
X-Forwarded-Encrypted: i=1; AJvYcCXnf37L/G4s0mILDCHWAQD5lklfOFnFNxwmVTYz8NdPsy0eVeTmPJt+kCY+RFA1apSw6HoWN7rGMcSHzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ2SjtbpObg92Qf1ihV0BXVO04mQUIHOSyJ1G4j3MotO+O0uWB
	kp7uYcNDzYVHtB868KCgUrm5bLTEJNQPnJlgJkYOvmLihra1L9dOcmRokSAH/B+hvQvDl6nI95g
	wgRhpIWefqHHhWX371g/7e3Zk93TNdYX2liHO8G/Y1AGds7eI7oogWEb2eDSfGJOCjaKg6KM=
X-Gm-Gg: ATEYQzwjoMMqLIzLR4xnG8+QdD2c6yfLltNOxlRz0rK3IR1roVSQibRhir2Y2G//JaQ
	Xsp6aJGpa2UCOYLbz5SdPeEsKx/rXEy6Uot1HDe1xooMbqRTN8P5ic1nLZxNqNjpFFcONSJ4SMg
	toxrYlUearVY4Jqt89BlOVsme6SpovSoP7YrbA5tnTMUNkAhrVGM4xRJvB8e+xzIDbAapqVD5K5
	ZFsNHL6aLCQW85Pj5c95ZjcUxKb5hrV2Ua9jZauK7wGOVdPEQ39frXp+rVoTYKz1yivWq2WQ+2G
	KFH4w8acuMYaM1r4GNC8LF+kQ+cf0404LmFathdu/BlwOA/HWxcPeqJxCItlU4t36ODsNubAb3o
	x8Hb5ggVYr6Kq0crmZSuC0NIQmRVHsNKstcS+mYK1gZTdeOjSnrxcEBVp0NDIkOSC8Bhi33/I9F
	10FbkfOO3MQtTjzPrK5yig8SJjdGB3D0X6xG4=
X-Received: by 2002:a05:622a:2611:b0:50b:4e65:95dd with SMTP id d75a77b69052e-50b4e6598dcmr83704931cf.62.1774237975755;
        Sun, 22 Mar 2026 20:52:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:50b:4e65:95dd with SMTP id d75a77b69052e-50b4e6598dcmr83704731cf.62.1774237975316;
        Sun, 22 Mar 2026 20:52:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f24sm2308266e87.39.2026.03.22.20.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 20:52:52 -0700 (PDT)
Date: Mon, 23 Mar 2026 05:52:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Felix Gu <ustc.gu@gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: th1520-dw-hdmi: Fix error check on
 dw_hdmi_probe() return value
Message-ID: <dorukiihun3m5h72y5o7vox2e6rpc4dgommbskj2snai2hegf2@6w3wrtludgg3>
References: <20260321-th1520-v1-0-ec877197770d@gmail.com>
 <20260321-th1520-v1-1-ec877197770d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260321-th1520-v1-1-ec877197770d@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyNiBTYWx0ZWRfXwwdpUaDDHOJv
 Dok5l5bSHKYrssik9bwFFKKccFIphLs27TDnaj8Vi71fu8QGAxROU+9m68ejsP1tqy5bKvdhCwI
 TiFUIv8K11fyh71GXT9dmBTo/hc7chQbWu0aKx525+AookhbCp7UIiIFYO9IPj7yY6uJbkOuxRx
 488ZPAiXEst+j1hbP7VshE2nC/S3XRDp4Vf/LY7S1t7wsixAQfKcuEnyVxJ0I0cIrnTzH5Y1c7M
 vHemKSB2Z7sFovSai6ekvU4JGLS3pcDDPv5tUaz6CtmfYBeVv0+qcyjbjUQE8bX3DE2kQuDIoJe
 KL3lQZm19JcG54hiJybHHRXXTPvMTNZKTxcdOmVmkbU/QBm9Z39n0tOYnCFfSvsD74UQcVoiqc0
 CaiU6ppZSAVOcLy2iQ/aNtjFMm62jDL3GCEKbGIrrjup72X9l7rgwEiom5Ib8QqIebdxdaDusmv
 qcdLYff0VPmhUogNUVw==
X-Proofpoint-ORIG-GUID: XkhSGnFC7FXyWGcq4uDZLaOUu3NnKIN0
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c0b918 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=AnjFVvH9sMFINUPBRAEA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: XkhSGnFC7FXyWGcq4uDZLaOUu3NnKIN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_205258_920696_FE2AE925 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: Maxime Ripard <mripard@kernel.org>, Drew Fustini <fustini@kernel.org>, Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>, Simona Vetter <simona@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 21, 2026 at 03:12:10AM +0800, Felix Gu wrote:
> The error check after calling dw_hdmi_probe() was incorrectly checking
> the struct pointer hdmi instead of the probe result hdmi->dw_hdmi.
> 
> Fix this by checking the correct variable.
> 
> Fixes: 96f30ee0fb9d ("drm/bridge: add a driver for T-Head TH1520 HDMI controller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
