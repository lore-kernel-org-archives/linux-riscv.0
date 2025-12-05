Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86352D2F7F8
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFc7Ihm8ortPzRbl+qg6xvCtigw4cj7Bk/g/mkEy6tg=; b=FU4BoFBYnH1/5y
	T9uzcesYiPgfBKSEDM2lUBNm7RjmA+1hXtAHRyvvuuG3R/fs9ygB9Gft4W+mh03FtsnjCIdMX5BMj
	mb6woeeI5ZvuL8yhtuqPjJebIt+ly9e7iOSUP6WlgKSSNqHkkvHknuDdXrcRosAJYtSKmFQH4MTJP
	GxK/5W6Fcus9VlZtLge+Ee8mwEhc2/v8shSEjtEw0GphVS2CT24W7WTVtHv2Sw6Bne2nbXapxJYeO
	z17RzgFaak1YUOLEDZNWpKQ3jCku9GMiJi7NUS2AICiITef1PIEh8a00nnFgXLk5M8lgqsbRG3MRJ
	DHHWyX/TF04iHClyAHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWX9-00000009Z71-3aai;
	Fri, 05 Dec 2025 14:11:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRWX7-00000009Z6Y-2qI7
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 14:11:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5Dr6U4912504
	for <linux-riscv@lists.infradead.org>; Fri, 5 Dec 2025 14:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QU8RQH9lmiI1HiYYmsKFuuvMvSYQmCzAce1xUwg2TNI=; b=c1S72kirhAvVDQnc
	pRtQKH5eNiROWLzDlffYD2GeRYyv2yPIvTELQ6dweHVudlMDZZOF84A8rvriCM8V
	RqSTUFvAUyP1z9U9SX3uodCNL0biuJneVAhOBZkkrd4b6ATPUGxA71qCGRtF9Vly
	bava4ugsWKNXMX0JtqjTjYp9tGmL/ENdydTR1d50Lj8SQEvlC6evg6HhEL0Ww7AP
	Bu8lotolOnrePXsjoUMi2wwynBccOJzAwpquH/pcNx9POxUGzOy5cn6PNghi6Ihb
	01Ml18FCb6LtCL/3b2gyDwwejRTqexneVpTUk9gsbeGlm13OeROSKQFwwr/Glczf
	522kVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ngr1q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 14:11:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343e262230eso2684691a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 06:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764943900; x=1765548700; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QU8RQH9lmiI1HiYYmsKFuuvMvSYQmCzAce1xUwg2TNI=;
        b=LWfTIY/HvSNnDRgOd6hL6s64KccNww7ZTWR8bONzZwyktzVgKOgmDII3U8wjyHjE8Z
         eVbrIf9ECEVY+Tsf1SFsxiSDO2R9bFBxIN5AJ7sfwb+N8VOD9gAk3UIRai579OoMZ88K
         XSK59uhee5V3UBr6z2WY2w+mp18bXO7YcSTFrjQ4xDPvjYGKhh0QolC0viSwq6zw1szb
         SIyOdfAYbXUi0hFE4hN4ntcN7h79+du6Ioep8cIict/BSc6YuJ+LYa2FRY2XH2ptmkSm
         f1JtLcsRcHZk8mY9Zm0WeUbCCmRyWvFP6bhlAMQNLLh0HZdQmC+zq8ibwj0V+SNj1p5s
         YeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764943900; x=1765548700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU8RQH9lmiI1HiYYmsKFuuvMvSYQmCzAce1xUwg2TNI=;
        b=CQbLi6Mgc/WZAiFp2BhhxOnUYFqOCCZlaQR4b7evEeAUTr7dplmk7mW2Hft0KtJoyk
         pTQzcY76try+XaPXCmxWS/5TIcWylx0ksw6mT5fWHlVk2NiXCXHc+pmrBCQ+KToCL/wH
         Hk2FhVxFH05uRVss5vbbGxw/N+P2vF3MsKdjKi0KuAxZ8uWvBpbpXf4vlWG0yjBVsJ25
         8BEWsB/ye07Yi5kLpCvSaGlmTSUW/kGQgb/TIV0ZJfeMf14c02xbSx2/prbabbkCwzJR
         zvkmcxevDhtAosUBzIplUi5I8NoGjtmG553iDbXCcw1ILAxpue2xzukh9iLuYu634DMW
         1OQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmJyBgrRN3C0+ZEIkZvOVqRMOhhvGqBWzTc1+JVJUgFWKaCKTDymaDBiErhbJJt3qvXGMbPtgoQLiLGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiQlMkN0eHvNDQtiIr3DCjqHMrb3nxI5UUvjbeEgNHRXGDo4PW
	N1AJ06vwTp396piZXXw/XK0IDYx3BwH68/Dxpds8iBm6ldPc1F7wgLaLbmxUxlGdV7k78sDgdlj
	osp6AKqqHro3FS81YLXTl7aMrWjFfY+a0KjbV6DDBGUggPrxifCZSbaEGjFMmyzjk/w1WJio=
