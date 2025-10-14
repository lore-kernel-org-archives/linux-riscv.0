Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED092CCD18D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 05:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eaEXa+DoEP5JxW1ZY5vLpMnAnGXlRrjQRGCrXDLnAE=; b=Ve4MVTRClCKPkU
	sDwHMYvZAIHtHBiJJfzYkrrEoU4F9SEKgLEnWrsIjNw7v81gm/QOcB9698HwdCuSVJGa0vzeX60hn
	Bb1rw9Yyqe/fxqdxrfpcTU0CfyXXws8Eb/To4bZ4WsTKm5f5iLzmDI9ctgVR4SqeaYCiXM5j0NaFO
	dmfxLdb4iuNTf7Cl1xDkJj4meil7VoSq4vvPO0daOFiYXNZ60fmWksqjVXhSXXRAARfeEBHKvbARV
	1HzXNr3qaMQEu3tDI6rH0YcSd1bFqwoaPx3b+tmmLUVMQ3ARjBA7lrqc2Vl9v4GgCk+2cpieaizH3
	+NXk6HYx36abI0KDGbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Xhp-0000000FDhN-37s6;
	Tue, 14 Oct 2025 05:36:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Xhm-0000000FDgX-1mCG
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 05:36:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD6n5008032
	for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 05:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nGQ1HH2B6A4U5Y0vYjvst9AOWsJbygVsidDBRZJFqLM=; b=Bm8YKhchNTQWmJjN
	jUjOdXQyZYANctX0THA3f25h2SlmblfVPHtvC+rES8PaCmr5/PpLcBxwYPSDgps7
	w5CYFGhsYFU+t9PYf/Mt7OEOl8/EFMFyfTxgQtpw/ocxd6TGhUqkcR6hiVpzq/P5
	fMKLqP4V9voGH47iKRrSbSsAdJ4OKWL9xttEBmaKnSoIWKK1yZvxYOWEP7ONhvIg
	0nQ3iGZK7elNFtouFjZNv9X4X+sbkLlsdYHaH6P1xFVeXrPd4Ejp0P1rkN/fTPHO
	JWid4pHEtPwG9HECFsrfYTm6eOct58r2vYVIRRXQ4C7Lx1htJU6nyUYcu2plrFP1
	nZpDyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt429c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 05:36:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780d26fb6b4so6128663b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 22:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760420172; x=1761024972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGQ1HH2B6A4U5Y0vYjvst9AOWsJbygVsidDBRZJFqLM=;
        b=kEgwfW9wgPgl9co7MSTOWlvAta0f7z85+fFiaFsEQ3y6qPs/ppMRTBJHTpzkMAIjk1
         X/CJFoiN9/IfAFpsfXEAbcXzN8H1mUQQrpIPu0KI4T7V+rCltrko+LxndwOW+/TRvu1s
         UqHGcGfNjFrhwmrobmrB+ZOSfqKIFhnydMok02Bqfsz/Jitb7t6xDaQtVQASzjbQcrdT
         BulJruBsQNAEIxh3oVIB0at6BCby4bltla2RcPsjnJyG+bs+Ky2ebJ+2/cMSKESYPTFW
         meEvKJTH9a10jq7wgGDpFQdzO+FzMuhaw3oMGkg+uZHzMlyGdVpIXpvjMUwyZWx01K1E
         OnJw==
X-Forwarded-Encrypted: i=1; AJvYcCVe/LdnV5RJNUwxz9/4BLQree0A/rvjmvnL9MdW2+gMCxmGZJKXRPN5MPd2mItlieiPLy4CRFgNqRrIIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNvydvvDtNsIHsnZCFMaop3hk9f20LvuF2na2YmCCalCHb9nBE
	YKD1wZubp6a/n+v2WiMv+iWlrDWgbVvhLWCXBVpxuTQh02HvwO1n1nuH8oHrk9g2O901gN9LxpH
	JP6FEAkXhczN2uud28ZQqmPMdmPrk8aOv9Pxw2llL3xDQ6UQ0Tq8qKJLs1hDTVJS1vgZULso=
