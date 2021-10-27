Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207AAC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:11:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E328061039
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E328061039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kRw2AZm8N4EyLtSnIpc7dvdAmz+qz6tMo8P4rM7TmY=; b=RMDbQLdu9An7d/ueRHWp73Q0HM
	T7GwKrgRzaBmyxmBFyGJr/O01/4kkT6jmT5+B6qpBZcA83zpUh5nsOA8Uhq/Dk25qyIK0SdoDq9AE
	Zs32f+1q5Ni5HgEfWiOdS+en2MM6IDjZrBYHakyIyg1fg7eiBea5nqjOKR4BfdT8EB9CpzMzOFlT2
	kwHXC8HL2HgbO9GBLCEZ3C0rro+gPo01lDolqUOW6BP/1q3SPBAhxnc84OTf1/wONcv6BDZ+XmrHG
	Si5KXGDO16dYYLeJTIHblNXiXVMllvLHY9B2jAlJ/hb0kg4xGa21ZYdIddqcqZBYBZf6AfXIXxsSX
	vlwqZmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfs4r-006TbT-75; Wed, 27 Oct 2021 23:11:25 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfs4o-006TZi-Jg
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 23:11:24 +0000
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1mfs4W-000F2p-5m; Thu, 28 Oct 2021 01:11:04 +0200
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1mfs4V-000GPT-Q9; Thu, 28 Oct 2021 01:11:03 +0200
Subject: Re: [PATCH bpf-next,v3] riscv, bpf: Add BPF exception tables
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Tong Tiangen <tongtiangen@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>
References: <20211027111822.3801679-1-tongtiangen@huawei.com>
 <CAJ+HfNhC=hfFnjVvCf=bw+n1msRjR3gGUyapAmsRDupZ5CusrQ@mail.gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <15487721-b3de-73c7-5ef3-614c6da2f8cd@iogearbox.net>
Date: Thu, 28 Oct 2021 01:11:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAJ+HfNhC=hfFnjVvCf=bw+n1msRjR3gGUyapAmsRDupZ5CusrQ@mail.gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.3/26335/Wed Oct 27 10:28:55 2021)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_161122_675853_356D9D04 
X-CRM114-Status: GOOD (  20.46  )
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

