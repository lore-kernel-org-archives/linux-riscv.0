Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C681C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1YF183mQaUI6G6y5K7UYd6V6yQ09EO9caWtG3GEaAs=; b=U0hES+XOtY1FKF
	ME1x16shZdxGIuCmz2mrcNAJ6mNTUgzvqx+XkmOHhe5BT0rif7l+6EJl3q0qd+yWtzGmiVWe6BUn1
	WzrBpIJPB5FraMuf13x7fotQW4vkHZCa7afav41TXzgoTQ9zpVLUSk9cFBBYJm3MsXcX2vSTNdnbo
	YuAhZDVcGMvDeCiDz27nFHeF6O2lp3m1d5cu5jyuhjuFdrW7X8O2V/XMfOXfzGpozOE81tA75fhwH
	SAWHe/5cW1UPAAoIJHSnzKiOlVjwY4Q7dypa6TxvS0HZb2EUVvcg5oN3i1KDK69AGPG150gTFUdvW
	3bc23II8Sd4wNjIqINSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyYG-000GQQ-2W;
	Wed, 20 Dec 2023 15:32:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyYD-000GPY-2o
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 15:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1876B616AF;
	Wed, 20 Dec 2023 15:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF40CC433C9;
	Wed, 20 Dec 2023 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703086320;
	bh=bJrXRcY+g/Zhyk8TW6XZqRLmOKlhPoFZoeRcr95OHAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJpmbySAxKPqvlBNNh0uHDkKT392pfPwzUcxeMf1SAQwSzPm3LIZJcf5o+oCD/R3Y
	 6Cjn6qo7opW3EyTozovruSthCjWFVVSa06SX6ZsSUeGw5UwPXEsKQpf/etNetMl+Lp
	 vd5dhQzaSLh9DMoy23FTdHsOUftdzC5HFBApSDmepwOm5kWcQfg+hPipRc4NPL5Y+w
	 7iAbKvDaAVZwgS9amxh+1g6k37+BmWL7MOn2pdRGVIJcgS6wRtGV3rQiR863vCJ8Sq
	 US3Vvcqj5l3vvaU8RQXzJDDXtXAjAHtyR4S023FAL4lb2JKQ51Wg/6IynUL68hC4ms
	 eKiTS2oQHAwCw==
Date: Wed, 20 Dec 2023 09:31:55 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
Cc: Jerry Shih <jerry.shih@sifive.com>, linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] crypto: riscv - use real assembler for vector crypto
 extensions
Message-ID: <20231220153155.GA817@quark.localdomain>
References: <20231220065648.253236-1-ebiggers@kernel.org>
 <CAEg0e7hh-qY9eF1nW5U32j7XYV2RLEdqRP1LzRi+eZHKtKR-aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7hh-qY9eF1nW5U32j7XYV2RLEdqRP1LzRi+eZHKtKR-aQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_073201_949338_D4F6AC29 
X-CRM114-Status: GOOD (  18.84  )
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

