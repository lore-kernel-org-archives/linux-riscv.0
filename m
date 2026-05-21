Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6D0CD5BA4
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 11:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92kb3ZP/6CbdP2ZnjZLVKoWQ51L8s2GKsNulgQEyFB4=; b=vUwKB65QzLdTtg
	8d11iyxv/kl68b7taD+tTjIWKU35kQG8wDgX29JB4wWZjSTA1rByZejgNgIgb+lfFqRB1I6z9dhk9
	6FsRmKnRW2PyC+qOXxYPfjYCXuouyYTTa1cBi8bNcgouBc6gcZwzhBiAWLkzbUCgIZuT3Z4dIcfQq
	hAZDK8z6t3wUzsUj6qG4tXJ4YAGvzlOQtVclQisDNld/xBU6d/B+bh3veWmxPSzETmupDvIm+Evh7
	jkvH24XLErWJemdjQg2hP1pdLVeJQKYnpArWilLOR+Kd/TGSUaDAzho1SRkvTJzyQJMHDtVRmf/yz
	s/A0DYZOJ4MQGXqhDBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1uI-00000007eQj-0qKl;
	Thu, 21 May 2026 11:49:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1uF-00000007eQA-35ob
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 11:49:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 595D1444B9;
	Thu, 21 May 2026 11:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D3A1F000E9;
	Thu, 21 May 2026 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779364178;
	bh=yKQZFQJQivqYEiG24E8+0nsOT+Zd9W/rrF3uuiFhuYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E379+kreKGUdE3JddS5g13f5R/SlclmO4lEZnxz6M/CY2IG08YeB9ArMmN+NkC8tu
	 exJD+IdS9L6A2K/2kIggnjHT6hMv6MynuMZDPmrd3GLGlM4PK6b4ZR42Etbwmb8xR8
	 GtkOWrqRl3aTZMPU1EkxUeF/CWmx9tg51Qhm/hLIY4nSz3fFRL4kyUof8U+vhgMDrn
	 UnlokAYyTfxDK+nb4f27XJ76HqrWZJVIGZ2LaPqJYA1IWEOVm24/L5HhTplY7SfDu+
	 sC3HRVpxsVBGfhtkwrbWOgU08QcVxrFMxinaV7ByfUloqFV0x2dHbrkLWtlp5ErfZs
	 iXCPW5kHLWmeg==
Message-ID: <a2a5621f-4be1-4e39-8434-9a6009c8f762@kernel.org>
Date: Thu, 21 May 2026 21:49:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: misaligned: Make enabling delegation depend on
 NONPORTABLE
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Paul Walmsley <pjw@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Songsong Zhang <U2FsdGVkX1@gmail.com>,
 Drew Fustini <fustini@kernel.org>
References: <20260401-riscv-misaligned-dont-delegate-v2-1-5014a288c097@iscas.ac.cn>
 <nrvt74qnojaubiwjo37ums4lnclu466hovwrhmtbag6f5uhrql@q6msoe2oto4b>
 <cec3dd9c-37d8-4859-bfe0-a42ee3efdc97@iscas.ac.cn>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <cec3dd9c-37d8-4859-bfe0-a42ee3efdc97@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_044939_813142_D1DBF72D 
X-CRM114-Status: GOOD (  18.68  )
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

