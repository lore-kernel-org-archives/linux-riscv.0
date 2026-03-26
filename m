Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EED106F303
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBWunGbBsXC6Otw4+4QnpqkQ/wUmyXouAOZY5j6LydY=; b=hppQO+qlxFw8HX
	kkVJnDCN108+FvNcWea1dw7f0Utz/9h9Eff6Y26RNFEwr7YGDsteg+BABHsQTxFtl9Bw3KO5nejSh
	2rsJfTTaNB4s0ytvjpoE1X1UG6+u4/skl+Gb2OMeOem9F3sYgNTh/aIuUV7dKQlNiADzpwf3EcFrx
	tE/UeY6h7xbhvj/GyNDA/hltrrME+NTs3BtgH1b8X/kAR+Rjd5LLV4RmxDkGDkh2Dp/o77rshDgqr
	Pbx9keONzLGR4VkqHLNq1XVojrMyYcBE/r9zh2IRnikj00LqmcJ5SC2pMv8huJnihIIGJ7CjHd2zi
	fy8O4GGffWzvt17VXBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gH8-000000052sK-2DMz;
	Thu, 26 Mar 2026 08:41:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gH3-000000052qh-2LZJ
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:41:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8aW303958516
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 08:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=; b=kwqFVl0va4Ro4+rt
	fFgR1pQCzXvp8Mms5DBXi0Ow2aYvPUaXH6hlIhO16WnSpOV8MwbNlmWjKWe9TKJE
	J5coywcqs7VMaFOehqKnkiVjfyGA84VV0WzF2crMLMozmnJHtB31gFvTLueSbfT2
	oJz/npWpybSJK7bmwLETA+J1htz3aqgcjl5OnJrb18YiV84BH13+p0O7sLaLxWWp
	qjvKUy1ZBqwJmFSvaZsWvbGKJlGUI/ksvGuSF852jMxu8vFHlEnGMIjHl/YKvGZ1
	YDL7/rX9w/6AkkPIYPuiFYRcd6YJpfYxMRNWh6hNffJVdy8pY1E6zmtANkTByNj1
	7zCBdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjahc1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 08:41:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfdc479f68so121953385a.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774514464; x=1775119264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=;
        b=esFW+z7sDsnt2/deeBnQpFnxlrsAEtHdGxkrVkRznLIFo85Um9rRPWThdkg3mzSl3C
         uRTlmquJ+H6fddRgVVInC6PZeXvQGu3nuG4fUVNDWpN7Qx27LMa6pWkRSLJtUo7/wcw7
         3EgFA2u95Nrg8fIV1ZhRoUDvv5Q3TM+snBL0XZ3HjTxmtoLzZZ5eOTyxRcnsz8AxBCMd
         nmxandvjzSugIrPmBPaxDRX/CNoWcZatqWefzYQ0zoUiWW3izX0wc8eOCvlAbkFwwx/B
         Kmw6AhnKM/mji42jK1T2brq9Tb3BkIZvEv8wx14MpvGRIw0MjVwNnNCMGjNdWNSHca8u
         i4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514464; x=1775119264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=;
        b=jPs052lroPQBmUNzvAe7iIsfKESxMKRS2R13YD1NtrG6o3DYiBR6sJqNvvp9rJeoIC
         9pU8d8FWDbgmgxgnq9slY3oH7bjN/gxchK4csG/MVuMr8RgB+khrMEOwwceA8egiVOQ2
         KNt9jHtX9ZPAxgTRtptkVPPBq6j2iHdTu76IByFmxqHmo5qOZRBBjH7oWyfAO4a2AjgT
         oa+2KJg1SsftYXEMpgjVlQXLvUK3jFqNFGAogVlxXVAdaMSoLjPeRYfakttEUp3M7bsf
         xPspa/akGNQc6QdeMbId5xtt/KxbLSDSaKkIv1RjDoy7H+vvbzMHvPfH56UvNvUV21EC
         W+/w==
