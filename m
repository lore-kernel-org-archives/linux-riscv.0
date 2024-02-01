Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36929C4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHNPaL8cJxzc9JSP4BEtwIBEN5bSAOrj4nR6A6Kn6mg=; b=uZMa8GCPPjDjjF
	4IxWUpOFqQRy9Gx5qtphCCbNZxXBPwvYi74iXSs98Erv5wd2xHRKNd3+KOFu0mSMpMBi8jElPVxk7
	keBKfidZQ5yljZ055bNstqafViwU3Ehr/bfTdFYUrF8GbF415VE5ziAuhbQEcj9CHACwk2fXDWp3s
	c9CSe22agAnTcedq6ybk0b78OSe9sUUk1K4JG51+6AfFWXQCROft8UVLMxgnLgK4r8vxP4lWlqtV7
	w8cztpcrgmgqXQiPO4YaRf/w2rCUS/8WNrLthf8Zu9/CM8CJro/eZ0fsd0fNnnAO5+Kz5NwTYWf6a
	aAgkNemiLyKcpnZvDB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXJh-0000000895p-2rHu;
	Thu, 01 Feb 2024 13:41:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXED-000000086Be-0Xkj
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 13:35:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C64061A25;
	Thu,  1 Feb 2024 13:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BA7C433F1;
	Thu,  1 Feb 2024 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706794539;
	bh=6d+HrDKNndPChG5AQ65MC01cktHgwk8cHkxMaAbaBXw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aA3iTIM24LNLvVQTM9MHRfgTQq4kgTbQnr7OOuMlSTJW5lflsMsXBtKoFismDk9lh
	 9ig55vrz6OkxQzVRn95S0aaW21RFNyh/OUCZ8oWuZjE6ILHv39ThjGPthVUdPOTt4M
	 VOyR+WyBNKJdlGbOY+/5fhd1IrTeZZR1XbdZnsTugAfHDHLMR/7sJRrlWv0rtbudxn
	 RnHPve+g1n0HySbljL58fWLoUlAzFz6XWqo1hoIAmI/MZiA6QOdnZcNUG1i4sbfexb
	 M5w30WQZ4vB7SbUB7Xov7Nb28ZRoKxTaSLKc1yNeXQJM85oPR+mmxOPXvkOkuU8PBN
	 3wDGV3usdbFJQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Song Liu <song@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v2 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
In-Reply-To: <93209b12-9117-484a-908a-5b138fa2ffb0@huaweicloud.com>
References: <20240130040958.230673-1-pulehui@huaweicloud.com>
 <20240130040958.230673-5-pulehui@huaweicloud.com>
 <87sf2eohj2.fsf@all.your.base.are.belong.to.us>
 <fab22b9e-7b56-4fef-ba92-bf62ec43007d@huaweicloud.com>
 <878r44mr4g.fsf@all.your.base.are.belong.to.us>
 <93209b12-9117-484a-908a-5b138fa2ffb0@huaweicloud.com>
