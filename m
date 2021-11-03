Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BB4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 13:30:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5037460F39
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 13:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5037460F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXqwOOy3Tht71YhR+e/PxosOfnoRcrKJIi0cus0+Q+E=; b=Rc+DlOVCGSgvf8f0n5hEv6YaTE
	ZQi8Oo6cxbFbEMdWZu5k/oJgFndVhmhIIe4GI3YrwFZj2Yf0q5OfPjsIHBZCQFxujtD8PDZzwzvZj
	2HGd7tINpUoPCcxpln2O6P7kb5K0/P+LByAr/CNZ8W32s9dMuiua4zHnn8v+khrfD7PzmruhIYcSS
	MAArO0uxryA7nzXyqnZdF8JnhsiV//L4HWDcXBCW53fQC8lSeNbL+InWPerAubpnL+rXCIyim2+uV
	bBWrdRZPoZJ3etdeEsz17CuVDnz3Us4h9gIxAxybbTT7e15+2hxONtEba68F83HkrewE/JXGLfxwt
	cqHvBG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miGL1-005JjX-T9; Wed, 03 Nov 2021 13:29:59 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miGKz-005Jhp-03
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 13:29:59 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Hknf00NcwzTgDr;
 Wed,  3 Nov 2021 21:28:24 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 3 Nov 2021 21:29:53 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 3 Nov 2021 21:29:52 +0800
Subject: Re: [PATCH bpf-next] riscv, bpf: Fix RV32 broken build, and silence
 RV64 warning
To: Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, <ast@kernel.org>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>
References: <20211103115453.397209-1-bjorn@kernel.org>
 <f98b15c9-bd06-267e-e404-ae4f607d8740@iogearbox.net>
CC: <luke.r.nels@gmail.com>, <xi.wang@gmail.com>,
 <linux-riscv@lists.infradead.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <993a1ca1-dc66-e749-bc69-a439dffb0534@huawei.com>
Date: Wed, 3 Nov 2021 21:29:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <f98b15c9-bd06-267e-e404-ae4f607d8740@iogearbox.net>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_062957_679122_95B5DD02 
X-CRM114-Status: GOOD (  16.76  )
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

