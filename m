Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F564FD065D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1vjNa/9a6FO+Q9LIRSYFZ4PHwJ4+HB2bUY/dIEGhdk=; b=fex7dvPyzj4qqR
	lSqO6xijut7rXAUke8m1d16OW183OKgtP0IUB0JnZozLUdj+ApyuRhdK2gtV91XALo7gWSxxL5Pq8
	RSId0Q40ilI66NCfPLlEm8NKplsfAtmCMuPBuZEp2fvqpzCkO7bcbSOfLtPam4p29EAxfRjOD3n7i
	zyjGF1FILwxN4DyqCbGs24LWwLhrcGIVikLjWzSsDG1B36RXIGzVUxvsoUmolyGpP8gC2WDvM6hUf
	3oBYa12jgWYfu+8P9Z+UKEhdW8y0hjTL0atbClH7yLGSPw5p9Zy1itUf79SuQbU1X0qbnVR/6V2x1
	eiMO++6GRu2Ty9nw5urg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FCG-0000000BCJe-15YE;
	Wed, 11 Mar 2026 08:45:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FCD-0000000BCJG-3SGA
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 08:45:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B36Nt91573018
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 08:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=6NJGsZSemMKjxThp7/5QueVxlguAZYW/UtHDiHNpg4U=; b=PO
	WAnxVzO4aISGu6mu3r34AAW8GaneFVHS52YjvaUQQBhmLzHnohi4/6p1e5IbMxPj
	Yu5mHiyww7xrQrq8Z3BuFkCv9MNeE3R0LoXPqm0iDLQklHWoh/m02HMQuQKgJHA2
	eCZmBz8iVRpsSsLqQC+J5z30BZZP+xar2y59MMxz1COAdaAPPKUgc7al0wPks/rG
	NpCPob95V4VDoQGx0N4CjZgQgONSuqEfaU58hsKYUD+Fvf+9C+DaZBD02kSeu1Qy
	2uSONecSseC7dR7y04EGNfqbgG4aDSKixHVl59nrVcjW610X9XfUlCRaxJ9YZ2Ui
	efIX6ka1qvuxmDnjeRsg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkaqb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 08:45:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a0013d87bso181403076d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 01:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773218735; cv=none;
        d=google.com; s=arc-20240605;
        b=AC8PWklYlTFOz/qMzGRFXQXjHIDH1CGCmUrVU8LVIQgWMmJWsZKkqIDFeLYyuLW+ob
         nIgBQmdI5L17iVsccTfPKM+6m3WM7f/QWvO5wQ2SU0dLicPKByLWMC67OYMfT8r5q409
         gWOuV2ptXckQ2yLlKEwP17UU4xuly31AXCmDc0Rjc1T0m9LMcOBM1cCB79GdgnbgA1rM
         5ifalox4Nppv1SEHvT3Hfg0YjPvC+IbYYa/37PwdI+1di4qBKlghQojNQmJrqEtdspzP
         7f8DEFL6FrhBRcXFz0Vb8Rip00zD0iMY7BIl74WjXsaghqSH89bjyst7osXnN+DYqaZU
         PCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=6NJGsZSemMKjxThp7/5QueVxlguAZYW/UtHDiHNpg4U=;
        fh=VRGYp0hTg1YjwygJMfne+FFXNdnXOe+Ya5/ze6wl03M=;
        b=BqiGuTaB7IoX8YV+vVovOug80a8Vs6UVJeXG5of7TWJG+sovAp/zPuosTg/kkoC7IA
         Yomp0iEe/jDgfFzZLDkw2SgBsbBJlC53aCl4UYIDGPxtueHDyQjrlwJ/EXzSP1J4UXtk
         9OGnu7rkeCGQn27ugTjeP+TcwGBzJxeKzeoBBXCP2qVNcqOZBhjDYq3r64WBwsX2KCRm
         rrCzQ6jWwfQV5YOL+aBfFTTD4p9x/MwbtFZgu0QPFau5R898eZp9xiFHqmplSI/jFbna
         YKrphFSAsLPB264GnIPQsSHlSnQrw/gfojG6NzeuthyhcXmy0gsH9/eu4+2T/cE3oVkp
         W95w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218735; x=1773823535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6NJGsZSemMKjxThp7/5QueVxlguAZYW/UtHDiHNpg4U=;
        b=VkIJl2QoikjWk2VjpV/BrN5km38pzCLsywSKJdpQX/cREZRCasgsT8V/6oSREpYol8
         lDG2VXxIdEttF3AEcUarsOsGlRT+r6fCGna3pJY2uKc4EaA7UIt6Jh+VLUpv2z4lPDuJ
         XhzJjis8qlGMNvJYfMwz0GIwcYXx0AgysZUiAiSypDAvi7TcTTRX4HqAWh6qYRum9K57
         b0tyWEDGosNGG59wDHiSk65KiXnezEg1Fb2C6FaAQmwMYgNPEPWFGDfdtDw0FQ7PDVmq
         HMX4FkfFTfIoqFJKcSbNk+UT11+EoqejvVrmc62tAymI5fkIaO2GzHxd/jbQgtGpfXNS
         nBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218735; x=1773823535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NJGsZSemMKjxThp7/5QueVxlguAZYW/UtHDiHNpg4U=;
        b=jtX5Nel7it6/algCP8FOIgAigKryvKyBVRZnLSIBRc30EpXSYIZS/cvDGaK5S6G1X1
         +oXHGSIiJihz2HrLIUSrEH/Kgz4d23fUpmegKWPLC/gwRGdeCRAkHvAjpBk5rdCgvEeI
         LjPCuQ+mJEUFYuNCR2RHqL+IBh2upoKGYnof/2iSsjF0uShGDtT4c21jVfZF5Kgu/oPN
         8XPAnB0r+YXlLoepIGtsWvP2rHUhbce16Gj1LAl77trYMkoPh5fk8K1Qs52MeThXN1sx
         AQPR5aVQ/5KcVNT8XbbNtoQd6ODIoHAYC3jw6O1nHDVkPI4ECTp40UXjyk4NlH6a6PxQ
         /SYA==