X-Gm-Gg: ASbGncv7lDC8eX6KjLETDJ41WexkUcg+8GTruNlu+zELQs7Okpgb1hP+PkmbM/9YJ1r
	CrxUlX3Mff45RgVyJ7+Fj48k1//WiI/nFxoxM0qTP+1Ykb5DSOEUCXKYEbmdSYAkJqmj2Xgk+Tx
	E4kqvAS2kcLv4FYWgelSCqsTFWUNJ5KMZOz7Sr6YB5C1dMiY1+OcdLoA2n9k01/5NgXkqcHLTP6
	opxN3NMdNRj+unZ1m39+LGMtvgr/DVXkggP/2K0zRKsoS9Auj4kKFAUqI3Io93Z/euGyZy3aqrN
	x2DPDHafEvn4m0/jBGnfDRdf/B4YsHIhd6kVYWXKw0MZF2gYRn54ScnWlCSZtoeAPxC4nBvS7o4
	sRoDAEyucVHWZ6IYF7JHBmNTdQbhKJSfLrwAwDzaT
X-Received: by 2002:a17:90b:4d84:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-34947dbdb27mr7161691a91.15.1764943899448;
        Fri, 05 Dec 2025 06:11:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvIgH31sFc0fv/66qnhnm47zlrTrtPCxOOCtTotJgwqisCeo7VlZObp+bX3VPQSVYZkC+CVQ==
X-Received: by 2002:a17:90b:4d84:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-34947dbdb27mr7161643a91.15.1764943898915;
        Fri, 05 Dec 2025 06:11:38 -0800 (PST)
