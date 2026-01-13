Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE4CD29DCB
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 05:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuzwo3W9jF87oRUhg5SazVwV2cIcknl3Pc5Psx8z1Pk=; b=2APs22TLs7nYFo
	/nGhgIBLLym4017z+1oPPJqe6ZTj6c4cpEt1Ri3A3S5g50bxozyfxSOYqAKzLP9lbT6dKc9hj2Gh7
	csHH3BPAk7U8qkLWg0e4C3d+6pJMT7fQAZwIobjhgdx12XFBtgq+mYhZdL+b9LStplypZ0bLSrZ6J
	/jUGoSz7HznqmwjcQzTTHlGQVn9bh3X12h3J/T7MtY4waodP81cFHUikZgHQlZDbJ6lHzXJSYZmxU
	Nq/or33pGr+Bjp4+Gn/RZIoC5m/p1XAz9VnCyWGigJwaoMJvILfQhlKuC9DWzQxLdNo5FtMun37HA
	txZMICZuQoFRD2VH2NoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfWik-00000006XWf-3nQB;
	Tue, 13 Jan 2026 05:13:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfWif-00000006XVi-0A8x
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 05:13:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN51Gr3299864
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 05:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=BZHPhzXJ0Mcz+3zRww6wyIQlO4Z+6GX7AaKUsI1bag8=; b=BA
	LsIr6GJT7JWvOyskC1k9p9VJbn3WWoTC+ig5mjlApKnZD6xZWBQ6suqFZ6hqdw+U
	WtSBy5PEM/KUvMP9mGDPoCtZMnIyKKaCWCTMXgFE2cy2WDxoIbcgqYHSbwAL6xP9
	5WeAy6J0N2HKNtJ/2dyiA9l5jXGmdSwn5ACFnLPs8soxhrm7vCxPY37l0AI9mHsL
	cYaF65LYlXzU1D/CiMNWY+vxWvIBEhdn2zn/tD1sECzHQ3SPz9Z01lvrFhZk+Ect
	2mKG3kWKOQQ7NeKPS/GO0tAj0y34ag0tYPfBrlHYq39cHJMmvediql6Rg+5nmdy3
	lxuSUSjC2zXSIOCtZfAw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jm9f8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 05:13:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a37ca7ffdso96315476d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 21:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768281206; x=1768886006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BZHPhzXJ0Mcz+3zRww6wyIQlO4Z+6GX7AaKUsI1bag8=;
        b=LFQP2VzUEHuY6kb2iX5WdkVAMgwHIq3pR3bfkL3B3AoiFJrLMtF+gKWYWlef4ig5f5
         tesBtrQVGKP2ykcKAyPiqlY/SBjOea8oD51l0aa8MbSJDA6QCSSANHUR8S0uWh/XQyFI
         VEJdLc/geL9obkEAjaCahWYdTH7TJOWFYMwbMvU0PTR07HBxsXGIY0gkRXycigWQKASJ
         7A4TrtB7CdwvU/vyRnD2NDPkv/jOgAmsX7fudf1dC8BWlonidhkODy61n1wXEDQC6ChN
         LhjZnRQDN3Fd3ScXSGYOlqRSz0U2pBaKPGYVwXLr+Cd9KCwVPbJ58vCwrX4UacWoOuSa
         OkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768281206; x=1768886006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZHPhzXJ0Mcz+3zRww6wyIQlO4Z+6GX7AaKUsI1bag8=;
        b=HobUxecxv1j66W5oqbUFOEBlHSMrfCJubT2l3f2eLeNDdgNuCQktEFkioVFfR0cRz5
         tGgZd28Ork2lchn7n2EU45H8lyqiPllhaD4Nyy6ERuBeK7oMCaG5Ajnn/oOffNZyFuym
         C7yIWft3iwbyKUA18MQHJnoQrZs3pcqTs30NYbC+NFHW3WYEaBWgjh2vmKxeLN1B5jnD
         mj0HO9xtlGkjMO/eZcCpOQP+KSCMNC4pPtD64P49vNe4mTxKC9CjZ0ho/66WeyX7zI9d
         jb91oSDXfiZ31yW2v3LPJ7gqncEboltcbnncCxlVKw0RyQQELR/7Zq3IREASrP2588P7
         MCnA==
X-Gm-Message-State: AOJu0YyseBatmhrWZw84YZ3gYr50toJiNsHbC89Tc0meqxOdPebGf0r6
	fYbN6nmqLQnXswpe/efMwRR9YGbTXAm0O1tLzBh/xDCLkIMC2oGWQwDXB/V6c987ypLOW478JiF
	0sOxrDpStbxOpv19q9RaQsxaNEggdhvniJSFIvM1Yd+pSLQ7nE+kw5RzGfqXGFBZoyyOgGHskYK
	XVzKAtEEao0CriLlaH7m6yAw0Lq2i1Ky3v7SUxfbJy8RgKrg==
X-Gm-Gg: AY/fxX7URNJhIstJp2gNQ0QUUSonH2sLq+eo1NxibI212TVdo+PJRkQw+8hJ6utQ/+o
	rer34X2n4e66ByGWjcgzgRnhhL6oukutlc1Fjr3A9eKNwx0tVRP6pfLaVyPP0wpyaKFnGGFlez2
	98dQKcrRuNlTdjRcltycTmd+RlRJ0EYHYpXSdVkQY5uJ+IwP64FqqjL/qQoJJsgGmFTA==
