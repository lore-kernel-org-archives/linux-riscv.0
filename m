Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C80EB7EA0
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dy8o1AJAjLKqOF/WHk+M9TcTyatTJcx4M2T+ASUKlYA=; b=42mL2AODhv7Y7J
	ZnOfQ4qtQx4wFozOxCliXRx35ewghEoN+V0fvry+jHnj+iqCuzYJo+uDdeR6R0z9b2TtACepN3fhb
	fYSKhbL+HZOTjB12k5xHv6lDbvkEuVhXu10ipkjiqfvK9ZRIHV3jemh/WMYYImH3rpUdICXdlhCbv
	CAeCuS5RyhkDmeCFU82BByOmnEc7Vkt7WKWpGJvVhYFCgFqpuZ0lMhTXFdxxRMFbZnq1Lh3qGDSI8
	FIW9NaZOhCmUJG+21xaDXmLd8mQV7/v5tthjhcioB9xcrjhJ4Qz+LJFniar1gkxlrnFVNFwkxfb3L
	dnBgYK+hQmsf9xJa1ckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhRQ-0000000GjI7-0s6k;
	Wed, 04 Mar 2026 08:18:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhRN-0000000GjHd-3mMx
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 08:18:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SeTO632163
	for <linux-riscv@lists.infradead.org>; Wed, 4 Mar 2026 08:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBdjoSFNNf+h8LuOpa7JZC2hs680grH30jkxsaUOq8Y=; b=j/1A1RKAdQQaEOXP
	YOKs5DsVfFj07JcPgkewYywQBq2bY90OJ48/vHepe4m6mOtacYiNV8D5doxsEhzQ
	oXKeeibJMqNkhIaKODyBkUdagQuLpkFSUe4fXckU10pr6I6/Sx4HS8DW2vOAYoSw
	BqEzf0Jhovvt6Ctxyt2RvPYRTZDhrh15m6n0uwvQihiknSaOT/ph4OuaiYdzaHFm
	/yULgbjlmqaE0DyX9sRUPcoZels2b71SXtWc1k3BZTtxQgnBmwayrgbgwEYeSStM
	E2jhlux0EDlMwdp9TMfBUpuE9q50KEXXz0j+WuDZ0Cko70B2piviyLqZ41+geIjZ
	YWRveg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtuc72f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 08:18:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71655aa11so6139108285a.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 00:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772612323; x=1773217123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBdjoSFNNf+h8LuOpa7JZC2hs680grH30jkxsaUOq8Y=;
        b=XI859sgxul753oI0j7YPpdG8goVmE4Zqaq7vdq+orcMWCSoMdv7HFWzqz+ZKu5crY1
         R+qR4CpBnjA3xyjJVadJSw4QTZ4Y7R8H6U+vrJam155W6EQVw7J2/SOn8pkfR+30WYtp
         +3KDdHyPxOM9q8C2QGKrJnqyUGY6a6JQ/PsviAiA3Ctj9OgUOXYJQfLAQQcU/UD8AEeP
         Lo6z3lNvyKvrcve91OBtZE+ZK7z2FZ/j1wm0CyKDz1JHCjt8XHqBw7hLUcRS9Id+Pf8b
         tX2szdXr6019Zn7eV/m2kEyVHz+B8CR7La/Pj7uobtMwc3AW3h+euC/GrYB5FyILZGhA
         vBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772612323; x=1773217123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RBdjoSFNNf+h8LuOpa7JZC2hs680grH30jkxsaUOq8Y=;
        b=AyUafTbq7mQ3gs+xJ6nJJFI3yrqIOdUJdfYahFjvcJsrweVNdHWSZNIp9sM1FOxCq5
         y9md26U2bLACoaD0ax9n5vbM1s0JsEiFw3rLyyc9dzumS+vmKbJ5tub5fn/1YpUfFx0s
         f/7STAJyV3UiFgUm4TI1Xz2RJStutfh7Y+MB1K5GXCHmjPfht4i1V1iQdOCtTM8iZ4+8
         Hg8mdAyqT2rNLmIgsN1xhD1lLDRU1bRT0yaeCJID9nuhwiE2uOKexaeLJwotU2MSNmwr
         MetU/CpKJX3DfTmXkSM/3Jtcc0e8ZaKQnoofu6UXbAf100miN1BdORbmjNpdCtdAPTic
         SNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX53DarlxOc+tIhQ3mWy+R/8nP9Lbe1MqxspwPunVWcOVbGyQIslJoe/CUh068Olmsz9u1GFePjTBlycA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/jY1HxU9dts7eqY/nV/9GVawNADeSFcwX1qulnnJ/uyjg79zW
	7dEuJPBuWEXNWUOHrKlLb2FXVc17HM6DVN4iaPOjLXckZcYN5DZBjKMdcsSuom2hO3/OksOFWqD
	r230H3APMiYF67xK69NVZZM4mSw+4lCYCqL+I7ORZjLdw8HGvuWnEUkAYq0XTy+FbQuETo/k=
