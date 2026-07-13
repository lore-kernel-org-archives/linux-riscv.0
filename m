Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31992C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 05:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ImbZnbomte137263szbLNDIhmdybutgeJ7sMEnrxuU=; b=CkF7lWOxVDyxP6
	cp1FJv9ytHVYVADqk1lm4qvqtXitbk72OJE8HPtjmRmc6oW8I5973NA1QAQwgfuiZ0vkZ03M+Gb0I
	RPQ08A3W9hyvKtqNtUaMMofvyVHA3SOiTQ/hIXKdAatM6hXnG0OA3AO/CyiiKB6qG0ybWDWX545IB
	Qa0n+VYKIxnWAP134dzOHvyf8DcWt0Vt++0dP4DvsAHW0SP3UUWo/RU5DWc7+7fWRmC7IaQOaA73D
	nduqetGZeaLAUyFsOvxwNdW/cdD/C7WdDimkAX+u+GJSMvWgrmV2jsMuMPO/CfgqjCe/iTYE2oJff
	SJeRZQLbblOxz71AUCYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj90t-000000088pJ-1odj;
	Mon, 13 Jul 2026 05:15:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj90p-000000088om-47HP
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 05:15:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AO6A136849
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 05:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9xVYkyXqvuSpTs2QWTynmVppBnWKhiGOrHMenH7w7o=; b=lwzBRPFAavnedYb6
	s77F6xL0sxpG3lTWIK8NYWpaB9e399GNLmbLBOB+bI46HOHjBBBwdPsx7c+h1h5d
	p1CSaP8y+9BACrRYDBWL5TUi+Voh2DAvvr0eENWBN+EW+eeuBZNgMVbfZVnVejAE
	iXU5eIWuxMq6JE8zVWp1A/lTb82Xj4eRDGuCr9WbCfsVQthOseChzUe90BFMfhE9
	c6zgE5UNA25p0BmmIC+wGik43OavoPT0Ou19TT7AQrOD6Du7CiRu8YOAseuzOHBW
	+vq4myZAb9ylwOTklPztbNRmeMks6jhGbV9I+kJR9H7JJ7SYTUSO7YUHFfs5l5xq
	2pdnqA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe914dwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 05:15:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so3827993a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 22:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783919724; x=1784524524; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9xVYkyXqvuSpTs2QWTynmVppBnWKhiGOrHMenH7w7o=;
        b=FDCoYFT9FiuioqjotI9q9xHqKXddE/2narTlUbPKkC/vT0vVRcdlZUfS+vN0+yOULS
         8CUVcDdoJfNEUaDPGSWSnvDv/v784D9sZAmlBKgstofdJmI/HJ8jZMMpp017HWCqvPEn
         cX33OxfrJp44CzyuqShZzXKsNr+2UEIRivgqGzviMvO/BC420IZqgPAz9gqL7VXuTJo/
         CQhV785xfvbmWw1B0/umlDH/vxddKEy8N01avbzC6tV32sGIUfq98NPH9lPTCybIRY2z
         rTZ6r6+Pw/IDedTnFHjWOsX+xpYOvnJIQwxzkO3DSBxxlFIyMKl51CkZLe6ysSWgdKUJ
         BE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783919724; x=1784524524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9xVYkyXqvuSpTs2QWTynmVppBnWKhiGOrHMenH7w7o=;
        b=WRr9itXBwRgEHczr7GtPBsfH542In0Rli34JZITzsbXR0gm4yky0XkCuVfo8+sXO3J
         s5CTJ4BRCPFmkLZB4fhMTe59ufU/CIafj2He3C+nXPA1JDUtAejfFaZwiUmo9sa1XYZ7
         FgNp46NY60TfLpxdIgsCUwrAIJh4koOzwBjTPgZfLj+6X5+XPhbcPOPCJyNauNiPktYT
         h+htouELxDafH2WBj6qNRITBo84HBwfASHkV+7Me+nPcVODKnRzTAqApAcRa+aciBs86
         iciBjeLFoEASlKD6mhVZbPGxXQ6Eh7cX1GlWjYeLzDH9u/5pZLV/Xa+5n9SM8HCiRRyS
         ls6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpDNMMzteaWK+AUZGYJJqPsvMzz/SPFSQEAjRjj/ApcUY5KWhXOc8H1++HP6JsvQs/4tjti7iC2SLOjUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIjkGniDKEFnK7PQBwzKvZ8MIq8GYmNe0LO0L3a7xGkVBKqS+E
	AS2+rPaPR6c3OGxcwChEhuwQBtOe08Fp1j3m2I0juFZLe+sSiydRmUmIx+mW9Q8mzPMpyj048b2
	cPZB0R4B7qBLRZc/Pbd4IwWVaIVPL7TFhhGpSnP46Hwrm+Vhu9hH+8WOavNn0+tzk9Ikixxw=
