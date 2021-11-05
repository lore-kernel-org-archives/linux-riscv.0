Return-Path: <SRS0=deyN=PY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED66C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 16:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4368A61245
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 16:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4368A61245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soRWxyGI0Az5AZh1ejjhBp1nRxGA3Si77iHpEnlamR8=; b=h1WBPmKVHR0T4HUtCLobAYSPQs
	G2ZhBQ1npCfMi3Pr6Np4Bufb5aPjL+u/AcqDCgNFg4Ko3ijFz9GwKkYssyNCZPDV6fr9WDyLC8vTQ
	6NRzdscmXj/AEaa5qUMnrLgsX1D38B3lf4l5Cd4GD4eDexzi42t73wq0wBf889bwYz9peqq6CsD10
	RyRUl+Qk4pdcuTX4//eY2+P1v+/IVYzjd7ug+hkMEfrwNVHL6DSgyhk9TVh8myc6SN+9llZ+8GxN2
	jv98isSO28A8adB0+LcWZz5A3k0UfLtCucUrOxjo+7vsGyrLJBBL8UZxS3r+fV794qahMWwyitXTL
	8PdXA8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj1dO-00Bs2a-6r; Fri, 05 Nov 2021 16:00:06 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj1dH-00Brxn-IA
 for linux-riscv@lists.infradead.org; Fri, 05 Nov 2021 16:00:01 +0000
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1mj1d4-000ASG-G8; Fri, 05 Nov 2021 16:59:46 +0100
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1mj1d4-00007b-8a; Fri, 05 Nov 2021 16:59:46 +0100
Subject: Re: [PATCH bpf-next] riscv, bpf: Fix RV32 broken build, and silence
 RV64 warning
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 jszhang@kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Netdev <netdev@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, Tong Tiangen <tongtiangen@huawei.com>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20211103115453.397209-1-bjorn@kernel.org>
 <f98b15c9-bd06-267e-e404-ae4f607d8740@iogearbox.net>
 <CAJ+HfNg9Ko93D1M5En8wv4f-7j_by=OwnewRDiM+xQ0EZLw06w@mail.gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <53fbebfd-f786-9b21-3477-437395e3e023@iogearbox.net>
Date: Fri, 5 Nov 2021 16:59:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAJ+HfNg9Ko93D1M5En8wv4f-7j_by=OwnewRDiM+xQ0EZLw06w@mail.gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.3/26344/Fri Nov  5 09:18:44 2021)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_085959_668505_F8211822 
X-CRM114-Status: GOOD (  16.30  )
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

