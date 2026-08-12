Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE14BC5B56A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 15:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnHXj3xGsgWznfXz5ejSNq4PO0qYqA3II3ABXcA2P9g=; b=nXuOYmBsQo/mK7
	g95PBzbQ9QeJfclxLOi/jCVI2D0gJu6eVpvmOZKYVkXV1uWNf647gOvXTEKHBBd3YtGkZo5CP2Flt
	jmKlhbJB3E6QH0gWOQUwPfcoYVz+vsi2/4sSE2ytenbFDpgE81FZtPv1aNIY7k/bxl+htDY5L2W5P
	QBdC9dqTTbDzBo/iOhH/uFV0h/2bQ8dceNpqG0dF8cywEweZ5ysTHCTRLZOOxQGApapnwLC/LF19U
	r1cdwt/KyQ4dvSIjYlPestYZo70PdB2TnryE80wwv+a2n6t1NrMjsiluyxyBdsFyGqntpUSNx+c4v
	104VopovJcbWOzfOGWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuARf-0000000GQbS-1lSH;
	Wed, 12 Aug 2026 15:00:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuARc-0000000GQav-2WOF
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 15:00:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDba0i899682
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 15:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3UDxR7hJxn5EMNRFope/geP9prYSEawi+pNDGzEyCI=; b=okNRH7ebFYBRXZLD
	loYrwvsUBmcRXI/bRlA/UPyZakEV1GuEoQeVbULhxEel2O3KQ7dA0PCHE2pB4qb8
	IQzLXBHTRHsFPaB3Y71nwv1wHo9Mr6ReiUz+uMAbqDg4VlZZxlcPSIGWPVfmlZlr
	9hmFVh+b2orqrGXcHOUXH8El1cVZXD4gqxI11YBRuRp1FPrJKo+GDNO/sMQHAZlt
	n3vwfAysJvcuEsE4Y3O69alI2UwyzV0+3cPWFvTf+riq1PHDK4x5pF5DNxBC2Hce
	L1NeAbpsvb00SG7NBkNIzIHgyDMYfr/36wyAp8lRCD689mmSxXbz5Euv+jE4BvY8
	evDdOQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nut9f8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 15:00:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbee57593baso530588a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 08:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786546838; x=1787151638; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q3UDxR7hJxn5EMNRFope/geP9prYSEawi+pNDGzEyCI=;
        b=bT5Lw6NKXHt8yuOM7ksU/WMUWkScjbF3ymW3AV42pvgcC8lvKfTBU5aZB0u/1avd0n
         pNpPGxikPIqt4QBaYrl5JbfK6nPsljs2lOUhDCbE9njtBYIbMGYDrTc7+u5meX0AmGop
         14K8whpwzn8j35LbJmWbMZUlrgC0l0z2G70epiwHSLIONHcspU3Ho+qj/lyONbWUqg/O
         xWopdwgyIHJ+qKFQRzlYk0lKLBrXY8ije0py9xnf0Qhu1hSaXR8BakiNkXWorMOICnR/
         p5iIbMyTbCisyPknIbPYNoKereHZChKzrG3cF2gWow/4qT4ZfF8oRjlaXU7tawE4QgHM
         8TMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546838; x=1787151638;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3UDxR7hJxn5EMNRFope/geP9prYSEawi+pNDGzEyCI=;
        b=ElNTYzJKzRtDJe88ojDBKv4Cw0Xn5oJSuAxGK0XdbH8dhUeKuJXV/JLC7APJFP4Cse
         /EP1CXI8I0Eyzy77u3FHGqQXdJy1GH0X7d2jVnNr3dz0ag7aGZRfw3UQGDvQfYNA0Igv
         vEshd3aegBTbVOVfGVNuD8audkTVV/5uvc/DQ01b8Z676xOwQLFkkLzsaG9+tIGdm4Xn
         U1x4jBsixIDzTH0PHseQaShD/Ze5ZG7Bep6Fpwkx+sS2BWvykxIHe9JOMcMwmMES/paD
         Xet+/8njjGa2JthrnIekENxfa8w9ZCPTA3qGkb6H/ZeBIzLTPEZSZ+/N37woxFfgB4LY
         ONVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrsyczqu2MOpCF13d74+qJSGS6WZ8ZulDbNSciHdbyar2oMvJ5webt79LHa4Vqwrk/ywTnsvoCiSmgkOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxt79arI1KVAEEUi6lcmx96wQDKsne/bT63udOMYUczJup+UmV
	xdu8kSr8P4l0EhrNeZLMaQBMUyPrWXT8VI28G762epnwxUICdLmubVJ0U2JzQjup8EImnXTwuR+
	10BEFoQw+zqfQRGdUoJpJQ0VWEk7Nb8sh2r4QeJY8OxJaa7gTFz0nCkzOdlbI/9ARgqyAVuNeMG
	p22aNY9JU3
