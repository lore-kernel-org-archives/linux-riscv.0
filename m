Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B01BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 04:40:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD1C36103C
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 04:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD1C36103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLCET9hdRnb4yJl8wprLkTceITPmkMpDegWpv6IHURA=; b=mN2nJLmzyEKJng
	7EA5cLILrLZgJUWd1uLK9Ytiqi6uIqIg8y45X7FBHtpGScm4r1Ta8oqeFfD44ANc4+o66JHur2d6R
	pLgi3J4HZjvuwrwO/H+QM7WWGGwFSaYSuCty11B95cn9muBTrT6iX+hGyX/TMUcnRBPMFXQ2YFEpN
	JdMpluaVEIKnwaTfREFpuedW0fQsIdJkT1+FLKSUTKvyVZdP3hivr5iRBi+jqvWrciAaR8unOi8vc
	l9gxtjv53G9komRPQgSKAEJJdJQiaHb0x5ntwklCFTyBENGS1v86Cc0yhqa+o8cQH6bfCdVg4qwJ1
	D++EXcFwARHTXOhDuKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfEFh-000d3V-LZ; Tue, 26 Oct 2021 04:39:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfEFd-000d2A-Sf
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 04:39:56 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2DA34402F1
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 04:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635223184;
 bh=KVhIZhSXB0M0vyj9/7/Cl1UkXRcb4g+5QcVGTYNYcgo=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=KKmBKHWjMvwSKDJWtmObgzc/d87iPFib+yQAvKlP1UdbRgxxSqerlCGuQaktAd4gH
 fBwszS5DqKnFMe+K2kgwf2CN5BkzEaAoOUWSNvYgIaEG+nKwskioBAJSIY3j7jQWUJ
 sz2NyaJDxgZ28Kwr1ix/Z7hMm5j14684s/EWHm/3WTwCnT504gKbP1p7oujSdq9e+l
 NY+uOxpFgTbQN6cOVD+rLuvwyXJPJldHzdSQvNxIJ3RsyUeen3zMEFR+MZ0ro+gdpO
 2BZnwZ8rhNW3wt3KRpKxz1SLaEvMjUvw8ulvPwcb1uKO4n9A3Aqcg/Z/1se/W9o9mb
 bHTUezDxnUO7w==
Received: by mail-ed1-f70.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so11943387edx.3
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 21:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KVhIZhSXB0M0vyj9/7/Cl1UkXRcb4g+5QcVGTYNYcgo=;
 b=fwArb5CAuW5eqgSSDBi6ygYPRQ2O4yZMpwenvw7e35ebzWNwoCl0ArJWHuxSlU/2Ru
 lsj+zMZsNJR/st41MypQGqmv4DnJDYRTd3w6HTe3O22SkHw2MBfdAoEXXYpso2BSU/uG
 2dth3tDBoJILhpFt5EAT4tZfPUwQi9cQx8K6vKuN4qfIjifdgov37uWHdBBg+CyF+Gru
 pUyxy3RarklLpUbDdPWsDQsDv+ItgkSEHWGDcghOseZy/0JUvcd1TrOjoLFXfoWeXfTs
 TTx8QLN54AT/diHs4RDmrbHsv+DsrRA46JJyqr3vNgTDN2c6M12OZKOayGXYwY97oooC
 g2Ug==
X-Gm-Message-State: AOAM530x1XSU9gGB5yMPISbBgL+mxFckAFekRv7s8IQfGHe/Qou5Nyf4
 c4zYuYqUo3Y2Uc2XOfDOUtGUrr8Oh/OokMv83DeuYug55UuZflvV6wG+3747XQadAEXcIb8hxSZ
 Y/M6zf3xU3blVh1q/eoNsLrARBaqGepL2orRimZQ055rohYuVm55bJXftB33IIA==
X-Received: by 2002:a17:907:3e0a:: with SMTP id
 hp10mr2839498ejc.156.1635223183480; 
 Mon, 25 Oct 2021 21:39:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkpOQjSsxy4BbivbGbiR5w6Hk4KaWKisTkBst3LHn0VETbEITcOi/fB/MTKShp/KaTjhZkVas96zEud+sqEuw=