X-Gm-Gg: ATEYQzzPv1WviChkPdy+jfOLSqOpcEZnKCHDRsVuNs2zxw7UcyocGrJemLj4X48DJ0K
	fgYELWX09/1PtH3qXWCT3sydjoTIyXgGUxaQM/dCnim4XhtYkUMl3msyEU1j27O6Fos3nej3wbE
	e8PVI0v0adiqLd2E0TMLsTAJQurhKXF27RPfFFZGDLsCSySt1jsgXi6YZXWoU6ciQN+yaSG6++X
	lFdg65/06D43wu268OmRcpj4vXsWPmOGgvrL5KgNMZEkT0wnBeWWs8rJ1RQSEP+8AEJ4GzZ2fNG
	8KC45UWW0e4tRVCoCb52hy45e4AiQBRQbBE51/5vRnWOtV+sJNrT7jfFRgSUgygBBYFXxJM5iaJ
	Vc4TaGjqcKaGyWtA1h8GGnc8BVxHq3kLznISW53zZbHUBtipnFDY=
X-Received: by 2002:a05:620a:170f:b0:8cb:b062:c2e5 with SMTP id af79cd13be357-8cd5af19e93mr127342785a.27.1772612322914;
        Wed, 04 Mar 2026 00:18:42 -0800 (PST)
X-Received: by 2002:a05:620a:170f:b0:8cb:b062:c2e5 with SMTP id af79cd13be357-8cd5af19e93mr127341285a.27.1772612322512;
        Wed, 04 Mar 2026 00:18:42 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a5970sm17481247f8f.33.2026.03.04.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:18:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: gpio: mpfs-gpio: permit resets
Date: Wed,  4 Mar 2026 09:18:39 +0100
Message-ID: <177261231189.4768.12127456284535100239.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303-irate-hungry-b54cda817e42@spud>
References: <20260303-irate-hungry-b54cda817e42@spud>
MIME-Version: 1.0
X-Proofpoint-GUID: -PeytSiPr25hnIRn66ODETCheNEkPukO
X-Proofpoint-ORIG-GUID: -PeytSiPr25hnIRn66ODETCheNEkPukO
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7eae3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ol5VpEufyhQU1HveAicA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfX41vWyITDnxIB
 uHI76550uA7lgp6dU5DJONypj9fL8SDvPViqVjkh9B8CejCXBvaoSZsyS5laaHRVXrlT2h+Yzo6
 pj4CMzt9aRLw07CxeOxltat409aUs0VmdX0RvgiBEmV9xcStkS6wTYCY6R1OsOX+obasja2Izte
 TscwyVJEE2URv2nVpEoZeLv5WCp6MnM3mEcE8bcaJa2yBSbKcko0VtdZvadpUhiK5jzdP5Bzqj8
 wsC3XQVXA1Ii4J3L26a5x690huKe9j2fOi/L51enabNd+wmgB3G2ajwOYi+QIAo4plxdeN7TfQS
 aC0oQYAtu+DWm1Z1+YD95/v6tMGpJwrTocsMvq5dThpTXkV27XoFa9SnfEaQCV62PUG7gVjSAzo
 J2lNGAJf68P2W9qHNnFh09IAHKG4zzH020aDuiApv+W+Tejlnohl4tIS5aJnfZdAimeyhyWjYP+
 sCdkLcG8jFxqe4VoGSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_001846_058730_9023ABBA 
X-CRM114-Status: GOOD (  12.44  )
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


On Tue, 03 Mar 2026 16:33:12 +0000, Conor Dooley wrote:
> Both CoreGPIO and the hardened versions of it on mpfs and pic64gx have a
> reset pin. For the former, usually this is wired to a common fabric
> reset not managed by software and for the latter two the platform
> firmware takes them out of reset on first-party boards (or those using
> modified versions of the vendor firmware), but not all boards may take
> this approach. Permit providing a reset in devicetree for Linux, or
> other devicetree-consuming software, to use.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: mpfs-gpio: permit resets
      https://git.kernel.org/brgl/c/b678676b7a0ab65ad5b4278505d6bcf706e53230

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
