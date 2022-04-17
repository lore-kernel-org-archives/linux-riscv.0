Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5DEC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Apr 2022 08:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIIaAv84j2S5LuCAXPy4En7dLzbuC6RnvdYAhlND1mU=; b=oap5tKsWQgJt+Z
	cplgiWIRwbeGctk+TjpIatXF2dx7B6ga8FJzfBPbkWmnwzsmLrkmOqcvcoJMR13qA5Oc/1fiNdVvt
	f/gUQRA5BUxalpu5fhW+LeIfnJUMy2LAXNmfuGbYiw8hx1QUXym35lZrRJSKU/P12uoJcffZfUp7P
	hKOKoxd3SZsTECoxDPKEykSi+i/bBQc9m2V9kZRprJod6mQ8hEGMqavqhVnrh5yKynvVt0ed/00CP
	ynCJYScWWOn0MqwHRl6Q5a3QfE5kms8TZejQikYnGOwv3mlyw1FwzTzXtGCgNF1NHlryIpSBtjJD1
	2cx9YAivxv7TjtQcyAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ng0bS-00E7u5-62; Sun, 17 Apr 2022 08:49:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ng0bO-00E7tE-As
 for linux-riscv@lists.infradead.org; Sun, 17 Apr 2022 08:49:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 653846117E
 for <linux-riscv@lists.infradead.org>; Sun, 17 Apr 2022 08:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF568C385B1
 for <linux-riscv@lists.infradead.org>; Sun, 17 Apr 2022 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650185386;
 bh=iqaxMFM3cYKwlA/IAnWiV8E2ISGqOdaBcPl+s4Z4EFo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZN7F9fihzfdvl59d2QDDnMTqqiMdPQukHbVsuA4xlXA02NG5NGlUkX3J48W6tpMop
 2hh72D8MYPw57+Pjz+LXmfAUQDqjGaMmCGb8MwCH5NyuHMXwNG98uL+nRZKlbEvHl8
 1KB8bBu/vtAbdTEHRrR7g4CoWBrnhEBCV02R/pJeeX/yp8aPs+pJSlUpMqujEuGRW8
 /p67rTsYW5PC7nidCw4TOsuPUmylmswjeXnOjB/W0PQL/yv2g7/KhGKb8MCvbupc/A
 kJO20SKbTjlWDW6aWYHDEsN6QzkV3XGnD9om6jP3jYU58hQ6q+zXzphAuWuoFIVRym
 oXwGj0j6NUEQA==
Received: by mail-vk1-f174.google.com with SMTP id w128so5107681vkd.3
 for <linux-riscv@lists.infradead.org>; Sun, 17 Apr 2022 01:49:46 -0700 (PDT)
X-Gm-Message-State: AOAM533yMuYjYfL29ODwysT1wy+T3HRsDgnET5DUZFvsQLBP4Waw3jrJ
 u0JR5+0T/40lt/Olg1NpcqrDuWQi5+mGiatbpoo=
X-Google-Smtp-Source: ABdhPJxpmYlU8zsrvZqkexAACBkf1OGxuZ/DVZQMF78y5+ZDzoKYkD60G10mw6vsE2NXQwp3zpqfVvAjGHJ9C45ab8A=
X-Received: by 2002:a1f:1b07:0:b0:348:f10f:82b2 with SMTP id
 b7-20020a1f1b07000000b00348f10f82b2mr1461848vkb.8.1650185385515; Sun, 17 Apr
 2022 01:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220307224620.1933061-1-heiko@sntech.de> <YllWTN+15CoskNBt@Red>
 <70da24dd-2d03-fc49-151d-daabb315a5f6@sholland.org>
 <YlpxsYREWv/LQ+HY@Red>
 <849a3728-7e84-4f26-0c73-4d68eae9ae01@sholland.org> <YlsZxVjgt3ZNQ7Ub@Red>
 <CAJF2gTSNzLfon7yH3zvOJfYwQnVRvNWW7KygShLqcagRfbyAkg@mail.gmail.com>
 <YlvTkfIO9Oz3ib5i@Red>
