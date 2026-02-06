Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9C7EE20AF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLzeBzkRriYJEezHgAglX5sVL//BqnEnilySBt1Dl8U=; b=pnIsGSw8R2F1hW
	159ZhsNTHyfAJ1EaiYxjDu8GZeU5g7ywytxIgoZqjbCJYD/dLKSfYTpJVtRxoauTJFkyxI18UnN5Q
	l4pZUXNG3GMwUUOEgjotTUYrSwGLX92A07bKz++EsB04ahT+VJJq/IasnagVfj3NUymvsSXTan9ed
	aLQTkDzC15YG+TxNx7tYbDI5xqkr4pSDk1FiH6SZPt9RQbVHmLBJCS5ot83kDVnKbNpJybNZw5QNn
	W6B/hLSmEiXE9uSYpnkpZy9IyW7Znn+X3QHKtCTHvBk/1TnThH+amfYTC6AXcTL9WcgdMGxsP4PVC
	AyZL4HKKhPcs3kY5YD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voNSx-0000000BTcN-3aC0;
	Fri, 06 Feb 2026 15:09:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voNSu-0000000BTb1-1P1F
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 15:09:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167pTwT2490662
	for <linux-riscv@lists.infradead.org>; Fri, 6 Feb 2026 15:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lcs4pjDWug9NOgYAjE4oCiI3J7ua4/c74IiXacv+yFg=; b=Q6AkNa4tpF7NF+Z9
	LNSqfgkRZ5EHCySJQM+l+BsFwhdrdsUmh/9hTV1//IYJtkaHrqUvqt9Hk0INRxY9
	VVybfsKO/IzvtX/wgIGb5XSQkkOqsvBUqcmtSAj2kDDpLlLc3LXPP5L/atB2zd1a
	285+qX8bbUy7dTqos0lGzWF7wP0L3tWgxtlk4IWXehSX3/ORgD0nf7MREHbhfjln
	aQHKvb1eHaEcKdlYvpBncBWK1iOwtA/eQoHyjRrgdRP5bXMgvyTjCMsIdmfFqQN5
	HsjxgQv1b/PuvLQZbdJRTSsgFrrfIrxUrLISjKo1CM2uDDf/c5W9QvS/GVK/YBI6
	djLgpg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c9c19sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 15:09:45 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45f39e21e1bso6947679b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770390585; x=1770995385; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lcs4pjDWug9NOgYAjE4oCiI3J7ua4/c74IiXacv+yFg=;
        b=Qrfh/uriQpyc7QnNBK7W/3XRg7QDf4i7jt+S8aOg+yezP5s46vcVsGPUFFjGMu0RIs
         vwIqJdhZntGhvu8RwFItR4B9q8CtRQwtrwP00DfSaOPBDdDi9QDgy5b9HKkDTlX2VPMF
         eq/7GjrN6jB/3le3Kbh0yy4YkoO3HDnSvAluBz8v2s/aVt2p1iUZx0MwQRfP49ZMfRow
         qZEqz4px8DtOk5NFpHfnWsHv8597pkWB54HTFNeNL/NS+6njRKrtA95GMx0vQjFSV02c
         ZV+X4tt/HiWEMHEd3a7anKd7qgXVMpFNbMYgrBCnTnU11TKYQdX+eT2Qtnjta373zgk7
         VwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390585; x=1770995385;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcs4pjDWug9NOgYAjE4oCiI3J7ua4/c74IiXacv+yFg=;
        b=uI5BBhee2vyjk/OtE+T+q2gtqMAuJ6OpyduotFvwjoKNOcqkDgB44X/g+B9GjjKJb4
         azKmC7JKNjKaFc8hdP+LPMyXwR1UG+Vnwk0GGYSqjSHJ0QIFjq0tjaNezr3rCOJM9lIS
         r1mObMPpvGZTy0L2C6k5cEOb0vcS8aJwn0mJMjDWk5ClfGk6Yd/2kOlNe1gAMw2aChgm
         LzRT1Av6OpkDAPwcDGzv4vNYTS8R14mPOt17JUTMR5q5U7qQPRx4gRLvgGmt7ov6M5/6
         nY+dWopiR5oQZsNX++hzq/kSQ+8fsEF50Na5qInBeLiDtI4YyeqW/nRqky7MSPbDhwoj
         Wonw==
