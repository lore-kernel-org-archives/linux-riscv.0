Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2974BC001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 10:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQiJhB1I6eegsj7GTG9O02NOC1OV54FZoXiA/aPFJJ4=; b=JcvONyuWg289oo
	NFdoWqS5aICNte2zmaicH9EoZj9q4ZOHYxFof/+LP+f13eTH0R07WkB0/wmwxKwnjK1MpQDiJ6Uqw
	JVTpyARUzSadQyv/30sQoBHZTlPssx0HzVQWRPnY2+/awk9WSUAVcyqmIOhkMoYD92RaSxh2uTXNK
	8qpU8OsXjDagh8uPu+cTLK1M94qU2/3aVYFrAg2MCujTJpuOc4AAMk12Hg/yckk1blLeh89I8gM9Y
	eh8JYucoTQTFABy7OAEecguybrIEZnIiGsx7HlgfM9cKeQLpwQKJDjLxytnpYJ2p2hcYMKxq5vMP1
	vNq/002dKoMTJcJi7HLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUTT-00GgDJ-1G;
	Mon, 14 Aug 2023 10:06:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUTR-00GgCc-1D
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 10:06:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE2EB63D38;
	Mon, 14 Aug 2023 10:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46B3C433CA;
	Mon, 14 Aug 2023 10:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692007616;
	bh=sN0iD6JNy5wZ570D2k8jyG1PR68JPva0DnKLTcI1C7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D3Dg80dtZZTq9erXMoT+6YtBIN3BZ57BZY6bA8WegqWx9oifPcLDD+AOSeBQICEB1
	 GuU1c+Edch0xl6HpVgqdKeFstHV68hvocCYdc/1IXZZKbqv6wT6HqEwToMLego7jYh
	 aiar1N0lxiNLkst7pDOhChM7PuPZCB1lOnbTav/b33UOeAvRBvEu+zEIbpswz0VQ53
	 KF7n6zKUsABYsll+o3nDrjaok1jBT7PQOwyrPVv/jW37gwn/2izByzAz5V+IDlG49A
	 arLYTX6ltPZCeyFPjNCGgwLjMW+FI9/OGJnd9nnTfHpjcngNikoTPKiBf6L8+34NyW
	 u5SACaaaPUMuw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 pulehui@huawei.com, conor.dooley@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, yhs@fb.com, kpsingh@kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 0/2] bpf, riscv: use BPF prog pack allocator in
 BPF JIT
In-Reply-To: <CANk7y0jFHE7kX4LegSdoRrkLfWLwE0iawsAt6ktCniYCGbLdiQ@mail.gmail.com>
References: <20230720154941.1504-1-puranjay12@gmail.com>
 <87pm3qt2c8.fsf@all.your.base.are.belong.to.us>
 <CANk7y0jFHE7kX4LegSdoRrkLfWLwE0iawsAt6ktCniYCGbLdiQ@mail.gmail.com>
