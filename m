Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A60C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 05:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anfvFTOl/Wp6fm5STJQvhFbu6IQ5l9KFHKm0GcvpfVQ=; b=2dwu5Wu+0OdqwS
	ZAw1lDyQgx0sDK6fR0zziTijATMeKHVOmMOp//jYKR9TLPID12K2j7id9vGfrwbMLidXjjuBmz0ML
	VOxyyV10vWDCQSuKZ/8InZpihbgJnKmUME94C/SVvzFSsQZHwQ5w+BvompmkrQC1g44eVaF7O2VyT
	yk5UOyYcD4ISz5n468umtYvMjai04prT5QHNQNbVEPQ9OR3nTBmMHtdHxYsHugz0JdiPGPUOhyz4N
	PV0Dl/70PzZuOk9N+yz/5EXRp8IsnFK7FybYGYPw5w6lY9/u2Um0tgQKNLyNLC7CW9qz2oSM8IbLa
	Dy57NByZegMuxF/llzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV3Ij-00000001YGT-0xPM;
	Wed, 31 Jan 2024 05:38:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV3Ig-00000001YFz-0rtj
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 05:38:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 330A5CE1DAB;
	Wed, 31 Jan 2024 05:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB433C43390;
	Wed, 31 Jan 2024 05:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706679493;
	bh=22Krx4btf00/8e1ZZBBu8MzhsLLX45dV/yNclvUWUag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SprPIEdeeiOm1uug0/HcOCQDu8xShAIOqfy+Lr8SVYVikVDl3aI9ONVCm1PDroLb1
	 /BBHiEG3trPAcQac98allr6kqurTPWi3T/1CU/PDwPa5WreOBblJ06FFQG63/iXQK8
	 c1pDO19/jRPVQ2ZTmkW4gLUv20otv3aiF+NVanjiOKc1j95D4q0k0APJIt0a7JLLw/
	 VvaqDj03CMt0Z19iCHhUPPiRIZp5JLNPh4DEVmUjvSJtsDDzHIOE/gen0ZBU8Z+FCC
	 iLPTFwl638xcT/bFSayT0AriKuzt6aMpfFNTa6R6FJXhcleU9ee3OTpMF8Of7QEF19
	 rsNbZ5uKJN0Zg==
Date: Wed, 31 Jan 2024 13:25:10 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Matteo Croce <mcroce@microsoft.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] riscv: optimized memmove
Message-ID: <ZbnZthTjiUArHIvq@xhacker>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240128111013.2450-3-jszhang@kernel.org>
 <fa36b871-43d7-413c-82a2-0ecc0ebce9b4@ics.forth.gr>
 <Zbj1o6VAsk8Tn2ab@xhacker>
 <c6066469-7bc9-4232-b600-0b167193f13f@ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6066469-7bc9-4232-b600-0b167193f13f@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_213818_624980_66594C32 
X-CRM114-Status: GOOD (  30.77  )
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

