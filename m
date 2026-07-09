Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848EEC44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wj1zx2KSvmy9hPZUFA/MQGsM3JEA6oBSPYx9XNlPBSM=; b=ql2+9j0M66r7MT
	lyYo5pQwa37dXHqVPRWcVlsT9JM+GXDvoHr7gknQNgLohZlbTw5XhEJP+3atDl9B0wrktGQejw7HO
	tjMTv7VwdCEtvmTh3f2ZjbUKQPl0VJAuxo8r95kTaKCX/0wgCtMszjix1qh31y6QO6rwh6iTTBizw
	91+ce/M3rCh+IcW5C0p+0tMHPvK8y3Tit1zHY1pcVuvQFFlzOT+37uNLvA+sWSl+N8nG484XVbjtc
	ae2lkYC9FOlZbZrqb72yScBO8pOOlEoKGpCMf7PZr220imNflHABNF8pICGNSG0hV+xZ5WTcQCGWX
	0Qi4Jc04mhAfhrwKMatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whumj-00000003WVF-2mxo;
	Thu, 09 Jul 2026 19:51:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whumi-00000003WV7-2PPH
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 19:51:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10D2B43D11
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jul 2026 19:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52141F00ACF
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jul 2026 19:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783626707;
	bh=kBZwb2cRE68I1czVBQGrvfPjZQW9fylv6EksNu1C5sY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bnj1QrJMofrGHPUBoKhNDozC1fobzi4qoKI68gCP5CuljjsONokCwiyppJUZAKzek
	 xU6nHi1xMkn6h8XP/5UuD44nhfxuDGOQql4T+JhmOwE/df3J2L/GnNHXNRUnZHNWxV
	 nXlJ3jl5nMvHvGyHtUd/GvF9mb/fOD+joo6dtO1yd5p5b7aoZ1qeZf7aLgDh0i2mRr
	 elGh2MFpb/8ymTLon4qlRW79IwmyuloznbZDXBnmJAzpJViCPiQJR7KsOo9H4yb2Cn
	 RugKCXPluXE1TX/UxklTA6Xc2V44iuT4sWK70magqmZ7QsKLQk7ZKB3/FyvBVVdM97
	 bWonxzN54Isuw==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80cebd41372so2525577b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 12:51:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpMQQRRGEmbpCabxLceWxxtM/4XF35Nkwo+Y/Fbx0segCknlvMZQQn2eUpWME3WuUHvEgvPO3LLpQQEIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfQHiTYSp8NY9vZKXYcKWyeOPSQKjXfucPJ2gPnfKxQmJrX1El
	vRAWiJIcpsUr2bzgMdcOE1/5roTEMk1fcwVPS/ZXSUZ7l1504mzuYNcILZDYpqaxQb/sh4IjK0n
	9QQPisWLXeNCwsjkRXQrCF04FRWHX2jU=
X-Received: by 2002:a05:690c:6982:b0:81d:3b37:30c1 with SMTP id
 00721157ae682-81dbeb62c28mr66172477b3.58.1783626707206; Thu, 09 Jul 2026
 12:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260708064436.2971933-7-pulehui@huaweicloud.com>
 <a721df30ec2f824295000183c8e91f2c19d0bd56ae115b835b402be9eacc1c71@mail.kernel.org>
 <b4aadfde-9745-4c71-8dd4-ce433331f91b@huaweicloud.com> <CAJ+HfNi_icVbeB=jw-xnXrwzigZwP2OVRbzaF3VC87i6fDpdDw@mail.gmail.com>
 <fc972c33-1b66-4979-97e9-71627fb6179f@huaweicloud.com>