CgpPbiAyMDIxLzExLzMgMjE6MTUsIERhbmllbCBCb3JrbWFubiB3cm90ZToKPiBPbiAxMS8zLzIx
IDEyOjU0IFBNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBDb21taXQgMjUyYzc2NWJkNzY0ICgi
cmlzY3YsIGJwZjogQWRkIEJQRiBleGNlcHRpb24gdGFibGVzIikgb25seQo+PiBhZGRyZXNzZWQg
UlY2NCwgYW5kIGJyb2tlIHRoZSBSVjMyIGJ1aWxkIFsxXS4gRml4IGJ5IGdhdGluZyB0aGUgZXhj
ZXB0aW9uCj4+IHRhYmxlcyBjb2RlIHdpdGggQ09ORklHX0FSQ0hfUlY2NEkuCj4+Cj4+IEZ1cnRo
ZXIsIHNpbGVuY2UgYSAiLVdtaXNzaW5nLXByb3RvdHlwZXMiIHdhcm5pbmcgWzJdIGluIHRoZSBS
VjY0IEJQRgo+PiBKSVQuCj4+Cj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sbHZtLzIw
MjExMTAyMDYxMC45b3k5UnIwRy1sa3BAaW50ZWwuY29tLwo+PiBbMl0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGx2bS8yMDIxMTAyOTAzMzQuMnpkTXlScTQtbGtwQGludGVsLmNvbS8KPj4KPj4g
Rml4ZXM6IDI1MmM3NjViZDc2NCAoInJpc2N2LCBicGY6IEFkZCBCUEYgZXhjZXB0aW9uIHRhYmxl
cyIpCj4+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Cj4+
IC0tLQo+PiBUb25nL0RhbmllbDogVGhlIFJWMzIgYnVpbGQgaGFzIGJlZW4gYnJva2VuIHNpbmNl
IFRodXJzZGF5LiBJJ2xsIHRyeQo+PiB0byBmYXN0LXRyYWNrIGEgYml0LCBhbmQgY29tbWl0IGEg
cXVpY2stZml4IGZvciBpdC4gSG9wZSB0aGF0J3MgT0sKPj4gd2l0aCB5b3UsIFRvbmchCj4+Cj4+
IEkndmUgdmVyaWZpZWQgdGhlIGJ1aWxkIG9uIG15IG1hY2hpbmUgdXNpbmcgcmlzY3YzMiBHQ0Mg
OS4zLjAgYW5kCj4+IHJpc2N2NjQgR0NDIDExLjIuMC4KPgo+IFRoYW5rcyBmb3IgdGhlIGZpeCBC
am9ybiEKPgo+PiBhcmNoL3Jpc2N2L21tL2V4dGFibGUuYyAgICAgICAgIHwgNCArKy0tCj4+ICAg
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDIgKysKPj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbW0vZXh0YWJsZS5jIGIvYXJjaC9yaXNjdi9tbS9leHRhYmxlLmMKPj4gaW5kZXgg
MThiZjMzODMwM2I2Li5kZGI3ZDNiOTllODkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
ZXh0YWJsZS5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vZXh0YWJsZS5jCj4+IEBAIC0xMSw3ICsx
MSw3IEBACj4+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+PiAgICNpbmNsdWRlIDxsaW51
eC91YWNjZXNzLmg+Cj4+ICAgLSNpZmRlZiBDT05GSUdfQlBGX0pJVAo+PiArI2lmIGRlZmluZWQo
Q09ORklHX0JQRl9KSVQpICYmIGRlZmluZWQoQ09ORklHX0FSQ0hfUlY2NEkpCj4+ICAgaW50IHJ2
X2JwZl9maXh1cF9leGNlcHRpb24oY29uc3Qgc3RydWN0IGV4Y2VwdGlvbl90YWJsZV9lbnRyeSAq
ZXgsIHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPj4gICAjZW5kaWYKPj4gICBAQCAtMjMsNyArMjMs
NyBAQCBpbnQgZml4dXBfZXhjZXB0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiAgICAgICBp
ZiAoIWZpeHVwKQo+PiAgICAgICAgICAgcmV0dXJuIDA7Cj4+ICAgLSNpZmRlZiBDT05GSUdfQlBG
X0pJVAo+PiArI2lmIGRlZmluZWQoQ09ORklHX0JQRl9KSVQpICYmIGRlZmluZWQoQ09ORklHX0FS
Q0hfUlY2NEkpCj4+ICAgICAgIGlmIChyZWdzLT5lcGMgPj0gQlBGX0pJVF9SRUdJT05fU1RBUlQg
JiYgcmVncy0+ZXBjIDwgQlBGX0pJVF9SRUdJT05fRU5EKQo+PiAgICAgICAgICAgcmV0dXJuIHJ2
X2JwZl9maXh1cF9leGNlcHRpb24oZml4dXAsIHJlZ3MpOwo+PiAgICNlbmRpZgo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2Jw
Zl9qaXRfY29tcDY0LmMKPj4gaW5kZXggMmNhMzQ1YzdiMGJmLi5mMmE3NzljN2UyMjUgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4gKysrIGIvYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+PiBAQCAtNDU5LDYgKzQ1OSw4IEBAIHN0YXRpYyBp
bnQgZW1pdF9jYWxsKGJvb2wgZml4ZWQsIHU2NCBhZGRyLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQg
KmN0eCkKPj4gICAjZGVmaW5lIEJQRl9GSVhVUF9PRkZTRVRfTUFTSyAgIEdFTk1BU0soMjYsIDAp
Cj4+ICAgI2RlZmluZSBCUEZfRklYVVBfUkVHX01BU0sgICAgICBHRU5NQVNLKDMxLCAyNykKPj4g
ICAraW50IHJ2X2JwZl9maXh1cF9leGNlcHRpb24oY29uc3Qgc3RydWN0IGV4Y2VwdGlvbl90YWJs
ZV9lbnRyeSAqZXgsCj4+ICsgICAgICAgICAgICAgICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+
Cj4gSSdtIG9rYXkgdG8gdGFrZSB0aGlzIGFzIGEgcXVpY2sgZml4LCBidXQgaWYgaXRzIG5vdCB0
b28gbXVjaCBoYXNzbGUsIGNvdWxkIHdlIGFkZCBhCj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9l
eHRhYmxlLmggaW4gc2ltaWxhciBmYXNoaW9uIGxpa2UgYXJtNjQgb3IgeDg2IHdoZXJlIHdlIG1v
dmUKPiB0aGUgZXhfaGFuZGxlcl9icGYoKSBzaWduYXR1cmUgdGhlcmUsIGRpZCB5b3UgaGF2ZSBh
IGNoYW5jZSB0byBjaGVjaz8KCkhpIERhbmllbDoKT24gdGhlIHF1ZXN0aW9uIG9mIHdoZXRoZXIg
dG8gYWRkIGFzbS9leHRhYmxlLmgsIEkgaGF2ZSBhbiBpbi1kZXB0aCBkaXNjdXNzaW9uIHdpdGgg
QmrDtnJuLCBib3RoIHNjaGVtZXMgYXJlIE9LLgoKVGhpcyBwYXRjaCBpcyB0aGUgc2NoZW1lIG9m
IGFkZGluZyBhIGhlYWRlciBmaWxlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyMTEx
MDIxNDU2NDIuNzI0ODIwLTEtdG9uZ3RpYW5nZW5AaHVhd2VpLmNvbS8KClJldmlld2VkLWJ5OiBU
b25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5jb20+CgpUaGFua3MuCgo+Cj4+ICAgaW50
IHJ2X2JwZl9maXh1cF9leGNlcHRpb24oY29uc3Qgc3RydWN0IGV4Y2VwdGlvbl90YWJsZV9lbnRy
eSAqZXgsCj4+ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiAgIHsK
Pj4KPj4gYmFzZS1jb21taXQ6IGNjMDM1NmQ2YTAyZTA2NDM4N2MxNmE4M2NiOTZmZTQzZWYzMzE4
MWUKPj4KPgo+IFRoYW5rcywKPiBEYW5pZWwKPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
