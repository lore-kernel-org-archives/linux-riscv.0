Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E78C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqLI3S1NA2P3UdvQnLUgA8u/4PALcvvSN8ptA9GASM8=; b=y48ygHwN5T30WS
	Hd1MdCnZFgNxlmOo9Ga2vgVc5VsU322g7N3FWoJ9PEXQemI5wzL2CXSrxJ8fYRwaxtJ5jWUr39ikm
	r97rg0YXNs0ZTI5ToDABv583IsLQFUCvQDGE6lGMgp1HDRw9i0uaoByzXpV6O4MCBb+KFR5HRAhg+
	nfHanexFWb8FvSdnJvYbOm7Ds4oYdWOXGWfSqHjMJVsP5prK8BB0SMTHdgd3thulVtjfcdoOwT6t8
	+9h7supLF6vgOfjzzhDAKHopj+1QVbwbdTHgM0vGIXH5RVLX1LOaaZf4FyNHm8VY+SfP3AYlu+fuz
	9loVOFKXz5bjQI353Faw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc4Do-00000008YEF-3RQ4;
	Thu, 08 Aug 2024 14:34:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc4Dj-00000008YAv-1p0H
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 14:34:30 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1723127664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=56JIhtAX+5tOSqzvAGOcw58QIyjuchVrNY7VzC2OwUU=;
	b=OAEjrfh5LabLUYOHhJ2S67zWlr9ttNgdeoLVLiFenlhcLvgNZyMuryw76CijFPbsmhffyv
	NHAEnSaW/P0o3JpUR+TzJTTLrLt6nUIyX03lFTtJcRkc5S0B1WN4htJo72ZS0GHbKBTJzI
	k9bE82poRhKhz19gbeJNN4aZTH8AFD8ArUz24FfxL0Krvy+WxQhYW5aclTwjssauSc/w0Y
	JPq1JgqbK/If813g5nIBIXQxjGQ4Gqbtbj6OG7YN73XC9Q9dZzWYnWCyhtuDqzbkfmvLJW
	461mUo8rXrjX3adnVI5hKaOf7Gko3vAlSurdOaNDaaYmcyQU9zhbYZqEFOvu3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1723127664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=56JIhtAX+5tOSqzvAGOcw58QIyjuchVrNY7VzC2OwUU=;
	b=6K0SroPcULZwFmvxD9M+p6+xaa98sN6d20R2AmtFksXTKVfmEUmwP1L4BN3vntSbLbFfch
	HtXG1bIMnM41rGAw==
To: Anup Patel <anup@brainfault.org>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 greentime.hu@sifive.com, vincent.chen@sifive.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 1/1] riscv-aplic: manually set pending for the
 pre-existing interrupts
In-Reply-To: <CAAhSdy3VKMngwHxOg5+z6pK3QgZnLv=3+hpZBeUm87L_e62aUQ@mail.gmail.com>
References: <20240808081412.24553-1-yongxuan.wang@sifive.com>
 <CAAhSdy3VKMngwHxOg5+z6pK3QgZnLv=3+hpZBeUm87L_e62aUQ@mail.gmail.com>
Date: Thu, 08 Aug 2024 16:34:24 +0200
Message-ID: <87ikwbytfz.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_073427_636850_A646E250 
X-CRM114-Status: GOOD (  17.27  )
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

