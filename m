Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5245D2F7F2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvC2F16guuzP2TnSom/GnJn3yO3Hcs95JzX0lf1HtUc=; b=l6V60X9+9j9kKy
	xSYUmrfujgO70DMSnywkDJ1U0VLpTVGIyumgDQBpu/KMQ9/4hCW4KddrDkTq7BoQTd8089wQgDjHd
	0q9vRzWj0oZroD442GQV4+8UnQlT8A3VsU4bfgV/aXbdqL4jbZXTcZSBO5PZa/CzLx1+DV0NPgl5V
	TvR0meC4H5B74mplcUOHrf2MFBAi21a2Np4eEPPxEv8Xiw2YvxYNw7KP9Ouox+3sEIcvwNUfwTHHe
	t1iRCw//8hcvbGBhmpbOAdJGxtaUtrEUJZTZZ+jxZnDbyDmH/6G4QN7xS5wGSsmgZABsX/Lo9vEIH
	vbUHIvBgdg/tCdA6eSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRW7z-00000009XTh-3ciB;
	Fri, 05 Dec 2025 13:45:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRW7w-00000009XSt-329p
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 13:45:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B589YZk2518363
	for <linux-riscv@lists.infradead.org>; Fri, 5 Dec 2025 13:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sl8Rjg+GpX/yS2Dz6T16538XX/lIJ0ynq5UJxUVvk8=; b=W2RWH2A+SBkAWlZQ
	7nYMJwmcmBg1D2pVENp8s6uIp+oHboyEu0Xoe3JxDUwmq2+xxwtzGwB14ZdKMeFl
	uLKzDsh+vO0Iyo+gt/nmE2RItg3XnpDyanwziDWzW/AJH+3Rz7ryvbO/E7Pwrw/K
	gwtqAYPzrCuyI9AYHHOrhWnw72LIsjiDLDrAc8NpUM7zAnbDMWHLLB0BgYy4zPt5
	VSl/2AUpm+YSac9fycLbJkEMfabCEH4poh2cL9AUca40sWRA5ZdocjfhfyCOvVTg
	l7JTxbnmdWCOwH9+3Xj5UlT7ZFk7YyAci/6CcS1VBJhJhn5ewLy/ESOzW4JfVpl9
	lGUOjA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auj7n2ayg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 13:45:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956cdcdc17so23547855ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 05:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764942337; x=1765547137; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3sl8Rjg+GpX/yS2Dz6T16538XX/lIJ0ynq5UJxUVvk8=;
        b=gK+nZZNRU/jaF/Pb4Kmv1Gq/cGTQcSBepNKpqo6uDh5nSEJ7c8O3gaYLLdLbrQ0iV5
         ewQWjCQfJJSGNkagbaBjlEv9BoLKlSCmGZ9HFIR7UhZVCu6e7LFggsUUTtPnb0IiE7/n
         ERgMKGd+c46qtVFpJQe4U6S7uD58TI8ckAq6kKkP1Z+16XtqoMtjh7Wx1wmnpS55Qv2c
         ycA6sIodA9dGu+Jg4C/JRYRyR6kuBrx5kCyRGh9/+pqypll08VuPN4T45vQqA0hTfgmu
         u/YAc8nGq0/awePg3xYLbrJQHXvY4wq8TJ27VxKotqKpT8RpXiZ33XhCQdeUXuRQjWK1
         TFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764942337; x=1765547137;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3sl8Rjg+GpX/yS2Dz6T16538XX/lIJ0ynq5UJxUVvk8=;
        b=H32KSu8FBIWUr55aNcuj4XtW/Hixr75z89XAnPm3jbgTjhdwtfRuEAd9qReMYPCDgv
         FAFukOcaPbNizE8uJv1LVPycT+w0wkDKvxMVO7eNT2tEArT8mKmGqx0/JoOTlc/Fg83i
         d9mJOX2q8WAWgrh56lcOGnIf6Jxx8pAXc2PyoLquVVoVE99TWiAWZftxbOfDGfdDxAdG
         XCZhYkhy2bb1Klx5T9Zja/EX2dr45WRMKKIvn0QavTvuUnIUdHjClunzIFD6neqdCVLY
         U6cVcLu+nyjEbfoNyiJBfmhVMOoMsIJmKyKtoEyg+KC7Dnm9P/0YbcunsaxOIPuCru4q
         UH9A==
