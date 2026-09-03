Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACD1C61DD3
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 04:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYxkSFopE9kWwpydQlq9qeKHfKGk+/Gn3gEGRnvqmac=; b=US4WAeSNABmORA
	Jvt2nwfg9XSZdO3a3SFAAua/YxYWhSgvZhk35F+ig/oxylr0Gl98FKpKWL8DdCZRZvTyGkZrXWZFD
	pRbjZbbNIFoSmlJZUH3999mqX0wLtrrm0XwG3XOVreDi9zcjA6ZnVWq6N5CcP7N7xUjGeYNBkp6r7
	al2HT4uFL4qXf0+k/K5TTkgN/Je1UJrLx5y1KEopBW0a0b5Mpv0xsupBfi4Xq+DnQlq8qjlyyiLox
	AXD5x92m9f76vM31fp2dRIeQavd1D9MdmP3XZec0FaTkyEiOvUC6BrwWmDzvD1FWVrXAdk9TzWLGU
	9lhD56s0MM6vAfzcv/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zKU-0000000GL74-0aK9;
	Thu, 03 Sep 2026 04:45:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zKR-0000000GL6Y-3K86
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 04:45:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xiJB3657552
	for <linux-riscv@lists.infradead.org>; Thu, 3 Sep 2026 04:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Sc3WkFAgGyNV3trhZQm/9QMD1pz+GBXUg/MNSusqdCk=; b=GT
	6WQFDv9pLArywxCmT3lPlnoXr2OAUvu7mqcefxYUUQuUunKAa5VlMOYVhi1XHofF
	wNp7i1KmIYwmZiVe735eI4cQHXKDmCFkr6yMJdPFaUc/NwzdHYyHYzUClpEYYgie
	yvQv0yMi4H5DAe8jPsq4Xb1aXKV4a4AH592GoLt4RMYMq86gHdsyJ2gaU4UQGByS
	b0gSWRpCIJPxNqaNqfgiDWP0Df9bwLAp4TI28lcvgSpD55UJxpE/3ynVVsLXxaJv
	k02kp6hfeHLbzushzd7gKW96sI6q7AiOPsWX1ak+MOq2YWPSgXTkCDWH4aKaFCvG
	hVD2/xRAwJBROlTjq2IQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhbd4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 03 Sep 2026 04:45:32 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66cf1803125so2222174d50.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 21:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788410732; cv=none;
        d=google.com; s=arc-20260327;
        b=YegUXfV0bWEP94rEjHX5BcH80PPvF5NxfzFCoHNftIWxfT7N/dExXiGoTmhLHYC0vw
         wrx9bFjFOQ22eYI4fjOJTbvVhc0CmYnTQBAl1R51b6IP9vfPmH5dwpNWavxLXrxvhyLe
         PKXxVfUIkaZi0dv5P/9Edh+KJmaTMNDHD0RshyU8KT9iKwoePk13oTNketeohnwx2PIK
         TqNSM8/jtjtokAlXg/l2NGbU+Q2uzPSMNQds0rTmgOYrPYVBh4ep97sHILIj9ypHpCnu
         Q2+FWoU3cKMYy03KSGBDctTNZLEPrOmGgWVlkgT8NHadfuIex6X5aUnkAZ7Km4ZcY5F4
         dCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Sc3WkFAgGyNV3trhZQm/9QMD1pz+GBXUg/MNSusqdCk=;
        fh=OMxcCvwgfljTUxfc+ozAOuuDvakSdiWFYNJcgK+V3x8=;
        b=I2uabOzeRlTAxDDgOj2KEaA5SaKjVo0tf5v5/uiYP9hisdCM1vSKqFxFmVKhY2xUoh
         fDXNnvwFEq+BmbKtQXIeR7P86vR1rHLiFjMvB8cg/UFYWR96HFpBJ/RNLuIH91uEjK58
         XSwHAf7an05iBHqLdw/1l1qV2DtQSgx+ZKcIfJimNq+kD1Sg4zigFoVRiGTrwHKFxVK7
         9BmRqMxrNqOE3OEag9dcyBv92vK5OmSyfhb83Yhncouj35aWQJ+6sbRfr1G97CprqxcX
         +hkpirV2gBieq4FP958Aa4HlNm87ETPpDzpnpmo9gXeUsAUYV1I/5e0WgXyhilVch6Hi
         wIgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788410732; x=1789015532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sc3WkFAgGyNV3trhZQm/9QMD1pz+GBXUg/MNSusqdCk=;
        b=GuNkMA0pE8M50drgiqvwnOLtH7DuuNpri1X3iPVj47Ghgx97Tgqg3qQt2v63Gmt9+H
         4KHvP1x8+OYaqFcS7N4Ip1GnHXBEBAtAZeNsI6D2bDv0lS3ZSbc9Ss9PJ8ckolcg03I1
         LMRtbyO9ads/sIaKMKkYoDqCi3LROCwziXkmVQe9D+0BymiOGd4V4poOWXepQw2BJqeU
         qnuXkT27bUeq8pBwrtHSDvDSY31DHSitArIqdWmWPCWcxsPW65y6qcj/8k54SsP1PzQ3
         k4u7okm84xilgMb8D8yZjHdpG4bwdV7uyv6hRsfbpNg9awvr8LrnMuAtB7kEYmH8dzti
         c+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788410732; x=1789015532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sc3WkFAgGyNV3trhZQm/9QMD1pz+GBXUg/MNSusqdCk=;
        b=JI9S+JeUVcNdo0wnuESIfQMrke0yIvpkYsUNXuUMYiIGGJOeplL80ebCHY9KXniifP
         wY6uG8zH8dKa+N1u63lufCzSIENI0XB5LupnQNDYAPyA807dB3REQsn+CKC+KOK3D/H7
         cezuMKEisNG4grponRL7YaRiXLuqj2xyqdb8aH0jn8lypOEn89HRGylWmlDOE9b3DDMN
         iQ/J2iMbaFMIQhLbAM0giEWnEDvnDZFq5A9s/ZOWsnOzaQx6RgmnaElPEISbNOS7Fbgz
         jN6w7mFf+gNQEnUPAgoHSdF7R4IxNPczk/Rm5MQgQqdsC3ZoAm9UBHJRQRKwkMmx3z5f
         p9ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhonlUrOhMa6k3TkuVWVuN7RZdjFwxa1vzry9Np+jzbFI0cYAOWJJ6ZRCCfinFn8OtwvzcHruSGS4hBg==@lists.infradead.org
