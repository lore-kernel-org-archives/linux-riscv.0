Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2A5CCD187
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 05:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfFfh68/C9aWJFx1+x/v0cb+RuJTULt9FClGMVi8Yk0=; b=NTe23gCajosbcZ
	tR5vb8YLfHA+CXFf1IMo62BOppiZiUSCSdg6VMb7f1/ZH6JhkjIKN5uRwbkqxeRJHpY8G3fTRIT9K
	OMBVIQm9sGGKPu9B1QXIFaMBd6qoTx6XOQh5yqOYtwqZdvwIV7WVxa2wnebQwyeYB0Jw57W5XspdM
	HHL2EdLpQXGR97nBFEaiklc69NPW5xPQscJqjfqBVKGWYzqGIIF4O+wmTlysz0L/WTQ6DQWGk8OKI
	OLJ0KZH2ISg7DAfTV6FKPouGUQZXpkzehkIXLEjE2WELxWrc45gc64InjNasbkszKhr62VRtgrdOb
	5uaZec0s4A8Hwn4bDvjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XSz-0000000FCLO-2SPI;
	Tue, 14 Oct 2025 05:20:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XSw-0000000FCKn-22n2
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 05:20:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDEaq008203
	for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 05:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvqF8DYLjafvi+gMij4k/ZfLIN5YYyS6USXN/Cv/VcM=; b=fX41j3W8rvIocm7p
	JUQz0BlDwmPhjDPs3ykoqGHbg0BTCr1Y2rloEKSmcmY5XcZOzI0BLc4kpZDngQjf
	dLEDXdq9fiMEj7qY9JOH9Jx4boZUqzR5Xr3/EO792xJJuLT7VO2h8Tkvxb7l1OUR
	qYK1rtiH32nzpIFzsg1SF/8rgXyxrlNdOnkuRliU082bMP66HVirpOMCaP9J3YpF
	kH4f0ClRKlE7oi1E74lqHWiTQ4etfv9Hfg6GFcqCSro6Z+7tcKdXqwGawsb375tK
	93jnhlzHGqUHBlbutNlr8FHuwXw3cGGVzaeK/U4apiPaGf/T6+gjk3Klld8cXm9f
	pa9WXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt415u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 05:20:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27ee41e062cso121512275ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 22:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760419252; x=1761024052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvqF8DYLjafvi+gMij4k/ZfLIN5YYyS6USXN/Cv/VcM=;
        b=RfHmGn6F0Wyh+eMgD6/xSIm63L3RbXvxDywAU31EL2XbLYcoBbvFKhs2cF9BczyMmb
         CyTDvd3+1ZQ+bVpXQSXuYYho4E0pBAg6oKOe28N4l8boKDUtVHtINQhdOUUnlwI17new
         pqdab8hz10quSiMTUyKSEMwaQO2Vgt4httHK/8H7IxEZlZF9Ap+/KjQk0IU2QdQC8C6+
         0aZnIFurtQBsPPaD7jWhkhniA76wkt6SkUcNzvlwsE3tV23jKHTYaKR2KHbTkN3kcCuG
         OYyU/4lrkxUqUHtl+0eaUqTkBujGGx6/6ChmbFbAWveIXoZUXm1xOyp9j8lwZhr3aPlz
         JmrA==
X-Forwarded-Encrypted: i=1; AJvYcCVwFWvNuyeDThLRv2b8xaxGj/RA23MW9RoT/NgbFAidIUVwoI6VtAFqG2FwbDJ0l8cMWqKRmkrnHPl7Fg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz69zS5npTRy5qmDDhRLzFb7ap9WBYBY0eR37BzqR2ObFNMyJcv
	YlIU1dIJF/9SqLO+8pM8R4SDY0b7s0BtdX83VuWk4LQ64FncMcVqGBnCIIUsm+u0+04XgbOJgai
	kgDX+ufw35UzBemBBrR5UvO4M8WyQl3+oqTuiboeiCa2nLFnCAEDlYMafL69+paqOC36FjRw=
