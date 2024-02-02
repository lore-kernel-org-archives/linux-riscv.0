Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABDDC4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 13:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HkWJ+gw4ckL/QcH+AqYD/DpUZdkIkDH2ianUrAtKkA=; b=JUX0dUBWWQ9cy+
	8IV5I1Ji1Wt2uU/e9AVxQ1nneBjdIzlx1lqJD1y8f1mOmdJnRC57wmgxhXNzdor3pmcjKPR4dI0uu
	oO3HcxeCcgoZ5iPgr8g5l/UZ/oJBl/pIrIMh//k8xPHzwWqYsXsLYiyEC+YWw5gU9FjOE2DLQAmwn
	SDFsJdZMxVilUoaxNHt0JjXUv21Mxf7rOfRsYX/53OZAGJmGjFLiSo9fd+vGh8vx/SKcOQtvhPtc5
	ca2BxrHEE1dMjHGOCHOt9IR0eeoVP6zd8nupCXvDDC4MvqzWAUvwCVUxyftRD1ZSzM/d/5EIQOPr2
	48VTBt3YzhQDgm7XEtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVtDG-0000000BYQ9-3Z8h;
	Fri, 02 Feb 2024 13:04:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVtDE-0000000BYPm-178F
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 13:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62FF262559;
	Fri,  2 Feb 2024 13:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85733C433F1;
	Fri,  2 Feb 2024 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706879047;
	bh=sJfAEWjsAZta/5Hz8HZlZF6BluB71hiZTGWU2kv4FZ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GWov61XaezU5B5NhZDeqObu4dQW+TYXv1GWbezkW4ht3a1uRQNnsaMzXqEbXpqFnX
	 5q2PIKOGqiKTAO2uZFcen2/jaGc+Ranl8uZYNGOs6+U40APcnxtR04Z9U0FSNITy1/
	 EUXGDgwjwPKBXXx3rGWYfdiIg2LI1sFt9jJiAtSY1jayFExR7OCboy8dlMcMhsl9It
	 WfEsRIROz5vNouOVje6g5aYMU93tH0pl1zq8tEZZmAhokow3RwBqJxmEph41aRy1G/
	 nQrpVpP4CaxD11x9+kCtE1grJ6HX3m42lbdjUL7nFsRSk6g7WN09VrGZM0sc0DzaO9
	 pN8duy7KEryyw==
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
In-Reply-To: <160aaa6f-7efb-4a29-ab6f-dcf938d3419f@huaweicloud.com>
References: <20240130040958.230673-1-pulehui@huaweicloud.com>
 <20240130040958.230673-5-pulehui@huaweicloud.com>
 <87sf2eohj2.fsf@all.your.base.are.belong.to.us>
 <fab22b9e-7b56-4fef-ba92-bf62ec43007d@huaweicloud.com>
 <878r44mr4g.fsf@all.your.base.are.belong.to.us>
 <93209b12-9117-484a-908a-5b138fa2ffb0@huaweicloud.com>
 <87jznowbmf.fsf@all.your.base.are.belong.to.us>
 <160aaa6f-7efb-4a29-ab6f-dcf938d3419f@huaweicloud.com>
