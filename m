Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A8C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uw7G92M+hh5f8JsEisOehGH9ofME1ye1XOLm2ehICY8=; b=os2mhFZAFIRFlm
	RpnoQ1J0FDcNTSs0+baOWVwl2f6qk81Z9AodxwbrQp2VmS7WCN0zkUdKiZS/WBD+qe7WcJtVuaJY0
	RVQRau9/eO3m+9w7Xd+JkJPuWZXlhbMDOggv2Qx/sYebwt9uWg1N5naFxLqVNmt5/3MkUcJuUWjz+
	QQL1NMToZxOa2Wa3A62vBuMRLWxNtHiSSYMxbGIjBKrvuuFsQcxRNgAnvRgI4mQ8hDVFTFwEFNODr
	ueKit9b6l2JpE4sxqZB8h45+lmiWYxgtAkzuRnBwlm70bjyqMrmrHhR6aOCXcwwYfTK1gc34wn6k/
	WGaPZjvO+eqImzz6y6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqbK-00BwoR-0v;
	Fri, 04 Aug 2023 08:56:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqbG-00Bwnm-0O
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 08:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691139356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmFvw/Mh8eaY2DQHYAo5BT2xSMzuqSWVjumlqqmuk1g=;
	b=Eu+dUPvrjLCGDlNr5ZrkKBa7Xjq/+JaHXgXavNLwqCkQOn+k9qxT4k0Z+k0/fGqapYyi5F
	qxbRzV/5IHx6ba2a5Q2P7WTyQWuBUqsCgdR0BYk5KO2PlOBtn89ugtCMJe1H7gyb5UujdA
	avEWqufPurAU84zxHjixzYqPahsF1h0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-HG9FzlveN6Wz6nxVpKChow-1; Fri, 04 Aug 2023 04:55:53 -0400
X-MC-Unique: HG9FzlveN6Wz6nxVpKChow-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-40fe31e76d4so23064761cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 01:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691139353; x=1691744153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmFvw/Mh8eaY2DQHYAo5BT2xSMzuqSWVjumlqqmuk1g=;
        b=k7IgCZPOJWFUDicf0zvg/ilnQJ8rBP+ptws8Ea+e2XPfS/YGh16krqAdNmkAt0U6BD
         Hb5HhsN/TKkLrjxAUM7R+6zv7O/BLZSSkiK8g9Wqfell380hqgSPV5s2cSLQNCgjh2tZ
         jRrZqN5dih5E5obP270r+EOcMhswC87eE/J3DnHNvF6KzYYdbmRf6GDXd+S4T2qbIni5
         2QzHedx5mphbhntsjuk4Fc6co9f1XvQwCtAYzUUg3ls71MTGnGwpKJTstLE9rD48b9qx
         Ji53t75UCCKrecfkIJAS8mw+eq6y78EehxXjc73KPijFwp3syytm07TrxwoKYE5+/24r
         7lCQ==
X-Gm-Message-State: AOJu0Yy/A3va3SlErGRNClVSn3eqDgoz4qJX0s073vaAbCV6pHCz1Uea
	T8A3AyHSUkTkSeiKRyTnktWStyTbogT/Z56+NezjZvtrb+ZBLBc5bHs9qMzfnuA0ydeMHfMla3o
	X6kloSt28iC+WrkRr2oIoDJ0jK4zaIrS3qmlIYkP3cmd/
X-Received: by 2002:ac8:7d07:0:b0:403:b85c:2ac8 with SMTP id g7-20020ac87d07000000b00403b85c2ac8mr1485080qtb.14.1691139353136;
        Fri, 04 Aug 2023 01:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIZPea69SCRbWLURCOrbR2294YeOg0GledRktnAs6K7El9K92k3Tn9DK6LgGE8n4FfrEbd3AFj/ROm2JS2HBY=
X-Received: by 2002:ac8:7d07:0:b0:403:b85c:2ac8 with SMTP id
 g7-20020ac87d07000000b00403b85c2ac8mr1485072qtb.14.1691139352892; Fri, 04 Aug
 2023 01:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230803051401.710236-2-leobras@redhat.com> <CAJF2gTShfMzVZw5TVqBvLNAzEBMzhWxNGC9JS70euPcKKN85zQ@mail.gmail.com>
 <CAJ6HWG5mzxN=txnbdi-=c+=wLsDfSe7Me+1DQE79ZX0NN6U1_g@mail.gmail.com>
 <CAJF2gTTag3hR7ZgM8o+yk+0Ox3A+xm4jAVTikAA0HqXQFKayRA@mail.gmail.com> <CAJ6HWG6ofyiLRq-HZFmocxPFzQhM+HwBQVOqwp-XSfctFHLNTQ@mail.gmail.com>
