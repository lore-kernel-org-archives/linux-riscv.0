Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6A0C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 14:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSWybvsk7p6gM3yV690uRQAD7PxUFpR/s99dy7/WyJQ=; b=fWj95G389TEPt8
	8WsQk+8IiGkjvTX/G7b5UlYiSIjq+BhkG/LUQ0B/XVBIubjj19HA/MxciQWYM+w6SaZ4RQSjObJ/G
	2Neo4kIoWVYuQiK54gV2LOzh6A2jVBHNb9J+B4/jlbwaM/hqJsyRrO3rOnUsqAkxJL8GA/to+Km8U
	v3OSOcPT1gM04umiP5YQpkrvAR0tf8Vyeht4VXuVvybNo/wMAqmyoZl81LFyaJat7GenqNTvjC6r+
	lQtYNnfJ0Y2RMUzULC3YYk88A6LpMhQH66CBan7IygiSAEIBnogIVn7Y2y8A87ZbyycHidOYYWAqZ
	nX1nVdCnqvpmu1sQUriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3eRW-008TOH-Tr; Fri, 09 Dec 2022 14:33:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3eRU-008TNU-Sc
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 14:33:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 57EF8B827B8;
	Fri,  9 Dec 2022 14:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C33C433EF;
	Fri,  9 Dec 2022 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670596410;
	bh=OmpQt5h4hAOMOcqDvPvyAvn1ILZqldVCoPQsHl8/XYY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=lagSIzs8Xu1ybv2YTjFe8/psRuwPXXAFZrzZKhaO+XkGfybJxO+s37AtTPW60ibru
	 2G3b/8tmEcdjU0A8w+xgjbRm7XY5rUYT5TiUr4LaWeF+K4Gp6DD1fm+8fLAOxUjfBy
	 NEQHTjqhYOmEWj9y3aW/6MBj0RAPmi4q4KnAy0I/jzErFKaXMkj+RvTuzhgozm0KOc
	 Rzm7+Fa4s2G7uOfDnvmueAJhwVyRBiRPU616oArVxRYd5o5BEnzqRVtavNrnDzmnaW
	 kLcOPq4Xn+IENgqzMqIeEfxWnqPSssXmEuKBGuaZ9R5CV50yXldPnzk9RuhMdfRIbZ
	 VhsQ0WNOdCjBg==
Date: Fri, 09 Dec 2022 15:33:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>
CC: linux-riscv@lists.infradead.org, palmer@dabbelt.com, jeff@riscv.org
Subject: Re: [PATCH v9 1/3] riscv: mm: modify pte format for Svnapot
User-Agent: K-9 Mail for Android
In-Reply-To: <20221209074229.iexrvp5hkuq3qz2l@kamzik>
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn> <20221204141137.691790-2-panqinglin2020@iscas.ac.cn> <Y5Dfog2HYhejuDX8@spud> <ae8753cd-038c-ecaa-3a39-72cf1340d764@iscas.ac.cn> <28494e11-8f4d-7466-13d7-12e22f8f67fe@iscas.ac.cn> <20221209074229.iexrvp5hkuq3qz2l@kamzik>
Message-ID: <CD44ACE9-43EC-4865-8604-1C7876D5EEAE@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_063337_107417_DBAE0EF6 
X-CRM114-Status: GOOD (  21.39  )
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

