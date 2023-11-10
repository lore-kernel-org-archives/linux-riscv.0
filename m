Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F7FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 05:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ae/PbB/hbmi/QZ/NwhcvDW++n7F0BkJw/lcw78ENp9s=; b=wnf/gH7ailyA80
	+D97eexwLm+lcsExlcze8vlSchP7yC6pbfPolywberrB3SbvrOLCodV0t2KR1TvAbqtn9eE9IUHv/
	h8D72UyInuDegCaGQi6jZMNnHm/br3/kQn/2T/8iPCTEf6brX2V6TkBagVFgQ6JtanxJs1V+QOI9D
	GmnaKzn3eTw7Ac71AAHJa5YsIxW1pRPG+vjQuIPSzXXebCKiQ5Q5fjYaUM9XkBUFMRR2Yc1j1A9Dz
	6lKwkXsRAOBr0PvDmdD4o51xy7V+ksVDFsOa3ZjIHtwmq8ktfTPt+kjxs4vT/8BiRp5UyNAqYKbSX
	wRTm7ZZ6fO0Lp/YY1IHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KJm-007uVH-2g;
	Fri, 10 Nov 2023 05:44:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KJk-007uUg-26
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 05:44:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 21077B8228E;
	Fri, 10 Nov 2023 05:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E93C43391;
	Fri, 10 Nov 2023 05:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699595070;
	bh=YgOoKgJVYyykPZO6YJWAatV8j2OrL6qNPMuouTnarbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrXR5qO4IM6Cz5Zcb5EYepEpMb2Sl+PsQOQScRShBkAKI4jTOd/zz0AFn0pgmRd5a
	 xDH4cUqUJC5YWWsfhL1D663qotYxPUJJELe9nVKyiR9eWQ+9tvovBmk9LoSm9FNN6V
	 itysJvwbCQVDYL1SiGTtfUEd2zVzTIE0vPiDKREnn6sOi4TJZEfQy0NsM5WfWu1Ylc
	 7IxZciEGuqK19h0abPrAFbIe5LerhD1Wgvgcl5QRcL+TDQ6MBjY6D8ef/xo2++DYMV
	 +dHoyAZB76oRGRLALh4arWeFIvgxIHX1109PTUtOE3kHdCWCMwTwkp3y+gSQtFFHty
	 n2hQUKtGeF8Kw==
Date: Thu, 9 Nov 2023 21:44:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Jerry Shih <jerry.shih@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au,
	davem@davemloft.net, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
Message-ID: <20231110054428.GC6572@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain>
 <39126F19-8FEB-4E18-B61D-4494B59C43A1@sifive.com>
 <20231109071623.GB1245@sol.localdomain>
 <CABgGipXnGVB770ZA=60rD-6Hi5Fv_wh3tST+G+VFbTmMYzz0Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgGipXnGVB770ZA=60rD-6Hi5Fv_wh3tST+G+VFbTmMYzz0Mw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_214432_991605_8B2BD389 
X-CRM114-Status: GOOD (  36.95  )
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