X-Received: by 2002:a17:907:3e0a:: with SMTP id
 hp10mr2839461ejc.156.1635223183204; 
 Mon, 25 Oct 2021 21:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <YUyWYpDl2Dmegz0a@archlinux-ax161>
 <mhng-b5f8a6a0-c3e8-4d25-9daa-346fdc8a2e5e@palmerdabbelt-glaptop>
 <YWhg8/UzjJsB51Gd@archlinux-ax161>
 <afeaea5f-70f2-330f-f032-fb0c8b5d0aa5@ghiti.fr>
 <990a894c-1806-5ab2-775e-a6f2355c2299@ghiti.fr>
In-Reply-To: <990a894c-1806-5ab2-775e-a6f2355c2299@ghiti.fr>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 26 Oct 2021 06:39:31 +0200
Message-ID: <CA+zEjCt28iYQARQa=8Nsw8+_j0PuEee==gUqjKjasMo+w2Ohwg@mail.gmail.com>
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
To: Alexandre ghiti <alex@ghiti.fr>
Cc: Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 elver@google.com, 
 akpm@linux-foundation.org, ryabinin.a.a@gmail.com, glider@google.com, 
 andreyknvl@gmail.com, dvyukov@google.com, ndesaulniers@google.com, 
 Arnd Bergmann <arnd@arndb.de>, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_213954_138295_4F310E1B 
X-CRM114-Status: GOOD (  44.40  )
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

