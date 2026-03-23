Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE726EC01B6
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 09:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wlpYdxuzZ1BYbEfKvNQcfdlIBS89RHTJ/MNKG9bu0U=; b=jtIwlps4+mmZFW
	UJn+C/fDbi8Yqcl9dEhx1LJ+OAh6LCnKMNuoxd2PtJomnYwPz4kmGxEmR84kzs0Z9clzSJqp5Gxxj
	QmQVkLrC9alNLf/ptRGEAfJ6luGol1YLlty5UTKO54TRNHz68yKGf4LudI9bhYUP4ySroTx0Ml3JB
	rAu6Gd/fHz6GSwqrlqFyES7ICE0cepwvJK7BHHEgJ9BMF5CnutUzMXZ46imziIx3Ejn9aKs6oucs5
	5kawiqcsj0nC3WqNgyCu35eAAN/DjhWvLhI56rdqxoKobI3sHiStJnyw3uVh9zlklq+fMy6vj+DPt
	Ryv3aVcDZOILeSVQqQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c1O-0000000GQJd-25zj;
	Mon, 23 Mar 2026 09:56:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c1M-0000000GQJ0-0csT
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 09:56:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7trt63468141
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 09:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GoF7C+0OzvK3HZkaEk+SFwd5SJVOv6KxC/HGxRU3XUI=; b=ORjHQ8ajLR4jVPrU
	Y0LhdWi+fwYbnrjYkp7tuXLLS2KivJXuP+mWaL2nkDxoey4qNMYq8Ztfelda+O7n
	p7vN6SvWxJFsvIRenSHwByvvIXiy2w2guy5CsNEsvyX74fFcF9p4xAc6CPabcgPR
	5SpT3U6THEc6qhvARViwnsh0k3weT9MfavtjRJanepFLio4CJ3UiFXPAuT73/vM6
	8Z57pEumqXGlQXZH5kaT31TZzy3ZPCSChMskYhNxKmiIYfjrQJ7ebRf5ErZOfS3I
	Q9eSU7+bRiQ/eIHf0R3foDiTAdlUdRmr+LCDplWyHgn41fi4CKahmPwfqUZumpsu
	TC7PYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jggejm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 09:56:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917996cfaso7085001cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259786; x=1774864586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoF7C+0OzvK3HZkaEk+SFwd5SJVOv6KxC/HGxRU3XUI=;
        b=VgfShMdigaT3w1F86rkaQbVgcQlJA1EKvTgj8AIbi7qTuB3hPyOfeHC366hbDo3B/B
         A6LQmUsgy/2tqQh1HggmYGSPB9STDAuwpLOic9T6tiZYrtOo9fSm0vEVsOI4khRsOO2X
         94wlgLtjJ9N1emIem6jtSFriM5X/ALppmbybxLVlJjrms1ixRvXFmEzGmRdblj0kub7v
         jKosRnKUG0uxv+GAYQfZg8dJVCwRdmbHqSZQm5jrFKODNNaTh8w/dtTdUBsNR39umzgU
         lrXfhcm5/xal4cxAx+IT3VqXo4gT0dHDLZa/UmzGjnd9RSK5NVyIZBTlvZ7COl/OXjnw
         cwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259786; x=1774864586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GoF7C+0OzvK3HZkaEk+SFwd5SJVOv6KxC/HGxRU3XUI=;
        b=jAXqChclwBNic+fc3cN+skWNEnufLypZt0WoMyW+rxckKqD8oWXAixWaZm2dpk8tou
         rnMYh4TBgbO53IQxn3f0LztnModxagsrmyrMSFBGGqyJfORK+jSadNj0p2t5G2JonjBN
         +9/XkK/zR47stLOvIb93+oRaxC6U2PeK29oXQJNYHk8q+PrscWIl/DmWMCaA7DHp8K1L
         PT/9pjI66l/d3U+z5Fi7VW96g4+75InCNRQ3gREQvdLHFgBm/5AVIozgTHQXESfdvYBW
         lDnJGACv7lwpZn5YMn04sj3cZZL6+fy1fGQxaU12BfSJ/wikQA6cIrblSqRNuLv+vR+A
         +AXw==
