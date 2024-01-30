Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F223C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXR/KDr2oOgzKBjnURGh5gCeP4bnnCVLDfNuvTjYW9I=; b=du7ci56+F/7RvE
	1ZymzSNI4suyzdYFA8+kkA71i6szs+A2SCtRzggKiAii8XQDwsgv1RG6xui+VPGkzpCDX4d7lPZYb
	mGeLoRYjBDemSm0B0djfLTWMi+/FH7HeprI+LN9X+3iqseSpiANonhv+EYQULPIf8bPJhhhZKBkCh
	Z66wiHIrvLYEtnkxjXu2s0tbspJpuVAXDN/8CPIsTdCrxSi/k61j/DVIKFC0Kx6A9fPge1jKFE+D+
	wOb4l6RB5qyI75bkX43MTlrTwYX/ui6zOtnb7Ztlcx+1wh4t/zv2+HR40e7F9+txA1TStjv/RK6+A
	2W8CVjO+fciBrYSSf4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUoAP-0000000GqmM-0cjM;
	Tue, 30 Jan 2024 13:28:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUoAL-0000000GqlA-3BWb
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 13:28:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7CDB6CE18E6;
	Tue, 30 Jan 2024 13:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C23C433F1;
	Tue, 30 Jan 2024 13:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706621318;
	bh=P4Ed6bty5NrlB1PskKxS7173sQNawPnBy3pGH9uH4KI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U9YdX0AmBvQjbRCYBpRWPZQk8hXkRG2jvIgTquEFRwrJ0rsxgMk5QeRn01hHnY1zc
	 MYimbZyLY5TwEqgIPOrExIPMljS1+qiF7y9o/HUXD4YHk7WK7qKaxMY5EsuTk8jicK
	 VG0beVWkm0sP9uRgo5pcCwt2+TxwFoU/w/cc308x0MoBDB8AzOG6I2JO6vG54AOI9H
	 oc/dlWwQgc9+cM9vBVZQIsiVuYZ6BTHW/+5GezF+CAKMibhEfB3k7wZzG3lWtc5j+F
	 TT3+j2zXNPHrGgWH/gfkP6vvj05GSr7Or9XGfQPY3lw7xUo/oTT8KsRztwMzBi+4Fk
	 cFfn9t8MbZoIA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>
