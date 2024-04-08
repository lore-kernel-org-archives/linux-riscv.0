Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4794CD1292
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 07:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYZLFc6sZLcCtvZl5q5z+szwrzmoukXaIpPy/xEbfAA=; b=iLFKrx31ZMC073
	3LEpMQ501nXRKGEwgiCObwOIaRhE+nzCXRr2Y1anyb58euE87ClU6ckGpu425xGInTtRQAsIqWXBu
	ZEx74vLCXU6/tFi1+W3yZXZbHjKG8GoVdYCihTEZ2uzkRvZWvidqiqOFu5bopHgoe2R48vMEhe0HX
	ieO+dXa+gSrKslOYa9hawgAl2yZuUbLD2avY4ltfIJ5ofa2WwW8bPG5bglPHRQ/XzcqeG/uo3BX7l
	55fgJbmhzYgFO93QnDEeT/j9IEC3jSHoLTp+x07kmhPA5xlSBaJE3sGw/y9EPT6Z/bl/cLmi9sB5R
	x+EPAfKuQz+JbcStNx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjcj-0000000EhRL-2ZpW;
	Mon, 08 Apr 2024 07:41:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjca-0000000EhQ4-3u5X
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 07:41:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3941460E8C;
	Mon,  8 Apr 2024 07:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ACAC433C7;
	Mon,  8 Apr 2024 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712562050;
	bh=/PwTXAMc4qIagsONctj643hd2NRLVGHlttgBejgG8j8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BWAQhQUo/m+lzgIsUQVYBAOxqNr0gy9VJuIhOQqc7fdK4j0ctn1Sxzf4CRuItOoiy
	 jgpzyy+pHdhB2WKLtO2xFcc9s02F7jHdZVTkZnOO2dqk/RC2+t2LLrLyG7mAp1B6z5
	 373vOlk+ZNrKklfkwiAUxs5KRrurYxlW/oBozWhr7SV6vZrSxLDOHgm3cGt1JYQb7a
	 M0q6ZpuEAYDx12xXCE48O43Di0EDP3W1Tn9WDbh8I8Zd5NTE6rBwCSueFDhgVBsdcv
	 zh7jeBA0lttsxUDDgCdFKw1p1ZQ/Y0j5LyUgCQoAdhxteAZgiKvVnRPXgZVXPAP7k7
	 1NeFBuUS+RpFw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Puranjay Mohan
 <puranjay12@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next] riscv, bpf: add internal-only MOV instruction
 to resolve per-CPU addrs
In-Reply-To: <CAEf4BzZ2Tz5-GwbQKYg7KoGwqN8ewPBakmghHaH20MfoATe74g@mail.gmail.com>
References: <20240405124348.27644-1-puranjay12@gmail.com>
 <CAEf4BzZ2Tz5-GwbQKYg7KoGwqN8ewPBakmghHaH20MfoATe74g@mail.gmail.com>
