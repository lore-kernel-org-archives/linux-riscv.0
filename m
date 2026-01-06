Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21CCCDC192
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ThNzALvouNYFyXo4LO8Tctg+dRji2KGE2Y1Lu07W1A=; b=ghxNl3J+sWD3AD
	+rHP0UG6RK6uWaUr1LwtqRZfxFLsgGyFgOLQ5tUoquR3o2LhrD5cQJTilkRmIr0qqABpI39BlLDME
	KF9bAmj/08Q2CsFaT1ONEksnAiqKHYrTI6CAnb/qcR8X79tREGSpQ7Dd9VLK3bHOgLH/A7OOWDxPM
	Wa0I8hTzHIc2UZSjUQQGrzNxfuFHClsLpWXQok9ZfLACyBuh7I9ScH0NCeEf4sBYAj4dIliTL7FN4
	RSKd+xH2crc1ysC0H0JnSan7M2NinerZolqnigtehu9lUxqLLp7gdu+WxK3NHWVNfzEo4po9IrwNf
	exk7TL7JUq604FJoIOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6Iv-0000000D0X7-16Qf;
	Tue, 06 Jan 2026 12:36:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6Is-0000000D0Wl-02NM
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 12:36:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606CAEJr4048524
	for <linux-riscv@lists.infradead.org>; Tue, 6 Jan 2026 12:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFdsrGyQzvH3//bxJ/J7dg4vdFiIDNfK+TRRwe0c26E=; b=LHfY6ROv72NXf4Ix
	BM1LBq/DXviimD3ArWildiNn/cqwURog0HoDfMzQRh70ugKImKOKJ7n77m6mxN9k
	LBh/VVg+K2o4CMx/LOF//MsyIgQvAWg0yzt0v9eu4u7/PMe6u0yl3pV4bCsSdW8w
	ZpvBiMSeVEePssN64WYKBmbKfM/yO9iQ+8HAck57Z3JWjY+FcFOaV1FAGIJrRjAB
	VChlXrIrwZwZpFfIarxV9GZC/mGcUTbxWLy9jE5TTM8n7Olxwfnjhz7ROFOCyaFz
	wQnjDvxH9OLP9DYBkcQaEXfg6lMYH+NnvitjQOEkkn4Uigq0xysh/Thz1db1Mslr
	7QhZrw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25rr29e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 12:36:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09693109so18353271cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 04:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767703008; x=1768307808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFdsrGyQzvH3//bxJ/J7dg4vdFiIDNfK+TRRwe0c26E=;
        b=LCLNrBZcOq7DoLbIMttDt/BJ2N0+l4+gltsLk2h8xmFtixT+n1wG7TkLwIWcAt8i1/
         DEG3lmLe6P17seXoLLABmu8cTSnR6PxdCYIrp+EFZZgnWIfrzCPY7k012qRhqg4G0iga
         zDM4+MWnGrFii5IVkfwtQcERu7rngGVh5IYEBCipBe3lvaLz43o6gRRNjAfn5J59qOwf
         soerh39y+Yleiuj2ZObvUbxUKQMP7mR2H0no2wAvi4mf26Bxp5GJoKcaRId/VveeXPbH
         6v4cEP+Gvy6G2UC7rsRL7+516b11iYLT0yLfOMzHUPJdIZ26FGaZ+LbVR+LmsZkZ/mNR
         mC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767703008; x=1768307808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFdsrGyQzvH3//bxJ/J7dg4vdFiIDNfK+TRRwe0c26E=;
        b=Nk5CvKp/89IbahpLNE83Ck1WHyUc5z3fFDVTy1bAQw1ubcXDNFI6edmSzlQTsEsl/K
         JdXDp19TOqeHmnrDwXH3eqdAnRc/zJSslUbhbL0mqeJQkJFOcKFMSOiMlsXQTzqhfolM
         x5tmKYutAbKuO8l6w1kZ2HNOFZQH6k6W8hbvIblydOABxPcbGP/kGxBk0A6do3Lvt6bC
         gPQnabIyirejNPyNTYwGEjXyS8vQ2KjXkFDBQyuePtfk5gDrJdAMVr+nTwm0fOlJxPA7
         zO9OKaVi6m0x1fIyZvlluaLxGdhjadOTKAemTcu8VkUKHGuCfYv0HNAbT6mFjyjsK+mV
         vJog==
