Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D36AC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 20:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3PqbPHNe3s/ftOTDNQ0OVdUO3YPkDDjpuNT1Q88vgU=; b=bHQRmPuzq8s0LU
	Lel0pyYNz/z7h2VDWhz1psNpR3UAcgurHuPFK2I+moAPEubfpy0vnqVivQj2NLF0now+Sn2SEaXA9
	f8s68PEWjuJPSzwrKIWULaSRmq1Bx/b9uk7l2b4aOqh8nCV29KjVFonXikJVso9V8T/RzbKhhbo+X
	sc3un+kpAKrnKPEFwNsWkb+kqKEmC7a/SCvBG3NFlDe4t6wKh/FRxbiKgCbQMW2Ctj9B96b/ylDZ1
	5mwb5twF3zk32C+5ko5FxbDoag8SojK6hdm2UyiCkiDBWDSY0oUM9KW5JYDTpet9Q4/Nih1xZGwrJ
	VzGyU7dMKo/10k1joUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmJzX-0000000A6hd-0Pql;
	Mon, 18 Mar 2024 20:53:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmJzU-0000000A6gm-0eoA
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 20:53:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA8C01BF205;
	Mon, 18 Mar 2024 20:53:42 +0000 (UTC)
Message-ID: <1a1bf141-9fbf-4d30-bdd3-fd20f6170c3f@ghiti.fr>
Date: Mon, 18 Mar 2024 21:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: compat_vdso: install compat_vdso.so.dbg to
 /lib/modules/*/vdso/
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231117125807.1058477-1-masahiroy@kernel.org>
 <CAK7LNAStoCja1gnoFmsKikbzGZmKTcTu+Vc7v9zg8B9hwsH+iQ@mail.gmail.com>
 <CAK7LNATVAcj-pa_G-NGBTr9doCACGk1nKCNbxM50-M0mi9q=7w@mail.gmail.com>
 <ca097f2a-59ec-4945-9860-5e380e1665e4@ghiti.fr>
 <CAK7LNARShVA953-U+p6=wzq3GFsKx4GwpRiqmqftjQz3VkE2VA@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAK7LNARShVA953-U+p6=wzq3GFsKx4GwpRiqmqftjQz3VkE2VA@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_135352_361468_3F440D62 
X-CRM114-Status: GOOD (  17.15  )
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

SGkgTWFzYWhpcm8sCgpPbiAxNS8wMy8yMDI0IDA1OjA2LCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6
Cj4gT24gVGh1LCBNYXIgNywgMjAyNCBhdCA1OjEy4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4
QGdoaXRpLmZyPiB3cm90ZToKPj4gSGkgTWFzYWhpcm8sCj4+Cj4+IE9uIDI0LzAyLzIwMjQgMDQ6
MzcsIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToKPj4+IFBpbmcgeCAyID8KPj4+Cj4+Pgo+Pj4KPj4+
Cj4+Pgo+Pj4gT24gU3VuLCBKYW4gMjEsIDIwMjQgYXQgNjo0OOKAr0FNIE1hc2FoaXJvIFlhbWFk
YSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+IE9uIEZyaSwgTm92IDE3LCAyMDIz
IGF0IDk6NTjigK9QTSBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90
ZToKPj4+Pj4gJ21ha2UgdmRzb19pbnN0YWxsJyBpbnN0YWxscyBkZWJ1ZyB2ZHNvIGZpbGVzIHRv
IC9saWIvbW9kdWxlcy8qL3Zkc28vLgo+Pj4+Pgo+Pj4+PiBPbmx5IGZvciB0aGUgY29tcGF0IHZk
c28gb24gcmlzY3YsIHRoZSBpbnN0YWxsYXRpb24gZGVzdGluYXRpb24gZGlmZmVyczsKPj4+Pj4g
Y29tcGF0X3Zkc28uc28uZGJnIGlzIGluc3RhbGxlZCB0byAvbGliL21vZHVsZS8qL2NvbXBhdF92
ZHNvLy4KPj4+Pj4KPj4+Pj4gVG8gZm9sbG93IHRoZSBzdGFuZGFyZCBpbnN0YWxsIGRlc3RpbmF0
aW9uIGFuZCBzaW1wbGlmeSB0aGUgdmRzb19pbnN0YWxsCj4+Pj4+IGxvZ2ljLCBjaGFuZ2UgdGhl
IGluc3RhbGwgZGVzdGluYXRpb24gdG8gc3RhbmRhcmQgL2xpYi9tb2R1bGVzLyovdmRzby8uCj4+
Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5l
bC5vcmc+Cj4+Pj4+IC0tLQo+Pj4+IFBpbmc/Cj4+Pj4gKGluIGNhc2UgInlldCBtb3JlIFJJU0Mt
ViB1cGRhdGVzIiBoYXBwZW5zKQo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4+ICAgIGFyY2gvcmlz
Y3YvTWFrZWZpbGUgfCAyICstCj4+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtl
ZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPj4+Pj4gaW5kZXggYTc0YmU3ODY3OGViLi41Y2Jl
NTk2MzQ1YzEgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUKPj4+Pj4gKysr
IGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+Pj4+PiBAQCAtMTQ2LDcgKzE0Niw3IEBAIGVuZGlmCj4+
Pj4+ICAgIGVuZGlmCj4+Pj4+Cj4+Pj4+ICAgIHZkc28taW5zdGFsbC15ICAgICAgICAgICAgICAg
ICArPSBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28uc28uZGJnCj4+Pj4+IC12ZHNvLWluc3Rh
bGwtJChDT05GSUdfQ09NUEFUKSAgKz0gYXJjaC9yaXNjdi9rZXJuZWwvY29tcGF0X3Zkc28vY29t
cGF0X3Zkc28uc28uZGJnOi4uL2NvbXBhdF92ZHNvL2NvbXBhdF92ZHNvLnNvCj4+Pj4+ICt2ZHNv
LWluc3RhbGwtJChDT05GSUdfQ09NUEFUKSAgKz0gYXJjaC9yaXNjdi9rZXJuZWwvY29tcGF0X3Zk
c28vY29tcGF0X3Zkc28uc28uZGJnCj4+Pj4+Cj4+Pj4+ICAgIGlmbmVxICgkKENPTkZJR19YSVBf
S0VSTkVMKSx5KQo+Pj4+PiAgICBpZmVxICgkKENPTkZJR19SSVNDVl9NX01PREUpJChDT05GSUdf
QVJDSF9DQU5BQU4pLHl5KQo+Pj4+PiAtLQo+Pj4+PiAyLjQwLjEKPj4+Pj4KPj4+PiAtLQo+Pj4+
IEJlc3QgUmVnYXJkcwo+Pj4+IE1hc2FoaXJvIFlhbWFkYQo+Pj4KPj4+IC0tCj4+PiBCZXN0IFJl
Z2FyZHMKPj4+IE1hc2FoaXJvIFlhbWFkYQo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPj4KPj4gQ291bGRuJ3QgY2hhbmdp
bmcgdGhpcyBsaWJyYXJ5IGluc3RhbGwgcGF0aCBicmVhayBzb21lIGV4aXN0aW5nCj4+IGFwcGxp
Y2F0aW9uPyBJIG1lYW4gaXQga2luZCBvZiBicmVha3Mgd2hlcmUgdGhlIGxpYnJhcnkgaXMgZXhw
ZWN0ZWQgdG8KPj4gYmUgcmlnaHQ/Cj4KPiBEbyB5b3UgaGF2ZSBhIHBhcnRpY3VsYXIgbGlicmFy
eSBpbiBtaW5kPwoKCk5vbmUgaW4gcGFydGljdWxhci4KCgo+Cj4KPiBSSVNWLVYgaXMgdGhlIG9u
bHkgYXJjaGl0ZWN0dXJlIHRoYXQgaW5zdGFsbHMgYSBkZWJ1ZyB2ZHNvCj4gdG8gYSBkaWZmZXJl
bnQgbG9jYXRpb24gdGhhbiB0aGUKPiBzdGFuZGFyZCBsaWIvbW9kdWxlcy8qL3Zkc28vLgo+Cj4K
PiBJIHJlZ2FyZCB0aGlzIGFzIGEgZml4LgoKCllvdSdyZSBwcm9iYWJseSByaWdodCwgSSBkb24n
dCBzZWUgd2h5IHRoZSBzZWFyY2ggcGF0aCB3b3VsZCBiZSAKZGlmZmVyZW50IG9uIHJpc2N2LCB1
bmxlc3MgaXQgd2FzIGZpeGVkIGluIHVzZXJzcGFjZSBidXQgSSB0aGluayB0aGlzIGlzIAp0aGUg
cmlnaHQgdGhpbmcgdG8gZG8sIHNvOgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxl
eGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCgo+Cj4KPgo+Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