X-Forwarded-Encrypted: i=1; AJvYcCXlFZqfZ/00lsQKhTEHWkkYzZOvXB4DnWs9l+eKa94CxtFtnmsBWgM8Nm0IhxSwxP7Cw3omuBrCzSINdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIaWO42oyLvfwsf7IB2F8UZzat9HeWSEdm3zjDGJr8KerNAGoZ
	docvvHhwgB+A0v5bCduuNhMDYjBMGLnb0ogPgI7XNPP37WHVjPMhsLR26sDP7iXFBXqdE8ZSMJK
	+WU1hs5iInjGf0KR+JQ8VLIxtjFvuCT7am0YA3kzCpSfBqZnFZRtHUQ5Cnnp4TyPiSI02wD4y4x
	7hti5rv3aGiGu6DUa+LYHN70OhWW8o9pPctRPxK6FMqIIxkg==
X-Gm-Gg: ATEYQzyAddLyYuBGAIsykcHnzAy3z/28ruomXHqsU88JMdkzpWJY8sqfeorHCiwY4ss
	uS/YgXVoIj2yjCa7z7oGM5/m7UIOVrliXVpXbeYPcqAAVphW1rs13dLSWKlAbGziLc1yBkoVf6Y
	e5zyXqH66/GLmsVp5Px6MsM7tgvsg0gqovxwYRcxKqNuWetKgGkHdOTm5fnrdj67KYIP/l1zwW7
	LRN6TI=
X-Received: by 2002:ad4:5fc8:0:b0:890:2480:f02e with SMTP id 6a1803df08f44-89a669fd16cmr19813206d6.28.1773218735233;
        Wed, 11 Mar 2026 01:45:35 -0700 (PDT)
