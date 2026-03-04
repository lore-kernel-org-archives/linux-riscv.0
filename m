Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4065AEFCE4D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 23:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIsJRlmT4O0ftSHCu2y2WbB2VMwYX+/wxw61hHbQjxI=; b=0/U8yx2w27r5rj
	YhQUfTjjMkaSFD9d+GdlBVK6RUeS1XRcDxy/eIfD42t+av/C0t6N+6j65pUeFWedkbjKmzvKkdVSn
	luNtHwfmTLaFn/7OKDRDtuURze+EZbyBV/a+BvyiT2Q0m+RZOWpmCeKMMVqYPbeu4WDk+WEqd2hsQ
	h/vI1AzRiWZo4cJPyorFGOKmODlnNl6hZoLBvYno69R7eNxJg1TknNql71T2aq6RoMnBTCjegvQzb
	rHhsKPs17eMJl6rT74qqym+I3iI5JwuTQr/gkFJVL88YMe8QWNbEEjfG8lDYjZC8OP3QzpU0UL2WV
	0KuRpEyJvGUb2kpTqHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw3C-00000000ekh-0QJS;
	Wed, 04 Mar 2026 23:54:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw37-00000000ei4-3v8t
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 23:54:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624IGhRb1214505
	for <linux-riscv@lists.infradead.org>; Wed, 4 Mar 2026 23:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D9sak1pWhxVBrwdJ2BGlDRM1
	u4FQCLLwnOBWXp3tU8M=; b=YDzVpAV36G9FJiGclgosp/BCt62vM9M9b056E3f0
	U+5xxlejiEUamIMH96BixcO5AaY77ZWBlSAKvu5XqmjeqoAku40urrsPuKmmnS9v
	3OkMLayFRlSKj3dBR7WZsu0j9iU2lRzpg2d7kLVS9w5ZRVAO2FJ6BsTzjCt69c98
	JFzB7UN71X/+3QF9qLWJGMzkqHwQXXEY1ttgq+wcei0KjxR3Fsb0D++XmNf1CbY5
	5aKHM5x6QqkmdYtjls//+oqXfFNFmC5IchUi4ZbV2wIf7afsnXeYSOnIz5G6c9dJ
	RXin04p5y380S3mSuZNgncUGt9sD1j/T6Lf+R7oqd/C+mg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5tdha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 23:54:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899eacb58a5so43964796d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 15:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668480; x=1773273280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D9sak1pWhxVBrwdJ2BGlDRM1u4FQCLLwnOBWXp3tU8M=;
        b=RrnrL5IPAi7UNk8KJJ1ZF04ic178Rpjw93ebWO3/vEs/ZO9h/2vUQz9BE2wuoT8vfy
         rmNz+gmqRqR8ga9OrXyf2CX30Y/VVhSTMGoM80MEQEGFUQfubeco06SNDmCbkPmHhMsd
         4qyQtTUJgI78Mlrzwt3fnwFHcynhczoFJKrIGJVcPqT/1ZqsPuvPhPwMwVI6jcvXv15g
         MDibkBrqV2MlQqGWuDSf6E5Z0vywYp5lR2jRmHgb+odVhSnlWl9/xMgL/kK0ztqmVrTH
         GiWAisc/+pmg416JRB8IAp9T79nONly9tg52nKmk4GScF9EWqKVyg0NNsXjKfS3SzFTy
         vv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668480; x=1773273280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9sak1pWhxVBrwdJ2BGlDRM1u4FQCLLwnOBWXp3tU8M=;
        b=NPVDQNAcmeKZPTPJwaJ0IQU/Ed15hFQsDxDDzjLx3crL3LKxFCNAy+7JFTjhkKVVtg
         iIPlLzG+md2bdLve0vWrqaEQoC9zfZfxtyutup1bNU9GrzFW13RSIu2yb1nozMHRawSz
         2GU3OlEG0wN0W1tAG0VoUmXXKaenfYpTficAaqLfNnLYS3aojPDKxPUoA9PTDJxbwWSB
         v6pPzja0qGiyoFXUdYepqZ0Lm1NfHw4LnhyY7fzDsfECC4mF0OYjCsS5zoDgb7Y8SFmX
         TMTykRG2o7yHImdMESTn+mN/lKvx/m8HI+yVv0eAAFPQibdnaTWYXT7dX+gJO0bQSzGR
         GUZg==
