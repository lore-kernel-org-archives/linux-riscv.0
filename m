Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C058C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 07:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXYCyu2wDXHo4LjyG4T1XTL99uGRpHBnZCQwNd91Br0=; b=ZqzzLY96aVqycH
	2x1qfE3LkrVxPLvcyg4zTFKB6ec30MT0zqV8xkcEVMGLqaB1x4e6UTQrURoi+AVC2Ud0RALdjm+9m
	G+Y1+17FfmcOHCVMl28dIwq+I/JHdxWx1BjuTfZPw0vXOh9rN/tUVd9ZA3EdrBk7Q7OczWN58D71K
	tqeiQNTyemTieMg5XoHdbifdHgCqx4DTmZI3flqVjivy6u7yW7aInDWKgO/34eoSUrI9wGKYpRhPZ
	VKRdYVaadon+1GbzDzUzKjF/U9w+jf6jzKgBa7y2vYKXx10jMouNgLOGAQ+gB3bUvyHbN1FeOOPMJ
	4IGE5+4pGmvDDoKxwI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSBzh-005246-5F; Wed, 15 Feb 2023 07:14:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSBzc-00522p-Ow; Wed, 15 Feb 2023 07:14:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 98CA6CE1DF8;
	Wed, 15 Feb 2023 07:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52967C433D2;
	Wed, 15 Feb 2023 07:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676445250;
	bh=IFO9sYbIUX6Yq5A71YlDyaYjEk+QPXRW1MBebM0CY24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ufPV1INsobzI+bbgACjVvUu4CWBA/JUPH1k//GKfsxCrR38knRH1n/PBVdWMtVpgh
	 Bf2bs/EaGC4WaxLgbgHx1XxorrV46MDaUNYwqLSKy25BExhNs+uSDm0xl6V0Sz5g9f
	 nFp03DiZF11ofiGs82NcVZr3v6PshcZxfS75qmayzoJ16GEMjLlbbg+0d0looZsMmo
	 Kaw1VgX/VAKIxvWInXXPC6QIzjOgOmRw63hyIC9leJ36+yEnuReFCc5uzI9a7hm3Pb
	 DmI9/xV1+QRuAQfuLS2bdRph9xgujPtcEvvL3jZOHiyIcLw3rPO12uSTi3I7T4WVCt
	 bMk7ShxaoM51A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 anup@brainfault.org, atishp@atishpatra.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew
 Jones <ajones@ventanamicro.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
 <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, Vincent
 Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, Li Zhengyu
 <lizhengyu3@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context
 in the first-use trap
In-Reply-To: <5e440cfa-27c5-f216-5529-350ac19c07ff@rivosinc.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
 <875ycdy22c.fsf@all.your.base.are.belong.to.us>
 <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
 <87sff8ags6.fsf@all.your.base.are.belong.to.us>
 <CABgGipXSsqgtTx9bCy-gt7CTBkXN--t1wHgLfCxA3=vs6y+qUw@mail.gmail.com>
 <873578faxg.fsf@all.your.base.are.belong.to.us>
 <5e440cfa-27c5-f216-5529-350ac19c07ff@rivosinc.com>
Date: Wed, 15 Feb 2023 08:14:08 +0100
Message-ID: <87wn4jjt8f.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_231417_215084_A4697EA4 
X-CRM114-Status: GOOD (  25.11  )
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

VmluZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgoKPiBPbiAyLzE0LzIz
IDA4OjUwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZp
dmUuY29tPiB3cml0ZXM6Cj4+Cj4+PiBIZXkgQmrDtnJuLAo+Pj4KPj4+IE9uIFR1ZSwgRmViIDE0
LCAyMDIzIGF0IDI6NDMgUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6
Cj4+Pj4gU28sIHR3byBjaGFuZ2VzOgo+Pj4+Cj4+Pj4gMS4gRGlzYWxsb3cgVi1lbmFibGVtZW50
IGlmIHRoZSBleGlzdGluZyBhbHRzdGFjayBkb2VzIG5vdCBmaXQgYSBWLXNpemVkCj4+Pj4gICAg
IGZyYW1lLgo+Pj4gVGhpcyBjb3VsZCBwb3RlbnRpYWxseSBicmVhayBvbGQgcHJvZ3JhbXMgKG5v
bi1WKSB0aGF0IGxvYWQgbmV3IHN5c3RlbQo+Pj4gbGlicmFyaWVzICh3aXRoIFYpLCBJZiB0aGUg
cHJvZ3JhbSBzZXRzIGEgc21hbGwgYWx0IHN0YWNrIGFuZCB0YWtlcwo+Pj4gdGhlIGZhdWx0IGlu
IHNvbWUgbGlicmFyaWVzIHRoYXQgdXNlIFYuIEhvd2V2ZXIsIGV4aXN0aW5nCj4+PiBpbXBsZW1l
bnRhdGlvbiB3aWxsIGFsc28ga2lsbCB0aGUgcHJvY2VzcyB3aGVuIHRoZSBzaWduYWwgYXJyaXZl
cywKPj4+IGZpbmRpbmcgaW5zdWZmaWNpZW50IHN0YWNrIGZyYW1lIGluIHN1Y2ggY2FzZXMuIEkn
ZCBjaG9vc2UgdGhlIHNlY29uZAo+Pj4gb25lIGlmIHdlIG9ubHkgaGF2ZSB0aGVzZSB0d28gb3B0
aW9ucywgYmVjYXVzZSB0aGVyZSBpcyBhIGNoYW5jZSB0aGF0Cj4+PiB0aGUgc2lnbmFsIGhhbmRs
ZXIgbWF5IG5vdCBldmVuIHJ1bi4KPj4gSSB0aGluayB3ZSBtaWdodCBoYXZlIGRpZmZlcmVudCB2
aWV3cyBoZXJlLiBBIHByb2Nlc3MgaGFzIGEgcHJlLVYsIGEgYW5kCj4+IHBvc3QtViBzdGF0ZS4g
SXMgYWxsb3dpbmcgYSBwcm9jZXNzIHRvIGVudGVyIFYgd2l0aG91dCB0aGUgY29ycmVjdAo+PiBw
cmVjb25kaXRpb25zIGEgZ29vZCBpZGVhPyBBbGxvdyB0byBydW4gd2l0aCBWIHR1cm5lZCBvbiwg
YnV0IG5vdCBhYmxlCj4+IHRvIGNvcnJlY3RseSBoYW5kbGUgYSBzaWduYWwgKHRoZSBzdGFjayBp
cyB0b28gc21hbGwpPwo+Cj4gVGhlIHJlcXVpcmVtZW50IGlzIHNhbmUsIGJ1dCB0aGUgaXNzdWUg
aXMgdXNlciBleHBlcmllbmNlOiBVc2VyIHRyeWluZyAKPiB0byBicmluZyB1cCBzb21lIFYgY29k
ZSBoYXMgbm8gY2x1ZSB0aGF0IGRlZXAgaW4gc29tZSBzdGFydHVwIGNvZGUgc29tZSAKPiBhbHQg
c3RhY2sgaGFkIGJlZW4gc2V0dXAgYW5kIGNhdXNpbmcgaGlzIHByb2Nlc3MgdG8gYmUgdGVybWlu
YXRlZCBvbiAKPiBmaXJzdCBWIGNvZGUuCj4KPj4KPj4gVGhpcyB3YXMgdGhlIHNhbWUgYXJndW1l
bnQgdGhhdCB0aGUgSW50ZWwgZm9sa3MgaGFkIHdoZW4gZW5hYmxpbmcKPj4gQU1YLiBTdXJlLCBB
TVggcmVxdWlyZXMgKmV4cGxpY2l0KiBlbmFibGVtZW50LCBidXQgc2FtZSBydWxlcyBzaG91bGQK
Pj4gYXBwbHksIG5vPwo+Pgo+Pj4+IDIuIFNhbml0aXplIGFsdHN0YWNrIGNoYW5nZXMgd2hlbiBW
IGlzIGVuYWJsZWQuCj4+PiBZZXMsIEknZCBsaWtlIHRvIGhhdmUgdGhpcy4gQnV0IGl0IG1heSBi
ZSB0cmlja3kgd2hlbiBpdCBjb21lcyB0bwo+Pj4gZGVjaWRpbmcgd2hldGhlciBWIGlzIGVuYWJs
ZWQsIGR1ZSB0byB0aGUgZmlyc3QtdXNlIHRyYXAuIElmIFYgaXMKPj4+IGNvbW1vbmx5IHVzZWQg
aW4gc3lzdGVtIGxpYnJhcmllcyB0aGVuIGl0IGlzIGxpa2VseSB0aGF0IFYgd2lsbCBiZQo+Pj4g
ZW5hYmxlZCBiZWZvcmUgYW4gdXNlciBzZXQgYW4gYWx0c3RhY2suIFNhbml0aXppbmcgdGhpcyBj
YXNlIHdvdWxkIGJlCj4+PiBlYXN5IGFuZCBzdHJhaWdodGZvcndhcmQuCj4KPiBHb29kLiBMZXRz
IGhhdmUgdGhpcyBpbiB2MTQgYXMgaXQgc2VlbXMgcmVhc29uYWJseSBlYXN5IHRvIGltcGxlbWVu
dC4KPgo+Pj4gQnV0IHdoYXQgaWYgdGhlIHVzZXIgc2V0cyBhbiBhbHRzdGFjayBiZWZvcmUKPj4+
IGVuYWJsaW5nIFYgaW4gdGhlIGZpcnN0LXVzZSB0cmFwPyBUaGlzIGNvdWxkIGhhcHBlbiBvbiBh
IHN0YXRpY2FsbHkKPj4+IHByb2dyYW0gdGhhdCBoYXMgaGFuZC13cml0dGVuIFYgcm91dGluZXMu
IFRoaXMgdGFrZXMgdXMgdG8gdGhlIDFzdAo+Pj4gcXVlc3Rpb24gYWJvdmUsIHNob3VsZCB3ZSBm
YWlsIHRoZSB1c2VyIHByb2dyYW0gaW1tZWRpYXRlbHkgaWYgdGhlCj4+PiBhbHRzdGFjayBpcyBz
ZXQgdG9vIHNtYWxsPwo+Cj4gUGxlYXNlIGxldHMgbm90IGNyb3NzIHRocmVhZHMuIFdlIGRpc2N1
c3NlZCB0aGlzIGFscmVhZHkgYXQgdG9wLiBXaGlsZSAKPiBpZGVhbGx5IHJlcXVpcmVkLCBzZWVt
cyB0cmlja3kgc28gbGV0cyBzdGFydCB3aXRoIHBvc3QtViBhbHQgc3RhY2sgY2hlY2suCj4KPj4g
Rm9yIG1lIGl0J3Mgb2J2aW91cyB0byBmYWlsIChhbHdheXMpICJpZiB0aGUgYWx0c3RhY2sgaXMg
dG9vIHNtYWxsIHRvCj4+IGVuYWJsZSBWIiwgYmVjYXVzZSBpdCBhbGxvd3MgdG8gZXhlY3V0ZSBW
IHdpdGhvdXQgcHJvcGVyIHByZWNvbmRpdGlvbnMuCj4+Cj4+IFBlcnNvbmFsbHksIEkgcHJlZmVy
IGEgc3RyaWN0ZXIgbW9kZWwuIE9ubHkgZW50ZXIgViBpZiB5b3UgY2FuLCBhbmQKPj4gYWZ0ZXIg
ZW50ZXJpbmcgaXQgZGlzYWxsb3cgY2hhbmdpbmcgdGhlIGFsdHN0YWNrLgo+Pgo+PiBUaGVuIGFn
YWluLCB0aGlzIGlzICpteSogb3BpbmlvbiBhbmQgY29uY2Vybi4gV2hhdCBkbyBvdGhlciBwZW9w
bGUKPj4gdGhpbms/IEkgZG9uJ3Qgd2FudCB0byBzdGFsbCB0aGUgc2VyaWVzLgo+Cj4gSSBjb25j
dXIgdGhhdCB0aGUgYWx0IHN0YWNrIGNoZWNraW5nIHJlcXVpcmVtZW50cyBhcmUgc2Vuc2libGUg
aW4gdGhlIAo+IGxvbmcgcnVuLiBXZSBjYW4gYWRkIHRoZSBvYnZpb3VzIGNoZWNrIGZvciBwb3N0
LVYgY2FzZSBhbmQgc2VlIGlmIHRoZXJlIAo+IGlzIGEgc2FuZSB3YXkgdG8gZmxhZyBwcmUtViBj
YXNlIHRvLgoKUmVhc29uYWJsZS4gQEFuZHkgZG9lcyB0aGlzIHJlc29uYXRlIHdpdGggeW91IGFz
IHdlbGw/CgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