Date: Thu, 01 Feb 2024 14:35:36 +0100
Message-ID: <87jznowbmf.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_053541_250644_40ECC96B 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IE9uIDIwMjQvMi8x
IDE4OjEwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWlj
bG91ZC5jb20+IHdyaXRlczoKPj4gCj4+Pj4+IEBAIC0yNTIsMTAgKzIyMCw3IEBAIHN0YXRpYyB2
b2lkIF9fYnVpbGRfZXBpbG9ndWUoYm9vbCBpc190YWlsX2NhbGwsIHN0cnVjdCBydl9qaXRfY29u
dGV4dCAqY3R4KQo+Pj4+PiAgICAJCWVtaXRfbGQoUlZfUkVHX1M1LCBzdG9yZV9vZmZzZXQsIFJW
X1JFR19TUCwgY3R4KTsKPj4+Pj4gICAgCQlzdG9yZV9vZmZzZXQgLT0gODsKPj4+Pj4gICAgCX0K
Pj4+Pj4gLQlpZiAoc2Vlbl9yZWcoUlZfUkVHX1M2LCBjdHgpKSB7Cj4+Pj4+IC0JCWVtaXRfbGQo
UlZfUkVHX1M2LCBzdG9yZV9vZmZzZXQsIFJWX1JFR19TUCwgY3R4KTsKPj4+Pj4gLQkJc3RvcmVf
b2Zmc2V0IC09IDg7Cj4+Pj4+IC0JfQo+Pj4+PiArCWVtaXRfbGQoUlZfUkVHX1RDQywgc3RvcmVf
b2Zmc2V0LCBSVl9SRUdfU1AsIGN0eCk7Cj4+Pj4KPj4+PiBXaHkgZG8geW91IG5lZWQgdG8gcmVz
dG9yZSBSVl9SRUdfVENDPyBXZSdyZSBwYXNzaW5nIFJWX1JFR19UQ0MgKGE2KSBhcwo+Pj4+IGFu
IGFyZ3VtZW50IGF0IGFsbCBjYWxsLXNpdGVzLCBhbmQgZm9yIHRhaWxjYWxscyB3ZSdyZSBsb2Fk
aW5nIGZyb20gdGhlCj4+Pj4gc3RhY2suCj4+Pj4KPj4+PiBJcyB0aGlzIHRvIGZha2UgdGhlIGE2
IGFyZ3VtZW50IGZvciB0aGUgdGFpbC1jYWxsPyBJZiBzbywgaXQncyBiZXR0ZXIgdG8KPj4+PiBt
b3ZlIGl0IHRvIGVtaXRfYnBmX3RhaWxfY2FsbCgpLCBpbnN0ZWFkIG9mIGxldHRpbmcgYWxsIHBy
b2dyYW1zIHBheSBmb3IKPj4+PiBpdC4KPj4+Cj4+PiBZZXMsIHdlIGNhbiByZW1vdmUgdGhpcyBk
dXBsaWNhdGUgbG9hZC4gd2lsbCBkbyB0aGF0IGF0IG5leHQgdmVyc2lvbi4KPj4gCj4+IEhtbSwg
bm8gcmVtb3ZlLCBidXQgKm1vdmUqIHJpZ2h0PyBPdGhlcndpc2UgYTYgY2FuIGNvbnRhaW4gZ2Fy
Z2FiZSBvbgo+PiBlbnRlcmluZyB0aGUgdGFpbGNhbGw/Cj4+IAo+PiBNb3ZlIGl0IGJlZm9yZSBf
X2VtaXRfZXBpbG9ndWUoKSBpbiB0aGUgdGFpbGNhbGwsIG5vPwo+PiAKPgo+IElJVUMsIHdlIGRv
bid0IG5lZWQgdG8gbG9hZCBpdCBhZ2Fpbi4gSW4gZW1pdF9icGZfdGFpbF9jYWxsIGZ1bmN0aW9u
LCB3ZSAKPiBsb2FkIFRDQyBmcm9tIHN0YWNrIHRvIEE2LCBBNi0tLCB0aGVuIHN0b3JlIEE2IGJh
Y2sgdG8gc3RhY2suIFRoZW4gCj4gdW53aW5kIHRoZSBjdXJyZW50IHN0YWNrIGFuZCBqdW1wIHRv
IHRhcmdldCBicGYgcHJvZywgZHVyaW5nIHRoaXMgCj4gcGVyaW9kLCB3ZSBkaWQgbm90IHRvdWNo
IHRoZSBBNiByZWdpc3RlciwgZG8gd2Ugc3RpbGwgbmVlZCB0byBsb2FkIGl0IGFnYWluPwoKYTYg
aGFzIHRvIGJlIHBvcHVsYXRlZCBwcmlvciBlYWNoIGNhbGwgLS0gaW5jbHVkaW5nIHRhaWxjYWxs
cy4gQW4KZXhhbXBsZSwgaG93IGl0IGNhbiBicmVhazoKCm1haW5fcHJvZygpIC0+IHByb2xvZ3Vl
IChhNiA6PSAwOyBwdXNoIGE2KSAtPiBicGZfaGVscGVyKCkgKHJhbmRvbQprZXJuZWwgcGF0aCB0
aGF0IGNsb2JiZXJzIGE2KSAtPiB0YWlsY2FsbChmb28oKSkgKHVud2luZHMgc3RhY2ssIGVudGVy
cwpmb28oKSB3aXRoIGE2IGdhcmJhZ2UsIGFuZCBwdXNoIGE2KS4KCkFtIEkgbWlzc2luZyBzb21l
dGhpbmc/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