X-Forwarded-Encrypted: i=1; AJvYcCXtjBvCIPakSrkxm00+q7b9krMy58Uw/P/bCa+01GkrEPRvyZmZHjwnMjVLyI7dV9FdhtROFHuWvu871w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtpVyK3VqSugarUmJ2Z62rp16Rzt+TJ7wXKDILTnjhoZd5pj9q
	b2wJjsvgyq9odVCqQVfAUZ5F+4etZC48x3sSRufsaV1Kt1N7ceuToYH0oWqD/Ae0bp83ks3PPhb
	N7n6qK8smpvj0RZexjd+53wGDtq1rKFiS67+15Ia28NcfvYCiUXc3TgVjknKAYYAyb/bM5JQ=
X-Gm-Gg: AZuq6aKC5e7vGsvO12eNb2T5iLSUnKHLitOSG71k8/VHtIhmOExwWQE1qQ99uSLlXSC
	HLS69yxN4vgRnWwjtJpH4ghbEc/d8oA0RxfSojgAtWdfq+ZDL8KPCpycgdzh2VcjAJVOBeCDo6X
	LnvJl/IiqndxGCvWrQmJvXkQ9hdL3doSMXMsiLCOm/0M4CBS1P08c3YMmXv+WsoWZd/aGopbsDn
	UlELSXzUUizBH39JkePiFjAIhmQ1faX5hfoeu7enMyI68Ew24fD3MwgkKI3mkrkBaQb9DFZTMAi
	D2a5gZLESuR8plY7KPVb5lvU83/ELFwt50NjhekE8oef55+Efh6zoHeAF/k3Pn55ZrXn1E7AdpO
	+KVhX79hk54Y3zy70a2s=
X-Received: by 2002:a05:6820:228a:b0:661:ae2:95fb with SMTP id 006d021491bc7-66d0d2faf29mr1460752eaf.75.1770390585150;
        Fri, 06 Feb 2026 07:09:45 -0800 (PST)
X-Received: by 2002:a05:6820:228a:b0:661:ae2:95fb with SMTP id 006d021491bc7-66d0d2faf29mr1460723eaf.75.1770390584637;
        Fri, 06 Feb 2026 07:09:44 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-66d391aeb93sm1202941eaf.8.2026.02.06.07.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 07:09:44 -0800 (PST)
Date: Fri, 6 Feb 2026 09:09:43 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Zong Li <zong.li@sifive.com>, Tomasz Jeznach <tjeznach@rivosinc.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
        iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        devicetree@vger.kernel.org, Yaxing Guo <guoyaxing@bosc.ac.cn>
Subject: Re: [PATCH v3 3/8] iommu/riscv: Add HPM support for performance
 monitoring
Message-ID: <xukccsqgwmagqq5egx7i4op6nfot3t3lusnaso4pfzcq5h6bfz@adsm5nusnocx>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
 <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
 <4D87481E9AABE2C6+72d18f72-9407-4d68-8195-edc6c171df14@linux.spacemit.com>
 <CANXhq0q8N5eHx9ytabZR97Y7AULKwgS2-uEGhcaOOGp9mvbtRQ@mail.gmail.com>
 <6C65A3873186B07C+29da5dbd-ed27-4ace-a5ca-355b3983d60c@linux.spacemit.com>
 <zzbwkazzgeovgmbvg4qnibipzsldqcjnw4axnxlamhgvcld4hs@4m4cc2ctuuvf>
 <752514AD54FA2A1B+513d6894-b3bf-44f3-bcc1-7d30f2642cc2@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <752514AD54FA2A1B+513d6894-b3bf-44f3-bcc1-7d30f2642cc2@linux.spacemit.com>
