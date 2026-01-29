Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B0ED73E8C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 21:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKi1tDo7eF7ewM8BWydsdGHEZZwl9kAFZGCsBYv28/g=; b=G4OagMoHAkVYEq
	wrMtjm6+USdb9MEMgmYk7wLTyu8lkCd/QdG7vv7XM+ZLaEltYCKg6Dy65UWia7aUwmzUriSH2yG4i
	Z/GK6bPwmhbpw9GLP6bDyfUv2qF4jf+0fesjnsdWeVvuNa8GgWJPpP16ypZwxVP/FNJ4It969YrbO
	VcLkdfrVnk3N3XW7j+jAfl+hHEHIR4TzWKcHI8R3fCa5k+jjrZTeeNQGWjGzu6taFnCuJEtKJpcjG
	7bGZrt9LEkTflaqz2fDFR7EHZnwKIGe+aNWbKqNBA92gXtcb9rxtI09OM+RemUV5rU1dmHXCUQRQ6
	J99kSoW4fR+Ns1glURtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZQg-00000000eoH-1zLO;
	Thu, 29 Jan 2026 21:19:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYZl-00000000bvg-0rHF
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 20:25:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60THeUv43674038
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 20:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIyWfuFKG9M3pO5hQmbVZSaW8RBimd7V3pBdTPjwJ6A=; b=E8Pv08Ca/oUQS9hB
	ZCNVdyUPaPmHAb0tMd7umdEzkgtxTGSdyG1uqAi43M6r2rSBv/lE44S0NvIsO7mG
	ht4+V1T+H/jRPH5MqvDVwwFkGaOQVpNkNHxuLukDN6ZsJ8bys/HeO0Jd8pkefF7I
	XwCMLPB8VHsjr5MQg1QSYDdb8IGe08ZHn2kMq402lNbe+MiVsjM244MMOqCY6uZc
	S0cpcWEsw0L3xJq7fGO2PoCFkExVUb5oP2J4cMkd5Xa0GOQuhvEEaUy3t/7n3b6C
	dsKPWTBc8HOSEm4By3h5FB25ZvI8zcoTLiZufLbAStS6YiK/ohLGtUgqicyQZ/L+
	/T4x1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05q7j107-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 20:25:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a87029b6so407127685a.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 12:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769718311; x=1770323111; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIyWfuFKG9M3pO5hQmbVZSaW8RBimd7V3pBdTPjwJ6A=;
        b=NnnzZEIfTSOLWvBNjDlC4oHfBEQFBGlIFtd4x370ik951FdGb9eBv1k0jFoggqxnBe
         t+TIv05bssg5q6A94i/S+GSz+57oPEByjmkhoNn4kteagVC1yjrzWqTNEp10UbyDlJt5
         r8+NdLkhmXKaMdslp4+wXbBZyltOBMiCoEeyNmw/8zuNfiBV9OOKnnDF0lzGzMusdkuU
         /UvJwb4yx5i+gpjvz7T7VKVpwNB4pOONnKeSVgc8td5JrmSZ2Sq0RwsjIsqjaku9KdXt
         rt8bweykegoSgSToS0c/wZ52IASTvkVDeaMKYxoQe/XfYGfeMv8I99PKVtsOT6zM7U/z
         2niQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769718311; x=1770323111;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TIyWfuFKG9M3pO5hQmbVZSaW8RBimd7V3pBdTPjwJ6A=;
        b=TfaFVzJcdJg/FdAUW77KwjfvfxguZEwZH484PscznVs4SOvi51z8tWZHhUulTjwqwt
         lhovqYKR7OPCBJTRjDYN53R/8JYHY7ep3HQ7WWlk8Hin8jgsBWVNEIJReZTBwUmxE347
         aoBfSnAIq36rqgHb5H0XpEP8wLAWFeDFzp9ZQmm1O6s/l/GQnZiDF4GCLInS/M/VWRhR
         sTZf/z3OZqoywEQjmCEqloyv8JegAxzp/7Mf7rRkSQ8E7XslIVWXT5b78YjApNrJeQ8h
         bujZbIZyRbTsx3xjXxfVHuc0s0TjXAsk4CRfX80O7KOTdkBxwNvoDe5R93rRiTbMcAJ/
         TMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHr2AOhDe5D/2OQujUE+M9mnHKqnMxF0fWvhgdyzRcT02WhCP3ibEhIEdzmGSeSN5jHf8z6x6Il6ej+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOl2bnjajMe3ZVDbu1A+4Ua5vydvU4M/oHYwP4/iwZZJd+b2h8
	sqIKNbRbI+EU2y9QHBAy0/xwSc5BPxcR26JVWqdVWTj7TPqRGjig3azZQCQMOQdJxSpt/4lj5wa
	fjdMEGZ9v1aTp4TLvNNxy53SfocLPBtcuA/ntAWP+mwV3GivOr0chX+DNg4N47N1k26Y1l3c=
