Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50494C07E97
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 20:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IM3HAk8xiIL3yXdBln1rPxLUX6YM4frzn5ocQiLyESI=; b=N8XeiwQ5gnz7kX
	pXE/RC6aixITTmKmqHSXXcWQ15rLiKCr2bpkMHKtRPSqPjHQ/qHjkbGEh10fMpU9Qikt/J03+eG0w
	t1+BinDiKRCc+4sFRDllGxbnKYRUIs6oTXaiHgKURp/eUJiIIAnXtG0/JfUHVF9WOg+3XqJj1jFgD
	j+E9UctErOnGwgZzKx2pUpRIY+/J6tRWgxIcCrPh6ehEdAaoI5MYEKDMIikShCMhQ0LKTqvfFrNfC
	KuwZ3UyU/LXGqVvLHkx4rz4qNyCXZ2ppsaGP1G1dDm4W/jjAy8KP6Eare1ix7DyTTlobDKC/4OJX+
	fhMNGvPLYT71/rIe0Q6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84YQ-006FDV-2u;
	Tue, 28 Nov 2023 20:19:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84YN-006FCW-2k
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 20:19:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25F18615A3;
	Tue, 28 Nov 2023 20:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C04C433C7;
	Tue, 28 Nov 2023 20:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701202770;
	bh=vKcCjyLVw3bjH2nAbGvTRYUZk8vCUBzOv+eNIVNniKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwPP8Zh/wIMSUwPd+LCbXfoffVFwUTvypXR+81vo/8CGQlhdfbd5t/1wKeP4XCEou
	 DaF5P2lGIOhuJxY34ENDBKvIuTFqmdYH027AlRVFasP74O9azyDo89rob4Bz6Dv8/h
	 jyhHu6kwcyz3q2YI7aQh5dTv2/46XiKrmR3VbRJgHVvaQD4KRkREQnyQcurVtrYgtE
	 h8U5NgrZGmfBFSFEHlgemFt94lS507L/Hz4DIsQTk2VF5GCSXOfAQ5siE+rhX1HQol
	 6gHNd4f9GRCumC/FHpxKp49dTEKQT+7m0vqoaHdszKj5JjKGDrQ/9dJ7J6mzdxKw5/
	 1uLkoj9C9qycA==
Date: Tue, 28 Nov 2023 12:19:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
Cc: Jerry Shih <jerry.shih@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Message-ID: <20231128201928.GF1148@sol.localdomain>
References: <ZQJdnCwf99Glggin@ghost>
 <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
 <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com>
 <20231006194741.GA68531@google.com>
 <AB98E114-A8DE-492E-B078-7394EE4FA83E@sifive.com>
 <20231102040333.GC1498@sol.localdomain>
 <20231121235109.GE2172@sol.localdomain>
 <3416A95B-8687-44F6-9F77-D30AD6516094@sifive.com>
 <20231122234259.GB1541@sol.localdomain>
 <CAEg0e7iPGnaMKR9bT01-bGOUUToUG0o3Q7NBS_m8CbZdYWeBXA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7iPGnaMKR9bT01-bGOUUToUG0o3Q7NBS_m8CbZdYWeBXA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_121931_980768_C19A28A9 
X-CRM114-Status: GOOD (  27.95  )
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

