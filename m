Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E268CCF2C1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRZnxBaDLy4ilmX9kqs+vhXDso+2rhqEAmloeqA/wnk=; b=fPx+7ZrPIh3ugx
	+r5sSxmj4UA/zBivU0rtJ2K/GpmrRV6TuPcabOomNmEAPltRqAChZ58wSZ/5YmKd0UqEbW6uJ6H5p
	cVOp7lvOSGgM+XkaEtEsvtAKpJeiLYZHY07nxtt/yqn1K5vjYhGIUFlHHnCSE2iJlOPwi//hXEcyg
	9we4CN/CR8aKh9ebLAYdSOxbmJ1Z2jghc0GlHfYGnAY8Fp5Qlfh+JPXiXaOAp+BiqLTiiFizRg5/Q
	GcnjJmKLgk7j0wVXMyUzEHVnPMdTdA6O/JKZa623ChHQ4ADzy3mPC/Cs4Uh5gf85LG4QqEVHfdDSy
	VfN9SP9Yyb/PWxZovtzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7dk-00000004xhM-0GXH;
	Sat, 17 Oct 2026 16:52:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7dg-00000004xfi-2iJJ
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 16:52:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9pVd2533983
	for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 16:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwGr/VFcVBThPZuxD7wslr2Y
	PtoE5+81Oolo9GzuWu8=; b=ddkdEhfxlYdg0WsHZwg9YM05OnoCCx+IZFh7CpvA
	fZM4QzivJbpNpTR3Qtvrat7NqSk6ZsAwVBAwG3CoBTtAjfQGMNpWcuQ268iZAdGt
	b60a9SGpXkDLJ6ph+xnqDDr9mh0at3I1KPAALHtr+svlkjG7/Nu0r9dSvr1TPFdT
	ASyOqglJ2l2IcfKTLLF/bBQqY7QXhXz2vgiuIIoH98GsX7hItE+yHIikqJ9+b0XE
	900wrUHa54nqfofviVcxz0LDmr5v/J2R/i8OjdfSzkD3oOKAXZspDdj/WuXU8KkI
	nVOP8wkXAUnOP9wrXm5HU6qi64684cL5vBonmhbOSiPozg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys1gwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 16:52:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1333829eec.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255927; x=1792860727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=PTsrsF4/L79za26wwDOBUUUmkEtyFD3oZjQcnPYAq/7DbmAzwJqJOlvHdLPmEfOjA5
         dRdz1MdECnsA87aAz4n2on5QCzLZ80txRZtczzEliF/prreOo+ggLH35lCE6ILW8f58H
         AtsdifyrNMrcNMcd4Dc5pRLivejWt/r3RUjZdLmH0WF6n6Qo3MxcBZrRLhXccvHljDmW
         ZP1GaoEfG2VA5Rb+wd6J1lfu/Qoc+9PFUbD7Wl1Hy18k6Md9lRlSd3xYZ6gRmrAgDS++
         iuvphVl594dGn/SCJuZ16cn9rCc7cP8R6aRluP8SwufnrsSNdtkspIUqexbPcgoS0yX3
         S36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255927; x=1792860727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=xRwuwD196xM7qJL224n2Vo8R5N6PybjywBNZ2x/tMOLMV1ckBeKnUWHGKKhKXCWZ2q
         9NHqdRwilpm9rxoBH8z634FdEvi5Gt6B9CpwTQ0+B/HMB+8whwhwqUGowwzy+d9+FoWj
         5cL/RdKfxwpk1q7mQvLGww7SbvFQ8xZRE8CKBhibdwrnkg/0gThG34W4R5ky5dgbPXYw
         dcnXnzPNZxAjXIYwWR4DcSjNuhkMZWnNIwUaUmm7UBfaw5synEJCOOlEIiV7WVncdqEG
         NWqnaF1duhIx6bv91QJgJoAYWZxvlSnASaMMk1muTqUAglPXBgKwaGJT7OyXIctouwzw
         JzNA==
