Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096DDE6BF20
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 15:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOO10nVj1ha/GE6bLozPlUkom+Uq9WKebvrretzpJK4=; b=koN2aRmA6nhEIG
	3gi/RZjwJVjSMnYBKqaGFm6Cqg5jWDZ2ClKOlCQJV8KgVUp1zim3JNWQS/vBeynRanUU+jif0WVGv
	HDaBNEyLo/7pjFZ0g6ttqsQ1X1EZxxkUIiQBqjmkbpOkWEmQjgZg/guxe8ou233k4bWNqLHp0mSML
	wrCgTZd2sY+6oIuM0HFeTKUTq80FoYo++uBuhY34x1cE6tAOl0pD9Ec5vzrotwMhI8FRjFgE5QHLl
	kS4bwnsMTLrZwR+CkoAqvrDE5Z3nqYESQv00KkRPfh2QQvmh1Qku2Uf1DzP5IXa8VCfAXpJVToKVD
	AkRFyOZeefBDUyktFYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqtM-00000001gpk-0N3K;
	Fri, 30 Jan 2026 15:58:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqtJ-00000001got-3TDm
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 15:58:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAOKaj2992881
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 15:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQNZhRVTVABmpgTnG4Zg3cj198URaNvQKUlnGCClzJk=; b=WrHHYB5IUzWk3xSd
	mLrptX3mVqYwutQLOSwiXhQDrtxyCqpRwXE7pmXSQIcVZbUQ3UZqG95BoFl1cLUD
	HTgyb5Rjht5SrPoMzWK9ewSHsHjSjBxrHAtRCurs3zg9qAZU4ykYiTOmXSM2BR9W
	dsFgwrbdg3Rs59TzFLEzQ4HcXl9cwwG7SVPQM3FfrHgGAHs5TRWJd5a49dFZpbhy
	giU/zPpIAMQKCggL8MRs/Y713kfc8P/ZMn28fVUqbY/RZkFS4IX8jyHaupnarTPP
	SYDvZec8LT6XzlVCY7kDchqY9m5f8rIndL3rQle4aDC3HcshG19AQr8Q2/cnUe+y
	jpyktA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1ke0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 15:58:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a87029b6so630643785a.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 07:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769788716; x=1770393516; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQNZhRVTVABmpgTnG4Zg3cj198URaNvQKUlnGCClzJk=;
        b=Cx9ttq7+wpv0YKcu2mjzNwuJFhTVHbg4EInbszhlmeIyAYUG/YqzW1Z7QYvVSf63OC
         5/xayvbPLb20ZwMYM5x+YYwflUygr7NoZmVExTF7CvAmKE2fNVRKgVTA0Adx7XlUuMrp
         oDQ2yGxMqgScEaZcSMrumwIHPwFXJuQg92ysjDLRKk4vBjghtgG3tWrIt5muXdpHE2Qi
         Ey3Y6K7OE99FsUGDqdPL/iDKM9NPF74nAXCTQMK8+0f63NOmHVydkQ8/0wjfAnEba15F
         O0K9wl0mTqbsbZoxvPEC8KoBH9oq6gMpoTDlZUf3FVDseuiUGwbOd6fVs+rpAP7IT3js
         0Q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788716; x=1770393516;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQNZhRVTVABmpgTnG4Zg3cj198URaNvQKUlnGCClzJk=;
        b=Jl580fmELOVijgKKTQYnMyfGUIuFtFxV2y5iWIBgH96jt+pGGX98NSbii1g6LTwXPj
         dSuAkM2AH80/FVkgYzD6cFhK37SgDaXcaOysdIzkcQhlfS+ksqrvMOusSDeR+4qGmnvf
         JnHVtZLFeSOg6QqaNlOMxV3omnz9u0XJsoGRTQrqdoeCEu7XLktK3ZMIK6DSf0fwu7qs
         T2gg3aQ3kTCY6IO7Xj10OfnPMBP3Xy8QHRm0QvY94oqAm9U/EIgmsJGZARPq2R98Ua3V
         NcJn4TQOFkjvKPy2ZkJpyhkdh3F8E3Z+iRd+DREDT5zfvLFypCMQ2v+0PnlmQwKPwfpW
         gNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNZeveow91zn9T3VE0JLR6vv6ZZL1sxq2e1xWUXUrnumNwRoUtMAf3R3oUL+CK4koLLW/ncHpNXcO4Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgei/lX8AfJHAtn0DHao6pLBgeOqxiZ0HQuDyKgLo6TvOrECLi
	GL60yRndiFhP9ZmvfgLgW4vxJ6n527+Crn37vvyovdA1fZbO2LU2D1iaO8SOsJRn9FN3ZLzh6Nr
	4x56FZimqEyat5lV+17ZQBw+fCwRHGvTLPKddHv+TAJvPHYVoqsVC+2RW4hdaQ7BENMaJsRM=