T24gRnJpLCBOb3YgMTAsIDIwMjMgYXQgMTI6NTg6MTJQTSArMDgwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+IEhpIEVyaWMsCj4gCj4gT24gVGh1LCBOb3YgOSwgMjAyMyBhdCAzOjE24oCvUE0gRXJpYyBC
aWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIE5vdiAw
NywgMjAyMyBhdCAwNDo1MzoxM1BNICswODAwLCBKZXJyeSBTaGloIHdyb3RlOgo+ID4gPiBPbiBO
b3YgMiwgMjAyMywgYXQgMTM6MTYsIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBPY3QgMjYsIDIwMjMgYXQgMDI6MzY6MzhBTSArMDgwMCwg
SmVycnkgU2hpaCB3cm90ZToKPiA+ID4gPj4gK3N0YXRpYyBpbnQgZWNiX2VuY3J5cHQoc3RydWN0
IHNrY2lwaGVyX3JlcXVlc3QgKnJlcSkKPiA+ID4gPj4gK3sKPiA+ID4gPj4gKyAgc3RydWN0IGNy
eXB0b19za2NpcGhlciAqdGZtID0gY3J5cHRvX3NrY2lwaGVyX3JlcXRmbShyZXEpOwo+ID4gPiA+
PiArICBjb25zdCBzdHJ1Y3QgcmlzY3Y2NF9hZXNfY3R4ICpjdHggPSBjcnlwdG9fc2tjaXBoZXJf
Y3R4KHRmbSk7Cj4gPiA+ID4+ICsgIHN0cnVjdCBza2NpcGhlcl93YWxrIHdhbGs7Cj4gPiA+ID4+
ICsgIHVuc2lnbmVkIGludCBuYnl0ZXM7Cj4gPiA+ID4+ICsgIGludCBlcnI7Cj4gPiA+ID4+ICsK
PiA+ID4gPj4gKyAgLyogSWYgd2UgaGF2ZSBlcnJvciBoZXJlLCB0aGUgYG5ieXRlc2Agd2lsbCBi
ZSB6ZXJvLiAqLwo+ID4gPiA+PiArICBlcnIgPSBza2NpcGhlcl93YWxrX3ZpcnQoJndhbGssIHJl
cSwgZmFsc2UpOwo+ID4gPiA+PiArICB3aGlsZSAoKG5ieXRlcyA9IHdhbGsubmJ5dGVzKSkgewo+
ID4gPiA+PiArICAgICAgICAgIGtlcm5lbF92ZWN0b3JfYmVnaW4oKTsKPiA+ID4gPj4gKyAgICAg
ICAgICBydjY0aV96dmtuZWRfZWNiX2VuY3J5cHQod2Fsay5zcmMudmlydC5hZGRyLCB3YWxrLmRz
dC52aXJ0LmFkZHIsCj4gPiA+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG5ieXRlcyAmIEFFU19CTE9DS19WQUxJRF9TSVpFX01BU0ssCj4gPiA+ID4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZjdHgtPmtleSk7Cj4gPiA+ID4+ICsgICAgICAgICAg
a2VybmVsX3ZlY3Rvcl9lbmQoKTsKPiA+ID4gPj4gKyAgICAgICAgICBlcnIgPSBza2NpcGhlcl93
YWxrX2RvbmUoCj4gPiA+ID4+ICsgICAgICAgICAgICAgICAgICAmd2FsaywgbmJ5dGVzICYgQUVT
X0JMT0NLX1JFTUFJTklOR19TSVpFX01BU0spOwo+ID4gPiA+PiArICB9Cj4gPiA+ID4+ICsKPiA+
ID4gPj4gKyAgcmV0dXJuIGVycjsKPiA+ID4gPj4gK30KPiA+ID4gPgo+ID4gPiA+IFRoZXJlJ3Mg
bm8gZmFsbGJhY2sgZm9yICFjcnlwdG9fc2ltZF91c2FibGUoKSBoZXJlLiAgSSByZWFsbHkgbGlr
ZSBpdCB0aGlzIHdheS4KPiA+ID4gPiBIb3dldmVyLCBmb3IgaXQgdG8gd29yayAoZm9yIHNrY2lw
aGVycyBhbmQgYWVhZHMpLCBSSVNDLVYgbmVlZHMgdG8gYWxsb3cgdGhlCj4gPiA+ID4gdmVjdG9y
IHJlZ2lzdGVycyB0byBiZSB1c2VkIGluIHNvZnRpcnEgY29udGV4dC4gIElzIHRoYXQgYWxyZWFk
eSB0aGUgY2FzZT8KPiA+ID4KPiA+ID4gVGhlIGtlcm5lbC1tb2RlLXZlY3RvciBjb3VsZCBiZSBl
bmFibGVkIGluIHNvZnRpcnEsIGJ1dCB3ZSBkb24ndCBoYXZlIG5lc3RpbmcKPiA+ID4gdmVjdG9y
IGNvbnRleHRzLiBXaWxsIHdlIGhhdmUgdGhlIGNhc2UgdGhhdCBrZXJuZWwgbmVlZHMgdG8ganVt
cCB0byBzb2Z0aXJxIGZvcgo+ID4gPiBlbmNyeXB0aW9ucyBkdXJpbmcgdGhlIHJlZ3VsYXIgY3J5
cHRvIGZ1bmN0aW9uPyBJZiB5ZXMsIHdlIG5lZWQgdG8gaGF2ZSBmYWxsYmFja3MKPiA+ID4gZm9y
IGFsbCBhbGdvcml0aG1zLgo+ID4KPiA+IEFyZSB5b3UgYXNraW5nIHdoYXQgaGFwcGVucyBpZiBh
IHNvZnRpcnEgaXMgdGFrZW4gd2hpbGUgdGhlIENQVSBpcyBiZXR3ZWVuCj4gPiBrZXJuZWxfdmVj
dG9yX2JlZ2luKCkgYW5kIGtlcm5lbF92ZWN0b3JfZW5kKCk/ICBJIHRoaW5rIHRoYXQgbmVlZHMg
dG8gYmUKPiA+IHByZXZlbnRlZCBieSBtYWtpbmcga2VybmVsX3ZlY3Rvcl9iZWdpbigpIGFuZCBr
ZXJuZWxfdmVjdG9yX2VuZCgpIGRpc2FibGUgYW5kCj4gPiByZS1lbmFibGUgc29mdGlycXMsIGxp
a2Ugd2hhdCBrZXJuZWxfbmVvbl9iZWdpbigpIGFuZCBrZXJuZWxfbmVvbl9lbmQoKSBkbyBvbgo+
ID4gYXJtNjQuICBSZWZlciB0byBjb21taXQgMTMxNTAxNDlhYTZkZWQgd2hpY2ggaW1wbGVtZW50
ZWQgdGhhdCBiZWhhdmlvciBvbiBhcm02NC4KPiAKPiBZZXMsIGlmIG1ha2luZyBWZWN0b3IgYXZh
aWxhYmxlIHRvIHNvZnRpcnEgY29udGV4dCBpcyBhIG11c3QsIHRoZW4gaXQKPiBpcyByZWFzb25h
YmxlIHRvIGNhbGwgbG9jYWxfYmhfZGlzYWJsZSgpIGluIGtlcm5lbF92ZWN0b3JfYmVnaW4oKS4K
PiBIb3dldmVyLCBzb2Z0aXJxIHdvdWxkIG5vdCBiZSB0aGUgb25seSB1c2VyIGZvciBWZWN0b3Ig
YW5kIGRpc2FibGluZwo+IGl0IG1heSBjYXVzZSBleHRyYSBsYXRlbmNpZXMuIE1lYW53aGlsZSwg
c2ltcGx5IGRpc2FibGluZyBiaCBpbgo+IGtlcm5lbF92ZWN0b3JfYmVnaW4oKSB3aWxsIGNvbmZs
aWN0IHdpdGggdGhlIHBhdGNoWzFdIHRoYXQgdGFrZXMgYW4KPiBhcHByb2FjaCB0byBydW4gUHJl
ZW1wdGlibGUgVmVjdG9yLiBUaG91Z2ggaXQgaXMgbm90IGNsZWFyIHlldCBvbgo+IHdoZXRoZXIg
d2Ugc2hvdWxkIHJ1biBWZWN0b3Igd2l0aG91dCB0dXJuaW5nIG9mZiBwcmVlbXB0aW9uLCBJIGhh
dmUKPiB0ZXN0ZWQgcnVubmluZyBwcmVlbXB0aWJsZSBWZWN0b3IgYW5kIG9ic2VydmVkIHNvbWUg
bGF0ZW5jeQo+IGltcHJvdmVtZW50cyB3aXRob3V0IHNhY3JpZmljaW5nIHRocm91Z2hwdXQuIFdl
IHdpbGwgaGF2ZSBhIGRpc2N1c3Npb24KPiBvbiBMUEMyMDIzWzJdIGFuZCBpdCdkIGJlIGdyZWF0
IGlmIHlvdSBjb3VsZCBqb2luIG9yIGNvbnRpbnVlIHRvCj4gZGlzY3VzcyBpdCBoZXJlLgo+IAo+
IEFwcHJvYWNoZXMgY2FuIGJlIGRvbmUgc3VjaCBhcyBuZXN0aW5nLCBpZiBydW5uaW5nIFZlY3Rv
ciBpbiBzb2Z0aXJxCj4gaXMgcmVxdWlyZWQuIFNpbmNlIGl0IHJlcXVpcmVzIGV4dHJhIHNhdmUv
cmVzdG9yZSBvbiBuZXN0aW5nLCBJIHRoaW5rCj4gd2Ugc2hvdWxkIHJ1biBzb21lIHRlc3RzIHRv
IGdldCBtb3JlIHBlcmZvcm1hbmNlIChsYXRlbmN5L3Rocm91Z2hwdXQpCj4gZmlndXJlIGxldCB0
aGUgcmVzdWx0IGRlY2lkZSB0aGUgZmluYWwgZGlyZWN0aW9uLiBGb3IgZXhhbXBsZSwgd2UKPiBj
b3VsZCBydW4gVmVjdG9yIGluIGVpdGhlciBuZXN0aW5nIHdpdGggcHJlZW1wdC1WIGFuZCAgbm9u
LW5lc3RpbmcKPiB3aXRob3V0IHByZWVtcHQtViBhbmQgY29tcGFyZSB0aGUgZm9sbG93aW5nIHBl
cmZvcm1hbmNlIGNhdGFjaHJpc3RpY3M6Cj4gIC0gU3lzdGVtLXdpZGUgbGF0ZW5jeSBpbXBhY3QK
PiAgLSBMYXRlbmN5IGFuZCB0aHJvdWdocHV0IG9mIHNvZnRpcnEtVmVjdG9yIGl0c2VsZgoKVGhl
IHNrY2lwaGVyIGFuZCBhZWFkIEFQSXMgZG8gaW5kZWVkIG5lZWQgdG8gd29yayBpbiBzb2Z0aXJx
IGNvbnRleHQuCgpJdCdzIHBvc3NpYmxlIHRvIHVzZSBhIGZhbGxiYWNrLCBlaXRoZXIgYnkgZmFs
bGluZyBiYWNrIHRvIHNjYWxhciBpbnN0cnVjdGlvbnMKb3IgYnkgcHVudGluZyB0aGUgZW5jcnlw
dGlvbi9kZWNyeXB0aW9uIG9wZXJhdGlvbiB0byBhIHdvcmtxdWV1ZSB1c2luZwpjcnlwdG8vc2lt
ZC5jLiAgSG93ZXZlciwgYm90aCBhcHByb2FjaGVzIGhhdmUgc29tZSBzaWduaWZpY2FudCBkaXNh
ZHZhbnRhZ2VzLgpJdCB3YXMgbmljZSB0aGF0IHRoZSBuZWVkIGZvciB0aGVtIG9uIGFybTY0IHdh
cyBlbGltaW5hdGVkIGJ5IGNvbW1pdAoxMzE1MDE0OWFhNmRlZC4gIE5vdGUgdGhhdCBpdCdzIHBv
c3NpYmxlIHRvIHlpZWxkIHRoZSB2ZWN0b3IgdW5pdCBvY2Nhc2lvbmFsbHksCnRvIGtlZXAgcHJl
ZW1wdGlvbiBhbmQgc29mdGlycXMgZnJvbSBiZWluZyBkaXNhYmxlZCBmb3IgdG9vIGxvbmcuCgot
IEVyaWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