T24gVGh1LCBBdWcgMDggMjAyNCBhdCAxODo1NiwgQW51cCBQYXRlbCB3cm90ZToKPiBNb3JlIGFw
cHJvcHJpYXRlIHBhdGNoIHN1YmplY3Qgc2hvdWxkIGJlOgo+Cj4gaXJxY2hpcDogcmlzY3YtYXBs
aWM6IHJldHJpZ2dlciBpbnRlcnJ1cHQgaW4gTVNJIG1vZGUgdXBvbiB3cml0ZSB0bwo+IHNvdXJj
ZWNmZyByZWdpc3RlcgoKQW5kIHRoZSBjb3JyZWN0IG9uZSB3b3VsZCBiZToKCiAgICBpcnFjaGlw
L3Jpc2N2LWFwbGljOiBSZXRyaWdnZXIgTVNJIGludGVycnVwdCBvbiBzb3VyY2UgY29uZmlndXJh
dGlvbgoKMSkgVGhlIHByZWZpeCBpcyBjb3JyZWN0CgoyKSBTZW50ZW5jZSBzdGFydHMgd2l0aCBh
IHVwcGVyY2FzZSBsZXR0ZXIKCjMpIEl0IHVzZXMgdW5kZXJzdGFuZGFibGUgd29yZHMuIHNvdXJj
ZWNmZyBpcyBhIGltcGxlbWVudGF0aW9uIGRldGFpbAogICB3aGljaCBpcyBpcnJlbGV2YW50IGZv
ciB0aGUgaGlnaCBsZXZlbCBvdmVydmlldyBvZiBhIGNoYW5nZWxvZwogICBzdWJqZWN0LCB3aGlj
aCBpcyB2aXNpYmxlIGluIHRoZSBzaG9ydCBsb2cuCgo+IE9uIFRodSwgQXVnIDgsIDIwMjQgYXQg
MTo0NOKAr1BNIFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+IHdyb3Rl
Ogo+Pgo+PiBUaGUgc2VjdGlvbiA0LjUuMiBvZiB0aGUgUklTQy1WIEFJQSBzcGVjaWZpY2F0aW9u
IHNheXMgdGhhdCBhbnkgd3JpdGUKPj4gdG8gYSBzb3VyY2VjZmcgcmVnaXN0ZXIgb2YgYW4gQVBM
SUMgbWlnaHQgKG9yIG1pZ2h0IG5vdCkgY2F1c2UgdGhlCj4+IGNvcnJlc3BvbmRpbmcgaW50ZXJy
dXB0LXBlbmRpbmcgYml0IHRvIGJlIHNldCB0byBvbmUgaWYgdGhlIHJlY3RpZmllZAo+PiBpbnB1
dCB2YWx1ZSBpcyBoaWdoICg9IDEpIHVuZGVyIHRoZSBuZXcgc291cmNlIG1vZGUuCj4KPiBBZGQg
cXVvdGVzIGFyb3VuZCB0aGUgdGV4dCBmcm9tIFJJU0MtViBBSUEgc3BlY2lmaWNhdGlvbi4KPgo+
Pgo+PiBJZiBhbiBpbnRlcnJ1cHQgaXMgYXNzZXJ0ZWQgYmVmb3JlIHRoZSBkcml2ZXIgY29uZmln
cyBpdHMgaW50ZXJydXB0Cj4+IHR5cGUgdG8gQVBMSUMsIGl0J3MgcGVuZGluZyBiaXQgd2lsbCBu
b3QgYmUgc2V0IGV4Y2VwdCBhIHJlbGV2YW50Cj4+IHdyaXRlIHRvIGEgc2V0aXAgb3Igc2V0aXBu
dW0gcmVnaXN0ZXIuIFdoZW4gd2Ugd3JpdGUgdGhlIGludGVycnVwdAo+PiB0eXBlIHRvIHNvdXJj
ZWNmZyByZWdpc3RlciwgaWYgdGhlIEFQTElDIGRldmljZSBkb2Vzbid0IGNoZWNrIGFuZAo+PiB1
cGRhdGUgdGhlIHBlbmRpbmcgYml0LCB0aGUgaW50ZXJydXB0IG1pZ2h0IG5ldmVyIGJlY29tZXMg
cGVuZGluZy4KPgo+IFRoZSBzZWNvbmQgc2VudGVuY2UgYWJvdmUgY2FuIGJlIHJlLXdyaXR0ZW4g
YXMgZm9sbG93czoKPgo+IFdoZW4gaW50ZXJydXB0IHR5cGUgaXMgY2hhbmdlZCBpbiBzb3VyY2Vj
ZmcgcmVnaXN0ZXIsIHRoZSBBUExJQwoKdGhlIGludGVycnVwdCB0eXBlIC4uLiBpbiB0aGUgc291
cmNlLi4uLgoKPiBkZXZpY2UgbWlnaHQgbm90IHNldCB0aGUgY29ycmVzcG9uZGluZyBwZW5kaW5n
IGJpdCwgdGhlIGludGVycnVwdAoKYml0ICwgc28gdGhlIC4uLgoKPiBtaWdodCBuZXZlciBiZWNv
bWUgcGVuZGluZy4KCj4KPiBEZWZpbmUgQVBMSUMgTVNJIG1vZGUgc3BlY2lmaWMgaXJxX3NldF90
eXBlKCkgbGlrZSBiZWxvdzoKPgo+IGludCBhcGxpY19tc2lfaXJxX3NldF90eXBlKHN0cnVjdCBp
cnFfZGF0YSAqZCwgdW5zaWduZWQgaW50IHR5cGUpCgpzdGF0aWMgOikKCj4gewo+ICAgICAgICBp
bnQgcmM7Cj4KPiAgICAgICAgcmMgPSBhcGxpY19pcnFfc2V0X3R5cGUoZCwgdHlwZSk7CgogICAg
ICAgICBpbnQgcmMgPSBhcGxpYy4uLgoKPiAgICAgICAgaWYgKHJjKQo+ICAgICAgICAgICAgICAg
cmV0dXJuIHJjOwo+Cj4gICAgICAgIC8qCj4gICAgICAgICAqIFVwZGF0aW5nIHNvdXJjZWNmZyBy
ZWdpc3RlciBmb3IgbGV2ZWwtdHJpZ2dlcmVkIGludGVycnVwdHMKPiAgICAgICAgICogcmVxdWly
ZXMgaW50ZXJydXB0IHJldHJpZ2dlcmluZyB3aGVuIEFQTElDIGluIE1TSSBtb2RlLgoKQVBMSUMg
aXMgaW4gLi4uLgoKPiAgICAgICAgICovCj4gICAgICAgIGFwbGljX21zaV9pcnFfcmV0cmlnZ2Vy
X2xldmVsKGQpOwoKVGhhbmtzLAoKICAgICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