X-Forwarded-Encrypted: i=1; AJvYcCUvFu9Fht4+FPv0jLqIkWkJTv9Lm1tCRhZFLFR2Imd+Y/tOenL28pEYLa60uA7MkSsATOikW4ddIRMjjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjxqGPmHRzCU9f30Do/TTrr2kskmB8ve6oyU4zgGLUAqeblTP8
	AUo79MTysk15qFty66xOB4Uf7KS6JBi8hiLQJP9m462xtkMVCmiBaFq6/tqz/SAc1syTmiXlb9V
	6qdTQsCDyqsni91Cw3S3saChDDzGg/mgmbsRkYM0MPGQaAMBtP3l7U5LaADb9IGGQWFkfYhQ=
X-Gm-Gg: ASbGncus0gyS7CJRn+xoyHCTu0i7Ca7iUFW7uNFZQhYrq92kyJaZ1gLLIHxU/P7ZNe0
	/DZ9jRMnx3CoyVb7PQ9ZET/tGpKUjmU1DjU1qnSnPDCsEEE0IoDbESP9/4Cldwh37BjHWfSFgmP
	FCm8CbWgylW2VhdX17RILE5fwSO7gC4fvQ49BZfEOgJCBVuxuHgwdBt6+XHRvmP1Ix9H6mVzto2
	6c5FHJrc6I8NIIoovHNOE5gGSM2872DVM9UGb1YrQzF8xxBfknKi8+VhMTieFflrXbZJjPy91Nx
	3owtl8KONCzac5FdrzznWa7rAGNY8nvJooogcpPhRBxNetRUbEjWtwnPpWawiRcXyXfUVvIhzY8
	20mcjdyz5BuoW4/3Gkz/71FDtibgi7xk=
X-Received: by 2002:a17:902:fc87:b0:267:a1f1:9b23 with SMTP id d9443c01a7336-29d682f2fd2mr118719955ad.18.1764942337135;
        Fri, 05 Dec 2025 05:45:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQItCN2pv1meTC+2kJm5EbTCziAT3dxjYamZYJ6XTWaTUtpDBXJSNwvI2VARxGJQ3jjTIVAg==
X-Received: by 2002:a17:902:fc87:b0:267:a1f1:9b23 with SMTP id d9443c01a7336-29d682f2fd2mr118719575ad.18.1764942336600;
        Fri, 05 Dec 2025 05:45:36 -0800 (PST)
