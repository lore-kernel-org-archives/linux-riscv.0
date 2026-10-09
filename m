Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14033CA6019
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 13:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kH7IlxA/0ZgEo3LPDgJYxowH3aCKmIhQrEAvS47bi+8=; b=F1Z0A17b8p2PFj
	yufC1NfVPfkuOU+XDAo+Dp3iP1ZBiChXLkuwEPuBHjVL+JZ3DcG51FaaiNJ1oMjhhd1QlWVj7fzMT
	JUT5OdHzrm7LBkJgCXO/u12miZPx6JbtY5ARFKZeBKlNn/lTjpye2AKBeByDeMTV4Kyz6y7mDMNsF
	xRh/zmVi+GRtGpZsFQq0rPzvMuGrwOZShRkTgLRZFaTgOEWpjYAtyr7vog19iYZwJpQRH5AOWn/0u
	VOA2/7Ct/TPUsIqX2kyzSRIxpkrJ+nOYaXiKeN4DvYZWZ41Td6jIkIXa8VO06kdQMjs9clygQG+2T
	AeoCQiYei/xznK4YIgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFB3V-00000006Q1m-0lrH;
	Fri, 09 Oct 2026 13:54:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFB3S-00000006Q1E-0OIY
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 13:54:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Dkqlb1374820
	for <linux-riscv@lists.infradead.org>; Fri, 9 Oct 2026 13:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvpmX/1Q3IU4m40umxn2XOTD9p41yiv+dwDT4rC7IA4=; b=KfhVLPxMrDc8IQnM
	lJMZGedco6PE8Is3R6J6SkEi3i0jX5WdJ0HpR3pYqvWdlIcFbvM7juTvpxIq+JRh
	87sdx6mj5f9ZwyzEdYyRbyaAq284RJBP9xxhv/xpqFjk0s7b8CcrW2Exkrm/c2hD
	19KmizLvsnSRIYIrW5GJiKGyuQRnKKVzCRjZaA9+xEyAZMsUGN8p7VHXnauI0TTy
	4XsvKZ4rq8Vep1rNHj/a/oF4s8iZWRsPejgnhpjuwK2E/l/C28bX/hHQ/T8dJFMh
	c6GtM0QUf0tkpdAPBDtjEx46kMB8bSJuxNKFzfQmFypfjZiXpGgXF42Z/6XWme8A
	WnEahA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f281rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 13:54:32 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8ae99a44bdbso73152857b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 06:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791554072; cv=none;
        d=google.com; s=arc-20260327;
        b=GzyADXe9tB/osix4/kXf5Zxg0OBcDgVgiQqYsPmiKZviJV5IiJrMm7G2y3nTTIXUIz
         KV43Fob9Ok0LP/Kt07iK/gzWPTD7lJdMwtOdqelrl77cb4O4Pfoieo9Cz6kUQAEOY+Xo
         //7SQjcHcRLT+g7bHFFBPIM3axI95RBjBYAOkVMVoj2eEbsiqvUAKdXsNiZphqfItO+6
         4awXAi1a/HN44OdtnBSs2umN5CRj0eXcugkPZ1Rtm97r9oysW5ZEDAz8Kb9Kk1jEw4Qt
         c3GUyM8jmH6lERj5du2PY9Nt0zADi6rtIa1wNtTVIV9gN3xuwvCAejkyFJGAVKjb9wuI
         6TGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KvpmX/1Q3IU4m40umxn2XOTD9p41yiv+dwDT4rC7IA4=;
        fh=Ruw5tjlRDRIDk+Boe1qdOtm2yygGhumPmDQTBD3SQJg=;
        b=BnMPNbNEEmwxIvGTgagfyqMixG/Gz78Pl3NFxf+M8ih0hOj3Nc+f2Huk69OKmqyjAa
         Dq5i31KG2rYMiHwBjWN+KkBkqYR+5l72Z5yMX6JpSM321PJoCp7vuiSUyicTB8DN4QAE
         KEw83h1t/VnvN2U+NbM7kkNKsx0o3fqVjtYd/5L2jgdxjOjYwA/56H4epomxaxkwMWNz
         17cvgN5M0nnjsozn8PE5r+oEpJ9zKLMrGeVFMi3lnRbsu04O2PBfJ/ZeEe7ze8W84kdb
         m9x3n+IGOpUhPTM/RZYpng3G+DUeZzibcbDZ7j1i1HUOSqJyMeoL9uj9RjLhIRtA3rtT
         BbFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791554072; x=1792158872; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KvpmX/1Q3IU4m40umxn2XOTD9p41yiv+dwDT4rC7IA4=;
        b=TMn0u+9AQN6thcIXroct9tqpD8OkZOPLshJSU0Fi6tSpT8r4hyQtbunT+Y0KIxs1mt
         VF+ml/V8nhvUzjdhv+Iu3uLyWlES0onTtrUuyU4wGKfe6cqzz4wdj2Zx1XbpE6NAdi1A
         Dx5i0a93T6wMLg3b9mBchaVGeNs+FImH7appXCEmq2Ix5z2GveBirq4rSdRBZ18ZyTA/
         oSKo/2RkFsAVJutAk83y9J59swsLPvugXqKfiDCwe2Vl9RO0cHQVin2PtuVqRNNcI4mD
         LgBjCI/0jd+FRXOQIJROLIqhbF7HyesBRuQskGyNZlBUUniKluBw6A06XVORA+2tlqiY
         ezHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554072; x=1792158872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvpmX/1Q3IU4m40umxn2XOTD9p41yiv+dwDT4rC7IA4=;
        b=pDOodOVXjomYBMtnravBQS+IjrdSQvEaQM8bUC9iG3nU437KqTuVUGyEbp/XxgfXzY
         Wl74FffzE1K4oEhAtSnbkzkd84ZcHnkadzXaUr0sIuDiDEGMs+4Ny/UWtyPqO88AIHJs
         KatTxA4SaQGfnpLkbAxFEHSOEIFC0hcymtQVY5cKXBKpIpcNAPshmerjqY+iCyP/JeHS
         3kGHDdINHbgUsL2T/q1ljT8IOJ51dCS5Y8IKNoTsGLzeK1oHqTCMhUzQC4zkOicGuLmX
         eqXm843m0uvQVjeNoxwA5CsFytrSnGyUnxke50EP0fXLMzk8vKQ8Q9XJBhlZt+BsLcZf
         JzAg==