Date: Mon, 08 Apr 2024 09:40:47 +0200
Message-ID: <87cyr0uwsg.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_004053_786966_0CE18BC3 
X-CRM114-Status: GOOD (  15.46  )
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
IEZyaSwgQXByIDUsIDIwMjQgYXQgNTo0NOKAr0FNIFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheTEy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IFN1cHBvcnQgYW4gaW5zdHJ1Y3Rpb24gZm9yIHJlc29s
dmluZyBhYnNvbHV0ZSBhZGRyZXNzZXMgb2YgcGVyLUNQVQo+PiBkYXRhIGZyb20gdGhlaXIgcGVy
LUNQVSBvZmZzZXRzLiBUaGlzIGluc3RydWN0aW9uIGlzIGludGVybmFsLW9ubHkgYW5kCj4+IHVz
ZXJzIGFyZSBub3QgYWxsb3dlZCB0byB1c2UgdGhlbSBkaXJlY3RseS4gVGhleSB3aWxsIG9ubHkg
YmUgdXNlZCBmb3IKPj4gaW50ZXJuYWwgaW5saW5pbmcgb3B0aW1pemF0aW9ucyBmb3Igbm93IGJl
dHdlZW4gQlBGIHZlcmlmaWVyIGFuZCBCUEYKPj4gSklUcy4KPj4KPj4gUklTQy1WIHVzZXMgZ2Vu
ZXJpYyBwZXItY3B1IGltcGxlbWVudGF0aW9uIHdoZXJlIHRoZSBvZmZzZXRzIGZvciBDUFVzCj4+
IGFyZSBrZXB0IGluIGFuIGFycmF5IGNhbGxlZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV9udW1iZXJd
LiBSSVNDViBzdG9yZXMKPj4gdGhlIGFkZHJlc3Mgb2YgdGhlIHRhc2tfc3RydWN0IGluIFRQIHJl
Z2lzdGVyLiBUaGUgZmlyc3QgZWxlbWVudCBpbgo+PiB0YXN0X3N0cnVjdCBpcyBzdHJ1Y3QgdGhy
ZWFkX2luZm8sIGFuZCB3ZSBjYW4gZ2V0IHRoZSBjcHUgbnVtYmVyIGJ5Cj4+IHJlYWRpbmcgZnJv
bSB0aGUgVFAgcmVnaXN0ZXIgKyBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2luZm8sIGNwdSkuCj4+
Cj4+IE9uY2Ugd2UgaGF2ZSB0aGUgY3B1IG51bWJlciBpbiBhIHJlZ2lzdGVyIHdlIHJlYWQgdGhl
IG9mZnNldCBmb3IgdGhhdAo+PiBjcHUgZnJvbSBhZGRyZXNzOiAmX19wZXJfY3B1X29mZnNldCAr
IGNwdV9udW1iZXIgPDwgMy4gVGhlbiB3ZSBhZGQgdGhpcwo+PiBvZmZzZXQgdG8gdGhlIGRlc3Rp
bmF0aW9uIHJlZ2lzdGVyLgo+Pgo+PiBUbyBtZWFzdXJlIHRoZSBpbXByb3ZlbWVudCBmcm9tIHRo
aXMgY2hhbmdlLCB0aGUgYmVuY2htYXJrIGluIFsxXSB3YXMKPj4gdXNlZCBvbiBRZW11Ogo+Pgo+
PiBCZWZvcmU6Cj4+IGdsb2ItYXJyLWluYyAgIDogICAgMS4xMjcgwrEgMC4wMTNNL3MKPj4gYXJy
LWluYyAgICAgICAgOiAgICAxLjEyMSDCsSAwLjAwNE0vcwo+PiBoYXNoLWluYyAgICAgICA6ICAg
IDAuNjgxIMKxIDAuMDUyTS9zCj4+Cj4+IEFmdGVyOgo+PiBnbG9iLWFyci1pbmMgICA6ICAgIDEu
MTM4IMKxIDAuMDExTS9zCj4+IGFyci1pbmMgICAgICAgIDogICAgMS4zNjYgwrEgMC4wMDZNL3MK
Pj4gaGFzaC1pbmMgICAgICAgOiAgICAwLjY3NiDCsSAwLjAwMU0vcwo+Cj4gVEJILCBJIGRvbid0
IHRydXN0IGJlbmNobWFya3MgZG9uZSBpbnNpZGUgUUVNVS4gQ2FuIHlvdSB0cnkgcnVubmluZwo+
IHRoaXMgb24gc29tZSByZWFsIGhhcmR3YXJlPwoKSSBqdXN0IHJhbiBpdCBvbiBhICJWaXNpb25G
aXZlMiIgU0JDOgoKQkVGT1JFCj09PT09PQpnbG9iLWFyci1pbmMgICA6ICAgMTEuNTg2IMKxIDAu
MDIxTS9zIAphcnItaW5jICAgICAgICA6ICAgMTAuODkyIMKxIDAuMDA1TS9zIApoYXNoLWluYyAg
ICAgICA6ICAgIDEuNTE3IMKxIDAuMDAxTS9zIAoKQUZURVIKPT09PT0KZ2xvYi1hcnItaW5jICAg
OiAgIDExLjg5MyDCsSAwLjAxN00vcyAgKCsyLjYlKQphcnItaW5jICAgICAgICA6ICAgMTEuNjMw
IMKxIDAuMDIwTS9zICAoKzYuOCUpCmhhc2gtaW5jICAgICAgIDogICAgMS41NDMgwrEgMC4wMDJN
L3MgICgrMS43JSkKCihJdCdzIGVhcmx5LCBhbmQgdGhlIGNvZmZlZSBoYXZlbid0IGtpY2tlZCBp
biwgc28gSSBob3BlIHRoZQpjYWxjdWxhdGlvbnMgYXJlIGNvcnJlY3QuLi4pCgo+Pgo+PiBbMV0g
aHR0cHM6Ly9naXRodWIuY29tL2FuYWtyeWlrby9saW51eC9jb21taXQvOGRlYzkwMDk3NWVmCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNvbT4K
Pj4gLS0tCj4+ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgMjQgKysrKysrKysr
KysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4gaW5kZXggMTVlNDgyZjJjNjU3Li5lOTViZDFkNDU5
YTQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4gKysr
IGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+PiBAQCAtMTIsNiArMTIsNyBAQAo+
PiAgI2luY2x1ZGUgPGxpbnV4L3N0b3BfbWFjaGluZS5oPgo+PiAgI2luY2x1ZGUgPGFzbS9wYXRj
aC5oPgo+PiAgI2luY2x1ZGUgPGFzbS9jZmkuaD4KPj4gKyNpbmNsdWRlIDxhc20vcGVyY3B1Lmg+
Cj4+ICAjaW5jbHVkZSAiYnBmX2ppdC5oIgo+Pgo+PiAgI2RlZmluZSBSVl9GRU5UUllfTklOU05T
IDIKPj4gQEAgLTEwODksNiArMTA5MCwyNCBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qg
c3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgZW1pdF9vcihSVl9SRUdfVDEsIHJkLCBSVl9SRUdfVDEsIGN0
eCk7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGVtaXRfbXYocmQsIFJWX1JFR19UMSwgY3R4
KTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+ICsgICAgICAgICAgICAgICB9
IGVsc2UgaWYgKGluc25faXNfbW92X3BlcmNwdV9hZGRyKGluc24pKSB7Cj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChyZCAhPSBycykKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBlbWl0X212KHJkLCBycywgY3R4KTsKPgo+IElzIHRoaXMgYW4gdW5jb25kaXRpb25hbCBt
b3ZlIGluc3RydWN0aW9uPyBpbiB4ODYtNjQsIEVNSVRfbW92IGNoZWNrcwo+IHdoZXRoZXIgc291
cmNlIGFuZCBkZXN0aW5hdGlvbiByZWdpc3RlcnMgYXJlIHRoZSBzYW1lIGFuZCBkb2Vzbid0IGVt
aXQKPiBhbnl0aGluZyBpZiB0aGV5IG1hdGNoICh3aGljaCBtYWtlcyBzZW5zZSwgcmlnaHQpPwoK
WWVhaCwgaXQgaXMuIEZvbGRpbmcgdGhlIGNoZWNrIGludG8gdGhlIGVtaXQgc291bmRzIGxpa2Ug
YSBnb29kIGlkZWEuCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
