Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69BCC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hbbww9JZ4vf6fq/zBeHSajJdJ46jf77kBAaPiQJiZEM=; b=h0rjOL1RQAhCUJ
	ueNRYLspMnLuVWJmZgfJ0xyKtjs77Qe/HK0/iRM07gX9qN9i1kBcoQNvkAvk2H4Be65Fk63yCrFme
	HWtQNQN8e2HJL+/jJWLdiCn+Aghx/40jNiLzu1EzxTRNtDTwaGCMm7ap0OQrX0LusR1AdRxvLCQ0Q
	QmGJ8ZNw7VNxhxl2TN7t6dQvRrY4AAVK4vn2E1Tg6gT/THTe4vOT7oQykC0q6uRTr97YPmkqNPdFu
	phtvn5gbrxT4Y4rLwRgj1mp7MiRKtvn40a1bFM+r6apFBtMlEqNGXbdJu3KWcBJisi469Us9D/W0U
	0WOyOz30pUEeLsXKF5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouFHw-00C7yh-Rw; Sun, 13 Nov 2022 15:52:52 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouFHt-00C7wI-Fw
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 15:52:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1668354758; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gHOJwP6zpewX5QvCaBFfraBePoe+k7neGcm3lef2/KK4x5uraJD5VXML3+k6c/wKONgvRO1TWH63cSQQHY4fO/rsxUlotRSFy7wr4kv56owldZyQB12wwKTQI73Tz+cnOH977nKoRajBhBrkAQDc/1PKe180X1cICYJQvWpYdys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1668354758; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=YkDk6M25XeDPr4xNswMMCbsPLXGMgbObjH2sDwUGYhU=; 
	b=LXlKdK8h2RBrc/zKOWWCg0XitXpi+Rz2uoDP7lr2yvJOlOsm3K9KNYaxlnWclyQ6zTJpZObl8HGEHItw501kFxvZuNVhriW4xyJEYNN7vbgf5oiJHSBODBefWzkfg86lKP/WtED4ggS3m/H6zaLT3D45Iu6LNA43ZhMxbIt2jDw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1668354758;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=YkDk6M25XeDPr4xNswMMCbsPLXGMgbObjH2sDwUGYhU=;
	b=glC0obqpRiP0qU8q2MDvgfAOXvuKhaTPCqymJu4esV+DzUoGUGChPPL6O5+u83rT
	3HWEc7t4cJt/Aym99jSXhmEaY0Fnhjl171hFfrlK7Lktl9K1SCdj1WLWGi7z9/V7P+d
	oMljvGh1TyF7nfPpbg9u84GAamMoKpySq+60UYvI=
Received: from edelgard.fodlan.icenowy.me (112.94.100.40 [112.94.100.40]) by mx.zohomail.com
	with SMTPS id 1668354757017164.46539775376436; Sun, 13 Nov 2022 07:52:37 -0800 (PST)
Message-ID: <d52afd275eaa8db2ec1fb56e9ab52c28392e2bb1.camel@icenowy.me>
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>,  Arnd Bergmann <arnd@arndb.de>, Conor Dooley
 <conor@kernel.org>, kernel@esmil.dk
Cc: masahiroy@kernel.org, mkl@pengutronix.de, davem@davemloft.net, 
	linux-riscv@lists.infradead.org, soc@kernel.org
Date: Sun, 13 Nov 2022 23:52:32 +0800
In-Reply-To: <882e75f9-dc96-4084-a64b-ace4246c88ff@kernel.org>
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
	 <882e75f9-dc96-4084-a64b-ace4246c88ff@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_075249_623783_352D888B 
X-CRM114-Status: GOOD (  31.44  )
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