X-Forwarded-Encrypted: i=1; AKwUvByp6O39o6N5+H2nxmd8Of1o8L3LVT/cVE94Jf5SZUaBEUgvIXF/eBP4J31NG0ost99Qp4Y6JuYfg202Nw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIYEjq5RTkxKw/4ig2OgqpLrG6mIfoUIOaUIJpGb7th7c7X0aNK
	N0rAq9x7xrrWnmbfs7FKIvnU930eeXLhhg/QTPbFwtBQ8BEAsZbHjiLTJTxWBAc3kxgFs9plxvV
	URUsJEy4ESoZYmXcE6iVPFEkU04l7+MhKIXdNLjCYdj67peg+KhRdLMkDi1Ur62t+hAKIu/fgCJ
	Qjy75yWcfYchBQ8KGL7PUEZlhxpVaus8Wd1CErvLXnfDOq/A==
X-Gm-Gg: AYBFou1ooJNH6zY3KeIUVVCoBt+ME5mCDJN0WBGs/EXjwx1qOaRQR4PLcfh+Ho0Fo9Z
	O+INKi+X8QFqs8/fMAUZ5JkXFUNekcsUNe2X3Jp8YR7OfqnWL98BP0ncBEcJwGrIy/8WiXGAvz6
	+2G2lcNeeNBUzmwHtL8zE+mg3iSD1no/hXWjnOQB2iBOdsmz135VolXGM=
X-Received: by 2002:a53:d015:0:b0:677:b9d8:a475 with SMTP id 956f58d0204a3-6793633bd6emr535595d50.147.1791554071731;
        Fri, 09 Oct 2026 06:54:31 -0700 (PDT)
X-Received: by 2002:a53:d015:0:b0:677:b9d8:a475 with SMTP id
 956f58d0204a3-6793633bd6emr535575d50.147.1791554071017; Fri, 09 Oct 2026
 06:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-2-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveUB4ETEbcfCvagfj6q__jsfPmJoeT_w0xA-9NOZpGNwfQ@mail.gmail.com> <630aac65-bf8a-4334-8187-0e7eb0e25217@oss.qualcomm.com>
In-Reply-To: <630aac65-bf8a-4334-8187-0e7eb0e25217@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:54:20 +0200
X-Gm-Features: AclHuK9fYnXbSdIG_QneNDrOHxWZzqswhBgQC4kZW9p0xYrZTiG8kyqxYxfRAtY
Message-ID: <CAGgiveXzQKdLKX3W3N5PDV+t8FW6yMvDTK1rN=rn59zQ0TgC+w@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/8] tee: optee: define the RPMI control and
 parcel-reference ABI
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX9vksyjxdxcOt
 FHvKdLfmSCRD19WY0eZfVTWUNvnzy+rP1BGSiEXgToO246VkgqE1rNIQf4oRBbp4Mc/8QJ7wdVe
 aJ/d7jeT9CorzeIsG4L/sMxKUM4YIb0=
X-Authority-Analysis: v=2.4 cv=NLBAaE6g c=1 sm=1 tr=0 ts=6ac8f218 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=wjuEhBAy9pTyS6C4czwA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: Zpy0OptqUbianV87hnEvNKaQuHZnPhLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX4nBIdVCxMRYs
 dY32eHz9dqfr2TadLdMTiWOb+ZnWU+kgnZJ4+sfm9e+PsrLYZ8rwAtPxqzt2sED6Ft8ZTBfuTtS
 eGakcf8U0arVmDnaE7k+V+617xQfWhM8hAMBcKPYTJdHr8NZtrUffHpfztgJ1Tqyc8oek2v+DEA
 w8zo5yDKABSbpHJEbZM5YVSM6ZMhbLJMyBAQkJ3jgpqZOwrF+5nIQJtFrr4AP9b+gjvwNh5Munu
 5bmoVB0Q6Db74m66BGeL7s0yYF/cggkb6u/oEzKFXm3JHiRuyMHvDi8Y4RckqggbjOIAOiO1EvD
 8Dlz/YjhBh7Bo/xp4z52Qq7X3TQre02VGFF1oqv+0tEF5yq18ymp13iYeY7ZuTSDnyEf9EzZB/I
 rHU7llLpN1VrtHXOyfVozKxMYSbEUTfOKT9mSDthDEoRq1npoKyb91xwmsLN/HgQBVqhybVVhcF
 +3SId6r0k7PJvbI2MuQ==
