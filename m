Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB47C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPXA4XzsG0Z8cUXzFZnW+w6fLTh8oMtORSHhyKgLE3Q=; b=Y1eJxJXCNP6cWb
	y/E+RKCeH8eNnUgHOSyAzM8JRNL4BFmBIqgI8veJlyohxWYzQcEoiMtDYI3rVEklmUagt+4QNqAt3
	T95SjfB48mDSlFSVQOXcXU73kn4iPUK/CoOTyj4nedM0TL11+diDuxaHcw882t9oksn5dplB+zuKK
	WFlMvleeScPSrOFLy5bAlTcJn2aMDp6kVxTNiGRZesixVgDoYbALTNWDYBQKAbzK16mH62B9wMPy/
	CXSuDYy9KERYb50dauMYyrdwGa83ISzoO/MOAWDSGWMY43JMNmHlA0KUa9xyw3RlHbybfz0Whcb7U
	EnIGnnt96roYKvkcjJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxOe-000LWs-SW; Sat, 11 Mar 2023 11:28:20 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxLJ-000K7w-Lu
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 11:24:59 +0000
Received: by mail-ed1-x529.google.com with SMTP id k10so30696291edk.13
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 03:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1678533891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2nk19RWJ3FFxQfThP1IJnCcqh4Rha1T966ziWyQOag=;
        b=xoi23uGWoVBMERLqg6d4ZCon4Umfwkx1isVhxM80MHOqn8Gy/MlUGfQG5TYs+Qbl5F
         zjtDXJxxde9ZrMKRmC/0ermLtUdoBz18vmGQMl3i+olvsTcsIJmXFcKyj0dhY2Twdfjj
         Qb8g2LFX6014DGKCz4WX/H6pdnc3Fx2D30jyY1QV93Y8vyuEqSsG5l70wTzyAoJg0d7E
         KpEU+gYQnlC8w1MmJv1GUlHIUvpfe2YDkhekUfubaFPyTSFh4ItLn/ZeA32AwSS82c/s
         1yUs4tAM6L2u2MkMmMlGEeJIVgiZmgRJI5WHjdJ8IidUjizOfyhqdmDEMAFl+CNWND7U
         ZinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2nk19RWJ3FFxQfThP1IJnCcqh4Rha1T966ziWyQOag=;
        b=htUY15YVd+0SPeoi9vxQZGSIPVczHR6LxcSDzVjog4Fr7JGNd78NzixSI2UMyT7rf4
         kRPJQtA97jOGD2hgUoJFWymQImDnRBxB7SaVTuEuWS6Ma2QXr1x61I16gxzG1fR69rPp
         XnNFOY7WGptR2r5hEKgAsnb2pAr+p7+dfrqghMatyABh6+d4uvDjpb54uaP3eW96vebM
         Og+U+aEFnpJu3e5gqnT9ap4YELXB1gTZIzYdBvtw9+S2SiZU4k4K9SjKP0spZe/uSeMW
         YkUSYlGYgak+5vAzGgN2jFSvivKA+tZxLfIwUSjf3ZWOQ+5xH5pCLlBaoEBTLtqv2JWQ
         L7bA==
X-Gm-Message-State: AO0yUKVpazEggXsKBF6B4ZXLI3pKMlf2WC2qLMm0cb0Nv0ztWfZzG54i
	LT5LAde2II6GNfIHgQu4IhJd8HjP83Qpo/GjV78UQg==
X-Google-Smtp-Source: AK7set8a/pblYINKWh29is0KEdgqlAFOzRPVSYLjlA+rojWgWrbyCHnWQa3g8iViKoePj4aeVOWZbZX+sXfjSy8EGPU=
X-Received: by 2002:a17:906:a4b:b0:879:9c05:f5fb with SMTP id
 x11-20020a1709060a4b00b008799c05f5fbmr14921391ejf.5.1678533891185; Sat, 11
 Mar 2023 03:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20230310094539.764357-1-alexghiti@rivosinc.com>
