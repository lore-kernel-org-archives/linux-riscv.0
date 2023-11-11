Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002A1C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Nov 2023 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2c4BY0HD/1kfiegkBYC4KAb+RVE+9OzUMNU9gEZe8M=; b=Pjm/R8IrDEapuQ
	tkUxX//fosdBrXE3IaCxEIsesD2RQJvHj3RZdTxxoQsH2GM1E27m2AiwaPh//VRDsMFALbAL54MML
	KOqS+QrD5+Ntllubc08b/THgSkPHh6tInbJhEBMCVSmBydq6qBNoCZeu3h7+ZvDb1hB1ZgWuuFWZH
	hXXQRTGkzBCDyt5pRoyYilVSxPw4cGgTRdP4KHkttGIWIcBmm/MmN5l95Dj1NhFhIvoRzxmTorTFg
	V+Rz3qhDwVrnWxD+5qLP2vegeFWlj7OKQ+Q6Ddz2kuofoqFicTqOHObUW3B7bTjkVHOJCOYgqYNnU
	TjUG/uawLQcmC4Q6ILAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1lrB-00AOBa-2L;
	Sat, 11 Nov 2023 11:08:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1lr8-00AOAn-25
	for linux-riscv@lists.infradead.org;
	Sat, 11 Nov 2023 11:08:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CFEF8B822CD
	for <linux-riscv@lists.infradead.org>; Sat, 11 Nov 2023 11:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39004C43391
	for <linux-riscv@lists.infradead.org>; Sat, 11 Nov 2023 11:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699700924;
	bh=4+LCQxi4lcuWpBaGMskF95LLHsU3UkyAxY2T1MywU04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=clkbeG9q9sb2fwcbWoyoubJxsdJWMxIyp7Tbr7gfLrqVwHjBqTM7wNE4RVJHKjcVV
	 XH0jKeTYnPbPy9NL/Hlsp5PbGQ9bTwKiilREeEsed3J496rIRVKpLc82X8UUr0tz8x
	 g7ToGxDWR7jdOEXjLo8pPG9MH3Xvxta2AjLZ/qSdFpWa7EqATaRx3GB99kKl1Xzbwy
	 K4OUiB7S2FOiw8hfqpeuiFxf0/mbm6XZAi6Q/TqGGDH+gb5FEVbLVq5oaorcOovZTc
	 LOPNmrwqmUU8z/1ITVSpLXtJJR5UCQh3KxD5YJuEt8eup8U0Ev8EfofArIUxBhxHNK
	 DoGDxp1bcjZoQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c50906f941so40303941fa.2
        for <linux-riscv@lists.infradead.org>; Sat, 11 Nov 2023 03:08:44 -0800 (PST)
X-Gm-Message-State: AOJu0YwBm4jdPGNartrLuZBGW7DuHVnNhimFQbzQbn7ge8KgN8U2ryHe
	rTNfuAFMw7qfiIUJISheKMoFVU55zgVg4rlmLuQ=
X-Google-Smtp-Source: AGHT+IEsPJvoBX6VUXhVuSDBLKI8ICH8hwYcv6uwJD08sO4fiU5Og3JL4cUOmsdgJm+IkH5mGmEeqn3siNM5C1jNg+4=
X-Received: by 2002:a2e:22c3:0:b0:2c5:15dc:ba99 with SMTP id
 i186-20020a2e22c3000000b002c515dcba99mr1311935lji.51.1699700922378; Sat, 11
 Nov 2023 03:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20231025183644.8735-1-jerry.shih@sifive.com> <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain> <39126F19-8FEB-4E18-B61D-4494B59C43A1@sifive.com>
 <20231109071623.GB1245@sol.localdomain> <CABgGipXnGVB770ZA=60rD-6Hi5Fv_wh3tST+G+VFbTmMYzz0Mw@mail.gmail.com>
 <20231110054428.GC6572@sol.localdomain>
