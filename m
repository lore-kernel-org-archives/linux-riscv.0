Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FF5CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 09:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmhwcPZiZNvdF9YoGKex36v0zZAH92ehXWYhMV0uJtI=; b=BY0XRor01ImnMx
	v4ag4rKiLBOKOn0x4ac7O58brkfuyGiH2nqaOiuUFX10skLhJFzsliYmjg06xxjAURvfS9oRxCN49
	Cc7PC5FX27Fc3smoqzAslaWqLvASdZsjvk4VWg7dmBHJ0YlTSJLxGVFE1Ynn3d+LHB2GfMqdePHcA
	D7N7AUUIhTLT35b+tEp4ckZv2FBEkTmXAOgU9JlNZZ8lbjecl4IWBuC+sLMqYWu0vR2fiqnsjNBr9
	iJ748l8Exz0t4BcqMUmXoDQJgWoM05PIIuKUrC3S4AxXsr1agMFv0t+LcfqQjIBMxCSd4/t4nznLB
	u3u/hXf0GDbt6m7Ra6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZwS-0000000BDCx-03OS;
	Fri, 02 Oct 2026 09:52:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZwP-0000000BDBu-3YGS
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 09:52:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nYcI3935002
	for <linux-riscv@lists.infradead.org>; Fri, 2 Oct 2026 09:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=; b=TZFAZPXJvSUNssIP
	kbk4Y3PNfs53YClIJ7NeWTLSU8weFgQIhT0GriEVdsvjpKB5nQqVG2mF18cyI+hj
	TxMj+coha0MF9X5GnZRp0uy44Oi4HleRM+fPsU1qSAfPz7fksKJD7FFLF1ZVF13b
	r8OVcf9DdQ3OG6r/TrU7ZtqsuNAjkYFZyizO+z1/l7vRtJ/mSOPNVCPFy7/4amZg
	rB4V986F0pYY7OEry2uircqTrRflMnOt74soam/7mi5DQLYHbFdDNdAlZk81UyuZ
	8mti8T1dPGhaMMSipI4VKklJ25Psf88ohK304inRExITdggAOZpJ6WTjwj/MpE1g
	pjBHZA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxeaksv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 09:52:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so1831630385a.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934751; x=1791539551; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=;
        b=LNxvDpF33F2kUTSmuhS/AOmO5sNr1tb04VookCK3cUkK+DAZD9NFiHWZKFYju8M+xq
         Zx03Ak01qAL7HR/TfvKeXCUvDdq5W4u2rRu6OrwxNUsy4jNmJ1vk6vnaHfQIFt7h/AuE
         jeiL9AxCTCs1OXJTfkENTTJvJwQZ+DEZAxx4CRArQDMUM9pGeUcSKX3cr/iDna/lflPf
         LJP9W6Y72t4l5kePGhz1HHTfsWKk4NBwUMk7uD2+44FA/xU65xVktOrIze7lE3VZdsn7
         MpArKWfziOkFiz2inYL5kb6mU1pfI9KT04Gd/glujOSvJtfNVJAgy7U8ZR7YfOjmX+A8
         2jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934751; x=1791539551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m2y1KtWVZtI5Dc4dXOHeD8LNqvt0R4u9wS9uoheMY4=;
        b=eE7tIKLAFAtZkQV5oaVsmpI6FkaE3hyE5sHX4Ps32bNvoyUHnjBO/VL8UzrLGlOYkV
         Ll3Ek11oFVuDrvI5z73URW8ZfCpo6PFVjOiQ3R9VSnSp1RHW9RdkXmSWcN06r4eKHXgV
         u0q7HhGTOFX8DHPOOPxA/xNhwp1TaliMQ1oWTLhsQvpLb1s1GJdMMchz7BJk300Wezhy
         WyKVs0UobzLkYrT0Ow4+RJRF7HgBG9GEDP+Yo66J4SxErmob0pHgc89VTmj1/kE4sfEe
         FBEUGZ4gVUe9GLHpeXQvTm3jICM5b9T0vpKPdKuYVsPuI03RgklTgeYMBjs7qZ6V2Tih
         vOAA==