Received: from [192.168.29.116] ([49.37.148.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99fa59sm50494375ad.58.2025.12.05.05.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:45:35 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Google-Original-From: Harshal Dev <hdev@oss.qualcomm.com>
Message-ID: <45b5f14b-3746-4b05-a4b4-dc9f88e89e52@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:15:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Sumit Garg <sumit.garg@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Randy Dunlap <rdunlap@infradead.org>, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251204101730.1036671-1-arnd@kernel.org>
 <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=DOSCIiNb c=1 sm=1 tr=0 ts=6932e202 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=v+kbWGyw1T97G6+vs1uYIQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-jCBhvvmAAAA:20 a=VwQbUJbxAAAA:8
 a=xFIYUFTxM1JpX5VCbgAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 0NffTZ7POta_hqbUBhPvkpbENeiG3nmC
X-Proofpoint-GUID: 0NffTZ7POta_hqbUBhPvkpbENeiG3nmC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OCBTYWx0ZWRfXx3yoI3nDcuZZ
 4ApWBijr3YYyVUSGMGsWdt1v49IUwgno1T5kxiorHPDc8d55ThJ/oi5NrOkGtmd1TxP2YfCMR5p
 TQCaN45v2b877JZfnYr5lU6xZp+NyF3fhUSsL16ZldEdGSnLeEC1xbHh7UteLp+DgOgZUE+0x2b
 2d/2X34+Q+AW4bko7RCcALgAKHjjhtqDYJCyIiMVlE/4Rvnq+izwmrc/xYleBTLLOYi74oZv+Il
 wTT7m88NoRZAU8Y5qWGOOYNuUalbBMASq5e6kM09iw4viyPdKKQeBOdxd5uYppExDyhD/x7w4LX
 yqRRPPv4c+BuFrp4osSoz4+PGoXAjs8nEkdL2EKNImQ1KDS6M/9OZHhAgQ5U7sblRa1O0n7jpvE
 +zSpR2stSg1XET9sjxXg/R6fL7krYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_054540_916234_0E0D508B 
X-CRM114-Status: GOOD (  23.64  )
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

SGksCgpPbiAxMi80LzIwMjUgNjo1NyBQTSwgSmVucyBXaWtsYW5kZXIgd3JvdGU6Cj4gSGksCj4g
Cj4gT24gVGh1LCBEZWMgNCwgMjAyNSBhdCAxMToxN+KAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4+Cj4+IFRoZSB0ZWVfaW9jdGxfb2JqZWN0X2ludm9rZV9hcmcgc3RydWN0dXJlIGhhcyBw
YWRkaW5nIG9uIHNvbWUKPj4gYXJjaGl0ZWN0dXJlcyBidXQgbm90IG9uIHg4Ni0zMiBhbmQgYSBm
ZXcgb3RoZXJzOgo+Pgo+PiBpbmNsdWRlL2xpbnV4L3RlZS5oOjQ3NDozMjogZXJyb3I6IHBhZGRp
bmcgc3RydWN0IHRvIGFsaWduICdwYXJhbXMnIFstV2Vycm9yPXBhZGRlZF0KPj4KPj4gSSBleHBl
Y3QgdGhhdCBhbGwgY3VycmVudCB1c2VycyBvZiB0aGlzIGFyZSBvbiBhcmNoaXRlY3R1cmVzIHRo
YXQgZG8KPj4gaGF2ZSBpbXBsaWNpdCBwYWRkaW5nIGhlcmUgKGFybTY0LCBhcm0sIHg4Niwgcmlz
Y3YpLCBzbyBtYWtlIHRoZSBwYWRkaW5nCj4+IGV4cGxpY2l0IGluIG9yZGVyIHRvIGF2b2lkIHN1
cnByaXNlcyBpZiB0aGlzIGxhdGVyIGdldHMgdXNlZCBlbHNld2hlcmUuCj4+Cj4+IEZpeGVzOiBk
NWI4YjBmYTE3NzUgKCJ0ZWU6IGFkZCBURUVfSU9DVExfUEFSQU1fQVRUUl9UWVBFX09CSlJFRiIp
Cj4+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4+IC0tLQo+
PiBUaGUgbmV3IGludGVyZmFjZSBzaG93ZWQgdXAgaW4gNi4xOCwgYnV0IEkgb25seSBjYW1lIGFj
cm9zcyB0aGlzIGFmdGVyCj4+IHRoYXQgd2FzIHJlbGVhc2VkLiBDaGFuZ2luZyBpdCBub3cgaXMg
dGVjaG5pY2FsbHkgYW4gQUJJIGNoYW5nZSBvbgo+PiBhcmNoaXRlY3R1cmVzIHdpdGggdW51c3Vh
bCBwYWRkaW5nIHJ1bGVzLCBzbyBwbGVhc2UgY29uc2lkZXIgY2FyZWZ1bGx5Cj4+IHdoZXRoZXIg
d2Ugd2FudCB0byBkbyBpdCB0aGlzIHdheSBvciBub3QuCj4+Cj4+IFdvcmtpbmcgYXJvdW5kIHRo
ZSBBQkkgZGlmZmVyZW5jZXMgd2l0aG91dCBhbiBBQkkgY2hhbmdlIGlzIHBvc3NpYmxlLAo+PiBi
dXQgYWRkcyBhIGxvdCBvZiBjb21wbGV4aXR5IGZvciBjb21wYXQgaGFuZGxpbmcuCj4gCj4gVGhp
cyBpcyBjdXJyZW50bHkgb25seSB1c2VkIGJ5IHRoZSByZWNlbnRseSBpbnRyb2R1Y2VkIHFjb210
ZWUgYmFja2VuZAo+IGRyaXZlci4gU28gaXQncyBvbmx5IHVzZWQgb24gYSBmZXcgYXJtNjQgUXVh
bGNvbW0gcGxhdGZvcm1zIHJpZ2h0IG5vdy4KPiAKPiBJIHRoaW5rIHdlIHNob3VsZCB0YWtlIHRo
aXMgcGF0Y2gsIGJ1dCBsZXQncyBoZWFyIHdoYXQgb3RoZXJzIHRoaW5rLgo+IAo+IFRoYW5rcywK
PiBKZW5zCj4gClRoZSBvbmx5IHVzZXItc3BhY2UgY2xpZW50IHdoaWNoIGlzIGN1cnJlbnRseSB1
c2luZyB0aGlzIEFCSSAoYXMgcGVyIG91ciBrbm93bGVkZ2UpCmlzIHRoZSBsaWJxY29tdGVlIGxp
YnJhcnk6IGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljL3F1aWMtdGVlYy9ibG9iL21haW4vbGlicWNv
bXRlZS9zcmMvbGludXgvdGVlLmgjTDQzMgoKSWYgSSB1bmRlcnN0YW5kIEFybmQncyBjb25jZXJu
IGNvcnJlY3RseSwgaWYgYSBjb21waWxlciB1c2VkIHRvIGJ1aWxkIHRoZSB1c2VyLXNwYWNlCmNs
aWVudCBza2lwcyB0aGUgcGFkZGluZyBmb3IgdGVlX2lvY3RsX29iamVjdF9pbnZva2VfYXJnLCBp
dCBjb3VsZCBsZWFkIHRvIGlzc3Vlcy4KCkxldCdzIHdhaXQgZm9yIEFtaXIncyB2aWV3IGhlcmUg
YXMgd2VsbCwgaG93ZXZlciBJIGRvIHRoaW5rIHRoZSBleHBsaWNpdCBwYWRkaW5nIHdvdWxkCmJl
bmVmaXQgaGVyZS4KClJlZ2FyZHMsCkhhcnNoYWwKCj4+IC0tLQo+PiAgaW5jbHVkZS91YXBpL2xp
bnV4L3RlZS5oIHwgMSArCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC90ZWUuaCBiL2luY2x1ZGUvdWFwaS9saW51
eC90ZWUuaAo+PiBpbmRleCBjYWI1Y2FkY2E4ZWYuLjUyMDM5NzdlZDM1ZCAxMDA2NDQKPj4gLS0t
IGEvaW5jbHVkZS91YXBpL2xpbnV4L3RlZS5oCj4+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC90
ZWUuaAo+PiBAQCAtNDcwLDYgKzQ3MCw3IEBAIHN0cnVjdCB0ZWVfaW9jdGxfb2JqZWN0X2ludm9r
ZV9hcmcgewo+PiAgICAgICAgIF9fdTMyIG9wOwo+PiAgICAgICAgIF9fdTMyIHJldDsKPj4gICAg
ICAgICBfX3UzMiBudW1fcGFyYW1zOwo+PiArICAgICAgIF9fdTMyIDozMjsKPj4gICAgICAgICAv
KiBudW1fcGFyYW1zIHRlbGxzIHRoZSBhY3R1YWwgbnVtYmVyIG9mIGVsZW1lbnQgaW4gcGFyYW1z
ICovCj4+ICAgICAgICAgc3RydWN0IHRlZV9pb2N0bF9wYXJhbSBwYXJhbXNbXTsKPj4gIH07Cj4+
IC0tCj4+IDIuMzkuNQo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