In-Reply-To: <20231110054428.GC6572@sol.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 11 Nov 2023 21:08:31 +1000
X-Gmail-Original-Message-ID: <CAMj1kXHGWmdnOChbmiYhEib2Dgun0k8PVW5v_kLb-6c1BEhS=Q@mail.gmail.com>
Message-ID: <CAMj1kXHGWmdnOChbmiYhEib2Dgun0k8PVW5v_kLb-6c1BEhS=Q@mail.gmail.com>
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated AES-CBC/CTR/ECB/XTS implementations
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andy Chiu <andy.chiu@sifive.com>, Jerry Shih <jerry.shih@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com, 
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au, davem@davemloft.net, 
	greentime.hu@sifive.com, conor.dooley@microchip.com, guoren@kernel.org, 
	bjorn@rivosinc.com, heiko@sntech.de, phoebe.chen@sifive.com, 
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_030850_979496_D7BA5960 
X-CRM114-Status: GOOD (  40.02  )
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

T24gRnJpLCAxMCBOb3YgMjAyMyBhdCAxNTo0NCwgRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDEwLCAyMDIzIGF0IDEyOjU4OjEyUE0gKzA4
MDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+IEhpIEVyaWMsCj4gPgo+ID4gT24gVGh1LCBOb3YgOSwg
MjAyMyBhdCAzOjE24oCvUE0gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBOb3YgMDcsIDIwMjMgYXQgMDQ6NTM6MTNQTSArMDgwMCwg
SmVycnkgU2hpaCB3cm90ZToKPiA+ID4gPiBPbiBOb3YgMiwgMjAyMywgYXQgMTM6MTYsIEVyaWMg
QmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIE9j
dCAyNiwgMjAyMyBhdCAwMjozNjozOEFNICswODAwLCBKZXJyeSBTaGloIHdyb3RlOgo+ID4gPiA+
ID4+ICtzdGF0aWMgaW50IGVjYl9lbmNyeXB0KHN0cnVjdCBza2NpcGhlcl9yZXF1ZXN0ICpyZXEp
Cj4gPiA+ID4gPj4gK3sKPiA+ID4gPiA+PiArICBzdHJ1Y3QgY3J5cHRvX3NrY2lwaGVyICp0Zm0g
PSBjcnlwdG9fc2tjaXBoZXJfcmVxdGZtKHJlcSk7Cj4gPiA+ID4gPj4gKyAgY29uc3Qgc3RydWN0
IHJpc2N2NjRfYWVzX2N0eCAqY3R4ID0gY3J5cHRvX3NrY2lwaGVyX2N0eCh0Zm0pOwo+ID4gPiA+
ID4+ICsgIHN0cnVjdCBza2NpcGhlcl93YWxrIHdhbGs7Cj4gPiA+ID4gPj4gKyAgdW5zaWduZWQg
aW50IG5ieXRlczsKPiA+ID4gPiA+PiArICBpbnQgZXJyOwo+ID4gPiA+ID4+ICsKPiA+ID4gPiA+
PiArICAvKiBJZiB3ZSBoYXZlIGVycm9yIGhlcmUsIHRoZSBgbmJ5dGVzYCB3aWxsIGJlIHplcm8u
ICovCj4gPiA+ID4gPj4gKyAgZXJyID0gc2tjaXBoZXJfd2Fsa192aXJ0KCZ3YWxrLCByZXEsIGZh
bHNlKTsKPiA+ID4gPiA+PiArICB3aGlsZSAoKG5ieXRlcyA9IHdhbGsubmJ5dGVzKSkgewo+ID4g
PiA+ID4+ICsgICAgICAgICAga2VybmVsX3ZlY3Rvcl9iZWdpbigpOwo+ID4gPiA+ID4+ICsgICAg
ICAgICAgcnY2NGlfenZrbmVkX2VjYl9lbmNyeXB0KHdhbGsuc3JjLnZpcnQuYWRkciwgd2Fsay5k
c3QudmlydC5hZGRyLAo+ID4gPiA+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG5ieXRlcyAmIEFFU19CTE9DS19WQUxJRF9TSVpFX01BU0ssCj4gPiA+ID4gPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmN0eC0+a2V5KTsKPiA+ID4gPiA+PiArICAg
ICAgICAgIGtlcm5lbF92ZWN0b3JfZW5kKCk7Cj4gPiA+ID4gPj4gKyAgICAgICAgICBlcnIgPSBz
a2NpcGhlcl93YWxrX2RvbmUoCj4gPiA+ID4gPj4gKyAgICAgICAgICAgICAgICAgICZ3YWxrLCBu
Ynl0ZXMgJiBBRVNfQkxPQ0tfUkVNQUlOSU5HX1NJWkVfTUFTSyk7Cj4gPiA+ID4gPj4gKyAgfQo+
ID4gPiA+ID4+ICsKPiA+ID4gPiA+PiArICByZXR1cm4gZXJyOwo+ID4gPiA+ID4+ICt9Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gVGhlcmUncyBubyBmYWxsYmFjayBmb3IgIWNyeXB0b19zaW1kX3VzYWJs
ZSgpIGhlcmUuICBJIHJlYWxseSBsaWtlIGl0IHRoaXMgd2F5Lgo+ID4gPiA+ID4gSG93ZXZlciwg
Zm9yIGl0IHRvIHdvcmsgKGZvciBza2NpcGhlcnMgYW5kIGFlYWRzKSwgUklTQy1WIG5lZWRzIHRv
IGFsbG93IHRoZQo+ID4gPiA+ID4gdmVjdG9yIHJlZ2lzdGVycyB0byBiZSB1c2VkIGluIHNvZnRp
cnEgY29udGV4dC4gIElzIHRoYXQgYWxyZWFkeSB0aGUgY2FzZT8KPiA+ID4gPgo+ID4gPiA+IFRo
ZSBrZXJuZWwtbW9kZS12ZWN0b3IgY291bGQgYmUgZW5hYmxlZCBpbiBzb2Z0aXJxLCBidXQgd2Ug
ZG9uJ3QgaGF2ZSBuZXN0aW5nCj4gPiA+ID4gdmVjdG9yIGNvbnRleHRzLiBXaWxsIHdlIGhhdmUg
dGhlIGNhc2UgdGhhdCBrZXJuZWwgbmVlZHMgdG8ganVtcCB0byBzb2Z0aXJxIGZvcgo+ID4gPiA+
IGVuY3J5cHRpb25zIGR1cmluZyB0aGUgcmVndWxhciBjcnlwdG8gZnVuY3Rpb24/IElmIHllcywg
d2UgbmVlZCB0byBoYXZlIGZhbGxiYWNrcwo+ID4gPiA+IGZvciBhbGwgYWxnb3JpdGhtcy4KPiA+
ID4KPiA+ID4gQXJlIHlvdSBhc2tpbmcgd2hhdCBoYXBwZW5zIGlmIGEgc29mdGlycSBpcyB0YWtl
biB3aGlsZSB0aGUgQ1BVIGlzIGJldHdlZW4KPiA+ID4ga2VybmVsX3ZlY3Rvcl9iZWdpbigpIGFu
ZCBrZXJuZWxfdmVjdG9yX2VuZCgpPyAgSSB0aGluayB0aGF0IG5lZWRzIHRvIGJlCj4gPiA+IHBy
ZXZlbnRlZCBieSBtYWtpbmcga2VybmVsX3ZlY3Rvcl9iZWdpbigpIGFuZCBrZXJuZWxfdmVjdG9y
X2VuZCgpIGRpc2FibGUgYW5kCj4gPiA+IHJlLWVuYWJsZSBzb2Z0aXJxcywgbGlrZSB3aGF0IGtl
cm5lbF9uZW9uX2JlZ2luKCkgYW5kIGtlcm5lbF9uZW9uX2VuZCgpIGRvIG9uCj4gPiA+IGFybTY0
LiAgUmVmZXIgdG8gY29tbWl0IDEzMTUwMTQ5YWE2ZGVkIHdoaWNoIGltcGxlbWVudGVkIHRoYXQg
YmVoYXZpb3Igb24gYXJtNjQuCj4gPgo+ID4gWWVzLCBpZiBtYWtpbmcgVmVjdG9yIGF2YWlsYWJs
ZSB0byBzb2Z0aXJxIGNvbnRleHQgaXMgYSBtdXN0LCB0aGVuIGl0Cj4gPiBpcyByZWFzb25hYmxl
IHRvIGNhbGwgbG9jYWxfYmhfZGlzYWJsZSgpIGluIGtlcm5lbF92ZWN0b3JfYmVnaW4oKS4KPiA+
IEhvd2V2ZXIsIHNvZnRpcnEgd291bGQgbm90IGJlIHRoZSBvbmx5IHVzZXIgZm9yIFZlY3RvciBh
bmQgZGlzYWJsaW5nCj4gPiBpdCBtYXkgY2F1c2UgZXh0cmEgbGF0ZW5jaWVzLiBNZWFud2hpbGUs
IHNpbXBseSBkaXNhYmxpbmcgYmggaW4KPiA+IGtlcm5lbF92ZWN0b3JfYmVnaW4oKSB3aWxsIGNv
bmZsaWN0IHdpdGggdGhlIHBhdGNoWzFdIHRoYXQgdGFrZXMgYW4KPiA+IGFwcHJvYWNoIHRvIHJ1
biBQcmVlbXB0aWJsZSBWZWN0b3IuIFRob3VnaCBpdCBpcyBub3QgY2xlYXIgeWV0IG9uCj4gPiB3
aGV0aGVyIHdlIHNob3VsZCBydW4gVmVjdG9yIHdpdGhvdXQgdHVybmluZyBvZmYgcHJlZW1wdGlv
biwgSSBoYXZlCj4gPiB0ZXN0ZWQgcnVubmluZyBwcmVlbXB0aWJsZSBWZWN0b3IgYW5kIG9ic2Vy
dmVkIHNvbWUgbGF0ZW5jeQo+ID4gaW1wcm92ZW1lbnRzIHdpdGhvdXQgc2FjcmlmaWNpbmcgdGhy
b3VnaHB1dC4gV2Ugd2lsbCBoYXZlIGEgZGlzY3Vzc2lvbgo+ID4gb24gTFBDMjAyM1syXSBhbmQg
aXQnZCBiZSBncmVhdCBpZiB5b3UgY291bGQgam9pbiBvciBjb250aW51ZSB0bwo+ID4gZGlzY3Vz
cyBpdCBoZXJlLgo+ID4KPiA+IEFwcHJvYWNoZXMgY2FuIGJlIGRvbmUgc3VjaCBhcyBuZXN0aW5n
LCBpZiBydW5uaW5nIFZlY3RvciBpbiBzb2Z0aXJxCj4gPiBpcyByZXF1aXJlZC4gU2luY2UgaXQg
cmVxdWlyZXMgZXh0cmEgc2F2ZS9yZXN0b3JlIG9uIG5lc3RpbmcsIEkgdGhpbmsKPiA+IHdlIHNo
b3VsZCBydW4gc29tZSB0ZXN0cyB0byBnZXQgbW9yZSBwZXJmb3JtYW5jZSAobGF0ZW5jeS90aHJv
dWdocHV0KQo+ID4gZmlndXJlIGxldCB0aGUgcmVzdWx0IGRlY2lkZSB0aGUgZmluYWwgZGlyZWN0
aW9uLiBGb3IgZXhhbXBsZSwgd2UKPiA+IGNvdWxkIHJ1biBWZWN0b3IgaW4gZWl0aGVyIG5lc3Rp
bmcgd2l0aCBwcmVlbXB0LVYgYW5kICBub24tbmVzdGluZwo+ID4gd2l0aG91dCBwcmVlbXB0LVYg
YW5kIGNvbXBhcmUgdGhlIGZvbGxvd2luZyBwZXJmb3JtYW5jZSBjYXRhY2hyaXN0aWNzOgo+ID4g
IC0gU3lzdGVtLXdpZGUgbGF0ZW5jeSBpbXBhY3QKPiA+ICAtIExhdGVuY3kgYW5kIHRocm91Z2hw
dXQgb2Ygc29mdGlycS1WZWN0b3IgaXRzZWxmCj4KPiBUaGUgc2tjaXBoZXIgYW5kIGFlYWQgQVBJ
cyBkbyBpbmRlZWQgbmVlZCB0byB3b3JrIGluIHNvZnRpcnEgY29udGV4dC4KPgo+IEl0J3MgcG9z
c2libGUgdG8gdXNlIGEgZmFsbGJhY2ssIGVpdGhlciBieSBmYWxsaW5nIGJhY2sgdG8gc2NhbGFy
IGluc3RydWN0aW9ucwo+IG9yIGJ5IHB1bnRpbmcgdGhlIGVuY3J5cHRpb24vZGVjcnlwdGlvbiBv
cGVyYXRpb24gdG8gYSB3b3JrcXVldWUgdXNpbmcKPiBjcnlwdG8vc2ltZC5jLiAgSG93ZXZlciwg
Ym90aCBhcHByb2FjaGVzIGhhdmUgc29tZSBzaWduaWZpY2FudCBkaXNhZHZhbnRhZ2VzLgo+IEl0
IHdhcyBuaWNlIHRoYXQgdGhlIG5lZWQgZm9yIHRoZW0gb24gYXJtNjQgd2FzIGVsaW1pbmF0ZWQg
YnkgY29tbWl0Cj4gMTMxNTAxNDlhYTZkZWQuICBOb3RlIHRoYXQgaXQncyBwb3NzaWJsZSB0byB5
aWVsZCB0aGUgdmVjdG9yIHVuaXQgb2NjYXNpb25hbGx5LAo+IHRvIGtlZXAgcHJlZW1wdGlvbiBh
bmQgc29mdGlycXMgZnJvbSBiZWluZyBkaXNhYmxlZCBmb3IgdG9vIGxvbmcuCj4KCkl0IGlzIGFs
c28gcXVpdGUgZmVhc2libGUgdG8gc3RhcnQgb3V0IHdpdGggYW4gaW1wbGVtZW50YXRpb24gb2YK
a2VybmVsX3ZlY3Rvcl9iZWdpbigpIHRoYXQgcHJlc2VydmVzIGFsbCB2ZWN0b3IgcmVnaXN0ZXJz
IGVhZ2VybHkgaW4gYQpzcGVjaWFsIHBlci1DUFUgYWxsb2NhdGlvbiBpZiB0aGUgY2FsbCBpcyBt
YWRlIGluIHNvZnRpcnEgY29udGV4dCAoYW5kCkJVRyB3aGVuIGNhbGxlZCBpbiBoYXJkaXJxL05N
SSBjb250ZXh0KS4gVGhpcyB3YXMgbXkgaW5pdGlhbCBhcHByb2FjaApvbiBhcm02NCB0b28uCgpB
c3N1bWluZyB0aGF0IFJpU0MtViBzeXN0ZW1zIHdpdGggdmVjdG9yIHVuaXRzIGFyZSBub3QgZmxv
b2RpbmcgdGhlCm1hcmtldCBqdXN0IHlldCwgdGhpcyBnaXZlcyB5b3Ugc29tZSB0aW1lIHRvIHN0
dWR5IHRoZSBpc3N1ZSB3aXRob3V0CnRoZSBuZWVkIHRvIGltcGxlbWVudCBub24tdmVjdG9yIGZh
bGxiYWNrIGNyeXB0byBhbGdvcml0aG1zCmV2ZXJ5d2hlcmUuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