Received: from [192.168.29.116] ([49.37.148.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d27040sm4502133a91.5.2025.12.05.06.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 06:11:38 -0800 (PST)
Message-ID: <dbd809fd-9d1e-435c-892b-4757f7edd9b7@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:41:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
To: Arnd Bergmann <arnd@arndb.de>, Jens Wiklander
 <jens.wiklander@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Sumit Garg
 <sumit.garg@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Randy Dunlap <rdunlap@infradead.org>, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251204101730.1036671-1-arnd@kernel.org>
 <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
 <45b5f14b-3746-4b05-a4b4-dc9f88e89e52@oss.qualcomm.com>
 <9e44024d-a649-49d6-825f-97f2a11e1691@app.fastmail.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <9e44024d-a649-49d6-825f-97f2a11e1691@app.fastmail.com>
X-Proofpoint-ORIG-GUID: gvf8ELsqzq58CeM52IoKaLMVLppwKiR6
X-Proofpoint-GUID: gvf8ELsqzq58CeM52IoKaLMVLppwKiR6
X-Authority-Analysis: v=2.4 cv=DrNbOW/+ c=1 sm=1 tr=0 ts=6932e81c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=v+kbWGyw1T97G6+vs1uYIQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-jCBhvvmAAAA:20 a=VwQbUJbxAAAA:8
 a=u8VM9LE-TGAWi8YemUAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEwMiBTYWx0ZWRfX7f3+tWTuwfHk
 e4SB09foCyXYZCiXs3t3pDVyXX0mwUD+oC81KEWZDrAqoIyFm8r+arXZrrfX8jFNQMlYs/+m+AH
 jk4yc0N1XALJmeEDw9gV7Lhndc9rFbw5jEvjhnVDVBefU7ZW6BxyUhlivOMZ0pkqKG0TlL8W6Es
 4JFukbxCjKy3VtwoslNReVQYviAfsUs4hWHUNRq/3Soh00W1dA6hwMg3286qGGR+tbYjE09VRV1
 SkHz/CDe1jfXqTDdUBoVnzTlrPDgAC/dF/INVg53i1iEJTMaQt3sPAXwEZT6mD8gI+LR5bfQdYl
 XAyQygqwL5ygAnvtxjJwHnvSpmPXOmM2bLmIKyaQDEUUhKXMnJpzgKsylyeWDIy2nF1ZLw3vceq
 RZL78mPjylx2NosAakSYJzq/w29DRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_061141_867484_1B59A1BB 
X-CRM114-Status: GOOD (  21.02  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxMi81LzIwMjUgNzoyNiBQTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBPbiBGcmksIERl
YyA1LCAyMDI1LCBhdCAxNDo0NSwgSGFyc2hhbCBEZXYgd3JvdGU6Cj4+IE9uIDEyLzQvMjAyNSA2
OjU3IFBNLCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPj4+IE9uIFRodSwgRGVjIDQsIDIwMjUgYXQg
MTE6MTfigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4KPj4g
VGhlIG9ubHkgdXNlci1zcGFjZSBjbGllbnQgd2hpY2ggaXMgY3VycmVudGx5IHVzaW5nIHRoaXMg
QUJJIChhcyBwZXIgCj4+IG91ciBrbm93bGVkZ2UpCj4+IGlzIHRoZSBsaWJxY29tdGVlIGxpYnJh
cnk6IAo+PiBodHRwczovL2dpdGh1Yi5jb20vcXVpYy9xdWljLXRlZWMvYmxvYi9tYWluL2xpYnFj
b210ZWUvc3JjL2xpbnV4L3RlZS5oI0w0MzIKPj4KPj4gSWYgSSB1bmRlcnN0YW5kIEFybmQncyBj
b25jZXJuIGNvcnJlY3RseSwgaWYgYSBjb21waWxlciB1c2VkIHRvIGJ1aWxkIAo+PiB0aGUgdXNl
ci1zcGFjZQo+PiBjbGllbnQgc2tpcHMgdGhlIHBhZGRpbmcgZm9yIHRlZV9pb2N0bF9vYmplY3Rf
aW52b2tlX2FyZywgaXQgY291bGQgbGVhZCAKPj4gdG8gaXNzdWVzLgo+Pgo+PiBMZXQncyB3YWl0
IGZvciBBbWlyJ3MgdmlldyBoZXJlIGFzIHdlbGwsIGhvd2V2ZXIgSSBkbyB0aGluayB0aGUgCj4+
IGV4cGxpY2l0IHBhZGRpbmcgd291bGQKPj4gYmVuZWZpdCBoZXJlLgo+Pgo+IAo+IFRoZSBwcm9i
bGVtIGlzIG11Y2ggbmFycm93ZXI6IGFzIHRoZSBhbW91bnQgb2YgcGFkZGluZyBpcyBkZXRlcm1p
bmVkCj4gYnkgdGhlIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBBQkksIGtlcm5lbCBhbmQgdXNlcnNw
YWNlIG9uIHRoZSBzYW1lCj4gYXJjaGl0ZWN0dXJlIGFsd2F5cyBhZ3JlZSwgYW5kIHNwZWNpZmlj
YWxseSAzMi1iaXQgQXJtIHVzZXJzcGFjZQo+IGFuZCA2NC1iaXQgQXJtIHVzZXJzcGFjZSAoYWFy
Y2g2NCkgYWxzbyBoYXZlIHRoZSBzYW1lIHJ1bGVzLCBzbyB0aGVyZQo+IGlzIG5vIHByb2JsZW0g
b24gUXVhbGNvbW0ncyBwbGF0Zm9ybXMgZXZlbiB3aXRoIGNvbXBhdCAzMi1iaXQgdXNlcnNwYWNl
Lgo+IAo+IFRoZSBvbmx5IGFjdHVhbCBBQkkgcHJvYmxlbSB3b3VsZCBoYXBwZW4gb24gMzItYml0
IHg4NiAoaTM4NikKPiB1c2Vyc3BhY2UgcnVubmluZyBvbiBhIDY0LWJpdCB4ODYga2VybmVsLCBz
aW5jZSBpMzg2LWxpbnV4IGNvbXBpbGVycwo+IGhhdmUgZGlmZmVyZW50IGFsaWdubWVudCBydWxl
cyBmcm9tIG1vc3Qgb3RoZXIgYXJjaGl0ZWN0dXJlcy4KPiAKCldlbGwsIGFzIEplbnMgcG9pbnRl
ZCBvdXQsIHRoZSBURUVfSU9DX09CSkVDVF9JTlZPS0UgQUJJIHdoaWNoIHN1cHBvcnRzCm9iamVj
dC1iYXNlZCBJUEMgY3VycmVudGx5IGhhcyBubyBiYWNrLWVuZCBkcml2ZXJzIHRoYXQgYXR0ZW1w
dCB0byBjb21tdW5pY2F0ZQp3aXRoIGEgVEVFIHJ1bm5pbmcgb24geDg2IGFuZCBpbXBsZW1lbnRp
bmcgdGhlaXIgZW5kIG9mIHRoZSBvYmplY3QtSVBDIHByb3RvY29sCmluIHRoZSBmaXJtd2FyZS4g
U28gdGhpcyBvYnZpb3VzbHkgd29uJ3QgYmUgYW4gaW1tZWRpYXRlIGlzc3VlLgoKQnV0IGFzIHlv
dSBwb2ludGVkIG91dCwgdGhlIGlzc3VlIHdvdWxkIHBvcCB1cCBpZiBzb21lb25lIG9uIHg4NiBk
ZWNpZGVzIHRvIGltcGxlbWVudAppdCBhdCBzb21lIHBvaW50IGluIHRoZSBmYXIgYXdheSBmdXR1
cmUuCgpJIGRvIG5vdCBzZWUgYW55IGhhcm0gdGhpcyBwYXRjaCB3b3VsZCBkbyBmb3Igb3VyIGV4
aXN0aW5nIGltcGxlbWVudGF0aW9uLCB3ZSdsbApqdXN0IHVwZGF0ZSBvdXIgdXNlci1zcGFjZSBs
aWJyYXJ5IEFCSSBpbi1saW5lIHdpdGggdGhpcy4KClRoYW5rcywKSGFyc2hhbAoKPiAgICAgICAg
IEFybmQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
