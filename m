Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BE8C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 23:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WEaR87g9JZBzc35I0itiS1q7/Aidpte8YIomXFmwD4=; b=iSu74U9Od9kdcs
	xuMEWPGLBr7bcqA/NXgnocrwQrs0bR09DUT2vAKW5fV079WVSxWO7xl7+UyC+ALn2pPX0iEPYEGgu
	PbsK0gIYZI4xINsu76iqsYXyCAnR83Tgij1qIlki+JY73u+ugEi0xEkTbY1miIYyazI+hDzkP9PKX
	PW/mLfvVToNncQ6LAhiFnMggYQMi+MEHE5iI/cTl82d7VUhNWy98pgPkVUXIWTqGIEwFCj+z8KC+H
	QAylfFU18ZFRmSPzMWmJkSI+wt3jAOvKLmH7ctzA8jMFX39eVJOBoOtU6+L39RHD/2gts7SXnZ48H
	SuBmZ0QgAP5QN8NCnogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxc4M-00DH03-1v;
	Fri, 12 May 2023 23:21:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxc4J-00DGyN-0c
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 23:21:00 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64395e2a715so10648690b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 16:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1683933655; x=1686525655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tsqv5yZtjzgGVCTC6zYg+so9N6LNpVChrepKDtNMD+k=;
        b=Be/MgCmasraQD7qoD4UIHi1tb//vBhOuvsHO5huZxvtbFTF4+pUU8RvGbnWpPPrCvB
         twtU/fQwoLGEq1KuBR1S9QhCUh1/lUdcE35FTMRfQLFjdH2zMq6C16l3WYIQAbMJ6HVl
         6FTmQgFhtxTW5bpC8ChukgjfJUPlzbUi27EKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683933655; x=1686525655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tsqv5yZtjzgGVCTC6zYg+so9N6LNpVChrepKDtNMD+k=;
        b=WtnS9oYhbpfg9U9KNemNhl8Pp0thIMdj1wAQlcWAw5LZlFlgntoy5zboDMHzD7NDyV
         a5XbzFchzEzUdj61nT57DVcW1Q3b7BvLuVqSnBfg1Ru4y2lDpycleGRmSTbYk3OL1ahp
         r6ioWRsjnWik4cNiBEpA7zCGty4/+wE8mSCfrGJnhAK7HBreZNgLeaEslciZ/lO2XwjP
         tBC+nxjoCp31aIYR/vAeN/hMv8NgTrZrMxv6vaqavmRMDzW2ORbTqQUKkjOf9+NKX6m5
         n97WSZn6crqbh7kpcTc4WJxCgH6uKvmrtjYqZ5Cme9KKAUx4IHO6okL5KfoHlf+FOntw
         BFIw==
X-Gm-Message-State: AC+VfDyDiBUp0BliCrWWyQumq5NO6QaYGcd7SRoPxgCw2euWsCt9CP5c
	xaoLzWjAbBJk7TxDMu4ZdamcfHRYsfk0OVsxBBgk
X-Google-Smtp-Source: ACHHUZ7frChYX75PX3AVx0D4QWZo6RtsOgDhRSqVIl2P/AqZEUWChap9VSPwm68Aansd9qCGDM+eWrKOrEReApbG0FU=
X-Received: by 2002:a05:6a20:7da1:b0:101:65a2:e06b with SMTP id
 v33-20020a056a207da100b0010165a2e06bmr18352683pzj.20.1683933654882; Fri, 12
 May 2023 16:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230511-occupancy-cleat-06e532e3ea11@spud> <mhng-495c690b-454c-408f-a4f2-287d7ce8a9ea@palmer-ri-x1c9a>
 <20230512-streak-camper-08a68afb5897@spud> <20230512-exhume-unfold-f104dd4c4cbf@spud>
In-Reply-To: <20230512-exhume-unfold-f104dd4c4cbf@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 12 May 2023 16:20:43 -0700
Message-ID: <CAOnJCULTwDkWdKhJRr2ATPcLfHbDN6_VK=kJhqE3WmmrAGAB7Q@mail.gmail.com>
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	cyy@cyyself.name, Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	ajones@ventanamicro.com, Krste Asanovic <krste@sifive.com>, 
	Andrew Waterman <andrew@sifive.com>, Greg Favor <gfavor@ventanamicro.com>, 
	Mark Himelstein <markhimelstein@riscv.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_162059_236790_A76A5614 