Date: Fri, 02 Feb 2024 14:04:04 +0100
Message-ID: <87wmrnhvaz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_050408_416827_6E4D568C 
X-CRM114-Status: GOOD (  10.78  )
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
IDIxOjM1LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWlj
bG91ZC5jb20+IHdyaXRlczoKPj4gCj4+PiBPbiAyMDI0LzIvMSAxODoxMCwgQmrDtnJuIFTDtnBl
bCB3cm90ZToKPj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoK
Pj4+Pgo+Pj4+Pj4+IEBAIC0yNTIsMTAgKzIyMCw3IEBAIHN0YXRpYyB2b2lkIF9fYnVpbGRfZXBp
bG9ndWUoYm9vbCBpc190YWlsX2NhbGwsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+Pj4+
Pj4+ICAgICAJCWVtaXRfbGQoUlZfUkVHX1M1LCBzdG9yZV9vZmZzZXQsIFJWX1JFR19TUCwgY3R4
KTsKPj4+Pj4+PiAgICAgCQlzdG9yZV9vZmZzZXQgLT0gODsKPj4+Pj4+PiAgICAgCX0KPj4+Pj4+
PiAtCWlmIChzZWVuX3JlZyhSVl9SRUdfUzYsIGN0eCkpIHsKPj4+Pj4+PiAtCQllbWl0X2xkKFJW
X1JFR19TNiwgc3RvcmVfb2Zmc2V0LCBSVl9SRUdfU1AsIGN0eCk7Cj4+Pj4+Pj4gLQkJc3RvcmVf
b2Zmc2V0IC09IDg7Cj4+Pj4+Pj4gLQl9Cj4+Pj4+Pj4gKwllbWl0X2xkKFJWX1JFR19UQ0MsIHN0
b3JlX29mZnNldCwgUlZfUkVHX1NQLCBjdHgpOwo+Pj4+Pj4KPj4+Pj4+IFdoeSBkbyB5b3UgbmVl
ZCB0byByZXN0b3JlIFJWX1JFR19UQ0M/IFdlJ3JlIHBhc3NpbmcgUlZfUkVHX1RDQyAoYTYpIGFz
Cj4+Pj4+PiBhbiBhcmd1bWVudCBhdCBhbGwgY2FsbC1zaXRlcywgYW5kIGZvciB0YWlsY2FsbHMg
d2UncmUgbG9hZGluZyBmcm9tIHRoZQo+Pj4+Pj4gc3RhY2suCj4+Pj4+Pgo+Pj4+Pj4gSXMgdGhp
cyB0byBmYWtlIHRoZSBhNiBhcmd1bWVudCBmb3IgdGhlIHRhaWwtY2FsbD8gSWYgc28sIGl0J3Mg
YmV0dGVyIHRvCj4+Pj4+PiBtb3ZlIGl0IHRvIGVtaXRfYnBmX3RhaWxfY2FsbCgpLCBpbnN0ZWFk
IG9mIGxldHRpbmcgYWxsIHByb2dyYW1zIHBheSBmb3IKPj4+Pj4+IGl0Lgo+Pj4+Pgo+Pj4+PiBZ
ZXMsIHdlIGNhbiByZW1vdmUgdGhpcyBkdXBsaWNhdGUgbG9hZC4gd2lsbCBkbyB0aGF0IGF0IG5l
eHQgdmVyc2lvbi4KPj4+Pgo+Pj4+IEhtbSwgbm8gcmVtb3ZlLCBidXQgKm1vdmUqIHJpZ2h0PyBP
dGhlcndpc2UgYTYgY2FuIGNvbnRhaW4gZ2FyZ2FiZSBvbgo+Pj4+IGVudGVyaW5nIHRoZSB0YWls
Y2FsbD8KPj4+Pgo+Pj4+IE1vdmUgaXQgYmVmb3JlIF9fZW1pdF9lcGlsb2d1ZSgpIGluIHRoZSB0
YWlsY2FsbCwgbm8/Cj4+Pj4KPj4+Cj4+PiBJSVVDLCB3ZSBkb24ndCBuZWVkIHRvIGxvYWQgaXQg
YWdhaW4uIEluIGVtaXRfYnBmX3RhaWxfY2FsbCBmdW5jdGlvbiwgd2UKPj4+IGxvYWQgVENDIGZy
b20gc3RhY2sgdG8gQTYsIEE2LS0sIHRoZW4gc3RvcmUgQTYgYmFjayB0byBzdGFjay4gVGhlbgo+
Pj4gdW53aW5kIHRoZSBjdXJyZW50IHN0YWNrIGFuZCBqdW1wIHRvIHRhcmdldCBicGYgcHJvZywg
ZHVyaW5nIHRoaXMKPj4+IHBlcmlvZCwgd2UgZGlkIG5vdCB0b3VjaCB0aGUgQTYgcmVnaXN0ZXIs
IGRvIHdlIHN0aWxsIG5lZWQgdG8gbG9hZCBpdCBhZ2Fpbj8KPj4gCj4+IGE2IGhhcyB0byBiZSBw
b3B1bGF0ZWQgcHJpb3IgZWFjaCBjYWxsIC0tIGluY2x1ZGluZyB0YWlsY2FsbHMuIEFuCj4+IGV4
YW1wbGUsIGhvdyBpdCBjYW4gYnJlYWs6Cj4+IAo+PiBtYWluX3Byb2coKSAtPiBwcm9sb2d1ZSAo
YTYgOj0gMDsgcHVzaCBhNikgLT4gYnBmX2hlbHBlcigpIChyYW5kb20KPj4ga2VybmVsIHBhdGgg
dGhhdCBjbG9iYmVycyBhNikgLT4gdGFpbGNhbGwoZm9vKCkpICh1bndpbmRzIHN0YWNrLCBlbnRl
cnMKPgo+IEl0J3MgT0sgdG8gY2xvYmJlcnMgQTYgcmVnIGZvciBoZWxwZXIva2Z1bmMgY2FsbCwg
YmVjYXVzZSB3ZSB3aWxsIGxvYWQgCj4gVENDIGZyb20gc3RhY2sgdG8gQTYgcmVnIGJlZm9yZSBq
dW1wIHRvIHRhaWxjYWxsIHRhcmdldCBwcm9nLiBJbiAKPiBhZGRpdGlvbiwgSSBmb3VuZCB0aGF0
IHdlIGNhbiByZW1vdmUgdGhlIHN0b3JlIEE2IGJhY2sgdG8gc3RhY2sgY29tbWFuZCAKPiBmcm9t
IHRoZSB0YWlsY2FsbCBwcm9jZXNzLiBJIHRyeSB0byBkZXNjcmliZSB0aGUgcHJvY2VzcyBpbnZv
bHZlZDoKCkluZGVlZCEgdGFpbGNhbGwgKmlzKiBhbHJlYWR5IHBvcHVsYXRpbmcgYTYsIGFuZCB5
ZXMsIHRoZSBzdG9yZSBjYW4gYmUKb21pdHRlZC4gTmljZSEKCk5vdywgd2Ugc3RpbGwgaGF2ZSB0
aGUgYnVnIEFsZXhlaSBkZXNjcmliZWQsIHNvIHVudGlsIHRoZXJlJ3MgYQpmaXgvd29ya2Fyb3Vu
ZCwgdGhpcyBzZXJpZXMgY2FuJ3QgYmUgbWVyZ2VkLgoKCkNoZWVycywKQmrDtnJuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