SGksCgpPbiBGcmksIE9jdCAxNSwgMjAyMSBhdCAzOjA4IFBNIEFsZXhhbmRyZSBnaGl0aSA8YWxl
eEBnaGl0aS5mcj4gd3JvdGU6Cj4KPiBPbiAxMC8xNC8yMSA4OjMxIFBNLCBBbGV4IEdoaXRpIHdy
b3RlOgo+ID4gSGkgTmF0aGFuLAo+ID4KPiA+IExlIDE0LzEwLzIwMjEgw6AgMTg6NTUsIE5hdGhh
biBDaGFuY2VsbG9yIGEgw6ljcml0IDoKPiA+PiBPbiBGcmksIE9jdCAwOCwgMjAyMSBhdCAxMTo0
Njo1NUFNIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiA+Pj4gT24gVGh1LCAyMyBTZXAg
MjAyMSAwNzo1OTo0NiBQRFQgKC0wNzAwKSwgbmF0aGFuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPj4+
PiBPbiBUaHUsIFNlcCAyMywgMjAyMSBhdCAxMjowNzoxN1BNICswMjAwLCBNYXJjbyBFbHZlciB3
cm90ZToKPiA+Pj4+PiBPbiBXZWQsIDIyIFNlcHQgMjAyMSBhdCAyMjo1NSwgTmF0aGFuIENoYW5j
ZWxsb3IKPiA+Pj4+PiA8bmF0aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Pj4+PiBDdXJyZW50
bHksIHRoZSBhc2FuLXN0YWNrIHBhcmFtZXRlciBpcyBvbmx5IHBhc3NlZCBhbG9uZyBpZgo+ID4+
Pj4+PiBDRkxBR1NfS0FTQU5fU0hBRE9XIGlzIG5vdCBlbXB0eSwgd2hpY2ggcmVxdWlyZXMKPiA+
Pj4+Pj4gS0FTQU5fU0hBRE9XX09GRlNFVCB0bwo+ID4+Pj4+PiBiZSBkZWZpbmVkIGluIEtjb25m
aWcgc28gdGhhdCB0aGUgdmFsdWUgY2FuIGJlIGNoZWNrZWQuIEluIFJJU0MtVidzCj4gPj4+Pj4+
IGNhc2UsIEtBU0FOX1NIQURPV19PRkZTRVQgaXMgbm90IGRlZmluZWQgaW4gS2NvbmZpZywgd2hp
Y2ggbWVhbnMKPiA+Pj4+Pj4gdGhhdAo+ID4+Pj4+PiBhc2FuLXN0YWNrIGRvZXMgbm90IGdldCBk
aXNhYmxlZCB3aXRoIGNsYW5nIGV2ZW4gd2hlbgo+ID4+Pj4+PiBDT05GSUdfS0FTQU5fU1RBQ0sK
PiA+Pj4+Pj4gaXMgZGlzYWJsZWQsIHJlc3VsdGluZyBpbiBsYXJnZSBzdGFjayB3YXJuaW5ncyB3
aXRoIGFsbG1vZGNvbmZpZzoKPiA+Pj4+Pj4KPiA+Pj4+Pj4gZHJpdmVycy92aWRlby9mYmRldi9v
bWFwMi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtbGdwaGlsaXBzLWxiMDM1cTAyLmM6MTE3OjEyOgo+
ID4+Pj4+Pgo+ID4+Pj4+PiBlcnJvcjogc3RhY2sgZnJhbWUgc2l6ZSAoMTQ0MDApIGV4Y2VlZHMg
bGltaXQgKDIwNDgpIGluIGZ1bmN0aW9uCj4gPj4+Pj4+ICdsYjAzNXEwMl9jb25uZWN0JyBbLVdl
cnJvciwtV2ZyYW1lLWxhcmdlci10aGFuXQo+ID4+Pj4+PiBzdGF0aWMgaW50IGxiMDM1cTAyX2Nv
bm5lY3Qoc3RydWN0IG9tYXBfZHNzX2RldmljZSAqZHNzZGV2KQo+ID4+Pj4+PiAgICAgICAgICAg
ICBeCj4gPj4+Pj4+IDEgZXJyb3IgZ2VuZXJhdGVkLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBFbnN1cmUg
dGhhdCB0aGUgdmFsdWUgb2YgQ09ORklHX0tBU0FOX1NUQUNLIGlzIGFsd2F5cyBwYXNzZWQKPiA+
Pj4+Pj4gYWxvbmcgdG8KPiA+Pj4+Pj4gdGhlIGNvbXBpbGVyIHNvIHRoYXQgdGhlc2Ugd2Fybmlu
Z3MgZG8gbm90IGhhcHBlbiB3aGVuCj4gPj4+Pj4+IENPTkZJR19LQVNBTl9TVEFDSyBpcyBkaXNh
YmxlZC4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVp
bHRMaW51eC9saW51eC9pc3N1ZXMvMTQ1Mwo+ID4+Pj4+PiBSZWZlcmVuY2VzOiA2YmFlYzg4MGQ3
YTUgKCJrYXNhbjogdHVybiBvZmYgYXNhbi1zdGFjayBmb3IgY2xhbmctOAo+ID4+Pj4+PiBhbmQg
ZWFybGllciIpCj4gPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4KPiA+Pj4+Pgo+ID4+Pj4+IFJldmlld2VkLWJ5OiBNYXJjbyBFbHZlciA8
ZWx2ZXJAZ29vZ2xlLmNvbT4KPiA+Pj4+Cj4gPj4+PiBUaGFua3MhCj4gPj4+Pgo+ID4+Pj4+IFsg
V2hpY2ggdHJlZSBhcmUgeW91IHBsYW5uaW5nIHRvIHRha2UgaXQgdGhyb3VnaD8gXQo+ID4+Pj4K
PiA+Pj4+IEdhaCwgSSB3YXMgaW50ZW5kaW5nIGZvciBpdCB0byBnbyB0aHJvdWdoIC1tbSwgdGhl
biBJIGNjJ2QgbmVpdGhlcgo+ID4+Pj4gQW5kcmV3IG5vciBsaW51eC1tbS4uLiA6LyBBbmRyZXcs
IGRvIHlvdSB3YW50IG1lIHRvIHJlc2VuZCBvciBjYW4geW91Cj4gPj4+PiBncmFiIGl0IGZyb20g
TEtNTD8KPiA+Pj4KPiA+Pj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0
QGdvb2dsZS5jb20+Cj4gPj4+Cj4gPj4+IChhc3N1bWluZyB5b3Ugc3RpbGwgd2FudCBpdCB0aHJv
dWdoIHNvbWV3aGVyZSBlbHNlKQo+ID4+Cj4gPj4gVGhhbmtzLCBpdCBpcyBub3cgaW4gbWFpbmxp
bmUgYXMgY29tbWl0IDE5NTMyODY5ZmViOSAoImthc2FuOiBhbHdheXMKPiA+PiByZXNwZWN0IENP
TkZJR19LQVNBTl9TVEFDSyIpLgo+ID4+Cj4gPj4+Pj4gTm90ZSwgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rYXNhbi5oIG1lbnRpb25zIEtBU0FOX1NIQURPV19PRkZTRVQgaW4KPiA+Pj4+PiBjb21t
ZW50IChjb3BpZWQgZnJvbSBhcm02NCkuIERpZCBSSVNDLVYganVzdCBmb3JnZXQgdG8gY29weSBv
dmVyIHRoZQo+ID4+Pj4+IEtjb25maWcgb3B0aW9uPwo+ID4+Pj4KPiA+Pj4+IEkgZG8gc2VlIGl0
IGRlZmluZWQgaW4gdGhhdCBmaWxlIGFzIHdlbGwgYnV0IHlvdSBhcmUgcmlnaHQgdGhhdAo+ID4+
Pj4gdGhleSBkaWQKPiA+Pj4+IG5vdCBjb3B5IHRoZSBLY29uZmlnIGxvZ2ljLCBldmVuIHRob3Vn
aCBpdCB3YXMgcHJlc2VudCBpbiB0aGUgdHJlZQo+ID4+Pj4gd2hlbgo+ID4+Pj4gUklTQy1WIEtB
U0FOIHdhcyBpbXBsZW1lbnRlZC4gUGVyaGFwcyB0aGV5IHNob3VsZCBzbyB0aGF0IHRoZXkgZ2V0
Cj4gPj4+PiBhY2Nlc3MgdG8gdGhlIG90aGVyIGZsYWdzIGluIHRoZSAiZWxzZSIgYnJhbmNoPwo+
ID4+Pgo+ID4+PiBZYSwgbG9va3MgbGlrZSB3ZSBqdXN0IHNjcmV3ZWQgdGhpcyB1cC4gIEknbSBz
ZWVpbmcgc29tZSB3YXJuaW5ncyBsaWtlCj4gPj4+Cj4gPj4+ICAgICBjYzE6IHdhcm5pbmc6IOKA
mC1mc2FuaXRpemU9a2VybmVsLWFkZHJlc3PigJkgd2l0aCBzdGFjayBwcm90ZWN0aW9uCj4gPj4+
IGlzIG5vdCBzdXBwb3J0ZWQgd2l0aG91dCDigJgtZmFzYW4tc2hhZG93LW9mZnNldD3igJkgZm9y
IHRoaXMgdGFyZ2V0Cj4gPj4KPiA+PiBIbW1tLCBJIHRob3VnaHQgSSBkaWQgYSBHQ0MgYnVpbGQg
d2l0aCB0aGlzIGNoYW5nZSBidXQgSSBtdXN0IG5vdCBoYXZlCj4gPj4gOi8KPiA+Pgo+ID4+PiB3
aGljaCBpcyBob3cgSSBlbmRlZCB1cCBoZXJlLCBJJ20gYXNzdW1pbmcgdGhhdCdzIHdoYXQgeW91
J3JlCj4gPj4+IHRhbGtpbmcgYWJvdXQKPiA+Pj4gaGVyZT8gIExNSyBpZiB5b3Ugd2VyZSBwbGFu
bmluZyBvbiBzZW5kaW5nIGFsb25nIGEgZml4IG9yIGlmIHlvdQo+ID4+PiB3YW50IG1lIHRvCj4g
Pj4+IGdvIGZpZ3VyZSBpdCBvdXQuCj4gPj4KPiA+PiBJIHRvb2sgYSBsb29rIGF0IG1vdmluZyB0
aGUgbG9naWMgaW50byBLY29uZmlnIGxpa2UgYXJtNjQgYmVmb3JlIHNlbmRpbmcKPiA+PiB0aGlz
IGNoYW5nZSBhbmQgSSBkaWQgbm90IHJlYWxseSB1bmRlcnN0YW5kIGl0IHdlbGwgZW5vdWdoIHRv
IGRvIHNvLiBJCj4gPj4gdGhpbmsgaXQgd291bGQgYmUgYmVzdCBpZiB5b3Ugd2VyZSBhYmxlIHRv
IGRvIHRoYXQgc28gdGhhdCBub3RoaW5nIGdldHMKPiA+PiBtZXNzZWQgdXAuCj4gPj4KPiA+Cj4g
PiBJJ2xsIGRvIGl0IHRvbW9ycm93LCBJJ20gdGhlIGxhc3Qgb25lIHdobyB0b3VjaGVkIGthc2Fu
IG9uIHJpc2N2IDopCj4gPgo+Cj4gQWRkaW5nIEtBU0FOX1NIQURPV19PRkZTRVQgY29uZmlnIG1h
a2VzIGthc2FuIGtlcm5lbCBmYWlscyB0byBib290Lgo+IEl0IHJlY2VpdmVzIGEgKndyaXRlKiBm
YXVsdCBhdCB0aGUgYmVnaW5uaW5nIG9mIGEgbWVtYmxvY2tfYWxsb2MKPiBmdW5jdGlvbiB3aGls
ZSBwb3B1bGF0aW5nIHRoZSBrZXJuZWwgc2hhZG93IG1lbW9yeTogdGhlIHRyYXAgYWRkcmVzcyBp
cwo+IGluIHRoZSBrYXNhbiBzaGFkb3cgdmlydHVhbCBhZGRyZXNzIHJhbmdlIGFuZCB0aGlzIGNv
cnJlc3BvbmRzIHRvIGEKPiBrZXJuZWwgYWRkcmVzcyBpbiBpbml0X3N0YWNrLiBUaGUgcXVlc3Rp
b24gaXM6IGhvdyBkbyBJIHBvcHVsYXRlIHRoZQo+IHN0YWNrIHNoYWRvdyBtYXBwaW5nIHdpdGhv
dXQgdXNpbmcgbWVtYmxvY2sgQVBJPyBJdCdzIHdlaXJkLCBJIGRvbid0Cj4gZmluZCBhbnl0aGlu
ZyBvbiBvdGhlciBhcmNoaXRlY3R1cmVzLgoKQGthc2FuOiBBbnkgaWRlYSB3aGF0IHdlIGFyZSBk
b2luZyB3cm9uZyBpbiByaXNjdiB0byBlbmNvdW50ZXIgdGhlCmFib3ZlIHNpdHVhdGlvbj8KClRo
YW5rcywKCkFsZXgKCj4KPiBBbmQganVzdCBhIHNob3J0IG5vdGU6IEkgaGF2ZSByZWFsaXplZCB0
aGlzIHdpbGwgYnJlYWsgd2l0aCB0aGUgc3Y0OAo+IHBhdGNoc2V0IGFzIHdlIGRlY2lkZSBhdCBy
dW50aW1lIHRoZSBhZGRyZXNzIHNwYWNlIHdpZHRoIGFuZCB0aGUga2FzYW4KPiBzaGFkb3cgc3Rh
cnQgYWRkcmVzcyBpcyBkaWZmZXJlbnQgYmV0d2VlbiBzdjM5IGFuZCBzdjQ4LiBJIHdpbGwgaGF2
ZSB0bwo+IGRvIGxpa2UgeDg2IGFuZCBtb3ZlIHRoZSBrYXNhbiBzaGFkb3cgc3RhcnQgYXQgdGhl
IGVuZCBvZiB0aGUgYWRkcmVzcwo+IHNwYWNlIHNvIHRoYXQgaXQgaXMgdGhlIHNhbWUgZm9yIGJv
dGggc3YzOSBhbmQgc3Y0OC4KPgo+IFRoYW5rcywKPgo+IEFsZXgKPgo+Cj4gPiBUaGFua3MsCj4g
Pgo+ID4gQWxleAo+ID4KPiA+PiBDaGVlcnMsCj4gPj4gTmF0aGFuCj4gPj4KPiA+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+ID4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4g
Pj4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