X-Gm-Gg: AR+sD10Abb5TEd1ekEWWojEOLlWp0AanHFNV3LOM+BWb4jx6sAswapUy7zz6DWhkjDq
	/qY3XTOpLJgukOeptN8eTduSz0ztbpbZg3gA/ssj9JSvyMQKtGv/naSP9sHEr5Qyieb8bn8Kd8w
	wkjpSeWTPTkwOESfJocFFKHepnowVVOa5gjfMbatAJ9E7EmvYBVLQ+TM8dhZz78U5LW0QjqYOsb
	ftjADSj2ptu2/KcGq936W54UD5Ggl8RiOfgrN9Wx++J2Y1tNzSulNouyBzmQIcOj0GbImGcFbOt
	WmH77A+DRaOf8OJgbetEjPfesID/jlRyw1355QWT0g0BaWzYldAwzeka5sg=
X-Received: by 2002:a05:6a00:3686:b0:84f:a640:3ed with SMTP id d2e1a72fcca58-84fb55abaebmr6810615b3a.38.1786546838173;
        Wed, 12 Aug 2026 08:00:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:3686:b0:84f:a640:3ed with SMTP id d2e1a72fcca58-84fb55abaebmr6810182b3a.38.1786546836624;
        Wed, 12 Aug 2026 08:00:36 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1d492f0sm1191939b3a.23.2026.08.12.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:00:36 -0700 (PDT)
Date: Wed, 12 Aug 2026 11:00:33 -0400
Message-ID: <536fd5e22856840296db301e99b6fa01.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, kvm@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 07/17] riscv: Add B to hwcap and hwprobe
In-Reply-To: <20260701132755.50D5A1F000E9@smtp.kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-7-2c61f94a695a@gmail.com>
 <20260701132755.50D5A1F000E9@smtp.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyMiBTYWx0ZWRfX7aUfEI/PCHeF
 zSS9pXJ48z15c/OS9P6svbYNLOHp5Jk7Qpqaa79FiYL/DWJtvkOCplm+HHXIzdv1m6aIFYoPhk/
 45Fvh6UfwoEN9DGmhHOpAIS2wWwstnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyMiBTYWx0ZWRfXxPkgBm9SIGbo
 u9zUADhPTk9pgrbhtLFnRaJkyck2aabZG3x2pS5sjJ2av0/Qs8s0ADXD7w5iykROmrF6SSNukpm
 +FEVwwINuNzhaWaXTJh3jgQF8mStW+cgxwF7JgMcHzjOvQ7zUnZ6jrJ1GEsHjTeSHiR7yFb1gp4
 fDrerHHLu9kinw4TfyGUg55lztSbSfbd3WSTbvBAzeDLiJTzomUPFnQ8I5IIO4ocQoS7ueD91Zs
 j02uYrePoKS0GXJKNRLUB3FHi+a27Sv2TAA2glLRx57iyJiP3WRHyGBHNuCmLmFsZYIZ1d4CzAb
 HkwCC8An5t/9Hbk4uDH0p7ovuWPy+5XOlcOTsSabPxSVp9AEXYPhJnPHpmLfE4bkV2fBYhA0NFs
 +NwlGDxjA2qH1mAJGaym9RDA+Q/ZOF0SHuN4xHGehj69XGY9v2W7+lYiu8F9E0cUK22iIC29jOa
 nl2kY2EX5EBxlmuSlbA==
X-Proofpoint-ORIG-GUID: msIvsks9oSocu0WY6fqblyH_uEztmNNl
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7c8a97 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=N3_LGyncGubAy_kLYfEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: msIvsks9oSocu0WY6fqblyH_uEztmNNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_080040_668625_F6875AAF 
X-CRM114-Status: GOOD (  19.94  )
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

On Wed, 01 Jul 2026 13:27:54 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The new B base extension is added to the host's hwcap and hwprobe, but KVM support was omitted, preventing VMMs from enabling it for guests.
> --
>
> commit 1f4cf004cf603a91f99c0c6776c5ca74728ca05e
> Author: Andrew Jones <andrew.jones@oss.qualcomm.com>
>
> riscv: Add B to hwcap and hwprobe
>
> Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
> are all set. Also expose B via hwprobe so that userspace can probe B directly.
>
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 0acb7a01ecc0f..58523b3a1998a 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -11,6 +11,7 @@
> >  #include <uapi/asm/hwcap.h>
> >
> >  #define RISCV_ISA_EXT_A		('a' - 'a')
> > +#define RISCV_ISA_EXT_B		('b' - 'a')
>
> [Severity: Medium]
> Since the B extension is now exposed to the host, does this patch also need
> to add KVM support so VMMs can pass the B extension to guests?
>
> Without adding KVM_RISCV_ISA_EXT_B to enum KVM_RISCV_ISA_EXT_ID in
> arch/riscv/include/uapi/asm/kvm.h and the corresponding KVM_ISA_EXT_ARR(B)
> mapping in arch/riscv/kvm/isa.c, KVM's ONE_REG handler will drop the
> configuration request.
>
> When a VMM configures a guest's ISA by writing to KVM_REG_RISCV_CONFIG_REG(isa)
> with the B bit set, kvm_riscv_base2isa_ext() will return KVM_RISCV_ISA_EXT_MAX
> and explicitly clear the bit from the requested register value.

I will send another series to expose extensions to KVM guests.
Let's settle the current series first.

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