In-Reply-To: <fc972c33-1b66-4979-97e9-71627fb6179f@huaweicloud.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Thu, 9 Jul 2026 21:51:36 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNgPWwX3dfu=62TSMKeLD8m9S0rc2k9G8rVN7r2SuzQ6MQ@mail.gmail.com>
X-Gm-Features: AUfX_mzRdJWsTfK-NsIC-FwuP0A4MWVi9F1vZPgfsDKDjIV5ebRacxEBUg4UWps
Message-ID: <CAJ+HfNgPWwX3dfu=62TSMKeLD8m9S0rc2k9G8rVN7r2SuzQ6MQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 6/7] riscv, bpf: Mixing bpf2bpf and tailcalls
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com, martin.lau@kernel.org, 
	clm@meta.com, ihor.solodrai@linux.dev
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

T24gVGh1LCA5IEp1bCAyMDI2IGF0IDE3OjA5LCBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91
ZC5jb20+IHdyb3RlOgo+Cj4KPiBPbiAyMDI2LzcvOSAxOTozNywgQmrDtnJuIFTDtnBlbCB3cm90
ZToKPiA+IFNvcnJ5IGZvciB0aGUgZGVsYXkgaGVyZSAtLSB0aGUgYm90IGhhZCBtZSB0aGlua2lu
ZyBhIGJpdC4KPiA+Cj4gPiBPbiBXZWQsIDggSnVsIDIwMjYgYXQgMTA6NTQsIFB1IExlaHVpIDxw
dWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JvdGU6Cj4gPgo+ID4gLi4uCj4gPgo+ID4+PiBUaGlz
IGFzc3VtZXMgYSBmaXhlZCBudW1iZXIgb2YgaW5zdHJ1Y3Rpb25zIGJlZm9yZSB0aGUgdGFpbGNh
bGwgZW50cnkKPiA+Pj4gcG9pbnQuIFdoZW4gaXNfc3VicHJvZyBpcyB0cnVlLCB0aGUgcnZfYWRk
aSgpIGluc3RydWN0aW9uIGlzIG5vdCBlbWl0dGVkLAo+ID4+PiB3aGljaCBtZWFucyB0aGUgdGFp
bGNhbGwgZW50cnkgcG9pbnQgbW92ZXMgZm9yd2FyZCBieSA0IGJ5dGVzIHJlbGF0aXZlIHRvCj4g
Pj4+IHdoZXJlIFJWX1RBSUxDQUxMX09GRlNFVCBleHBlY3RzIGl0IHRvIGJlLgo+ID4+Pgo+ID4+
PiBUaGUgdGFpbGNhbGwgZW50cnkgaXMgdXNlZCBpbiBlbWl0X2JwZl90YWlsX2NhbGwoKSB3aGVu
IGNhbGN1bGF0aW5nIHRoZQo+ID4+PiBqdW1wIHRhcmdldCBmb3IgdGhlIHRhaWwgY2FsbC4gSWYg
UlZfVEFJTENBTExfT0ZGU0VUIGRvZXNuJ3QgYWNjb3VudCBmb3IKPiA+Pj4gdGhlIGNvbmRpdGlv
bmFsIGVtaXNzaW9uLCBjb3VsZCB0aGlzIGNhdXNlIHRoZSB3cm9uZyBlbnRyeSBwb2ludCB0byBi
ZQo+ID4+PiB1c2VkIHdoZW4gdGFpbCBjYWxsaW5nIGludG8gc3VicHJvZ3JhbXM/Cj4gPj4KPiA+
PiBUaGlzIGlzIG5vdCBhbiBpc3N1ZSwgc3VicHJvZyBjYW4gbm90IGJlIHRoZSB0YWlsY2FsbCBj
YWxsZWUuCj4gPgo+ID4gU2F5LCB0aGF0IHdlIGhhdmUgYW4gZW50cnkgZnVuY3Rpb24gdGhhdCBk
b2VzIGJwZl9mb3JfZWFjaF9tYXBfYXJyYXkoKQo+ID4gaW50byBhIGNhbGxiYWNrIGNiKCkuIGNi
KCkgaXMgYSBzdWJwcm9ncmFtLCBzbyBubyBpbml0IG9mIFRDQy4gTm93LAo+ID4gY2IoKSBjYWxs
cyBhbm90aGVyIHN1YnByb2dyYW0gdGhhdCBkb2VzIGEgdGFpbGNhbGwuCj4gPgo+ID4gVGhlIGNh
bGxiYWNrIHRvIGNiKCkgaXMgY29taW5nIGZyb20gdGhlIGtlcm5lbCwgc28gYTYgY291bGQgaGF2
ZSBiZWVuCj4gPiBjbG9iYmVyZWQsIG5vPyBXZSdyZSBlbnRlcmluZyBhIHN1YnByb2dyYW0gY29t
aW5nIGZyb20gdGhlIEMgQUJJLiBOb3csCj4gPiBpZiB0aGUgY2FsbGJhY2sgY2FsbHMgYSBzdWJw
cm9nIHRoYXQncyB0YWlsLWNhbGwgcmVhY2hhYmxlLCB0aGUgVENDCj4gPiBjYW4gYmUgZ2FyYmFn
ZT8KPgo+IFNhc2hpa28gcmVwb3J0ZWQgdGhlIHNhbWUgaXNzdWUgeWVzdGVyZGF5LiBJIHZlcmlm
aWVkIHRoYXQgdGhlIHZlcmlmaWVyCj4gcmVqZWN0cyBjYXNlcyB3aGVyZSBhIHRhaWwgY2FsbCBp
cyBpbnZva2VkIHdpdGhpbiBhIGNhbGxiYWNrOwo+IHNwZWNpZmljYWxseSwgd2hpbGUgdGhlIGNh
bGxiYWNrJ3MgcmV0dXJuIHZhbHVlIHJhbmdlIGlzIFswLCAxXSwgdGhlCj4gc2ltdWxhdGlvbiBv
ZiB0aGUgZXhpdCBwYXRoIGluIGBjaGVja19oZWxwZXJfY2FsbGAgKGhhbmRsaW5nIHRoZSB0YWls
Cj4gY2FsbCBoZWxwZXIpIG1hcmtzIFIwIGFzIFVOS05PV04sIGNhdXNpbmcgdGhlIHZlcmlmaWVy
IHRvIHJlamVjdCBpdOKAlHNvIEkKPiBkaWRuJ3QgaW52ZXN0aWdhdGUgZnVydGhlci4gSG93ZXZl
ciwgSSBqdXN0IHZlcmlmaWVkIHRoYXQgdGhlIHZlcmlmaWVyCj4gKmRvZXMqIGFjY2VwdCB0aGUg
c2NlbmFyaW8gd2hlcmUgYSBjYWxsYmFjayBjYWxscyBhIHN1YnByb2dyYW0sIGFuZCB0aGF0Cj4g
c3VicHJvZ3JhbSBzdWJzZXF1ZW50bHkgY2FsbHMgYSB0YWlsIGNhbGwuIEkgYmVsaWV2ZSB0aGlz
IHNjZW5hcmlvIG91Z2h0Cj4gdG8gYmUgcmVqZWN0ZWQ7IHBlcmhhcHMgc29tZSBjaGFuZ2VzIGFy
ZSBuZWVkZWQgaW4gdGhlIHZlcmlmaWVyLAo+IG90aGVyd2lzZSB0YWlsIGNhbGxzIG9uIG90aGVy
IGFyY2hpdGVjdHVyZXMgKGxpa2UgeDg2KSB3b3VsZCBhbHNvIGJlCj4gc3VzY2VwdGlibGUgdG8g
aW5maW5pdGUgbG9vcCBpc3N1ZXMuCgpUaGFua3MgZm9yIHRyeWluZyBpdCBvdXQhCgpPaywgc28g
c2VlbXMgbGlrZSB3ZSBuZWVkIGEgdmVyaWZpZXIgZml4IHByZS1sYW5kaW5nPwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
