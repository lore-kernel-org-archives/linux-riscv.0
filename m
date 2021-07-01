Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B47C11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 19:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E0F61410
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 19:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43E0F61410
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vqqy3y8EUVGDQ7mtMSbT4W2Y2YrmOn9+dUfIsqptv9M=; b=u0nHUfKMkwpNU/hW9DIebwv0v2
	Ejo5RiUuO1itgkSBbSsdwI5qO6rEDlpr5W2YMYSI+3QS0MMWmfQToD91OhSw0WdJc8evhaLIHdPqH
	h98ENsm2i5qQOGCXj/0ksb4VDI3MqsUXy4xpGEe6ixfDA1g8ghCAoY5JZkvGH0d6DTfx9GzxeSZDo
	RfAH9VrTlcqCqFMn+IlOPUc9hLVS4V3flhmM0QO2rKwxavFpbJS+a5F8m0pRVBwhznYTjQKhCy6JB
	JFA/p8O34FF+MG3rSmQ/Np74A8PXBFzwMYs9d7mdxNcGqpSdzx9BYsDKehOOSZqZysh8GJcAxSt9q
	aH0I59rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz1zw-000qA2-B7; Thu, 01 Jul 2021 19:05:16 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz1zs-000q8i-R2
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 19:05:14 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 192381C0009;
 Thu,  1 Jul 2021 19:05:04 +0000 (UTC)
Subject: Re: [PATCH 1/3] riscv: Fix memory_limit for 64-bit kernel
From: Alex Ghiti <alex@ghiti.fr>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210629091349.3802690-1-alex@ghiti.fr>
 <6a38fb9a-d658-836b-4ff4-7c47cadb7db0@huawei.com>
 <8e1bef59-8a65-dfdf-d09d-f578323348be@ghiti.fr>
Message-ID: <86866409-50a9-1974-6bcd-30d66945b238@ghiti.fr>
Date: Thu, 1 Jul 2021 21:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8e1bef59-8a65-dfdf-d09d-f578323348be@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_120513_069202_BD023126 
X-CRM114-Status: GOOD (  18.90  )
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

