Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA6C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 13:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6Feb46Af5snstXWqHIUrKJ8t8/qivIFvsL0acjniqk=; b=KT8z7vtaU6I5e+
	IFQof+HLrgWPw+y3jID6Bydb2qveIthD2MRo4N8ZN4eyJNcilDH/PKyZnELrtcV1cHDZgxKxr5P3y
	3TzbdHQzSCBcPgvX2YqxsjKqpRwplaByJXinz675pd3NsLUcvGkui6ibQz5s7omdm1Jzyh8Tpg+M7
	MGhgt9OtPmwv74TKcb2LShpQPqllNnWw1pyoeWYiEJqIPIndiHWVxWEa5MYotNxPCv78Vs2aw7tXx
	je9N3pZd/e1AgFd/fM1EyGUom0wuzLub0Jtpo/7Rdurqo21rqzcSBOT0ShtZAKN2LwwlVBx9Nrz9S
	oX2H+dHln9XeZGbmmQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpvA-00HI6k-Nd; Wed, 23 Nov 2022 13:36:12 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpv7-00HI5w-Ju
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 13:36:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669210562; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fl6C8NlVzAsWPEBN5Zu5VN9JD+iUmo2wGYPhBFG8JNOkRXAJbNNEsar2nmLxps62oT+7vQ2ZlxCgc0n4PfrJNqo5I5BBULajA2Wg/jG2BhXv0pGC9erZPMHfkTtewtWAyUQosXLRis8oJKA6x3zMQAxvL56wpIh/sAPVNravmkE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669210562; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=jmmp9+L79IRqXmKJpYo/LsiNpc9jXUTGtxlroOFT0zw=; 
	b=LLLJMoVGg8/9XWLtI6vy/T0IGhP8DXIhmVGLagmKZCvYUeovQFQgCiVAg+YMwt39juHzzYhk6Pa+91dGZmtHpt86LRgBPrInvxPbAOuKWRV6nJS6FpAFdcansC3bLl5dI1JrLSr6faDTOaiVzopD4OtNQLBGnSz4UROo1S0ht48=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669210562;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=jmmp9+L79IRqXmKJpYo/LsiNpc9jXUTGtxlroOFT0zw=;
	b=G7ZbHoy8kztiB9tz7MtYY2f/s1u7EwcanqDgruvmpxoBvDBg3ZhgWy4pkK8sa5Fx
	oLco6zARtcqHOH8sv2NG4yXD3ine9ELucLsTBAt/fV9WLvGig9T0n1Hyldc2bMaaoog
	4uvoaSN+u/GPhnXGOEFnNW55R9ktzXRgCAvAZ0ZM=
Received: from edelgard.fodlan.icenowy.me (112.94.103.239 [112.94.103.239]) by mx.zohomail.com
	with SMTPS id 1669210561991307.3321068682709; Wed, 23 Nov 2022 05:36:01 -0800 (PST)
Message-ID: <463d5effd271c002fb18fb3b8326321501c18782.camel@icenowy.me>
Subject: Re: [PATCH] irqchip/sifive-plic: drop quirk for two-cell variant
From: Icenowy Zheng <uwu@icenowy.me>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt
 <palmer@dabbelt.com>,  Paul Walmsley <paul.walmsley@sifive.com>, Samuel
 Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Wed, 23 Nov 2022 21:35:58 +0800
In-Reply-To: <86h6ypol03.wl-maz@kernel.org>
References: <20221121042026.419383-1-uwu@icenowy.me>
	 <86o7syoq4t.wl-maz@kernel.org>
	 <16d01eebc1693916fc74e1e75458d6c0f080cf37.camel@icenowy.me>
	 <86ilj5oltb.wl-maz@kernel.org>
	 <402eb920c5ca84e7d751ec7bd9b7f4f512a66921.camel@icenowy.me>
	 <86h6ypol03.wl-maz@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_053609_734978_A6A81B5F 
X-CRM114-Status: GOOD (  39.21  )
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