T24gMjEvNS8yMDI2IDEwOjI3LCBWaXZpYW4gV2FuZyB3cm90ZToKPiAKPiBPbiA1LzIwLzI2IDIz
OjQ3LCBBbmlydWRoIFNyaW5pdmFzYW4gd3JvdGU6Cj4+IEhpIFZpdmlhbiwgUGF1bAo+Pgo+PiBP
biBXZWQsIEFwciAwMSwgMjAyNiBhdCAwOTo1MzoxN0FNICswODAwLCBWaXZpYW4gV2FuZyB3cm90
ZToKPj4+IFRoZSB1bmFsaWduZWQgYWNjZXNzIGVtdWxhdGlvbiBjb2RlIGluIExpbnV4IGhhcyB2
YXJpb3VzIGRlZmljaWVuY2llcy4KPj4+IEZvciBleGFtcGxlLCBpdCBkb2Vzbid0IGVtdWxhdGUg
dmVjdG9yIGluc3RydWN0aW9ucyBbMV0gWzJdLCBhbmQgZG9lc24ndAo+Pj4gZW11bGF0ZSBLVk0g
Z3Vlc3QgYWNjZXNzZXMuIFRoZXJlZm9yZSwgcmVxdWVzdGluZyBtaXNhbGlnbmVkIGV4Y2VwdGlv
bgo+Pj4gZGVsZWdhdGlvbiB3aXRoIFNCSSBGV0ZUIGFjdHVhbGx5IHJlZ3Jlc3NlcyB2ZWN0b3Ig
aW5zdHJ1Y3Rpb25zJyBhbmQgS1ZNCj4+PiBndWVzdHMnIGJlaGF2aW9yLgo+Pj4KPj4+IFVudGls
IExpbnV4IGNhbiBoYW5kbGUgaXQgcHJvcGVybHksIGd1YXJkIHRoZXNlIHNiaV9md2Z0X3NldCgp
IGNhbGxzCj4+PiBiZWhpbmQgUklTQ1ZfU0JJX0ZXRlRfREVMRUdBVEVfTUlTQUxJR05FRCwgd2hp
Y2ggaW4gdHVybiBkZXBlbmRzIG9uCj4+PiBOT05QT1JUQUJMRS4gVGhvc2Ugd2hvIGFyZSBzdXJl
IHRoYXQgdGhpcyB3b3VsZG4ndCBiZSBhIHByb2JsZW0gY2FuCj4+PiBlbmFibGUgdGhpcyBvcHRp
b24sIHBlcmhhcHMgZ2V0dGluZyBiZXR0ZXIgcGVyZm9ybWFuY2UuCj4+Pgo+Pj4gVGhlIHJlc3Qg
b2YgdGhlIGV4aXN0aW5nIGNvZGUgcHJvY2VlZHMgYXMgYmVmb3JlLCBleGNlcHQgYXMgaWYKPj4+
IFNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHIGlzIG5vdCBhdmFpbGFibGUsIHRvIGhhbmRs
ZSBhbnkgcmVtYWluaW5nCj4+PiBhZGRyZXNzIG1pc2FsaWduZWQgZXhjZXB0aW9ucyBvbiBhIGJl
c3QtZWZmb3J0IGJhc2lzLiBUaGUgS1ZNIFNCSSBGV0ZUCj4+PiBpbXBsZW1lbnRhdGlvbiBpcyBh
bHNvIG5vdCB0b3VjaGVkLCBidXQgaXQgaXMgZGlzYWJsZWQgaWYgdGhlIGZpcm13YXJlCj4+PiBl
bXVsYXRlcyB1bmFsaWduZWQgYWNjZXNzZXMuCj4+IE9uIGEgVGVuc3RvcnJlbnQgQmxhY2tob2xl
IHdpdGggU2lGaXZlIHgyODAgY29yZXMsIHdpdGggT3BlblNCSSAxLjcgYW5kCj4+IGRlZmNvbmZp
ZyBrZXJuZWwsIEknbSBzZWVpbmcgYSBidW5jaCBvZiBoYW5ncy9vcGVuc2JpIHByaW50cyBhdCBi
b290IHRpbWUuCj4+IFdpdGhvdXQgdGhpcyBwYXRjaCwgdGhlIGJvb3QgcHJpbnRzIHRoaXMgYW5k
IGNvbnRpbnVlcyBvbi4KPj4KPj4gWyAgICAwLjIyNjMzOV0gU0JJIG1pc2FsaWduZWQgYWNjZXNz
IGV4Y2VwdGlvbiBkZWxlZ2F0aW9uIG9rCj4gCj4gWW91ciBPcGVuU0JJIGxvb2tzIHZlcnkgYnJv
a2VuIChtb3JlIG9uIHdoYXQgSSBtZWFuIGxhdGVyKSwgYW5kIGluIGEgd2F5Cj4gdGhhdCBtaWdo
dCBvbmx5IG1hbmlmZXN0IGlmIGl0J3MgdHJ5aW5nIHRvIGVtdWxhdGUgdmVjdG9yIG1pc2FsaWdu
ZWQKPiBpbnN0cnVjdGlvbnM/IEFuIGludGVyZXN0aW5nIHRoaW5nIEkgY2FuIHRoaW5rIG9mIGlz
IG1heWJlIHlvdXIgU2lGaXZlCj4geDI4MCBoYXMgYSB2ZXJ5IGxvbmcgVkxFTiAoNTEyPyAxMDI0
PyBJIGZvcmdvdCkgd2hpY2ggbWF5IGhhdmUgZXhwb3NlZAo+IHNvbWUgc3R1ZmYuLi4KCkl0J3Mg
NTEyLgoKPiBJIGhhdmUgdHdvIGlkZWFzOgo+IAo+IEZpcnN0bHksIHRyeSBidW1waW5nIHRoaXMg
aW4gaW5jbHVkZS9zYmkvc2JpX3BsYXRmb3JtLmggdXAgdG8gNjU1MzYgb3IKPiBzb21ldGhpbmcg
bGlrZSB0aGF0LiBJZiB0aGF0IHdvcmtzIHlvdSBjYW4gYWxzbyBzdGFydCB0cnlpbmcgdG8gbG93
ZXIgaXQKPiB0byAxNjM4NCBvciBzb21ldGhpbmcgc2ltaWxhci4KPiAKPiAjZGVmaW5lIFNCSV9Q
TEFURk9STV9ERUZBVUxUX0hBUlRfU1RBQ0tfU0laRcKgIMKgIDgxOTIKClllcCwgYnVtcGluZyB0
aGF0IHRvIDE2Mzg0IGZpeGVzIGl0IGZvciBtZS4KClRoZSBjdWxwcml0IGlzIGluIGxpYi9zYmkv
c2JpX3RyYXBfdl9sZHN0LmM6CgojZGVmaW5lIFZMRU5fTUFYIDY1NTM2Ci4uLgoKaW50IHNiaV9t
aXNhbGlnbmVkX3ZfbGRfZW11bGF0b3IoaW50IHJsZW4sIHVuaW9uIHNiaV9sZHN0X2RhdGEgKm91
dF92YWwsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBf
Y29udGV4dCAqdGNudHgpCnsKICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV90cmFwX2luZm8gKm9y
aWdfdHJhcCA9ICZ0Y250eC0+dHJhcDsKLi4uCiAgICAgICAgIHVpbnQ4X3QgbWFza1tWTEVOX01B
WCAvIDhdOwoKCmllLiA4S0Igb24gc3RhY2sgYnVmZmVyLgoKU2hyaW5raW5nIFZMRU5fTUFYIHRv
IDQwOTYgYWxzbyBnZXRzIGl0IGJvb3RpbmcuIEJ1dCBJIGd1ZXNzIHRoYXQncyBub3QgCnZpYWJs
ZSBiZWNhdXNlIGluIHRoZW9yeSBzb21lb25lIG1pZ2h0IGJ1aWxkIGEgY2hpcCB3aXRoIFZMRU4g
NjU1MzYgb25lIGRheT8KCldvdWxkIGEgaGVhcCBhbGxvY2F0aW9uIGF0IGJvb3QgYmUgYmV0dGVy
PwoKT3IganVzdCBmb3JjZSB0aGUgc3RhY2sgdG8gYmUgYmlnZ2VyIHdoZW4gdmVjdG9yIGlzIGVu
YWJsZWQsIGVnOgoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oIGIvaW5j
bHVkZS9zYmkvc2JpX3BsYXRmb3JtLmgKaW5kZXggZmUzODJiNTYuLjUyZWQ0OGFmIDEwMDY0NAot
LS0gYS9pbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaAorKysgYi9pbmNsdWRlL3NiaS9zYmlfcGxh
dGZvcm0uaApAQCAtMTYwLDcgKzE2MCwxMSBAQCBzdHJ1Y3Qgc2JpX3BsYXRmb3JtX29wZXJhdGlv
bnMgewogIH07CgogIC8qKiBQbGF0Zm9ybSBkZWZhdWx0IHBlci1IQVJUIHN0YWNrIHNpemUgZm9y
IGV4Y2VwdGlvbi9pbnRlcnJ1cHQgCmhhbmRsaW5nICovCisjaWZkZWYgT1BFTlNCSV9DQ19TVVBQ
T1JUX1ZFQ1RPUgorI2RlZmluZSBTQklfUExBVEZPUk1fREVGQVVMVF9IQVJUX1NUQUNLX1NJWkUg
ICAxNjM4NAorI2Vsc2UKICAjZGVmaW5lIFNCSV9QTEFURk9STV9ERUZBVUxUX0hBUlRfU1RBQ0tf
U0laRSAgIDgxOTIKKyNlbmRpZgoKICAvKiogUGxhdGZvcm0gZGVmYXVsdCBoZWFwIHNpemUgKi8K
ICAjZGVmaW5lIFNCSV9QTEFURk9STV9ERUZBVUxUX0hFQVBfU0laRShfX251bV9oYXJ0KSAgICAg
XAoKY2hlZXJzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