TGUgMS8wNy8yMDIxIMOgIDIxOjAxLCBBbGV4IEdoaXRpIGEgw6ljcml0wqA6Cj4gTGUgMS8wNy8y
MDIxIMOgIDEyOjQ0LCBLZWZlbmcgV2FuZyBhIMOpY3JpdMKgOgo+Pgo+PiBPbiAyMDIxLzYvMjkg
MTc6MTMsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+IEFzIGRlc2NyaWJlZCBpbiBEb2N1bWVu
dGF0aW9uL3Jpc2N2L3ZtLWxheW91dC5yc3QsIHRoZSBlbmQgb2YgdGhlCj4+PiB2aXJ0dWFsIGFk
ZHJlc3Mgc3BhY2UgZm9yIDY0LWJpdCBrZXJuZWwgaXMgb2NjdXBpZWQgYnkgdGhlIG1vZHVsZXMv
QlBGLwo+Pj4ga2VybmVsIG1hcHBpbmdzIHNvIHRoaXMgYWN0dWFsbHkgcmVkdWNlcyB0aGUgYW1v
dW50IG9mIG1lbW9yeSB3ZSBhcmUgCj4+PiBhYmxlCj4+PiB0byBtYXAgYW5kIHRoZW4gdXNlIGlu
IHRoZSBsaW5lYXIgbWFwcGluZy4gU28gbWFrZSBzdXJlIHRoaXMgbGltaXQgaXMKPj4+IGNvcnJl
Y3RseSBzZXQuCj4+Pgo+Pj4gRml4ZXM6IGM5ODExZTM3OWIyMSAoInJpc2N2OiBBZGQgbWVtIGtl
cm5lbCBwYXJhbWV0ZXIgc3VwcG9ydCIpCj4+Cj4+Cj4+IFNob3VsZCB0aGUgRml4ZXMgdGFnIGJl
IGRlMDQzZGEwYjllNyDvvIjigJxSSVNDLVY6IEZpeCB1c2FnZSBvZiAKPj4gbWVtYmxvY2tfZW5m
b3JjZV9tZW1vcnlfbGltaXTigJzvvIksCj4+Cj4+IFRoZSAtUEFHRV9PRkZTRVQgaXMgc2V0IHRv
IHRoZSBtYXhpbWFsIHBoeXNpY2FsIG1lbW9yeSBmcm9tIHRoaXMgcG9pbnQgOikKPiAKPiBPb3Bz
LCB0aGFuayB5b3UhCgpBY3R1YWxseSB0aGUgY29tbWl0IHlvdSBtZW50aW9uZWQgd2FzIG1lcmdl
ZCB3YXkgYmVmb3JlIEkgbW92ZWQgdGhlIAprZXJuZWwgdG8gdGhlIGVuZCBvZiB0aGUgYWRkcmVz
cyBzcGFjZSwgc28gdGhlIHByb3BlciBGaXhlcyB0YWcgc2hvdWxkIGJlOgoKRml4ZXM6IDJiZmM2
Y2Q4MWJkMSAoInJpc2N2OiBNb3ZlIGtlcm5lbCBtYXBwaW5nIG91dHNpZGUgb2YgbGluZWFyIG1h
cHBpbmciKQoKVGhhbmtzIGFueXdheSwKCj4gCj4gQWxleAo+IAo+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgo+Pj4gLS0tCj4+PiDCoCBhcmNoL3Jp
c2N2L21tL2luaXQuYyB8IDExICsrKysrKysrKy0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+PiBpbmRleCAxMmY5NTZiM2E2
NzQuLjA0YTVkYjNhOTc4OCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+
PiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+Pj4gQEAgLTEyNCwxMCArMTI0LDE3IEBAIHZv
aWQgX19pbml0IG1lbV9pbml0KHZvaWQpCj4+PiDCoCB9Cj4+PiDCoCAvKgo+Pj4gLSAqIFRoZSBk
ZWZhdWx0IG1heGltYWwgcGh5c2ljYWwgbWVtb3J5IHNpemUgaXMgLVBBR0VfT0ZGU0VULAo+Pj4g
LSAqIGxpbWl0IHRoZSBtZW1vcnkgc2l6ZSB2aWEgbWVtLgo+Pj4gKyAqIFRoZSBkZWZhdWx0IG1h
eGltYWwgcGh5c2ljYWwgbWVtb3J5IHNpemUgaXMgLVBBR0VfT0ZGU0VUIGZvciAKPj4+IDMyLWJp
dCBrZXJuZWwsCj4+PiArICogd2hlcmVhcyBmb3IgNjQtYml0IGtlcm5lbCwgdGhlIGVuZCBvZiB0
aGUgdmlydHVhbCBhZGRyZXNzIHNwYWNlIAo+Pj4gaXMgb2NjdXBpZWQKPj4+ICsgKiBieSB0aGUg
bW9kdWxlcy9CUEYva2VybmVsIG1hcHBpbmdzIHdoaWNoIHJlZHVjZXMgdGhlIGF2YWlsYWJsZSAK
Pj4+IHNpemUgb2YgdGhlCj4+PiArICogbGluZWFyIG1hcHBpbmcuCj4+PiArICogTGltaXQgdGhl
IG1lbW9yeSBzaXplIHZpYSBtZW0uCj4+PiDCoMKgICovCj4+PiArI2lmZGVmIENPTkZJR182NEJJ
VAo+Pj4gK3N0YXRpYyBwaHlzX2FkZHJfdCBtZW1vcnlfbGltaXQgPSAtUEFHRV9PRkZTRVQgLSBT
Wl80RzsKPj4+ICsjZWxzZQo+Pj4gwqAgc3RhdGljIHBoeXNfYWRkcl90IG1lbW9yeV9saW1pdCA9
IC1QQUdFX09GRlNFVDsKPj4+ICsjZW5kaWYKPj4+IMKgIHN0YXRpYyBpbnQgX19pbml0IGVhcmx5
X21lbShjaGFyICpwKQo+Pj4gwqAgewo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
