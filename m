Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA4AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 01:02:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0564B60E74
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 01:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0564B60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkIRmmMOIvA607HD9X59aU32ZjbAIXvMHcP+BehkhKg=; b=Jza/KlE1X1r2uPh+urXCjcqy6W
	Z5w4qLBzKAlX7p4po12MDdIaAyG1DUzRCtdg6ude4XnpA9+6mPbGmoDDm6rTFL8SsDsBcLdNmf8+K
	Gcqtc9rZHYdaGjAXn0R031VtblEjHg4mzVGOA60zwH5QT8yKwtXD8awkWn+JyyhXPmJWkFl0tWa0M
	RiLvy4x4e9nK0iZAGHr8q2AA3flhwtKjF9g7+bfN5sisnEKT3jZrMg4yO3+que/qIsGrRtCGfURk3
	lW/duMlFvzZBGs4kPVUvWWOyYsQjGWLwqc/gnFJVDY3gDF5ts+BYrD1HVylOCXxGRoDuYJrGrCtaW
	uckgrnlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfto0-006bDf-B1; Thu, 28 Oct 2021 01:02:08 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mftnw-006bCE-Re
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 01:02:06 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HfnKD3KrdzWtCr;
 Thu, 28 Oct 2021 09:00:00 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 28 Oct 2021 09:01:57 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 28 Oct 2021 09:01:55 +0800
Subject: Re: [PATCH bpf-next,v3] riscv, bpf: Add BPF exception tables
To: Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn.topel@gmail.com>
References: <20211027111822.3801679-1-tongtiangen@huawei.com>
 <CAJ+HfNhC=hfFnjVvCf=bw+n1msRjR3gGUyapAmsRDupZ5CusrQ@mail.gmail.com>
 <15487721-b3de-73c7-5ef3-614c6da2f8cd@iogearbox.net>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <5c38b790-65e9-6ba2-75bd-121d6d51ab34@huawei.com>
Date: Thu, 28 Oct 2021 09:01:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <15487721-b3de-73c7-5ef3-614c6da2f8cd@iogearbox.net>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_180205_452120_74DC0BCB 
X-CRM114-Status: GOOD (  18.63  )
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