X-Proofpoint-GUID: Zpy0OptqUbianV87hnEvNKaQuHZnPhLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_065434_269182_4BED6581 
X-CRM114-Status: GOOD (  41.48  )
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

SGkgQW1pciwKCk9uIEZyaSwgT2N0IDksIDIwMjYgYXQgMTI6MDPigK9BTSBBbWlycmV6YSBaYXJy
YWJpCjxhbWlycmV6YS56YXJyYWJpQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gSGkgSmVu
cywKPgo+IE9uIDEwLzgvMjAyNiA1OjUxIFBNLCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPiA+IEhp
IEFtaXIsCj4gPgo+ID4gT24gVHVlLCBPY3QgNiwgMjAyNiBhdCAyOjQw4oCvQU0gQW1pcnJlemEg
WmFycmFiaQo+ID4gPGFtaXJyZXphLnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4g
Pj4KPiA+PiBEZWZpbmUgdGhlIE9QLVRFRSBzZXJ2aWNlIHByb3RvY29sIGNhcnJpZWQgYnkgUlBN
SSBURUVfQ0FMTCBwYXlsb2Fkcy4KPiA+PiBBZGQgb3BlcmF0aW9ucyBmb3IgdmVyc2lvbiBhbmQg
Y2FwYWJpbGl0eSBxdWVyaWVzLCBzaGFyZWQtbWVtb3J5Cj4gPj4gdW5yZWdpc3RyYXRpb24sIGFz
eW5jaHJvbm91cyBub3RpZmljYXRpb24gZW5hYmxlbWVudCwgYW5kIHlpZWxkaW5nLWNhbGwKPiA+
PiBzdGFydCBhbmQgcmVzdW1lLiBVc2UgZml4ZWQtd2lkdGggbGl0dGxlLWVuZGlhbiBjb250cm9s
IGZpZWxkcyBhbmQgUlBNSQo+ID4+IGVycm9yIGNvZGVzIGZvciBjb250cm9sIHJlc3BvbnNlcy4K
PiA+Pgo+ID4+IEFkZCBhIHBhcmNlbCBtZW1vcnktcmVmZXJlbmNlIGxheW91dCB0byB0aGUgY29t
bW9uIG1lc3NhZ2UgcGFyYW1ldGVyCj4gPj4gdW5pb24uIElkZW50aWZ5IHNoYXJlZCBtZW1vcnkg
YnkgaXRzIHBhcmNlbCBJRCBhbmQgbm9uY2UsIHdpdGggYSA2NC1iaXQKPiA+PiBieXRlIG9mZnNl
dCBhbmQgc2l6ZSwgd2l0aG91dCBjaGFuZ2luZyB0aGUgbWVzc2FnZSBwYXJhbWV0ZXIgc2l6ZS4K
PiA+PiBFbmNvZGUgTlVMTCByZWZlcmVuY2VzIHdpdGggYSB6ZXJvIHBhcmNlbCBJRCBhbmQgbm9u
Y2UsIGxlYXZpbmcgcGFyY2VsCj4gPj4gSUQgemVybyB1c2FibGUgd2l0aCBhIG5vbnplcm8gbm9u
Y2UuCj4gPj4KPiA+PiBEb2N1bWVudCB0aGUgd2lyZSBsYXlvdXRzIGFuZCBvd25lcnNoaXAgcnVs
ZXMgZm9yIG1hdGNoaW5nIExpbnV4IGFuZAo+ID4+IE9QLVRFRSBpbXBsZW1lbnRhdGlvbnMuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbWlycmV6YSBaYXJyYWJpIDxhbWlycmV6YS56YXJyYWJp
QG9zcy5xdWFsY29tbS5jb20+Cj4gPj4gLS0tCj4gPj4gIGRyaXZlcnMvdGVlL29wdGVlL29wdGVl
X21zZy5oICB8ICAzOCArKysrKy0tCj4gPj4gIGRyaXZlcnMvdGVlL29wdGVlL29wdGVlX3JwbWku
aCB8IDIzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+ICAy
IGZpbGVzIGNoYW5nZWQsIDI2NCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4+Cj4g
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGVlL29wdGVlL29wdGVlX21zZy5oIGIvZHJpdmVycy90
ZWUvb3B0ZWUvb3B0ZWVfbXNnLmgKPiA+PiBpbmRleCA2YzMwNDNmOGRhMzMuLjAyOGY4Y2Q5NWZk
ZCAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL3RlZS9vcHRlZS9vcHRlZV9tc2cuaAo+ID4+ICsr
KyBiL2RyaXZlcnMvdGVlL29wdGVlL29wdGVlX21zZy5oCj4gPj4gQEAgLTMxLDYgKzMxLDkgQEAK
PiA+PiAgI2RlZmluZSBPUFRFRV9NU0dfQVRUUl9UWVBFX0ZNRU1fSU5QVVQgICAgICAgICBPUFRF
RV9NU0dfQVRUUl9UWVBFX1JNRU1fSU5QVVQKPiA+PiAgI2RlZmluZSBPUFRFRV9NU0dfQVRUUl9U
WVBFX0ZNRU1fT1VUUFVUICAgICAgICAgICAgICAgIE9QVEVFX01TR19BVFRSX1RZUEVfUk1FTV9P
VVRQVVQKPiA+PiAgI2RlZmluZSBPUFRFRV9NU0dfQVRUUl9UWVBFX0ZNRU1fSU5PVVQgICAgICAg
ICBPUFRFRV9NU0dfQVRUUl9UWVBFX1JNRU1fSU5PVVQKPiA+PiArI2RlZmluZSBPUFRFRV9NU0df
QVRUUl9UWVBFX1BNRU1fSU5QVVQgICAgICAgICBPUFRFRV9NU0dfQVRUUl9UWVBFX1JNRU1fSU5Q
VVQKPiA+PiArI2RlZmluZSBPUFRFRV9NU0dfQVRUUl9UWVBFX1BNRU1fT1VUUFVUICAgICAgICAg
ICAgICAgIE9QVEVFX01TR19BVFRSX1RZUEVfUk1FTV9PVVRQVVQKPiA+PiArI2RlZmluZSBPUFRF
RV9NU0dfQVRUUl9UWVBFX1BNRU1fSU5PVVQgICAgICAgICBPUFRFRV9NU0dfQVRUUl9UWVBFX1JN
RU1fSU5PVVQKPiA+PiAgI2RlZmluZSBPUFRFRV9NU0dfQVRUUl9UWVBFX1RNRU1fSU5QVVQgICAg
ICAgICAweDkKPiA+PiAgI2RlZmluZSBPUFRFRV9NU0dfQVRUUl9UWVBFX1RNRU1fT1VUUFVUICAg
ICAgICAgICAgICAgIDB4YQo+ID4+ICAjZGVmaW5lIE9QVEVFX01TR19BVFRSX1RZUEVfVE1FTV9J
Tk9VVCAgICAgICAgIDB4Ygo+ID4+IEBAIC0xNDksNiArMTUyLDIzIEBAIHN0cnVjdCBvcHRlZV9t
c2dfcGFyYW1fZm1lbSB7Cj4gPj4gICAgICAgICB1NjQgZ2xvYmFsX2lkOwo+ID4+ICB9Owo+ID4+
Cj4gPj4gKy8qKgo+ID4+ICsgKiBzdHJ1Y3Qgb3B0ZWVfbXNnX3BhcmFtX3BtZW0gLSBSUE1JIHBh
cmNlbCBtZW1vcnkgcmVmZXJlbmNlCj4gPj4gKyAqIEBvZmZzOiBmdWxsLXdpZHRoIGJ5dGUgb2Zm
c2V0IGZyb20gdGhlIHBhcmNlbCdzIGZpcnN0IGJ5dGUKPiA+PiArICogQHNpemU6IGxvZ2ljYWwg
cmVmZXJlbmNlIHNpemUsIG9yIHJlcXVpcmVkIHNpemUgZm9yIGEgc2hvcnQtYnVmZmVyIHJlc3Bv
bnNlCj4gPj4gKyAqIEBwYXJjZWxfaWQ6IGZpcm13YXJlLWFzc2lnbmVkIHBhcmNlbCBpZGVudGlm
aWVyCj4gPj4gKyAqIEBub25jZTogbm9uemVybyBSRUUgbm9uY2Ugc3VwcGxpZWQgd2hlbiBzaGFy
aW5nIHRoZSBwYXJjZWwKPiA+PiArICoKPiA+PiArICogQSB6ZXJvIHBhcmNlbCBJRCBhbmQgbm9u
Y2UgZW5jb2RlIGEgTlVMTCByZWZlcmVuY2UuIEl0cyBvZmZzZXQgbXVzdCBiZSB6ZXJvOwo+ID4+
ICsgKiBpdHMgc2l6ZSBpcyBwcmVzZXJ2ZWQuIFBhcmNlbCBJRCB6ZXJvIHJlbWFpbnMgdmFsaWQg
d2l0aCBhIG5vbnplcm8gbm9uY2UuCj4gPj4gKyAqLwo+ID4+ICtzdHJ1Y3Qgb3B0ZWVfbXNnX3Bh
cmFtX3BtZW0gewo+ID4KPiA+IFdpdGhvdXQgYW4gaW50ZXJuYWwgb2Zmc2V0IGxpa2UgaW4gc3Ry
dWN0IG9wdGVlX21zZ19wYXJhbV9mbWVtLCBhbgo+ID4gZXhwbGljaXQgcmVnaXN0ZXIgU0hNIGNh
bGwgaW50byBPUC1URUUgaXMgbmVlZGVkIGJlZm9yZSBpdCBjYW4gYmUKPiA+IHVzZWQuIFlvdSdk
IHN0aWxsIG5lZWQgdGhlIFRFRV9NRU1PUllfUEFSQ0VMX0NSRUFURSwgYnV0IHdlIGNhbiBzYXZl
Cj4gPiBvbmUgcm91bmQtdHJpcCBpbnRvIHRoZSBzZWN1cmUgd29ybGQuCj4gPgo+Cj4gVGhlIG9y
aWdpbmFsIGludGVuYXRpb24gd2FzIHRvIHVzZSBwYXJjZWwtcmVsYXRpdmUgb2Zmc2V0cywgd2l0
aCB0aGUKPiBzZWN1cmUtc2lkZSBtZW1vcnkgb2JqZWN0IGNvdmVycyB0aGUgZW50aXJlIHBhcmNl
bC4gT1AtVEVFIGNhbiByZXRyaWV2ZSBpdAo+IGxhemlseSBhbmQgYXBwbHkgdGhlIHN1cHBsaWVk
IG9mZnNldCBkaXJlY3RseSwgc28gdGhpcyBkZXNpZ24gZG9lcyBub3QgcmVxdWlyZQo+IGFuIGV4
cGxpY2l0IFNITSByZWdpc3RyYXRpb24gY2FsbCBvciBhbiBhZGRpdGlvbmFsIHJvdW5kIHRyaXAu
Cj4KPiBTaW5jZSB3ZSBhcmUgaW1wbGVtZW50aW5nIHRoZSBSUE1JIHBhcmNlbCBtZW1vcnktb2Jq
ZWN0IGNhY2hlIGluZGVwZW5kZW50bHkgb2YKPiBGRi1BJ3MgY2FjaGUgaW4gT1AtVEVFLCB0aGlz
IHNlZW1zIHNpbXBsZXI6IGl0IGF2b2lkcyBhIHNlcGFyYXRlCj4gaW5pdGlhbC1vZmZzZXQgcHJv
cGVydHksIHByZXNlcnZlcyBhIGZ1bGwtd2lkdGggb2Zmc2V0IHJlZmVyZW5jZSwgd2hpbGUKPiBr
ZWVwaW5nIE9QLVRFRSBpZ25vcmFudCBmcm9tIHRoZSBTSE0gY29uY2VwdCB3aGljaCBpcyBhIExp
bnV4IHNpZGUgY29uY2VwdC4KPgo+IFRoYXQgc2FpZCwgSSBjYW4gc2VwYXJhdGUgdGhlIG9mZnNl
dHMgdG8gbWF0Y2hpbmcgRkYtQSdzIG1lbW9yeS1vYmplY3QKPiBtb2RlbC4gQnV0IEkgYW0gbm90
IHN1cmUgd2hhdCB3ZSBhY2hpdmU/CgpJIHRoaW5rIGl0J3MgbmVlZGVkLCBidXQgSSBkb24ndCBt
aW5kIGJlaW5nIHByb3ZlbiB3cm9uZy4gOi0pCgpJSVJDLCB0aGlzIHN0ZW1zIGZyb20gVEVFX0lP
Q19TSE1fUkVHSVNURVIuIEluIGhpbmRzaWdodCwgSSByZWdyZXQKdGhhdCBvZmZzZXQuIFdlIHNo
b3VsZCBoYXZlIGtlcHQgaXQgaW4gdXNlcnNwYWNlLCBidXQgdGhhdCdzIHRvbyBsYXRlCm5vdy4K
Cj4KPiA+PiArICAgICAgIHU2NCBvZmZzOwo+ID4+ICsgICAgICAgdTY0IHNpemU7Cj4gPj4gKyAg
ICAgICB1MzIgcGFyY2VsX2lkOwo+ID4+ICsgICAgICAgdTMyIG5vbmNlOwo+ID4KPiA+IEkgd29u
ZGVyIGlmIHBhcmNlbF9pZCBhbmQgbm9uY2Ugd291bGRuJ3QgYmUgYmV0dGVyIGNvbWJpbmVkIGlu
dG8gYQo+ID4gc2luZ2xlIGZpZWxkLiBUaGV5IG5lZWQgdG8gYmUgc2VwYXJhdGUgd2hlbiBwcmVw
YXJpbmcgYXJndW1lbnRzIGZvcgo+ID4gdGhlIFRFRV9NRU1PUllfKiBjYWxscy4gRXZlcnl3aGVy
ZSBlbHNlLCBpdCdzIG9ubHkgYW4gb3BhcXVlIG1lbW9yeQo+ID4gaGFuZGxlLCBhbmQgb25lIGhh
bmRsZSBpcyBlYXNpZXIgdG8ga2VlcCB0cmFjayBvZiB0aGFuIHR3by4KPgo+IEkgdGhvdWdodCBh
Ym91dCB0aGF0IGJlZm9yZS4gVGhpcyB3b3VsZCBwdXNoIHRoZSBjb252ZXJzaW9uIHRvIHRoZQo+
IGZpcm13YXJlIGJvdW5kYXJ5LiBJIHdhcyBub3Qgc3VyZSBpZiBpdCBpcyBhY2NlcHRhYmxlLiBJ
J2xsIGRvIHRoYXQgOikuCgpTb3VuZHMgZ29vZCB0byBtZS4KCj4KPiA+Cj4gPj4gK307Cj4gPj4g
Kwo+ID4+ICAvKioKPiA+PiAgICogc3RydWN0IG9wdGVlX21zZ19wYXJhbV92YWx1ZSAtIG9wYXF1
ZSB2YWx1ZSBwYXJhbWV0ZXIKPiA+PiAgICogQGE6IGZpcnN0IG9wYXF1ZSB2YWx1ZQo+ID4+IEBA
IC0xNjYsMTggKzE4NiwxOSBAQCBzdHJ1Y3Qgb3B0ZWVfbXNnX3BhcmFtX3ZhbHVlIHsKPiA+PiAg
LyoqCj4gPj4gICAqIHN0cnVjdCBvcHRlZV9tc2dfcGFyYW0gLSBwYXJhbWV0ZXIgdXNlZCB0b2dl
dGhlciB3aXRoIHN0cnVjdCBvcHRlZV9tc2dfYXJnCj4gPj4gICAqIEBhdHRyOiAgICAgIGF0dHJp
YnV0ZXMKPiA+PiAtICogQHRtZW06ICAgICAgcGFyYW1ldGVyIGJ5IHRlbXBvcmFyeSBtZW1vcnkg
cmVmZXJlbmNlCj4gPj4gLSAqIEBybWVtOiAgICAgIHBhcmFtZXRlciBieSByZWdpc3RlcmVkIG1l
bW9yeSByZWZlcmVuY2UKPiA+PiAtICogQGZtZW06ICAgICAgcGFyYW1ldGVyIGJ5IEZGLUEgcmVn
aXN0ZXJlZCBtZW1vcnkgcmVmZXJlbmNlCj4gPj4gLSAqIEB2YWx1ZTogICAgIHBhcmFtZXRlciBi
eSBvcGFxdWUgdmFsdWUKPiA+PiAtICogQG9jdGV0czogICAgcGFyYW1ldGVyIGJ5IG9jdGV0IHN0
cmluZwo+ID4+ICsgKiBAdS50bWVtOiAgICBwYXJhbWV0ZXIgYnkgdGVtcG9yYXJ5IG1lbW9yeSBy
ZWZlcmVuY2UKPiA+PiArICogQHUucm1lbTogICAgcGFyYW1ldGVyIGJ5IHJlZ2lzdGVyZWQgbWVt
b3J5IHJlZmVyZW5jZQo+ID4+ICsgKiBAdS5mbWVtOiAgICBwYXJhbWV0ZXIgYnkgRkYtQSByZWdp
c3RlcmVkIG1lbW9yeSByZWZlcmVuY2UKPiA+PiArICogQHUucG1lbTogICAgcGFyYW1ldGVyIGJ5
IFJQTUkgcGFyY2VsIG1lbW9yeSByZWZlcmVuY2UKPiA+PiArICogQHUudmFsdWU6ICAgcGFyYW1l
dGVyIGJ5IG9wYXF1ZSB2YWx1ZQo+ID4+ICsgKiBAdS5vY3RldHM6ICBwYXJhbWV0ZXIgYnkgb2N0
ZXQgc3RyaW5nCj4gPj4gICAqIEB1OiAgICAgICAgIHVuaW9uIGhvbGRpbmcgT1AtVEVFIG1zZyBw
YXJhbWV0ZXIKPiA+PiAgICoKPiA+PiAgICogQGF0dHIgJiBPUFRFRV9NU0dfQVRUUl9UWVBFX01B
U0sgaW5kaWNhdGVzIGlmIHRtZW0sIHJtZW0gb3IgdmFsdWUgaXMgdXNlZCBpbgo+ID4+ICAgKiB0
aGUgdW5pb24uIE9QVEVFX01TR19BVFRSX1RZUEVfVkFMVUVfKiBpbmRpY2F0ZXMgdmFsdWUgb3Ig
b2N0ZXRzLAo+ID4+IC0gKiBPUFRFRV9NU0dfQVRUUl9UWVBFX1RNRU1fKiBpbmRpY2F0ZXMgQHRt
ZW0gYW5kCj4gPj4gLSAqIE9QVEVFX01TR19BVFRSX1RZUEVfUk1FTV8qIG9yIHRoZSBhbGlhcyBQ
VEVFX01TR19BVFRSX1RZUEVfRk1FTV8qIGluZGljYXRlcwo+ID4+IC0gKiBAcm1lbSBvciBAZm1l
bSBkZXBlbmRpbmcgb24gdGhlIGNvbmR1aXQuCj4gPj4gKyAqIE9QVEVFX01TR19BVFRSX1RZUEVf
VE1FTV8qIGluZGljYXRlcyBAdS50bWVtLiBPUFRFRV9NU0dfQVRUUl9UWVBFX1JNRU1fKgo+ID4+
ICsgKiBhbmQgaXRzIEZNRU0vUE1FTSBhbGlhc2VzIGluZGljYXRlIEB1LnJtZW0sIEB1LmZtZW0g
b3IgQHUucG1lbSBkZXBlbmRpbmcKPiA+PiArICogb24gdGhlIGNvbmR1aXQuCj4gPj4gICAqIE9Q
VEVFX01TR19BVFRSX1RZUEVfTk9ORSBpbmRpY2F0ZXMgdGhhdCBub25lIG9mIHRoZSBtZW1iZXJz
IGFyZSB1c2VkLgo+ID4+ICAgKi8KPiA+PiAgc3RydWN0IG9wdGVlX21zZ19wYXJhbSB7Cj4gPj4g
QEAgLTE4Niw2ICsyMDcsNyBAQCBzdHJ1Y3Qgb3B0ZWVfbXNnX3BhcmFtIHsKPiA+PiAgICAgICAg
ICAgICAgICAgc3RydWN0IG9wdGVlX21zZ19wYXJhbV90bWVtIHRtZW07Cj4gPj4gICAgICAgICAg
ICAgICAgIHN0cnVjdCBvcHRlZV9tc2dfcGFyYW1fcm1lbSBybWVtOwo+ID4+ICAgICAgICAgICAg
ICAgICBzdHJ1Y3Qgb3B0ZWVfbXNnX3BhcmFtX2ZtZW0gZm1lbTsKPiA+PiArICAgICAgICAgICAg
ICAgc3RydWN0IG9wdGVlX21zZ19wYXJhbV9wbWVtIHBtZW07Cj4gPj4gICAgICAgICAgICAgICAg
IHN0cnVjdCBvcHRlZV9tc2dfcGFyYW1fdmFsdWUgdmFsdWU7Cj4gPj4gICAgICAgICAgICAgICAg
IHU4IG9jdGV0c1syNF07Cj4gPj4gICAgICAgICB9IHU7Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdGVlL29wdGVlL29wdGVlX3JwbWkuaCBiL2RyaXZlcnMvdGVlL29wdGVlL29wdGVlX3JwbWku
aAo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4yNTIy
MTZhYWQwOWIKPiA+PiAtLS0gL2Rldi9udWxsCj4gPj4gKysrIGIvZHJpdmVycy90ZWUvb3B0ZWUv
b3B0ZWVfcnBtaS5oCj4gPj4gQEAgLTAsMCArMSwyMzQgQEAKPiA+PiArLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkgKi8KPiA+PiArLyoKPiA+PiAr
ICogQ29weXJpZ2h0IChjKSBRdWFsY29tbSBUZWNobm9sb2dpZXMsIEluYy4gYW5kL29yIGl0cyBz
dWJzaWRpYXJpZXMuCj4gPj4gKyAqLwo+ID4+ICsjaWZuZGVmIE9QVEVFX1JQTUlfSAo+ID4+ICsj
ZGVmaW5lIE9QVEVFX1JQTUlfSAo+ID4+ICsKPiA+PiArI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5o
Pgo+ID4+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+PiArI2luY2x1ZGUgPGxpbnV4L3V1
aWQuaD4KPiA+PiArCj4gPj4gKy8qCj4gPj4gKyAqIE9QLVRFRSBzZXJ2aWNlIEFCSSBvdmVyIFJQ
TUkgVEVFX0NBTEwuCj4gPj4gKyAqCj4gPj4gKyAqIFJlcXVlc3RzIGFuZCByZXNwb25zZXMgYXJl
IGNhcnJpZWQgaW4gdGhlIFRFRV9DQUxMIHNlcnZpY2UgcGF5bG9hZC4KPiA+PiArICogQ29udHJv
bCBmaWVsZHMgYXJlIGxpdHRsZS1lbmRpYW4uIFJlc3BvbnNlIHN0YXR1cyBmaWVsZHMgY29udGFp
biBzaWduZWQKPiA+PiArICogUlBNSSBlcnJvciBjb2RlcywgZGlzdGluY3QgZnJvbSB0aGUgb3V0
ZXIgVEVFX0NBTEwgc3RhdHVzIGFuZCB0aGUgR1AKPiA+PiArICogY29tbWFuZCByZXN1bHQgaW4g
b3B0ZWVfbXNnX2FyZy5yZXQuCj4gPj4gKyAqLwo+ID4+ICsjZGVmaW5lIE9QVEVFX1JQTUlfU0VS
VklDRV9VVUlEIFwKPiA+PiArICAgICAgIFVVSURfSU5JVCgweDQ4NjE3OGUwLCAweGU3ZjgsIDB4
MTFlMywgXAo+ID4+ICsgICAgICAgICAgICAgICAgIDB4YmMsIDB4NWUsIDB4MDAsIDB4MDIsIDB4
YTUsIDB4ZDUsIDB4YzUsIDB4MWIpCj4gPj4gKwo+ID4+ICsjZGVmaW5lIE9QVEVFX1JQTUlfVkVS
U0lPTl9NQUpPUiAgICAgICAgICAgICAgIDEKPiA+PiArI2RlZmluZSBPUFRFRV9SUE1JX1ZFUlNJ
T05fTUlOT1IgICAgICAgICAgICAgICAwCj4gPj4gKwo+ID4+ICsvKioKPiA+PiArICogc3RydWN0
IG9wdGVlX3JwbWlfcHJvYmVfcmVxIC0gcmVxdWVzdCB3aXRob3V0IG9wZXJhdGlvbi1zcGVjaWZp
YyBhcmd1bWVudHMKPiA+PiArICogQG9wOiBHRVRfQVBJX1ZFUlNJT04sIEdFVF9PU19WRVJTSU9O
IG9yIEVYQ0hBTkdFX0NBUEFCSUxJVElFUwo+ID4+ICsgKi8KPiA+PiArc3RydWN0IG9wdGVlX3Jw
bWlfcHJvYmVfcmVxIHsKPiA+PiArICAgICAgIF9fbGUzMiBvcDsKPiA+PiArfSBfX3BhY2tlZDsK
PiA+PiArCj4gPj4gKy8qKgo+ID4+ICsgKiBzdHJ1Y3Qgb3B0ZWVfcnBtaV9zdGF0dXNfcmVzcCAt
IHJlc3BvbnNlIGNhcnJ5aW5nIG9ubHkgYW4gUlBNSSBzdGF0dXMKPiA+PiArICogQHN0YXR1czog
c2lnbmVkIFJQTUkgZXJyb3IgY29kZQo+ID4+ICsgKi8KPiA+PiArc3RydWN0IG9wdGVlX3JwbWlf
c3RhdHVzX3Jlc3Agewo+ID4+ICsgICAgICAgX19sZTMyIHN0YXR1czsKPiA+PiArfSBfX3BhY2tl
ZDsKPiA+PiArCj4gPj4gKy8qCj4gPj4gKyAqIFJldHVybiB0aGUgc2VydmljZSBBUEkgdmVyc2lv
bi4KPiA+PiArICoKPiA+PiArICogUmVxdWVzdDogIHN0cnVjdCBvcHRlZV9ycG1pX3Byb2JlX3Jl
cQo+ID4+ICsgKiBSZXNwb25zZTogc3RydWN0IG9wdGVlX3JwbWlfYXBpX3Jlc3AKPiA+PiArICov
Cj4gPj4gKyNkZWZpbmUgT1BURUVfUlBNSV9HRVRfQVBJX1ZFUlNJT04gICAgIDAKPiA+PiArCj4g
Pj4gKy8qKgo+ID4+ICsgKiBzdHJ1Y3Qgb3B0ZWVfcnBtaV9hcGlfcmVzcCAtIEdFVF9BUElfVkVS
U0lPTiByZXNwb25zZQo+ID4+ICsgKiBAc3RhdHVzOiBzaWduZWQgUlBNSSBlcnJvciBjb2RlCj4g
Pj4gKyAqIEBtYWpvcjogaW5jb21wYXRpYmxlIHByb3RvY29sIHJldmlzaW9uCj4gPj4gKyAqIEBt
aW5vcjogY29tcGF0aWJsZSBwcm90b2NvbCByZXZpc2lvbgo+ID4+ICsgKi8KPiA+PiArc3RydWN0
IG9wdGVlX3JwbWlfYXBpX3Jlc3Agewo+ID4+ICsgICAgICAgX19sZTMyIHN0YXR1czsKPiA+PiAr
ICAgICAgIF9fbGUzMiBtYWpvcjsKPiA+PiArICAgICAgIF9fbGUzMiBtaW5vcjsKPiA+PiArfSBf
X3BhY2tlZDsKPiA+Cj4gPiBXaHkgZG8gdGhlc2UgY29tbXVuaWNhdGlvbiBzdHJ1Y3RzIGhhdmUg
dG8gYmUgcGFja2VkPyBXaXRoIGNhcmVmdWwKPiA+IGRlc2lnbiBvZiB0aGUgbGF5b3V0LCBwYWRk
aW5nLCBhbGlnbm1lbnQsIGV0YywgaXQgc2hvdWxkbid0IGJlIGFuCj4gPiBpc3N1ZS4KPgo+IEFn
cmVlZC4gVGhlIHN0cnVjdHVyZXMgYWxyZWFkeSBoYXZlIG5hdHVyYWxseSBhbGlnbmVkIGZpZWxk
cyBhbmQKPiBleHBsaWNpdCByZXNlcnZlZCBmaWVsZHMgd2hlcmUgbmVlZGVkLCBzbyBgX19wYWNr
ZWRgIGlzIHVubmVjZXNzYXJ5IGZvcgo+IHRoZWlyIGN1cnJlbnQgbGF5b3V0cy4gSSdsbCByZW1v
dmUgaXQgYW5kIGtlZXAgdGhlIHdpcmUgbGF5b3V0IGV4cGxpY2l0bHkKPiBkZWZpbmVkLCByZXRh
aW5pbmcgdW5hbGlnbmVkIGFjY2VzcyBoZWxwZXJzIHdoZXJlIHRyYW5zcG9ydC1idWZmZXIgYWxp
Z25tZW50Cj4gaXMgbm90IGd1YXJhbnRlZWQuCgpHb29kLgoKQ2hlZXJzLApKZW5zCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
