Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1C3CA6015
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 23:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJeyD90OmfiArYSXpFIRm3+9rvFZviIOVDMGA/pGDgw=; b=agdEr//cLUOW76
	7Q0kq8J2I+x7koo33WIuC74RYyiqbSBp2o9FO6qLiPonf1sd35QN/eYxen0YoN4XSb6WUW5iln9Z/
	2L0ND13rBm1fQ7VFwy0nXxWCkoZIawjv6ryncEh+gjg1aO9tkkaE5Od7AO3rf+l34JG3KuVOXdR/X
	DMQ+/O3TlCWYR3Wg77Cr54zIxn7HF723hLomENapgcv8aOhVK96qZvVhrvch2q+jyAIi3fZKzi7fZ
	H//OlSciLlkhloGCaEpibS9OJDm+1W0JbgHZSFM7uzTkGFRWIXzeo7plkjMngLoARSZPvh55+CRVF
	iCW8xTRR1p0t3h9yBOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xExQP-000000059r3-0r8M;
	Thu, 08 Oct 2026 23:21:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xExQL-000000059qi-2W2G
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 23:21:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0KpW3996453
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 23:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FLWS/ZRP3JLphZpvTJtWhtqU29QF4WSDgFqxaK31HQ=; b=SLjXGBrbBBAi4t92
	w9IuXEF7bg+FSKwz4LD/g1g1A2x7E/F13/y98/gjLoyTsxflKTwylO1nHy1X6SOQ
	bp8QvVXgF3cOqj6whYo7QYAhr35HouczPYyI+RJAGDD8BAQ2TJ5yauTCPj+cL5Hw
	PZAYYHHG0MowVKN8CBKx3aczXFfL8qjBmKalqhOO4bJXh1uWCv65hYRQqteWNFBt
	jT2tbuRpR9SuAIhIXLskeXWOd6YJFEn0n84KIniTIL6Bolk5CWtNggP5Ri4whc2p
	v1rozX9bszMkCgFYDmhvrba5t4u0upcnlLmIjd1dvN+hn+nvomBBKsnt3Ibw2FTQ
	XmfJAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj27d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 23:21:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8484f12cso62245545ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 16:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791501676; x=1792106476; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FLWS/ZRP3JLphZpvTJtWhtqU29QF4WSDgFqxaK31HQ=;
        b=BupE4nKNMRllL1p+3ZFye0IkXfwOc73Ar2nSgXJfWqbEhxdJqRUVmGRqNG39eS66wj
         cV4FqnOLVHCtuOeARYwi6A6lqau0H8VcxocyVc1oeu1DoG9ynQYwp6RQnMbpBtjPwzVc
         94Z3VinB4MDuGZustLeyXBpBKfd9GKFy2moQMZuqmXMMThNv3FxhYUfQgILIlSjH+VOY
         SE2El5RHHRoZVrO9RWTLu4YGWscr4gp9mi+iE9gdaWLZxJM6bmglmd9jMMcl6mP2hRv0
         tbL6zLmHxMxFdr4xveUh1N/fMcWLDj0H+BTEqq3EdR10EAEpbXwUdUm67Bi7C+3S3jVl
         oDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791501676; x=1792106476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FLWS/ZRP3JLphZpvTJtWhtqU29QF4WSDgFqxaK31HQ=;
        b=u66hcjfOOR2ePK0oP14iFoYmbi5olDqF17ouc6DaO6wZvFV8kr5h7buzS/kxU81tI8
         7zFNL72p4U2RlQnZvEBKtbdWiPaWSEDTH9FHGoy6KEiLuQw3lSsNNouUtW5tBStu9IEP
         6EGBjOYnsK2tEtAm6aTXahG08R/CXuHsPmULHeu6XsBG856Q2FmDojj8eD4Qn1TclJ5p
         oL3zp1XkQ23ZEYfFKdgm8uVFuZoRJAKWqb29nOXkz490RFfuUO1X/ZBuM4WR9cwLPtum
         t3YBY6UvNrNByAgolYV+/aAlVgsk5keUkGGTU/A06PRsubaRHcKs/evo7mjpzIWyA46j
         iQeQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1RekgjGj4aagv1n9BFKbeN423yNrxdhFTb10qxO9KEm6Hx87s7vjeuu8HaqxdkaOYvyol3IKTgsxCPA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKRdiyVTvKxf+zvtS4caDMXbL9RsB91Eu1krjxw3wjPUWQMCFPL
	lWNBfoS1BZsXYVNuOrHBsThwnEg1TmN52s7ay/1+ObjHcgrwX7koCWb7SsJJj7NqC1iXSsD119y
	tJ91RrTFG2FVqgxlzt+DacoF/GVIjUAe8E/QGj2S2LR2ckkn+WqbCOhAhOH90wdx8vSNCkA==
