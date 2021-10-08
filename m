Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF5EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 01:41:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DDA26121F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 01:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DDA26121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gALWRlGy3Ol3wSewR6Es315BbrAXzVLhSblax+sPRHU=; b=LstflaiRDQDaKA
	4C1llVpanyQB/XProXblrX/PADSnIjD30d9xd5vjd4uWPSSrbD2RwCIKfg+8c/Qe8LuwZMR05DMpO
	Mng5XgXlVy8Jg1MMTpAMFxhEhvxYENCcL6yQt7LcBDEawKSKuG+dS5JeH6TH0qeS3IMFTx4/tmAPB
	ry9Yu2cPT8VOes5e0u4Y2BVGjuce1KUhxQlSiBTqT095zIOKtaCJ7H+dClc0uUOZh2K7dfhl79j1y
	7YbjwM1CUbqkPaL6+qGTUHZ+gNjnSds2NxAQwKz+wsI7bXAMEf/5BcdB05Kld2d76aPBcgfDzmfPo
	5AqpnCl9rV5mkvN1drig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYesJ-001D1e-6x; Fri, 08 Oct 2021 01:40:39 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYesF-001D1F-TX
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 01:40:37 +0000
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by linux.microsoft.com (Postfix) with ESMTPSA id AAD7820B57B0
 for <linux-riscv@lists.infradead.org>; Thu,  7 Oct 2021 18:40:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AAD7820B57B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1633657231;
 bh=Uk4hsfUUKYFmUtqCHOODW8RFQjUlKMvlkgUPBoS4mqk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rtaH4zpKj0zBee2ooDR3Y8HnvwAbd36ZaagCT3jYRxZbi2KloGleAcfgt4cz3txjR
 5MN9q5cTwDSRFFeuBY0YLQ1Sf42Pntn+VWH3hxSWX2yaYtVqpFtQ084tQhuU8SwC//
 W5yfk39B8ZBuJyz66G5WZewL2iMPtCHTPKd4nOyE=
Received: by mail-pf1-f178.google.com with SMTP id p1so6823112pfh.8
 for <linux-riscv@lists.infradead.org>; Thu, 07 Oct 2021 18:40:31 -0700 (PDT)
X-Gm-Message-State: AOAM531Rrk1KieMaEfhKuMxeSiidKvmVrjDEFlW90oTSL6PXMVJLkKl7
 1R8o7AbXb5n1f4Qd3ShoqVJFn56XEeIxMJcQcAI=
X-Google-Smtp-Source: ABdhPJzQe0p9b3+f2tqDQVpw2zXSsKab+YeHU+cOp7MfVNG/GVkQKHDCVHnhgj28yt/ktMP0O6WPP+N4pivUA+OePMg=
X-Received: by 2002:a62:7656:0:b0:44c:591b:5a42 with SMTP id
 r83-20020a627656000000b0044c591b5a42mr7600293pfc.57.1633657231110; Thu, 07
 Oct 2021 18:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210919192104.98592-1-mcroce@linux.microsoft.com>
 <mhng-1ef62a9c-06e5-43cf-a4ec-8c18111e79d3@palmerdabbelt-glaptop>
In-Reply-To: <mhng-1ef62a9c-06e5-43cf-a4ec-8c18111e79d3@palmerdabbelt-glaptop>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Fri, 8 Oct 2021 03:39:55 +0200
X-Gmail-Original-Message-ID: <CAFnufp0Uud7a3WW0n2tsgDk2Wa7b63=vNmRjsqswa0qyB+Efvg@mail.gmail.com>
Message-ID: <CAFnufp0Uud7a3WW0n2tsgDk2Wa7b63=vNmRjsqswa0qyB+Efvg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] riscv: optimized mem* functions
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <Atish.Patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, 
 Bin Meng <bmeng.cn@gmail.com>, David Laight <David.Laight@aculab.com>, 
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_184036_088752_B8F114AA 
X-CRM114-Status: GOOD (  24.86  )
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

