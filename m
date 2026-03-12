Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1537105A586
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzPHiPkZZHJQ3Y7j20r7H/TZ2fI0ygoJsQ6McQXDyUQ=; b=auEMcZ1CS0OtC3
	ce8uhf+qb+KxFmLxl3XK5OWwrZWgz3+imsEx0in+D3UHCXHh7aLsNj8TuOOkhca/9cMS2mEZvERKV
	AqGD1AdYQiH9gp+1I/ge0k2UBD5NkX+FkKmRuPozbo+BmTGBAdaPPnEenUJACGw03qciaJW9QyYrX
	k2nBqQ1miYxQFIDOiNCFqXGz6gfqk0nYOViSPlGdadnlJboXAZ4ziZJ+ndbBQw6vBp9zEskuhONKu
	h7U+C7EHrEZDwbTlQypujUWud/FzAmY5VkPu3bCFhIfejVRrF8/E78/nqrP/b5NqeuTD9Gj/aQRMv
	QOBA/hLJi9gPgfQTVXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0e94-0000000DwHF-44Gm;
	Thu, 12 Mar 2026 11:24:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0e92-0000000DwGf-1NbB;
	Thu, 12 Mar 2026 11:24:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88FA9403C8;
	Thu, 12 Mar 2026 11:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32B8C4CEF7;
	Thu, 12 Mar 2026 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773314639;
	bh=QmUndoWKkvGu15ytPgiNk/W/zfIzuga6NPM0kq37X6g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gddxThvuN8nEkxb1oe2xYVqYBPcAGoZjE0JamctgWmvcBJC+2RXK4H1Oaf+f3JOwW
	 fxwH+WLkxZbJY0MknBkur5pI7FCchUtXNdDKsThu5lMuoBANKs+UeoyfTMkJ1sO3+r
	 4hpyJwTo29UlAt3cBAFFMBFuxc1orHcop3iw89T3rJ87yz2VKPaAXnDxEi2c/fTd87
	 eJ/zbtp6tA8W/XODS6RYQsmWksPaTPRpOv5PRjQnkFFww5eYDtX/ErhgfeDObPX20h
	 SEdGEgkqgOZOHOJQuURbLLXig62kg6JD5Fx4CH2RFeTqabIPhh1ARDfQqZ3yTDKMjS
	 /FQjMq5HRAp3w==
Message-ID: <0bc30137-3f1d-4a4a-8573-8f26866fcc26@kernel.org>
Date: Thu, 12 Mar 2026 12:23:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] arch/powerpc: don't initialize kasan if it's
 disabled
To: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan He <bhe@redhat.com>,
 kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org, andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
 glider@google.com, dvyukov@google.com, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, linux-s390@vger.kernel.org, hca@linux.ibm.com
References: <20260225081412.76502-1-bhe@redhat.com>
 <20260225081412.76502-10-bhe@redhat.com>
 <71921cca-b890-41c4-93e9-957d3f647ffa@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <71921cca-b890-41c4-93e9-957d3f647ffa@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_042400_408801_4179A2AD 
X-CRM114-Status: GOOD (  16.15  )
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