X-Authority-Analysis: v=2.4 cv=BbzVE7t2 c=1 sm=1 tr=0 ts=69860439 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=pFyQfRViAAAA:8 a=pGLkceISAAAA:8 a=gObE7mBVTb-_oU6ProoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: Pkj2Gx_uK4BqEXlcm8Zvl0KNY_k3Wkdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEwOSBTYWx0ZWRfX7BgmTKHPPapf
 1QgyekAEPLFPqSHwchEg0GIYQmouGqmSVFJimKzbnZpYwWXqeI4cpeEKlrRxqZjioHk2jlvHsCb
 lvYWSi4Jhl9Zn9qa9kP88iKbxTNrXcztR76UF/n9dN6jIsZmFcaj4a+5QnUPgitrbb0i0JJ/uCa
 0lcaxYz4b4HRmAhi4dosZBGZHT2LmpvSfu0/0oojvK1e1ANfPsIruDm+JtBzeWXcDK/hl4PvoKT
 FsJRdBo+EgpGQZL5oCdX/1rWj4SGmlMJejgMXzgEO45aGDf3YFPZiv6OjsctX+Ns+C4+0i4SyZN
 N0un+utGbvGVNyQI9NEt6jEYlTO/1rLNFfGZVR/qAD+IXGH7OSXsUjgb/kBcc8M+hENoZ56bq1S
 XcqsE+J4fKzWsGILIrj9KYhin1K6qN5jVbK15+uk5P6C8tTTKc1OowCCb1Dk/I/aYYSygJkQEp5
 tBdJg9V2fT+gMV4a7hw==
X-Proofpoint-ORIG-GUID: Pkj2Gx_uK4BqEXlcm8Zvl0KNY_k3Wkdt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_070948_500963_0D69BBC8 
X-CRM114-Status: GOOD (  26.22  )
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