X-Gm-Gg: AYBFou1QYGxDxaFudxbGAH2D7Qk+9z7Ee5Cv5PL2k96G1bQA9X/LzMoFOzZxl+XjXM8
	T46j7I36ECDVAtxUDW7RnLe+uUgIdcM/34uEloUiP+3pihGaoSF9eP4te9A2OdPXu5XXyLq12Rf
	vX0Allf/Gv0KbFf3/yPBeiKWpTcUh8VRqKeFIXNVkKMFJaWl/1i2FX0k9q6PBdUvdo5jMdnqAlx
	BzcngAk2q+CvQZJsOe44iRM9RghrSg/6MLxVfznKE6C6foB5NGN4Css9o5ExX2xOwdiQANGZ/er
	DHvl6hAixY+Ulwb+CkdiQSLAjtun5cEQOZeqAh16LAulcQpl8NdJ4WJBLIJdb3F+JmXhR9ClAbz
	p5DZO0tR4fw1rx7dPjiMv0IlZFvNdTUBP
X-Received: by 2002:a17:903:1b0e:b0:2e8:21a7:dd0a with SMTP id d9443c01a7336-2e842e0b04bmr1070345ad.63.1791501676154;
        Thu, 08 Oct 2026 16:21:16 -0700 (PDT)
X-Received: by 2002:a17:903:1b0e:b0:2e8:21a7:dd0a with SMTP id d9443c01a7336-2e842e0b04bmr1069975ad.63.1791501675602;
        Thu, 08 Oct 2026 16:21:15 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9d49af2sm145399a12.2.2026.10.08.16.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 16:21:14 -0700 (PDT)
Message-ID: <2a3b8bdb-0f75-40ca-a653-3e4d45c9d358@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 10:21:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/8] tee: optee: add RPMI backend support on RISC-V
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveXJXXaRNyfq6Gxk4moOHqM-vBuptugn5bHK5x9EeeGSQA@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveXJXXaRNyfq6Gxk4moOHqM-vBuptugn5bHK5x9EeeGSQA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA5MiBTYWx0ZWRfX136zYNOsYkSj
 Vac7kthmYDOGxZti3dbCu2l6okgKyhCoRYUr2S8P3gWeKhu0noizRnCbGE7SsC7blZpK93Wxed9
 9R9iZdMDGs8S+emxzc/365+9N89jzOX5m0e/T8KlaGwj6l6NkWfYiKBjOsOeEKFS0cgIqsa39wa
 ggRsm40Z0SQyzxE0A3joH81F8pT0IHGzTCE8yDlyr+8hyEfksyCHzX79S71M2hN/qqs1Sc4it9P
 OB1qfLTGtw5DD4sjSHxIWmnFf2GvCT6kKJgma8Njubz6qbScrGxBnSf+7dg3CnZ90T91GyXd5cf
 m3XwhZdfrzVWcgj6OJH9EcJslQKtTcDweqt0XAjXw7mww/XdFmHVpb0gF59NIv+HnNkEOBgdvEa
 thf2Ltq6U3ZuZuEL8mRBlFZSZF25oYU24h3f+Ee+6h7A8nFstNiWFDai+0K3+K43b6XZVvGtl6X
 jTUskLcq5Me7+dllLVA==