In-Reply-To: <CAJ6HWG6ofyiLRq-HZFmocxPFzQhM+HwBQVOqwp-XSfctFHLNTQ@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Fri, 4 Aug 2023 05:55:42 -0300
Message-ID: <CAJ6HWG5ps2fZoSM1dPg8TFTLgxZeXGSmjRG5Drg-g0HWH9c3sg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Deduplicate RISCV cmpxchg.h and atomic.c macros
To: Guo Ren <guoren@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_015558_524457_65DD9F9D 
X-CRM114-Status: GOOD (  39.62  )
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

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA1OjA14oCvQU0gTGVvbmFyZG8gQnJhcyBTb2FyZXMgUGFz
c29zCjxsZW9icmFzQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMywgMjAyMyBh
dCAxMToyOeKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBP
biBGcmksIEF1ZyA0LCAyMDIzIGF0IDEwOjIw4oCvQU0gTGVvbmFyZG8gQnJhcyBTb2FyZXMgUGFz
c29zCj4gPiA8bGVvYnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCBB
dWcgMywgMjAyMyBhdCA5OjUz4oCvUE0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1LCBBdWcgMywgMjAyMyBhdCAxOjE04oCvUE0gTGVvbmFy
ZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJ
IHVuaWZpZWQgcHJldmlvdXMgcGF0Y2hzZXRzIGludG8gYSBzaW5nbGUgb25lLCBzaW5jZSB0aGUg
d29yayBpcyByZWxhdGVkLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdoaWxlIHN0dWR5aW5nIHJpc2N2
J3MgY21weGNoZy5oIGZpbGUsIEkgZ290IHJlYWxseSBpbnRlcmVzdGVkIGluCj4gPiA+ID4gPiB1
bmRlcnN0YW5kaW5nIGhvdyBSSVNDViBhc20gaW1wbGVtZW50ZWQgdGhlIGRpZmZlcmVudCB2ZXJz
aW9ucyBvZgo+ID4gPiA+ID4ge2NtcCx9eGNoZy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBXaGVuIEkg
dW5kZXJzdG9vZCB0aGUgcGF0dGVybiwgaXQgbWFkZSBzZW5zZSBmb3IgbWUgdG8gcmVtb3ZlIHRo
ZQo+ID4gPiA+ID4gZHVwbGljYXRpb25zIGFuZCBjcmVhdGUgbWFjcm9zIHRvIG1ha2UgaXQgZWFz
aWVyIHRvIHVuZGVyc3RhbmQgd2hhdCBleGFjdGx5Cj4gPiA+ID4gPiBjaGFuZ2VzIGJldHdlZW4g
dGhlIHZlcnNpb25zOiBJbnN0cnVjdGlvbiBzdWZpeGVzICYgYmFycmllcnMuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gQWxzbywgZGlkIHRoZSBzYW1lIGtpbmQgb2Ygd29yayBvbiBhdG9taWMuYy4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBOb3RlIHRvIEd1byBSZW46Cj4gPiA+ID4gPiBJIGRpZCBzb21lIGZ1
cnRoZXIgaW1wcm92ZW1lbnQgYWZ0ZXIgeW91ciBwcmV2aW91cyByZXZpZXdzLCBzbyBJIGVuZGVk
Cj4gPiA+ID4gPiB1cCBhZnJhaWQgaW5jbHVkaW5nIHlvdXIgUmV2aWV3ZWQtYnkgYmVmb3JlIGNo
ZWNoaW5nIGlmIHRoZSBjaGFuZ2VzIGFyZQo+ID4gPiA+ID4gb2sgZm9yIHlvdS4gUGxlYXNlIGNo
ZWNrIGl0IG91dCBhZ2FpbiwgSSBqdXN0IHJlbW92ZWQgc29tZSBoZWxwZXIgbWFjcm9zCj4gPiA+
ID4gPiB0aGF0IHdlcmUgbm90IGJlaW5nIHVzZWQgZWxzZXdoZXJlIGluIHRoZSBrZXJuZWwuCj4g
PiA+ID4gSSBmb3VuZCB0aGlzIG9wdGltaXphdGlvbiBoYXMgY29uZmxpY3RzIHdpdGggdGhlIGJl
bG93IHBhdGNoZXM6Cj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3Yv
MjAyMzA4MDIxNjQ3MDEuMTkyNzkxLTE1LWd1b3JlbkBrZXJuZWwub3JnLwo+ID4gPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwODAyMTY0NzAxLjE5Mjc5MS01LWd1
b3JlbkBrZXJuZWwub3JnLwo+ID4gPiA+Cj4gPiA+ID4gSWYgeW91cnMgbWVyZ2VkLCBob3cgZG8g
d2Ugc3VwcG9ydCB0aGUgaW5saW5lIGNtcHhjaGcveGNoZ19zbWFsbAo+ID4gPiA+IGZ1bmN0aW9u
Pwo+ID4gPgo+ID4gPiBPaCwgSSBhY3R1YWxseSBpbnRyb2R1Y2VkIG15IHNlcmllcyBzbyBJIGNv
dWxkIGludHJvZHVjZSBuZXcgeGNoZyBhbmQKPiA+ID4gY21weGNoZyBmb3Igc2l6ZSAxIGFuZCAy
LiBJcyB0aGF0IHdoYXQgeW91ciBwYXRjaGVzIGFyZSBhYm91dCwgcmlnaHQ/Cj4gPiA+Cj4gPiA+
IEkgd2FzIHdvcmtpbmcgb24gdGhhdCB5ZXN0ZXJkYXksIGFuZCBkZWNpZGVkIHRvIHNlbmQgdGhl
IHBhdGNoc2V0Cj4gPiA+IHdpdGhvdXQgdGhlbSBiZWNhdXNlIEkgd2FzIHN0aWxsIG5vdCBzdXJl
IGVub3VnaC4KPiA+ID4KPiA+ID4gQWJvdXQgaW1wbGVtZW50YXRpb24gc3RyYXRlZ3ksIEkgd2Fz
IGludHJvZHVjaW5nIGEgbmV3IG1hY3JvcyBmb3IgeGNoZwo+ID4gPiAmIGNtcHhjaGcgd2l0aCBh
c20gd2hpY2ggd291bGQgd29yayBmb3IgYm90aCBmb3Igc2l6ZSAxICYgc2l6ZSAyLCBhbmQKPiA+
ID4gdXNlIHRoZSBzd2l0Y2gtY2FzZSB0byBjcmVhdGUgdGhlIG1hc2sgYW5kIGFuZF92YWx1ZS4K
PiA+ID4KPiA+ID4gWW91IHRoaW5rIHRoYXQgd29ya3MgZW5vdWdoPwo+ID4gR29vZCwgZ28gYWhl
YWQuCj4gPgo+ID4gPgo+ID4gPiA+IEl0J3MgdmVyeSBzdHJ1Z2dsaW5nIHRvIHVzZSBtYWNyb3Mg
dG8gaW1wbGVtZW50IGNvbXBsZXgKPiA+ID4gPiBmdW5jdGlvbnMuCj4gPiA+Cj4gPiA+IEkgYWdy
ZWUsIGJ1dCB3aXRoIHRoaXMgd2UgY2FuIGFjaGlldmUgbW9yZSBnZW5lcmljIGNvZGUsIHdoaWNo
IG1ha2VzCj4gPiA+IG1vcmUgY2xlYXIgd2hhdCBpcyB0aGUgcGF0dGVybiBmb3IgZ2l2ZW4gZnVu
Y3Rpb24uCj4gPiA+Cj4gPiA+ID4gQ291bGQgeW91IGNvbnNpZGVyIGEgbW9yZSByZWxheGVkIG9w
dGltaXphdGlvbiBpbiB3aGljaCB3ZSBjb3VsZAo+ID4gPiA+IGluc2VydCBpbmxpbmUgY21weGNo
Zy94Y2hnX3NtYWxsPwo+ID4gPgo+ID4gPiBXaGF0IGFib3V0IHRoaXM6IEkgZmluaXNoIHRoZSBw
YXRjaGVzIEkgaGF2ZSBiZWVuIHdvcmtpbmcgd2l0aAo+ID4gPiAoY21weGNoZyAmIHhjaGcgZm9y
IHNpemVzIDEgYW5kIDIpLCBhbmQgaWYgdGhleSBhcmUgZmluZSB3ZSBleHBhbmQKPiA+ID4gdGhp
cyBwYXRjaHNldCB3aXRoIHRoZW0uICBJZiBub3QsIEkgdHJ5IHJlbGF4aW5nIHRoZW0gYSBsaXR0
bGUgc28gd2UKPiA+ID4gY2FuIG1lcmdlIHdpdGggeW91ciBzZXQuCj4gPiA+Cj4gPiA+IERvZXMg
dGhhdCB3b3JrIGZvciB5b3U/Cj4gPiBHcmVhdCwgeW91IGNvdWxkIHByb3ZpZGUgY21weGNoZyAm
IHhjaGcgZm9yIHNpemVzIDEgYW5kIDIsIHRoZW4gbXkKPiA+IHBhdGNoIHNlcmllcyB3b3VsZCBi
YXNlIG9uIHlvdXJzLiBBZnRlciB0ZXN0ZWQsIEkgd291bGQgZ2l2ZSB5b3UKPiA+IFRlc3RlZC1i
eS4KPgo+IEF3ZXNvbWUhIFRoYW5rcyEKPgo+IEkgd2lsbCBzZW5kIGl0IHNob3J0bHksIGp1c3Qg
Y29tcGlsZS10ZXN0aW5nIHRoZSBrZXJuZWwuCj4KCnYzOgpodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8/c2VyaWVzPTc3Mjk4NiZzdGF0ZT0lMkEm
YXJjaGl2ZT1ib3RoCgo+ID4gPgo+ID4gPiBCZXN0IHJlZ2FyZHMsCj4gPiA+IExlbwo+ID4gPgo+
ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhhbmtzIQo+ID4gPiA+ID4gTGVvCj4g
PiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IENoYW5nZXMgc2luY2Ugc3F1YXNoZWQgY21weGNo
ZzoKPiA+ID4gPiA+IC0gVW5pZmllZCB3aXRoIGF0b21pYy5jIHBhdGNoc2V0Cj4gPiA+ID4gPiAt
IFJlYmFzZWQgb24gdG9wIG9mIHRvcnZhbGRzL21hc3RlciAodGhhbmtzIEFuZHJlYSBQYXJyaSEp
Cj4gPiA+ID4gPiAtIFJlbW92ZWQgaGVscGVyIG1hY3JvcyB0aGF0IHdlcmUgbm90IGJlaW5nIHVz
ZWQgZWxzZXdoZXJlIGluIHRoZSBrZXJuZWwuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ2hhbmdlcyBz
aW5jZSAoY21weGNoZykgUkZDdjM6Cj4gPiA+ID4gPiAtIFNxdWFzaGVkIHRoZSA2IG9yaWdpbmFs
IHBhdGNoZXMgaW4gMjogb25lIGZvciBjbXB4Y2hnIGFuZCBvbmUgZm9yIHhjaGcKPiA+ID4gPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQwNDE2Mzc0MS4yNzYyMTY1LTEtbGVv
YnJhc0ByZWRoYXQuY29tLwo+ID4gPiA+ID4KPiA+ID4gPiA+IENoYW5nZXMgc2luY2UgKGNtcHhj
aGcpIFJGQ3YyOgo+ID4gPiA+ID4gLSBGaXhlZCAgbWFjcm9zIHRoYXQgZGVwZW5kIG9uIGhhdmlu
ZyBhIGxvY2FsIHZhcmlhYmxlIHdpdGggYSBtYWdpYyBuYW1lCj4gPiA+ID4gPiAtIFByZXZpb3Vz
IGNhc3QgdG8gKGxvbmcpIGlzIG5vdyBvbmx5IGFwcGxpZWQgb24gNC1ieXRlcyBjbXB4Y2hnCj4g
PiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzAzMjEwNzQyNDkuMjIyMTY3
NC0xLWxlb2JyYXNAcmVkaGF0LmNvbS8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDaGFuZ2VzIHNpbmNl
IChjbXB4Y2hnKSBSRkN2MToKPiA+ID4gPiA+IC0gRml4ZWQgcGF0Y2ggNC82IHN1ZmZpeCBmcm9t
ICd3LmFxcmwnIHRvICcudy5hcXJsJywgdG8gYXZvaWQgYnVpbGQgZXJyb3IKPiA+ID4gPiA+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDMxODA4MDA1OS4xMTA5Mjg2LTEtbGVvYnJh
c0ByZWRoYXQuY29tLwo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBMZW9uYXJkbyBCcmFz
ICgzKToKPiA+ID4gPiA+ICAgcmlzY3YvY21weGNoZzogRGVkdXBsaWNhdGUgeGNoZygpIGFzbSBm
dW5jdGlvbnMKPiA+ID4gPiA+ICAgcmlzY3YvY21weGNoZzogRGVkdXBsaWNhdGUgY21weGNoZygp
IGFzbSBhbmQgbWFjcm9zCj4gPiA+ID4gPiAgIHJpc2N2L2F0b21pYy5oIDogRGVkdXBsaWNhdGUg
YXJjaF9hdG9taWMuKgo+ID4gPiA+ID4KPiA+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2F0b21pYy5oICB8IDE2NCArKysrKysrKy0tLS0tLS0tCj4gPiA+ID4gPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jbXB4Y2hnLmggfCAzMTggKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTIzIGluc2VydGlvbnMoKyksIDM1OSBkZWxl
dGlvbnMoLSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gMi40MS4wCj4gPiA+ID4g
Pgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+IEJlc3QgUmVnYXJkcwo+ID4gPiA+
ICBHdW8gUmVuCj4gPiA+ID4KPiA+ID4KPiA+Cj4gPgo+ID4gLS0KPiA+IEJlc3QgUmVnYXJkcwo+
ID4gIEd1byBSZW4KPiA+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