X-Gm-Message-State: AFuF++m73sJ9cq8bwPsernNo9TcSVB29YMu0rtTzisecoNMwfSbjFptj
	mNS/r+YoCvM/fcFgR7RBreL+sHQDDtD/cHxTpu776t5L14Ou5cOIl+zU5f0RVXXowRwwwSQBLuC
	6xc/61AeX0YEBBKILwr3KPgrCv62DRc5AC+eFk/ec6zFjH+a/jIWvljAW8iwuNspIuQInvbHWdq
	InGYM3fF2PBOYrA8jwWUuMrVMShGqvgarBejDIbMXJUcrQAA==
X-Gm-Gg: AYBFou3Nm6XRTTgjD6ow86Cd6bkwEhtc+6XW1B4ZUtef+YK3MZasEZfTryjGeiq4AaG
	LkWJWY6u2AGWcXia3B4rPy3PpYyKIg7neqD7+8xIXD8UOYkWx1ROT3WEBLJiV7UqP5SsZopKWRs
	/y3Olk3Bu3fag2yQBVwBTOxY/0C909YWKcxVfRE9VlCiMl/gG4S1uXtxuTlQ==
X-Received: by 2002:a53:ac93:0:b0:66c:85e3:7f28 with SMTP id 956f58d0204a3-66f9be6b625mr3646151d50.48.1788410732537;
        Wed, 02 Sep 2026 21:45:32 -0700 (PDT)
X-Received: by 2002:a53:ac93:0:b0:66c:85e3:7f28 with SMTP id
 956f58d0204a3-66f9be6b625mr3646094d50.48.1788410729854; Wed, 02 Sep 2026
 21:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260902140145.42094-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260902140145.42094-1-fangyu.yu@linux.alibaba.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:15:18 +0530
X-Gm-Features: AcwNN1UQoEUyCiHFoU50MMSvS7TZQc6s0bZHcLqzyxXDTbBAI2PWHTUKR2JHNJY
Message-ID: <CAB19ukHwcDnApuWcn4MWm=bJZS2=UqbLT2=MnpfsJePG=qA_wA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: RIMT: Enable PCI ACS for root complexes mapped to
 an IOMMU
