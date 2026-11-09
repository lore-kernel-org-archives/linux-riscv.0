Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797B5606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=egGCmrZp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g73xGVzK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MOjYTQIHDeSkOHXAcUuQ+YOReJZ1UHxMr6RqXEfqkuw=; b=egGCmrZpXjU6CWIMbt/daKRZy6
	zBt01ccH030AvM22vtlR0sdBT3DN5mQZrvn0bTT5NqtdxEJ2KR/7QtdbkIwYvQp4G9NSctjVHzDS3
	125oX9Gg4LnTkN0DDejkzN114knJwi0UPBC+ToH8IXoVfxwot3amJU2HkBMRZMFn9huTcARdk1/K5
	PUWXCzmEa8a69A1ARHbu/uvwbGkMhMlPYxLN5yavQ82+j56sa12BVPgaHGE4OsU3L+KF85serWvf+
	V4CTVoufCsNHB7QDk+GxwP4w6tsQmRdLtcrSPCplzPrbeMb8y6SUZ4L/X4VVzN1M7CLB4ZngniRsi
	d+X0tNmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOIx-00000000e9T-2Gb8;
	Mon, 09 Nov 2026 12:16:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOIv-00000000e9M-2lvd
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:16:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 223E9413C1;
	Mon,  9 Nov 2026 12:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D681F0089F;
	Mon,  9 Nov 2026 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794226613;
	bh=5EAH61NrdU977284xwlV7JSstKvYCuFCm0A7SE4qcvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g73xGVzKCsDCS81GLV3KO4OFB+mRx9gp+NMwK6egST5kX7bwDxGGd2lnD7uWsxe38
	 R5NM6ziSg0LlEvaNIXKBbKwC00C4d7ldcVdjBJW9bkVxWdHlkdf7soUAAa3GwGjXLi
	 TmVjZjVVQoNt45UGIxXVQ35Pehm9piXaesD3pTL2MxmsWlr+JzGRhRafI4M2LZoa9a
	 1UvHyvSVIqq+XJt/TEhZOJ7ZL6SpNvGNR9TdWjxhXYEmmiwZDGAAbNYJmZ4iCjm+3U
	 lrnUwP/yqdHKHv6auYd8/eW/fhenAirqnZiMsL2RLxLbnP72L+aIR1eSDLrgwlB7E5
	 EdCDcA/rSJCLA==
Date: Mon, 9 Nov 2026 19:56:30 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: David Laight <david.laight.linux@gmail.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, bjorn@kernel.org,
	pulehui@huawei.com, puranjay@kernel.org, thuth@redhat.com,
	ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com,
	zong.li@sifive.com, conor.dooley@microchip.com, tglx@kernel.org,
	debug@rivosinc.com, seanwascoding@gmail.com, andybnac@gmail.com,
	menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn, atishp@rivosinc.com,
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, dave@stgolabs.net,
	emil@etsalapatis.com, ihor.solodrai@linux.dev, broonie@kernel.org
Subject: Re: [External] Re: [PATCH v9 1/3] riscv: implement this_cpu
 operations
Message-ID: <avG07pmpcLGkq5i-@xhacker>
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
 <20261108110406.97495-2-cuiyunhui@bytedance.com>
 <20261108213254.67805ef0@pumpkin>
 <CAEEQ3w=5QwwvMJFJkpS51APoBjhed6oriCkvcieRdUFWrKtmSg@mail.gmail.com>
 <avFN7LbSK0q1gsB6@xhacker>
 <CAEEQ3wmViZNwxXr8q477yHjtABStEJecCHS8=5s_UAk1hYgyfw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wmViZNwxXr8q477yHjtABStEJecCHS8=5s_UAk1hYgyfw@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMDksIDIwMjYgYXQgMDE6NDk6MDVQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBKaXNoZW5nLAo+IAo+IE9uIE1vbiwgTm92IDksIDIwMjYgYXQgMTI6NTfigK9QTSBK
aXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
Tm92IDA5LCAyMDI2IGF0IDExOjQ3OjQzQU0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiA+
IEhpIERhdmlkLAo+ID4gPgo+ID4gPiBPbiBNb24sIE5vdiA5LCAyMDI2IGF0IDU6MzPigK9BTSBE
YXZpZCBMYWlnaHQKPiA+ID4gPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPiA+Cj4gPiA+ID4gT24gU3VuLCAgOCBOb3YgMjAyNiAxOTowNDowNCArMDgwMAo+ID4gPiA+
IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4g
PiA+ID4gUklTQy1WIGhhcyBubyBhc20vcGVyY3B1LmgsIHNvIHRoaXNfY3B1XyooKSByZWFkLW1v
ZGlmeS13cml0ZQo+ID4gPiA+ID4gb3BlcmF0aW9ucyB1c2UgZ2VuZXJpYyBpbXBsZW1lbnRhdGlv
bnMgdGhhdCBkaXNhYmxlIGxvY2FsIGludGVycnVwdHMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSW1w
bGVtZW50IFJJU0MtVi1zcGVjaWZpYyB0aGlzX2NwdSBvcGVyYXRpb25zIHdpdGggcHJlZW1wdGlv
biBkaXNhYmxlZAo+ID4gPiA+ID4gdG8ga2VlcCBhY2Nlc3NlcyBvbiB0aGUgY3VycmVudCBDUFUu
Cj4gPiA+ID4KPiA+ID4gPiBIYXZlIHlvdSBsb29rZWQgYXQgc29tZSBvZiB0aGUgc2NoZW1lcyAo
SSB0aGluayBhcm02NCBoYXMgdGhlIGxhdGVzdCwKPiA+ID4gPiBidXQgYWxzbyBzMzkwKSB0aGF0
IGRvIG1vc3QgcGVyLWNwdSBvcHMgd2l0aG91dCBkaXNhYmxpbmcgcHJlZW1wdGlvbi4KPiA+ID4g
PiBJbiBwYXJ0aWN1bGFyIHRoZXkgc2F2ZSB0aGUgcHJlLWVtcHRpb24gY2hlY2sgd2hlbiBwcmUt
ZW1wdGlvbgo+ID4gPiA+IGlzIGVuYWJsZWQuCj4gPiA+ID4KPiA+ID4gPiBCYXNpY2FsbHkgdGhl
IGNvZGUgdGVsbHMgdGhlIHNjaGVkdWxlciB3aGljaCByZWdpc3RlciBjb250YWlucyB0aGUKPiA+
ID4gPiBwZXItY3B1IGRhdGEgc28gdGhhdCBpdCBjYW4gYmUgJ21hZ2ljYWxseScgZmxpcHBlZCBk
dXJpbmcgYSBjb250ZXh0Cj4gPiA+ID4gc3dpdGNoLgo+ID4gPgo+ID4gPiBNYW55IHRoYW5rcyBm
b3IgcG9pbnRpbmcgdGhpcyBvdXQgYW5kIHN1Z2dlc3RpbmcgdGhpcyBvcHRpbWl6YXRpb24uIFRo
aXMKPiA+ID4gaXMgYSB2ZXJ5IHVzZWZ1bCBzdWdnZXN0aW9uLiBJbiB0aGUgY29tbW9uIGNhc2Ug
bm8gcHJlZW1wdGlvbiBvciBtaWdyYXRpb24KPiA+ID4gb2NjdXJzLCBzbyB0aGUgcHJlZW1wdGlv
biBib29ra2VlcGluZyBhbmQgcmVzY2hlZHVsZSBjaGVjayBhcmUgdW5uZWNlc3NhcnkKPiA+ID4g
b3ZlcmhlYWQuCj4gPiA+Cj4gPiA+IEltcGxlbWVudGluZyB0aGlzIHNjaGVtZSBmb3IgUklTQy1W
IHdpbGwgcmVxdWlyZSBhZGRpdGlvbmFsIGNoYW5nZXMgYmV5b25kCj4gPiA+IHRoZSBjdXJyZW50
IHNlcmllcy4gSWYgdGhpcyBzZXJpZXMgaXMgb3RoZXJ3aXNlIGFjY2VwdGFibGUsIEkgd291bGQg
bGlrZQo+ID4gPiB0byBsYW5kIHRoZSBjdXJyZW50IHRoaXNfY3B1Xyogc3VwcG9ydCBmaXJzdCBh
bmQgdGhlbiBwcmVwYXJlIGEgZm9sbG93LXVwCj4gPiA+IHNlcmllcyB1c2luZyB0aGlzIGFwcHJv
YWNoLgo+ID4KPiA+IEhpIFl1bmh1aSBhbmQgRGF2aWQsCj4gPgo+ID4gRHVyaW5nIHRoZSBtZXJn
ZSB3aW5kb3cgYnV0IGJlZm9yZSByYzEsIEkgaW1wbGVtZW50ZWQgYSByaXNjdiBQT0MKPiA+IGZv
bGxvd2luZyBhcm02NCdzIHByZWVtcHRpYmxlIHRoaXMgY3B1IHNjaGVtZS4gRWFjaCBvcGVyYXRp
b24gcmVjb3Jkcwo+ID4gaXRzIHBlci1jcHUgcG9pbnRlciwgb2Zmc2V0IGFuZCBhZGRyZXNzIHJl
Z2lzdGVycy4gRXhjZXB0aW9uIGVudHJ5IHNhdmVzCj4gPiBhbmQgY2xlYXJzIHRoaXMgc3RhdGUs
IGFuZCBhIG5vaW5zdHIgYyBoZWxwZXIgcmVwYWlycyB0aGUgc2F2ZWQgb2Zmc2V0Cj4gPiBhbmQg
YWRkcmVzcyByZWdpc3RlcnMgb24gZXhjZXB0aW9uIHJldHVybiBhZnRlciBhbnkgbWlncmF0aW9u
Lgo+ID4KPiA+IEhvd2V2ZXIsIG15IFBvQyBpcyBiYXNlZCBvbiBjdXJyZW50IHBlcmNwdSBvZmZz
ZXQuCj4gPgo+ID4gSSBwbGFuZWQgdG8gc2VudCBpdCBvdXQgbGFzdCBTdW5kYXksIGJ1dCB0aGVu
IEkgZm91bmQgWXVuaHVpIHNlbnQKPiA+IGhpcyBwZXJjcHUgc2VyaWVzKHdoaWNoIGlzIHVwIHRv
IHY5LCBJIGRpZG4ndCBrbm93IHRoaXMgYmVmb3JlKSBvbiBTYXQuCj4gPiBTbyBJIGhvbGQgb24g
dGhlIHNlbmRpbmcuCj4gPgo+ID4gTm93IHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gcmViYXNlIHRo
ZSBQb0Mgb24gWXVuaHVpJ3Mgc2VyaWVzIHBhdGNoMiBhbmQKPiA+IHBhdGNoMywgZXNwZWNpYWxs
eSB0aGUgcGVyY3B1IG9mZnNldCBvcHRpbWl6YXRpb24/IEkgY2FuIHBvc3QgYW4gUkZDCj4gPiB3
aXRoIHRoaXMgcmViYXNlZCBpbXBsZW1lbnRhdGlvbi4KPiA+Cj4gCj4gR2l2ZW4gdGhlIHN1YnN0
YW50aWFsIGVmZm9ydCBhbHJlYWR5IGludmVzdGVkIGluIGJyaW5naW5nIHRoaXMgc2VyaWVzCj4g
dG8gdjksIG15IG9yaWdpbmFsIHBsYW4gd2FzIHRvIGxhbmQgdGhlIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24gZmlyc3QKPiBhbmQgYWRkIHRoZSBwcmVlbXB0aWJsZSBzY2hlbWUgYXMgYSBmb2xsb3ct
dXAuCj4gCj4gSG93ZXZlciwgaWYgdGhlIGNvbnNlbnN1cyBpcyB0byBtb3ZlIGRpcmVjdGx5IHRv
IHRoZSBwcmVlbXB0aWJsZSBzY2hlbWUsCj4gSSB3aWxsIGltcGxlbWVudCB0aGlzIHNjaGVtZSBp
biB0aGUgbmV4dCByZXZpc2lvbiwgYnVpbGRpbmcgb24gdGhlCj4gY2FjaGVkIHBlcmNwdSBvZmZz
ZXQgaW50cm9kdWNlZCBpbiBwYXRjaCAyLgo+IAp5ZXMsIEkgc3VnZ2VzdCBnbyB3aXRoIHRoZSBw
cmVlbXB0aWJsZSBkZXNpZ24gZnJvbSB0aGUgYmVnaW5uaW5nLiBJdAphdm9pZHMgaW50cm9kdWNp
bmcgcHJlZW1wdGlvbi1kaXNhYmxlZCB3cmFwcGVycyB0aGF0IHdvdWxkIGxhdGVyIGJlCnJlbW92
ZWQuIEJ1dCB5b3VyIHByZWVtcHRpb24tZGlzYWJsZWQgdmVyc2lvbiBpc24ndCBkcm9wcGVkLCBp
dCBjYW4KYmUgdXNlZCBmb3IgcGVyZm9ybWFuY2UgY29tcGFyaXNvbi4gV2UgY2FuIGRvIHNpbWls
YXIgYmVuY2htYXJrCmFzIGFybTY0IGRvZXM6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWFybS1rZXJuZWwvMjg5Nzg0OTgtMzQ4ZS00Y2ZkLWFmNzItMTE0NmExMDZlOTZiQGFybS5jb20v
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