In-Reply-To: <20230310094539.764357-1-alexghiti@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 11 Mar 2023 16:54:39 +0530
Message-ID: <CAAhSdy3K=ANGrfC43zx5XvF6r5p4+ta_UMsdQOjn9SfMYDN=jA@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_032453_965124_589D6DDC 
X-CRM114-Status: GOOD (  23.83  )
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgMzoxNeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoc2V0IGludGVuZHMgdG8gaW1w
cm92ZSB0bGIgdXRpbGl6YXRpb24gYnkgdXNpbmcgaHVnZXBhZ2VzIGZvcgo+IHRoZSBsaW5lYXIg
bWFwcGluZy4KPgo+IEFzIHJlcG9ydGVkIGJ5IEFudXAgaW4gdjYsIHdoZW4gU1RSSUNUX0tFUk5F
TF9SV1ggaXMgZW5hYmxlZCwgd2UgbXVzdAo+IHRha2UgY2FyZSBvZiBpc29sYXRpbmcgdGhlIGtl
cm5lbCB0ZXh0IGFuZCByb2RhdGEgc28gdGhhdCB0aGV5IGFyZSBub3QKPiBtYXBwZWQgd2l0aCBh
IFBVRCBtYXBwaW5nIHdoaWNoIHdvdWxkIHRoZW4gYXNzaWduIHdyb25nIHBlcm1pc3Npb25zIHRv
Cj4gdGhlIHdob2xlIHJlZ2lvbjogaXQgaXMgYWNoaWV2ZWQgYnkgaW50cm9kdWNpbmcgYSBuZXcg
bWVtYmxvY2sgQVBJLgo+Cj4gQW5vdGhlciBwYXRjaCBtYWtlcyB1c2Ugb2YgdGhpcyBuZXcgQVBJ
IGluIGFybTY0IHdoaWNoIHVzZWQgc29tZSBzb3J0IG9mCj4gaGFjayB0byBzb2x2ZSB0aGlzIGlz
c3VlOiBpdCB3YXMgYnVpbHQvYm9vdCB0ZXN0ZWQgc3VjY2Vzc2Z1bGx5Lgo+Cj4gYmFzZS1jb21t
aXQtdGFnOiB2Ni4zLXJjMQo+Cj4gdjc6Cj4gLSBGaXggQW51cCBidWcgcmVwb3J0IGJ5IGludHJv
ZHVjaW5nIG1lbWJsb2NrX2lzb2xhdGVfbWVtb3J5IHdoaWNoCj4gICBhbGxvd3MgdXMgdG8gc3Bs
aXQgdGhlIG1lbWJsb2NrIG1hcHBpbmdzIGFuZCB0aGVuIGF2b2lkIHRvIG1hcCB0aGUKPiAgIHRo
ZSBQVUQgd2hpY2ggY29udGFpbnMgdGhlIGtlcm5lbCBhcyByZWFkIG9ubHkKPiAtIEFkZCBhIHBh
dGNoIHRvIGFybTY0IHRvIHVzZSB0aGlzIG5ld2x5IGludHJvZHVjZWQgQVBJCj4KPiB2NjoKPiAt
IHF1aWV0IExMVk0gd2FybmluZyBieSBjYXN0aW5nIHBoeXNfcmFtX2Jhc2UgaW50byBhbiB1bnNp
Z25lZCBsb25nCj4KPiB2NToKPiAtIEZpeCBub21tdSBidWlsZHMgYnkgZ2V0dGluZyByaWQgb2Yg
cmlzY3ZfcGZuX2Jhc2UgaW4gcGF0Y2ggMSwgdGhhbmtzCj4gICBDb25vcgo+IC0gQWRkIFJCIGZy
b20gQW5kcmV3Cj4KPiB2NDoKPiAtIFJlYmFzZSBvbiB0b3Agb2YgdjYuMi1yYzMsIGFzIG5vdGVk
IGJ5IENvbm9yCj4gLSBBZGQgQWNrZWQtYnkgUm9iCj4KPiB2MzoKPiAtIENoYW5nZSB0aGUgY29t
bWVudCBhYm91dCBpbml0cmRfc3RhcnQgVkEgY29udmVyc2lvbiBzbyB0aGF0IGl0IGZpdHMKPiAg
IEFSTTY0IGFuZCBSSVNDVjY0IChhbmQgb3RoZXJzIGluIHRoZSBmdXR1cmUgaWYgbmVlZGVkKSwg
YXMgc3VnZ2VzdGVkCj4gICBieSBSb2IKPgo+IHYyOgo+IC0gQWRkIGEgY29tbWVudCBvbiB3aHkg
UklTQ1Y2NCBkb2VzIG5vdCBuZWVkIHRvIHNldCBpbml0cmRfc3RhcnQvZW5kIHRoYXQKPiAgIGVh
cmx5IGluIHRoZSBib290IHByb2Nlc3MsIGFzIGFza2VkIGJ5IFJvYgo+Cj4gQWxleGFuZHJlIEdo
aXRpICg0KToKPiAgIHJpc2N2OiBHZXQgcmlkIG9mIHJpc2N2X3Bmbl9iYXNlIHZhcmlhYmxlCj4g
ICBtbTogSW50cm9kdWNlIG1lbWJsb2NrX2lzb2xhdGVfbWVtb3J5Cj4gICBhcm02NDogTWFrZSB1
c2Ugb2YgbWVtYmxvY2tfaXNvbGF0ZV9tZW1vcnkgZm9yIHRoZSBsaW5lYXIgbWFwcGluZwo+ICAg
cmlzY3Y6IFVzZSBQVUQvUDREL1BHRCBwYWdlcyBmb3IgdGhlIGxpbmVhciBtYXBwaW5nCgpUaGlz
IHdvcmtzIGZpbmUgb24gUUVNVSBSVjY0LiBJIGhhdmUgdGVzdGVkIG9uIFFFTVUgUlY2NCB3aXRo
CmJ1c3lib3ggYW5kIEZlZG9yYSByb290ZnMuIEkgYWxzbyB0ZXN0ZWQgS1ZNIFJWNjQgd2hpY2gg
d29ya3MKZmluZSBhcyB3ZWxsLgoKQnV0LCBRRU1VIFJWMzIgd2l0aCBidXN5Ym94IHJvb3RmcyBp
cyBicm9rZW4gc28geW91IG1pZ2h0IHdhbnQKdG8gdHJ5IHRoYXQuCgpJbiBhbnkgY2FzZSwgSSBo
YXZlIHJldmlld2VkIGFuZCB0ZXN0ZWQgdGhpcyBzZXJpZXMgYXQgbXkgZW5kLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+ClRlc3RlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4KPiAgYXJjaC9hcm02NC9t
bS9tbXUuYyAgICAgICAgICAgfCAgNCArKy0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFn
ZS5oIHwgMTkgKysrKysrKysrKysrKysrLS0KPiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAg
ICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2
L21tL3BoeXNhZGRyLmMgICAgICB8IDE2ICsrKysrKysrKysrKysrCj4gIGRyaXZlcnMvb2YvZmR0
LmMgICAgICAgICAgICAgIHwgMTEgKysrKystLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21lbWJsb2Nr
LmggICAgICB8ICAxICsKPiAgbW0vbWVtYmxvY2suYyAgICAgICAgICAgICAgICAgfCAyMiArKysr
KysrKysrKysrKysrKysrLQo+ICA3IGZpbGVzIGNoYW5nZWQsIDkyIGluc2VydGlvbnMoKyksIDIw
IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjM3LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
