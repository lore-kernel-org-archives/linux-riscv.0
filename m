Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D17BC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xCM34x2l4aql9kaDjTnlNVC1lPZLeo3zci5kBdzT9c=; b=vJYPD6/rJM4Cqs
	nXvNDt/kQaqNc8bV9ozWmpQh/K2hbl0IBomMW/7KjTcgFHNknMgZkLxQgEGPvmnsmOSnUWNQK4D+e
	m3RW283nx2Hd2fgWNqoujZZeKR9DCHuEAxk8x45+CAA0cvXKsVwPY5Sut2IHy+L4nzjiYKgEsTpTq
	85Rn7mp/EIyj1ZgaXm0AnASahheoUUzmxqRye63jUwsNdyUOJ6+oIokG14A1oWXe4mnfeAEK1jVQt
	hVKHJSBluZXHXro0MFvOKZIlmVmWz5LlA5yV5K4Il81Z3j8PBk/ySuETKjsrcYFa094WIp2V0fS0A
	gXTz6MECAMrYq6m2723A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2WJ2-0000000ClOK-2Hsn;
	Thu, 02 May 2024 13:17:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2WIz-0000000ClNp-12wc
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 13:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BA0261978;
	Thu,  2 May 2024 13:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E1DC113CC;
	Thu,  2 May 2024 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714655815;
	bh=w6H08j+R8foRTFOw41AFNnzrEJ9YvknLQmjZmPzZqeg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sY3nTQskk7vNgYeyYTzpB4pbuFH03SPkrPHSPWha53MbJ2I9QaBvetSVC9FLQA9Cb
	 Rr16e80Wxtm36HemMa8595Zrk4tAH5ovpMruDcdGy5KOBYXJb9OtvnEU+U9eEmwLkM
	 KK9Q5afWGBJsY+cjlw2SnJ55eLFALNedVkBi51lX+7vrDSkzYsidf/Cw0FJ+HPQmAE
	 PDFWs2L2tv/NanO2s55if5kvu+W3hreqLwmbDXH/WdYuJQs7vKA4/EJYBn1yJac+gq
	 Ycl4ToG9I5wqlQ0G6/TU7M88c7ns413EvU0ChjaMOSyhqRm7/0TXCPiZfRZWOXtxxI
	 ekb0tn/7bVlqA==
From: Puranjay Mohan <puranjay@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v2 2/2] riscv, bpf: inline
 bpf_get_smp_processor_id()
In-Reply-To: <CAEf4Bzb4FYVNjuoghCcDxLgQCOT9Mb=nbjgNktqDarPHkOsuog@mail.gmail.com>
References: <20240430175834.33152-1-puranjay@kernel.org>
 <20240430175834.33152-3-puranjay@kernel.org>
 <CAEf4Bzb4FYVNjuoghCcDxLgQCOT9Mb=nbjgNktqDarPHkOsuog@mail.gmail.com>
Date: Thu, 02 May 2024 13:16:52 +0000
Message-ID: <mb61pcyq45p6j.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_061657_397151_4F03743A 
X-CRM114-Status: GOOD (  16.62  )
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

