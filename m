Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64451EEF323
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xghazD3EC1LfDJS3mqOPhyM0XlDUHB5Tc9QDxpFWU0=; b=mP2nsNNt8uvvBg
	ajHDb6lKgMRO9mP4gni6WgJqLo1WX+QRX7OHgQZuu2N2E+G1sFwrxViJs+7hbk4Lt59hP2VX9mtDI
	b90wTZHzgjMli1cF2Ft3bKASBps6SdIhmu16H7CKPSYojAYIv000d1vpbU7dEYTq0+IyWfujvpaxJ
	7nJ3X+/QJ6SuAQMG3A+Ab2DgvUXUr9Up/btBKvOodZlcHp6DZoR5ycRtLlkEXyl2BO5k4PJzcVs+W
	TO9ucFC6dOCziFkxvbx3HWVWhJPVjiTS1aMODQESV1hfgeJ0DUtUBhF3d49ONtxTABt+H0Ak0znQY
	ouvNFfUS33KFPGCFyjuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4FE-00000001Dag-1akl;
	Thu, 05 Mar 2026 08:39:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4FB-00000001DZp-2p0B
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 08:39:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253AMqZ865886
	for <linux-riscv@lists.infradead.org>; Thu, 5 Mar 2026 08:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=; b=Zhs1szgRs6PvG6yC
	/K6l0Og7co3C6ED8icQT7ngtsI9G5Zp17IaIYa/MOFJSyTxAUHo39qtMLOBGQhpj
	JO9fE/F/E4F4LvhAKnAlFKn+fH9sEpkGqfNT9M43WTCJkjqaFeUzfOGpTrDAGNtC
	tA5poP4iW9oFEFa2er9A5XyBDJ8CedmbmCYM1jjJmOXgrD4UqsM96/EbUTiVA/x+
	+Hq4ib0d4uJFejDRNFTAYPM9OxAzG41cfjw0IJBJVDWkmbFbGS1eLwFkvUDxUI+x
	i9yGzbk3U3z2KxBfUGbK5GoyOmpZPSUHhrYGJ9ek999ywA1Q/YTR3XTo5MWWFrPw
	1lqwYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk0ycj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 08:39:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb50dfd542so577162885a.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772699980; x=1773304780; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=Pug3WPBe+xMjZV2lhuqYSbHXUVCZet86PsQZiTY7sG1NRr1B6N2otEtR5RrPVnxYB0
         r5dTU66aV/1c54vYFHua9XV7RiJiHUBJj3ot4E9rS1GBoiJwCU/lhLFM9e3UPv0hzfCm
         E5Q9f7HIwiwFDFYbQ0oRSaSvqA86AwJ5/yIQpIfo0FxHRqValVdImCI6GaRWz53JMkZ+
         sf24Tn3Lq68hl/PAzBzL4C7d55TcpDC7gQtN7nBzvNL9T9q8GZ6j8xr0Is9GFTh1bmry
         7KDBj4DM+ubZ+pqTuohV5/jRHTQc1sgXa0zlAmG/s09CrSJJnAlGl96ry8HbZekBexJH
         Rp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699980; x=1773304780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=e4f8jeqow9IOWoO3w9UqcCg0LfuGdlXcx2F25qP4i9GXcQv8oqoAYEg1oJVD7mhOc3
         sp01qe+HNjn+XRGCTlUKt3p6+hOqlNUUAY3pCwDv3d6APuP+ZxsBds6kO/+tkd2gjRSd
         w71he2NwF11Q0Fg+zUHfZXgqoCy0Op6Y78b7/FQZRc+J/pDVdBuQHXflWkU+iNk78y/L
         WxhnwrgEq3JX5VjwKYcb9Zcoci2oiitDNF2F7h+qigTmqtmvDXVoR0IlMc6cJDLftSSu
         wDfxMObLZO/D0RX/bi2Ad9zw5MJcCB7KBpeBnk1V7EptmDeArSnz3I5VkD7VarcFba78
         8MNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+kfkTiWf74hxDC2/btms9jl/gvjuOIzcppfjM27AIfPgcsJehysyhdTiGBj3vwj8xHYWzxwfzAuVgzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt0ABujBTqsSg4h9mtp1yav6bdOjw+mlpTFXXFoN8BFVRpNr4W
	WqEeYh36vD2puTRXTNAoAXQsT5a6s6yaao9RkOUQbnS0rnwLxF1EkUkJQzJA2xSydBVLJkehcw7
	7U1GL5AEZwyxKpKd8XxNl3iQQrowbEbTMzUBf9iWO1W3jfT8cP955VJ3uSp6pSWLSRr/uaco=