T24gMTAvMjcvMjEgNjo1NSBQTSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBPbiBXZWQsIDI3IE9j
dCAyMDIxIGF0IDEzOjAzLCBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5jb20+IHdy
b3RlOgo+Pgo+PiBXaGVuIGEgdHJhY2luZyBCUEYgcHJvZ3JhbSBhdHRlbXB0cyB0byByZWFkIG1l
bW9yeSB3aXRob3V0IHVzaW5nIHRoZQo+PiBicGZfcHJvYmVfcmVhZCgpIGhlbHBlciwgdGhlIHZl
cmlmaWVyIG1hcmtzIHRoZSBsb2FkIGluc3RydWN0aW9uIHdpdGgKPj4gdGhlIEJQRl9QUk9CRV9N
RU0gZmxhZy4gU2luY2UgdGhlIHJpc2N2IEpJVCBkb2VzIG5vdCBjdXJyZW50bHkgcmVjb2duaXpl
Cj4+IHRoaXMgZmxhZyBpdCBmYWxscyBiYWNrIHRvIHRoZSBpbnRlcnByZXRlci4KPj4KPj4gQWRk
IHN1cHBvcnQgZm9yIEJQRl9QUk9CRV9NRU0sIGJ5IGFwcGVuZGluZyBhbiBleGNlcHRpb24gdGFi
bGUgdG8gdGhlCj4+IEJQRiBwcm9ncmFtLiBJZiB0aGUgbG9hZCBpbnN0cnVjdGlvbiBjYXVzZXMg
YSBkYXRhIGFib3J0LCB0aGUgZml4dXAKPj4gaW5mcmFzdHJ1Y3R1cmUgZmluZHMgdGhlIGV4Y2Vw
dGlvbiB0YWJsZSBhbmQgZml4ZXMgdXAgdGhlIGZhdWx0LCBieQo+PiBjbGVhcmluZyB0aGUgZGVz
dGluYXRpb24gcmVnaXN0ZXIgYW5kIGp1bXBpbmcgb3ZlciB0aGUgZmF1bHRpbmcKPj4gaW5zdHJ1
Y3Rpb24uCj4+Cj4+IEEgbW9yZSBnZW5lcmljIHNvbHV0aW9uIHdvdWxkIGFkZCBhICJoYW5kbGVy
IiBmaWVsZCB0byB0aGUgdGFibGUgZW50cnksCj4+IGxpa2Ugb24geDg2IGFuZCBzMzkwLgo+Pgo+
PiBUaGUgc2FtZSBpc3N1ZSBpbiBBUk02NCBpcyBmaXhlZCBpbjoKPj4gY29tbWl0IDgwMDgzNDI4
NTM2MSAoImJwZiwgYXJtNjQ6IEFkZCBCUEYgZXhjZXB0aW9uIHRhYmxlcyIpCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFRvbmcgVGlhbmdlbiA8dG9uZ3RpYW5nZW5AaHVhd2VpLmNvbT4KPj4gVGVzdGVk
LWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gdjM6Cj4+IE1vZGlm
eSBhY2NvcmRpbmcgdG8gQmrDtnJuJ3MgY29tbWVudHMsIG1haW5seSBjb2RlIG9wdGltaXphdGlv
bi4KPiAKPiBUaGFuayB5b3UhCj4gCj4gSSByYW4gdGhpcyBwYXRjaCBhZ2FpbnN0IHRoZSB0ZXN0
X2JwZi5rbywgYW5kIHNlbGZ0ZXN0cy9icGYgLS0gbm8KPiByZWdyZXNzaW9ucywgYW5kIGFmdGVy
IHRoZSBwYXRjaCBpcyBhcHBsaWVkIG1vcmUgdGVzdHMgcGFzc2VzLiBZYXkhCj4gCj4gT24gYSBy
ZWxhdGVkIG5vdGUuIFRoZSBSSVNDLVYgc2VsZnRlc3RzL2JwZiBpcyBpbiBhIHByZXR0eSBsb3Vz
eQo+IHN0YXRlLiBJJ2xsIHNlbmQgYSBjbGVhbnVwIHBhdGNoIGZvciB0aGVtIHNvb25pc2guIEUu
Zy46CgpUaGFua3MgZm9yIHRlc3RpbmchCgo+ICogUklTQy1WIGlzIG1pc3NpbmcgaW4gYnBmX3Ry
YWNpbmcuaCAobGliYnBmKQo+ICogU29tZSBwcm9ncmFtcyBkb24ndCBjb252ZXJnZSBpbiAxNiBz
dGVwcywgSSBoYWQgdG8gaW5jcmVhc2UgaXQgdG8gfjMyCj4gKiBUaGUgc2VsZnRlc3QvYnBmIE1h
a2VmaWxlIG5lZWRlZCBzb21lIFJWIHNwZWNpZmljIGNoYW5nZXMKPiAqIC4uLmEgbG90IG9mIHRl
c3RzIHN0aWxsIGRvbid0IHBhc3MsIGFuZCBuZWVkcyB0byBiZSBsb29rZWQgaW4gdG8KClNvdW5k
cyBnb29kLCBwbGVhc2Ugc2hpcCB0aGVtLiA7KQoKPiBGZWVsIGZyZWUgdG8gYWRkOgo+IAo+IEFj
a2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKQXBwbGllZCwgdGhhbmtz
ISBUb25nLCBpZiB5b3UgaGF2ZSBhIGNoYW5jZSwgcGxlYXNlIGZvbGxvdyB1cCB3aXRoIE1hcmsn
cwpzdWdnZXN0aW9uIHRvIGFsaWduIHRoZSBleHRhYmxlIGluZnJhIHRvIGFybTY0L3g4Ni4KClRo
YW5rcywKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
