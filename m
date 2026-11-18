Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289C606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K881fXE7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jQEr+7rG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QUuxB3DE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6nhwuxGjLQXmz5El8d/L86TpwWfZclwoyWuaaplkaK4=; b=K881fXE75NQFv8TLhA7Ubng0iS
	fq+5SyCBESUQMZySiXuEJeJz4e/56+34ftOw6OyKjOzz2zcm6rtODHmtu2NLabeJgmKx92WruvEpo
	9xHoRNqBslTo8jFwevK7imcHezGg9qAIwYDN1o66+YNoo6nHqSMRaU6erSukpFy1uiL06eqMMRe9O
	M55ZKWwNV1df+DZM6scj7pEvXUGLPVV/3HgGpemCLwnl4jJSCCtfQeudqpQSnRG1fQWguoiOGzmis
	UmzYdVUcKa33LSqDsilNuOEHaGW3DEX0ZPJy0HhyinhxFyu48kqG4QoAS/ULkd0uezHjpm4MEu5G0
	s2Qf5r1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbcn-00000008HkT-3Bm6;
	Wed, 18 Nov 2026 09:06:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbcl-00000008Hk6-0Wfk
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 09:06:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8SpSl1959660
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 09:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=; b=jQEr+7rGIgiZJfKp
	VCEciYE/FPRyAaOtFBdB15NgY0xL7pVNd+QLUNUY8Do5ZgUP5Z8ICyzJ0gVnhjYj
	BA7axEcR5UrsxJpXMaVd6v1b5R6kzPt5osAaov/Rgsoe13ZZYRarOyqRvw/s6RG2
	gWkIYFgw+uiAmYPOP2a3MyqI5bkPXRrwkpu4RnFt2v7wZ/UrwRqYJ+5f29zmA/dC
	i2lfu1EVpl6O97D/S0INGAa7EdYWB0xruTYHhfnBx+wSOFBg1tRVcn3320pcMaVQ
	826ji3Uho/vhJbJEJgfr6XRcqjfI7vhMS0d2XtDb60H7TmyxUwksNbqN9gA43jte
	/LmqIA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9j6nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 09:06:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so496130a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 01:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794992798; cv=none;
        d=google.com; s=arc-20260327;
        b=oGFbLQqCHNGYdSYp7FHkqH3/8lcyuNgmdU9wkCxiELhmqF+tpp6fdoeJNAO9LhlNJ2
         /KRZITLhvJcFwTL6XqsNJdwTyQPzqXFyL0V4Gua+sqec45w4RfRcxNlUo8opYAGTL8Zg
         x8d84D51GakecJs8ra7DUSRDfPtWfsYs7fhkgDUBpd4QSOxQmKvlRpgCxHFIM7Q9wDbA
         FFEPi5yzvqC+LSKGbM2xuBmo4ejz8HZCRZJp/6pDo/ZDFnAOvD4PSBUclm/FsTcPuNdI
         /64LYkvzJhYJ9CnEyrrTjBXGTH1/MkiT6t7mvWO0Jh8UQCqOukLZlgLBItvGgvt6n+Yn
         nYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
        fh=1bf3H0TNsrWUFncxVtsDcQISojuLlRDb6w75qv7T+v4=;
        b=DBrKtT806OOR4pb87VF8bX0pRhI82n53r9foy7Du24RyA7PN4m44dSe+jjxR4sUrGb
         TVDbF9HAhH8/U1EoxN9/0XwHKaysMb1clobRipZmvy5EXMCEquVi+TIR3WdqumlsPG/5
         ZMpwyWZ1aFaNYOASuKM30Ca1FORyUggBIZdjKcOg76lefpTjIRZQDxguMFKRKo709QxM
         fYoQ4ue9wCNoZLI7bNIGtgB65lJvL/oDmKVyQj0R4BpBsSjpuLIOq99TcZXCdZm/owwi
         kzmTSbBkUsVCzdu0QYFJv+joz32b1ntSmtk3z0HpJdwBqRstD6zi8BWRpm4HMDtHcRge
         WFfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794992798; x=1795597598; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
        b=QUuxB3DENIModLVYjOA7d2NaKY7gqklt7I7wAo/5XX+5pbcUnGMMslelDxebMHD4b3
         5U8HWJm61AI0ukpWpr87YgTFWATMk/Kjh594zAvUl8mXfh9JGwzd+2nGNYOfGGisVIQF
         Sj+355Qwk6ukvqBtAFEQYRIppQ0BhNLk24YY56kRSGNuLr9CnzPxFfKgqY2FZsl+sBIj
         7L8BE8Gi1DYqHjbn53Syhfe5ES1bvxJFYPClrj8ECEtB3QXoX/M18fMDQM6LIAjbAIhf
         JFzhhjfLPI/VZAt+FApS+RR2d52Tlp7ticou7+ARf/est+sVO+SovDAPyPubxVVPqTZj
         yczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992798; x=1795597598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vjiqy5pSh1vgauFnRKrgb3OPhHBera+F0GE5IeKfK3o=;
        b=XgJKNir8wSetXiECM7MU3tYXy5QP+Agls54165h2Pg8y9w8I1JpESvy5RQRPVSyP+f
         tPUvXjMDnaoqUXjgk/mlH3mXv/0OA2stLA2fwvUikFyrbgSbH5D21lDulFm8XuDgAvC1
         3Ed+7LsUJFiV/QTPM/tLEDre1vfKOORHbpiGxoQhKaKLEoECFjmhlt81MttNqQ01hxvn
         +DTkUilYtaS+11YQMv2coZg+YxyNeHlasxzMdXvrOgktn7U0badV8Re66VVq9pHDdKFf
         ie0oIVDWg8wDIQi1WNTho1m5HMXl8Thl/8/kB2nJZ+gRxOuKWtH9QSwL2+H5uNWs7wEO
         wMQg==