CgpPbiAyMDIxLzEwLzI4IDc6MTEsIERhbmllbCBCb3JrbWFubiB3cm90ZToKPiBPbiAxMC8yNy8y
MSA2OjU1IFBNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBPbiBXZWQsIDI3IE9jdCAyMDIxIGF0
IDEzOjAzLCBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5jb20+IHdyb3RlOgo+Pj4K
Pj4+IFdoZW4gYSB0cmFjaW5nIEJQRiBwcm9ncmFtIGF0dGVtcHRzIHRvIHJlYWQgbWVtb3J5IHdp
dGhvdXQgdXNpbmcgdGhlCj4+PiBicGZfcHJvYmVfcmVhZCgpIGhlbHBlciwgdGhlIHZlcmlmaWVy
IG1hcmtzIHRoZSBsb2FkIGluc3RydWN0aW9uIHdpdGgKPj4+IHRoZSBCUEZfUFJPQkVfTUVNIGZs
YWcuIFNpbmNlIHRoZSByaXNjdiBKSVQgZG9lcyBub3QgY3VycmVudGx5IHJlY29nbml6ZQo+Pj4g
dGhpcyBmbGFnIGl0IGZhbGxzIGJhY2sgdG8gdGhlIGludGVycHJldGVyLgo+Pj4KPj4+IEFkZCBz
dXBwb3J0IGZvciBCUEZfUFJPQkVfTUVNLCBieSBhcHBlbmRpbmcgYW4gZXhjZXB0aW9uIHRhYmxl
IHRvIHRoZQo+Pj4gQlBGIHByb2dyYW0uIElmIHRoZSBsb2FkIGluc3RydWN0aW9uIGNhdXNlcyBh
IGRhdGEgYWJvcnQsIHRoZSBmaXh1cAo+Pj4gaW5mcmFzdHJ1Y3R1cmUgZmluZHMgdGhlIGV4Y2Vw
dGlvbiB0YWJsZSBhbmQgZml4ZXMgdXAgdGhlIGZhdWx0LCBieQo+Pj4gY2xlYXJpbmcgdGhlIGRl
c3RpbmF0aW9uIHJlZ2lzdGVyIGFuZCBqdW1waW5nIG92ZXIgdGhlIGZhdWx0aW5nCj4+PiBpbnN0
cnVjdGlvbi4KPj4+Cj4+PiBBIG1vcmUgZ2VuZXJpYyBzb2x1dGlvbiB3b3VsZCBhZGQgYSAiaGFu
ZGxlciIgZmllbGQgdG8gdGhlIHRhYmxlIGVudHJ5LAo+Pj4gbGlrZSBvbiB4ODYgYW5kIHMzOTAu
Cj4+Pgo+Pj4gVGhlIHNhbWUgaXNzdWUgaW4gQVJNNjQgaXMgZml4ZWQgaW46Cj4+PiBjb21taXQg
ODAwODM0Mjg1MzYxICgiYnBmLCBhcm02NDogQWRkIEJQRiBleGNlcHRpb24gdGFibGVzIikKPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5jb20+
Cj4+PiBUZXN0ZWQtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+PiAtLS0KPj4+
IHYzOgo+Pj4gTW9kaWZ5IGFjY29yZGluZyB0byBCasO2cm4ncyBjb21tZW50cywgbWFpbmx5IGNv
ZGUgb3B0aW1pemF0aW9uLgo+Pgo+PiBUaGFuayB5b3UhCj4+Cj4+IEkgcmFuIHRoaXMgcGF0Y2gg
YWdhaW5zdCB0aGUgdGVzdF9icGYua28sIGFuZCBzZWxmdGVzdHMvYnBmIC0tIG5vCj4+IHJlZ3Jl
c3Npb25zLCBhbmQgYWZ0ZXIgdGhlIHBhdGNoIGlzIGFwcGxpZWQgbW9yZSB0ZXN0cyBwYXNzZXMu
IFlheSEKPj4KPj4gT24gYSByZWxhdGVkIG5vdGUuIFRoZSBSSVNDLVYgc2VsZnRlc3RzL2JwZiBp
cyBpbiBhIHByZXR0eSBsb3VzeQo+PiBzdGF0ZS4gSSdsbCBzZW5kIGEgY2xlYW51cCBwYXRjaCBm
b3IgdGhlbSBzb29uaXNoLiBFLmcuOgo+Cj4gVGhhbmtzIGZvciB0ZXN0aW5nIQo+Cj4+ICogUklT
Qy1WIGlzIG1pc3NpbmcgaW4gYnBmX3RyYWNpbmcuaCAobGliYnBmKQo+PiAqIFNvbWUgcHJvZ3Jh
bXMgZG9uJ3QgY29udmVyZ2UgaW4gMTYgc3RlcHMsIEkgaGFkIHRvIGluY3JlYXNlIGl0IHRvIH4z
Mgo+PiAqIFRoZSBzZWxmdGVzdC9icGYgTWFrZWZpbGUgbmVlZGVkIHNvbWUgUlYgc3BlY2lmaWMg
Y2hhbmdlcwo+PiAqIC4uLmEgbG90IG9mIHRlc3RzIHN0aWxsIGRvbid0IHBhc3MsIGFuZCBuZWVk
cyB0byBiZSBsb29rZWQgaW4gdG8KPgo+IFNvdW5kcyBnb29kLCBwbGVhc2Ugc2hpcCB0aGVtLiA7
KQo+Cj4+IEZlZWwgZnJlZSB0byBhZGQ6Cj4+Cj4+IEFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxi
am9ybkBrZXJuZWwub3JnPgo+Cj4gQXBwbGllZCwgdGhhbmtzISBUb25nLCBpZiB5b3UgaGF2ZSBh
IGNoYW5jZSwgcGxlYXNlIGZvbGxvdyB1cCB3aXRoIE1hcmsncwo+IHN1Z2dlc3Rpb24gdG8gYWxp
Z24gdGhlIGV4dGFibGUgaW5mcmEgdG8gYXJtNjQveDg2LgoKVGhhbmtzLCBNYXJrJ3Mgc3VnZ2Vz
dGlvbiBpcyBnb29kLiBJIHdpbGwgaW1wcm92ZSB0aGlzIHBhcnQgaWYgSSBoYXZlIHRoZSBvcHBv
cnR1bml0eS4KPgo+IFRoYW5rcywKPiBEYW5pZWwKPiAuCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