X-Received: by 2002:a05:6214:3bc7:b0:890:26d5:c1a0 with SMTP id 6a1803df08f44-890841839e8mr329033276d6.13.1768281206059;
        Mon, 12 Jan 2026 21:13:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExMAuvIVLlhHW04j7bO5r9MvIUOw7zMKjo1ttv/1gvnxGsx7YpOc4AlsHQuO9SAX7LPChaIbqWy0tH/97CcmI=
X-Received: by 2002:a05:6214:3bc7:b0:890:26d5:c1a0 with SMTP id
 6a1803df08f44-890841839e8mr329033026d6.13.1768281205621; Mon, 12 Jan 2026
 21:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com> <20260109090224.3105465-6-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260109090224.3105465-6-himanshu.chauhan@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:43:14 +0530
X-Gm-Features: AZwV_Qj6V3rEVBDFKYHXH8y0L1nrX3Jw3QzqIWcDU_wtoiZfXPhPZIbxRemFGYQ
Message-ID: <CAB19ukF+3tBG=nXe8is5_3xWkt7avjAQ2o5cS=44SAf0mkVPwA@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] riscv: conditionally compile GHES NMI spool function
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com,
        anup.patel@oss.qualcomm.com
X-Proofpoint-GUID: eWMZo6h8vzg4RvgfcJdLZ1GA_gwFSpUm
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=6965d476 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=9L7PnyXcnU1f3mQPG5kA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: eWMZo6h8vzg4RvgfcJdLZ1GA_gwFSpUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA0MCBTYWx0ZWRfX7oNT7QHUJfYe
 NQOCt6xoWnopIlyX9fzzDm6XVrDy/LFRZdoisasIKc+GqEitWZogWG5GxW4XAswtyy9koi+V4on
 AV8RYdLOaNks3O2xqR7g84YZSK+Y0vj/C5J/l41t0Bexro0VCwouNRyiU0PubvYnz6xrzjPLsRy
 dWeu/Q4AKgRH9Jt0mFvXo9rw/dJGgYjn1bz56M4ipAeCaKIXLE00plGLuJX9hIGbOl9lrPmCxlk
 KvlGBoduBlfqtoGYJbZDQKR6Fb6AY4ldISVrkDvJhNsmzQ8fMm+IhE4gT52Dc6GCtpRwAPzv3Lp
 5efcp01G4TR7izwn/m9bFVQ0EEtKKgxva/NYWV4J4G1XqyjA7su3qimr8QW4md3Gu2IMB+J4cMV
 udxuc2YhlXl7x84ydKY01HmGAHec1w9+y+OqYMwOAQOstpLzDBsx9lP8EkV8nCa+k+vNVgnIVdD
 LcmzlPWOo0SFNjIIvbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_211329_192828_ECAD4D20 
X-CRM114-Status: GOOD (  14.60  )
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
Reply-To: sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCAyOjMy4oCvUE0gSGltYW5zaHUgQ2hhdWhhbgo8aGltYW5z
aHUuY2hhdWhhbkBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IENvbXBpbGUgZ2hlc19pbl9u
bWlfc3Bvb2xfZnJvbV9saXN0IG9ubHkgd2hlbiBOTUkgYW5kIFNFQQo+IGlzIGVuYWJsZWQuIE90
aGVyd2lzZSBjb21waWxhdGlvbiBmYWlscyB3aXRoICJkZWZpbmVkIGJ1dAo+IG5vdCB1c2VkIiBl
cnJvci4KPgo+IFNpZ25lZC1vZmYtYnk6IEhpbWFuc2h1IENoYXVoYW4gPGhpbWFuc2h1LmNoYXVo
YW5Ab3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hY3BpL2FwZWkvZ2hlcy5jIHwg
MiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9hY3BpL2FwZWkvZ2hlcy5jIGIvZHJpdmVycy9hY3BpL2FwZWkvZ2hlcy5jCj4gaW5k
ZXggMGRjNzY3MzkyYTZjLi42ZmQ4NGExNzcyYzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3Bp
L2FwZWkvZ2hlcy5jCj4gKysrIGIvZHJpdmVycy9hY3BpL2FwZWkvZ2hlcy5jCj4gQEAgLTEzODcs
NiArMTM4Nyw3IEBAIHN0YXRpYyBpbnQgZ2hlc19pbl9ubWlfcXVldWVfb25lX2VudHJ5KHN0cnVj
dCBnaGVzICpnaGVzLAo+ICAgICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4KPiArI2lmIGRlZmluZWQo
Q09ORklHX0hBVkVfQUNQSV9BUEVJX05NSSkgfHwgZGVmaW5lZChDT05GSUdfQUNQSV9BUEVJX1NF
QSkKPiAgc3RhdGljIGludCBnaGVzX2luX25taV9zcG9vbF9mcm9tX2xpc3Qoc3RydWN0IGxpc3Rf
aGVhZCAqcmN1X2xpc3QsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZW51bSBmaXhlZF9hZGRyZXNzZXMgZml4bWFwX2lkeCkKPiAgewo+IEBAIC0xNDA1LDYgKzE0MDYs
NyBAQCBzdGF0aWMgaW50IGdoZXNfaW5fbm1pX3Nwb29sX2Zyb21fbGlzdChzdHJ1Y3QgbGlzdF9o
ZWFkICpyY3VfbGlzdCwKPgo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+ICsjZW5kaWYKPgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEBvc3MucXVhbGNvbW0uY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