In-Reply-To: <YlvTkfIO9Oz3ib5i@Red>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 17 Apr 2022 16:49:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ5rYATTHj2UtwxKw0dpvdHBUAih1RJf0XuGM8b6euZwQ@mail.gmail.com>
Message-ID: <CAJF2gTQ5rYATTHj2UtwxKw0dpvdHBUAih1RJf0XuGM8b6euZwQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: implement Zicbom-based CMO instructions + the
 t-head variant
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, Heiko Stuebner <heiko@sntech.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Nick Kossifidis <mick@ics.forth.gr>, Christoph Muellner <cmuellner@linux.com>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_014950_489197_CBA7B863 
X-CRM114-Status: GOOD (  40.04  )
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

T24gU3VuLCBBcHIgMTcsIDIwMjIgYXQgNDo0NSBQTSBDb3JlbnRpbiBMYWJiZQo8Y2xhYmJlLm1v
bnRqb2llQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBMZSBTdW4sIEFwciAxNywgMjAyMiBhdCAxMDox
NzozNEFNICswODAwLCBHdW8gUmVuIGEgw6ljcml0IDoKPiA+IE9uIFN1biwgQXByIDE3LCAyMDIy
IGF0IDM6MzIgQU0gQ29yZW50aW4gTGFiYmUKPiA+IDxjbGFiYmUubW9udGpvaWVAZ21haWwuY29t
PiB3cm90ZToKPiA+ID4KPiA+ID4gTGUgU2F0LCBBcHIgMTYsIDIwMjIgYXQgMTI6NDc6MjlQTSAt
MDUwMCwgU2FtdWVsIEhvbGxhbmQgYSDDqWNyaXQgOgo+ID4gPiA+IE9uIDQvMTYvMjIgMjozNSBB
TSwgQ29yZW50aW4gTGFiYmUgd3JvdGU6Cj4gPiA+ID4gPiBMZSBGcmksIEFwciAxNSwgMjAyMiBh
dCAwOToxOToyM1BNIC0wNTAwLCBTYW11ZWwgSG9sbGFuZCBhIMOpY3JpdCA6Cj4gPiA+ID4gPj4g
T24gNC8xNS8yMiA2OjI2IEFNLCBDb3JlbnRpbiBMYWJiZSB3cm90ZToKPiA+ID4gPiA+Pj4gTGUg
TW9uLCBNYXIgMDcsIDIwMjIgYXQgMTE6NDY6MThQTSArMDEwMCwgSGVpa28gU3R1ZWJuZXIgYSDD
qWNyaXQgOgo+ID4gPiA+ID4+Pj4gVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gdGhlIGFsdGVybmF0
aXZlcyBjaGFuZ2VzIGRvbmUgaW4gbXkgc3ZwYm10IHNlcmllcwo+ID4gPiA+ID4+Pj4gYW5kIHRo
dXMgYWxzbyBkZXBlbmRzIG9uIEF0aXNoJ3MgaXNhLWV4dGVuc2lvbiBwYXJzaW5nIHNlcmllcy4K
PiA+ID4gPiA+Pj4+Cj4gPiA+ID4gPj4+PiBJdCBpbXBsZW1lbnRzIHVzaW5nIHRoZSBjYWNoZS1t
YW5hZ2VtZW50IGluc3RydWN0aW9ucyBmcm9tIHRoZSAgWmljYm9tLQo+ID4gPiA+ID4+Pj4gZXh0
ZW5zaW9uIHRvIGhhbmRsZSBjYWNoZSBmbHVzaCwgZXRjIGFjdGlvbnMgb24gcGxhdGZvcm1zIG5l
ZWRpbmcgdGhlbS4KPiA+ID4gPiA+Pj4+Cj4gPiA+ID4gPj4+PiBTb0NzIHVzaW5nIGNwdSBjb3Jl
cyBmcm9tIFQtSGVhZCBsaWtlIHRoZSBBbGx3aW5uZSBEMSBpbXBsZW1lbnQgYQo+ID4gPiA+ID4+
Pj4gZGlmZmVyZW50IHNldCBvZiBjYWNoZSBpbnN0cnVjdGlvbnMuIEJ1dCB3aGlsZSB0aGV5IGFy
ZSBkaWZmZXJlbnQsCj4gPiA+ID4gPj4+PiBpbnN0cnVjdGlvbnMgdGhleSBwcm92aWRlIHRoZSBz
YW1lIGZ1bmN0aW9uYWxpdHksIHNvIGEgdmFyaWFudCBjYW4KPiA+ID4gPiA+Pj4+IGVhc2x5IGhv
b2sgaW50byB0aGUgZXhpc3RpbmcgYWx0ZXJuYXRpdmVzIG1lY2hhbmlzbSBvbiB0aG9zZS4KPiA+
ID4gPiA+Pj4+Cj4gPiA+ID4gPj4+Pgo+ID4gPiA+ID4+Pgo+ID4gPiA+ID4+PiBIZWxsbwo+ID4g
PiA+ID4+Pgo+ID4gPiA+ID4+PiBJIGFtIHRlc3RpbmcgaHR0cHM6Ly9naXRodWIuY29tL3NtYWV1
bC9saW51eC5naXQgYnJhbmNoOm9yaWdpbi9yaXNjdi9kMS13aXAgd2hpY2ggY29udGFpbiB0aGlz
IHNlcmllLgo+ID4gPiA+ID4+Pgo+ID4gPiA+ID4+PiBJIGFtIGhpdHRpbmcgYSBidWZmZXIgY29y
cnVwdGlvbiBwcm9ibGVtIHdpdGggRE1BLgo+ID4gPiA+ID4+PiBUaGUgc3VuOGktY2UgY3J5cHRv
IGRyaXZlciBmYWlsIHNlbGYgdGVzdHMgZHVlIHRvICJkZXZpY2Ugb3ZlcnJhbiBkZXN0aW5hdGlv
biBidWZmZXIiLgo+ID4gPiA+ID4+PiBJbiBmYWN0IHRoZSBidWZmZXIgaXMgbm90IG92ZXJyYW4g
YnkgZGV2aWNlIGJ1dCBieSBkbWFfbWFwX3NpbmdsZSgpIG9wZXJhdGlvbi4KPiA+ID4gPiA+Pj4K
PiA+ID4gPiA+Pj4gVGhlIGZvbGxvd2luZyBzbWFsbCBjb2RlIHNob3cgdGhlIHByb2JsZW06Cj4g
PiA+ID4gPj4+Cj4gPiA+ID4gPj4+IGRtYV9hZGRyX3QgZG1hOwo+ID4gPiA+ID4+PiB1OCAqYnVm
Owo+ID4gPiA+ID4+PiAjZGVmaW5lIEJTSVpFIDIwNDgKPiA+ID4gPiA+Pj4gI2RlZmluZSBETUFT
SVpFIDE2Cj4gPiA+ID4gPj4+Cj4gPiA+ID4gPj4+IGJ1ZiA9IGttYWxsb2MoQlNJWkUsIEdGUF9L
RVJORUwgfCBHRlBfRE1BKTsKPiA+ID4gPiA+Pj4gZm9yIChpID0gMDsgaSA8IEJTSVpFOyBpKysp
Cj4gPiA+ID4gPj4+ICAgICBidWZbaV0gPSAweEZFOwo+ID4gPiA+ID4+PiBwcmludF9oZXhfZHVt
cChLRVJOX0lORk8sICJETUFURVNUMToiLCBEVU1QX1BSRUZJWF9OT05FLCAxNiwgNCwgYnVmLCAy
NTYsIGZhbHNlKTsKPiA+ID4gPiA+Pj4gZG1hID0gZG1hX21hcF9zaW5nbGUoY2UtPmRldiwgYnVm
LCBETUFTSVpFLCBETUFfRlJPTV9ERVZJQ0UpOwo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gVGhpcyBm
dW5jdGlvbiAodGhyb3VnaCBkbWFfZGlyZWN0X21hcF9wYWdlKCkpIGVuZHMgdXAgY2FsbGluZwo+
ID4gPiA+ID4+IGFyY2hfc3luY19kbWFfZm9yX2RldmljZSguLi4sIC4uLiwgRE1BX0ZST01fREVW
SUNFKSwgd2hpY2ggaW52YWxpZGF0ZXMgdGhlIENQVSdzCj4gPiA+ID4gPj4gY2FjaGUuIFRoaXMg
aXMgdGhlIHNhbWUgdGhpbmcgb3RoZXIgYXJjaGl0ZWN0dXJlcyBkbyAoYXQgbGVhc3QgYXJtLCBh
cm02NCwKPiA+ID4gPiA+PiBvcGVucmlzYywgYW5kIHBvd2VycGMpLiBTbyB0aGlzIGFwcGVhcnMg
dG8gYmUgd29ya2luZyBhcyBpbnRlbmRlZC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIGJlaGF2
b3VyIGlzIG5vdCBwcmVzZW50IGF0IGxlYXN0IG9uIEFSTSBhbmQgQVJNNjQuCj4gPiA+ID4gPiBU
aGUgc2FtcGxlIGNvZGUgSSBwcm92aWRlZCBkb2VzIG5vdCBjb3JydXB0IHRoZSBidWZmZXIgb24g
dGhlbS4KPiA+ID4gPgo+ID4gPiA+IFRoYXQgY2FuIGJlIGV4cGxhaW5lZCBieSB0aGUgMHhGRSBi
eXRlcyBoYXZpbmcgYmVlbiBmbHVzaGVkIHRvIERSQU0gYWxyZWFkeSBpbgo+ID4gPiA+IHlvdXIg
QVJNL0FSTTY0IHRlc3RzLCB3aGVyZWFzIGluIHlvdXIgcmlzY3Y2NCBjYXNlLCB0aGUgMHhGRSBi
eXRlcyB3ZXJlIHN0aWxsIGluCj4gPiA+ID4gYSBkaXJ0eSBjYWNoZSBsaW5lLiBUaGUgY2FjaGUg
dG9wb2xvZ3kgYW5kIGltcGxlbWVudGF0aW9uIGlzIHRvdGFsbHkgZGlmZmVyZW50Cj4gPiA+ID4g
YWNyb3NzIHRoZSBTb0NzLCBzbyB0aGlzIGlzIG5vdCB0b28gc3VycHJpc2luZy4KPiA+ID4gPgo+
ID4gPiA+IFNlbWFudGljYWxseSwgZG1hX21hcF9zaW5nbGUoLi4uLCBETUFfRlJPTV9ERVZJQ0Up
IG1lYW5zIHlvdSBhcmUgZG9pbmcgYQo+ID4gPiA+IHVuaWRpcmVjdGlvbmFsIERNQSB0cmFuc2Zl
ciBmcm9tIHRoZSBkZXZpY2UgaW50byB0aGF0IGJ1ZmZlci4gU28gdGhlIGNvbnRlbnRzIG9mCj4g
PiA+ID4gdGhlIGJ1ZmZlciBhcmUgInVuZGVmaW5lZCIgdW50aWwgdGhlIERNQSB0cmFuc2ZlciBj
b21wbGV0ZXMuIElmIHlvdSBhcmUgYWxzbwo+ID4gPiA+IHdyaXRpbmcgZGF0YSBpbnRvIHRoZSBi
dWZmZXIgZnJvbSB0aGUgQ1BVIHNpZGUsIHRoZW4geW91IG5lZWQgRE1BX0JJRElSRUNUSU9OQUwu
Cj4gPiA+ID4KPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+IFNhbXVlbAo+ID4gPgo+ID4gPiArQ0Mg
Y3J5cHRvIG1haWxpbmcgbGlzdCArIG1haW50YWluZXIKPiA+ID4KPiA+ID4gTXkgcHJvYmxlbSBp
cyB0aGF0IGNyeXB0byBzZWxmdGVzdCwgZm9yIGVhY2ggYnVmZmVyIHdoZXJlIEkgbmVlZCB0byBk
byBhIGNpcGhlciBvcGVyYXRpb24sCj4gPiA+IGNvbmNhdCBhIHBvaXNvbiBidWZmZXIgdG8gY2hl
Y2sgdGhhdCBkZXZpY2UgZG9lcyB3cml0ZSBiZXlvbmQgYnVmZmVyLgo+ID4gPgo+ID4gPiBCdXQg
dGhlIGRtYV9tYXBfc2coRlJPTV9ERVZJQ0UpIGNvcnJ1cHRzIHRoaXMgcG9pc29uIGJ1ZmZlciBh
bmQgY3J5cHRvIHNlbGZ0ZXN0cyBmYWlscyB0aGlua2luZyBteSBkZXZpY2UgZGlkIGEgYnVmZmVy
IG92ZXJydW4uCj4gPiA+Cj4gPiA+IFNvIHlvdSBtZWFuIHRoYXQgb24gU29DIEQxLCB0aGlzIGNy
eXB0byBBUEkgY2hlY2sgc3RyYXRlZ3kgaXMgaW1wb3NzaWJsZSA/Cj4gPgo+ID4gSSB0aGluayB5
b3UgY291bGQgdHJ5IHRvIHJlcGxhY2UgYWxsIENMRUFOICYgSU5WQUwgb3BzIHdpdGggRkxVU0gg
b3BzCj4gPiBmb3IgdGhlIHRlc3RpbmcuIChBbGwgY2FjaGUgYmxvY2stYWxpZ25lZCBkYXRhIGZy
b20gdGhlIGRldmljZSBmb3IgdGhlCj4gPiBDUFUgc2hvdWxkIGJlIGludmFsaWRlZC4pCj4gPgo+
Cj4gV2l0aDoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYyBi
L2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPiBpbmRleCAyYzEyNGJjYzE5MzIuLjYw
ODQ4MzUyMmUwNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5j
Cj4gKysrIGIvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYwo+IEBAIC0yMSw3ICsyMSw3
IEBAIHZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKHBoeXNfYWRkcl90IHBhZGRyLCBzaXpl
X3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlCj4gICAgICAgICAgICAgICAgIEFMVF9DTU9fT1Ao
Q0xFQU4sICh1bnNpZ25lZCBsb25nKXBoeXNfdG9fdmlydChwYWRkciksIHNpemUpOwo+ICAgICAg
ICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRE1BX0ZST01fREVWSUNFOgo+IC0gICAg
ICAgICAgICAgICBBTFRfQ01PX09QKElOVkFMLCAodW5zaWduZWQgbG9uZylwaHlzX3RvX3ZpcnQo
cGFkZHIpLCBzaXplKTsKPiArICAgICAgICAgICAgICAgQUxUX0NNT19PUChGTFVTSCwgKHVuc2ln
bmVkIGxvbmcpcGh5c190b192aXJ0KHBhZGRyKSwgc2l6ZSk7Cj4gICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ICAgICAgICAgY2FzZSBETUFfQklESVJFQ1RJT05BTDoKPiAgICAgICAgICAgICAgICAg
QUxUX0NNT19PUChGTFVTSCwgKHVuc2lnbmVkIGxvbmcpcGh5c190b192aXJ0KHBhZGRyKSwgc2l6
ZSk7Cj4KPgo+IFRoZSBjcnlwdG8gc2VsZiB0ZXN0IHdvcmtzIGFuZCBJIGdvdCBubyBtb3JlIGJ1
ZmZlciBjb3JydXB0aW9uLgpObywgTm8gLi4uIGl0J3Mgbm90IGEgc29sdXRpb24uIFRoYXQgbWVh
bnMgeW91ciBkcml2ZXIgaGFzIGEgcHJvYmxlbS4KRnJvbSBkZXZpY2UsIHdlIG9ubHkgbmVlZCBJ
TlZBTCBlbm91Z2guCgo+Cj4gVGhhbmtzCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1M
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