5ZyoIDIwMjItMTEtMDfmmJ/mnJ/kuIDnmoQgMTg6NTEgKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMDcvMTEvMjAyMiAxNzo0NiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6
Cj4gPiBUaGlzIGhhcyBjb21lIHVwIGEgYnVuY2ggb2YgdGltZXMsIGJ1dCBJIGRvbid0IHRoaW5r
IHdlJ3ZlIGV2ZXIKPiA+IHJlYWxseQo+ID4gbWFkZSBhIGRlY2lzaW9uLsKgIEhpc3RvcmljYWxs
eSB0aGF0J3Mgbm90IGJlZW4gc3VjaCBhIGJpZyBkZWFsCj4gPiBiZWNhdXNlCj4gPiB0aGUgUklT
Qy1WIGRldmljZSB0cmVlcyB3ZXJlIHByZXR0eSBpbmFjdGl2ZSwgYnV0IHRoYXQncyBjaGFuZ2Vk
IC0tCj4gPiBib3RoCj4gPiBiZWNhdXNlIENvbm9yIGhhcyBiZWVuIGNsZWFuaW5nIGV2ZXJ5dGhp
bmcgdXAsIGFuZCBhbHNvIGJlY2F1c2UKPiA+IHRoZXJlJ3MKPiA+IGEgYnVuY2ggb2YgU09DcyBz
aG93aW5nIHVwIHdpdGggUklTQy1WIGNvcmVzIGluIHRoZW0uwqAgV2UgdGFsa2VkCj4gPiBhYm91
dAo+ID4gdGhpcyBhZ2FpbiBhdCBwbHVtYmVycyBhIGZldyB0aW1lcywgYnV0IEFybmQgd2Fzbid0
IGFyb3VuZCBpdAo+ID4gcGVyc29uIHNvCj4gPiBJIGZpZ3VyZWQgaXQncyBiZXN0IHRvIGp1c3Qg
c3RhcnQgYW4gZW1haWwgdGhyZWFkIGFuZCBzZWUgaG93Cj4gPiBwZW9wbGUKPiA+IGZlZWwuCj4g
PiAKPiA+IEEgbG90IG9mIHRoZXNlIG5ldyBTT0NzIGFyZSBiYXNlZCBvbiBBcm0gZGVzaWducyBh
bmQgdGhlIGRldmljZQo+ID4gdHJlZXMKPiA+IHZlcnkgbXVjaCByZWZsZWN0IHRoYXQsIHNvIGl0
IG1ha2VzIHNlbnNlIHRvIG1lIHRvIGp1c3Qga2VlcCB0aGUKPiA+IGRldmljZQo+ID4gdHJlZSBt
ZXJnZXMgdmlhIGFzIHNpbWlsYXIgYSBwYXRoIGFzIHBvc3NpYmxlLsKgIAo+IAo+IFJlY2VudCBS
ZW5lc2FzIHI5YTA3ZzA0MyAoc2hhcmluZyBiZXR3ZWVuIGFybTY0IGFuZCByaXNjdikgaXMgZXhh
bXBsZQo+IG9mCj4gdGhhdC4gSWYgY2hhbmdlcyB0byB0aGVtIHN0YXJ0IGNvbWluZyB2aWEgZGlm
ZmVyZW50IHRyZWVzLCB3ZSBtaWdodAo+IGhhdmUKPiBhIGxvdCBvZiBjb25mbGljdHMuCj4gCj4g
PiBJSVVDIHRoYXQgaGFwcGVucyB2aWEKPiA+IHRoZSBTT0MgdHJlZSB0aGVzZSBkYXlzLCBzbyBp
dCBtYWtlcyBzZW5zZSB0byBtZSB0aGF0IHdlIHN0YXJ0Cj4gPiBoYW5kbGluZwo+ID4gdGhlIFJJ
U0MtViBkZXZpY2UgdHJlZXMgdGhhdCB3YXkgYXMgd2VsbC7CoCBUaGF0IHdvdWxkIG1ha2UgdGhp
bmdzCj4gPiBlYXNpZXIKPiA+IGZvciBjb250cmlidXRvcnMsIGFzIHRoZXknbGwgaGF2ZSBvbmUg
d29ya2Zsb3cgZm9yIGFsbCB0aGVpciBTT0NzLAo+ID4gYnV0Cj4gPiBhbHNvIGVhc2llciBmb3Ig
bWUgYXMgYSBsb3Qgb2YgdGhpcyBTT0Mgc3R1ZmYgdG91Y2hlcyBiaXRzIEkgcmVhbGx5Cj4gPiBk
b24ndCB1bmRlcnN0YW5kIGFuZCB0aHVzIGdldCBraW5kIG9mIGxvc3QgdHJ5aW5nIHRvIHJldmll
dy4KPiA+IAo+ID4gQXJuZDogbG9va3MgbGlrZSB5b3UncmUgaGFuZGxpbmcgbW9zdCBvZiB0aGUg
bWVyZ2VzIHRoZXNlIGRheXMgc28KPiA+IHRoaXMKPiA+IHdvdWxkIGJlIGluY3JlYXNpbmcgeW91
ciB3b3JrbG9hZC7CoCBJIGZlZWwga2luZCBvZiBiYWQganVzdCBkdW1waW5nCj4gPiBhCj4gPiBi
dW5jaCBvZiBzdHVmZiBvbiB5b3UsIGJ1dCBJIHRoaW5rIGF0IGxlYXN0IG5vdyB0aGUgUklTQy1W
IERUUyBhcmUKPiA+IGluCj4gPiByZWFzb25hYmxlIHNoYXBlIHNvIGhvcGVmdWxseSBpdCdzIG5v
dCB0aGF0IGJhZC7CoCBJdCdkIGNlcnRhaW5seQo+ID4gaGVscAo+ID4gdGhpbmdzIG9uIG15IGVu
ZCwgYW5kIEknbSBoYXBweSB0byB0cnkgYW5kIHJlLWRpcmVjdCBzb21lIG9mIHRoYXQKPiA+IHNh
dmVkCj4gPiB0aW1lIHRvIGhlbHBpbmcgb3V0IGluIFNPQyBsYW5kIGJ1dCBJJ20gbm90IHN1cmUg
aG93IHdlbGwgdGhhdCdkCj4gPiB3b3JrCj4gPiBvdXQgaW4gcHJhY3RpY2UgYXMgSSdtIHByZXR0
eSBidXJpZWQuCj4gPiAKPiA+IE9uIGEgc29tZXdoYXQgcmVsYXRlZCBub3RlLCBDb25vciBoYXMg
b2ZmZXJlZCB0byBwaWNrIHVwIHRoZQo+ID4gb3RoZXJ3aXNlCj4gPiB1bm1haW50YWluZWQgUklT
Qy1WIFNPQ3MuwqAgVGhhdCdzIHNvcnQgb2YgaXRzIG93biBkaXNjdXNzaW9uLCBidXQKPiA+IGlm
IHdlCj4gPiBjaGFuZ2Ugb3ZlciB0byB0aGUgU09DIHRyZWUgd2UgbWlnaHQgYXMgd2VsbCBqdXN0
IGRvIGV2ZXJ5dGhpbmcgYXQKPiA+IHRoZQo+ID4gc2FtZSB0aW1lLgo+ID4gCj4gCj4gT24gdGhl
IG90aGVyIGhhbmQgTUlQUyBEVFMgaXMgbm90IGNvbWluZyB2aWEgU29DIHRyZWUsIHNvIHRoZXJl
IGlzIG5vCj4geWV0IHN1Y2ggd2lkZSBhcHByb2FjaC4KCkZld2VyIFNvQyB2ZW5kb3JzIHNoYXJl
IHRoZSBtb3N0IG9mIHRoZWlyIFNvQyBkZXNpZ25zIGJldHdlZW4gQVJNIGFuZApSSVNDLVYgb25l
cy4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+IAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
