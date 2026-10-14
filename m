Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9069ACC6B20
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 04:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pE4cExIIlUmt6eWSLcAFEqr+SV28RHeszCLyykozoo=; b=HZaywyiCeqPjef
	L3Ocb2hfNMFdG/PuNl8b7h/X9LbCZ/9o5o94/luoCHjlu68kNM/EMeyXghafNszpvmkYCnkYHK2+n
	hhvWKT3FgmfIeB+8/9qNA/ndSo6BlPLNntd2BKYHNmCgw2fx2EiddhjB2fy0MpKpm8NENdCQKAzEU
	0kqcPmmrMU90fV3uZXL5p3bMvK3jRLBcZlbHWlsJEXFaps8IWT+l8jlOdDvwrPasS+lvOHg8jkMhy
	U7pbMmtRwS4OqM7/KsUkAXoG04f4pg1rBPm7EAei27EH+ef8Nk7Bml+/99bH9ikG9imIehCKuVKdz
	DcwFb2TQcA4ZmshW+0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqM5-0000000EUHx-3cgQ;
	Wed, 14 Oct 2026 04:12:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqM3-0000000EUHa-3scw
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 04:12:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2X59T3000880
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 04:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=0IToitMTYp/Rl/u3v1Im6m2B2/IkDFAQrOa2qxOYerA=; b=SQ
	pxAFcS+1SQ+AskTGAEMjYX4fMsFRgqxpslh90yM7fF594sep6OqAVAwInsXHsgow
	BL4dDj70qgx0yW/FdzUvYhHMO8SUBiok8zHTz6DSJBKyC0S4es+UWv/sZjUvtB1Q
	TxV5RCv2MGp+BxeFreqNTpTU7fXT2tpYrpmdEw6b7ZTBhWvN23zZqH0oOurCfQvy
	G3APDC2Bjgke2qis/y9PITSOfzrkrgKQsfmbESyB0b/xsLDCdGh6NNcuY6CZemZl
	CrTd8bOlb+4yZjuzD+VH5KQ6O+MpmOgd1goEeBssdRzvh3c8oFP+RtOb4dtVAjRx
	RRaASqepXNhztxsusPNw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbet3nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 04:12:38 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0ab72a6e8so30273517b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 21:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791951157; cv=none;
        d=google.com; s=arc-20260327;
        b=NA3S6JAF5gtNHlXGUMk3jEA3Gvn+GHBrusBY2IX6+e2F3kuuhv17Brx8ds4OwztUn9
         dv9J3vMDkYgc2aqfjpXJMcDygXqPjsH3IGIt/ysfjAUpP1DfupbyuowOrzr5Z/gKTMb8
         2lMZXH1hq0I9a7W2N/pLU8771jNnvQZB0OQdweVxPE+XU+3Kdd6C1UGs+6vz3MahaSXz
         Yn5gaGp4Hvza+m3qPxe8cv6vuZFk9OcMYezrBtUHS0XMhFVDEJPNekWQ/LcyQdm4ZkpH
         SZ9RP7bXCa2sY5GJuHTR64nhNJ8X+T4twvYB9M2z+t4mU6Y3vrrJjDMy/zKFAUnCi+Zw
         Mcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=0IToitMTYp/Rl/u3v1Im6m2B2/IkDFAQrOa2qxOYerA=;
        fh=Dju6qO6VKApVKwJuCAVQMrq2LyjxjEi0ZYjcR8aIZr4=;
        b=DOozhmIxTmEWR+KWQlHtXpAxCO3xERhSTF4kaCa5EtIS85kJroUG4AstOEpgN3NIYl
         DpG199UpfvGlJ9M8Kjg6MZq11XrMGJ7KmGCljyxgci5/z/I/gkd2/t72NTrVMKilUsI8
         XopzlXoc1CrH2ldmP5tvjKcf4sV77DK7yCNIC4eqs+jhNJRd+JBqLkK5/PU1luCvBhPR
         IBbOnzo96/38xJmDcouQxvI1Dy/1GzHyPGHOEsksznVjfjvA21OWhWFTk6Di/uXpQ8mk
         BD0UiEVoYF+M1T4wuzMP4UjTqd9Z9tTaK4lnGjSIEsSjIsiaO432c/5j6wEn3U/G/ZSc
         fBmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791951157; x=1792555957; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0IToitMTYp/Rl/u3v1Im6m2B2/IkDFAQrOa2qxOYerA=;
        b=UeUKK+qfEnmtrskptIjrh5PZ7xDsv7/tsCvhraBWm6GQo6Wsd4nqV1R5P1BW4juQ7j
         mwUeo03k8eHZD8Z62OYKKtbNWxbA+/U4QVca1TzOk7/MyxMhLJsLCpFhl3nLFl+6eiqv
         +sHVfmW1lAYjxVNMoUuxWFIOF0I9q22ix5O/w60eRhUzLt/ZPlKiocUNQTqXcs7ZBNES
         blEJn+kHIHHurREW/H/6lbUPlw/15PPAi5Fo5ChzKu+L+PoaYI4MfUGhEZ3/oOGPJjTd
         tmk1Kkce9gX3QqHG2fWi0wdpES5MlDpxRG9WF0+FwqhKoxYDpgMptQyDrLpYDPPzUeH5
         l3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791951157; x=1792555957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IToitMTYp/Rl/u3v1Im6m2B2/IkDFAQrOa2qxOYerA=;
        b=ZKsDVTDUESUqFI7kyWzOn+D12cQi4NqY39i1iMYn8oeliyhVGhMoKMKVqKKmN1ldcK
         hHC3r67O2lQpYIiHMVHcXzKTqb55N4Da1bG2gG5PZExWZpN6w/k2u7tLaFZbqkne6H4c
         0/UcGH0u8M0LzqrocTtaoCAnzIgL+PQs2R1RXAnOBKbv/rRVQ7xSgf7LtinuF8NoWORQ
         yXYPNPq+BAShko+pJodVyC7KGrlUSFTzt5bAB1BgCjkHeFuvkxMbKI7B6nqsnt23tBCJ
         Pu6URbFLtQllQS6r9Ztm5atf/u09kWQcUZJXEbfESMTE/j2aDT0HjL8+8lQF16L/3Q6K
         6KQg==