CgpPbiA5IERlY2VtYmVyIDIwMjIgMDg6NDI6MjkgR01UKzAxOjAwLCBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPk9uIEZyaSwgRGVjIDA5LCAyMDIyIGF0IDAx
OjM0OjQyQU0gKzA4MDAsIFFpbmdsaW4gUGFuIHdyb3RlOgo+Li4uCj4+ID4gPiA+ICsjaWZkZWYg
Q09ORklHX1JJU0NWX0lTQV9TVk5BUE9UCj4+ID4gPiA+ICsjZGVmaW5lIEhVR0VfTUFYX0hTVEFU
RcKgwqDCoMKgwqDCoMKgICgyICsgKE5BUE9UX09SREVSX01BWCAtCj4+ID4gPiA+IE5BUE9UX0NP
TlRfT1JERVJfQkFTRSkpCj4+ID4gPiA+ICsjZWxzZQo+PiA+ID4gPiArI2RlZmluZSBIVUdFX01B
WF9IU1RBVEXCoMKgwqDCoMKgwqDCoCAyCj4+ID4gPiA+ICsjZW5kaWYKPj4gPiA+IAo+PiA+ID4g
VGhpcyBpcyBjb21pbmcgZnJvbSBhIHBsYWNlIG9mICpjb21wbGV0ZSogaWdub3JhbmNlOgo+PiA+
ID4gSWYgQ09ORklHX1JJU0NWX0lTQV9TVk5BUE9UIGlzIGVuYWJsZWQgaW4gdGhlIGtlcm5lbCBi
dXQgdGhlcmUgaXMgbm8KPj4gPiA+IHN1cHBvcnQgZm9yIGl0IG9uIGEgcGxhdGZvcm0gaXMgaXQg
b2theSB0byBjaGFuZ2UgdGhlIHZhbHVlIG9mCj4+ID4gPiBIVUdFX01BWF9IU1RBVEU/IEFwb2xv
Z2llcyBpZiBJJ3ZlIG1pc3NlZCBzb21ldGhpbmcgb2J2aW91cy4KPj4gPiAKPj4gPiA6KAo+PiA+
IFlvdSBhcmUgcmlnaHQuIElmIENPTkZJR19SSVNDVl9JU0FfU1ZOQVBPVCBpcyBlbmFibGVkLCBI
VUdFX01BWF9IU1RBVEUKPj4gPiB3aWxsIGFsd2F5cyBiZSAzIHdoZXRoZXIgaGFzX3N2bmFwb3Qo
KSBpcyB0cnVlIG9yIGZhbHNlLiBJIHdpbGwgdHJ5IHRvCj4+ID4gZml4IHRoaXMuCj4+IAo+PiBJ
IGFtIHJlYWxseSBleHBlY3RpbmcgdGhhdCBIVUdFX01BWF9IU1RBVEUgY2FuIGNoYW5nZSBhY2Nv
cmRpbmcgdG8gdGhlCj4+IHBsYXRmb3JtIHNpdHVhdGlvbiB3aGVuIENPTkZJR19SSVNDVl9JU0Ff
U1ZOQVBPVCBpcyBlbmFibGVkLiBCdXQgaXQKPj4gc2VlbXMgaW1wb3NzaWJsZSB0byBhY2hpdmUg
dGhpcyB3aXRoIGEgbWlub3IgcGF0Y2guIEJlY2F1c2UgdGhpcyB2YWx1ZQo+PiBpcyB1c2VkIGFz
IHNvbWUgc3RhdGljIGFsbG9jYXRlZCBhcnJheXMnIGxlbmd0aCAoZm9yIGV4YW1wbGUsIGhzdGF0
ZXMgaW4KPj4gbW0vaHVnZXRsYi5jOjUyKSBpbiBhcmNoLWluZGVwZW5kZW50IGNvZGUgOigKPj4g
Cj4+IFRoaXMgaW1tdXR1cmUgSFVHRV9NQVhfSFNUQVRFIHZhbHVlIHdpbGwgY2F1c2Ugbm8gZnVu
Y3Rpb25hbCBlcnJvciBidXQKPj4gaXQgcmVhbGx5IG1ha2VzIHNvbWUgb2JqZWN0cyB1c2VkIG9u
bHkgcGFydGlhbGx5IHdoZW4KPj4gQ09ORklHX1JJU0NWX0lTQV9TVk5BUE9UIGlzIGVuYWJsZWQg
YnV0IHRoZSBwbGF0Zm9ybSBoYXMgbm8gc3ZuYXBvdAo+PiBzdXBwb3J0IDooIEkgYW0gbm90IHN1
cmUgd2hldGhlciB0aGlzIHBhdGNoIGNhbiBiZSBhY2NlcHRlZCB3aXRoIHRoaXMKPj4gZmVhdHVy
ZT8gT3IgYW55IG90aGVyIGhlbHBmdWwgaWRlYSB0byBmaXggdGhpcyBwcm9ibGVtPwo+PiAKPj4g
UGxlYXNlIGxldCBtZSBrbm93IGlmIEkgaWdub3JlIGFueSBpbmZvcm1hdGlvbiBhYm91dCBpdC4K
Pgo+SSBhZ3JlZSB0aGF0IHRoZSBvbmx5IHByb2JsZW0gYXBwZWFycyB0byBhIHdhc3RlIG9mIG1l
bW9yeSwgcGFydGljdWxhcmx5CgpDYXZlYXQgYWJvdXQgaWdub3JhbmNlIHN0aWxsIGFwcGxpZXMs
IGhvdyBtdWNoIG9mIGEgd2FzdGUgb2YgbWVtb3J5IGFyZSB3ZSB0YWxraW5nPwoKPmlmIGNncm91
cHMgYXJlIGVuYWJsZWQuIEkgZG9uJ3Qgc2VlIGFueSBlYXN5IHNvbHV0aW9uIGVpdGhlci4gTWF5
YmUgYQo+d2FybmluZyBpbiB0aGUgS2NvbmZpZyB0ZXh0IHdvdWxkIGJlIHN1ZmZpY2llbnQ/CgpJ
IHRoaW5rIHRoYXQgZW50aXJlbHkgZGVwZW5kcyBvbiBob3cgd2FzdGVmdWwgaXQgaXMuCklmIGl0
J3MgbWlub3IsIHN1cmU/CgpUaGFua3MsCkNvbm9yLgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