X-Gm-Gg: AfdE7cnBqbPWmHZHVvqlWzmZCW5j8Q8sPPqBSHUnm0f0E4fVLbe7KONmJoHPduDPlwp
	5cphp2Kb2+UQsePz7FUYAxRrSyK3c9hNhC4fEUHgRWSzpw9FbkZGCmw0iqpMcN6Hjn/BGVmWsUR
	WdbLZoyTMXKWrdNVnnEk0kzNzK5HlymAEmP2y6+NrK4xkthP8+eGuDN3eqEPeJyHaHliQinjiQs
	cPpIMANIy4sSHXbaYuOaEiBcLU+/iCr+P1HVbcW6Yh9JWVgEZb5nqJvysWNJpjzsWm2z8o4NMp7
	e90prP1WNY9E2TcsVnjQSiqI7sB9feFDP711247lphhYH2rw0yxV1fPrWCuWihSqmEx5xvLJ2yt
	pFQvMoOufS7blyVVaIYlpOQxTHpggDLDMxX3APtRwBCpN
X-Received: by 2002:a05:6a21:e8c:b0:3c0:9c19:6598 with SMTP id adf61e73a8af0-3c110b78efdmr7269820637.64.1783919723746;
        Sun, 12 Jul 2026 22:15:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8c:b0:3c0:9c19:6598 with SMTP id adf61e73a8af0-3c110b78efdmr7269799637.64.1783919723302;
        Sun, 12 Jul 2026 22:15:23 -0700 (PDT)