X-Forwarded-Encrypted: i=1; AKwUvBzexJ689H2INkvYmvrX4y9bfMtQ+CB9mBQ6Ybt4jOV5dAHusjrOavZ6on35geq14zpNkeqzTuVDlZXiyw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKEpSWipnMQb9HcDluT+9l90rpdglHoQrEa1YNnc70i26WVgWrF
	KOhSAv8ItVfgc4xoo2By4eZ1AqI0DMaL/5rhHaCnNKgJ9UH6fcsc58RmEqDxNp9w7tK4B2xdw4c
	xboc/XRi51moF1MlpFc5aePumhUtLR6sOqSOAUtX7Y25siVp81/ihwTY31mDety8uxgvIxPWgCl
	Qeb0SZ1noUUYImHoeMyYTNxjhK4agv9h3Pb+v4R/AobX0HrQ==
X-Gm-Gg: AYBFou2+ibsc3Iw24sWjI9eA8sM9eHf7uRPcLFA8hSo1bRLd24hdc5ouQGhqIsdFX5d
	sqpqc3x3hSdsVnt3nonhGnC0aeuE4fC+Wh0Af0RXeSiSNLlaG9yaur2kpEYZ/WM3qWMHGBbOKeP
	22erG3mojI7BECOLRo2tdarGBuqL95hy/Fc6Y3CKr+iZo5g8kYX9oXYyvjNts=
X-Received: by 2002:a05:690e:128c:b0:679:8835:a554 with SMTP id 956f58d0204a3-6798835b6f3mr595929d50.94.1791951157322;
        Tue, 13 Oct 2026 21:12:37 -0700 (PDT)
X-Received: by 2002:a05:690e:128c:b0:679:8835:a554 with SMTP id
 956f58d0204a3-6798835b6f3mr595910d50.94.1791951156684; Tue, 13 Oct 2026
 21:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260903140031.3684-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260903140031.3684-1-fangyu.yu@linux.alibaba.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:42:25 +0530
X-Gm-Features: AclHuK86voQc4FUtiCdkEZEAZb2HJ7wq0GZX-kU_HOfP197uYVxA3KPb_kIuB4o
Message-ID: <CAB19ukELrF5wf3vKaPhoCLWmzGDExv1mZQAyEs8K6uq-zxqsKQ@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: RIMT: Enable PCI ACS for root complexes mapped
 to an IOMMU