X-Forwarded-Encrypted: i=1; AL+hErHrH2URhZeCGdtE5iEXeRaBoRb7RCNnymw+hDc+72VrcECHI49XVr0/DmXGU3KE9fYigyLDezYYfAPE0g==@lists.infradead.org
X-Gm-Message-State: APuU4Z/8RtufIGfd9n1mHxDzrEh0ngB8CZkRQkD5qnrTYl5rxqZQy7Mn
	Q1wNSOa0C0VN3eQyksDNeIPfuLK2/L60QHKTffqrMnBsq5J+5RojrOdhwLYwivU16pgJETqsFvY
	S7TwFrn6A0IZxsng22n+NtXFpvsA3oH/wNVRlbcOR6/S7xx5PZ0u1JlFKWBkAILZmhM43KO2pGq
	nCcm+ArVAjWy8hwL4jFL70286D4ISkYaNnLEPDpdchbCYilw==
X-Gm-Gg: AZFdTZe6pPouBGuipP4ojA0ROm4dY4xb3mE8IjMdcydfEFk1rAxqIISsWijZZKgysah
	Xe7XMAyV5HEEELZ+lpaxiB3LcnVGdC8NyiclBTDSl/8ggfQVk1IXltzWoASHjufchcWpOvBwSRo
	FMRcxJ9vdCMjnv4c2SzgUUag8YgIZjMHXbX2s7b9WiUOlOYBaPvPPXRx1U5+g=
X-Received: by 2002:a17:90b:4f8d:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3b3d076318emr2219664a91.9.1794992797768;
        Wed, 18 Nov 2026 01:06:37 -0800 (PST)
X-Received: by 2002:a17:90b:4f8d:b0:3ab:884b:659e with SMTP id
 98e67ed59e1d1-3b3d076318emr2219621a91.9.1794992797338; Wed, 18 Nov 2026
 01:06:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-7-mayuresh.chitale@oss.qualcomm.com> <20261110042537.2080084-1-leo.liang@sifive.com>
In-Reply-To: <20261110042537.2080084-1-leo.liang@sifive.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 14:36:24 +0530
X-Gm-Features: AclHuK-GdskchP5Xrbb0NCv-oMN98LztdY-OpT_0E2NBif8hi8IPaY8eKX1Y_Og
Message-ID: <CAHuiULD76iax9hkrLM1eR2DC1ut5UkzSeBpVTWfGwKpVTcRw4A@mail.gmail.com>
Subject: Re: [PATCH v6 06/14] gtrace: Add RISC-V Trace encoder driver
To: Leo Yu-Chi Liang <leo.liang@sifive.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd6a9e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pFyQfRViAAAA:8 a=55nkOtszvzLBgXWOk3cA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: -SAVZCRplvm44EZsQ0Wn5Hk7iKECeU15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfXwDkKKQufn1/P
 Mm7X/w+FjAWMb84Jptu46yEEfVZm9ZuhYDmJOUnd+lUKO3D4w/6GaU3L8OWKfNQNq3CS23h4jPj
 iruo5DGGP0W8R9UEVrY715xvp5IdRvCiQCPqM+Mg/m3D6Jog/LsfNA1rzdxr0il83GilV0Lh/gN
 /0Aop9/i6gcAnu8GbLdeifyQ7zG6tsnby0faumA97qx0XiE8GghoBdwH9efyKFKmON1lfEXN+5C
 ZIEELzgDBX53CelmkK8BDL0mJ2MYftDKDcyb1hihWhVuD/Ea/XqR3YoGP42YODACFcVRD58F4zc
 Ohqr/bB24FLHQ9NldPxj4sZtWkmfz/uLpGz1GjL5St/ValV261g/tekelP1i9YP74RN2qlavywu
 pchJl3EqJYams0mgBnWNGdCiXWJKsZEEdV0eOYdFFC0mVvbee6JE90CyzChXUSSDyqUqBgYnoT5
 eGXnBNL00erD+Oay+QQ==