CgpMZSAxMi8wMy8yMDI2IMOgIDEyOjEyLCBTb3VyYWJoIEphaW4gYSDDqWNyaXTCoDoKPiAKPiAK
PiBPbiAyNS8wMi8yNiAxMzo0NCwgQmFvcXVhbiBIZSB3cm90ZToKPj4gSGVyZSwga2FzYW4gaXMg
ZGlzYWJsZWQgaWYgc3BlY2lmaWVkICdrYXNhbj1vZmYnIGluIGtlcm5lbCBjbWRsaW5lLgo+Pgo+
PiBUaGlzIGluY2x1ZGVzIDMyYml0LCBib29rM3MvNjQgYW5kIGJvb2szZS82NC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Cj4+IENjOiBsaW51eHBwYy1k
ZXZAbGlzdHMub3psYWJzLm9yZwo+PiAtLS0KPj4gwqAgYXJjaC9wb3dlcnBjL21tL2thc2FuL2lu
aXRfMzIuY8KgwqDCoMKgwqDCoMKgIHwgNiArKysrKy0KPj4gwqAgYXJjaC9wb3dlcnBjL21tL2th
c2FuL2luaXRfYm9vazNlXzY0LmMgfCA0ICsrKysKPj4gwqAgYXJjaC9wb3dlcnBjL21tL2thc2Fu
L2luaXRfYm9vazNzXzY0LmMgfCA0ICsrKysKPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
bW0va2FzYW4vaW5pdF8zMi5jIGIvYXJjaC9wb3dlcnBjL21tL2thc2FuLyAKPj4gaW5pdF8zMi5j
Cj4+IGluZGV4IDFkMDgzNTk3NDY0Zi4uMGVhMmE2MzZjOTkyIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Bvd2VycGMvbW0va2FzYW4vaW5pdF8zMi5jCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9rYXNh
bi9pbml0XzMyLmMKPj4gQEAgLTE0MSw2ICsxNDEsMTAgQEAgdm9pZCBfX2luaXQga2FzYW5faW5p
dCh2b2lkKQo+PiDCoMKgwqDCoMKgIHU2NCBpOwo+PiDCoMKgwqDCoMKgIGludCByZXQ7Cj4+ICvC
oMKgwqAgLyogSWYgS0FTQU4gaXMgZGlzYWJsZWQgdmlhIGNvbW1hbmQgbGluZSwgZG9uJ3QgaW5p
dGlhbGl6ZSBpdC4gKi8KPj4gK8KgwqDCoCBpZiAoa2FzYW5fYXJnX2Rpc2FibGVkKQo+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuOwo+PiArCj4+IMKgwqDCoMKgwqAgZm9yX2VhY2hfbWVtX3Jhbmdl
KGksICZiYXNlLCAmZW5kKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwaHlzX2FkZHJfdCB0b3Ag
PSBtaW4oZW5kLCB0b3RhbF9sb3dtZW0pOwo+PiBAQCAtMTcwLDcgKzE3NCw3IEBAIHZvaWQgX19p
bml0IGthc2FuX2luaXQodm9pZCkKPj4gwqAgdm9pZCBfX2luaXQga2FzYW5fbGF0ZV9pbml0KHZv
aWQpCj4+IMKgIHsKPj4gLcKgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfS0FTQU5fVk1BTExP
QykpCj4+ICvCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0tBU0FOX1ZNQUxMT0MpICYmIGth
c2FuX2VuYWJsZWQoKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGthc2FuX3VubWFwX2Vhcmx5X3No
YWRvd192bWFsbG9jKCk7Cj4+IMKgIH0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9r
YXNhbi9pbml0X2Jvb2szZV82NC5jIGIvYXJjaC9wb3dlcnBjL21tLyAKPj4ga2FzYW4vaW5pdF9i
b29rM2VfNjQuYwo+PiBpbmRleCAwZDNhNzNkNmQ0YjAuLmZiZTRjOWE3ZTQ2MCAxMDA2NDQKPj4g
LS0tIGEvYXJjaC9wb3dlcnBjL21tL2thc2FuL2luaXRfYm9vazNlXzY0LmMKPj4gKysrIGIvYXJj
aC9wb3dlcnBjL21tL2thc2FuL2luaXRfYm9vazNlXzY0LmMKPj4gQEAgLTExMSw2ICsxMTEsMTAg
QEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+PiDCoMKgwqDCoMKgIHU2NCBpOwo+PiDC
oMKgwqDCoMKgIHB0ZV90IHplcm9fcHRlID0gcGZuX3B0ZSh2aXJ0X3RvX3BmbihrYXNhbl9lYXJs
eV9zaGFkb3dfcGFnZSksIAo+PiBQQUdFX0tFUk5FTF9STyk7Cj4+ICvCoMKgwqAgLyogSWYgS0FT
QU4gaXMgZGlzYWJsZWQgdmlhIGNvbW1hbmQgbGluZSwgZG9uJ3QgaW5pdGlhbGl6ZSBpdC4gKi8K
Pj4gK8KgwqDCoCBpZiAoa2FzYW5fYXJnX2Rpc2FibGVkKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuOwo+PiArCj4+IMKgwqDCoMKgwqAgZm9yX2VhY2hfbWVtX3JhbmdlKGksICZzdGFydCwgJmVu
ZCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGthc2FuX2luaXRfcGh5c19yZWdpb24ocGh5c190b192
aXJ0KHN0YXJ0KSwgcGh5c190b192aXJ0KGVuZCkpOwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL21tL2thc2FuL2luaXRfYm9vazNzXzY0LmMgYi9hcmNoL3Bvd2VycGMvbW0vIAo+PiBrYXNh
bi9pbml0X2Jvb2szc182NC5jCj4+IGluZGV4IGRjYWZhNjQxODA0Yy4uZjc5MDZmOWVmOWJlIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0va2FzYW4vaW5pdF9ib29rM3NfNjQuYwo+PiAr
KysgYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4vaW5pdF9ib29rM3NfNjQuYwo+PiBAQCAtNTQsNiAr
NTQsMTAgQEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+PiDCoMKgwqDCoMKgIHU2NCBp
Owo+PiDCoMKgwqDCoMKgIHB0ZV90IHplcm9fcHRlID0gcGZuX3B0ZSh2aXJ0X3RvX3BmbihrYXNh
bl9lYXJseV9zaGFkb3dfcGFnZSksIAo+PiBQQUdFX0tFUk5FTCk7Cj4+ICvCoMKgwqAgLyogSWYg
S0FTQU4gaXMgZGlzYWJsZWQgdmlhIGNvbW1hbmQgbGluZSwgZG9uJ3QgaW5pdGlhbGl6ZSBpdC4g
Ki8KPj4gK8KgwqDCoCBpZiAoa2FzYW5fYXJnX2Rpc2FibGVkKQo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuOwo+PiArCj4+IMKgwqDCoMKgwqAgaWYgKCFlYXJseV9yYWRpeF9lbmFibGVkKCkpIHsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHByX3dhcm4oIktBU0FOIG5vdCBlbmFibGVkIGFzIGl0IHJl
cXVpcmVzIHJhZGl4ISIpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+IAo+IFNob3Vs
ZCB3ZSBsb2cgaW4gdGhlIGtlcm5lbCBsb2cgYnVmZmVyIHRoYXQgS0FTQU4gaXMgZGlzYWJsZWQ/
Cj4gCj4gUmlnaHQgbm93LCBJIGRvbid0IHNlZSB0aGUga2VybmVsIGFkdmVydGlzaW5nIHRoZSBz
YW1lLgoKV2hlbiBLQVNBTiBpcyBlbmFibGVkIGl0IGlzIGFkdmVydGlzZWQgd2l0aDoKCglwcl9p
bmZvKCJLZXJuZWxBZGRyZXNzU2FuaXRpemVyIGluaXRpYWxpemVkIChnZW5lcmljKVxuIik7CgpJ
c24ndCB0aGUgYWJzZW5jZSBvZiB0aGF0IG1lc3NhZ2UgZW5vdWdoIHRvIHVuZGVyc3RhbmQgS0FT
QU4gaXMgbm90IHRoZXJlID8KCj4gCj4gJCBkbWVzZyB8IGdyZXAgLWkga2FzYW4KPiBbwqAgwqAg
MC4wMDAwMDBdIEtlcm5lbCBjb21tYW5kIGxpbmU6IEJPT1RfSU1BR0U9KGllZWUxMjc1Ly92ZGV2
aWNlL3YtIAo+IHNjc2lAMzAwMDAwNzAvZGlza0A4MTAwMDAwMDAwMDAwMDAwLG1zZG9zMikvdm1s
aW51ei03LjAuMC1yYzMrIAo+IGNyYXNoa2VybmVsPTJHIGthc2FuPW9mZgo+IAo+IFRlc3RlZCB0
aGlzIHNlcmllcyBvbiBwb3dlcnBjIFBzZXJpZXMgcGxhdGZvcm0uCj4gU28gZmVlbCBmcmVlIHRv
IGFkZDoKPiBUZXN0ZWQtYnk6IFNvdXJhYmggSmFpbiA8c291cmFiaGphaW5AbGludXguaWJtLmNv
bT4KPiAKPiAtIFNvdXJhYmggSmFpbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