Date: Mon, 14 Aug 2023 12:06:53 +0200
Message-ID: <871qg6gcoy.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_030657_519639_65CD4DC6 
X-CRM114-Status: GOOD (  13.38  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+PiBJIGdldCBh
IGhhbmcgZm9yICJ0ZXN0X3RhZyIsIGJ1dCBpdCdzIG5vdCBkaXJlY3RseSByZWxhdGVkIHRvIHlv
dXIKPj4gc2VyaWVzLCBidXQgcmF0aGVyICJyZW1vdGUgZmVuY2UuaSIuCj4KPiBJIHdhcyBzZWVp
bmcgc29tZSBzdGFsbHMgbGlrZSB0aGlzIGV2ZW4gd2l0aG91dCBteSBzZXJpZXMgYnV0IGNvdWxk
bid0Cj4gZGVidWcgdGhlbSBhdCB0aGF0IHRpbWUuCgpZZWFoLCBJIHRoaW5rIGl0J3Mgbm90IHJl
bGF0ZWQgdG8geW91ciBzZXJpZXMgLS0gaXQncyBqdXN0IGEgZ29vZApyZXByb2R1Y2VyLiA7LSkK
Cj4+Cj4+ICAgfCByY3U6IElORk86IHJjdV9zY2hlZCBkZXRlY3RlZCBzdGFsbHMgb24gQ1BVcy90
YXNrczoKPj4gICB8IHJjdTogICAgICAgIDAtLi4uLjogKDE0MDAgdGlja3MgdGhpcyBHUCkgaWRs
ZT1kNWU0LzEvMHg0MDAwMDAwMDAwMDAwMDAwIHNvZnRpcnE9NTU0Mi81NTQyIGZxcz0xODYyCj4+
ICAgfCByY3U6ICAgICAgICAoZGV0ZWN0ZWQgYnkgMSwgdD01MjUyIGppZmZpZXMsIGc9MTAyNTMs
IHE9MTk1IG5jcHVzPTQpCj4+ICAgfCBUYXNrIGR1bXAgZm9yIENQVSAwOgo+PiAgIHwgdGFzazpr
d29ya2VyLzA6NSAgICAgc3RhdGU6UiAgcnVubmluZyB0YXNrICAgICBzdGFjazowICAgICBwaWQ6
MzE5ICAgcHBpZDoyICAgICAgZmxhZ3M6MHgwMDAwMDAwOAo+PiAgIHwgV29ya3F1ZXVlOiBldmVu
dHMgYnBmX3Byb2dfZnJlZV9kZWZlcnJlZAo+PiAgIHwgQ2FsbCBUcmFjZToKPj4gICB8IFs8ZmZm
ZmZmZmY4MGNiYzQ0ND5dIF9fc2NoZWR1bGUrMHgyZDAvMHg5NDAKPj4gICB8IHdhdGNoZG9nOiBC
VUc6IHNvZnQgbG9ja3VwIC0gQ1BVIzAgc3R1Y2sgZm9yIDIxcyEgW2t3b3JrZXIvMDo1OjMxOV0K
Pj4gICB8IE1vZHVsZXMgbGlua2VkIGluOiBubHNfaXNvODg1OV8xIGRybSBmdXNlIGkyY19jb3Jl
IGRybV9wYW5lbF9vcmllbnRhdGlvbl9xdWlya3MgYmFja2xpZ2h0IGRtX21vZCBjb25maWdmcyBp
cF90YWJsZXMgeF90YWJsZXMKPj4gICB8IENQVTogMCBQSUQ6IDMxOSBDb21tOiBrd29ya2VyLzA6
NSBOb3QgdGFpbnRlZCA2LjUuMC1yYzUgIzEKPj4gICB8IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZp
cnRpbyxxZW11IChEVCkKPj4gICB8IFdvcmtxdWV1ZTogZXZlbnRzIGJwZl9wcm9nX2ZyZWVfZGVm
ZXJyZWQKPj4gICB8IGVwYyA6IF9fc2JpX3JmZW5jZV92MDJfY2FsbC5pc3JhLjArMHg3NC8weDEx
YQo+PiAgIHwgIHJhIDogX19zYmlfcmZlbmNlX3YwMisweGRhLzB4MWE0Cj4+ICAgfCBlcGMgOiBm
ZmZmZmZmZjgwMDBhYjRjIHJhIDogZmZmZmZmZmY4MDAwYWNjYyBzcCA6IGZmMjAwMDAwMDFjOWJi
ZDAKPj4gICB8ICBncCA6IGZmZmZmZmZmODIwNzhjNDggdHAgOiBmZjYwMDAwMDg4OGU2YTQwIHQw
IDogZmYyMDAwMDAwMWM5YmQ0NAo+PiAgIHwgIHQxIDogMDAwMDAwMDAwMDAwMDAwMCB0MiA6IDAw
MDAwMDAwMDAwMDAwNDAgczAgOiBmZjIwMDAwMDAxYzliYmYwCj4+ICAgfCAgczEgOiAwMDAwMDAw
MDAwMDAwMDEwIGEwIDogMDAwMDAwMDAwMDAwMDAwMCBhMSA6IDAwMDAwMDAwMDAwMDAwMDAKPj4g
ICB8ICBhMiA6IDAwMDAwMDAwMDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAwIGE0IDogMDAw
MDAwMDAwMDAwMDAwMAo+PiAgIHwgIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBhNiA6IDAwMDAwMDAw
MDAwMDAwMDAgYTcgOiAwMDAwMDAwMDUyNDY0ZTQzCj4+ICAgfCAgczIgOiAwMDAwMDAwMDAwMDBm
ZmZmIHMzIDogMDAwMDAwMDBmZmZmZmZmZiBzNCA6IGZmZmZmZmZmODE2Njc1MjgKPj4gICB8ICBz
NSA6IDAwMDAwMDAwMDAwMDAwMDAgczYgOiAwMDAwMDAwMDAwMDAwMDAwIHM3IDogMDAwMDAwMDAw
MDAwMDAwMAo+PiAgIHwgIHM4IDogMDAwMDAwMDAwMDAwMDAwMSBzOSA6IDAwMDAwMDAwMDAwMDAw
MDMgczEwOiAwMDAwMDAwMDAwMDAwMDQwCj4+ICAgfCAgczExOiBmZmZmZmZmZjgyMDdkMjQwIHQz
IDogMDAwMDAwMDAwMDAwMDAwZiB0NCA6IDAwMDAwMDAwMDAwMDAwMmEKPj4gICB8ICB0NSA6IGZm
NjAwMDAwODcyZGYxNDAgdDYgOiBmZmZmZmZmZjgxZTI2ODI4Cj4+ICAgfCBzdGF0dXM6IDAwMDAw
MDAyMDAwMDAxMjAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTogODAwMDAwMDAwMDAw
MDAwNQo+PiAgIHwgWzxmZmZmZmZmZjgwMDBhYjRjPl0gX19zYmlfcmZlbmNlX3YwMl9jYWxsLmlz
cmEuMCsweDc0LzB4MTFhCj4+ICAgfCBbPGZmZmZmZmZmODAwMGFjY2M+XSBfX3NiaV9yZmVuY2Vf
djAyKzB4ZGEvMHgxYTQKPj4gICB8IFs8ZmZmZmZmZmY4MDAwYTg4Nj5dIHNiaV9yZW1vdGVfZmVu
Y2VfaSsweDFlLzB4MjYKPj4gICB8IFs8ZmZmZmZmZmY4MDAwY2VlMj5dIGZsdXNoX2ljYWNoZV9h
bGwrMHgxYS8weDQ4Cj4+ICAgfCBbPGZmZmZmZmZmODAwMDc3MzY+XSBwYXRjaF90ZXh0X25vc3lu
YysweDZjLzB4OGMKPj4gICB8IFs8ZmZmZmZmZmY4MDAwZjBmOD5dIGJwZl9hcmNoX3RleHRfaW52
YWxpZGF0ZSsweDYyLzB4YWMKPj4gICB8IFs8ZmZmZmZmZmY4MDE2YzUzOD5dIGJwZl9wcm9nX3Bh
Y2tfZnJlZSsweDljLzB4MWIyCj4+ICAgfCBbPGZmZmZmZmZmODAxNmM4NGE+XSBicGZfaml0X2Jp
bmFyeV9wYWNrX2ZyZWUrMHgyMC8weDRhCj4+ICAgfCBbPGZmZmZmZmZmODAwMGYxOTg+XSBicGZf
aml0X2ZyZWUrMHg1Ni8weDllCj4+ICAgfCBbPGZmZmZmZmZmODAxNmI0M2E+XSBicGZfcHJvZ19m
cmVlX2RlZmVycmVkKzB4MTVhLzB4MTgyCj4+ICAgfCBbPGZmZmZmZmZmODAwNTc2YzQ+XSBwcm9j
ZXNzX29uZV93b3JrKzB4MWI2LzB4M2Q2Cj4+ICAgfCBbPGZmZmZmZmZmODAwNTdkNTI+XSB3b3Jr
ZXJfdGhyZWFkKzB4ODQvMHgzNzgKPj4gICB8IFs8ZmZmZmZmZmY4MDA1ZmMyYz5dIGt0aHJlYWQr
MHhlOC8weDEwOAo+PiAgIHwgWzxmZmZmZmZmZjgwMDAzZmZhPl0gcmV0X2Zyb21fZm9yaysweGUv
MHgyMAo+Pgo+PiBJJ20gZGlnZ2luZyBpbnRvIHRoYXQgbm93LCBhbmQgSSB3b3VsZCBhcHByZWNp
YXRlIGlmIHlvdSBjb3VsZCBydW4gdGhlCj4+IHRlc3RfdGFnIG9uIFZGMiBvciBzaW1pbGFyIChJ
J20gbWlzc2luZyB0aGF0IEhXKS4KPgo+IFN1cmUsIEkgd2lsbCB0cnkgdG8gcnVuIHRoaXMgb24g
dGhlIGJvYXJkLgo+IEkgd2lsbCByZWJhc2UgbXkgc2VyaWVzKCsgdGhlIHBhdGNoIGZyb20gYXJt
NjQgc2VyaWVzKSBvbiB0aGUgbGF0ZXN0Cj4gYnBmLW5leHQgdHJlZSBhbmQgdHJ5IHRvIHJ1biBp
dC4KClRoYW5rIHlvdSEKCj4gTGV0IG1lIGtub3cgaWYgSSBuZWVkIHRvIGFkZDoKPiArICAgICAg
IHNlbGVjdCBIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIGlmIE1NVSAmJiA2NEJJVAoK
SSB1c3VhbGx5IHJ1biB3aXRoIHRoYXQgKm9uKiwgZm9yIGJldHRlciBjb3ZlcmFnZS4gCgoKQmrD
tnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