X-Gm-Gg: ASbGncsS1rhd+/K8YjOMHPlQdVYXAevm2l+OOqvDXbyog7AE5s655gCMII0Xu9+Andz
	hd55RwcModlyyPTmt9rdq7eZ9pnuV2tEDgheerdeZwpDGIOQmYUdEpmAUc9ZJxWMX+cCYTaqnN7
	1mk6pElRBl2kp7IUNugQ2VC02nTPlie9Sew8IeiOLt9gfoHsqUaN2ywi2oQCoiqA5TjfpYX8zt8
	5jl/PBym4vaxi2dK2nX39nY+SPYsuNX0x7FbQ3vM8YBnevipau+0lwdOwQ+uIey/2lJ9cH/z0/Q
	XJyuGMsUm03fen/B/Uxl5C4cfhsmK0VEp5Uctv/wmxkbYZj1syx3UF0l7Mq2c5j63NQ/QwQw7g=
	=
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr281598465ad.44.1760419251733;
        Mon, 13 Oct 2025 22:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsL1A/NUIg/+/5DcYNeqv6XyMlYlzj4jSQQAAeiL0ON/Muf4qcSsKga9vyJuwXAaA1wTT+9w==
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr281598155ad.44.1760419251227;
        Mon, 13 Oct 2025 22:20:51 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f894c8sm151716115ad.122.2025.10.13.22.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:20:50 -0700 (PDT)
Message-ID: <bc7deb1a-5f93-4a36-bd6a-b0600b150d48@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:50:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
To: Bjorn Helgaas <helgaas@kernel.org>, Ron Economos <re@w6rz.net>,
        Conor Dooley <conor@kernel.org>
Cc: bhelgaas@google.com, rishna.chundru@oss.qualcomm.com, mani@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Paul Walmsley
 <pjw@kernel.org>,
        Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        regressions@lists.linux.dev
References: <20251013212801.GA865570@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251013212801.GA865570@bhelgaas>
X-Proofpoint-ORIG-GUID: nNHXKRSwxV91ipzWcCPrNyJdMtcIB6iz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXw4U9pLQxzIWL
 5QOvHm9WGMyLbxB8CJGdSd5DueRiWkZBFpSDMaWUgbo/tNVvtVymfpZEB/0JRLt5GQL9Bbo0umJ
 dUKrvKyPuPqzmblDelb+jQVlXyWuEYeTc2bgiEcgndrFWp7wpKRD2aCXglgXibY7StHzBrD+soI
 XVLnHnbSLXEMeEM8L0mg9e3/lDoI28WSEaTKA7xftAANlApngvnTd5NK7Q7UVJvlLjJMPcWtJ75
 WWmkiKgTWGFv/Kv8o6pMbHQN99+KeGhucPUWv1MCykYpwYGNP/zp6fxXA+MJuOwZDg0KIUfEx9L
 W6Ix6f0XuwCdcySxPlyzcv0sKLk9I3k2UQfpg+OEQfMA/Zm2FB9XcBpsObNeZKl8UfVUfTQCDtq
 8W2jSnhuqfzB3cINqolq8JxYgO2WHQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68edddb5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fhfb3jyVSOwbcj7u4KkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: nNHXKRSwxV91ipzWcCPrNyJdMtcIB6iz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_222054_670376_83CA9BE0 
X-CRM114-Status: GOOD (  16.89  )
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