X-Forwarded-Encrypted: i=1; AKwUvBxkTGbGYJ9v6/EZfhfqdt9upBkwBBPrh0KstIVVnCCO3AVPc8GaRqAHeIySYVeke1EX+GK7jK1f/0sRXA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL9G8BqRkX0oBcTeSHPYR7AmxBwqVFrO4HPGxFf0FgMEDjkQu3O
	Ls1d7gSxsuJdObPgdnG91tPeNkoJsYUBseHEXpbVFGhfpf3F/SJUqYPR5zRNO2JOEtbweIx9eS8
	yc/Zjmmw6xZcPRwFzUJOS0AUXyPJ2+aRHOfwBaeEfO6UlYKFgodthFbVcJcF/m590UddXed4=
X-Gm-Gg: AYBFou2wF2mHlWBxITHIC0jc88YGAsm94Je2IQ0od4KoKVaoDlBWfnXzG5h+SzjuwbS
	2UB8wO+wo6vPBA8eYabiu/juPhe3/uead8SO2NzVZ5LxXHMg/gWKP3P/48yHXbuzg4WHJjnm7yC
	afoKBPrmubMi2+SYkiz80WVbdNH/z7rFLvvtwbUcKMk4M57w4IIVfhpSFE1aU9CyNe4DFb+N0dz
	/cOlJ6wGhau7Cn3Wmcyzcd0S0r7mKs0Ha+fuDNvTR33E/oTQS930cPHC9QgjdTSfVtg6vJHVOzO
	KaXD5gYAyayMz9gj4G5Mtz67brAQnuGw8lmY7ZOnohOuzJnqR93vRFGc+zDNky2kpo+on5gt5bY
	Q/GNhxnX7Zj+Z
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246704eec.33.1792255927217;
        Sat, 17 Oct 2026 09:52:07 -0700 (PDT)
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246646eec.33.1792255926579;
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm16487376eec.9.2026.10.17.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:21:50 +0530
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
Subject: Re: [PATCH net-next v16 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Message-ID: <atOnpkct5QYK9VW1@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfX/BTK7GsybIWo
 y3h5UC/guJJ/y9LlrqKbU3THrfayTlnFZL6LtVUlfs2ADHUeXpIL02Yagtw9s5N5BbECqNoiN4+
 j1Qk3z7ciTkw2Nvlf+m+vzKPH8a3t2UkxUso6K42F93BLsJ/hLeA9f5oedUfrJFIuhWDOmx9cD4
 p5XYYjDC7e0EsQUxIaifUtijerrJV6sS3YpspSTQWJWLOyO3IddME71gr4QWKncsfoDb8rHv3+H
 jhFQZyXHFFGK+3B5MQfyce/8+Zud6cSe8RyUOzYpWW/UlF7oFcOEiASwZQzzhbfG/xcDPL7Wlt6
 iXasEY9x7iIOw7PJCif2O7lYaNjfGs3H2BMEIKbHpD2auv03a/iRVaKl8731oFp0Vv+GeRojy7y
 MqaAMStJKKJ+I4DCMhclM9l2aDpE1a+9shzagMG79JqE0hGClk2qZOj7ce9yBGhlAtK3uYRqAI2
 +BBJSeqoC3M8NVcqVnQ==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad3a7b8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rqvSfYwyKISaz1XZPbMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: -ceaR6H4ceolutPKti7i3fUhjtAIzjG3
X-Proofpoint-GUID: -ceaR6H4ceolutPKti7i3fUhjtAIzjG3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfXzyoIuleluyep
 sCbFp5AHxjgx3Dmdyl6fBpWxjN6Efu5sZrSj1483nzN7RtGt1s2aIXy1hWvMqqJdBoowSwJZQql
 CSLHYlxZFbY3DwYOCKqGiRv8QvIuHBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_095208_696242_3DBB3554 
X-CRM114-Status: GOOD (  11.72  )
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

On Wed, Oct 14, 2026 at 02:36:45PM +0200, Bartosz Golaszewski wrote:
> Ahead of adding support for firmware-controlled EMAC variants, extend
> the ethqos_emac_driver_data structure with a setup() callback, implement
> it for the existing models and move all operations not required in SCMI
> mode into it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