X-Gm-Gg: AZuq6aLi1oPQF2/cykNZauQMmXWrn5JPRR/pWPvMay7hWPkaZ7piB67n76WeOZyFR02
	e4OEdqYD4Y77O5OqdnzqY7yn1MU0q8PNUCMALpDk/o75cnd8sVHyZi0foRTD5Pcqccl5AIJYNXH
	d8RFgqrQqvPnV8LmDf4WAYKCXw5Ao7Qa9Ay7RvvL1JXW1MxpDQbjdS6wh1GJ/KAr2yM58zXY1Mf
	OTzZlr8TAOTocgsT0JLGfuNLpc4i9ePZ+miNMYdEzOReJt9bMibtLtOsr7JcsikcpnGNn30/DgM
	N7+3If96OaCn+I3K72n5oycHFA+dqQQujG2qw/KXteXlALrf87bH9CpTZdAsmPfI3tbJ/rqPAMu
	pcV3c849duyQHvyyJ540kgx53ZuzNisp5fumD5/E6IocX2Htz
X-Received: by 2002:a05:620a:29d2:b0:8c5:36be:41fe with SMTP id af79cd13be357-8c9eb32be89mr118654285a.60.1769718311182;
        Thu, 29 Jan 2026 12:25:11 -0800 (PST)
X-Received: by 2002:a05:620a:29d2:b0:8c5:36be:41fe with SMTP id af79cd13be357-8c9eb32be89mr118650785a.60.1769718310701;
        Thu, 29 Jan 2026 12:25:10 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3c6sm150902865e9.10.2026.01.29.12.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 12:25:10 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 29 Jan 2026 20:25:08 +0000
Message-Id: <DG1CS7KB3C6N.10FWH79J7UZHB@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: [SUGGESTION] KVM: RISC-V: detect gstage mode hierarchy
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pbonzini@redhat.com>,
        <corbet@lwn.net>, <anup@brainfault.org>, <atish.patra@linux.dev>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>
To: <fangyu.yu@linux.alibaba.com>
References: <20260125150450.27068-1-fangyu.yu@linux.alibaba.com>
 <20260125150450.27068-2-fangyu.yu@linux.alibaba.com>
 <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
