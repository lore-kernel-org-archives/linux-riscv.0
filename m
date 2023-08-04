Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A7AC001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 08:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DT5uR6mymts+On1+jCkR6MKrEqoJ549ipvO+d3B7EIM=; b=tSdpI1AVyaKLJY
	6v6uxiwa8HDJouTjUjHJ2voa0xX6Y17Q/uMf/eshiRwfb/7V7kD1TYKM3MWgT13KYIcx6L1EEVA5Q
	P/A9Y+fDSRP1dabE9IfvlX37vaq4A7+LUpGcJ+b8q8az6D3v/s8ebwY4EQPpleJn/U7H/7e+m/y8Y
	TLrX/XVk3zPe+o4OSPBV0WaoAsJeptlWXM9fKsLqC0GdHZ3IJvuBSDSLKdtLCb6dnOhxhcbJbnmBN
	AKKWCjoHFmP1u7hwordrCJsJLVWLwL0wm1LCeHHJHb6+uF/xsX6jbOxFsvzl7OHGu57dwUIyU8qHD
	TvnPQIUdiPeewIO7dc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpoO-00BqHn-2E;
	Fri, 04 Aug 2023 08:05:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpoM-00BqGz-03
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 08:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691136325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VofZULzxpJMYd+uZzeF2azmhZUsdcjOUcKOHUNEppE0=;
	b=SEn0XlEGOB/0OihEQ0ht293AwZ77QHxs4MOhkNarqAUjQ2A4I5Yapq57wV3+feB0yHcytx
	2of8cOdQoWyn2m0LFjgACeNZ39wZMryy2oLKxGswKkN8aRlYvEgKaeoSl0exbL0TmYOb0e
	5KNymVh9WTKPsaGFCzTiesrXg0zW0fA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-fd8aUp5XNBWw42XG7uWWaQ-1; Fri, 04 Aug 2023 04:05:23 -0400
X-MC-Unique: fd8aUp5XNBWw42XG7uWWaQ-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-40ff89fcb76so2704341cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 01:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691136323; x=1691741123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VofZULzxpJMYd+uZzeF2azmhZUsdcjOUcKOHUNEppE0=;
        b=Ndr7u/PrJ3iifz2CTH7+zuCubc3IfAozmeXfhMHBTF53bShtkjmk6PdwbXjGlDRfuV
         omIAw4AnUiMB1wP9SfukuocoCalV0I4ukrV5DQtw7nwFGKwbu26jIgIFyy2fmokT1aO0
         iZAHM+zzRWCvReEqBCH5M0TE7L3Qhql7YcRP0WoXshY6J/wjzX+PaVSaT0fqbJve2Y+t
         bRyhF4bsVLBgld9ln8v1CutyXJfkFez/NcklAuHOOolzwRkWnHm/dVrzNSgT9LlY5sEB
         C8wWPJmmnJlVfurp6XfhVGfVFEzgGvLoQdxEjP/7avqErUkhs1grrYhbiCYqOx/w5vXp
         1XTg==
X-Gm-Message-State: AOJu0Yz9oEBifFdKqvLi0fGM38+T6R3vN5nA1GJPlYqp1aX1WIGPxamW
	BJUXms8cMmSCgy48rkckswBCrQb289KrsXWIo5vti4WvuUA/Qu41SX0jn/918f1Ov474N/fHA0D
	90RA2s60XoB7jcROK46trKjUaqGWYFXOlOkhFyTnwIQC7
X-Received: by 2002:a05:622a:1488:b0:403:ad6d:fbbb with SMTP id t8-20020a05622a148800b00403ad6dfbbbmr1252898qtx.14.1691136323206;
        Fri, 04 Aug 2023 01:05:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH05FVpFTdwqmIx8uI2Izje4VI7Tylz6J6OaYPyWqXQHH9xaqoXg8Iq2F98PsZ6YLp4Fq85SyQDuYedJdGKDY=
X-Received: by 2002:a05:622a:1488:b0:403:ad6d:fbbb with SMTP id
 t8-20020a05622a148800b00403ad6dfbbbmr1252874qtx.14.1691136322947; Fri, 04 Aug
 2023 01:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230803051401.710236-2-leobras@redhat.com> <CAJF2gTShfMzVZw5TVqBvLNAzEBMzhWxNGC9JS70euPcKKN85zQ@mail.gmail.com>
 <CAJ6HWG5mzxN=txnbdi-=c+=wLsDfSe7Me+1DQE79ZX0NN6U1_g@mail.gmail.com> <CAJF2gTTag3hR7ZgM8o+yk+0Ox3A+xm4jAVTikAA0HqXQFKayRA@mail.gmail.com>