Received: from [10.92.175.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8fc7c088sm17904482c88.2.2026.07.12.22.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 22:15:21 -0700 (PDT)
Message-ID: <27a69fe9-7822-417d-8e62-056cdd2ad9fd@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:45:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: spacemit: fix spurious IRQ handling returning
 IRQ_HANDLED
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com
References: <ef8b623f45d4e430721e46572c2598d882044aed.1783667603.git.xiaopei01@kylinos.cn>
 <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
 <76c5567a-cc93-422c-a18f-a32dcb101428@oss.qualcomm.com>
 <d047f823-feff-414c-b1b4-54f6ccea6b66@kylinos.cn>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <d047f823-feff-414c-b1b4-54f6ccea6b66@kylinos.cn>
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a54746d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=_3TyFvm4RMDdthPgtvQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1MSBTYWx0ZWRfX39J13dwQWV+L
 yoToAKfw/wiZ79byOcCarZj25447WC/ORtSiTT98d2S+8lYeTctrWlJsFnk7P02PXjThcWByEe4
 MIdSMpalPaiA3s+JK3dFYiM187gmPE0=
X-Proofpoint-GUID: vdh0cvCNjgGJIn8mFrundwrmMf1FUpFO
X-Proofpoint-ORIG-GUID: vdh0cvCNjgGJIn8mFrundwrmMf1FUpFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1MSBTYWx0ZWRfX6RhQjZ+SrMNO
 j1nwGr7AY00W9zveUMOOWubR6lxUPgiaxP9IKNZlqB+736YWs3zV0Q+ZWmu3pghPyNrsg7xNCQs
 XGzNNErosDpRebHScIoQauvshvne/NYwjEUTT2uicyIQPmzKsvDHm66+y6FmhbmerY0TEA9omDk
 dgUnUIe/jev7gqf+gfNCC9MF2bAtKOWR+AAKi8oGkBB105nxsCSlLchZVRVL4NRP0ASxLIL7XuC
 2p/4JxGdMPP/Es2uE2bpgzaIikckHNmGDTb8q8uc4YWX4HNSWsDYeC17C0TE0t3GIX0cibv0Kdv
 eYh+ir2aKXIBWVk92pORcgsYPhEzDfDFiuQ7PrFJ6+jDVLN++1lPvMffQZ+/+raWSBCOhPOsqiY
 mCfMfaIoIZ/gZiO0SNDJkdgbaF0B4jKKWCaupuz8/VrRcHJv8cErj1jBK6QI85eGhk8YY2WU9I3
 2+5BAWvZ1ZoJX/ohfVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_221528_139287_691C9629 
X-CRM114-Status: GOOD (  10.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA3LzEwLzIwMjYgMjo1OCBQTSwgUGVpIFhpYW8gd3JvdGU6Cj4gCj4gCj4g5ZyoIDIwMjYv
Ny8xMCAxNjo1MCwgTXVrZXNoIFNhdmFsaXlhIOWGmemBkzoKPj4KPj4KPj4gT24gNy8xMC8yMDI2
IDEyOjUxIFBNLCBQZWkgWGlhbyB3cm90ZToKPj4+IFdoZW4gdGhlIGludGVycnVwdCBzdGF0dXMg
cmVnaXN0ZXIgcmVhZHMgemVybywgdGhlIGhhbmRsZXIgc2hvdWxkCj4+PiByZXR1cm4gSVJRX05P
TkUgaW5zdGVhZCBvZiBJUlFfSEFORExFRC4gV2hhdCB0aGUgcmV0dXJuIHZhbHVlCj4+PiBhY3R1
YWxseSBmZWVkcyBpbnRvIGlzIHRoZSBzcHVyaW91cyBpbnRlcnJ1cHQgYWNjb3VudGluZyBpbgo+
Pj4gbm90ZV9pbnRlcnJ1cHQoKTogZmFsc2VseSBjbGFpbWluZyBJUlFfSEFORExFRCBkZWZlYXRz
IHRoZSAiaXJxIFhYOgo+PiBub3RlX2ludGVycnVwdCgpID8gWW91IG1lYW4gdG8gc2F5IE5vIGlu
dGVycnVwdCBPUiBpbnZhbGlkIGludGVycnVwdAo+PiBoZXJlID8gSSBjb3VsZCBub3QgdW5kZXJz
dGFuZCBmdW5jdGlvbiBuYW1lLgo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3
LjItcmMxL3NvdXJjZS9rZXJuZWwvaXJxL3NwdXJpb3VzLmMjTDIyMgpUaGFua3MgYSBsb3QgISBJ
IHVuZGVyc3Rvb2Qgbm93Lgo+CiAgWy4uLl0KCj4+Pgo+Pj4gRml4ZXM6IDVlYTU1ODQ3M2ZhMyAo
ImkyYzogc3BhY2VtaXQ6IGFkZCBzdXBwb3J0IGZvciBTcGFjZW1pVCBLMSBTb0MiKQo+Pj4gU2ln
bmVkLW9mZi1ieTogUGVpIFhpYW8gPHhpYW9wZWkwMUBreWxpbm9zLmNuPgo+Pj4gLS0tCj4+PiBj
aGFuZ2xvZyBpbiB2MjoKPj4+IG1vZGlmeSBnaXRsb2cgZm9yIE1vZGlmeSB0aGUgaW5jb3JyZWN0
IEdpdCBjb21taXQgbWVzc2FnZSB0byBtYXRjaAo+Pj4gdGhlIHJlYXNvbiBmb3IgdGhlIG1vZGlm
aWNhdGlvbi4KPj4+IC0tLQoKUmV2aWV3ZWQtYnk6IE11a2VzaCBTYXZhbGl5YSA8bXVrZXNoLnNh
dmFsaXlhQG9zcy5xdWFsY29tbS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