X-Proofpoint-GUID: YWwMDi4M3QjjaO-_QR1yXTIuDIlDb5tJ
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac8256c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4N8_HuqegsxoWIsicYAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YWwMDi4M3QjjaO-_QR1yXTIuDIlDb5tJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA5MiBTYWx0ZWRfXyzuoUYGS35fD
 wN0iB6qNHCo1kb6VNWt2i6XXW7L93Etsu1qF3GdPOKjDRtOm81NqDSBNTKqa7ZGNdxr8cYD5vT4
 NM5n1EMI1vCy8MUX01tT8E73OOyNsrE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_162117_774550_770FDDAC 
X-CRM114-Status: GOOD (  26.69  )
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

SGkgSmVucywKCk9uIDEwLzgvMjAyNiA1OjE1IFBNLCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPiBI
aSBBbWlyLAo+IAo+IE9uIFR1ZSwgT2N0IDYsIDIwMjYgYXQgMjozOeKAr0FNIEFtaXJyZXphIFph
cnJhYmkKPiA8YW1pcnJlemEuemFycmFiaUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPj4KPj4g
VGhpcyBzZXJpZXMgYWRkcyBhbiBSUE1JIGJhY2tlbmQgdG8gdGhlIE9QLVRFRSBkcml2ZXIgZm9y
IFJJU0MtVi4KPj4gSXQgYnVpbGRzIG9uIHRoZSBzZXBhcmF0ZWx5IHBvc3RlZCBSUE1JIFRFRSB0
cmFuc3BvcnQgc2VyaWVzIFsxXSwKPj4gd2hpY2ggcHJvdmlkZXMgc2VydmljZSBkaXNjb3Zlcnks
IHN5bmNocm9ub3VzIGNhbGxzLCBtZW1vcnkgcGFyY2Vscwo+PiBhbmQgYXN5bmNocm9ub3VzIHNp
Z25hbHMuCj4+Cj4+IFRoaXMgcmV2aXNpb24gaXMgZWZmZWN0aXZlbHkgYSBmdWxsIHJld3JpdGUg
b2YgdGhlIG9yaWdpbmFsIFJGQy4KPj4gVGhlIGdlbmVyaWMgUlBNSSB0cmFuc3BvcnQgaGFzIGJl
ZW4gc2VwYXJhdGVkIGZyb20gdGhlIE9QLVRFRSBiYWNrZW5kLAo+PiBhbmQgdGhlIGJhY2tlbmQg
aGFzIGJlZW4gcmV3b3JrZWQgYXJvdW5kIHRoZSBzZXJ2aWNlIGJ1cyBhbmQgYSBuZXcKPj4gT1At
VEVFIGNvbnRyb2wgQUJJLgo+Pgo+PiBVbmxpa2UgdjEsIHRoZSBPUC1URUUgYmFja2VuZCBubyBs
b25nZXIgbWFuYWdlcyBTQkkgTVBYWSBtYWlsYm94Cj4+IGNoYW5uZWxzIG9yIGltcGxlbWVudHMg
UlBNSSBURUUgc2VydmljZS1ncm91cCBvcGVyYXRpb25zIGRpcmVjdGx5Lgo+PiBJdCBiaW5kcyB0
byB0aGUgT1AtVEVFIHNlcnZpY2UgVVVJRCBvbiB0aGUgUlBNSSBURUUgYnVzIGFuZCB1c2VzIHRo
ZQo+PiB0cmFuc3BvcnQncyBwdWJsaWMgb3BlcmF0aW9ucy4gTm8gYWRkaXRpb25hbCBPUC1URUUg
ZGV2aWNlLXRyZWUgbm9kZQo+PiBpcyByZXF1aXJlZC4KPj4KPj4gVGhlIGJhY2tlbmQgcmV1c2Vz
IHRoZSBjb21tb24gT1AtVEVFIHNlc3Npb24sIHNoYXJlZC1tZW1vcnksIGFyZ3VtZW50Cj4+IGNh
Y2hlLCBjYWxsIHF1ZXVlIGFuZCBSUEMgaW5mcmFzdHJ1Y3R1cmUuIFNoYXJlZCBtZW1vcnkgaXMg
cmVwcmVzZW50ZWQKPj4gYnkgUlBNSSBwYXJjZWwgSURzIGFuZCBub25jZXMuIFlpZWxkaW5nIGNh
bGxzIHBhc3MgY29tbWFuZCBhbmQgUlBDCj4+IGJ1ZmZlciByYW5nZXMgd2l0aGluIGEgcGFyY2Vs
IGFuZCByZXN1bWUgc3VzcGVuZGVkIGV4ZWN1dGlvbiB1c2luZwo+PiBhbiBvcGFxdWUgdG9rZW4g
cmV0dXJuZWQgYnkgT1AtVEVFLgo+Pgo+PiBUaGUgT1AtVEVFIGNvbnRyb2wgQUJJIHVzZXMgZml4
ZWQtd2lkdGggbGl0dGxlLWVuZGlhbiBtZXNzYWdlcyBjYXJyaWVkCj4+IGluIFRFRV9DQUxMIHBh
eWxvYWRzIHJhdGhlciB0aGFuIHJlcHJvZHVjaW5nIEZGLUEncyByZWdpc3Rlci1iYXNlZAo+PiBt
ZXNzYWdlIGxheW91dC4gQXN5bmNocm9ub3VzIG5vdGlmaWNhdGlvbnMgdXNlIGFuIGFsbG9jYXRl
ZCBURUUtdG8tUkVFCj4+IHNpZ25hbCBhcyBhIGJvdHRvbS1oYWxmIGRvb3JiZWxsLCB3aGlsZSBv
cmRpbmFyeSBsb2dpY2FsIG5vdGlmaWNhdGlvbnMKPj4gY29udGludWUgdGhyb3VnaCB0aGUgY29t
bW9uIFJQQyBwYXRoLgo+Pgo+PiBNYXRjaGluZyBPUC1URUUgT1Mgc3VwcG9ydCBmb3IgdGhpcyBB
QkkgaGFzIG5vdCB5ZXQgYmVlbiBpbXBsZW1lbnRlZC4KPj4gVGhpcyByZW1haW5zIGFuIFJGQyBm
b3IgcmV2aWV3IG9mIHRoZSBiYWNrZW5kIGludGVncmF0aW9uIGFuZCB0aGUKPj4gTGludXgtdG8t
T1AtVEVFIHByb3RvY29sLgo+Pgo+PiBbMV0gUlBNSSBURUUgdHJhbnNwb3J0IGRlcGVuZGVuY3k6
Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wLXRlZS8yMDI2MDkyOC1yaXNjdi1ycG1pLXRl
ZS1hYmktdjEtMC0wNDkwOGI4MWQ4ODVAb3NzLnF1YWxjb21tLmNvbS8KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQW1pcnJlemEgWmFycmFiaSA8YW1pcnJlemEuemFycmFiaUBvc3MucXVhbGNvbW0uY29t
Pgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBFZmZlY3RpdmVseSByZXdyaXRlIHRoZSBi
YWNrZW5kIGFyb3VuZCB0aGUgc2VwYXJhdGVseSBwb3N0ZWQgUlBNSQo+PiAgIFRFRSB0cmFuc3Bv
cnQgYW5kIGEgbmV3IE9QLVRFRSBjb250cm9sIEFCSS4KPj4gLSBSZW1vdmUgYmFja2VuZC1vd25l
ZCBwZXItaGFydCBtYWlsYm94IGNoYW5uZWxzIGFuZCB0aGUgT1AtVEVFLXNwZWNpZmljCj4+ICAg
ZGV2aWNlLXRyZWUgYmluZGluZy4KPj4gLSBSZXBsYWNlIHRoZSByZWdpc3Rlci1saWtlIGNvbnRy
b2wgcGF5bG9hZCB3aXRoIGZpeGVkLXdpZHRoIG1lc3NhZ2VzLAo+PiAgIGV4cGxpY2l0IGNvbW1h
bmQvUlBDIGJ1ZmZlciByYW5nZXMgYW5kIG9wYXF1ZSByZXN1bWUgdG9rZW5zLgo+PiAtIEFkZCBh
IHBhcmNlbC1yZWZlcmVuY2UgcGFyYW1ldGVyIGxheW91dCBjYXJyeWluZyB0aGUgcGFyY2VsIElE
LAo+PiAgIG5vbmNlLCBhbmQgNjQtYml0IG9mZnNldCBhbmQgc2l6ZSB3aXRob3V0IGNoYW5naW5n
IHBhcmFtZXRlciBzaXplLgo+PiAtIE1ha2UgYXJndW1lbnQtb2Zmc2V0IHN1cHBvcnQgcGFydCBv
ZiB0aGUgYmFzZWxpbmUgQUJJIGFuZCByZXRhaW4KPj4gICB0aGUgY29tbW9uIHNoYXJlZCBhcmd1
bWVudCBjYWNoZS4KPj4gLSBVc2UgYSB0cmFuc3BvcnQtYWxsb2NhdGVkIHNpZ25hbCBmb3IgYXN5
bmNocm9ub3VzIGJvdHRvbS1oYWxmCj4+ICAgbm90aWZpY2F0aW9ucy4KPj4gLSBMaW5rIHRvIHYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwOTEyLXJwbWktdGVlLXNlcnZpY2UtZ3Jw
LWRldi12MS0wLTFkMWQzNWMyYTg1OUBvc3MucXVhbGNvbW0uY29tCj4+Cj4+IC0tLQo+PiBBbWly
cmV6YSBaYXJyYWJpICg4KToKPj4gICAgICAgdGVlOiBvcHRlZTogYWxsb3cgUlBNSSB0cmFuc3Bv
cnQgYnVpbGRzIG9uIFJJU0MtVgo+PiAgICAgICB0ZWU6IG9wdGVlOiBkZWZpbmUgdGhlIFJQTUkg
Y29udHJvbCBhbmQgcGFyY2VsLXJlZmVyZW5jZSBBQkkKPj4gICAgICAgdGVlOiBvcHRlZTogYWRk
IFJQTUkgc2hhcmVkLW1lbW9yeSBhbmQgcGFyYW1ldGVyIHN1cHBvcnQKPj4gICAgICAgdGVlOiBv
cHRlZTogYWRkIFJQTUkgZHluYW1pYyBzaGFyZWQtbWVtb3J5IHBvb2wKPj4gICAgICAgdGVlOiBv
cHRlZTogYWRkIFJQTUkgUlBDIGhhbmRsaW5nCj4+ICAgICAgIHRlZTogb3B0ZWU6IGV4ZWN1dGUg
eWllbGRpbmcgUlBNSSBjYWxscwo+PiAgICAgICB0ZWU6IG9wdGVlOiBiaW5kIFJQTUkgc2Vydmlj
ZXMgYW5kIG5lZ290aWF0ZSBiYWNrZW5kIGNhcGFiaWxpdGllcwo+PiAgICAgICB0ZWU6IG9wdGVl
OiBzdXBwb3J0IFJQTUkgYXN5bmNocm9ub3VzIG5vdGlmaWNhdGlvbiBkb29yYmVsbHMKPj4KPj4g
IGRyaXZlcnMvdGVlL0tjb25maWcgICAgICAgICAgICAgICB8ICAgIDMgKy0KPj4gIGRyaXZlcnMv
dGVlL29wdGVlL0tjb25maWcgICAgICAgICB8ICAgIDMgKy0KPj4gIGRyaXZlcnMvdGVlL29wdGVl
L01ha2VmaWxlICAgICAgICB8ICAgIDEgKwo+PiAgZHJpdmVycy90ZWUvb3B0ZWUvY2FsbC5jICAg
ICAgICAgIHwgICAgMiArCj4+ICBkcml2ZXJzL3RlZS9vcHRlZS9jb3JlLmMgICAgICAgICAgfCAg
IDEwICstCj4+ICBkcml2ZXJzL3RlZS9vcHRlZS9vcHRlZV9tc2cuaCAgICAgfCAgIDM4ICstCj4+
ICBkcml2ZXJzL3RlZS9vcHRlZS9vcHRlZV9wcml2YXRlLmggfCAgIDU0ICstCj4+ICBkcml2ZXJz
L3RlZS9vcHRlZS9vcHRlZV9ycG1pLmggICAgfCAgMjM0ICsrKysrKysrCj4+ICBkcml2ZXJzL3Rl
ZS9vcHRlZS9ycG1pX2FiaS5jICAgICAgfCAxMDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4gIDkgZmlsZXMgY2hhbmdlZCwgMTM4OSBpbnNlcnRpb25zKCspLCAxNSBk
ZWxldGlvbnMoLSkKPiAKPiBUaGUgcnBtaSBjaGFuZ2VzIGluIHRoZSBvcHRlZSBkcml2ZXIgaGFy
bW9uaXplIHF1aXRlIHdlbGwgd2l0aCB0aGUKPiByZXN0IG9mIHRoZSBkcml2ZXIsIGJ1dCB0aGVy
ZSBhcmUgdHdvIHRoaW5ncyBJJ2QgbGlrZSBmaXhlZDoKPiAtIGF2b2lkIDxsaW51eC9jbGVhbnVw
Lmg+IG1hY3Jvcy4gVGhleSBhcmUgZGlzdHJhY3RpbmcuCj4gLSB1c2UgcmMgZm9yIHRoZSB0cml2
aWFsIGludCBFUlJOTyB2YWx1ZXMuCj4gCgpJJ2xsIG1ha2UgdGhlc2UgY2hhbmdlcy4KCj4gSSB3
b3VsZCBiZSBncmVhdCB3aXRoIGEgUUVNVS1iYXNlZCBlbmQtdG8tZW5kIHByb3RvdHlwZSB0byBk
ZW1vbnN0cmF0ZQo+IHRoYXQgdGhlIEFCSSB3b3Jrcy4KPiAKClRoZSBPUC1URUUgc2lkZSBpbXBs
ZW1lbnRhdGlvbiBpcyBuZWFybHkgY29tcGxldGUuIEknbGwgaW5jb3Jwb3JhdGUgeW91cgpjb21t
ZW50cyBoZXJlIGFuZCB1cGRhdGUgdGhlIE9QLVRFRSBjb2RlIGFjY29yZGluZ2x5LiBJIGhhdmVu
J3Qgc3RhcnRlZAp0aGUgT3BlblNCSSBjaGFuZ2VzIHlldC4gR2V0dGluZyBhIFFFTVUtYmFzZWQg
ZW5kLXRvLWVuZCBwcm90b3R5cGUgd29ya2luZwppcyBteSBmaXJzdCBwcmlvcml0eSBiZWZvcmUg
bW92aW5nIHRoZSBzZXJpZXMgb3V0IG9mIFJGQy4KCkFwb2xvZ2llcyBmb3IgdGhlIG9idmlvdXMg
b3ZlcnNpZ2h0cyBhbmQgYnVncyBpbiB0aGlzIHZlcnNpb24uIFNvIGZhciwKSSd2ZSBvbmx5IGNv
bXBpbGUtdGVzdGVkIHRoZSBjb2RlOyBpdCBzdGlsbCBuZWVkcyBlbmQtdG8tZW5kIHZhbGlkYXRp
b24uCgo+IE1vcmUgY29tbWVudHMgdG8gY29tZSBpbiB0aGUgaW5kaXZpZHVhbCBwYXRjaGVzLgoK
VGhhbmtzLCBKZW5zLCBmb3IgdGhlIGVhcmx5IGNvbW1lbnRzIGFuZCBmZWVkYmFjay4gVGhleSBh
cmUgdmVyeSBoZWxwZnVsCmluIHNoYXBpbmcgdGhlIGZpbmFsIGNvZGUgYW5kIGd1aWRpbmcgdGhl
IGRpcmVjdGlvbiBvZiB0aGUgaW1wbGVtZW50YXRpb24uCgpCZXN0IHJlZ2FyZHMsCkFtaXIKCj4g
Cj4gQ2hlZXJzLAo+IEplbnMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