T24gRnJpLCBPY3QgOCwgMjAyMSBhdCAzOjI2IEFNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFi
YmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCAxOSBTZXAgMjAyMSAxMjoyMTowMSBQRFQgKC0w
NzAwKSwgbWNyb2NlQGxpbnV4Lm1pY3Jvc29mdC5jb20gd3JvdGU6Cj4gPiBGcm9tOiBNYXR0ZW8g
Q3JvY2UgPG1jcm9jZUBtaWNyb3NvZnQuY29tPgo+ID4KPiA+IFJlcGxhY2UgdGhlIGFzc2VtYmx5
IG1lbXtjcHksbW92ZSxzZXR9IHdpdGggQyBlcXVpdmFsZW50Lgo+ID4KPiA+IFRyeSB0byBhY2Nl
c3MgUkFNIHdpdGggdGhlIGxhcmdlc3QgYml0IHdpZHRoIHBvc3NpYmxlLCBidXQgd2l0aG91dAo+
ID4gZG9pbmcgdW5hbGlnbmVkIGFjY2Vzc2VzLgo+ID4KPiA+IEEgZnVydGhlciBpbXByb3ZlbWVu
dCBjb3VsZCBiZSB0byB1c2UgbXVsdGlwbGUgcmVhZCBhbmQgd3JpdGVzIGFzIHRoZQo+ID4gYXNz
ZW1ibHkgdmVyc2lvbiB3YXMgdHJ5aW5nIHRvIGRvLgo+ID4KPiA+IFRlc3RlZCBvbiBhIEJlYWds
ZVYgU3RhcmxpZ2h0IHdpdGggYSBTaUZpdmUgVTc0IGNvcmUsIHdoZXJlIHRoZQo+ID4gaW1wcm92
ZW1lbnQgaXMgbm90aWNlYWJsZS4KPiA+Cj4gPiB2MyAtPiB2NDoKPiA+IC0gaW5jb3Jwb3JhdGUg
Y2hhbmdlcyBmcm9tIHByb3Bvc2VkIGdlbmVyaWMgdmVyc2lvbjoKPiA+ICAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIxMDYxNzE1Mjc1NC4xNzk2MC0xLW1jcm9jZUBsaW51eC5taWNy
b3NvZnQuY29tLwo+ID4KPiA+IHYyIC0+IHYzOgo+ID4gLSBhbGlhcyBtZW0qIHRvIF9fbWVtKiBh
bmQgbm90IHZpY2V2ZXJzYQo+ID4gLSB1c2UgX19hbGlhcyBpbnN0ZWFkIG9mIGEgdGFpbCBjYWxs
Cj4gPgo+ID4gdjEgLT4gdjI6Cj4gPiAtIHJlZHVjZSB0aGUgdGhyZXNob2xkIGZyb20gNjQgdG8g
MTYgYnl0ZXMKPiA+IC0gZml4IEtBU0FOIGJ1aWxkCj4gPiAtIG9wdGltaXplIG1lbXNldAo+ID4K
PiA+IE1hdHRlbyBDcm9jZSAoMyk6Cj4gPiAgIHJpc2N2OiBvcHRpbWl6ZWQgbWVtY3B5Cj4gPiAg
IHJpc2N2OiBvcHRpbWl6ZWQgbWVtbW92ZQo+ID4gICByaXNjdjogb3B0aW1pemVkIG1lbXNldAo+
ID4KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N0cmluZy5oIHwgIDE4ICsrLS0KPiA+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgIHwgICAxIC0KPiA+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9yaXNjdl9rc3ltcy5jIHwgIDE3IC0tLS0KPiA+ICBhcmNoL3Jpc2N2L2xpYi9NYWtlZmls
ZSAgICAgICAgIHwgICA0ICstCj4gPiAgYXJjaC9yaXNjdi9saWIvbWVtY3B5LlMgICAgICAgICB8
IDEwOCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgYXJjaC9yaXNjdi9saWIvbWVtbW92ZS5T
ICAgICAgICB8ICA2NCAtLS0tLS0tLS0tLS0tCj4gPiAgYXJjaC9yaXNjdi9saWIvbWVtc2V0LlMg
ICAgICAgICB8IDExMyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIGFyY2gvcmlzY3YvbGli
L3N0cmluZy5jICAgICAgICAgfCAxNTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiA+ICA4IGZpbGVzIGNoYW5nZWQsIDE2NCBpbnNlcnRpb25zKCspLCAzMTUgZGVsZXRpb25zKC0p
Cj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3Jpc2N2X2tzeW1zLmMK
PiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIvbWVtY3B5LlMKPiA+ICBkZWxl
dGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIvbWVtbW92ZS5TCj4gPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3YvbGliL21lbXNldC5TCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3YvbGliL3N0cmluZy5jCj4KPiBUaGFua3MuICBUaGVzZSBnZW5lcmFsbHkgbG9vayBn
b29kLCBidXQgdGhleSdyZSBmYWlsaW5nIHRvIGJ1aWxkIGZvciBtZS4KPiBJJ20gZ2V0dGluZyBl
cnJvcnMgYWxvbmcgdGhlIGxpbmVzIG9mCj4KPiAgICAgYXJjaC9yaXNjdi9saWIvc3RyaW5nLmM6
ODk6NzogZXJyb3I6IGlubGluaW5nIGZhaWxlZCBpbiBjYWxsIHRvIOKAmGFsd2F5c19pbmxpbmXi
gJkg4oCYbWVtY3B54oCZOiBmdW5jdGlvbiBib2R5IGNhbiBiZSBvdmVyd3JpdHRlbiBhdCBsaW5r
IHRpbWUKPiAgICAgICAgODkgfCB2b2lkICptZW1jcHkodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAq
c3JjLCBzaXplX3QgY291bnQpIF9fd2VhayBfX2FsaWFzKF9fbWVtY3B5KTsgICAgICB8ICAgICAg
IF5+fn5+fgo+ICAgICBhcmNoL3Jpc2N2L2xpYi9zdHJpbmcuYzo5OToxMDogbm90ZTogY2FsbGVk
IGZyb20gaGVyZQo+ICAgICAgICA5OSB8ICAgcmV0dXJuIG1lbWNweShkZXN0LCBzcmMsIGNvdW50
KTsKPiAgICAgICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPgo+IEkn
bSBzdGlsbCBhIGJpdCBiZWhpbmQgb24gZW1haWwgc28gSSdtIGdvaW5nIHRvIGtlZXAgZ29pbmcg
dGhyb3VnaAo+IHBhdGNoZXMsIGJ1dCBpZiB0aGVyZSdzIG5vIHY1IGJ5IHRoZSB0aW1lIEkgZ2V0
IGJhY2sgaGVyZSB0aGVuIEknbGwgdGFrZQo+IGEgbG9vay4KCkkndmUgc2VudCBhIHY1IGhlcmU6
CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIxMDkyOTE3MjIzNC4zMTYy
MC0xLW1jcm9jZUBsaW51eC5taWNyb3NvZnQuY29tLwoKUmVnYXJkcywKLS0gCnBlciBhc3BlcmEg
YWQgdXBzdHJlYW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