T24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMDg6NTI6NDVBTSArMDEwMCwgQ2hyaXN0b3BoIE3DvGxs
bmVyIHdyb3RlOgo+IE9uIFdlZCwgRGVjIDIwLCAyMDIzIGF0IDc6NTfigK9BTSBFcmljIEJpZ2dl
cnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZyb206IEVyaWMgQmlnZ2Vy
cyA8ZWJpZ2dlcnNAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBMTFZNIG1haW4gYW5kIGJpbnV0aWxzIG1h
c3RlciBub3cgYm90aCBmdWxseSBzdXBwb3J0IHYxLjAgb2YgdGhlIFJJU0MtVgo+ID4gdmVjdG9y
IGNyeXB0byBleHRlbnNpb25zLiAgVGhlcmVmb3JlLCBkZWxldGUgcmlzY3YucG0gYW5kIHVzZSB0
aGUgcmVhbAo+ID4gYXNzZW1ibGVyIG1uZW1vbmljcyBmb3IgdGhlIHZlY3RvciBjcnlwdG8gaW5z
dHJ1Y3Rpb25zLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNA
Z29vZ2xlLmNvbT4KPiAKPiBGb3IgT3BlblNTTCwgdGhlc2UgaGFuZC13cml0dGVuIGFzc2VtYmxl
ciBmdW5jdGlvbnMgd2VyZSBtYWlubHkgd3JpdHRlbgo+IHRvIG1ha2UgT3BlblNTTCdzIENJIGJ1
aWxkcyBoYXBweSwgd2hpY2ggcnVuIG9uIHRoZSBsYXRlc3QgVWJ1bnR1IExUUy4KPiAKPiBJJ20g
aGFwcHkgdG8gc2VlIHRoZXNlIGZ1bmN0aW9ucyBkaXNhcHBlYXIsIGJ1dCBJIHdvbmRlciBpZiB0
aGVyZSBpcyBhCj4gZ3VpZGVsaW5lIG9yIGJlc3QtcHJhY3RpY2UgZm9yIGFzc2VtYmx5IG9wdGlt
aXphdGlvbnMgbGlrZSB0aGlzLgo+Cj4gVGhlIHVwY29taW5nIEJpbnV0aWxzIHJlbGVhc2UgKHBy
ZXN1bWFibHkgYXZhaWxhYmxlIGluIEphbiAyNCkgd2lsbAo+IChwcmVzdW1hYmx5KSBiZSBhdmFp
bGFibGUgaW4gVWJ1bnR1IDI0LjEwLgo+IEFuZCB1bnRpbCB0aGVuIG1vc3QgdXNlcnMgd29uJ3Qg
YmUgZXZlbiBidWlsZGluZyB0aGUgY29kZS4KPgo+IAo+IAo+IFJldmlld2VkLWJ5OiBDaHJpc3Rv
cGggTcO8bGxuZXIgPGNocmlzdG9waC5tdWVsbG5lckB2cnVsbC5ldT4KCkFzIGZhciBhcyBJIGNh
biB0ZWxsLCBrZXJuZWwgY29kZSB1c3VhbGx5IGp1c3QgcmVsaWVzIG9uIGFzc2VtYmxlciBzdXBw
b3J0IGZvcgpuZXcgaW5zdHJ1Y3Rpb25zLiAgU2VlIGUuZy4gQ09ORklHX0FTX0FWWDUxMiBmb3Ig
eDg2J3MgQVZYLTUxMi4gIFlvdSBjYW4ndCBidWlsZAp0aGUgQVZYLTUxMiBvcHRpbWl6ZWQgY3J5
cHRvIGNvZGUgdW5sZXNzIHlvdXIgYXNzZW1ibGVyIHN1cHBvcnRzIEFWWC01MTIuCkJleW9uZCB0
aGF0IG9ic2VydmF0aW9uLCBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYSBzcGVjaWZpYyBndWlkZWxp
bmUuCgpUaGUga2VybmVsIGRvZXNuJ3QgaGF2ZSBDSSBvbiBVYnVudHUsIGF0IGxlYXN0IG5vdCBv
ZmZpY2lhbGx5IGZvciB1cHN0cmVhbS4KRWl0aGVyIHdheSwgaXQncyBwb3NzaWJsZSB0byBpbnN0
YWxsIG5ld2VyIExMVk0gYW5kIGJpbnV0aWxzIG9uIG9sZCBMaW51eApkaXN0cm9zIGFueXdheS4g
IEFsc28sIHRoZSBSSVNDLVYgY3J5cHRvIGNvZGUgd29uJ3QgbWFrZSBpdCBpbnRvIHY2Ljggc2lu
Y2UgaXQKZGVwZW5kcyBvbiBhIHNlcGFyYXRlIHBhdGNoIHRoYXQgYWRkcyBzdXBwb3J0IGZvciBr
ZXJuZWwgbW9kZSB2ZWN0b3IuICBJdCB3aWxsCmJlIG1lcmdlZCBpbnRvIHY2LjkgYXQgdGhlIGVh
cmxpZXN0LgoKU28gbXkgdm90ZSBpcyB0byBqdXN0IHJlbHkgb24gdGhlIExMVk0gYW5kIGJpbnV0
aWxzIHN1cHBvcnQuCgotIEVyaWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