X-Gm-Gg: AZuq6aLkgsdVSy1bA7IxY9vwtJUHGYlR82V88Tc8Txz5cG7n5CImZ9k2nejzr9FV0no
	V4pcZll5vceQVqBXTUQe8cfZSGFdhr8JLeiTVDbtXqYL7Gb6CmA/RP0SViNdqINNWbh5hGlkm5V
	nvBOHzjLI4tuYFoWwUvd4gfMp2Pb+dJoiCtZJiIcmQaObUc8LLKlBx1J93c4Wcvuv4pVqh54zY/
	GRCJuzbPekUpY+3ZPs4FIhAKowKWCidXUZTS+/30zJirFFllkrSInzXyQAtFwMI8yEpZ4Oau0xa
	PBI2byFhgLWRanpYgu3fCuuWhiqPSoYO55oP/p4JOe/b9uSbfcdRBHGMyd78Oo2kGZ8HDxYGbSy
	pnrvv08XTs3P2aXjvFcPA61mKt7gOL2PB8ND1n9tgZeBXyj+k
X-Received: by 2002:a05:620a:29d2:b0:8c5:36be:41fe with SMTP id af79cd13be357-8c9eb32be89mr429757885a.60.1769788715908;
        Fri, 30 Jan 2026 07:58:35 -0800 (PST)
X-Received: by 2002:a05:620a:29d2:b0:8c5:36be:41fe with SMTP id af79cd13be357-8c9eb32be89mr429754485a.60.1769788715467;
        Fri, 30 Jan 2026 07:58:35 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbd4a5b8sm27030845e9.5.2026.01.30.07.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:58:33 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 30 Jan 2026 15:58:32 +0000
Message-Id: <DG21QMIKJS7W.1OUK0OFL8S3A8@oss.qualcomm.com>
To: <fangyu.yu@linux.alibaba.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Support runtime configuration for
 per-VM's HGATP mode
Cc: <ajones@ventanamicro.com>, <alex@ghiti.fr>,
        <andrew.jones@oss.qualcomm.com>, <anup@brainfault.org>,
        <aou@eecs.berkeley.edu>, <atish.patra@linux.dev>, <corbet@lwn.net>,
        <guoren@kernel.org>, <kvm-riscv@lists.infradead.org>,
        <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <palmer@dabbelt.com>, <pbonzini@redhat.com>, <pjw@kernel.org>
References: <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
 <20260130132458.16367-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260130132458.16367-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: fF61_2udfrI4-zU9t6xSW9wWNvYCw2eA
X-Proofpoint-GUID: fF61_2udfrI4-zU9t6xSW9wWNvYCw2eA
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697cd52d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=SRrdq9N9AAAA:8
 a=655hpoqrAi3NGJe9dLIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyOSBTYWx0ZWRfXw1U4tHY4k5MQ
 WzWxiBk246GvV8sRzW7Ju5XyO9rGXk746uXjnlVTMoEDk/KpWITojp6wQziP6SGHSEN61oVWPmk
 ei/v4/pIkOVEOO1Hx12GDMr0i9bd1p/LlE2eJWU+3BnGCzIKWhZpywLHOCtgltmcwjnZH2/D8gO
 eECcGX3m/UoWfC02YXnmbhBAv0L630wPO2R4RuYhDoOeLoX88R4RAsZW7WUtlEETRQZXG0jXliZ
 sQkA47NUaE22R2jmU4dZf+e+itqDfxIN+Eyg1G+3oOsAPFQwTFTlsofKwYmD/IOvhY+O3uTOjmB
 e3sEzP06YwzTU6KMCO5jTrCrxo/QBBXA6SV8g1HfXggvcW0gX4v+B1hBTfGGdNcUyi4+WUsCh4B
 A/5goV97SNUqQk/B275lKnD/+dMEoDaYL+LQrnvmlxiFtnPtc9lz4wZ2Tyc0RQzXULjcluyF/uw
 27jtvyHORGt/b93pFnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_075837_888267_9C3DAD62 
X-CRM114-Status: GOOD (  11.57  )
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

2026-01-30T21:24:58+08:00, <fangyu.yu@linux.alibaba.com>:
>>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> -	kvm_info("using %s G-stage page table format\n", str);
>>> +	kvm_info("Max G-stage page table format %s\n", str);
>>
>>Fun fact: the ISA doesn't define the same hierarchy for hgatp modes as
>>it does for satp modes, so we could have just Sv57x4 and nothing below.
>>
>>We could do just with a code comment that we're assuming vendors will do
>>better, but I'd rather not introduce more assumptions...
>>I think the easiest would be to kvm_riscv_gstage_mode_detect() levels in
>>reverse and stop on the first one that is not supported.
>>(I'll reply with a patch later.)
>
> Please refer to the discussion here:
> https://github.com/riscv/riscv-isa-manual/issues/2208
> If Sv57x4 is implemented, then Sv48x4 and Sv39x4 must also be implemented.

I don't think so, sadly, but we're mostly dealing with technicalities
here.  As Andrew pointed out:

  "The H extension itself does not impose this requirement, so
  technically Sv57x4 without Sv48x4 conforms to the H extension spec."

This means it's completely valid to support {Bare, Sv39x4, Sv57x4}.
The RVA23 profile imposes additional constraints via Shgatpa:

  "For each supported virtual memory scheme SvNN supported in satp, the
  corresponding hgatp SvNNx4 mode must be supported.
  The hgatp mode Bare must also be supported."

The requirement only goes one way, so an RVA23 implementation with just
{Bare, Sv39} in satp could support {Bare, Sv39x4, Sv57x4} in hgatp,
because RVA23 nor ISA prevent Sv57x4 to be there.
Not that I expect any sensible implementation to do this...

Btw. do we target only RVA23 with KVM?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