T24gVGh1LCBOb3YgMjMsIDIwMjMgYXQgMDE6MzY6MzRBTSArMDEwMCwgQ2hyaXN0b3BoIE3DvGxs
bmVyIHdyb3RlOgo+IE9uIFRodSwgTm92IDIzLCAyMDIzIGF0IDEyOjQz4oCvQU0gRXJpYyBCaWdn
ZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIE5vdiAyMiwg
MjAyMyBhdCAwMzo1ODoxN1BNICswODAwLCBKZXJyeSBTaGloIHdyb3RlOgo+ID4gPiBPbiBOb3Yg
MjIsIDIwMjMsIGF0IDA3OjUxLCBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4gPiA+IE9uIFdlZCwgTm92IDAxLCAyMDIzIGF0IDA5OjAzOjMzUE0gLTA3MDAsIEVy
aWMgQmlnZ2VycyB3cm90ZToKPiA+ID4gPj4KPiA+ID4gPj4gSXQgd291bGQgYmUgbmljZSB0byB1
c2UgYSByZWFsIGFzc2VtYmxlciwgc28gdGhhdCBwZW9wbGUgd29uJ3QgaGF2ZSB0byB3b3JyeQo+
ID4gPiA+PiBhYm91dCBwb3RlbnRpYWwgbWlzdGFrZXMgb3IgaW5jb25zaXN0ZW5jaWVzIGluIHRo
ZSBwZXJsLWJhc2VkICJhc3NlbWJsZXIiLiAgQWxzbwo+ID4gPiA+PiBrZWVwIGluIG1pbmQgdGhh
dCBpZiB3ZSBhbGxvdyBwZW9wbGUgdG8gY29tcGlsZSB0aGlzIGNvZGUgd2l0aG91dCB0aGUgcmVh
bAo+ID4gPiA+PiBhc3NlbWJsZXIgc3VwcG9ydCBmcm9tIHRoZSBiZWdpbm5pbmcsIGl0IG1pZ2h0
IGVuZCB1cCBzdGF5aW5nIHRoYXQgd2F5IGZvciBxdWl0ZQo+ID4gPiA+PiBhIHdoaWxlIGluIG9y
ZGVyIHRvIGF2b2lkIGJyZWFraW5nIHRoZSBidWlsZCBmb3IgcGVvcGxlLgo+ID4gPiA+Pgo+ID4g
PiA+PiBVbHRpbWF0ZWx5IGl0J3MgdXAgdG8geW91IHRob3VnaDsgSSB0aGluayB0aGF0IHlvdSBh
bmQgb3RoZXJzIHdobyBoYXZlIGJlZW4KPiA+ID4gPj4gd29ya2luZyBvbiBSSVNDLVYgY3J5cHRv
IGNhbiBtYWtlIHRoZSBiZXN0IGRlY2lzaW9uIGFib3V0IHdoYXQgdG8gZG8gaGVyZS4gIEkKPiA+
ID4gPj4gYWxzbyBkb24ndCB3YW50IHRoaXMgcGF0Y2hzZXQgdG8gYmUgZGVsYXllZCB3YWl0aW5n
IGZvciBvdGhlciBwcm9qZWN0cywgc28gbWF5YmUKPiA+ID4gPj4gdGhhdCBpbmRlZWQgbWVhbnMg
dGhlIHBlcmwtYmFzZWQgImFzc2VtYmxlciIgbmVlZHMgdG8gYmUgdXNlZCBmb3Igbm93Lgo+ID4g
PiA+Cj4gPiA+ID4gSnVzdCB3YW50ZWQgdG8gYnVtcCB1cCB0aGlzIGRpc2N1c3Npb24gYWdhaW4u
ICBJbiBiaW51dGlscywgdGhlIHZlY3RvciBjcnlwdG8KPiA+ID4gPiB2MS4wLjAgc3VwcG9ydCB3
YXMgcmVsZWFzZWQgNCBtb250aHMgYWdvIGluIDIuNDEuICBTZWUgdGhlIE5FV1MgZmlsZSBhdAo+
ID4gPiA+IGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0L2dpdHdlYi5jZ2k/cD1iaW51dGlscy1n
ZGIuZ2l0O2E9YmxvYl9wbGFpbjtmPWJpbnV0aWxzL05FV1M7aGI9cmVmcy9oZWFkcy9iaW51dGls
cy0yXzQxLWJyYW5jaAo+ID4gPiA+Cj4gPiA+ID4gICAgKiBUaGUgUklTQy1WIHBvcnQgbm93IHN1
cHBvcnRzIHRoZSBmb2xsb3dpbmcgbmV3IHN0YW5kYXJkIGV4dGVuc2lvbnM6Cj4gPiA+ID4gICAg
ICAtIFppY29uZCAoY29uZGl0aW9uYWwgemVybyBpbnN0cnVjdGlvbnMpCj4gPiA+ID4gICAgICAt
IFpmYSAoYWRkaXRpb25hbCBmbG9hdGluZy1wb2ludCBpbnN0cnVjdGlvbnMpCj4gPiA+ID4gICAg
ICAtIFp2YmIsIFp2YmMsIFp2a2csIFp2a25lZCwgWnZrbmhbYWJdLCBadmtzZWQsIFp2a3NoLCBa
dmtuLCBadmtuYywgWnZrbmcsCj4gPiA+ID4gICAgICAgIFp2a3MsIFp2a3NjLCBadmtnLCBadmt0
ICh2ZWN0b3IgY3J5cHRvIGluc3RydWN0aW9ucykKPiA+ID4gPgo+ID4gPiA+IFRoYXQncyBldmVy
eSBleHRlbnNpb24gbGlzdGVkIGluIHRoZSB2ZWN0b3IgY3J5cHRvIHYxLjAuMCBzcGVjaWZpY2F0
aW9uCj4gPiA+ID4gKGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1jcnlwdG8vcmVsZWFz
ZXMvZG93bmxvYWQvdjEuMC4wL3Jpc2N2LWNyeXB0by1zcGVjLXZlY3Rvci5wZGYpLgo+ID4gPgo+
ID4gPiBJdCBkb2Vzbid0IGZpdCBhbGwgdjEuMCBzcGVjLgo+ID4gPiBUaGUgYFp2a2JgIGlzIG1p
c3NlZCBpbiBiaW51dGlscy4gSXQncyB0aGUgc3Vic2V0IG9mIGBadmJiYC4gV2UgbmVlZHMgc29t
ZSBleHRyYQo+ID4gPiB3b3JrcyBpZiB1c2VyIGp1c3QgdHJ5IHRvIHVzZSBgWnZrYmAuCj4gPiA+
IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1jcnlwdG8vYmxvYi9tYWluL2RvYy92ZWN0
b3IvcmlzY3YtY3J5cHRvLXZlY3Rvci16dmtiLmFkb2MKPiA+ID4gU29tZSBjcnlwdG8gYWxnb3Jp
dGhtcyBhcmUgYWxyZWFkeSBjaGVja2luZyBmb3IgYFp2a2JgIGluc3RlYWQgb2YgYFp2YmJgLgo+
ID4KPiA+IFllYWgsIHRoYXQncyB1bmZvcnR1bmF0ZSB0aGF0IFp2a2IgZ290IG1pc3NlZCBpbiBi
aW51dGlscy4gIEhvd2V2ZXIsIHNpbmNlIGFsbAo+ID4gWnZrYiBpbnN0cnVjdGlvbnMgYXJlIHBh
cnQgb2YgWnZiYiwgd2hpY2ggaXMgc3VwcG9ydGVkLCBhc3NlbWJsaW5nIFp2a2IKPiA+IGluc3Ry
dWN0aW9ucyBzaG91bGQgc3RpbGwgd29yayAtLS0gcmlnaHQ/Cj4gCj4gTm90IGZvcmdvdHRlbiwg
YnV0IHRoZSBadmtiIGV4dGVuc2lvbiBkaWQgbm90IGV4aXN0IHdoZW4gdGhlIHBhdGNoc2V0Cj4g
d2FzIG1lcmdlZC4KPiBSSVNDLVYgZXh0ZW5zaW9uIHN1cHBvcnQgaXMgdHlwaWNhbGx5IG1lcmdl
ZCB3aGVuIHNwZWNpZmljYXRpb25zIGFyZSAiZnJvemVuIi4KPiBUaGlzIG1lYW5zIGEgaGlnaCBi
YXIgZm9yIGNoYW5nZXMsIGJ1dCB0aGV5IGFyZSBwb3NzaWJsZSB1bnRpbCB0aGUKPiBzcGVjIGlz
IHJhdGlmaWVkLgo+IE9mdGVuIG5vdGhpbmcgaXMgY2hhbmdlZCB1bnRpbCByYXRpZmljYXRpb24s
IGJ1dCBoZXJlIFp2a2IgaGFzIGJlZW4KPiAocmUtKWludHJvZHVjZWQuCj4gCj4gSSB3YXMgbm90
IGF3YXJlIG9mIHRoaXMgdW50aWxzIEkgcmVhZCB0aGlzIGVtYWlsLCBzbyBJIGp1c3Qgd3JvdGUg
YQo+IHBhdGNoIHRoYXQgZmlsbHMgdGhlIGdhcDoKPiAgIGh0dHBzOi8vc291cmNld2FyZS5vcmcv
cGlwZXJtYWlsL2JpbnV0aWxzLzIwMjMtTm92ZW1iZXIvMTMwNzYyLmh0bWwKPiAKClRoYW5rcyBD
aHJpc3RvcGghICBUaGF0IGJpbnV0aWxzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuCgotIEVyaWMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