Subject: Re: [PATCH bpf-next 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
In-Reply-To: <5d776261-338b-4ebb-bb9b-1dbc91cd06c3@huawei.com>
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
 <87lecqobyb.fsf@all.your.base.are.belong.to.us>
 <4e73b095-0c08-4a6f-b2ee-8f7a071b14ee@huaweicloud.com>
 <87cytjusud.fsf@all.your.base.are.belong.to.us>
 <5d776261-338b-4ebb-bb9b-1dbc91cd06c3@huawei.com>
Date: Tue, 30 Jan 2024 14:28:35 +0100
Message-ID: <87zfwnympo.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_052842_188626_5439C5BF 
X-CRM114-Status: GOOD (  17.67  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4gd3JpdGVzOgoKPiBPbiAyMDI0LzEvMzAgMTY6
MjksIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3Vk
LmNvbT4gd3JpdGVzOgo+PiAKPj4+IE9uIDIwMjMvOS8yOCAxNzo1OSwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPj4+
Pgo+Pj4+PiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+Pj4+Pgo+Pj4+PiBJ
biB0aGUgY3VycmVudCBSVjY0IEpJVCwgaWYgd2UganVzdCBkb24ndCBpbml0aWFsaXplIHRoZSBU
Q0MgaW4gc3VicHJvZywKPj4+Pj4gdGhlIFRDQyBjYW4gYmUgcHJvcGFnYXRlZCBmcm9tIHRoZSBw
YXJlbnQgcHJvY2VzcyB0byB0aGUgc3VicHJvY2VzcywgYnV0Cj4+Pj4+IHRoZSBUQ0Mgb2YgdGhl
IHBhcmVudCBwcm9jZXNzIGNhbm5vdCBiZSByZXN0b3JlZCB3aGVuIHRoZSBzdWJwcm9jZXNzCj4+
Pj4+IGV4aXRzLiBTaW5jZSB0aGUgUlY2NCBUQ0MgaXMgaW5pdGlhbGl6ZWQgYmVmb3JlIHNhdmlu
ZyB0aGUgY2FsbGVlIHNhdmVkCj4+Pj4+IHJlZ2lzdGVycyBpbnRvIHRoZSBzdGFjaywgd2UgY2Fu
bm90IHVzZSB0aGUgY2FsbGVlIHNhdmVkIHJlZ2lzdGVyIHRvCj4+Pj4+IHBhc3MgdGhlIFRDQywg
b3RoZXJ3aXNlIHRoZSBvcmlnaW5hbCB2YWx1ZSBvZiB0aGUgY2FsbGVlIHNhdmVkIHJlZ2lzdGVy
Cj4+Pj4+IHdpbGwgYmUgZGVzdHJveWVkLiBTbyB3ZSBpbXBsZW1lbnRlZCBtaXhpbmcgYnBmMmJw
ZiBhbmQgdGFpbGNhbGxzCj4+Pj4+IHNpbWlsYXIgdG8geDg2XzY0LCBpLmUuIHVzaW5nIGEgbm9u
LWNhbGxlZSBzYXZlZCByZWdpc3RlciB0byB0cmFuc2Zlcgo+Pj4+PiB0aGUgVENDIGJldHdlZW4g
ZnVuY3Rpb25zLCBhbmQgc2F2aW5nIHRoYXQgcmVnaXN0ZXIgdG8gdGhlIHN0YWNrIHRvCj4+Pj4+
IHByb3RlY3QgdGhlIFRDQyB2YWx1ZS4gQXQgdGhlIHNhbWUgdGltZSwgd2UgYWxzbyBjb25zaWRl
ciB0aGUgc2NlbmFyaW8KPj4+Pj4gb2YgbWl4aW5nIHRyYW1wb2xpbmUuCj4+Pj4KPj4+PiBIaSEK
Pj4+Pgo+Pj4+IFRoZSBSSVNDLVYgSklUIHRyaWVzIHRvIG1pbmltaXplIHRoZSBzdGFjayB1c2Fn
ZSwgZS5nLiBpdCBkb2Vzbid0IGhhdmUgYQo+Pj4+IGZpeGVkIHByby9lcGlsb2d1ZSBsaWtlIHNv
bWUgb2YgdGhlIG90aGVyIEpJVHMuIEkgdGhpbmsgd2UgY2FuIGRvIGJldHRlcgo+Pj4+IGhlcmUs
IHNvIHRoYXQgdGhlIHBhc3MtVENDLXZpYS1yZWdpc3RlciBjYW4gYmUgdXNlZCwgYW5kIHRoZSBh
ZGRpdGlvbmFsCj4+Pj4gc3RhY2sgYWNjZXNzIGNhbiBiZSBhdm9pZGVkLgo+Pj4+Cj4+Pj4gVG9k
YXksIHRoZSBUQ0MgaXMgcGFzc2VkIHZpYSBhIHJlZ2lzdGVyIChhNikgYW5kIGNhbiBiZSB2aWV3
ZWQgYXMgYQo+Pj4+ICJzdGF0ZSIgdmFyaWFibGUvdHJhbnNwYXJlbnQgYXJndW1lbnQvcmV0dXJu
IHZhbHVlLiBBcyB5b3UgcG9pbnQgb3V0LCB3ZQo+Pj4+IGxvb3NlIHRoaXMgd2hlbiB3ZSBkbyBh
IGNhbGwuIE9uIChhbnkpIGNhbGxzIHdlIG1vdmUgdGhlIFRDQyB0byBhCj4+Pj4gY2FsbGVlLXNh
dmVkIHJlZ2lzdGVyLgo+Pj4+Cj4+Pj4gV0RZVCBhYm91dCB0aGUgZm9sbG93aW5nIHNjaGVtZToK
Pj4+Pgo+Pj4+IDEgUGlja3VwIHRoZSBhcm02NCBicGYyYnBmL3RhaWxtaXggbWVjaGFuaXNtIG9m
IGp1c3QgY2xlYXJpbmcgdGhlIFRDQwo+Pj4+ICAgICBmb3IgdGhlIG1haW4gcHJvZ3JhbS4KPj4+
PiAyIEZvciBCUEYgaGVscGVyIGNhbGxzLCBtb3ZlIFRDQyB0byBzNiwgcGVyZm9ybSB0aGUgY2Fs
bCwgYW5kIHJlc3RvcmUKPj4+PiAgICAgYTYuIERpdG8gZm9yIGtmdW5jIGNhbGxzIChCUEZfUFNF
VURPX0tGVU5DX0NBTEwpLgo+Pj4+IDMgRm9yIGFsbCBvdGhlciBjYWxscywgYTYgaXMgcGFzc2Vk
IHRyYW5zcGFyZW50bHkuCj4+Pj4KPj4+PiBGb3IgMiBicGZfaml0X2dldF9mdW5jX2FkZHIoKSBj
YW4gYmUgdXNlZCB0byBkZXRlcm1pbmUgaWYgdGhlIGNhbGxlZSBpcwo+Pj4+IGEgQlBGIGhlbHBl
ciBvciBub3QuCj4+Pj4KPj4+PiBJbiBzdW1tYXJ5OyBEZXRlcm1pbmUgaW4gdGhlIEpJVCBpZiB3
ZSdyZSBsZWF2aW5nIEJQRi1sYW5kLCBhbmQgbmVlZCB0bwo+Pj4+IG1vdmUgdGhlIFRDQyB0byBh
IGNhbGxlZS1zYXZlZCByZWcsIG9yIG5vdCwgYW5kIHNhdmUgdXMgYSBidW5jaCBvZiBzdGFjawo+
Pj4+IHN0b3JlL2xvYWRzLgo+Pj4+Cj4+Pgo+Pj4gVmFsdWFibGUgc2NoZW1lLiBCdXQgd2UgbmVl
ZCB0byBjb25zaWRlciBUQ0MgYmFjayBwcm9wYWdhdGlvbi4gTGV0IG1lCj4+PiBzaG93IGFuIGV4
YW1wbGUgb2YgY2FsbGluZyBzdWJwcm9nIHdpdGggVENDIHN0b3JlZCBpbiBBNjoKPj4+Cj4+PiBw
cm9nMShUQ0M9PTEpewo+Pj4gICAgICAgc3VicHJvZzEoVENDPT0xKQo+Pj4gICAgICAgICAgIC0+
IHRhaWxjYWxsMShUQ0M9PTApCj4+PiAgICAgICAgICAgICAgIC0+IHN1YnByb2cyKFRDQz09MCkK
Pj4+ICAgICAgIHN1YnByb2czKFRDQz09MCkgPC0tLSBzaG91bGQgYmUgVENDPT0xCj4+PiAgICAg
ICAgICAgLVwtPiB0YWlsY2FsbDIgPC0tLSBjYW4ndCBiZSBjYWxsZWQKPj4+IH0KPgo+IExldCdz
IGJhY2sgd2l0aCB0aGlzIGV4YW1wbGUgYWdhaW4uIEltYWdpbmUgdGhhdCB0aGUgdGFpbGNhbGwg
Y2hhaW4gaXMgYSAKPiBsaXN0IGxpbWl0ZWQgdG8gMzMgZWxlbWVudHMuIFdoZW4gdGhlIGxpc3Qg
aGFzIDMyIGVsZW1lbnRzLCB3ZSBjYWxsIAo+IHN1YnByb2cxIGFuZCB0aGVuIHRhaWxjYWxsMS4g
QXQgdGhpcyB0aW1lLCB0aGUgbGlzdCBlbGVtZW50cyBjb3VudCAKPiBiZWNvbWVzIDMzLiBUaGVu
IHdlIGNhbGwgc3VicHJvZzIgYW5kIHJldHVybiBwcm9nMS4gQXQgdGhpcyB0aW1lLCB0aGUgCj4g
bGlzdCByZW1vdmVzIDEgZWxlbWVudCBhbmQgYmVjb21lcyAzMiBlbGVtZW50cy4gQXQgdGhpcyB0
aW1lLCB0aGVyZSAKPiBzdGlsbCBjYW4gcGVyZm9ybSAxIHRhaWxjYWxsLgo+Cj4gSSd2ZSBhdHRh
Y2hlZCBhIGRpYWdyYW0gdGhhdCBzaG93cyBtaXhpbmcgdGFpbGNhbGwgYW5kIHN1YnByb2dzIGlz
IAo+IG5lYXJseSBhICJjYWxsIi4gSXQgY2FuIHJldHVybiB0byBjYWxsZXIgZnVuY3Rpb24uCgpI
bW0uIExldCBtZSBwdXQgbXkgUSBpbiBhbm90aGVyIHdheS4KClRoZSBrZXJuZWwgY2FsbHMgaW50
byBCUEZfUFJPR19SVU4oKSAofmEgQlBGIGNvbnRleHQpLiBXb3VsZCBpdCBldmVyIGJlCk9LIHRv
IGRvIG1vcmUgdGhhbiAzMyB0YWlsIGNhbGxzLCByZWdhcmRsZXNzIG9mIHN1YnByb2dzIG9yIG5v
dD8KCkluIHlvdXIgZXhhbXBsZSwgVENDIGlzIDEuIFlvdSBhcmUgYWxsb3dlZCB0byBwZXJmb3Jt
IG9uZSB0YWlsIGNhbGwuIEluCnlvdXIgZXhhbXBsZSBwcm9nMSBwZXJmb3JtcyB0d28uCgpNeSB2
aWV3IG9mIFRDQyBoYXMgYWx3YXlzIGJlZW4gfmEgY291bnRlciBvZiB0aGUgbnVtYmVyIG9mIHRh
aWxjYWxsc34uCgpXaXRoIHlvdXIgZXhhbXBsZSBleHBhbmRlZDoKcHJvZzEoVENDPT0zMyl7CiAg
ICAgIHN1YnByb2cxKFRDQz09MzMpCiAgICAgICAgICAtPiB0YWlsY2FsbDEoVENDPT0zMykgLT4g
dGFpbGNhbGwxKFRDQz09MzIpIC0+IHRhaWxjYWxsMShUQ0M9PTMxKSAtPiAuLi4gLy8gMzMgdGlt
ZXMKICAgICAgLy8gTGVodWkgc2F5cyBUQ0Mgc2hvdWxkIGJlIDMzIGFnYWluLgogICAgICAvLyBC
asO2cm4gc2F5cyAiaXQncyB0aGUgbnVtYmVyIG9mIHRhaWxjYWxscyIsIGFuZCBzdWJwcm9nMyBj
YW5ub3QgcGVyZm9ybSBhIHRhaWwgY2FsbAogICAgICBzdWJwcm9nMyhUQ0M9PT8pCiAgICAgICAg
ICAKTXkgdmlldyBoYXMsIGFnYWluLCBiZWVuIHRoYW4gVENDIGlzIGEgcnVuLXRpbWUgY291bnQg
b2YgdGhlIG51bWJlcgp0YWlsY2FsbHMgKGZlbnRyeS9mZXhpdCBwYXRjaCBicGYtcHJvZ3JhbXMg
aW5jbHVkZWQpLgoKV2hhdCBkb2VzIHg4NiBhbmQgYXJtNjQgZG8/CgoKQmrDtnJuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