X-Forwarded-Encrypted: i=1; AJvYcCVOnDL6dsbVcGZ33X5juRtStkMziOHSrGQ/os1tayKLKewSJkDaTvkSY3xQYfT1yk/9BwdT8FA2eCy+Ww==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEqYd4iOJpIdb29CYFuwu6Y/dk8NjlfkrERrEwkBPbZelXkTlk
	+8L0jGUCdJPjwBD2vGp/LVxcbQHScod1gFgUPoZXXkKmCumCT6lbRWoAYofpUprQi9TOWnbzlzG
	g987NvRfIPOVlx8dRMqIDAalZj/sMuAENM07ReABbREj0ZkIlFXuYCH5XcXEOfOPTWrn61ac=
X-Gm-Gg: AY/fxX5sZi/2g15M3CLG75Ra27K3i7FGcbhFsQ20LfBJ3f5AeUo3vYpg6PYfAUieLHX
	a5vXX17tGGsjanrZBPXsfrKtQlNRKOrpdkzr11X3+PUdwIO5XCeI9lU8eEuGasM4vWqByNXf9ZQ
	iDd16HDoWMVd3OJyqJUn8kPvWwwWXFTDP5/ISBf6vLBcvZ9Kbfq7rv/B5ntjFPvn1ZdjUR2vWf9
	sGsawPduKy+ztPJvbKFlUM9efhyFQH+9u5UsqtjN+mrfe9KXlx10eZ5czDMbEC0R37eJH0v9BzB
	vBWqBBTCIGdM5Yoky/bQEuXwVEh4Nqoxj+ivpjv9uX6js1/dizwLdt2/vnixKp+2Mm5JKx56Ldq
	JqCjDNy4jjlAAUZFSRRT5YzFPdZwMWTb6dhrVASk=
X-Received: by 2002:a05:622a:1baa:b0:4ee:1875:42fa with SMTP id d75a77b69052e-4ffa769aa45mr32669351cf.1.1767703008391;
        Tue, 06 Jan 2026 04:36:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3OlX/lVZ9eRQ3aOxiW51OeVVVBJf12PTSv0Qtj2HDqO8JCJLlFXFtDil0tgcdGIzjsiK6SA==
X-Received: by 2002:a05:622a:1baa:b0:4ee:1875:42fa with SMTP id d75a77b69052e-4ffa769aa45mr32669031cf.1.1767703007978;
        Tue, 06 Jan 2026 04:36:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3980:9f91:8651:f23b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f686sm40728415e9.3.2026.01.06.04.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 04:36:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/2] riscv: spacemit: add gpio support for K3 SoC
Date: Tue,  6 Jan 2026 13:36:45 +0100
Message-ID: <176770300365.41755.2635230320486109502.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
References: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
MIME-Version: 1.0
X-Proofpoint-GUID: CS40LlIJvA8WoANmUG2I5eAjw2DuYGc1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEwOSBTYWx0ZWRfXx/2UqFRLms7N
 fSLg4SgOU5kobeoZFx9VbVd8oQTZ1cpXkjiyACf7LKan8hd25aUo3QREsd0K/qO90mTq9MBDLLt
 xMuBFblIv8D4WXvdkYOVXF8w4lgHRAau0T7cp1XGEmfVXU5/Ki7zhQN1bYI9JcOn0n4myZtHFKi
 l51BkvmJt2VFMKPbQKfyfXhoIBMmXYKOLteKeGWS0ECUvC/17RJfT1KyzH53BqHhNnGTZlV21uv
 XDaCoO2KelOZt4p0+MnuGUqxTQRBMNB+NWn09kq3rWqlvoY0WHqt/iuuYyN9q8gY/y483Mcg1FS
 9YjhMSpTM5oPg/X9TXK2SZErbZnJYrqIsma3YAtvRPPmHaAJGSWK9rvIQw5lWcpUiTQmVGYu7mU
 /Ivr7ewH43gwBoN2Q+GkzxblQhsW9R6a1KCHewoaMsoYc3uE3peETnM0LuwB0K3DQj4vZxshshw
 XUbTNtLPThsK4WVN1xw==
X-Proofpoint-ORIG-GUID: CS40LlIJvA8WoANmUG2I5eAjw2DuYGc1
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695d01e1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aIeBnXaUYv87OnBSPw0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_043650_073477_68483654 
X-CRM114-Status: GOOD (  10.99  )
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


On Tue, 06 Jan 2026 11:09:31 +0800, Yixun Lan wrote:
> Introduce gpio support for SpacemiT K3 SoC, the gpio controller
> changes its register layout and bank offset, while mostly shares
> other IP logic, so adjust the driver to support this.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: spacemit: add compatible name for K3 SoC
      commit: 48033e4c677be4e3f131df454d44a5d1fb1b334f
[2/2] gpio: spacemit: Add GPIO support for K3 SoC
      commit: da64eb51595bc6073b2fb69c2a3859bba93ed75a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