X-Gm-Gg: ATEYQzxQj/1sr8x+45IOLpsfGL5nx9hQT0Utm/w/pl1PTI5CGIfFZr47BnB0fL9NJmm
	gDJqBTQwQ0kqTVNs0QFU55mX2zuMJacRoRdj0PTFacF/Ae1iRCmJ6KPo31c4Nlye2JIT3G2RHNO
	qimtgziD6r9K0ubhuYSg041eUDdCF+801mvmSylpnYj4sv/M5SE1zbFSkY8xmPVOEssmfcmpg6n
	IVFX1fdsD9hsFxazixKku+/luUUU8cCVKVOL1X6pDy1MNzE1gL5uiWXc0a44gFC8YebhrnyaXNx
	cRH7ReCPRHAsceoA1FOp46nyB7Jx/4K+AB69Ty4K5LPBSIMzzQOVvuGakyKaHHSN7XUqHr2rAsm
	Z9mTRrw5mOmVjRoJWHPKKOf5J/PdXP3L6UdIf58aB24QOMt1iy8CErHDtlLhB3BYkY+/Nltlp4d
	WofEE=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452359485a.9.1772699980152;
        Thu, 05 Mar 2026 00:39:40 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452356985a.9.1772699979710;
        Thu, 05 Mar 2026 00:39:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06e3fasm6657504a12.25.2026.03.05.00.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:39:38 -0800 (PST)
Message-ID: <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304175735.2660419-23-vladimir.oltean@nxp.com>
X-Proofpoint-ORIG-GUID: Lau_niguN6ZBmacPM8Nj3B7Xb8ouzn7A
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9414c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8AirrxEcAAAA:8 a=GJStlgXwfe-SXQdWLvAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: Lau_niguN6ZBmacPM8Nj3B7Xb8ouzn7A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfX3I3YyJ3qOgpd
 UOcQvArFHcvncLDnP8UstTJRP0eoQHR21GHgK7VbZtdAl1GCM5+KK8Boc48CqPH/ApI1fDRIhGy
 Xala17kG6mJnKlfmsuc0FdjE/qUdZBZeIwcv1R+GC60K4mGzS68+AK2Mk9xosy2V/cBwIoNthBs
 S7qNAD+gESfUZgEiPw5pJp58BO8RNHYCmXwGozcEEl3Rld3RV4bTt8GOInNJWdmAmrnnMv8HdjQ
 N73BguRP+DWfk+xwwHgUEfXtGcT1b7LFkx6pxBFkmVCYVIDMLqMiaq+c+6rrL2kV5MaDUKNLsE8
 kC/ZuAI6ZdyA+qAvcrduisId4fFfyVfQXONcII+bj7i2cmXhJgYMYFnpFxS8NiB+u+xI13BYhYx
 /N59VqMPTqwoh1aRtJnICdGoKNw/uGVnYZ9Bdoqut0JQacbi2jG6+JEpNu5q56K8IZgW9wiYRzs
 I8DVkUWLuM0tmoYH9Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_003941_836125_7588E9EF 
X-CRM114-Status: GOOD (  18.94  )
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

On 3/4/26 6:57 PM, Vladimir Oltean wrote:
> Some pragmatic shortcuts are being taken by PHY consumer driver authors,
> which put a burden on the framework. A lot of these can be caught during
> review.
> 
> Make sure the linux-phy list is copied on as many keywords that a regex
> can reasonably catch.
> 
> For simplicity sake this is not perfect (devm_ and of_ are not valid
> prefixes for all function names), but I tried to pay attention on
> avoiding false matches on things like:
> - drivers/net/vendor/device/phy.h
> - include/linux/phy.h - network PHY, not generic PHY
> 
> So I used \b to try to match on actual word boundaries and be explicit
> about what is matched on.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..bdfa47d9c774 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10713,6 +10713,7 @@ F:	Documentation/devicetree/bindings/phy/
>  F:	drivers/phy/
>  F:	include/dt-bindings/phy/
>  F:	include/linux/phy/
> +K:	\b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h

Would looking for the devm/of_phy_ prefix followed by an open parentheses
not suffice for the 'has function call' case, instead of listing all
currently present exported functions?

My worry is that this approach is overbuilt and absolutely no one will
remember to update it

Konrad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