T24gMTEvMy8yMSAyOjM1IFBNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IE9uIFdlZCwgMyBOb3Yg
MjAyMSBhdCAxNDoxNSwgRGFuaWVsIEJvcmttYW5uIDxkYW5pZWxAaW9nZWFyYm94Lm5ldD4gd3Jv
dGU6Cj4+IE9uIDExLzMvMjEgMTI6NTQgUE0sIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+PiBDb21t
aXQgMjUyYzc2NWJkNzY0ICgicmlzY3YsIGJwZjogQWRkIEJQRiBleGNlcHRpb24gdGFibGVzIikg
b25seQo+Pj4gYWRkcmVzc2VkIFJWNjQsIGFuZCBicm9rZSB0aGUgUlYzMiBidWlsZCBbMV0uIEZp
eCBieSBnYXRpbmcgdGhlIGV4Y2VwdGlvbgo+Pj4gdGFibGVzIGNvZGUgd2l0aCBDT05GSUdfQVJD
SF9SVjY0SS4KPj4+Cj4+PiBGdXJ0aGVyLCBzaWxlbmNlIGEgIi1XbWlzc2luZy1wcm90b3R5cGVz
IiB3YXJuaW5nIFsyXSBpbiB0aGUgUlY2NCBCUEYKPj4+IEpJVC4KPj4+Cj4+PiBbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGx2bS8yMDIxMTEwMjA2MTAuOW95OVJyMEctbGtwQGludGVsLmNv
bS8KPj4+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sbHZtLzIwMjExMDI5MDMzNC4yemRN
eVJxNC1sa3BAaW50ZWwuY29tLwo+Pj4KPj4+IEZpeGVzOiAyNTJjNzY1YmQ3NjQgKCJyaXNjdiwg
YnBmOiBBZGQgQlBGIGV4Y2VwdGlvbiB0YWJsZXMiKQo+Pj4gU2lnbmVkLW9mZi1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4gVG9uZy9EYW5pZWw6IFRoZSBS
VjMyIGJ1aWxkIGhhcyBiZWVuIGJyb2tlbiBzaW5jZSBUaHVyc2RheS4gSSdsbCB0cnkKPj4+IHRv
IGZhc3QtdHJhY2sgYSBiaXQsIGFuZCBjb21taXQgYSBxdWljay1maXggZm9yIGl0LiBIb3BlIHRo
YXQncyBPSwo+Pj4gd2l0aCB5b3UsIFRvbmchCj4+Pgo+Pj4gSSd2ZSB2ZXJpZmllZCB0aGUgYnVp
bGQgb24gbXkgbWFjaGluZSB1c2luZyByaXNjdjMyIEdDQyA5LjMuMCBhbmQKPj4+IHJpc2N2NjQg
R0NDIDExLjIuMC4KPj4KPj4gVGhhbmtzIGZvciB0aGUgZml4IEJqb3JuIQo+PgpbLi4uXQo+Pj4g
K2ludCBydl9icGZfZml4dXBfZXhjZXB0aW9uKGNvbnN0IHN0cnVjdCBleGNlcHRpb25fdGFibGVf
ZW50cnkgKmV4LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MpOwo+Pgo+PiBJJ20gb2theSB0byB0YWtlIHRoaXMgYXMgYSBxdWljayBmaXgsIGJ1
dCBpZiBpdHMgbm90IHRvbyBtdWNoIGhhc3NsZSwgY291bGQgd2UgYWRkIGEKPj4gYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9leHRhYmxlLmggaW4gc2ltaWxhciBmYXNoaW9uIGxpa2UgYXJtNjQgb3Ig
eDg2IHdoZXJlIHdlIG1vdmUKPj4gdGhlIGV4X2hhbmRsZXJfYnBmKCkgc2lnbmF0dXJlIHRoZXJl
LCBkaWQgeW91IGhhdmUgYSBjaGFuY2UgdG8gY2hlY2s/Cj4gCj4gT0shIEkndmUgbm90IGxvb2tl
ZCBpbnRvIGl0IHlldCEKPiAKPiBUaGVyZSdzIGEgcGF0Y2ggb3V0IGZyb20gSmlzaGVuZyBvbiB0
aGUgUlYgbGlzdCwgd2hpY2ggaXMgc3RhcnRpbmcKPiBzb21lIGNvbnNvbGlkYXRpb24gd29yayBb
MV0uCj4gCj4gQEppc2hlbmcgV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgYWRkaW5nIHR5cGUvaGFu
ZGxlcnMgWzIsM10gYXMKPiBhcm02NC94ODYgcmVjZW50bHkgZGlkLCB0byB5b3VyIHNlcmllcz8K
CkZ5aSwgQmpvcm4sIHRvb2sgeW91ciBmaXggaW50byBicGYgc28gd2UgY2FuIG1vdmUgZm9yd2Fy
ZCB3cnQgYnJva2VuIGJ1aWxkICYgd2FybmluZwpnaXZlbiBpdHMgc21hbGwgYW55d2F5IGFuZCBJ
J20gZG9pbmcgYnBmIFBSIHZlcnkgc29vbiB0b2RheS4gRWl0aGVyIHdheSwgSmlzaGVuZywgeW91
Cm9yIFRvbmcgY2FuIGZvbGxvdy11cCBsb29raW5nIGludG8gdGhlIGV4dGFibGUgc3RyZWFtbGlu
aW5nIHdydCBhcm02NC94ODYuIFRoYW5rcyEKCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjExMDIyMDAxOTU3LjFlYmE4ZjA0QHhoYWNrZXIvCj4gWzJdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMTEwMTkxNjAyMTkuNTIwMi0x
MS1tYXJrLnJ1dGxhbmRAYXJtLmNvbS8KPiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDIxMDkwODEzMjUyNS4yMTE5NTg3MjVAbGludXRyb25peC5kZS8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
