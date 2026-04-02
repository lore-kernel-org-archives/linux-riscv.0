Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52613D6AAEC
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxhACTXGxhLZIINbwxWIk9GMoxFvW1FbKtTEmHn4lhQ=; b=LjFGgvGDr/MBMt
	i3Xvv+qQB9T93+d07NtWRcq/hcsIsU+Xe3tql9DTZzjvj1ROgwlUfnWHlqBUynMDT2uALNVT/L4ad
	yLbPgMVFYdnaP5sUMu7XsE3/XBTex83OWC7GIvyjNKpxyiIlq54aHUlkeAMeWRoeUZ7j2p+g4BObE
	gDn8GFy+LSEpfLtECYKBXj9E4gFgJGzfPYuQOksagysTti7F0dagCna4l4bMp1Nglc7TdthEcBxPu
	b0/GET5TS9l6/v4KR3GunKKfWTqPJhb4gdUyEowZjHdtknnRykzvzZUWfonfmMXipWJdD7IrsZeO9
	+iKy3f5y14kWWux2ctlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Me3-00000000eB4-1Jet;
	Thu, 02 Apr 2026 18:19:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Me0-00000000eAI-2r1M
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 18:19:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4SAP462602
	for <linux-riscv@lists.infradead.org>; Thu, 2 Apr 2026 18:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wiDkn4M6EeOZO6HfXfs1fLrNAiZ96hbYdrTrvNXFkyM=; b=dYc0L+M/7pKMzfsJ
	Xxh2RKcWwrM1NMLt7U9a1q/qJ8EUI4G1em6m584wOhh2e5MRjqxDvWnj2rSW4YWA
	pWMx3EtqUW7MWn+AlPactqXGo8LxbLsmeD4m5hpdoFqmZtKB5TvpfYyHHot7ABsK
	y8pKqzeWw9pnnF8teo5Lfc+ltfck6i0+fN9YQJqbCrBFxGComSp9JzdU3G02GR01
	zJ2Ff4dVxsGLydLlF78ZyMnLobclfcZf6NUCGL8k+nMkqP8gTPN0b5uOo5tuNfoU
	GlBardYOabKU5XtR+g0ZF4G33Yji6oyFNaFovSOQYfnzFPXwYhYxAuHATSOD03k9
	QtEboA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h4hru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 18:19:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b3544bc7bso16906491cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775153991; x=1775758791; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiDkn4M6EeOZO6HfXfs1fLrNAiZ96hbYdrTrvNXFkyM=;
        b=BVSqRHDHyoUlTONJaMaGTHRhTgOLXmibibkHlvgd0cHsQSFa59nfc7TTI1s7njHpjY
         F/XjmE260G/VP0/xPA9Nw5Yyen0XOMgIuWyK0/1NFTeg43wy27yPge40RJREENcCPesQ
         wd/bLR7pGnyFun6aNRhbRUE6clsD88s2opBInXmIAC+fId/q34o26lOtIwRtv8YKigqO
         q1eu1MjKGPEmPq3f1le15/naD6BLB40yQfbawMWXDVrCU+/3qRdoTx7mVn0Rkf808Jv8
         ASIFYjuQoXpMnVRIXPV/pB3tDi+SkkImAqpqcIdqF//Dm+rOV4kbYDpYTQH8id/kACwD
         WxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775153991; x=1775758791;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wiDkn4M6EeOZO6HfXfs1fLrNAiZ96hbYdrTrvNXFkyM=;
        b=gOl69mZXGwJAjNAhUKtilzhnptkS54yogInjVdYPBAks/Id0w8Xec0aRbBkgsnuL/Z
         aYZSuw74qPt5b2Gun7fJlp2gzqDy87HOu6+nJaUe/qDSQNTeQl5njX6KRsOxfopD3rTY
         VcWaEwl+rYS3w31vV7wMTSU+aELFjSu3Tkpsge9WLOULOMzcweJXibLDsVVQUL7qv3Ms
         hzbG0o/3C/P9J3B+1Et4Pg09jX7ZOhnHpCy1OlVUXDeXvPxcUC7CH0TMWAxL0XtUCcwV
         MTl2wesVk7TQfIW212BUukRcOJpzLzf5qd5cu4XKJ/1DJj4Sgw4Xe0tyHPNnl7OxNAKj
         6Szw==
X-Forwarded-Encrypted: i=1; AJvYcCXK0yoiGRnbl8qwtQytiitNDG0od3n9prwqylPiSceCo9ixOOqdFEsMol6qfcJvkuO7GkuSmRjltr9HmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIdpWp2KhMo41FKnrjzZ427IbOn2X2TVX90P+OFA+scRsvDK0K
	aN/CV/T3erCe3s0MOWhLfeXoHVJnk959U/+O72FTOWJOSlHwfCvQz/C4cbB2txUlDrl10EcGapl
	DzVPh1DQyvuBv8S3qhDCvoMqP2BikSS+FJbt/K3MtaFvbnopLvpZjrQhPIy+A980zicIiixg=