X-Proofpoint-GUID: -SAVZCRplvm44EZsQ0Wn5Hk7iKECeU15
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX3Tdjt7eWOfVi
 7+CjeLYnmSHbucThKBSVQDJKgYTniAZj/Lzr7QSurgCbA2KYP8MUzLb/uopUcL29ZWS4SHq6bJ7
 IDxq2JBqVbXA2V7uKgewuO8YuMNj1V4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_010639_192249_93236C9D 
X-CRM114-Status: GOOD (  16.42  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTGVvLAoKT24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgOTo1NeKAr0FNIExlbyBZdS1DaGkgTGlh
bmcgPGxlby5saWFuZ0BzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIE1heXVyZXNoLAo+Cj4gT24g
MTAvMS8yMDI2IDE6MjIgUE0sIE1heXVyZXNoIENoaXRhbGUgd3JvdGU6Cj4gPiArICAgICBpZiAo
IXByaXYtPnNyY2JpdHMpIHsKPiA+ICsgICAgICAgICAgICAgZGV2X3dhcm4oJmNvbXAtPmRldiwg
ImNwdSAlZCB0cmFjZSB3aWxsIG5vdCBjYXJyeSBzb3VyY2UgaWRcbiIsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgIHBkYXRhLT5ib3VuZF9jcHUpOwo+ID4gKyAgICAgICAgICAgICB2YWwgPSBn
dHJhY2VfcmVhZDMyKHBkYXRhLCBSVlRSQUNFX0NPTVBPTkVOVF9DVFJMX09GRlNFVCk7Cj4gPiAr
ICAgICAgICAgICAgIHZhbCB8PSBCSVQoUlZUUkFDRV9DT01QT05FTlRfQ1RSTF9JTkhJQklUU1JD
X1NISUZUKTsKPiA+ICsgICAgICAgICAgICAgZ3RyYWNlX3dyaXRlMzIocGRhdGEsIHZhbCwgUlZU
UkFDRV9DT01QT05FTlRfQ1RSTF9PRkZTRVQpOwo+ID4gKyAgICAgfQo+ID4gKyAgICAgZGV2X3Nl
dF9kcnZkYXRhKCZjb21wLT5kZXYsIHByaXYpOwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+
Cj4gT24gYSBzeXN0ZW0gd2l0aCBtYW55IGhhcnRzIGl0IGlzIGhhcmQgdG8gdGVsbCB3aGljaCBl
bmNvZGVycyBwcm9iZWQKPiBzdWNjZXNzZnVsbHkuIFRvZGF5IHRoZSBvbmx5IG1lc3NhZ2VzIGNv
bWUgZnJvbSBmYWlsdXJlcywgYW5kIHRoZQo+IGd0cmFjZV9jb21wb25lbnQgZGV2aWNlIG5hbWVz
IChlbmNvZGVyLU4pIGRvIG5vdCBzaG93IHRoZSBDUFUgb3IgdGhlIERUCj4gbm9kZS4gSG93IGFi
b3V0IGEgc2luZ2xlIGRldl9kYmcoKSAob3IgZGV2X2luZm8oKSkgaGVyZSBnaXZpbmcgdGhlIGJv
dW5kCj4gQ1BVIGFuZCB0aGUgc291cmNlIElEIHdpZHRoLCBlLmcuOgo+Cj4gICAgICAgICBkZXZf
ZGJnKCZjb21wLT5kZXYsICIlcGZ3UDogY3B1ICVkLCBzcmNiaXRzICV1XG4iLAo+ICAgICAgICAg
ICAgICAgICBkZXZfZndub2RlKHBkYXRhLT5kZXYpLCBwZGF0YS0+Ym91bmRfY3B1LCBwcml2LT5z
cmNiaXRzKTsKT2suIFdpbGwgYWRkIGl0IGluIHY3Lgo+Cj4gVGhhbmtzLAo+IExlbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