X-Forwarded-Encrypted: i=1; AJvYcCUkWw8hQrq46vdtzTsewGBzAfzEabHzC71Gr4AMJLBS+nvfksS+CdKFNyQJTo4dQOAGYz0UPsOHdJrWlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2+YXcTAj7BiVxVoi6hC+o7R+vvQlgmMdz64f1GsdDNhVcHucS
	HPKXofqgMFld1NTACEQoFmvHJiEbWf99zIG+hHWdlWP54PUk16C0whL0VTHo7YnRRSx3NE04uW5
	5GhmYwAeZUfSa8cBYd2KzopdpsTFfw5GyR6wHmLs7wvZIAe468jpjAVEarA3IcxeILlRhAN8=
X-Gm-Gg: ATEYQzysgEfbHrMPl4+6V/GG3SVmlPIpbva6LFJMrQZIcu8nTxhU8EULFwdYreKyDC6
	DlNGUhcwwBB71NI6Ul3kEHf0iuc6wU4VavOY51gF2dgR8GvUX4QXqd/FEVnRWe0iOA9NtOeI5gu
	a8vueW8ln8885uirJmG1Vpbw+Y6MLjAJt00oE+zYLQdlAJj+3qtc0toFp14sgn30RXXnni7NvOW
	A9+YvbmA+Z9lT65E9mDAfN/ACI/uCPoljPisoaIlb2rk2pW8DL2YJl5HX5as4V3MkkK7qoCKYef
	TCOc2GoNootB5Y9WxZxkONIKbNUsig+zoKNF8siyoGlzp4NOyBYwwL9oUmPuJ1//EeBXXI3CSNJ
	GK9kjdw4W4mABPiSLD7h/FQ1kW2AP/sLW5uSVlILFaPnGzFuvnMQ=
X-Received: by 2002:a05:622a:5c87:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50b3746f5cdmr171184591cf.32.1774259786259;
        Mon, 23 Mar 2026 02:56:26 -0700 (PDT)
X-Received: by 2002:a05:622a:5c87:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50b3746f5cdmr171184201cf.32.1774259785772;
        Mon, 23 Mar 2026 02:56:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:abd5:2e93:595d:57eb])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cfdb4659sm3688967a12.13.2026.03.23.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:56:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@kernel.org>
Subject: Re: (subset) [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
Date: Mon, 23 Mar 2026 10:56:20 +0100
Message-ID: <177425976898.21144.1074460491522922532.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
MIME-Version: 1.0
X-Proofpoint-GUID: vf0iAfTB0HKVzbdDJr7F5AHmICf_UzYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfXy0e6VS0J1nYY
 EQwkbgVIoiFhM9TUt1BKPP4JDxKTtjB6BmX1dN6i7Zj+l1jO36deiMm9WsB0jsOOeuNpbS05m9N
 /8mzx2yI7a/ZTUhEhNpQEqZw29O8TxSgIcutuk9n4oTvg0TwuyLlBfS5j51X3+Nwt9MPbzxdLPB
 b9yTH1gE/3fafd/n7u6p14kIN4jqUj1E656Ur5P9+aVFo1uJ3QpAr82Ro2Wsv+uoN3ieRE5kyqM
 1+EvTdeh2P4SSdGSWb+yEYSDKK+iN2JG8JwXpGqrkLo1RkJdLL7UvmJMWKJPaeBK1b7LW+uvP6d
 sHE/Al8dNZ52Z2EBEisDUdRXfTHP8rBOZ/fjudczyLsaMEUhBuiVDsmuI1NHVxrrIJ5rxYuiv6B
 gBejlEouanLbYFYzcAOgKBoHyd9NGG0N+Cv4/EH9Ru6puVcVB6aRcbzs6t0hwjAL5wchkYyQgGd
 IZ0Grg+xwkGN68+kSYg==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c10e4b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=cqmKwl5xsonCTfQwjNEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: vf0iAfTB0HKVzbdDJr7F5AHmICf_UzYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025628_189653_872A0940 
X-CRM114-Status: GOOD (  11.09  )
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


On Wed, 18 Mar 2026 11:04:31 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Here's a v3 with an extra patch updating the gpio binding from fished
> out from my old branch, fixing the examples and setting the permitted
> values of gpios for the controllers on polarfire soc and the existing
> binding patch's example fixed.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: gpio: fix microchip,mpfs-gpio interrupt documentation
      https://git.kernel.org/brgl/c/ececb46fc947705f22cc8c1f9182224e7ec4bb97

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