X-Gm-Gg: ATEYQzz8eX+O/7NKz7IhAWCmApIqQxr1CM2DR9IQ6u1XBz7YjsUQDL//uzSXvA8sgKk
	L3jL/TJO5g1jv5K8a5xReZnTXiiPP5g9HRVzEm8WMUB9XnjrmWDUcy+XY4vlnJzgyHnG0ta1Lrl
	n/zsTykVZjLNctgN6sUDN6z5WjI/Jeft+KhVB3Dn8ZjqguTfE2i4V9z/L6d3H7JXxpwhLYDSCHN
	kFv123ERd+r4KD/5WutMOe2+D9sy/fZ1BI1bUzZxyPu4xJko8wivKFIEEPNVOywHV+yRX9vudAk
	l7hcqL1BWNzOmMGk50e8hfe+Q0G/tmazd0eNdP2lZWdiM9ZU2f5Rgyzv+ZxEQ93nmAaoid3XjfX
	6FArAox8RErOCLkEZkMyKEs03IhX0Hb2O4ylBX4XFIq3GDr+RVdlaIzYB3pyo
X-Received: by 2002:a05:622a:aa12:20b0:50d:4199:8c88 with SMTP id d75a77b69052e-50d62772bddmr5001901cf.1.1775153990877;
        Thu, 02 Apr 2026 11:19:50 -0700 (PDT)
X-Received: by 2002:a05:622a:aa12:20b0:50d:4199:8c88 with SMTP id d75a77b69052e-50d62772bddmr5001461cf.1.1775153990314;
        Thu, 02 Apr 2026 11:19:50 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c971f03sm114386766b.7.2026.04.02.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:19:49 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 20:19:48 +0200
Message-Id: <DHIVKK81LLM2.3VTYW1UXM6USQ@oss.qualcomm.com>
Cc: <guoren@kernel.org>, <andrew.jones@oss.qualcomm.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <skhan@linuxfoundation.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
 <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ceb347 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qHmfJlKEtTjsIq712WoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: YuPrpLKni2FkxughX5BrR4_ngnx1qfwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NCBTYWx0ZWRfX0w/JyyQC/zSh
 mzQ6pF0lrir42SxK3TLdaqVGys4TLDmlvtVnQqcISsEuP1vTtEbhYlOy+hZuc2XlQDH3oT2Nq0P
 oqycHyuGad/h6sGFlqc6Cp5nhuEyrHqiCzyQXgYKuErWj/TDJQkRsajM/+TVE9Xt0EF9Nic2++B
 o5ziMQrC0jYvEgJxSRmCzqRR3IK9zRnMGwETALdvWu44aA54TBixWTH1Soexz4iMpXWfRSDL9L7
 i20ut/wq4UJVfeU7Hikc6r+42aqf8GGvHeuAk/sRYxh0wluKsXjSfQEiV6E2k/p2ULrSyyiOZhx
 EOPhDHHx/ElxZcZiVufoi56FWpVcHslDa9U5rT5pycT0rYjs4dZ7r0Vjn8hQKbiQAfrFYmArI0+
 kc3oZ4u6kN+h0Z8VMHjKC1vXV3Bct9JRlkTBCUTu3IB422bai5x2S3lMN4GI9pMoTZ6SHNItfHt
 yXlb9d3O1tRyfw2Cc+w==
X-Proofpoint-GUID: YuPrpLKni2FkxughX5BrR4_ngnx1qfwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_111952_748927_18128F53 
X-CRM114-Status: GOOD (  10.93  )
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

2026-04-02T21:23:02+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Extend kvm_riscv_gstage_mode_detect() to record HGATP.MODE values in a
> bitmask. Keep tracking the maximum supported G-stage page table level
> for existing internal users.
>
> Also provide lightweight helpers to retrieve the supported-mode bitmask
> and validate a requested HGATP.MODE against it.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> @@ -102,4 +103,14 @@ static inline void kvm_riscv_gstage_init(struct kvm_gstage *gstage, struct kvm *
> +static inline bool kvm_riscv_hgatp_mode_is_valid(unsigned long mode)
> +{
> +	return kvm_riscv_gstage_supported_mode_mask & BIT(mode);

Shifting by more than the bit width is undefined behavior in C.
RV64 effectively translates BIT(mode) to 1UL << (mode & 0x3f), so this
could allow values larger than the mask.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