In-Reply-To: <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
X-Proofpoint-GUID: G21SNsJKcXl5eYRjdV9UnEGZs62NeZRk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE0NyBTYWx0ZWRfXzUr4P3u897rW
 fapY04fgFWdHEc+dZwCO3wrjGjejIM5+SUsC1ks5NLFMT2GjFpZIfHKY2DVZP6KmhAiNz+Qrg9I
 2Rtnqm1FZvyrJ/ZWA/1ZVxqvIzMXgeDlIcE4NsFORp6ROsV/R93RyCwYwWOXoGtle+jezL3gFuK
 GERChGmMCywQtkI1GX2f7L1uaxbZZwx4MJQfPV1eBK2FmmZDZu3GvMp8henPw2imqQtyBcHF+4f
 aSITaDbUi9plc1GfWbT41bptyurVMRz1QtM7sIOLjwehslPwJVmoX98+U88WSZ3Tf+sGS8+OntN
 ltRb45IHxNg4NYznykr8Z8M9lA7puEQjgbC2Xgk19bRIrkgSvhiUMRQUtCZ9/NyFXM4nL7veATX
 BRckH1LTRh1EuiybYqq7YeTJPjfM8/N2wZvGzq3hyfU+Eb47nU60VIALX9DXKoJOWEoFMQ0dnK+
 ecDJgvUjb2Utd5fZLAw==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=697bc228 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=B30jFbksMaAZlFPmlSQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: G21SNsJKcXl5eYRjdV9UnEGZs62NeZRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290147
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_122513_266340_D9BD22AF 
X-CRM114-Status: GOOD (  16.47  )
X-Mailman-Approved-At: Thu, 29 Jan 2026 13:19:52 -0800
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

