Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C5AC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 20:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YsTdm0ZkArCPCZ8/fVt6OveYqi3qEx9kQSr5MPDuTM=; b=VbPAobVhlTrxeDZo5yyNoosG/3
	LrcdKrecZnkDPwHjca0xESpM2aEcXaJHqr/3eMkcySgku4Kt8wU+fmT/oOmXv6wXN8DJyLPDG4wqf
	ptjeU8Sj/XfHb6vIfsGlyZFgWez/3yQFHXUjp3EtC1R96lUz3dBbq6o2I/5FxBskddB+olKqfnlAq
	Mt1RaZbjU5ZiYYtggyGNoBNt4lbSj9kx55xSSR0EZ6AExS6HeSBKu04sHTKv2g56ZUvlPyMqKEYxM
	HsrMLIlBxL764nCZXp4z9FS8cGTVyESVfZ90G1/ph6UXBIPnM0vR+sLpVFCCHavhjbsX5X1qDqrF9
	uAnvALYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT7fa-00Fft9-1y; Fri, 17 Feb 2023 20:49:26 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT7fX-00Ffr5-4P
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 20:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=woFSv3R0qx1mhW59+7gl0uUf67xuCRJwLoN/Zfd9ruk=; b=RcESBVvpUrfUvxdrwJrM7G3WHb
	QhseaDc1FDtaaEXuFc2umZwc+VWmT5kelH75/Yyj4swAybyWgd1nSHfiXmygWCf+RiLzXfqn0r+Z8
	4eJGJvO2ui4ndQD2Nzme0V+yKx+ZgrfXIDKmDCkm+y+JTyE4ZdiJOWgjSSByWhtQuP2lJHrKj1gf3
	U6bZXohE27FAXgq32fKAoO2319QnPEbug8DE1+Epb4TpiUYGJC0hW8HvWhB5Ytk9p044qSJ0kfG1o
	pe7TvPviflGVxt+gvpE5u7yzGlOJWHYuaDfsh1I60HAQSXMKIzYbMpZ6IfSc0EFMSjzuGaPcG4qP8
	PImKh4xw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1pT7fB-000Eb5-SU; Fri, 17 Feb 2023 21:49:01 +0100
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1pT7fB-000QjW-3a; Fri, 17 Feb 2023 21:49:01 +0100
Subject: Re: [PATCH bpf-next v1 0/4] Support bpf trampoline for RV64
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20230215135205.1411105-1-pulehui@huaweicloud.com>
 <8735763pcu.fsf@all.your.base.are.belong.to.us>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <091287c6-5121-58e5-b1b2-76277d2f1b1a@iogearbox.net>
Date: Fri, 17 Feb 2023 21:49:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <8735763pcu.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.7/26815/Fri Feb 17 09:41:01 2023)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_124923_196829_4A82CC62 
X-CRM114-Status: GOOD (  18.57  )
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