X-Forwarded-Encrypted: i=1; AJvYcCXO+sWYSpW67U8A8DHfAxYR9mPPAnd0lB+pNd2xJVA/iHzr4Wc7lMFasbsf8YYdzca4PZI6iQHH0YCKTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRl49DHrr3n5aecok3BoKFkD/MRWVFZx9aXh0FI1Se0kZL9Eeq
	408fYbwwBtppOnisexzNO8fACkUhoDEAt3WAkM/tgrZ/WYqyw4wAHIfzrcAXQ8pO94bQBnx7ir7
	5DlYxSUROf1r76YQMZ+PncnpRDPQMRE7TKXm4qU+VqboDTV9fqcEEQh/DN5Ygn5/bnOY1eTc=
X-Gm-Gg: ATEYQzz0i3rJF29EncDRsyrjBtWgVe1WhgseSlPSsa/B/GaiGdqbWgE6hhKzzXzU5gt
	FK03RVNEDRomy1HnhAMD5cu07dDCggMiDCyKjDdgo0i6ok0FOvGYKaCuYlzm+Xcfsy5dJgJmivy
	jV6O0ytr6SY2Hs//jpQl0B8nII3AXyUlVklB1d6ug++l6u6T8FUO7PNP9Ud61274LAbdpQXb+Pc
	RX8i0TGLayHcLMWYuWNdhTMRW1SL3w8pG9C0PId8gEne5NUtA7aDGz8SuPdXl1HduReaxnd+5nz
	raTHVkAn8GjeqJZHHu1bin6FR9llMelk7iOHVFN3rF8XxQqA5GnCLEaxmIzFsP4XUgR1ltK6sLz
	+dFuOU9BsDu5c9sjb9SKlAOoOdEwOoRLOg6bdHQS0NgVbSiZjrAxibXareJzssPPcG9UyCyCSMw
	neCiFXsBgIsrOOsXpxzd9NpDKF3C1LDXqtCXo=
X-Received: by 2002:a05:620a:2986:b0:8cb:5442:d537 with SMTP id af79cd13be357-8cd5aed61e0mr519314085a.12.1772668480053;
        Wed, 04 Mar 2026 15:54:40 -0800 (PST)
X-Received: by 2002:a05:620a:2986:b0:8cb:5442:d537 with SMTP id af79cd13be357-8cd5aed61e0mr519310585a.12.1772668479418;
        Wed, 04 Mar 2026 15:54:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573c42sm1615588e87.72.2026.03.04.15.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:54:38 -0800 (PST)
Date: Thu, 5 Mar 2026 01:54:36 +0200
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
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public
 <linux/phy/phy.h>
Message-ID: <cleew6tvum3jnflztfcqfwtafu4hjizjvebzr7qrsbnnp7vvrx@fjqhyh57o5hw>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-13-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
X-Proofpoint-GUID: _a_-Zw_cptdGZoUgLzGuUCl6CGlGqdE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX+oUHWMMl3wzg
 sH/MIx0lT4PlUJRiMH+G2omT/0LLfE9aXiy6YmiKJ2yLuG0nYzEmFMWP7dZO2Cuq9YvQ3e6114+
 Gmb8ioA8SyWw1cs2ngcT4O3XgD09+E8JDoknQM4ajlw36geNAJdjuMH7CalgvYlwOK6GshwAqZW
 zPVyep1W2GJtgWJ9qU1dvt542mW7Jcx2DJj94EIZtgPeB0qJtD3NuSCO4re/M1XJ0Laflm+uJO3
 n9m/3aGzR2FSa0K7C9l2JkAXgR/ITwyXQy67tZTwX7uxnzNMqGUSbBtkJ6Vw2V+esvvMlAWzJnk
 z9L4BAZThKc+LoeLpfjNsiNsFwXEWVKh8LjswZV3AeuGF53rRVVig1Yku18yVIvrXNshug4dmdA
 2z17vV3xwqggEg78F5ggmNhs0WW8ZcEAaQi9gcIoo7sdBk41d/8SXeamoaTulPdUFv/eAVUDTyc
 HqT1zry+AHjpwYHnoTQ==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a8c640 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=lO4ColjPjyWKUZOT0LYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: _a_-Zw_cptdGZoUgLzGuUCl6CGlGqdE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155442_099063_7CA97F8D 
X-CRM114-Status: GOOD (  23.20  )
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

On Wed, Mar 04, 2026 at 07:57:25PM +0200, Vladimir Oltean wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
> 
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
> 
> Two slight points of contention.
> 
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
> 
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
> 
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
> 
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> 
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
> 
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  drivers/phy/phy-core.c        |  34 +++
>  drivers/phy/phy-provider.h    | 256 +++++++++++++++++
>  include/linux/phy/phy-props.h |  75 +++++
>  include/linux/phy/phy.h       | 499 +++++++---------------------------
>  4 files changed, 458 insertions(+), 406 deletions(-)
>  create mode 100644 drivers/phy/phy-provider.h
>  create mode 100644 include/linux/phy/phy-props.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