5ZyoIDIwMjItMTEtMjPmmJ/mnJ/kuInnmoQgMTM6MzEgKzAwMDDvvIxNYXJjIFp5bmdpZXLlhpnp
gZPvvJoKPiBPbiBXZWQsIDIzIE5vdiAyMDIyIDEzOjE2OjAxICswMDAwLAo+IEljZW5vd3kgWmhl
bmcgPHV3dUBpY2Vub3d5Lm1lPiB3cm90ZToKPiA+IAo+ID4g5ZyoIDIwMjItMTEtMjPmmJ/mnJ/k
uInnmoQgMTM6MTMgKzAwMDDvvIxNYXJjIFp5bmdpZXLlhpnpgZPvvJoKPiA+ID4gT24gV2VkLCAy
MyBOb3YgMjAyMiAxMjozODo1NiArMDAwMCwKPiA+ID4gSWNlbm93eSBaaGVuZyA8dXd1QGljZW5v
d3kubWU+IHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+IOWcqCAyMDIyLTExLTIy5pif5pyf5LqM55qE
IDE3OjI4ICswMDAw77yMTWFyYyBaeW5naWVy5YaZ6YGT77yaCj4gPiA+ID4gPiBPbiBNb24sIDIx
IE5vdiAyMDIyIDA0OjIwOjI2ICswMDAwLAo+ID4gPiA+ID4gSWNlbm93eSBaaGVuZyA8dXd1QGlj
ZW5vd3kubWU+IHdyb3RlOgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gQXMgdGhlIHNwZWNpYWwg
aGFuZGxpbmcgb2YgZWRnZS10cmlnZ2VyZWQgaW50ZXJydXB0cyBhcmUKPiA+ID4gPiA+ID4gZGVm
aW5lZCBpbgo+ID4gPiA+ID4gPiB0aGUKPiA+ID4gPiA+ID4gUExJQyBzcGVjLCB3ZSBjYW4gYXNz
dW1lIGl0J3Mgbm90IGEgcXVpcmssIGJ1dCBhIGZlYXR1cmUgb2YKPiA+ID4gPiA+ID4gdGhlCj4g
PiA+ID4gPiA+IFBMSUMKPiA+ID4gPiA+ID4gc3BlYzsgdGh1cyBtYWtpbmcgaXQgYSBxdWlyayBh
bmQgdXNlIHF1aXJrLWJhc2VkIGNvZGVwYXRoCj4gPiA+ID4gPiA+IGlzCj4gPiA+ID4gPiA+IG5v
dCBzbwo+ID4gPiA+ID4gPiBuZWNlc3NhcnkuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEl0ICppcyog
bmVjZXNzYXJ5Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBNb3ZlIHRvIGEg
I2ludGVycnVwdC1jZWxscy1iYXNlZCBwcmFjdGljZSB3aGljaCB3aWxsIGFsbG93Cj4gPiA+ID4g
PiA+IGJvdGgKPiA+ID4gPiA+ID4gZGV2aWNlCj4gPiA+ID4gPiA+IHRyZWVzIHdpdGhvdXQgaW50
ZXJydXB0IGZsYWdzIGFuZCB3aXRoIGludGVycnVwdCBmbGFncyB3b3JrCj4gPiA+ID4gPiA+IGZv
cgo+ID4gPiA+ID4gPiBhbGwKPiA+ID4gPiA+ID4gY29tcGF0aWJsZSBzdHJpbmdzLgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBOby4gWW91J3JlIHR5aW5nIHRvZ2V0aGVyIHR3byB1bnJlbGF0ZWQgY29u
Y2VwdHM6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IC0gRWRnZXMgZ2V0IGRyb3BwZWQgaW4gc29tZSBp
bXBsZW1lbnRhdGlvbnMgKGFuZCBvbmx5IHNvbWUpLgo+ID4gPiA+ID4gWW91Cj4gPiA+ID4gPiBj
YW4KPiA+ID4gPiA+IMKgIGFyZ3VlIHRoYXQgdGhlIGFyY2hpdGVjdHVyZSBhbGxvd3MgaXQsIGJ1
dCBJIHNlZSBpdCBpcyBhbgo+ID4gPiA+ID4gwqAgaW1wbGVtZW50YXRpb24gYnVnLgo+ID4gPiA+
IAo+ID4gPiA+IEFzIHRoZSBzcGVjaWZpY2F0aW9uIGFsbG93cyBpdCwgaXQncyBub3QgYW4gaW1w
bGVtZW50YXRpb24gYnVnCj4gPiA+ID4gLS0KPiA+ID4gPiBhbmQKPiA+ID4gPiBmb3IgdGhvc2Ug
d2hpY2ggZG8gbm90IHNob3cgdGhpcyBwcm9ibGVtLCBpdCdzIHBvc3NpYmxlIHRoYXQKPiA+ID4g
PiBpdCdzCj4gPiA+ID4ganVzdAo+ID4gPiA+IGFsbCB1c2luZyB0aGUgc2FtZSB0cmlnZ2VyIHR5
cGUgKGUuZy4gUm9ja2V0KS4KPiA+ID4gCj4gPiA+IFdoYXQgYXJlIHlvdSBhZ2FpbnN0PyBUaGUg
ZmFjdCB0aGF0IHRoaXMgaXMgZmxhZ2dlZCBhcyBhIHF1aXJrPwo+ID4gPiBIb25lc3RseSwgSSBk
b24ndCBjYXJlIGFib3V0IHRoYXQuIElmIHdlIGNhbiBmb2xkIGFsbAo+ID4gPiBpbXBsZW1lbnRh
dGlvbnMKPiA+ID4gaW50byB0aGUgc2FtZSBzY2hlbWUsIHRoYXQncyBmaW5lIGJ5IG1lLgo+ID4g
Cj4gPiBUaGVuIHdoYXQgc2hvdWxkIEkgZG8/Cj4gCj4gTWFrZSBhbGwgZWRnZS10cmlnZ2VyZWQg
aW50ZXJydXB0cyB1c2UgdGhlIGVkZ2UgZmxvdy4KPiAKPiA+IAo+ID4gPiAKPiA+ID4gPiAKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gLSBUaGUgbmVlZCBmb3IgZXhwcmVzc2luZyBhZGRpdGlvbmFsIGlu
Zm9ybWF0aW9uIGluIHRoZQo+ID4gPiA+ID4gaW50ZXJydXB0Cj4gPiA+ID4gPiDCoCBzcGVjaWZp
ZXIgaXMgbm90IG5lY2Vzc2FyaWx5IHJlbGF0ZWQgdG8gdGhlIGFib3ZlLiBPdGhlcgo+ID4gPiA+
ID4gaW50ZXJydXB0Cj4gPiA+ID4gPiDCoCBjb250cm9sbGVycyB1c2UgZXh0cmEgY2VsbHMgdG8g
ZW5jb2RlIHRoZSBpbnRlcnJ1cHQKPiA+ID4gPiA+IGFmZmluaXR5LAo+ID4gPiA+ID4gZm9yCj4g
PiA+ID4gPiDCoCBleGFtcGxlLgo+ID4gPiA+IAo+ID4gPiA+IEkgdGhpbmsgaW4gdGhlc2Ugc2l0
dWF0aW9ucywgaWYgdGhlIGludGVycnVwdCBjb250cm9sbGVyIGRvZXMKPiA+ID4gPiBub3QKPiA+
ID4gPiBjb250YWluIGFueSBzcGVjaWFsIGhhbmRsaW5nIGZvciBlZGdlIGludGVycnVwdHMsIHdl
IGNhbiBqdXN0Cj4gPiA+ID4gZGVzY3JpYmUKPiA+ID4gPiB0aGVtIGFzIGxldmVsIG9uZXMgaW4g
U1cuCj4gPiA+IAo+ID4gPiBObywgdGhhdCdzIHV0dGVybHkgd3JvbmcuIFdlIGRvbid0IGRlc2Ny
aWJlIGFuIGVkZ2UgYXMgbGV2ZWwuCj4gPiA+IEV2ZXIuCj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBJIHdhbnQgdGhlc2UgdHdvIHRoaW5ncyB0byBiZSBrZXB0IHNlcGFyYXRl
LiBPdGhlcndpc2UsIG9uY2UKPiA+ID4gPiA+IHdlCj4gPiA+ID4gPiBnZXQKPiA+ID4gPiA+IHNv
bWUgZmFuY3kgQUNQSSBzdXBwb3J0IGZvciBSSVNDViAobm8sIHBsZWFzZS4uLiksIHdlJ2xsIGhh
dmUKPiA+ID4gPiA+IHRvCj4gPiA+ID4gPiByZWRvCj4gPiA+ID4gPiB0aGUgd2hvbGUgdGhpbmcu
Li4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJbiBhZGRpdGlvbiwgdGhpcyBhZGRyZXNzZXMgYSBz
dGFibGUgdmVyc2lvbiBEVCBiaW5kaW5nCj4gPiA+ID4gPiA+IHZpb2xhdGlvbiAtCj4gPiA+ID4g
PiA+IC0KPiA+ID4gPiA+ID4gTGludXggdjUuMTkgY29tZXMgd2l0aCAidGhlYWQsYzkwMC1wbGlj
IiB3aXRoICNpbnRlcnJ1cHQtCj4gPiA+ID4gPiA+IGNlbGxzCj4gPiA+ID4gPiA+IGRlZmluZWQg
dG8KPiA+ID4gPiA+ID4gYmUgMSBpbnN0ZWFkIG9mIDIsIHRoaXMgY29tbWl0IHdpbGwgYWxsb3cg
RFRzIHRoYXQgY29tcGxpZXMKPiA+ID4gPiA+ID4gdG8KPiA+ID4gPiA+ID4gTGludXgKPiA+ID4g
PiA+ID4gdjUuMTkgYmluZGluZyB3b3JrIChhbHRob3VnaCBubyBzdWNoIERUIGlzIGRldmxpZXJl
ZCB0byB0aGUKPiA+ID4gPiA+ID4gcHVibGljCj4gPiA+ID4gPiA+IG5vdykuCj4gPiA+ID4gPiAK
PiA+ID4gPiA+ICpUaGF0KiBpcyB3aGF0IHNob3VsZCBnZXQgZml4ZWQuCj4gPiA+ID4gCj4gPiA+
ID4gU3VwcG9ydGluZyBhbGwgc3RhYmxlIHZlcnNpb25zJyBEVCBiaW5kaW5nIGlzIG91ciBwcm9t
aXNlLCBJCj4gPiA+ID4gdGhpbmsuCj4gPiA+IAo+ID4gPiBBYnNvbHV0ZWx5LiBBbmQgSSdtIGFz
a2luZyB5b3UgdG8gZml4IGl0LiBBbmQgb25seSB0aGF0Lgo+ID4gCj4gPiBUaGVuIHdoYXQgc2hv
dWxkIEkgZG8/IE1hc2sgdGhpcyBhcyBhbm90aGVyIHF1aXJrIHRoYXQgaXMgb25seQo+ID4gYXBw
bGljYWJsZSB0byBjOTAwLXBsaWM/Cj4gCj4gTm8uIE1ha2UgaW50ZXJydXB0cyB3aXRoIGEgc2lu
Z2xlIGNlbGwgdXNlIHRoZSBsZXZlbCBmbG93LgoKVGhpcyBzb3VuZHMgZXhhY3RseSBsaWtlIHdo
YXQgd2UgZG8gaW4gdGhpcyBwYXRjaCBub3cuCgpPciwgc2hvdWxkIHdlIGtlZXAgdGhlIHF1aXJr
LCBhbmQgcmVxdWlyZSBib3RoIGEgZmxhZyBjZWxsIGNvbnRhaW5pbmcKSVJRX1RZUEVfRURHRV9S
SVNJTkcgYW5kIGFuIGludGVycnVwdCBjb250cm9sbGVyIHRoYXQgbWF0Y2hlcyB0aGUgcXVpcmsK
dG8gdXNlIHRoZSBzcGVjaWFsIGNvZGVwYXRoIGZvciBlZGdlIGludGVycnVwdHM/Cgo+IAo+ID4g
U291bmRzIG1vcmUgY3JhenkuLi4KPiAKPiBUaGVyZSBpcyBvYnZpb3VzbHkgbm8gYWNjb3VudGlu
ZyBmb3IgdGFzdGUuCj4gCj4gwqDCoMKgwqDCoCBNLgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