MjAyNi0wMS0yOVQxNToyNzozNSswMDowMCwgUmFkaW0gS3LEjW3DocWZIDxyYWRpbS5rcmNtYXJA
b3NzLnF1YWxjb21tLmNvbT46Cj4gKEknbGwgcmVwbHkgd2l0aCBhIHBhdGNoIGxhdGVyLikKClNv
bWV0aGluZyBsaWtlIHRoaXMgd291bGQgYXZvaWQgYSBiaXQgb2YgdGVjaG5pY2FsIGRlYnQuClRo
ZSBzb2x1dGlvbiBjb3VsZCBiZSBldmVuIG1vcmUgZ2VuZXJpYyBieSByZXR1cm5pbmcgYSBiaXRt
YXAgb2YKc3VwcG9ydGVkIG1vZGVzLCBidXQgdGhhdCB3b3VsZCBiZSBsYXJnZXIgcmVmYWN0b3Jp
bmcuLi4KCkZlZWwgZnJlZSB0byB1c2UgaXQgaW4gdGhlIHNlcmllcywgYnV0IGJld2FyZTogb25s
eSBjb21waWxlLXRlc3RlZC4KSXQncyBsYXRlIGFuZCBob3BlIGl0IGF0IGxlYXN0IGJvb3RzLiA6
KQoKVGhhbmtzLgotLS04PC0tLQpSSVNDLVYgSVNBIGRvZXMgbm90IHJlcXVpcmUgYSBoaWVyYXJj
aHkgb2Ygc3RhbmRhcmQgaGdhdHAgbW9kZSAoaS5lLgo1N3g0IGRvZXMgbm90IGRlcGVuZCBvbiA0
OHg0IG9uciAzOXg0KSwgeWV0IGZ1dHVyZSBwYXRjaGVzIHdhbnQgdG8KYXNzdW1lIHRoYXQgdGhl
IGhpZXJhcmNoeSBleGlzdHMsIGZvciBzaW1wbGljaXR5LgoKT25seSBhY2NlcHQgYSBoZ2F0cCBt
b2RlIGlmIGFsbCBuYXJyb3dlciBtb2RlcyBhcmUgc3VwcG9ydGVkIGFzIHdlbGwuCgpBbGwgc2Vu
c2libGUgUklTQy1WIGltcGxlbWVudGF0aW9ucyBzaG91bGQgaGF2ZSB0aGUgaGllcmFyY2h5LCBz
aW5jZQppdCdzIHZlcnkgY2hlYXAgdG8gYWRkIHRoZSBuYXJyb3dlciBtb2Rlcy4KClNpZ25lZC1v
ZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckBvc3MucXVhbGNvbW0uY29tPgotLS0KVGhl
IGh1bmsgdGhhdCByZW1vdmVzIHRoZSBkZWZhdWx0IHZhbHVlcyBhdCB0aGUgYmVnaW5uaW5nIG9m
IGdzdGFnZS5jCnNob3VsZCBoYXZlIGJlZW4gYSBzZXBhcmF0ZSBwYXRjaCwgc29ycnkuCi0tLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmggfCAgMiArLQogYXJjaC9yaXNjdi9r
dm0vZ3N0YWdlLmMgICAgICAgICAgICAgfCA2NiArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LQogYXJjaC9yaXNjdi9rdm0vbWFpbi5jICAgICAgICAgICAgICAgfCAgNiArKy0KIDMgZmlsZXMg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9nc3RhZ2UuaAppbmRleCA1OTVlMjE4MzE3M2UuLjE4ZGI0NzRjZTU4MyAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKQEAgLTY3LDYgKzY3LDYgQEAgdm9pZCBrdm1fcmlz
Y3ZfZ3N0YWdlX3VubWFwX3JhbmdlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsCiAKIHZvaWQg
a3ZtX3Jpc2N2X2dzdGFnZV93cF9yYW5nZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLCBncGFf
dCBzdGFydCwgZ3BhX3QgZW5kKTsKIAotdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0
KHZvaWQpOwordW5zaWduZWQgbG9uZyBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KHZvaWQp
OwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jIGIvYXJjaC9y
aXNjdi9rdm0vZ3N0YWdlLmMKaW5kZXggYjY3ZDYwZDcyMmMyLi42NzhiMzA0NTUzYmMgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFn
ZS5jCkBAIC0xMSwxMyArMTEsOCBAQAogI2luY2x1ZGUgPGxpbnV4L3BndGFibGUuaD4KICNpbmNs
dWRlIDxhc20va3ZtX2dzdGFnZS5oPgogCi0jaWZkZWYgQ09ORklHXzY0QklUCi11bnNpZ25lZCBs
b25nIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZSBfX3JvX2FmdGVyX2luaXQgPSBIR0FUUF9NT0RFX1NW
MzlYNDsKLXVuc2lnbmVkIGxvbmcga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzIF9fcm9fYWZ0
ZXJfaW5pdCA9IDM7Ci0jZWxzZQotdW5zaWduZWQgbG9uZyBrdm1fcmlzY3ZfZ3N0YWdlX21vZGUg
X19yb19hZnRlcl9pbml0ID0gSEdBVFBfTU9ERV9TVjMyWDQ7Ci11bnNpZ25lZCBsb25nIGt2bV9y
aXNjdl9nc3RhZ2VfcGdkX2xldmVscyBfX3JvX2FmdGVyX2luaXQgPSAyOwotI2VuZGlmCit1bnNp
Z25lZCBsb25nIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZSBfX3JvX2FmdGVyX2luaXQ7Cit1bnNpZ25l
ZCBsb25nIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVscyBfX3JvX2FmdGVyX2luaXQ7CiAKICNk
ZWZpbmUgZ3N0YWdlX3B0ZV9sZWFmKF9fcHRlcCkJXAogCShwdGVfdmFsKCooX19wdGVwKSkgJiAo
X1BBR0VfUkVBRCB8IF9QQUdFX1dSSVRFIHwgX1BBR0VfRVhFQykpCkBAIC0zMTMsNDcgKzMwOCwz
OCBAQCB2b2lkIGt2bV9yaXNjdl9nc3RhZ2Vfd3BfcmFuZ2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdz
dGFnZSwgZ3BhX3Qgc3RhcnQsIGdwYV90IGVuZAogCX0KIH0KIAotdm9pZCBfX2luaXQga3ZtX3Jp
c2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2b2lkKQorc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25n
IF9faW5pdCBfX2t2bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRlY3Qodm9pZCkKIHsKICNpZmRlZiBD
T05GSUdfNjRCSVQKLQkvKiBUcnkgU3Y1N3g0IEctc3RhZ2UgbW9kZSAqLwotCWNzcl93cml0ZShD
U1JfSEdBVFAsIEhHQVRQX01PREVfU1Y1N1g0IDw8IEhHQVRQX01PREVfU0hJRlQpOwotCWlmICgo
Y3NyX3JlYWQoQ1NSX0hHQVRQKSA+PiBIR0FUUF9NT0RFX1NISUZUKSA9PSBIR0FUUF9NT0RFX1NW
NTdYNCkgewotCQlrdm1fcmlzY3ZfZ3N0YWdlX21vZGUgPSBIR0FUUF9NT0RFX1NWNTdYNDsKLQkJ
a3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzID0gNTsKLQkJZ290byBkb25lOwotCX0KLQotCS8q
IFRyeSBTdjQ4eDQgRy1zdGFnZSBtb2RlICovCi0JY3NyX3dyaXRlKENTUl9IR0FUUCwgSEdBVFBf
TU9ERV9TVjQ4WDQgPDwgSEdBVFBfTU9ERV9TSElGVCk7Ci0JaWYgKChjc3JfcmVhZChDU1JfSEdB
VFApID4+IEhHQVRQX01PREVfU0hJRlQpID09IEhHQVRQX01PREVfU1Y0OFg0KSB7Ci0JCWt2bV9y
aXNjdl9nc3RhZ2VfbW9kZSA9IEhHQVRQX01PREVfU1Y0OFg0OwotCQlrdm1fcmlzY3ZfZ3N0YWdl
X3BnZF9sZXZlbHMgPSA0OwotCQlnb3RvIGRvbmU7Ci0JfQotCi0JLyogVHJ5IFN2Mzl4NCBHLXN0
YWdlIG1vZGUgKi8KIAljc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FUUF9NT0RFX1NWMzlYNCA8PCBI
R0FUUF9NT0RFX1NISUZUKTsKLQlpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9E
RV9TSElGVCkgPT0gSEdBVFBfTU9ERV9TVjM5WDQpIHsKLQkJa3ZtX3Jpc2N2X2dzdGFnZV9tb2Rl
ID0gSEdBVFBfTU9ERV9TVjM5WDQ7Ci0JCWt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVscyA9IDM7
Ci0JCWdvdG8gZG9uZTsKLQl9CisJaWYgKChjc3JfcmVhZChDU1JfSEdBVFApID4+IEhHQVRQX01P
REVfU0hJRlQpICE9IEhHQVRQX01PREVfU1YzOVg0KQorCQlyZXR1cm4gSEdBVFBfTU9ERV9PRkY7
CisKKwljc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FUUF9NT0RFX1NWNDhYNCA8PCBIR0FUUF9NT0RF
X1NISUZUKTsKKwlpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9ERV9TSElGVCkg
IT0gSEdBVFBfTU9ERV9TVjQ4WDQpCisJCXJldHVybiBIR0FUUF9NT0RFX1NWMzlYNDsKKworCWNz
cl93cml0ZShDU1JfSEdBVFAsIEhHQVRQX01PREVfU1Y1N1g0IDw8IEhHQVRQX01PREVfU0hJRlQp
OworCWlmICgoY3NyX3JlYWQoQ1NSX0hHQVRQKSA+PiBIR0FUUF9NT0RFX1NISUZUKSAhPSBIR0FU
UF9NT0RFX1NWNTdYNCkKKwkJcmV0dXJuIEhHQVRQX01PREVfU1Y0OFg0OworCisJcmV0dXJuIEhH
QVRQX01PREVfU1Y1N1g0OwogI2Vsc2UgLyogQ09ORklHXzMyQklUICovCi0JLyogVHJ5IFN2MzJ4
NCBHLXN0YWdlIG1vZGUgKi8KIAljc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FUUF9NT0RFX1NWMzJY
NCA8PCBIR0FUUF9NT0RFX1NISUZUKTsKLQlpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdB
VFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9ERV9TVjMyWDQpIHsKLQkJa3ZtX3Jpc2N2X2dzdGFn
ZV9tb2RlID0gSEdBVFBfTU9ERV9TVjMyWDQ7Ci0JCWt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVs
cyA9IDI7Ci0JCWdvdG8gZG9uZTsKLQl9CisJaWYgKChjc3JfcmVhZChDU1JfSEdBVFApID4+IEhH
QVRQX01PREVfU0hJRlQpICE9IEhHQVRQX01PREVfU1YzMlg0KQorCQlyZXR1cm4gSEdBVFBfTU9E
RV9PRkY7CisKKwlyZXR1cm4gSEdBVFBfTU9ERV9TVjMyWDQ7CiAjZW5kaWYKK30KIAotCS8qIEtW
TSBkZXBlbmRzIG9uICFIR0FUUF9NT0RFX09GRiAqLwotCWt2bV9yaXNjdl9nc3RhZ2VfbW9kZSA9
IEhHQVRQX01PREVfT0ZGOwotCWt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVscyA9IDA7CisvKiBX
ZSBjb3VsZCBwcm9iYWJseSBvbWl0IHRoZSBIR0FUUCB3cml0ZSBhbmQgZmVuY2UuICovCit1bnNp
Z25lZCBsb25nIF9faW5pdCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KHZvaWQpCit7CisJ
dW5zaWduZWQgbG9uZyBnc3RhZ2VfbW9kZSA9IF9fa3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVj
dCgpOwogCi1kb25lOgogCWNzcl93cml0ZShDU1JfSEdBVFAsIDApOwogCWt2bV9yaXNjdl9sb2Nh
bF9oZmVuY2VfZ3ZtYV9hbGwoKTsKKworCXJldHVybiBnc3RhZ2VfbW9kZTsKIH0KZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL21haW4uYyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwppbmRleCA0
NTUzNmFmNTIxZjAuLjU4ZmQ2YWU4ZTA0YSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vbWFp
bi5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwpAQCAtMTA0LDE5ICsxMDQsMjMgQEAgc3Rh
dGljIGludCBfX2luaXQgcmlzY3Zfa3ZtX2luaXQodm9pZCkKIAlpZiAocmMgJiYgcmMgIT0gLUVO
T0RFVikKIAkJcmV0dXJuIHJjOwogCi0Ja3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCgpOwor
CWt2bV9yaXNjdl9nc3RhZ2VfbW9kZSA9IGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRlY3QoKTsK
IAlzd2l0Y2ggKGt2bV9yaXNjdl9nc3RhZ2VfbW9kZSkgewogCWNhc2UgSEdBVFBfTU9ERV9TVjMy
WDQ6CiAJCXN0ciA9ICJTdjMyeDQiOworCQlrdm1fcmlzY3ZfZ3N0YWdlX3BnZF9sZXZlbHMgPSAy
OwogCQlicmVhazsKIAljYXNlIEhHQVRQX01PREVfU1YzOVg0OgogCQlzdHIgPSAiU3YzOXg0IjsK
KwkJa3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzID0gMzsKIAkJYnJlYWs7CiAJY2FzZSBIR0FU
UF9NT0RFX1NWNDhYNDoKIAkJc3RyID0gIlN2NDh4NCI7CisJCWt2bV9yaXNjdl9nc3RhZ2VfcGdk
X2xldmVscyA9IDQ7CiAJCWJyZWFrOwogCWNhc2UgSEdBVFBfTU9ERV9TVjU3WDQ6CiAJCXN0ciA9
ICJTdjU3eDQiOworCQlrdm1fcmlzY3ZfZ3N0YWdlX3BnZF9sZXZlbHMgPSA1OwogCQlicmVhazsK
IAlkZWZhdWx0OgogCQlrdm1fcmlzY3ZfbmFjbF9leGl0KCk7Ci0tIAoyLjUxLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