X-Gm-Message-State: AFuF++kOsy2S39F89U3eWbk5usvX8/zl4UgQNuctMTL4ypsAVNrldu2N
	FXK6ZLrdcPq6D+EBs2B2hI6raqUDyydEHglL+QKCblDU3z6P155znopk0gVgTRM5u1wzB6272cb
	ZaiFgYYKPAsPzEgB7W0IsJKgVzYG8A29RnPXx9/WiijnmG9A4h1/GENoqm3pxijq8YK7M0WQ=
X-Gm-Gg: AYBFou0pompPhYgmEkD/Yst+oRZmherE0rDv9h0gUdH9LWU82SciK1IQ9HSa8NcJY8g
	kxrmF2umluYmtf//c9ncusvsA+yrbStd+S/9UJpjR29HvNtxml3mRSQCgjiDRYD4uk6kbet1PIq
	Vlue1BNtdFUg14fmjlPFczoyTTJm3JNMFwzTqezERS4i3NYPQSNFSeBqM2SaoXRTEcofZomnhoo
	j4oegaKBS9Qep5abuwNgp0l0+eSAY2X8XvPWz+PqT0hEBbNU4ZdOOdq2PFOokhQO76EPRYmwEz8
	62cQV1M5FX2h/9ThH4up1hSGaWJvm6fku++TanUdv5G13Ace5WC7wv/fV7E7NH+S6U0aa31ME3V
	TOsCAaMuG8/5s14xDbG0bwamZP9bYgqscdBRuPTHWlrrbiQmIC/YT7uRmsXQX/A==
X-Received: by 2002:a05:620a:a790:20b0:93c:bb75:d8f0 with SMTP id af79cd13be357-93cf170b54cmr237249085a.27.1790934751380;
        Fri, 02 Oct 2026 02:52:31 -0700 (PDT)
X-Received: by 2002:a05:620a:a790:20b0:93c:bb75:d8f0 with SMTP id af79cd13be357-93cf170b54cmr237245885a.27.1790934750933;
        Fri, 02 Oct 2026 02:52:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d1e38sm55681315e9.13.2026.10.02.02.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:52:30 -0700 (PDT)
Message-ID: <94e3f42c-4ffd-417a-9bee-69c504360af9@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] clocksource: clint: Use IPI_MAX for IPI muxing
To: "GUO Ren (XuanTie)" <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Anup Patel <anup@brainfault.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
 <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260911-ipi_max-v2-3-a77826ff189e@kernel.org>
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abf7ee0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uCLItbk5GdqmTsIkEKsA:9 a=QEXdDO2ut3YA:10 a=Dn0JnjMMefUA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: lfAcU7ddGp3RDqPmdjqfMdHLXa6IcTnU
X-Proofpoint-ORIG-GUID: lfAcU7ddGp3RDqPmdjqfMdHLXa6IcTnU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX7wIxVXjvWove
 yY4AeQww7JL2faw6dmA8zWpqBIfa9FA/3TQeIIQtJs6xbt0SEvcNndXdr90hQibfw+553LeRQZQ
 Ctte0DrR72MvQ+tyWXc6v/aKxfpc54feC+OoNaCtXjrIS5V2tUPK6CJxmQlXOw0RaXxK/B3jnb2
 jrcFMIUbMI1v3AVEUwey0S4VA7qA3+K2dlnYzCRwWcB0hOrI/MURX+IiA/5udOzDv+P42bWN+FF
 QP8h1jR4LHpOCUl/MyYsWrE3Gyls4YSAZKEHUZgE/0qgQcG7HO066dh3HxciOPryafi/Du0wxXR
 /bz7vWboPV6yGFCuBcY1svKP4UMPlQ69cBKMhMdtJ8OU0MGvisqh2qkKvJRE1W61t0YMMpM/fcf
 w8C3uRVMCvxeWq5VB5rEDBvagIjkUPi+5f4MYu1P/V9tZsPEilxV+n1/U/3gwk8wsd98Hb96BDt
 HdT1lCHqLJaTBiRpdUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX5v2jt5WozBCm
 r7k8RkZBs+CMMCrUw5WF5cI2GffrNMus4W2sq1Cp8rcY2t1SDIuJsYuILYTlE6TO4Ud1AK10mQN
 ylzWFd0eA+pEOq4Jf6xx7nKA+AP5UGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_025233_899220_93744445 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/11/26 05:27, GUO Ren (XuanTie) wrote:
> Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the
> constant is exported from riscv asm/smp.h.
> 
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