To: fangyu.yu@linux.alibaba.com
X-Proofpoint-GUID: Q7VtEqSxSHuQwl6QEGP-NVzSbHa0aI9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAzOSBTYWx0ZWRfX6IJ5o20Q5ZkM
 5VmAN3fXjn9ybezHDlSstvG2Jq+tJ+0ZA0qD9EKjaEf2BtFZiuFhw3JuNIsLERc1zgx6RoS9/hN
 LzpYBKwWjK50xch/U0AhtvoHeZ3+Xoxe4nEus1hXdGGQB3TtBHhLdtRbYFLL7nHxDXFEf48z6lb
 xwa/0ABgwMqFUidV1tljlDIcMeM8AFtUNX1diJ9D31etojTS5kTaCAaGdwMXOYXW4YV/tGwlKDi
 rReVRYiyztt2ib0xNSQ6qR8SHepEGo34yBwri2gUPtcyMzdLIpmPdf0NjuD3fHriOz8rT3xkCNr
 8muqLLGpTSz71Z/1NJy59RZwRYakR0iCw7psh/bYBmO6VnH3RSYe9txMl5zW+aPVIC4mGxSVqQ/
 x5FBWB52nrzKx9mlHoT9GYbR3zM+TP6l/96XVSf2YvdjHdvVRa6fXDQgo5WRiGePeAsNig5Jx9N
 ShM9bWjmVkTVwEbo3iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAzOSBTYWx0ZWRfXx7y61XMElXOg
 OdVvtVY+pBuVLh2Wd1/CUB0dhsYraknWJcWR2ZVaRcoef6AUjiB2BUXlAF1txbYiGGMDVdxlwYw
 SRj537tG//aF/sM2xXw94Sh2RDfjgW8=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a98fb6c cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=wQ6y6Ln1IUvFgne-YVsA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: Q7VtEqSxSHuQwl6QEGP-NVzSbHa0aI9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_214535_945794_223A71B0 