T24gRnJpLCBGZWIgMDYsIDIwMjYgYXQgMTE6NDI6MzlBTSArMDgwMCwgTHYgWmhlbmcgd3JvdGU6
Cj4gT24gMi81LzIwMjYgMTE6MjMgUE0sIEFuZHJldyBKb25lcyB3cm90ZToKLi4uCj4gPiBTaW5j
ZSBab25nIExpJ3MgcGF0Y2hlcyB3ZXJlIGFscmVhZHkgb24gdGhlIGxpc3QgdGhlbiB5b3VyIHNl
cmllc3dvdWxkPiBhdAo+IGxlYXN0IGRpc2N1c3MgdGhlbSBpbiB0aGUgY292ZXIgbGV0dGVyLCBl
eHBsYWluaW5nIHdoeSB5b3UndmUgb3B0ZWQKPiA+IG5vdCB0byBhZG9wdCB0aGVtLiBCdXQsIG1v
c3QgbGlrZWx5IHNvbWUgb2YgdGhlIHBhdGNoZXMgY2FuIGJlIGFkb3B0ZWQsCj4gPiBzbyB0aG9z
ZSBzaG91bGQgYmUgZXh0cmFjdGVkIGZyb20gWm9uZyBMaSdzIHdvcmsgKHdpdGggYXV0aG9yc2hp
cAo+ID4gcHJlc2VydmVkKSBhbmQgYmFzZWQgdXBvbiBpbiBvcmRlciB0byByZXNwZWN0IHRoYXQg
cHJpb3Igd29yay4KPiA+IAo+IAo+IFlvdSBjYW4gc2VlIHdlIGhhdmUgY29udGFjdGVkIGVhY2gg
b3RoZXIgaW4gY29tbXVuaXR5LCBhbmQgZGVjaWRlZCB0bwo+IGNvb3BlcmF0ZSBpbiB0aGlzIHdh
eSB0byBob25vciBoaXMgY29udHJpYnV0aW9uLiBCdXQgZmluYWwgZGVjaXNpb24gaXMKPiBsZWZ0
IGZvciB0aGUgY29tbXVuaXR5IHRvIGRlY2lkZToKPiAKPiBGcm9tIFpvbmcgTGk6Cj4gPj4gT2Yg
Y291cnNlLCBpZiB0aGUgY29tbXVuaXR5IHdvdWxkIHByZWZlciB0byBnbyB5b3VyIHZlcnNpb24s
IEnigJltCj4gPj4gcGVyZmVjdGx5IGZpbmUgd2l0aCB0aGF0IGFzIHdlbGwuCj4gCj4gV2UgcmVz
cGVjdCBhbGwgY29udHJpYnV0aW9ucywgV2UnbGwgYWRkIHRoZSBsaW5rIGluIGNvdmVyIGxldHRl
ciB0byB0aGUKPiBmb2xsb3ctdXAgcmV2aXNpb25zLCBsZXQgbWUga25vdyBpZiBhbnl0aGluZyBl
bHNlIHNob3VsZCBiZSBkb25lIHRvIHRoZQo+IG5ldyByZXZpc2lvbnMuCgpKdXN0IGRvIGFsbCB0
aGUgY29tbXVuaWNhdGlvbiBiZWZvcmUgcG9zdGluZywgYWxsb3dpbmcgdGhhdCBjb21tdW5pY2F0
aW9uCnRvIGJlIHN1bW1hcml6ZWQgaW4gdGhlIGNvdmVyIGxldHRlciBhbmQgaW4gYW55IGFwcHJv
cHJpYXRlIGNvbW1pdAptZXNzYWdlcyBzbyByZXZpZXdlcnMga25vdyB3aGF0J3MgZ29pbmcgb24u
IEFsc28gZG9uJ3QgZm9yZ2V0IHRvIENDCmFueWJvZHkgcHJldmlvdXNseSBpbnZvbHZlZCB0byBl
bnN1cmUgdGhleSBoYXZlIGEgY2hhbmNlIHRvIGNoaW1lIGluLgoKPiAKPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
IAo+IEFuZCBsZXQgbWUgZGVzY3JpYmUgaW4gZGV0YWlscyB0byBjb21wYXJlIHRoZSBmdW5jdGlv
bmFsaXRpZXMgYW5kCj4gYWRkcmVzc2VkIGNvbW1lbnRzIGJldHdlZW4gd2hhdCBpcyBwcm92aWRl
ZCBieSBKb2V5IGFuZCBieSBab25nOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI1MDExNTAzMDMwNi4yOTczNS0xLXpvbmcubGlAc2lmaXZlLmNvbS8KPiAKPiBUaGVyZSBpcyBu
byBtaXNzaW5nIGZ1bmN0aW9uYWxpdGllcyBiZXR3ZWVuIHRoZSB0d28gYXBwcm9hY2hlcywgSSBh
bHNvCj4gY2hlY2tlZCB0aGUgb3JpZ2luYWwgUm9iaW4ncyBjb21tZW50cywgbGV0IG1lIGRlc2Ny
aWJlIHRoZW0gaW4gZGV0YWlsczoKCk15IGNvbmNlcm4gd2Fzbid0IHdoZXRoZXIgb3Igbm90IFJv
YmluJ3MgY29tbWVudHMgd2VyZSBhZGRyZXNzZWQgaW4gdGhpcwpwb3N0aW5nICh0aGF0J3MgaW1w
b3J0YW50LCBidXQgbm90IHdoYXQgSSdtIHRhbGtpbmcgYWJvdXQpLiBNeSBjb25jZXJuCndhcyB0
aGF0IFpvbmcgTGkncyB3b3JrIHdhc24ndCBhZGRyZXNzZWQgaW4gYW55IHdheSwgc28gYXBwZWFy
ZWQgdG8gYmUKYSBjaGFuY2UgZm9yIGR1cGxpY2F0ZWQgZWZmb3J0cy4gSW5kZWVkIGhpcyByZXBs
eSBbMV0gaW5kaWNhdGVzIGV4YWN0bHkKdGhhdCBhbmQgZXZlbiB0aGF0IHRoZXJlIGlzIGEgdGhp
cmQgcGF0Y2ggc2VyaWVzIGJlaW5nIHdvcmtlZAppbmRlcGVuZGVudGx5LiBQbGVhc2Ugd29yayBv
dXQgd2hvIGFuZCB3aGF0IHBhdGNoZXMgYXJlIGdvaW5nIHRvIGJlCnRoZSBmb2N1cyBnb2luZyBm
b3J3YXJkIGFuZCBkZXNjcmliZSB0aGF0IGRlY2lzaW9uIGluIHRoZSBjb3ZlciBsZXR0ZXIKZm9y
IHRoZSBuZXh0IHJldmlzaW9uLiBBbmQgcGxlYXNlIGRvbid0IGZvcmdldCB0byBDQyBab25nIExp
IGFuZCBZYXhpbmcKR3VvLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQU5YaHEw
b2k5bkU3ZmZMR3N6NWo4R25DMVVEVEQtNGJFNGNhbnRSalcyZlhIWXJqSEFAbWFpbC5nbWFpbC5j
b20vCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