X-Gm-Gg: ASbGncs/dOx3XCQ8dDcB12VdnRnXGcAskNtsUDbaiZufSDLGiLdMov3Xtv7kzxqV8PI
	Ssh3xwz+2DlO6BTI9pAVOmNK8kTF8jwOHyhtWUx+AfO/H7B91xhD8ZhWTgoeOECy7BXJwTGzg/w
	Ueqt6oXukxQj2nOkv2uWD4yrdAnDVjPj+thePFH5A5CLZYvf8mxDsbmFo5LUZAD9fbn8p6NJ9If
	h34gFSW2L4+aO0BfcVWNXY+ZzzsRboPlpMVRsSUqdeony2u9DgZe1mAs1QoHt3zgnhu7cJFo3B5
	jVzjQd96/D+PBwxSO24bFbA0DFAILFHwCVzcRBi270y0V6u8vma8nyorkb334y8wl9OKiAtrLw=
	=
X-Received: by 2002:a05:6a20:9188:b0:32b:83bf:2cdb with SMTP id adf61e73a8af0-32da8206da3mr31448321637.15.1760420171890;
        Mon, 13 Oct 2025 22:36:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSlhc1mcSl8tmhuzaLaI+INs35wZ1CSXhcN7zcbL3S2avPe4DXFk5/GWDyliZFU2mc1MPfpg==
X-Received: by 2002:a05:6a20:9188:b0:32b:83bf:2cdb with SMTP id adf61e73a8af0-32da8206da3mr31448282637.15.1760420171401;
        Mon, 13 Oct 2025 22:36:11 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df4c40esm10506658a12.33.2025.10.13.22.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:36:11 -0700 (PDT)
Message-ID: <759e429c-b160-46ff-923e-000415c749ee@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:06:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
To: Ron Economos <re@w6rz.net>, Bjorn Helgaas <helgaas@kernel.org>,
        Conor Dooley <conor@kernel.org>
Cc: bhelgaas@google.com, mani@kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        regressions@lists.linux.dev
References: <20251013212801.GA865570@bhelgaas>
 <bc7deb1a-5f93-4a36-bd6a-b0600b150d48@oss.qualcomm.com>
 <95a0f2a4-3ddd-4dec-a67e-27f774edb5fd@w6rz.net>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <95a0f2a4-3ddd-4dec-a67e-27f774edb5fd@w6rz.net>
X-Proofpoint-ORIG-GUID: 9a48Q6MzH0_fdss_mjfQdx5RkOrqodCE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX5qg0+n4rmsIt
 3qEsArFObRZkEGrFtqAnHQ6U+nLRXtvucY1O5AvaqgIecqqdQd/TNR9zvICnT/7z7Cp/BsH39R7
 Wz+8HZ7lqsgFyTNXkfKzBwmi1UjkUbUJ/TqJvqq2xh/MfzY7QiO5QFzvhafffiQ/BTbPN2e5OBB
 0PTulxkIcbAxf8vP2XP8wc93d4Nhi+kyb+PLFWvlXlmK2NlomroJDzwwbRHavrpWcZKyGJO/H1J
 vyjbr9BPS+oaLIvAz0sMhggnTzj7v6MfUnQGfIV60EKkx0E9CPF3xVg8IoLoCxHWEDAE6ETAXY3
 ZdSh+u3B4BFKUk1u8W11IZt7St0V5ZzzozKrpcYPpT4P+yqtP1ZU3t+jd8yMAPJJQjHX7jJOAPW
 WW5p8bv1S4o0ThH9QUPAkogATLkiKg==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ede14d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JizxZ_2zm4TzMdWxA80A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 9a48Q6MzH0_fdss_mjfQdx5RkOrqodCE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_223614_577525_302C3F2C 
X-CRM114-Status: GOOD (  15.98  )
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