T24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMDY6NTI6MjRQTSArMDIwMCwgTmljayBLb3NzaWZpZGlz
IHdyb3RlOgo+IE9uIDEvMzAvMjQgMTU6MTIsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiBPbiBU
dWUsIEphbiAzMCwgMjAyNCBhdCAwMTozOToxMFBNICswMjAwLCBOaWNrIEtvc3NpZmlkaXMgd3Jv
dGU6Cj4gPiA+IE9uIDEvMjgvMjQgMTM6MTAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiA+ID4g
RnJvbTogTWF0dGVvIENyb2NlIDxtY3JvY2VAbWljcm9zb2Z0LmNvbT4KPiA+ID4gPiAKPiA+ID4g
PiBXaGVuIHRoZSBkZXN0aW5hdGlvbiBidWZmZXIgaXMgYmVmb3JlIHRoZSBzb3VyY2Ugb25lLCBv
ciB3aGVuIHRoZQo+ID4gPiA+IGJ1ZmZlcnMgZG9lc24ndCBvdmVybGFwLCBpdCdzIHNhZmUgdG8g
dXNlIG1lbWNweSgpIGluc3RlYWQsIHdoaWNoIGlzCj4gPiA+ID4gb3B0aW1pemVkIHRvIHVzZSBh
IGJpZ2dlciBkYXRhIHNpemUgcG9zc2libGUuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogTWF0dGVvIENyb2NlIDxtY3JvY2VAbWljcm9zb2Z0LmNvbT4KPiA+ID4gPiBSZXBvcnRlZC1i
eToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gPiAKPiA+ID4gSSdkIGV4
cGVjdCB0byBoYXZlIG1lbW1vdmUgaGFuZGxlIGJvdGggZncvYncgY29weWluZyBhbmQgdGhlbiBt
ZW1jcHkgYmVpbmcKPiA+ID4gYW4gYWxpYXMgdG8gbWVtbW92ZSwgdG8gYWxzbyB0YWtlIGNhcmUg
d2hlbiByZWdpb25zIG92ZXJsYXAgYW5kIGF2b2lkCj4gPiA+IHVuZGVmaW5lZCBiZWhhdmlvci4K
PiA+IAo+ID4gSGkgTmljaywKPiA+IAo+ID4gSGVyZSBpcyBzb210aGluZyBmcm9tIG1hbiBtZW1j
cHk6Cj4gPiAKPiA+ICJ2b2lkICptZW1jcHkodm9pZCBkZXN0W3Jlc3RyaWN0IC5uXSwgY29uc3Qg
dm9pZCBzcmNbcmVzdHJpY3QgLm5dLAo+ID4gICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IG4p
Owo+ID4gCj4gPiBUaGUgIG1lbWNweSgpICBmdW5jdGlvbiBjb3BpZXMgbiBieXRlcyBmcm9tIG1l
bW9yeSBhcmVhIHNyYyB0byBtZW1vcnkgYXJlYSBkZXN0Lgo+ID4gVGhlIG1lbW9yeSBhcmVhcyBt
dXN0IG5vdCBvdmVybGFwLiAgVXNlIG1lbW1vdmUoMykgaWYgdGhlIG1lbW9yeSBhcmVhcyBkbyAg
b3ZlcuKAkAo+ID4gbGFwLiIKPiA+IAo+ID4gSU1ITywgdGhlICJyZXN0cmljdCIgaW1wbGllcyB0
aGF0IHRoZXJlJ3Mgbm8gb3ZlcmxhcC4gSWYgb3ZlcmxhcAo+ID4gaGFwcGVucywgdGhlIG1hbnVh
bCBkb2Vzbid0IHNheSB3aGF0IHdpbGwgaGFwcGVuLgo+ID4gCj4gPiAgRnJvbSBhbm90aGVyIHNp
ZGUsIEkgaGF2ZSBhIGNvbmNlcm46IGN1cnJlbnRseSwgb3RoZXIgYXJjaCBkb24ndCBoYXZlCj4g
PiB0aGlzIGFsaWFzIGJlaGF2aW9yLCBJSVVDKGF0IGxlYXN0LCBwZXIgbXkgdW5kZXJzdGFuZGlu
ZyBvZiBhcm0gYW5kIGFybTY0Cj4gPiBtZW1jcHkgaW1wbGVtZW50YXRpb25zKXRoZXkganVzdCBj
b3B5IGZvcndhcmQuIEkgd2FudCB0byBrZWVwIHNpbWlsYXIgYmVoYXZpb3IKPiA+IGZvciByaXNj
di4KPiA+IAo+ID4gU28gSSB3YW50IHRvIGhlYXIgbW9yZSBiZWZvcmUgZ29pbmcgdG93YXJkcyBh
bGlhcy1tZW1jcHktdG8tbWVtbW92ZSBkaXJlY3Rpb24uCj4gPiAKPiA+IFRoYW5rcwo+IAoKSGkg
TmljaywKCj4gSWYgeW91IHJlYWQgTWF0dGVvJ3Mgb3JpZ2luYWwgcG9zdCB0aGF0IHdhcyBhbHNv
IGhpcyBzdWdnZXN0aW9uLCBhbmQgTGludXMKCkkgZGlkIHJlYWQgYWxsIGRpc2N1c3Npb25zIGlu
IE1hdHRlbydzIHYxIH4gdjUgYmVmb3JlIHRoaXMgcmVuZXcuIFBlciBteQp1bmRlcnN0YW5kaW5n
LCBNYXR0ZW8gYWxzbyBjb25jZXJuZWQgbm8gc3VjaCBtZW1jcHktYWxpYXMtbWVtbW92ZSBiZWhh
dmlvcgppbiBvdGhlciBhcmNoJ3MgaW1wbGVtZW50YXRpb25zLgoKPiBoYXMgYWxzbyBjb21tZW50
ZWQgb24gdGhhdC4gSW4gZ2VuZXJhbCBpdCdzIGJldHRlciB0byBoYW5kbGUgdGhlIGNhc2Ugd2hl
cmUKCkxpbnVzIGNvbW1lbnRlZCBvbiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19i
dWcuY2dpP2lkPTYzODQ3NyNjMTMyCmFib3V0IGdsaWJjIGFsaWFzIG1lbWNweSB0byBtZW1vdmUg
cmF0aGVyIHRoYW4gdGhlIHBhdGNoIHNlcmllcy4KCj4gdGhlIHJlZ2lvbnMgcHJvdmlkZWQgdG8g
bWVtY3B5KCkgb3ZlcmxhcCB0aGFuIHRvIHJlc29ydCB0byAidW5kZWZpbmVkCj4gYmVoYXZpb3Ii
LCBJIHByb3ZpZGVkIGEgYmFja3dhcmRzIGNvcHkgZXhhbXBsZSB0aGF0IHlvdSBjYW4gdXNlIHNv
IHRoYXQgd2UKPiBjYW4gaGF2ZSBib3RoIGZ3IGFuZCBidyBjb3B5aW5nIGZvciBtZW1tb3ZlKCks
IGFuZCB1c2UgbWVtbW92ZSgpIGluIGFueQo+IGNhc2UuIFRoZSBbcmVzdHJpY3QgLm5dIGluIHRo
ZSBwcm90b3R5cGUgaXMganVzdCB0aGVyZSB0byBzYXkgdGhhdCB0aGUgc2l6ZQo+IG9mIHNyYyBp
cyByZXN0cmljdGVkIGJ5IG4gKHRoZSBuZXh0IGFyZ3VtZW50KS4gSWYgc29tZW9uZSB1c2VzIG1l
bWNweSgpIHdpdGgKCkkgZGlkbid0IGhhdmUgYzk5IHNwZWMgaW4gaGFuZCwgYnV0IEkgZm91bmQg
Z2NjIGV4cGxhbmF0aW9ucyBhYm91dApyZXN0cmljdCBrZXl3b3JkIGZyb20gWzFdOgoKInRoZSBy
ZXN0cmljdCBkZWNsYXJhdGlvbiBwcm9taXNlcyB0aGF0IHRoZSBjb2RlIHdpbGwgbm90IGFjY2Vz
cyB0aGF0Cm9iamVjdCBpbiBhbnkgb3RoZXIgd2F5LS1vbmx5IHRocm91Z2ggcC4iCgpTbyBpZiB0
aGVyZSdzIG92ZXJsYXAgaW4gbWVtY3B5LCB0aGVuIGl0IGNvbnRyYWRpY3RzIHRoZSByZXN0cmlj
dAppbXBsaWNhdGlvbi4KClsxXSBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2MtaW50cm8t
YW5kLXJlZi9tYW51YWwvaHRtbF9ub2RlL3Jlc3RyaWN0LVBvaW50ZXJzLmh0bWwKCkFuZCBmcm9t
IHRoZSBtYW51YWwsIGlmIHRoZSBtZW1jcHkgdXNlcnMgbXVzdCBlbnN1cmUgIlRoZSBtZW1vcnkg
YXJlYXMKbXVzdCBub3Qgb3ZlcmxhcC4iIFNvIEkgdGhpbmsgYWxsIGxpbnV4IGtlcm5lbCdzIG1l
bWNweSBpbXBsZW1lbnRhdGlvbnMob25seSBjb3B5CmZ3IGFuZCBkb24ndCB0YWtlIG92ZXJsYXAg
aW50byBjb25zaWRlcmF0aW9uKSBhcmUgcmlnaHQuCgpJIGRpZCBzZWUgdGhlIGFsaWFzLW1lbWNw
eS1hcy1tZW1tb3ZlIGluIHNvbWUgbGliYyBpbXBsZW1lbnRhdGlvbnMsIGJ1dAp0aGlzIGlzIG5v
dCB0aGUgc3R5bGUgaW4gY3VycmVudCBrZXJuZWwncyBpbXBsZW1lbnRhdGlvbnMuCgpHaXZlbiBj
dXJyZW50IHJpc2N2IGFzbSBpbXBsZW1lbnRhdGlvbiBhbHNvIGRvZXNuJ3QgZG8gdGhlIGFsaWFz
IGFuZApjb3B5LWZ3IG9ubHksIGFuZCB0aGlzIHNlcmllcyBpbXByb3ZlcyBwZXJmb3JtYW5jZSBh
bmQgZG9lc24ndCBpbnRyb2R1Y2UgdGhlCklzIGl0IGJldHRlciB0byBkaXZpZGUgdGhpcyBpbnRv
IHR3byBzdGVwczogRmlyc3RseSwgbWVyZ2UgdGhpcyBzZXJpZXMKaWYgdGhlcmUncyBubyBvYnZp
b3VzIGJ1Zzsgc2Vjb25kbHksIGRvIHRoZSBhbGlhcyBhcyB5b3Ugc3VnZ2VzdGVkLApzaW5jZSB5
b3UgaGF2ZSBhIGJhc2ljIGltcGxlbWVudGF0aW9uLCB5b3UgY291bGQgZXZlbiBzdWJtaXQgeW91
ciBwYXRjaAo7KSBXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIHR3byBzdGVwcyBzb2x1dGlv
bj8KClRoYW5rcwo+IG92ZXJsYXBwaW5nIHJlZ2lvbnMsIHdoaWNoIGlzIGFsd2F5cyBhIHBvc3Np
YmlsaXR5LCBpbiB5b3VyIGNhc2UgaXQnbGwKPiByZXN1bHQgY29ycnVwdGVkIGRhdGEsIHdlIHdv
bid0IGV2ZW4gZ2V0IGEgd2FybmluZyAoc3RpbGwgY291bnRzIGFzCj4gdW5kZWZpbmVkIGJlaGF2
aW9yKSBhYm91dCBpdC4KPiAKPiBSZWdhcmRzLAo+IE5pY2sKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