QW5kcmlpIE5ha3J5aWtvIDxhbmRyaWkubmFrcnlpa29AZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9u
IFR1ZSwgQXByIDMwLCAyMDI0IGF0IDEwOjU54oCvQU0gUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBJbmxpbmUgdGhlIGNhbGxzIHRvIGJwZl9nZXRfc21w
X3Byb2Nlc3Nvcl9pZCgpIGluIHRoZSByaXNjdiBicGYgaml0Lgo+Pgo+PiBSSVNDViBzYXZlcyB0
aGUgcG9pbnRlciB0byB0aGUgQ1BVJ3MgdGFza19zdHJ1Y3QgaW4gdGhlIFRQICh0aHJlYWQKPj4g
cG9pbnRlcikgcmVnaXN0ZXIuIFRoaXMgbWFrZXMgaXQgdHJpdmlhbCB0byBnZXQgdGhlIENQVSdz
IHByb2Nlc3NvciBpZC4KPj4gQXMgdGhyZWFkX2luZm8gaXMgdGhlIGZpcnN0IG1lbWJlciBvZiB0
YXNrX3N0cnVjdCwgd2UgY2FuIHJlYWQgdGhlCj4+IHByb2Nlc3NvciBpZCBmcm9tIFRQICsgb2Zm
c2V0b2Yoc3RydWN0IHRocmVhZF9pbmZvLCBjcHUpLgo+Pgo+PiAgICAgICAgICAgUklTQ1Y2NCBK
SVQgb3V0cHV0IGZvciBgY2FsbCBicGZfZ2V0X3NtcF9wcm9jZXNzb3JfaWRgCj4+ICAgICAgICAg
ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
Pj4KPj4gICAgICAgICAgICAgICAgIEJlZm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAgIEFm
dGVyCj4+ICAgICAgICAgICAgICAgIC0tLS0tLS0tICAgICAgICAgICAgICAgICAgICAgICAgIC0t
LS0tLS0KPj4KPj4gICAgICAgICAgYXVpcGMgICB0MSwweDg0OGMgICAgICAgICAgICAgICAgICBs
ZCAgICBhNSwzMih0cCkKPj4gICAgICAgICAgamFsciAgICA2MDQodDEpCj4+ICAgICAgICAgIG12
ICAgICAgYTUsYTAKPj4KPgo+IE5pY2UsIGdyZWF0IGZpbmQhIFdvdWxkIHlvdSBiZSBhYmxlIHRv
IGRvIHNpbWlsYXIgaW5saW5pbmcgZm9yIHg4Ni02NAo+IGFzIHdlbGw/IERpc2Fzc2VtYmxpbmcg
YnBmX2dldF9zbXBfcHJvY2Vzc29yX2lkIGZvciB4ODYtNjQgc2hvd3MgdGhpczoKPgo+IER1bXAg
b2YgYXNzZW1ibGVyIGNvZGUgZm9yIGZ1bmN0aW9uIGJwZl9nZXRfc21wX3Byb2Nlc3Nvcl9pZDoK
PiAgICAweGZmZmZmZmZmODEwZjkxYTAgPCswPjogICAgIDBmIDFmIDQ0IDAwIDAwICBub3BsICAg
MHgwKCVyYXgsJXJheCwxKQo+ICAgIDB4ZmZmZmZmZmY4MTBmOTFhNSA8KzU+OiAgICAgNjUgOGIg
MDUgNjAgNzkgZjMgN2UgICAgbW92Cj4gJWdzOjB4N2VmMzc5NjAoJXJpcCksJWVheCAgICAgICAg
IyAweDMwYjBjIDxwY3B1X2hvdCsxMj4KPiAgICAweGZmZmZmZmZmODEwZjkxYWMgPCsxMj46ICAg
IDQ4IDk4ICAgY2x0cQo+ICAgIDB4ZmZmZmZmZmY4MTBmOTFhZSA8KzE0PjogICAgYzMgICAgICBy
ZXQKPiBFbmQgb2YgYXNzZW1ibGVyIGR1bXAuCj4gV2Ugc2hvdWxkIGJlIGFibGUgdG8gZG8gdGhl
IHNhbWUgaW4geDg2LTY0IEJQRiBKSVQuIChpdCdzIGFjdHVhbGx5IGhvdwo+IEkgc3RhcnRlZCBp
bml0aWFsbHksIEkgaGFkIGEgZGVkaWNhdGVkIGluc3RydWN0aW9uIHJlYWRpbmcgcGVyLWNwdQo+
IG1lbW9yeSwgYnV0IGVuZGVkIHVwIHdpdGggbW9yZSBnZW5lcmFsICJjYWxjdWxhdGUgcGVyLWNw
dSBhZGRyZXNzIikuCgpJIGZlZWwgaW4geDg2LTY0J3MgY2FzZSBKSVQgY2FuIG5vdCBkbyBhICht
dWNoKSBiZXR0ZXIgam9iIGNvbXBhcmVkIHRvIHRoZQpjdXJyZW50IGFwcHJvYWNoIGluIHRoZSB2
ZXJpZmllci4KCk9uIFJJU0MtViBhbmQgQVJNNjQsIEpJVCB3YXMgYWJsZSB0byBkbyBpdCBiZXR0
ZXIgYmVjYXVzZSBib3RoIG9mIHRoZXNlCmFyY2hpdGVjdHVyZXMgc2F2ZSBhIHBvaW50ZXIgdG8g
dGhlIHRhc2sgc3RydWN0IGluIGEgc3BlY2lhbCBDUFUKcmVnaXN0ZXIuIEFzIHg4Ni02NCBkb2Vz
bid0IGhhdmUgZW5vdWdoIGV4dHJhIHJlZ2lzdGVycywgaXQgdXNlcyBhCnBlcmNwdSB2YXJpYWJs
ZSB0byBzdG9yZSB0YXNrIHN0cnVjdCwgdGhyZWFkX2luZm8sIGFuZCB0aGUgY3B1Cm51bWJlci4K
ClAuUy4gLSBXaGlsZSBkb2luZyB0aGlzIGZvciBCUEYsIEkgcmVhbGl6ZWQgdGhhdCBBUk02NCBr
ZXJuZWwgY29kZSBpcwphbHNvIG5vdCBvcHRpbWFsIGFzIGl0IGlzIHVzaW5nIHRoZSBwZXJjcHUg
dmFyaWFibGUgYW5kIGlzIG5vdCByZWFkaW5nCnRoZSBDUFUgcmVnaXN0ZXIgZGlyZWN0bHkuIFNv
LCBJIHNlbnQgYSBwYXRjaFsxXSB0byBmaXggaXQgaW4gdGhlIGtlcm5lbAphbmQgZ2V0IHJpZCBv
ZiB0aGUgcGVyLWNwdSB2YXJpYWJsZSBpbiBBUk02NC4KCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjQwNTAyMTIzNDQ5LjI2OTAtMi1wdXJhbmpheUBrZXJuZWwub3JnLwoKPiBB
bnl3YXlzLCBncmVhdCB3b3JrLCBhIHNtYWxsIG5pdCBiZWxvdy4KPgo+IEFja2VkLWJ5OiBBbmRy
aWkgTmFrcnlpa28gPGFuZHJpaUBrZXJuZWwub3JnPgoKVGhhbmtzLApQdXJhbmpheQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