In-Reply-To: <CAJF2gTTag3hR7ZgM8o+yk+0Ox3A+xm4jAVTikAA0HqXQFKayRA@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Fri, 4 Aug 2023 05:05:11 -0300
Message-ID: <CAJ6HWG6ofyiLRq-HZFmocxPFzQhM+HwBQVOqwp-XSfctFHLNTQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230804_010526_123120_D720A3E0 
X-CRM114-Status: GOOD (  37.94  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAxMToyOeKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgQXVnIDQsIDIwMjMgYXQgMTA6MjDigK9BTSBMZW9uYXJk
byBCcmFzIFNvYXJlcyBQYXNzb3MKPiA8bGVvYnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiBUaHUsIEF1ZyAzLCAyMDIzIGF0IDk6NTPigK9QTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgQXVnIDMsIDIwMjMgYXQgMToxNOKAr1BN
IExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4g
PiBJIHVuaWZpZWQgcHJldmlvdXMgcGF0Y2hzZXRzIGludG8gYSBzaW5nbGUgb25lLCBzaW5jZSB0
aGUgd29yayBpcyByZWxhdGVkLgo+ID4gPiA+Cj4gPiA+ID4gV2hpbGUgc3R1ZHlpbmcgcmlzY3Yn
cyBjbXB4Y2hnLmggZmlsZSwgSSBnb3QgcmVhbGx5IGludGVyZXN0ZWQgaW4KPiA+ID4gPiB1bmRl
cnN0YW5kaW5nIGhvdyBSSVNDViBhc20gaW1wbGVtZW50ZWQgdGhlIGRpZmZlcmVudCB2ZXJzaW9u
cyBvZgo+ID4gPiA+IHtjbXAsfXhjaGcuCj4gPiA+ID4KPiA+ID4gPiBXaGVuIEkgdW5kZXJzdG9v
ZCB0aGUgcGF0dGVybiwgaXQgbWFkZSBzZW5zZSBmb3IgbWUgdG8gcmVtb3ZlIHRoZQo+ID4gPiA+
IGR1cGxpY2F0aW9ucyBhbmQgY3JlYXRlIG1hY3JvcyB0byBtYWtlIGl0IGVhc2llciB0byB1bmRl
cnN0YW5kIHdoYXQgZXhhY3RseQo+ID4gPiA+IGNoYW5nZXMgYmV0d2VlbiB0aGUgdmVyc2lvbnM6
IEluc3RydWN0aW9uIHN1Zml4ZXMgJiBiYXJyaWVycy4KPiA+ID4gPgo+ID4gPiA+IEFsc28sIGRp
ZCB0aGUgc2FtZSBraW5kIG9mIHdvcmsgb24gYXRvbWljLmMuCj4gPiA+ID4KPiA+ID4gPiBOb3Rl
IHRvIEd1byBSZW46Cj4gPiA+ID4gSSBkaWQgc29tZSBmdXJ0aGVyIGltcHJvdmVtZW50IGFmdGVy
IHlvdXIgcHJldmlvdXMgcmV2aWV3cywgc28gSSBlbmRlZAo+ID4gPiA+IHVwIGFmcmFpZCBpbmNs
dWRpbmcgeW91ciBSZXZpZXdlZC1ieSBiZWZvcmUgY2hlY2hpbmcgaWYgdGhlIGNoYW5nZXMgYXJl
Cj4gPiA+ID4gb2sgZm9yIHlvdS4gUGxlYXNlIGNoZWNrIGl0IG91dCBhZ2FpbiwgSSBqdXN0IHJl
bW92ZWQgc29tZSBoZWxwZXIgbWFjcm9zCj4gPiA+ID4gdGhhdCB3ZXJlIG5vdCBiZWluZyB1c2Vk
IGVsc2V3aGVyZSBpbiB0aGUga2VybmVsLgo+ID4gPiBJIGZvdW5kIHRoaXMgb3B0aW1pemF0aW9u
IGhhcyBjb25mbGljdHMgd2l0aCB0aGUgYmVsb3cgcGF0Y2hlczoKPiA+ID4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA4MDIxNjQ3MDEuMTkyNzkxLTE1LWd1b3JlbkBr
ZXJuZWwub3JnLwo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIz
MDgwMjE2NDcwMS4xOTI3OTEtNS1ndW9yZW5Aa2VybmVsLm9yZy8KPiA+ID4KPiA+ID4gSWYgeW91
cnMgbWVyZ2VkLCBob3cgZG8gd2Ugc3VwcG9ydCB0aGUgaW5saW5lIGNtcHhjaGcveGNoZ19zbWFs
bAo+ID4gPiBmdW5jdGlvbj8KPiA+Cj4gPiBPaCwgSSBhY3R1YWxseSBpbnRyb2R1Y2VkIG15IHNl
cmllcyBzbyBJIGNvdWxkIGludHJvZHVjZSBuZXcgeGNoZyBhbmQKPiA+IGNtcHhjaGcgZm9yIHNp
emUgMSBhbmQgMi4gSXMgdGhhdCB3aGF0IHlvdXIgcGF0Y2hlcyBhcmUgYWJvdXQsIHJpZ2h0Pwo+
ID4KPiA+IEkgd2FzIHdvcmtpbmcgb24gdGhhdCB5ZXN0ZXJkYXksIGFuZCBkZWNpZGVkIHRvIHNl
bmQgdGhlIHBhdGNoc2V0Cj4gPiB3aXRob3V0IHRoZW0gYmVjYXVzZSBJIHdhcyBzdGlsbCBub3Qg
c3VyZSBlbm91Z2guCj4gPgo+ID4gQWJvdXQgaW1wbGVtZW50YXRpb24gc3RyYXRlZ3ksIEkgd2Fz
IGludHJvZHVjaW5nIGEgbmV3IG1hY3JvcyBmb3IgeGNoZwo+ID4gJiBjbXB4Y2hnIHdpdGggYXNt
IHdoaWNoIHdvdWxkIHdvcmsgZm9yIGJvdGggZm9yIHNpemUgMSAmIHNpemUgMiwgYW5kCj4gPiB1
c2UgdGhlIHN3aXRjaC1jYXNlIHRvIGNyZWF0ZSB0aGUgbWFzayBhbmQgYW5kX3ZhbHVlLgo+ID4K
PiA+IFlvdSB0aGluayB0aGF0IHdvcmtzIGVub3VnaD8KPiBHb29kLCBnbyBhaGVhZC4KPgo+ID4K
PiA+ID4gSXQncyB2ZXJ5IHN0cnVnZ2xpbmcgdG8gdXNlIG1hY3JvcyB0byBpbXBsZW1lbnQgY29t
cGxleAo+ID4gPiBmdW5jdGlvbnMuCj4gPgo+ID4gSSBhZ3JlZSwgYnV0IHdpdGggdGhpcyB3ZSBj
YW4gYWNoaWV2ZSBtb3JlIGdlbmVyaWMgY29kZSwgd2hpY2ggbWFrZXMKPiA+IG1vcmUgY2xlYXIg
d2hhdCBpcyB0aGUgcGF0dGVybiBmb3IgZ2l2ZW4gZnVuY3Rpb24uCj4gPgo+ID4gPiBDb3VsZCB5
b3UgY29uc2lkZXIgYSBtb3JlIHJlbGF4ZWQgb3B0aW1pemF0aW9uIGluIHdoaWNoIHdlIGNvdWxk
Cj4gPiA+IGluc2VydCBpbmxpbmUgY21weGNoZy94Y2hnX3NtYWxsPwo+ID4KPiA+IFdoYXQgYWJv
dXQgdGhpczogSSBmaW5pc2ggdGhlIHBhdGNoZXMgSSBoYXZlIGJlZW4gd29ya2luZyB3aXRoCj4g
PiAoY21weGNoZyAmIHhjaGcgZm9yIHNpemVzIDEgYW5kIDIpLCBhbmQgaWYgdGhleSBhcmUgZmlu
ZSB3ZSBleHBhbmQKPiA+IHRoaXMgcGF0Y2hzZXQgd2l0aCB0aGVtLiAgSWYgbm90LCBJIHRyeSBy
ZWxheGluZyB0aGVtIGEgbGl0dGxlIHNvIHdlCj4gPiBjYW4gbWVyZ2Ugd2l0aCB5b3VyIHNldC4K
PiA+Cj4gPiBEb2VzIHRoYXQgd29yayBmb3IgeW91Pwo+IEdyZWF0LCB5b3UgY291bGQgcHJvdmlk
ZSBjbXB4Y2hnICYgeGNoZyBmb3Igc2l6ZXMgMSBhbmQgMiwgdGhlbiBteQo+IHBhdGNoIHNlcmll
cyB3b3VsZCBiYXNlIG9uIHlvdXJzLiBBZnRlciB0ZXN0ZWQsIEkgd291bGQgZ2l2ZSB5b3UKPiBU
ZXN0ZWQtYnkuCgpBd2Vzb21lISBUaGFua3MhCgpJIHdpbGwgc2VuZCBpdCBzaG9ydGx5LCBqdXN0
IGNvbXBpbGUtdGVzdGluZyB0aGUga2VybmVsLgoKPiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiBM
ZW8KPiA+Cj4gPgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzIQo+ID4gPiA+IExlbwo+ID4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiBDaGFuZ2VzIHNpbmNlIHNxdWFzaGVkIGNtcHhjaGc6Cj4gPiA+
ID4gLSBVbmlmaWVkIHdpdGggYXRvbWljLmMgcGF0Y2hzZXQKPiA+ID4gPiAtIFJlYmFzZWQgb24g
dG9wIG9mIHRvcnZhbGRzL21hc3RlciAodGhhbmtzIEFuZHJlYSBQYXJyaSEpCj4gPiA+ID4gLSBS
ZW1vdmVkIGhlbHBlciBtYWNyb3MgdGhhdCB3ZXJlIG5vdCBiZWluZyB1c2VkIGVsc2V3aGVyZSBp
biB0aGUga2VybmVsLgo+ID4gPiA+Cj4gPiA+ID4gQ2hhbmdlcyBzaW5jZSAoY21weGNoZykgUkZD
djM6Cj4gPiA+ID4gLSBTcXVhc2hlZCB0aGUgNiBvcmlnaW5hbCBwYXRjaGVzIGluIDI6IG9uZSBm
b3IgY21weGNoZyBhbmQgb25lIGZvciB4Y2hnCj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjMwNDA0MTYzNzQxLjI3NjIxNjUtMS1sZW9icmFzQHJlZGhhdC5jb20vCj4gPiA+
ID4KPiA+ID4gPiBDaGFuZ2VzIHNpbmNlIChjbXB4Y2hnKSBSRkN2MjoKPiA+ID4gPiAtIEZpeGVk
ICBtYWNyb3MgdGhhdCBkZXBlbmQgb24gaGF2aW5nIGEgbG9jYWwgdmFyaWFibGUgd2l0aCBhIG1h
Z2ljIG5hbWUKPiA+ID4gPiAtIFByZXZpb3VzIGNhc3QgdG8gKGxvbmcpIGlzIG5vdyBvbmx5IGFw
cGxpZWQgb24gNC1ieXRlcyBjbXB4Y2hnCj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjMwMzIxMDc0MjQ5LjIyMjE2NzQtMS1sZW9icmFzQHJlZGhhdC5jb20vCj4gPiA+ID4K
PiA+ID4gPiBDaGFuZ2VzIHNpbmNlIChjbXB4Y2hnKSBSRkN2MToKPiA+ID4gPiAtIEZpeGVkIHBh
dGNoIDQvNiBzdWZmaXggZnJvbSAndy5hcXJsJyB0byAnLncuYXFybCcsIHRvIGF2b2lkIGJ1aWxk
IGVycm9yCj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMzE4MDgwMDU5
LjExMDkyODYtMS1sZW9icmFzQHJlZGhhdC5jb20vCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IExl
b25hcmRvIEJyYXMgKDMpOgo+ID4gPiA+ICAgcmlzY3YvY21weGNoZzogRGVkdXBsaWNhdGUgeGNo
ZygpIGFzbSBmdW5jdGlvbnMKPiA+ID4gPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIGNt
cHhjaGcoKSBhc20gYW5kIG1hY3Jvcwo+ID4gPiA+ICAgcmlzY3YvYXRvbWljLmggOiBEZWR1cGxp
Y2F0ZSBhcmNoX2F0b21pYy4qCj4gPiA+ID4KPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hdG9taWMuaCAgfCAxNjQgKysrKysrKystLS0tLS0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2NtcHhjaGcuaCB8IDMxOCArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTIzIGluc2VydGlvbnMoKyksIDM1OSBkZWxldGlv
bnMoLSkKPiA+ID4gPgo+ID4gPiA+IC0tCj4gPiA+ID4gMi40MS4wCj4gPiA+ID4KPiA+ID4KPiA+
ID4KPiA+ID4gLS0KPiA+ID4gQmVzdCBSZWdhcmRzCj4gPiA+ICBHdW8gUmVuCj4gPiA+Cj4gPgo+
Cj4KPiAtLQo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