X-Received: by 2002:ad4:5fc8:0:b0:890:2480:f02e with SMTP id
 6a1803df08f44-89a669fd16cmr19813056d6.28.1773218734883; Wed, 11 Mar 2026
 01:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260305091433.83983-1-r4o5m6e8o@163.com>
In-Reply-To: <20260305091433.83983-1-r4o5m6e8o@163.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:15:23 +0530
X-Gm-Features: AaiRm508SQ5fG9jDDttDlIF2njGWTy75_5Us62H2rdXzog8Z7G7eT-AXURijUS4
Message-ID: <CAB19ukG+Q78+xFKcc8G_MUcQpr1c2NJiTkWu4mmyVqHLG==bGw@mail.gmail.com>
Subject: Re: [PATCH] riscv: acpi: update FADT revision check to 6.6
To: "rom.wang" <r4o5m6e8o@163.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor.dooley@microchip.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Sean Chang <seanwascoding@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yufeng Wang <wangyufeng@kylinos.cn>
X-Proofpoint-GUID: noKM1GP7qNX6bep-ZvdfN2P78kdbpCVg
X-Proofpoint-ORIG-GUID: noKM1GP7qNX6bep-ZvdfN2P78kdbpCVg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MyBTYWx0ZWRfXyloRkFTeb3CQ
 xl0rWYd6p+gcXJFo9y17/RN6VxO3dmIqi7r9OeowJ+njXdvFAbxRwekzfaeykSsb+lCjwcGR6GA
 GaTcHF9ljAsbLRkmGM9GBXBD0kBidMwHQcKZpnCuTBsmTa1+YuBnndQ4nUjbWcAIJFVL1WhoFVn
 Hoe8JEqEoLtLOEW13qqYTqS69Q1doQi1GdNcR3HdZi6Nbl47EsNibemJs9QT5x2IJO+Du4Xs9j1
 m/jmAAYxweBYY94Tp05C9tz6Mvrf8G0I57/+p3DJXLQgJ/oYjGPjXun2QQ7AtN8bGgw1FjbxSVH
 zRD+Xl0DXBj/50TeE8ypEwUsXdA4Smp+vX67zLRcC7yqxSSb34fITwqBNQDVYfo14zcq+l0w3BF
 n/AY34kRAwm4BUgedJquk0xRWx+SxyaW9oh0Jn0ynOcnmPq0AjRcF1J9XC3DeLgns8gihHbHzm9
 mp4PYaw672rE8pYimEA==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b12baf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=qEGGjCmzNasJYkfp-fsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_014537_985653_4EE8074A 
X-CRM114-Status: GOOD (  21.10  )
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