T24gMi8xNi8yMyAxMDo1NiBBTSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPiAKPj4gQlBGIHRyYW1wb2xpbmUgaXMgdGhl
IGNyaXRpY2FsIGluZnJhc3RydWN0dXJlIG9mIHRoZSBicGYKPj4gc3Vic3lzdGVtLCBhY3Rpbmcg
YXMgYSBtZWRpYXRvciBiZXR3ZWVuIGtlcm5lbCBmdW5jdGlvbnMKPj4gYW5kIEJQRiBwcm9ncmFt
cy4gTnVtZXJvdXMgaW1wb3J0YW50IGZlYXR1cmVzLCBzdWNoIGFzCj4+IHVzaW5nIGVicGYgcHJv
Z3JhbSBmb3IgemVybyBvdmVyaGVhZCBrZXJuZWwgaW50cm9zcGVjdGlvbiwKPj4gcmVseSBvbiB0
aGlzIGtleSBjb21wb25lbnQuIFdlIGNhbid0IHdhaXQgdG8gc3VwcG9ydCBicGYKPj4gdHJhbXBv
bGluZSBvbiBSVjY0LiBTaW5jZSBSVjY0IGRvZXMgbm90IHN1cHBvcnQgZnRyYWNlCj4+IGRpcmVj
dCBjYWxsIHlldCwgdGhlIGN1cnJlbnQgUlY2NCBicGYgdHJhbXBvbGluZSBpcyBvbmx5Cj4+IHVz
ZWQgaW4gYnBmIGNvbnRleHQuCj4+Cj4+IEFzIG1vc3Qgb2YgcmlzY3YgY3B1IHN1cHBvcnQgdW5h
bGlnbmVkIG1lbW9yeSBhY2Nlc3NlcywKPj4gd2UgdGVtcG9yYXJpbHkgdXNlIHBhdGNoIFsxXSB0
byBmYWNpbGl0YXRlIHRlc3RpbmcuIFRoZQo+PiB0ZXN0IHJlc3VsdHMgYXJlIGFzIGZvbGxvdywg
YW5kIHRlc3RfdmVyaWZpZXIgd2l0aCBubwo+PiBuZXcgZmFpbHVyZSBjZXNlcy4KPj4KPj4gLSBm
ZXhpdF9icGYyYnBmOk9LCj4+IC0gZHVtbXlfc3Rfb3BzOk9LCj4+IC0geGRwX2JwZjJicGY6T0sK
Pj4KPj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjEwOTE2MTMw
ODU1LjQwNTQ5MjYtMi1jaGVuaHVhbmc1QGh1YXdlaS5jb20vCj4+Cj4+IHYxOgo+PiAtIFJlbW92
ZSB0aGUgbG9naWMgb2YgYnBmX2FyY2hfdGV4dF9wb2tlIHN1cHBvcnRlZCBmb3IKPj4gICAga2Vy
bmVsIGZ1bmN0aW9ucy4gKEt1b2hhaSBhbmQgQmrDtnJuKQo+PiAtIEV4dGVuZCBwYXRjaF90ZXh0
IGZvciBtdWx0aXBsZSBpbnN0cnVjdGlvbnMuIChCasO2cm4pCj4+IC0gRml4IE9PQiBpc3N1ZSB3
aGVuIGltYWdlIHRvbyBiaWcuIChCasO2cm4pCj4gCj4gVGhpcyBzZXJpZXMgaXMgcmVhZHkgdG8g
Z28gaW4gYXMgaXMuCgpPay4KCj4gQFBhbG1lciBJJ2QgbGlrZSB0byB0YWtlIHRoaXMgc2VyaWVz
IHZpYSB0aGUgYnBmLW5leHQgdHJlZSAoYXMgdXN1YWwpLAo+IGJ1dCBub3RlIHRoYXQgdGhlcmUg
YXJlIHNvbWUgbm9uLUJQRiBjaGFuZ2VzIGFzIHdlbGwsIHJlbGF0ZWQgdG8gdGV4dAo+IHBva2lu
Zy4KPiAKPiBATGVodWkgSSdkIGxpa2UgdG8gc2VlIHR3byBmb2xsb3ctdXAgcGF0Y2hlczoKPiAK
PiAxLiBFbmFibGUga2Z1bmMgZm9yIFJWNjQsIGJ5IGFkZGluZzoKPiAgIHwgYm9vbCBicGZfaml0
X3N1cHBvcnRzX2tmdW5jX2NhbGwodm9pZCkKPiAgIHwgewo+ICAgfCAgICAgICAgIHJldHVybiB0
cnVlOwo+ICAgfCB9Cj4gCj4gMi4gUmVtb3ZlIHRoZSBjaGVja3BhdGNoIHdhcm5pbmcgb24gcGF0
Y2ggNDoKPiAgIHwgV0FSTklORzoga2ZyZWUoTlVMTCkgaXMgc2FmZSBhbmQgdGhpcyBjaGVjayBp
cyBwcm9iYWJseSBub3QgcmVxdWlyZWQKPiAgIHwgIzMxMzogRklMRTogYXJjaC9yaXNjdi9uZXQv
YnBmX2ppdF9jb21wNjQuYzo5ODQ6Cj4gICB8ICsJaWYgKGJyYW5jaGVzX29mZikKPiAgIHwgKwkJ
a2ZyZWUoYnJhbmNoZXNfb2ZmKTsKPiAKPiAKPiBGb3IgdGhlIHNlcmllczoKPiAKPiBUZXN0ZWQt
Ynk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiBBY2tlZC1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhhbmtzLCBJIGZpeGVkIHVwIGlzc3VlIDIg
YW5kIGNsZWFuZWQgdXAgdGhlIGNvbW1pdCBtc2dzIHdoaWxlIGFwcGx5aW5nLgpGb3IgaXNzdWUg
MSwgcGxzIHNlbmQgYSBmb2xsb3ctdXAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
