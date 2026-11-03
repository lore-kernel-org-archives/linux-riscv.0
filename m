Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A028606A324
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 04:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=llTkWP2i;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mkciFVIq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nyoU3zJaXnr4o82WVQhjCGttHe0/9d/0X9JYgD9HRtU=; b=llTkWP2iwSSfdcgiwrDz13xYRz
	coEhB0ghbsL1JzDYUj9aWvR+Jlf+CzbwcRZf9L7mZIeWMbEh/Iilb05SZLhC9KYotxy4KD7nKz9Uh
	7BIAbh40Bg4NYj1W48F5FvkZt1awft7A/JoK8xIudcwbSIqTruhoCu2GW3oAqFrL/NJ0YUjWhB25w
	H7JnKIC3rw8DlKXk6n+5hHbURGrNeY1yB7QHKmKKg8FgkwxGoXU92LDO2yiGFTZQihoUyEn7CwCx0
	LuEg4CIbtDa9hcF6YIu7fCVJqf5IzgnpJiAJ2vi5934ME3FHtHpZoKmQ+PHh/HnUxL4lTjTsQsdqW
	LbqtoxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5if-00000000yHO-2mIH;
	Tue, 03 Nov 2026 04:01:57 +0000
Received: from out-7.mta0.migadu.com ([2001:41d0:1004:224b::7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5ic-00000000yGp-0cbb
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 04:01:56 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CKEHs2xNjn3vFUKXk/OC1dgxFsocWFipvyVq/CmrhPw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793678508; v=1; x=1794283308;
 b=mkciFVIqfGgD8r4GUzUx/IMdlICBgx1UnRaGabM3UodtroGDLhWeiFlH/0shEeRCZGP5IB92
 06thgCYP1xhGDvEoArNEuo+ZSvUlgpHl6Lnk9yZfhdVp/+l5+caYDg1VrFQ9lN820ojB4KYhvkg
 gcPXLyqFh4T7yntjinwdzxZY=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 54dd4c98615b8fc8;
	Tue, 03 Nov 2026 04:01:48 +0000
X-Mizu-Trace-ID: 54dd4c98615b8fc8
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH] riscv: mm: Add KASAN shadow mapping to flush_cache_vmap()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261102134422.610837-1-alitariq45892@gmail.com>
Date: Tue, 3 Nov 2026 12:01:27 +0800
Cc: Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org,
 Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>,
 Yunhui Cui <cuiyunhui@bytedance.com>,
 Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 kasan-dev@googlegroups.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Message-Id: <63411FA9-C16A-4E40-8C3C-13C58FB844A0@linux.dev>
References: <20261102134422.610837-1-alitariq45892@gmail.com>
To: Ali Tariq <alitariq45892@gmail.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_200155_310835_CD5FA846 
X-CRM114-Status: GOOD (  11.32  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cgo+IE9uIE5vdiAyLCAyMDI2LCBhdCAyMTo0NCwgQWxpIFRhcmlxIDxhbGl0YXJpcTQ1ODkyQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gCj4gZmx1c2hfY2FjaGVfdm1hcCgpIHNldHMgYSBwZXItQ1BVIGZs
YWcsIGFuZCBhIGtlcm5lbCBwYWdlIGZhdWx0Cj4gdGhhdCBmaW5kcyB0aGUgZmxhZyBzZXQgZ2V0
cyBhbiBzZmVuY2Uudm1hIGFuZCBhIHJldHJ5Lgo+IGZsdXNoX2NhY2hlX3ZtYXAoKSBvbmx5IHNl
dHMgdGhlIGZsYWcgZm9yIHZtYWxsb2MsIG1vZHVsZSBhbmQgdm1lbW1hcAo+IHJhbmdlcy4ga2Fz
YW5fcG9wdWxhdGVfdm1hbGxvYygpIG1hcHMgbmV3IHNoYWRvdyBwYWdlcyBhbmQgY2FsbHMKPiBm
bHVzaF9jYWNoZV92bWFwKCkgb24gdGhlIHNoYWRvdyByYW5nZSwgc28gbm8gZmxhZyBnZXRzIHNl
dC4KPiBGb3Igdm1hcCgpLXN0eWxlIGFyZWFzLCBrYXNhbl91bnBvaXNvbl92bWFsbG9jKCkgd3Jp
dGVzCj4gdGhlIG5ldyBzaGFkb3cgcmlnaHQgYXdheS4gSWYgdGhlIENQVSBoYXNu4oCZdCBzZWVu
IHRoZSBuZXcgZW50cnkgeWV0LAo+IHRoZSBzdG9yZSBmYXVsdHMsIGFuZCBzaW5jZSB0aGVyZSBp
cyBubyBmbGFnIHNldCwgdGhlIGtlcm5lbCBjcmFzaGVzLgo+IAo+IFsgICAgMC42NzUyMTZdIFVu
YWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyBm
ZmZmZmZmN2MwMDlhMDAwCj4gQ3VycmVudCBzd2FwcGVyLzAgcGd0YWJsZTogNEsgcGFnZXNpemUs
IDM5LWJpdCBWQXMsIHBnZHA9MHgwMDAwMDAwMDA0NTA0MDAwCj4gW2ZmZmZmZmY3YzAwOWEwMDBd
IHBnZD0wMDAwMDAwMDlmZjZlMDAxLCBwNGQ9MDAwMDAwMDA5ZmY2ZTAwMSwgcHVkPTAwMDAwMDAw
OWZmNmUwMDEsIHBtZD0wMDAwMDAwMDQwMGU3NDAxLCBwdGU9MDAwMDAwMDA0MDNjYjBlNwo+IHN0
YXR1czogMDAwMDAwMDIwMDAwMDEyMCBiYWRhZGRyOiBmZmZmZmZmN2MwMDlhMDAwIGNhdXNlOiAw
MDAwMDAwMDAwMDAwMDBmCj4gX19tZW1zZXQrMHg2MC8weGZlCj4ga2FzYW5fdW5wb2lzb24rMHgy
Ni8weDRlCj4gX19rYXNhbl91bnBvaXNvbl92bWFsbG9jKzB4MjAvMHgyZQo+IF9fZ2V0X3ZtX2Fy
ZWFfbm9kZSsweDFjNi8weDI3Ngo+IGdldF92bV9hcmVhX2NhbGxlcisweDUyLzB4ODQKPiB2bWFw
KzB4ZjAvMHgyNjQKPiBkbWFfY29tbW9uX2NvbnRpZ3VvdXNfcmVtYXArMHhhMC8weGQwCj4gYXRv
bWljX3Bvb2xfZXhwYW5kKzB4YjYvMHgzMTAKPiBfX2RtYV9hdG9taWNfcG9vbF9pbml0LmlzcmEu
MCsweGY2LzB4MWMwCj4gZG1hX2F0b21pY19wb29sX2luaXQrMHhmNi8weDFhYQo+IGRvX29uZV9p
bml0Y2FsbCsweDEzNC8weDkyOAo+IGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4NTMyLzB4NjBhCj4g
a2VybmVsX2luaXQrMHgyOC8weDE2Mgo+IHJldF9mcm9tX2Zvcmtfa2VybmVsKzB4ODIvMHg5NGMK
PiByZXRfZnJvbV9mb3JrX2tlcm5lbF9hc20rMHgxNi8weDE4Cj4gCj4gVGhlIFBURSBpcyB2YWxp
ZCwgc28gdGhlIG1hcHBpbmcgd2FzIGluIHBsYWNlIHdoZW4gdGhlIENQVSBmYXVsdGVkLgo+IAo+
IFRlc3RlZCBvbiBPcmFuZ2UgUGkgUlYyOiB3aXRob3V0IHRoaXMgcGF0Y2ggMiBvZiAzMCBib290
cyBjcmFzaGVkLAo+IHdpdGggaXQgNTAgb2YgNTAgYm9vdGVkLgo+IAo+IEFkZCB0aGUgS0FTQU4g
c2hhZG93IHJlZ2lvbiB0byB0aGUgcmFuZ2VzIGZvciB3aGljaCBmbHVzaF9jYWNoZV92bWFwKCkK
PiBjYWxscyBtYXJrX25ld192YWxpZF9tYXAoKSwgYXMgY29tbWl0IDRlZGQ3MGVlNmE3ZCAoIm1t
L3NwYXJzZS12bWVtbWFwOgo+IGZsdXNoX2NhY2hlX3ZtYXAoKSBhZnRlciBob3RwbHVnZ2luZyB2
bWVtbWFwIikgZGlkIGZvciB2bWVtbWFwLgo+IAo+IEZpeGVzOiA1MDM2MzhlMGJhYmYgKCJyaXNj
djogU3RvcCBlbWl0dGluZyBwcmV2ZW50aXZlIHNmZW5jZS52bWEgZm9yIG5ldyB2bWFsbG9jIG1h
cHBpbmdzIikKPiBTaWduZWQtb2ZmLWJ5OiBBbGkgVGFyaXEgPGFsaXRhcmlxNDU4OTJAZ21haWwu
Y29tPgoKQWNrZWQtYnk6IE11Y2h1biBTb25nIDxtdWNodW4uc29uZ0BsaW51eC5kZXY+CgpUaGFu
a3MuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