To: fangyu.yu@linux.alibaba.com
Cc: rafael@kernel.org, lenb@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        linux-acpi@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Proofpoint-ORIG-GUID: IEr9Ux1wTxWOXUYwK8eg0PkIRXw3qOCX
X-Proofpoint-GUID: IEr9Ux1wTxWOXUYwK8eg0PkIRXw3qOCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxNiBTYWx0ZWRfXwmR/NQXCGcfF
 Gs5kd55k82GLGzCk0LVGa6n62ZkyCMx2vSi/MSsqaV616Bju2rliN+z/DMM8rDqq/TAb3hC0l/v
 EXUvwdoLdvmwSljBvz+B8pcXQlw5P5roawr7jsgHoiLF42X8SAy0LJN6GmTJ0q/DGPjpjPFjp7q
 SZw01TZhyi3Fng4Y32lmMRIsg07l32UjAdnhwifNbB2nPpCOhHFheZYZA01AX56oGrlRZ2wM3w8
 YR2lEcocbHabCEWDMq3BvPGLgPHws7T1izBINF8mzNwwRGMNs7LIlsZHXpbylwglW9BtmUgf1qp
 WpNrkI+BBup8puWcNan1tWSpnoJREymgS0aeSN3TnQkg+JnMYGlxRI2k/RVO1kSRRFPePsVosoG
 lqdVm6L2gkHgX51kc6V44ncWKn0b3M4bSzUuUblafQP9HqdkjsRiIojnAPW3PqB6rF+ODPMacnI
 Fn2W4g0EF34abWZWORg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxNiBTYWx0ZWRfX4supAlLiM2ba
 Q25S0vHzUgOGv1LvGbPF6QZuKVIRm1byAAzALoF6r4KO4j27Nyjq0HTTJXvEaWoS/qj69q4gkpb
 u7Dc6VjdQhI5SqbCeikyud2R6QnTCU8=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf0136 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=N72Xn8VYRMkAawgvMsQA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_211239_967570_3B13D358 
X-CRM114-Status: GOOD (  16.41  )
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

SGkgUmFmYWVsLAoKT24gVGh1LCBTZXAgMywgMjAyNiBhdCA3OjMw4oCvUE0gPGZhbmd5dS55dUBs
aW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBs
aW51eC5hbGliYWJhLmNvbT4KPgo+IE1pcnJvciB0aGUgQUNQSSBJT1JUIHNvbHV0aW9uIHVzZWQg
b24gYXJtNjQgKHNlZSBpb3J0X2VuYWJsZV9hY3MoKSkKPiBieSBzY2FubmluZyB0aGUgUklNVCB0
YWJsZSBmb3IgUENJZSByb290IGNvbXBsZXggbm9kZXMgZHVyaW5nCj4gcmlzY3ZfYWNwaV9yaW10
X2luaXQoKSwgd2hpY2ggcnVucyBiZWZvcmUgQUNQSSBQQ0kgZW51bWVyYXRpb24uIElmIGEKPiBy
b290IGNvbXBsZXggbm9kZSdzIElEIG1hcHBpbmcgcG9pbnRzIGF0IGFuIElPTU1VIG5vZGUsIGNh
bGwKPiBwY2lfcmVxdWVzdF9hY3MoKSBpbW1lZGlhdGVseSwgc28gcGNpX2Fjc19lbmFibGUgaXMg
YWxyZWFkeSBzZXQgYnkKPiB0aGUgdGltZSBhbnkgUENJIGRldmljZSBpcyBzY2FubmVkIGFuZCBw
Y2lfZW5hYmxlX2FjcygpIHJ1bnMuCj4KPiBPbmx5IG9uZSBjYWxsIHRvIHBjaV9yZXF1ZXN0X2Fj
cygpIGlzIG5lZWRlZCByZWdhcmRsZXNzIG9mIGhvdyBtYW55Cj4gcm9vdCBjb21wbGV4ZXMgYXJl
IGZvdW5kLCBzbyB0cmFjayB0aGF0IHdpdGggYSBzdGF0aWMgYWNzX2VuYWJsZWQKPiBmbGFnLCBz
YW1lIGFzIGlvcnRfZW5hYmxlX2FjcygpIGRvZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUg
WXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPiBSZXZpZXdlZC1ieTogU3VuaWwgViBM
IDxzdW5pbHZsQG9zcy5xdWFsY29tbS5jb20+Cj4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyIChTdWdn
ZXN0ZWQgYnkgU3VuaWwpOgo+ICAgICAtIENoZWNrIHRoZSBSSU1UIG5vZGUgdHlwZSBpbiByaXNj
dl9hY3BpX3JpbXRfaW5pdCgpIGFuZCBpbnZva2UKPiAgICAgICByaW10X2VuYWJsZV9hY3MoKSBv
bmx5IGZvciBQQ0llIHJvb3QtY29tcGxleCBub2Rlcy4KPiAtLS0KPiAgZHJpdmVycy9hY3BpL3Jp
c2N2L3JpbXQuYyB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQo+CkNvdWxkIHlvdSBwbGVhc2UgdGFr
ZSB0aGlzIHBhdGNoIHZpYSBBQ1BJIHRyZWU/CgpUaGFua3MsClN1bmlsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