T24gVGh1LCBNYXIgNSwgMjAyNiBhdCAyOjQ14oCvUE0gcm9tLndhbmcgPHI0bzVtNmU4b0AxNjMu
Y29tPiB3cm90ZToKPgo+IEZyb206IFl1ZmVuZyBXYW5nIDx3YW5neXVmZW5nQGt5bGlub3MuY24+
Cj4KPiBBQ1BJIDYuNiBpcyByZXF1aXJlZCBmb3IgUklTQy1WIGFzIGl0IGludHJvZHVjZXMgUklT
Qy1WIHNwZWNpZmljCj4gdGFibGVzIHN1Y2ggYXMgUkhDVCAoUklTQy1WIEhhcnQgQ2FwYWJpbGl0
aWVzIFRhYmxlKSBhbmQKPiBSSU1UIChSSVNDLVYgSS9PIE1hcHBpbmcgVGFibGUpLgo+Cj4gVXBk
YXRlIHRoZSBGQURUIHJldmlzaW9uIGNoZWNrIGZyb20gNi41IHRvIDYuNiBhbmQgcmVtb3ZlCj4g
dGhlIFRPRE8gY29tbWVudCBzaW5jZSBBQ1BJIDYuNiBoYXMgYmVlbiBvZmZpY2lhbGx5IHJlbGVh
c2VkLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXVmZW5nIFdhbmcgPHdhbmd5dWZlbmdAa3lsaW5vcy5j
bj4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jIHwgMTAgKysrKystLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FjcGku
Ywo+IGluZGV4IDcxNjk4ZWUxMTYyMS4uZmY2ODFkYjlmNGYxIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2FjcGkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+IEBA
IC04NSwxMiArODUsMTIgQEAgc3RhdGljIGludCBfX2luaXQgYWNwaV9mYWR0X3Nhbml0eV9jaGVj
ayh2b2lkKQo+ICAgICAgICAgICogVGhlIHJldmlzaW9uIGluIHRoZSB0YWJsZSBoZWFkZXIgaXMg
dGhlIEZBRFQncyBNYWpvciByZXZpc2lvbi4gVGhlCj4gICAgICAgICAgKiBGQURUIGFsc28gaGFz
IGEgbWlub3IgcmV2aXNpb24sIHdoaWNoIGlzIHN0b3JlZCBpbiB0aGUgRkFEVCBpdHNlbGYuCj4g
ICAgICAgICAgKgo+IC0gICAgICAgICogVE9ETzogQ3VycmVudGx5LCB3ZSBjaGVjayBmb3IgNi41
IGFzIHRoZSBtaW5pbXVtIHZlcnNpb24gdG8gY2hlY2sKPiAtICAgICAgICAqIGZvciBIV19SRURV
Q0VEIGZsYWcuIEhvd2V2ZXIsIG9uY2UgUklTQy1WIHVwZGF0ZXMgYXJlIHJlbGVhc2VkIGluCj4g
LSAgICAgICAgKiB0aGUgQUNQSSBzcGVjLCB3ZSBuZWVkIHRvIHVwZGF0ZSB0aGlzIGNoZWNrIGZv
ciBleGFjdCBtaW5vciByZXZpc2lvbgo+ICsgICAgICAgICogQUNQSSA2LjYgaXMgcmVxdWlyZWQg
Zm9yIFJJU0MtViBhcyBpdCBpbnRyb2R1Y2VzIFJJU0MtViBzcGVjaWZpYwo+ICsgICAgICAgICog
dGFibGVzIHN1Y2ggYXMgUkhDVCAoUklTQy1WIEhhcnQgQ2FwYWJpbGl0aWVzIFRhYmxlKSBhbmQg
UklNVAo+ICsgICAgICAgICogKFJJU0MtViBJL08gTWFwcGluZyBUYWJsZSkuCj4gICAgICAgICAg
Ki8KPiAtICAgICAgIGlmICh0YWJsZS0+cmV2aXNpb24gPCA2IHx8ICh0YWJsZS0+cmV2aXNpb24g
PT0gNiAmJiBmYWR0LT5taW5vcl9yZXZpc2lvbiA8IDUpKQo+IC0gICAgICAgICAgICAgICBwcl9l
cnIoRldfQlVHICJVbnN1cHBvcnRlZCBGQURUIHJldmlzaW9uICVkLiVkLCBzaG91bGQgYmUgNi41
K1xuIiwKPiArICAgICAgIGlmICh0YWJsZS0+cmV2aXNpb24gPCA2IHx8ICh0YWJsZS0+cmV2aXNp
b24gPT0gNiAmJiBmYWR0LT5taW5vcl9yZXZpc2lvbiA8IDYpKQo+ICsgICAgICAgICAgICAgICBw
cl9lcnIoRldfQlVHICJVbnN1cHBvcnRlZCBGQURUIHJldmlzaW9uICVkLiVkLCBzaG91bGQgYmUg
Ni42K1xuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgIHRhYmxlLT5yZXZpc2lvbiwgZmFkdC0+
bWlub3JfcmV2aXNpb24pOwo+CkxHVE0uIFRoYW5rcyEKClJldmlld2VkLWJ5OiBTdW5pbCBWIEwg
PHN1bmlsdmxAb3NzLnF1YWxjb21tLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
