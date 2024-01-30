Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49E7C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlgxptsbvTZTRxKbIh/M/udjYUGZvftNvEc4g0cuEXQ=; b=HghGM55GLTIs4n
	HhmBP1KaXbLcT0vcDPA9f+8aH55Ax8k2xHGWSqV1ooxGqCNx0OE6Gvt5dymw/VhUDdBMbqVrYJTsx
	EL4C3yMOgo4xwB5TXM4jRzO+KWj4VAzRkDiUvy3lC2RyHkKVgMyShI3BgvXh9KczcsE8UaFE5jZfk
	ALBGL732soIxuRCIZ2OeW7GxXnNNTGQO6XX1y2DizBoLh9XKYo3x0Dz222o6lS6PQ0DEPTr5KMVMw
	tksJh7TJFqHx6QXM0moFGyVCy3IrAuv5FG62guDSGLSUp+ZH76+x2hzrN4grmLNkmioRhhQxjBJ5b
	vuShnoHwuFkBronAagsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjVE-0000000Fi16-3Hm3;
	Tue, 30 Jan 2024 08:29:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjVC-0000000Fi0O-0w6C
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 08:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D02EBCE1990;
	Tue, 30 Jan 2024 08:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803B3C433C7;
	Tue, 30 Jan 2024 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706603389;
	bh=T28E1Pxj46DCSwu7JVzEKI2UvDXN/idUv1SombhTsr0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FvsBIDWT+Hcp03HitCmns0x4cn+TY0EQG/RSLQ3tcwa9nhhZ9j+4kNw+RPu2li1tD
	 Mfhmy7zg1DKhAryqhZzHM/Bfr8mYLXz1jN2mLroPcjcsg1Iqhq6zvOGWcnDD/mLIXM
	 52606tydRfwQ1ocJLI59tx++5Wp68cDs/gWqPxj3H8F5T22MgAqjAztldSVkuSj1di
	 npdwCy57NDDZ+UOEo0YNf7EjTmzvJiC2wh+nb9fJDvZXm+g8u/GUQENLiazKYHgZO2
	 FDk83KqV3rBM7xohcXvR5PWrWk4dK/3CG+app7IHNtYtGgbjqzpbU4u3rrJVrVm86n
	 qKswvQx8PLj+g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
In-Reply-To: <4e73b095-0c08-4a6f-b2ee-8f7a071b14ee@huaweicloud.com>
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
 <87lecqobyb.fsf@all.your.base.are.belong.to.us>
 <4e73b095-0c08-4a6f-b2ee-8f7a071b14ee@huaweicloud.com>