CgpPbiAxMC8xNC8yMDI1IDI6NTggQU0sIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4gWytjYyBGVTc0
MCBkcml2ZXIgZm9sa3MsIENvbm9yLCByZWdyZXNzaW9uc10KPiAKPiBPbiBNb24sIE9jdCAxMywg
MjAyNSBhdCAxMjoxNDo1NEFNIC0wNzAwLCBSb24gRWNvbm9tb3Mgd3JvdGU6Cj4+IFRoZSBTaUZp
dmUgRlU3NDAgUENJIGRyaXZlciBmYWlscyBvbiB0aGUgSGlGaXZlIFVubWF0Y2hlZCBib2FyZCB3
aXRoIExpbnV4Cj4+IDYuMTgtcmMxLiBUaGUgZXJyb3IgbWVzc2FnZSBpczoKPj4KPj4gW8KgwqDC
oCAzLjE2NjYyNF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogaG9zdCBicmlkZ2UgL3NvYy9w
Y2llQGUwMDAwMDAwMAo+PiByYW5nZXM6Cj4+IFvCoMKgwqAgMy4xNjY3MDZdIGZ1NzQwLXBjaWUg
ZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoMKgIElPCj4+IDB4MDA2MDA4MDAwMC4uMHgwMDYwMDhm
ZmZmIC0+IDB4MDA2MDA4MDAwMAo+PiBbwqDCoMKgIDMuMTY2NzY3XSBmdTc0MC1wY2llIGUwMDAw
MDAwMC5wY2llOsKgwqDCoMKgwqAgTUVNCj4+IDB4MDA2MDA5MDAwMC4uMHgwMDdmZmZmZmZmIC0+
IDB4MDA2MDA5MDAwMAo+PiBbwqDCoMKgIDMuMTY2ODA1XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5w
Y2llOsKgwqDCoMKgwqAgTUVNCj4+IDB4MjAwMDAwMDAwMC4uMHgzZmZmZmZmZmZmIC0+IDB4MjAw
MDAwMDAwMAo+PiBbwqDCoMKgIDMuMTY2OTUwXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBF
Q0FNIGF0IFttZW0KPj4gMHhkZjAwMDAwMDAtMHhkZmZmZmZmZmZdIGZvciBbYnVzIDAwLWZmXQo+
PiBbwqDCoMKgIDMuNTc5NTAwXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBObyBpQVRVIHJl
Z2lvbnMgZm91bmQKPj4gW8KgwqDCoCAzLjU3OTU1Ml0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNp
ZTogRmFpbGVkIHRvIGNvbmZpZ3VyZSBpQVRVIGluIEVDQU0KPj4gbW9kZQo+PiBbwqDCoMKgIDMu
NTc5NjU1XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBwcm9iZSB3aXRoIGRyaXZlciBmdTc0
MC1wY2llCj4+IGZhaWxlZCB3aXRoIGVycm9yIC0yMgo+Pgo+PiBUaGUgbm9ybWFsIG1lc3NhZ2Ug
KG9uIExpbnV4IDYuMTcuMikgaXM6Cj4+Cj4+IFvCoMKgwqAgMy4zODE0ODddIGZ1NzQwLXBjaWUg
ZTAwMDAwMDAwLnBjaWU6IGhvc3QgYnJpZGdlIC9zb2MvcGNpZUBlMDAwMDAwMDAKPj4gcmFuZ2Vz
Ogo+PiBbwqDCoMKgIDMuMzgxNTg0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOsKgwqDCoMKg
wqDCoCBJTwo+PiAweDAwNjAwODAwMDAuLjB4MDA2MDA4ZmZmZiAtPiAweDAwNjAwODAwMDAKPj4g
W8KgwqDCoCAzLjM4MTY4Ml0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKgIE1F
TQo+PiAweDAwNjAwOTAwMDAuLjB4MDA3ZmZmZmZmZiAtPiAweDAwNjAwOTAwMDAKPj4gW8KgwqDC
oCAzLjM4MTcyNF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKgIE1FTQo+PiAw
eDIwMDAwMDAwMDAuLjB4M2ZmZmZmZmZmZiAtPiAweDIwMDAwMDAwMDAKPj4gW8KgwqDCoCAzLjQ4
NDgwOV0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogaUFUVTogdW5yb2xsIFQsIDggb2IsIDgg
aWIsIGFsaWduCj4+IDRLLCBsaW1pdCA0MDk2Rwo+PiBbwqDCoMKgIDMuNjgzNjc4XSBmdTc0MC1w
Y2llIGUwMDAwMDAwMC5wY2llOiBQQ0llIEdlbi4xIHg4IGxpbmsgdXAKPj4gW8KgwqDCoCAzLjg4
MzY3NF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogUENJZSBHZW4uMyB4OCBsaW5rIHVwCj4+
IFvCoMKgwqAgMy45ODc2NzhdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IFBDSWUgR2VuLjMg
eDggbGluayB1cAo+PiBbwqDCoMKgIDMuOTg4MTY0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2ll
OiBQQ0kgaG9zdCBicmlkZ2UgdG8gYnVzIDAwMDA6MDAKPj4KPj4gUmV2ZXJ0aW5nIHRoZSBmb2xs
b3dpbmcgY29tbWl0cyBzb2x2ZXMgdGhlIGlzc3VlLgo+Pgo+PiAwZGE0OGM1YjJmYTczMWIyMWJj
NTIzYzgyZDkyNzM5OWExZTUwOGIwIFBDSTogZHdjOiBTdXBwb3J0IEVDQU0gbWVjaGFuaXNtIGJ5
Cj4+IGVuYWJsaW5nIGlBVFUgJ0NGRyBTaGlmdCBGZWF0dXJlJwo+Pgo+PiA0NjYwZTUwY2Y4MTgw
MGY4MmVlZWNmNzQzYWQxZTNlOTdhYjcyMTkwIFBDSTogcWNvbTogUHJlcGFyZSBmb3IgdGhlIERX
QyBFQ0FNCj4+IGVuYWJsZW1lbnQKPj4KPj4gZjZmZDM1N2Y3YWZiZWIzNGE2MzNlNTY4OGEyM2I5
ZDdlYjQ5ZDU1OCBQQ0k6IGR3YzogUHJlcGFyZSB0aGUgZHJpdmVyIGZvcgo+PiBlbmFibGluZyBF
Q0FNIG1lY2hhbmlzbSB1c2luZyBpQVRVICdDRkcgU2hpZnQgRmVhdHVyZScKPiAKPiBBcyBDb25v
ciBwb2ludGVkIG91dCwgd2UgY2FuJ3QgZml4IGEgY29kZSByZWdyZXNzaW9uIHdpdGggYSBEVCBj
aGFuZ2UuCj4gCj4gI3JlZ3pib3QgaW50cm9kdWNlZDogZjZmZDM1N2Y3YWZiICgiUENJOiBkd2M6
IFByZXBhcmUgdGhlIGRyaXZlciBmb3IgZW5hYmxpbmcgRUNBTSBtZWNoYW5pc20gdXNpbmcgaUFU
VSAnQ0ZHIFNoaWZ0IEZlYXR1cmUnIikKSGkgQ29ub3IsCgpDYW4geW91IHRyeSB3aXRoIHRoaXMg
cGF0Y2ggYW5kIHNlZSBpZiBpdCBpcyBmaXhpbmcgdGhlIGlzc3VlLgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jIApiL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaWUtZnU3NDAuYwppbmRleCA2NjM2NzI1MjAzMmIuLmI1ZTBmMDE2YTU4MCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jCisrKyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYwpAQCAtMzI4LDYgKzMyOCw4
IEBAIHN0YXRpYyBpbnQgZnU3NDBfcGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIAoq
cGRldikKCiAgICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGFmcCk7CgorICAgICAg
IHBjaS0+cHAubmF0aXZlX2VjYW0gPSB0cnVlOworCiAgICAgICAgIHJldHVybiBkd19wY2llX2hv
c3RfaW5pdCgmcGNpLT5wcCk7CiAgfQoKLSBLcmlzaG5hIENoYWl0YW55YS4KCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