X-CRM114-Status: GOOD (  30.83  )
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

T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgMzowNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiArQ0MgR3JlZywgTWFyaywgS3JzdGUsIFBoaWxpcHAsIEFuZHJl
dywKPgo+ICh0aGlzIGlzIExLTUwgbm93LCBubyB0b3AgcG9zdGluZyBvciBodG1sIHJlcGxpZXMp
Cj4KPiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCAwODo0MDoxMFBNICswMTAwLCBDb25vciBEb29s
ZXkgd3JvdGU6Cj4gPiBPbiBGcmksIE1heSAxMiwgMjAyMyBhdCAxMTowMTowOUFNIC0wNzAwLCBQ
YWxtZXIgRGFiYmVsdCB3cm90ZToKPiA+ID4gT24gVGh1LCAxMSBNYXkgMjAyMyAxNTozODoxMCBQ
RFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgTWF5IDExLCAy
MDIzIGF0IDAzOjM0OjI0UE0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPiA+ID4gT24g
VGh1LCBNYXkgMTEsIDIwMjMgYXQgMjo0N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDAyOjI3OjQ0
UE0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYXQncyBt
b3JlIHRoYW4gbGFzdCB5ZWFyIGF0IHRoaXMgcG9pbnQsIGFuZCBub3RoaW5nIGhhcyBjaGFuZ2Vk
IGluIHRoZQo+ID4gPiA+ID4gPiBkb2N1bWVudGF0aW9uISBUYWxrJ3MgY2hlYXAsIGVoaD8KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBZdXAuIEkgd2lsbCBwb2tlIFJWSSBmb2xrcyB0
byBjaGVjayBpZiBpdCBzdGlsbCBpcyB0aGUgcGxhbiBvciBjaGFuZ2VkICEhCj4gPiA+ID4KPiA+
ID4gPiBTb3VuZHMgZ29vZCwgdGhhbmtzIQo+ID4KPiA+IFRoZXJlIGhhcyBiZWVuIHNvbWUgbW92
ZW1lbnQgb24gdGhhdCBmcm9udCwgc2hhbGwgc2VlIHdoZXJlIGl0IGdvZXMKPiA+IDp1cHNpZGVk
b3duX3NtaWxlOgo+Cj4gVGhlcmUncyBiZWVuIHNvbWUgb2ZmLWxpc3QgZGlzY3Vzc2lvbiBwcm9t
cHRlZCBieSBBdGlzaCB3aXRoIHNvbWUgb2YgdGhlCj4gUlZJIHNwZWMgZm9saywgZnJvbSB3aGlj
aCB0aGUgdXBzaG90IF9fYXBwZWFyc19fIHRvIGJlIGFuIHVuZGVyc3RhbmRpbmcKPiB0aGF0IHVz
aW5nIHZlcnNpb24gbnVtYmVyaW5nIHRvIGluZGljYXRlIHJlbW92YWwgb2YgSVNBIGZlYXR1cmVz
IGlzIGEgYmFkCj4gaWRlYS4KPiBJJ20gaG9waW5nIHRoYXQgdGhpcyByZXN1bHRzIGluIHRoZSBl
bnNocmluZW1lbnQgb2YgdGhpcyBpbiB0aGUgSVNBCj4gc3BlY3MsIHNvIHRoYXQgd2UgaGF2ZSBz
b21ldGhpbmcgY29uY3JldGUgdG8gcG9pbnQgdG8gYXMgdGhlIGJhc2lzIGZvcgo+IG5vdCBuZWVk
aW5nIHRvIGhhbmRsZSB2ZXJzaW9uIG51bWJlcmluZy4KPiBDZXJ0YWlubHkgdGhhdCdkIGJlIGdy
ZWF0IGZvciBBQ1BJIGFuZCByZW1vdmUgY29uY2VybnMgdGhlcmUuCj4KPiA+ID4gPiA+IFdlIHdp
bGwgbGlrZWx5IGhhdmUgYSB2ZW5kb3Igc3BlY2lmaWMgc3RyaW5nIHBhcnNpbmcgbG9naWMuCj4g
PiA+ID4KPiA+ID4gPiBDb21wbGljYXRpbmcgdGhlIHBhcnNpbmcgbG9naWMgaXMgdGhlIGV4YWN0
IHNvcnQgb2YgY3JhcCB0aGF0IEkgd2FudAo+ID4gPiA+IHRvIGF2b2lkLgo+ID4gPgo+ID4gPiBZ
YSwgSSB0aGluayB3ZSdyZSByZWFsbGx5IG92ZXJjb21wbGljYXRpbmcgdGhpbmdzIHdpdGggdGhl
IElTQSBzdHJpbmdzLgo+ID4gPiBMZXQncyBqdXN0IGRlcHJlY2F0ZSB0aGVtIGFuZCBtb3ZlIHRv
IHNvbWV0aGluZyB0aGF0IGRvZXNuJ3QgbmVlZCBhbGwgdGhlCj4gPiA+IGJlc3Bva2Ugc3RyaW5n
IHBhcnNpbmcuCj4gPgo+ID4gVmVyc2lvbmluZyBhc2lkZSwgYWx0aG91Z2ggdGhhdCByZW1vdmVz
IGEgbGFyZ2UgcGFydCBvZiB0aGUgbW90aXZhdGlvbiwKPiA+IHRoZSBpbnRlcmZhY2UgYmVjb21l
cyBxdWl0ZSBuaWNlOgo+ID4gb2ZfcHJvcGVydHlfcHJlc2VudChub2RlLCAicmlzY3YsaXNhLWV4
dGVuc2lvbi16aWNib20iKQo+Cj4gTXkgY3VycmVudCBmZWVsaW5nIGlzIHRoYXQsIHJhdGhlciB0
aGFuIGludHJvZHVjaW5nIGEga2V5LXZhbHVlIHR5cGUgb2YKPiBwcm9wZXJ0eSwgYWRkaW5nIGJv
b2xlYW4gcHJvcGVydGllcyBmb3IgZXh0ZW5zaW9ucyBpcyB0aGUgd2F5IHRvIGdvCj4gaGVyZS4g
VGhlICJyaXNjdixpc2EiIHBhcnQgb2YgdGhlIERUIEFCSSBwcmUtZGF0ZXMgZXZlbiB0aGUgcmF0
aWZpY2F0aW9uCgpUaGUgb25seSBwcm9ibGVtIHdpdGggYm9vbGVhbiBwcm9wZXJ0aWVzIGlzIHlv
dSBsb3NlIHRoZSBhYmlsaXR5IHRvCmFkZCBleHRyYSBpbmZvcm1hdGlvbgphYm91dCBhbiBJU0Eg
ZXh0ZW5zaW9uIGluIGNhc2Ugd2UgcmVxdWlyZSBpdC4gT25lIG9mIHRoZSBleGFtcGxlcyBpcwpD
TU8gZXh0ZW5zaW9ucy4KVGhlIGN1cnJlbnQgcmlzY3YsaXNhIHN0cmluZyBwYXJzaW5nIHNjaGVt
ZSB0aGF0IGRvZXNuJ3QgaGF2ZQppbmZyYXN0cnVjdHVyZSB0byBkbyB0aGF0IGVpdGhlci4KCldl
IGhhZCBzb21lIHJlbGF0ZWQgZGlzY3Vzc2lvbnMgaW4gdGhlIHBhc3QgYWJvdXQgaG93IHRvIGV4
dGVuZCB0aGUKa2V5LXZhbHVlIHBhaXIgdG8gaW5jbHVkZQp0aGF0IHZhbHVlLgoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC9DQU9uSkNVS2d0MStTVlhUQm1HQ2hKZjc0SnJzcWVxQUNYYmpR
QVhuaEZBTGtYaFBGZXdAbWFpbC5nbWFpbC5jb20vCgo+IG9mIHRoZSBiYXNlIGV4dGVuc2lvbnMg
KGFuZCB0aHVzIHRoZSByZW1vdmFsIG9mIHNvbWUgZmVhdHVyZXMuLi4pLgo+IFN0YXJ0aW5nIGFn
YWluIHdpdGggYSBuZXcgcHJvcGVydHkgd291bGQgYWxsb3cgdXMgdG8gZGVmaW5lIGV4dGVuc2lv
bnMKPiBhcyBwZXIgdGhlaXIgcmF0aWZpZWQgc3RhdGUsIHJhdGhlciB0aGFuIHRoZSBpbnRlcm1l
ZGlhdGUgJiBpbmNvbXBhdGlibGUKPiBzdGF0ZXMgdGhhdCB3ZSBoYXZlIGN1cnJlbnRseSBnb3Qg
d2l0aCAicmlzY3YsaXNhIi4KPiBTdWNoIGEgbW9kZWwgZG9lcyByZWx5IG9uIHRoZSBzdHJlbmd0
aGVuaW5nIG9mIHRoZSB3b3JkaW5nIGluIHRoZQo+IHNwZWNpZmljYXRpb24uCj4KPiBUaGlzIGhh
ZCB0aGUgYWR2YW50YWdlIG9mIGJlaW5nLCBhcyBJIG1lbnRpb24gYWJvdmUsIGV2ZW4gZWFzaWVy
IHRvCj4gcGFyc2UgaW4gc29mdHdhcmUgdGhhbiB0aGUga2V5LXZhbHVlIHBhaXIgYnVzaW5lc3Mg
LSBidXQgYWxzbyBpcwo+IHRyaXZpYWxseSBpbXBsZW1lbnRlZCBpbiBhIGR0LWJpbmRpbmcuIFdo
YXQgSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIGRvCj4gd2l0aCB0aGUgdmFsaWRhdGlvbiBvZiB0aGUg
a2V5LXZhbHVlIHN0dWZmIGRvZXMgbm90IGFwcGVhciB0byBiZSByZWFkaWx5Cj4gZG9hYmxlIQo+
Cj4gKEFub3RoZXIgZHJhd2JhY2sgdGhhdCBoYXMgY29tZSB0byBtaW5kIGlzIHRoYXQgd2UgaGF2
ZSBubyB3YXkgdG8KPiB2YWxpZGF0ZSB3aGV0aGVyIG11dHVhbGx5IGV4Y2x1c2l2ZSBleHRlbnNp
b25zIGhhdmUgYmVlbiBhZGRlZCB3aXRoCj4gInJpc2N2LGlzYSIpCj4KPiA+IFRoYXQgYWxzbyBn
aXZlcyB1cyB0aGUgYWJpbGl0eSB0byBkZWZpbmUgd2hhdCBzdXBwb3J0ZWQgdmVuZG9yCj4gPiBl
eHRlbnNpb25zIGFjdHVhbGx5IG1lYW4gaW4gYSBkdC1iaW5kaW5nLCB3aGljaCB0byBtZSBpcyBh
IGJpZyB3aW4gaW4KPiA+IHRlcm1zIG9mIHRoZSBhZm9yZW1lbnRpb25lZCAid2lsZCB3ZXN0Ii4K
Pgo+IFZlbmRvciBleHRlbnNpb25zIGV0YyBhcmUgb2Z0IHF1b3RlZCBhcyBvbmUgb2YgdGhlIHN0
cmVuZ3RocyBvZiBSSVNDLVYsCj4gYW5kIG15IGZlZWxpbmcgaXMgdGhhdCAicmlzY3YsaXNhIiBp
cyBub3QgYSBtZWNoYW5pc20gd2hlcmUgd2UgY2FuCj4gZWFzaWx5IGhhbmRsZSBtZWFuaW5ncyAt
IGVzcGVjaWFsbHkgZm9yIHZlbmRvciBzdHVmZiB3aGVyZSB0aGVyZSBpcwo+IG90aGVyd2lzZSBu
byBjZW50cmFsaXNlZCBsb2NhdGlvbiBmb3IgX3hmb28gLT4gZmVhdHVyZSBtYXBwaW5ncy4KPgo+
IENoZWVycywKPiBDb25vci4KCgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