Date: Tue, 30 Jan 2024 09:29:46 +0100
Message-ID: <87cytjusud.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_002954_627810_3144DB4B 
X-CRM114-Status: GOOD (  18.53  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IE9uIDIwMjMvOS8y
OCAxNzo1OSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
Y2xvdWQuY29tPiB3cml0ZXM6Cj4+IAo+Pj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
LmNvbT4KPj4+Cj4+PiBJbiB0aGUgY3VycmVudCBSVjY0IEpJVCwgaWYgd2UganVzdCBkb24ndCBp
bml0aWFsaXplIHRoZSBUQ0MgaW4gc3VicHJvZywKPj4+IHRoZSBUQ0MgY2FuIGJlIHByb3BhZ2F0
ZWQgZnJvbSB0aGUgcGFyZW50IHByb2Nlc3MgdG8gdGhlIHN1YnByb2Nlc3MsIGJ1dAo+Pj4gdGhl
IFRDQyBvZiB0aGUgcGFyZW50IHByb2Nlc3MgY2Fubm90IGJlIHJlc3RvcmVkIHdoZW4gdGhlIHN1
YnByb2Nlc3MKPj4+IGV4aXRzLiBTaW5jZSB0aGUgUlY2NCBUQ0MgaXMgaW5pdGlhbGl6ZWQgYmVm
b3JlIHNhdmluZyB0aGUgY2FsbGVlIHNhdmVkCj4+PiByZWdpc3RlcnMgaW50byB0aGUgc3RhY2ss
IHdlIGNhbm5vdCB1c2UgdGhlIGNhbGxlZSBzYXZlZCByZWdpc3RlciB0bwo+Pj4gcGFzcyB0aGUg
VENDLCBvdGhlcndpc2UgdGhlIG9yaWdpbmFsIHZhbHVlIG9mIHRoZSBjYWxsZWUgc2F2ZWQgcmVn
aXN0ZXIKPj4+IHdpbGwgYmUgZGVzdHJveWVkLiBTbyB3ZSBpbXBsZW1lbnRlZCBtaXhpbmcgYnBm
MmJwZiBhbmQgdGFpbGNhbGxzCj4+PiBzaW1pbGFyIHRvIHg4Nl82NCwgaS5lLiB1c2luZyBhIG5v
bi1jYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8gdHJhbnNmZXIKPj4+IHRoZSBUQ0MgYmV0d2VlbiBm
dW5jdGlvbnMsIGFuZCBzYXZpbmcgdGhhdCByZWdpc3RlciB0byB0aGUgc3RhY2sgdG8KPj4+IHBy
b3RlY3QgdGhlIFRDQyB2YWx1ZS4gQXQgdGhlIHNhbWUgdGltZSwgd2UgYWxzbyBjb25zaWRlciB0
aGUgc2NlbmFyaW8KPj4+IG9mIG1peGluZyB0cmFtcG9saW5lLgo+PiAKPj4gSGkhCj4+IAo+PiBU
aGUgUklTQy1WIEpJVCB0cmllcyB0byBtaW5pbWl6ZSB0aGUgc3RhY2sgdXNhZ2UsIGUuZy4gaXQg
ZG9lc24ndCBoYXZlIGEKPj4gZml4ZWQgcHJvL2VwaWxvZ3VlIGxpa2Ugc29tZSBvZiB0aGUgb3Ro
ZXIgSklUcy4gSSB0aGluayB3ZSBjYW4gZG8gYmV0dGVyCj4+IGhlcmUsIHNvIHRoYXQgdGhlIHBh
c3MtVENDLXZpYS1yZWdpc3RlciBjYW4gYmUgdXNlZCwgYW5kIHRoZSBhZGRpdGlvbmFsCj4+IHN0
YWNrIGFjY2VzcyBjYW4gYmUgYXZvaWRlZC4KPj4gCj4+IFRvZGF5LCB0aGUgVENDIGlzIHBhc3Nl
ZCB2aWEgYSByZWdpc3RlciAoYTYpIGFuZCBjYW4gYmUgdmlld2VkIGFzIGEKPj4gInN0YXRlIiB2
YXJpYWJsZS90cmFuc3BhcmVudCBhcmd1bWVudC9yZXR1cm4gdmFsdWUuIEFzIHlvdSBwb2ludCBv
dXQsIHdlCj4+IGxvb3NlIHRoaXMgd2hlbiB3ZSBkbyBhIGNhbGwuIE9uIChhbnkpIGNhbGxzIHdl
IG1vdmUgdGhlIFRDQyB0byBhCj4+IGNhbGxlZS1zYXZlZCByZWdpc3Rlci4KPj4gCj4+IFdEWVQg
YWJvdXQgdGhlIGZvbGxvd2luZyBzY2hlbWU6Cj4+IAo+PiAxIFBpY2t1cCB0aGUgYXJtNjQgYnBm
MmJwZi90YWlsbWl4IG1lY2hhbmlzbSBvZiBqdXN0IGNsZWFyaW5nIHRoZSBUQ0MKPj4gICAgZm9y
IHRoZSBtYWluIHByb2dyYW0uCj4+IDIgRm9yIEJQRiBoZWxwZXIgY2FsbHMsIG1vdmUgVENDIHRv
IHM2LCBwZXJmb3JtIHRoZSBjYWxsLCBhbmQgcmVzdG9yZQo+PiAgICBhNi4gRGl0byBmb3Iga2Z1
bmMgY2FsbHMgKEJQRl9QU0VVRE9fS0ZVTkNfQ0FMTCkuCj4+IDMgRm9yIGFsbCBvdGhlciBjYWxs
cywgYTYgaXMgcGFzc2VkIHRyYW5zcGFyZW50bHkuCj4+IAo+PiBGb3IgMiBicGZfaml0X2dldF9m
dW5jX2FkZHIoKSBjYW4gYmUgdXNlZCB0byBkZXRlcm1pbmUgaWYgdGhlIGNhbGxlZSBpcwo+PiBh
IEJQRiBoZWxwZXIgb3Igbm90Lgo+PiAKPj4gSW4gc3VtbWFyeTsgRGV0ZXJtaW5lIGluIHRoZSBK
SVQgaWYgd2UncmUgbGVhdmluZyBCUEYtbGFuZCwgYW5kIG5lZWQgdG8KPj4gbW92ZSB0aGUgVEND
IHRvIGEgY2FsbGVlLXNhdmVkIHJlZywgb3Igbm90LCBhbmQgc2F2ZSB1cyBhIGJ1bmNoIG9mIHN0
YWNrCj4+IHN0b3JlL2xvYWRzLgo+PiAKPgo+IFZhbHVhYmxlIHNjaGVtZS4gQnV0IHdlIG5lZWQg
dG8gY29uc2lkZXIgVENDIGJhY2sgcHJvcGFnYXRpb24uIExldCBtZSAKPiBzaG93IGFuIGV4YW1w
bGUgb2YgY2FsbGluZyBzdWJwcm9nIHdpdGggVENDIHN0b3JlZCBpbiBBNjoKPgo+IHByb2cxKFRD
Qz09MSl7Cj4gICAgICBzdWJwcm9nMShUQ0M9PTEpCj4gICAgICAgICAgLT4gdGFpbGNhbGwxKFRD
Qz09MCkKPiAgICAgICAgICAgICAgLT4gc3VicHJvZzIoVENDPT0wKQo+ICAgICAgc3VicHJvZzMo
VENDPT0wKSA8LS0tIHNob3VsZCBiZSBUQ0M9PTEKPiAgICAgICAgICAtXC0+IHRhaWxjYWxsMiA8
LS0tIGNhbid0IGJlIGNhbGxlZAo+IH0KPgo+IFdlIGNhbGwgcHJvZzEgYW5kIFRDQyBpcyAxLiBw
cm9nMSBoYXMgdHdvIHN1YnByb2dzLCBzdWJwcm9nMSBhbmQgCj4gc3VicHJvZzMuIHN1YnByb2cx
IGNhbGxzIHRhaWxjYWxsMSBhbmQgVENDIGJlY29tZSB0byAwLiB0YWlsY2FsbDEgY2FsbCAKPiBz
dWJwcm9nMiBhbmQgdGhlbiByZXR1cm4gdG8gcHJvZzEgd2l0aCBUQ0MgaXMgMC4gQXQgdGhpcyB0
aW1lLCBzdWJwcm9nMyAKPiBjYW5ub3QgY2FsbCB0YWlsY2FsbDIgYmVjYXVzZSBUQ0MgaXMgMC4g
QnV0IFRDQyBzaG91bGQgYmUgMSBoZXJlLgoKSHVoLCBJJ20gbm90IGZvbGxvd2luZywgYW5kIEkg
ZG9uJ3Qgc2VlIHRoZSBpc3N1ZS4gSGVscCBtZSBvdXQhIFlvdSdyZQpvbmx5IGFsbG93ZWQgdG8g
ZG8gWCB0YWlsIGNhbGxzICJnbG9iYWxseSIgZm9yIGEgQlBGIGNvbnRleHQsIHJpZ2h0PyBTbwpp
biB0aGUgZXhhbXBsZSB5b3UncmUgb3V0bGluaW5nIGFib3ZlLCB0YWlsY2FsbDIgc2hvdWxkbid0
IGJlIGFsbG93ZWQgdG8KYmUgY2FsbGVkLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