X-Forwarded-Encrypted: i=1; AJvYcCW2FNgVuVYAHEme861o11koTKRYaBiTFbYKFz5Dq8/wBT7+fIB845KP2gDHY56IYl4/CRYI34HEIkZA2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5K0RwuvrIBad4c7jgSmiDYCTvxvQhDuqPDiPhsTk1me90oolV
	12Zp26VrhRljUWQ4LhY8r+6rjbrL2qP0N4jE2tsV82G4Fj74eDIfi9ajIyi8DKAZDNLp2o+ZQnB
	DeZfYs2I97kcO9Wc1csMW2daHnPu8liSqs9gi6X2BMODHhGxOKP1PCWwocUC887KHiQYRUok=
X-Gm-Gg: ATEYQzzTQwiAHqEnaFBo8VoKxgkOg4dNor7NZJ469m4B/Tt/LA2npYIdjpcP2i7VQJk
	OIW9qwsPMu1/PHfDbelc+oQ7Z9BxxvGZ443gJLS6gMbPmkhQ2ep3IZO2TfRQ7k/I1n/O7LUTHOe
	pxkW3eDcv/m2YjfCBG492GoEGhjVsXWY1Wi1ciCQqN68gFw7F1EcpEoATRhZbPZ1fRxHWMCrU4J
	fn2C424wDHdbTKl+G9IqernRtL5rBKgq/pOL8iaOBGhx6ysKW+U4Zgn9dFY3My6Y7UipPjyxcjM
	KxffaVYNiFPHGeGQEmQYXxZLXCtXThJCaAYoI3UMxTsckE249G5pDwh/9lx/Cl+wgJDWb7EXfKs
	FWQML+uhYczpqWlChcbzokJW0IQ8cFaQaJ8dBZcxZ0X4WQjZaJDY=
X-Received: by 2002:ac8:7e92:0:b0:50b:44cc:2a95 with SMTP id d75a77b69052e-50b80e36ab3mr91222331cf.36.1774514463719;
        Thu, 26 Mar 2026 01:41:03 -0700 (PDT)
X-Received: by 2002:ac8:7e92:0:b0:50b:44cc:2a95 with SMTP id d75a77b69052e-50b80e36ab3mr91222121cf.36.1774514463190;
        Thu, 26 Mar 2026 01:41:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:92a5:ac13:cd81:9625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c845b8sm16608955e9.4.2026.03.26.01.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:41:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
Date: Thu, 26 Mar 2026 09:41:00 +0100
Message-ID: <177451445822.5060.11939390617609457696.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325100144.1696731-1-arnd@kernel.org>
References: <20260325100144.1696731-1-arnd@kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 2k0OJ_Zg-r8QnW0LkapLcvlrRXeetm3v
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c4f120 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=faeRYzTSnDSNNYB9Nk0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2k0OJ_Zg-r8QnW0LkapLcvlrRXeetm3v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2MiBTYWx0ZWRfX5BPSF691mRNN
 t8oFH2rWSPnYBk3Hh8y0sHq4QUF1PtiKb9PFl0/UTcGRIUbu5Wm+Ir4P3Kp1DrqdmBFttPkMciM
 3bbEt40oR8hB+nFyp3w8tnVaVCUW/onXySXUtEL+S6d8mijeFoFI1FpsKMBJAxcVZx2RME9h+Hw
 lRsV61ln4kcIE30RbXUWuATeUIqmnASV60MWjQTm+sti4GSJdMmRjqmya1DN2URMVPX/qUDQzwc
 rMxbzcOTEnIAUj4TDlsnIJCS+ajgoPa3yHJSxNr0yj0G33l+S5oQzs5t+PTpAflAwCws2aunVig
 BD2ZW8g/8CQYa+o97oUi1Wvl67Vsqak2uxN3TQn6D/mx1QBSAfq2JR9x/LUB1Fi3HQuY//od9tj
 Zl8z5T7t2vNm0Ldc5PRRbH4ATiw+oNR9J1T9IiXQ++bdxil2of85dVp+bzXttfTe1DfkELOslXN
 Gnx31d9XsoVoiG0DZWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_014105_730594_43A8EDF1 
X-CRM114-Status: GOOD (  10.38  )
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


On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann wrote:
> A number of GPIO drivers that used to have a CONFIG_OF_GPIO dependency now fail
> to build on targets without CONFIG_OF:
> 
> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>   Selected by [y]:
>   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
> 
> [...]

Applied, thanks!

[1/1] gpio: fix up CONFIG_OF dependencies
      https://git.kernel.org/brgl/c/af475c16bc02a08ed6af6ca0c920f98a45611fe6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