CgpPbiAxMC8xNC8yMDI1IDEwOjU2IEFNLCBSb24gRWNvbm9tb3Mgd3JvdGU6Cj4gT24gMTAvMTMv
MjUgMjI6MjAsIEtyaXNobmEgQ2hhaXRhbnlhIENodW5kcnUgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDEw
LzE0LzIwMjUgMjo1OCBBTSwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPj4+IFsrY2MgRlU3NDAgZHJp
dmVyIGZvbGtzLCBDb25vciwgcmVncmVzc2lvbnNdCj4+Pgo+Pj4gT24gTW9uLCBPY3QgMTMsIDIw
MjUgYXQgMTI6MTQ6NTRBTSAtMDcwMCwgUm9uIEVjb25vbW9zIHdyb3RlOgo+Pj4+IFRoZSBTaUZp
dmUgRlU3NDAgUENJIGRyaXZlciBmYWlscyBvbiB0aGUgSGlGaXZlIFVubWF0Y2hlZCBib2FyZCB3
aXRoIAo+Pj4+IExpbnV4Cj4+Pj4gNi4xOC1yYzEuIFRoZSBlcnJvciBtZXNzYWdlIGlzOgo+Pj4+
Cj4+Pj4gW8KgwqDCoCAzLjE2NjYyNF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogaG9zdCBi
cmlkZ2UgCj4+Pj4gL3NvYy9wY2llQGUwMDAwMDAwMAo+Pj4+IHJhbmdlczoKPj4+PiBbwqDCoMKg
IDMuMTY2NzA2XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOsKgwqDCoMKgwqDCoCBJTwo+Pj4+
IDB4MDA2MDA4MDAwMC4uMHgwMDYwMDhmZmZmIC0+IDB4MDA2MDA4MDAwMAo+Pj4+IFvCoMKgwqAg
My4xNjY3NjddIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoCBNRU0KPj4+PiAw
eDAwNjAwOTAwMDAuLjB4MDA3ZmZmZmZmZiAtPiAweDAwNjAwOTAwMDAKPj4+PiBbwqDCoMKgIDMu
MTY2ODA1XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOsKgwqDCoMKgwqAgTUVNCj4+Pj4gMHgy
MDAwMDAwMDAwLi4weDNmZmZmZmZmZmYgLT4gMHgyMDAwMDAwMDAwCj4+Pj4gW8KgwqDCoCAzLjE2
Njk1MF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogRUNBTSBhdCBbbWVtCj4+Pj4gMHhkZjAw
MDAwMDAtMHhkZmZmZmZmZmZdIGZvciBbYnVzIDAwLWZmXQo+Pj4+IFvCoMKgwqAgMy41Nzk1MDBd
IGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IE5vIGlBVFUgcmVnaW9ucyBmb3VuZAo+Pj4+IFvC
oMKgwqAgMy41Nzk1NTJdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IEZhaWxlZCB0byBjb25m
aWd1cmUgaUFUVSAKPj4+PiBpbiBFQ0FNCj4+Pj4gbW9kZQo+Pj4+IFvCoMKgwqAgMy41Nzk2NTVd
IGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IHByb2JlIHdpdGggZHJpdmVyIGZ1NzQwLXBjaWUK
Pj4+PiBmYWlsZWQgd2l0aCBlcnJvciAtMjIKPj4+Pgo+Pj4+IFRoZSBub3JtYWwgbWVzc2FnZSAo
b24gTGludXggNi4xNy4yKSBpczoKPj4+Pgo+Pj4+IFvCoMKgwqAgMy4zODE0ODddIGZ1NzQwLXBj
aWUgZTAwMDAwMDAwLnBjaWU6IGhvc3QgYnJpZGdlIAo+Pj4+IC9zb2MvcGNpZUBlMDAwMDAwMDAK
Pj4+PiByYW5nZXM6Cj4+Pj4gW8KgwqDCoCAzLjM4MTU4NF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAu
cGNpZTrCoMKgwqDCoMKgwqAgSU8KPj4+PiAweDAwNjAwODAwMDAuLjB4MDA2MDA4ZmZmZiAtPiAw
eDAwNjAwODAwMDAKPj4+PiBbwqDCoMKgIDMuMzgxNjgyXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5w
Y2llOsKgwqDCoMKgwqAgTUVNCj4+Pj4gMHgwMDYwMDkwMDAwLi4weDAwN2ZmZmZmZmYgLT4gMHgw
MDYwMDkwMDAwCj4+Pj4gW8KgwqDCoCAzLjM4MTcyNF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNp
ZTrCoMKgwqDCoMKgIE1FTQo+Pj4+IDB4MjAwMDAwMDAwMC4uMHgzZmZmZmZmZmZmIC0+IDB4MjAw
MDAwMDAwMAo+Pj4+IFvCoMKgwqAgMy40ODQ4MDldIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6
IGlBVFU6IHVucm9sbCBULCA4IG9iLCA4IAo+Pj4+IGliLCBhbGlnbgo+Pj4+IDRLLCBsaW1pdCA0
MDk2Rwo+Pj4+IFvCoMKgwqAgMy42ODM2NzhdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IFBD
SWUgR2VuLjEgeDggbGluayB1cAo+Pj4+IFvCoMKgwqAgMy44ODM2NzRdIGZ1NzQwLXBjaWUgZTAw
MDAwMDAwLnBjaWU6IFBDSWUgR2VuLjMgeDggbGluayB1cAo+Pj4+IFvCoMKgwqAgMy45ODc2Nzhd
IGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IFBDSWUgR2VuLjMgeDggbGluayB1cAo+Pj4+IFvC
oMKgwqAgMy45ODgxNjRdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IFBDSSBob3N0IGJyaWRn
ZSB0byBidXMgCj4+Pj4gMDAwMDowMAo+Pj4+Cj4+Pj4gUmV2ZXJ0aW5nIHRoZSBmb2xsb3dpbmcg
Y29tbWl0cyBzb2x2ZXMgdGhlIGlzc3VlLgo+Pj4+Cj4+Pj4gMGRhNDhjNWIyZmE3MzFiMjFiYzUy
M2M4MmQ5MjczOTlhMWU1MDhiMCBQQ0k6IGR3YzogU3VwcG9ydCBFQ0FNIAo+Pj4+IG1lY2hhbmlz
bSBieQo+Pj4+IGVuYWJsaW5nIGlBVFUgJ0NGRyBTaGlmdCBGZWF0dXJlJwo+Pj4+Cj4+Pj4gNDY2
MGU1MGNmODE4MDBmODJlZWVjZjc0M2FkMWUzZTk3YWI3MjE5MCBQQ0k6IHFjb206IFByZXBhcmUg
Zm9yIHRoZSAKPj4+PiBEV0MgRUNBTQo+Pj4+IGVuYWJsZW1lbnQKPj4+Pgo+Pj4+IGY2ZmQzNTdm
N2FmYmViMzRhNjMzZTU2ODhhMjNiOWQ3ZWI0OWQ1NTggUENJOiBkd2M6IFByZXBhcmUgdGhlIAo+
Pj4+IGRyaXZlciBmb3IKPj4+PiBlbmFibGluZyBFQ0FNIG1lY2hhbmlzbSB1c2luZyBpQVRVICdD
RkcgU2hpZnQgRmVhdHVyZScKPj4+Cj4+PiBBcyBDb25vciBwb2ludGVkIG91dCwgd2UgY2FuJ3Qg
Zml4IGEgY29kZSByZWdyZXNzaW9uIHdpdGggYSBEVCBjaGFuZ2UuCj4+Pgo+Pj4gI3JlZ3pib3Qg
aW50cm9kdWNlZDogZjZmZDM1N2Y3YWZiICgiUENJOiBkd2M6IFByZXBhcmUgdGhlIGRyaXZlciBm
b3IgCj4+PiBlbmFibGluZyBFQ0FNIG1lY2hhbmlzbSB1c2luZyBpQVRVICdDRkcgU2hpZnQgRmVh
dHVyZSciKQo+PiBIaSBDb25vciwKPj4KPj4gQ2FuIHlvdSB0cnkgd2l0aCB0aGlzIHBhdGNoIGFu
ZCBzZWUgaWYgaXQgaXMgZml4aW5nIHRoZSBpc3N1ZS4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYyAKPj4gYi9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWZ1NzQwLmMKPj4gaW5kZXggNjYzNjcyNTIwMzJiLi5iNWUwZjAxNmE1ODAg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYwo+
PiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMKPj4gQEAgLTMy
OCw2ICszMjgsOCBAQCBzdGF0aWMgaW50IGZ1NzQwX3BjaWVfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAKPj4gKnBkZXYpCj4+Cj4+IMKgwqDCoMKgwqDCoMKgIHBsYXRmb3JtX3NldF9kcnZk
YXRhKHBkZXYsIGFmcCk7Cj4+Cj4+ICvCoMKgwqDCoMKgwqAgcGNpLT5wcC5uYXRpdmVfZWNhbSA9
IHRydWU7Cj4+ICsKPj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGR3X3BjaWVfaG9zdF9pbml0KCZw
Y2ktPnBwKTsKPj4gwqB9Cj4+Cj4+IC0gS3Jpc2huYSBDaGFpdGFueWEuCj4+Cj4+Pgo+IEkndmUg
YWxyZWFkeSB0cmllZCBpdC4gSXQgZG9lc24ndCB3b3JrLiBTYW1lIGVycm9yIG1lc3NhZ2UgYXMg
YmVmb3JlLgpDYW4geW91IHNoYXJlIHVzIGRtZXNnIGxvZ3MgZm9yIHRoaXMgY2hhbmdlLgoKLSBL
cmlzaG5hIENoYWl0YW55YS4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