X-CRM114-Status: GOOD (  27.91  )
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, rafael@kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, iommu@lists.linux.dev, palmer@dabbelt.com, guoren@kernel.org, pjw@kernel.org, linux-riscv@lists.infradead.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMiwgMjAyNiBhdCA3OjMx4oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPgo+IE1pcnJvciB0aGUgQUNQSSBJT1JUIHNvbHV0aW9uIHVzZWQgb24gYXJtNjQgKHNl
ZSBpb3J0X2VuYWJsZV9hY3MoKSkKPiBieSBzY2FubmluZyB0aGUgUklNVCB0YWJsZSBmb3IgUENJ
ZSByb290IGNvbXBsZXggbm9kZXMgZHVyaW5nCj4gcmlzY3ZfYWNwaV9yaW10X2luaXQoKSwgd2hp
Y2ggcnVucyBiZWZvcmUgQUNQSSBQQ0kgZW51bWVyYXRpb24uIElmIGEKPiByb290IGNvbXBsZXgg
bm9kZSdzIElEIG1hcHBpbmcgcG9pbnRzIGF0IGFuIElPTU1VIG5vZGUsIGNhbGwKPiBwY2lfcmVx
dWVzdF9hY3MoKSBpbW1lZGlhdGVseSwgc28gcGNpX2Fjc19lbmFibGUgaXMgYWxyZWFkeSBzZXQg
YnkKPiB0aGUgdGltZSBhbnkgUENJIGRldmljZSBpcyBzY2FubmVkIGFuZCBwY2lfZW5hYmxlX2Fj
cygpIHJ1bnMuCj4KPiBPbmx5IG9uZSBjYWxsIHRvIHBjaV9yZXF1ZXN0X2FjcygpIGlzIG5lZWRl
ZCByZWdhcmRsZXNzIG9mIGhvdyBtYW55Cj4gcm9vdCBjb21wbGV4ZXMgYXJlIGZvdW5kLCBzbyB0
cmFjayB0aGF0IHdpdGggYSBzdGF0aWMgYWNzX2VuYWJsZWQKPiBmbGFnLCBzYW1lIGFzIGlvcnRf
ZW5hYmxlX2FjcygpIGRvZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZhbmd5dS55
dUBsaW51eC5hbGliYWJhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hY3BpL3Jpc2N2L3JpbXQuYyB8
IDU2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNTYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNj
di9yaW10LmMgYi9kcml2ZXJzL2FjcGkvcmlzY3YvcmltdC5jCj4gaW5kZXggZTQ1MzhmYTZjMmM4
Li5mMjJlMjhjODIxMWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL3Jpc2N2L3JpbXQuYwo+
ICsrKyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9yaW10LmMKPiBAQCAtMTc5LDYgKzE3OSw0MiBAQCBz
dGF0aWMgc3RydWN0IGFjcGlfcmltdF9ub2RlICpyaW10X3NjYW5fbm9kZShlbnVtIGFjcGlfcmlt
dF9ub2RlX3R5cGUgdHlwZSwKPiAgICAgICAgIHJldHVybiBOVUxMOwo+ICB9Cj4KPiArI2lmZGVm
IENPTkZJR19QQ0kKPiArc3RhdGljIHZvaWQgX19pbml0IHJpbXRfZW5hYmxlX2FjcyhzdHJ1Y3Qg
YWNwaV9yaW10X25vZGUgKnJpbXRfbm9kZSkKPiArewo+ICsgICAgICAgc3RhdGljIGJvb2wgYWNz
X2VuYWJsZWQgX19pbml0ZGF0YTsKPiArICAgICAgIHN0cnVjdCBhY3BpX3JpbXRfcGNpZV9yYyAq
cGNpX3JjOwo+ICsgICAgICAgc3RydWN0IGFjcGlfcmltdF9pZF9tYXBwaW5nICptYXA7Cj4gKyAg
ICAgICBzdHJ1Y3QgYWNwaV9yaW10X25vZGUgKnBhcmVudDsKPiArICAgICAgIGludCBpOwo+ICsK
PiArICAgICAgIGlmIChhY3NfZW5hYmxlZCB8fCByaW10X25vZGUtPnR5cGUgIT0gQUNQSV9SSU1U
X05PREVfVFlQRV9QQ0lFX1JPT1RfQ09NUExFWCkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+
ICsKPiArICAgICAgIHBjaV9yYyA9IChzdHJ1Y3QgYWNwaV9yaW10X3BjaWVfcmMgKilyaW10X25v
ZGUtPm5vZGVfZGF0YTsKPiArICAgICAgIGlmICghcGNpX3JjLT5pZF9tYXBwaW5nX29mZnNldCB8
fCAhcGNpX3JjLT5udW1faWRfbWFwcGluZ3MpCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiAr
Cj4gKyAgICAgICBtYXAgPSBBQ1BJX0FERF9QVFIoc3RydWN0IGFjcGlfcmltdF9pZF9tYXBwaW5n
LCByaW10X25vZGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX3JjLT5pZF9tYXBw
aW5nX29mZnNldCk7Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IHBjaV9yYy0+bnVtX2lk
X21hcHBpbmdzOyBpKyssIG1hcCsrKSB7Cj4gKyAgICAgICAgICAgICAgIGlmICghbWFwLT5kZXN0
X29mZnNldCkKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAg
ICAgICAgICAgIHBhcmVudCA9IEFDUElfQUREX1BUUihzdHJ1Y3QgYWNwaV9yaW10X25vZGUsIHJp
bXRfdGFibGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXAtPmRl
c3Rfb2Zmc2V0KTsKPiArICAgICAgICAgICAgICAgaWYgKHBhcmVudC0+dHlwZSA9PSBBQ1BJX1JJ
TVRfTk9ERV9UWVBFX0lPTU1VKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcGNpX3JlcXVl
c3RfYWNzKCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWNzX2VuYWJsZWQgPSB0cnVlOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgICAgICAgICAgfQo+ICsg
ICAgICAgfQo+ICt9Cj4gKyNlbHNlCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCByaW10X2VuYWJsZV9h
Y3Moc3RydWN0IGFjcGlfcmltdF9ub2RlICpyaW10X25vZGUpIHsgfQo+ICsjZW5kaWYKPiArCj4g
IC8qCj4gICAqIFJJU0MtViBzdXBwb3J0cyBJT01NVSBhcyBhIFBDSSBkZXZpY2Ugb3IgYSBwbGF0
Zm9ybSBkZXZpY2UuCj4gICAqIFdoZW4gaXQgaXMgYSBwbGF0Zm9ybSBkZXZpY2UsIHRoZXJlIHNo
b3VsZCBiZSBhIG5hbWVzcGFjZSBkZXZpY2UgYXMKPiBAQCAtNTA5LDcgKzU0NSwxMCBAQCBpbnQg
cmltdF9pb21tdV9jb25maWd1cmVfaWQoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCB1MzIgKmlk
X2luKQo+Cj4gIHZvaWQgX19pbml0IHJpc2N2X2FjcGlfcmltdF9pbml0KHZvaWQpCj4gIHsKPiAr
ICAgICAgIHN0cnVjdCBhY3BpX3JpbXRfbm9kZSAqcmltdF9ub2RlLCAqcmltdF9lbmQ7Cj4gKyAg
ICAgICBzdHJ1Y3QgYWNwaV90YWJsZV9yaW10ICpyaW10Owo+ICAgICAgICAgYWNwaV9zdGF0dXMg
c3RhdHVzOwo+ICsgICAgICAgaW50IGk7Cj4KPiAgICAgICAgIC8qIHJpbXRfdGFibGUgd2lsbCBi
ZSB1c2VkIGF0IHJ1bnRpbWUgYWZ0ZXIgdGhlIHJpbXQgaW5pdCwKPiAgICAgICAgICAqIHNvIHdl
IGRvbid0IG5lZWQgdG8gY2FsbCBhY3BpX3B1dF90YWJsZSgpIHRvIHJlbGVhc2UKPiBAQCAtNTI1
LDQgKzU2NCwyMSBAQCB2b2lkIF9faW5pdCByaXNjdl9hY3BpX3JpbXRfaW5pdCh2b2lkKQo+Cj4g
ICAgICAgICAgICAgICAgIHJldHVybjsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICByaW10ID0g
KHN0cnVjdCBhY3BpX3RhYmxlX3JpbXQgKilyaW10X3RhYmxlOwo+ICsgICAgICAgcmltdF9ub2Rl
ID0gQUNQSV9BRERfUFRSKHN0cnVjdCBhY3BpX3JpbXRfbm9kZSwgcmltdCwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByaW10LT5ub2RlX29mZnNldCk7Cj4gKyAgICAgICByaW10
X2VuZCA9IEFDUElfQUREX1BUUihzdHJ1Y3QgYWNwaV9yaW10X25vZGUsIHJpbXRfdGFibGUsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByaW10X3RhYmxlLT5sZW5ndGgpOwo+ICsK
PiArICAgICAgIGZvciAoaSA9IDA7IGkgPCByaW10LT5udW1fbm9kZXM7IGkrKykgewo+ICsgICAg
ICAgICAgICAgICBpZiAocmltdF9ub2RlID49IHJpbXRfZW5kKSB7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcHJfZXJyKCJSSU1UIG5vZGUgcG9pbnRlciBvdmVyZmxvd3MsIGJhZCB0YWJsZVxu
Iik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgICAgICAgICB9
Cj4gKwo+ICsgICAgICAgICAgICAgICByaW10X2VuYWJsZV9hY3MocmltdF9ub2RlKTsKPgpOSVQ6
IENhbiB3ZSBjaGVjayBoZXJlIGl0c2VsZiBpZiBpdCBpcyBhIFBDSSBSQyBub2RlIGFuZCB0aGVu
IG9ubHkKY2FsbCBlbmFibGVfYWNzKCk/Cgo+ICsgICAgICAgICAgICAgICByaW10X25vZGUgPSBB
Q1BJX0FERF9QVFIoc3RydWN0IGFjcGlfcmltdF9ub2RlLCByaW10X25vZGUsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByaW10X25vZGUtPmxlbmd0aCk7Cj4gKyAg
ICAgICB9Cj4gIH0KPiAtLQo+IDIuNTAuMQo+Ck90aGVyd2lzZSwgTEdUTS4KClJldmlld2VkLWJ5
OiBTdW5pbCBWIEwgPHN1bmlsdmxAb3NzLnF1YWxjb21tLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
