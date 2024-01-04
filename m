Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A348C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFZZSJXCxoQLI/Au/Ll4KTtjqs+lL2uqK2DcSbkTjks=; b=u2pyeE1uAPTEN5
	Aft7/AGlaRzc6vHxt5radzwS+mzq/b0ngwylR342xDQ7G63y82FVN2OofHLkRtg4qRBMLtKYvu9Mq
	h0eOMMnc6sEAhiXRpoRS3+P6TSVDsVbDNXoYOwg7anj9lwSzA+aLEN8/u2rr0f75S6nH7OvO6V2RP
	+0mR0Mc1qIv+2NvYvhDOQu9G+UNWBlqcleOn1RDXh/2Ld4h+oepwOSXpGD1GxaZqiHOHWATM2lahi
	NE6BjThst9JS4ULevyizzvPajtlTRgYEF5I9U5TeDZQ6XnIP9ao7OPdew9Fb2tfXx8aBdpg5CuK2z
	LEpXBHQNgQfNcyi+rtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMxx-00DzCm-25;
	Thu, 04 Jan 2024 12:36:53 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMxu-00DzB0-1T
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 12:36:51 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a26fa294e56so49413066b.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 04:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704371808; x=1704976608; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rbdo4C/X6bEIX/A1ZdBX4InlDHJmGdJuXNskE1V/Lk=;
        b=WpXWwStnJ9xy00AIwhP48yBx4ULSUTSoWvmFoL9H92fshbhazC8iFlbzpU7LpU4t0O
         WzhyycsngmSdS8Owi1W1bCAlBIbSv+LYyqpnpW6HLIx+DJuVEIVEqEsvF+U4w6gfyy+h
         36OMDICU5jTzXp4p7cjHCZbiEPXlL79ht5cFxGIMOPcAHgLhYUJzkGdOALln+eFD63My
         sYEra4VafYtw1WmEecowi1XuIEhjUVtiA0PbrBOZeut4JcAAys5tBYyOtI3nT4OGpIlx
         YOjQT2SAtwlLcGm0WPoxYtZ8fHf4Ra4ntHOlqDXLxP8bWwy+9LXSsPY87IRIiaITOatI
         Fh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371808; x=1704976608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rbdo4C/X6bEIX/A1ZdBX4InlDHJmGdJuXNskE1V/Lk=;
        b=sa1e0O/Mc6zhK4VNDEkk9WBVaBiyl+jvBvz1gFzM88mmt2+aneJ5ayi7mXwRaR1xdz
         8w3iW3TV/IY1RQxzmIhr2rnQBGYfZSkxJOUaUfMv4a9C4aI9AF0Z6kPRPVHRJbn9vNeh
         CvxlXz/PEvvZDDqeIOw+AbTzOxIspA+DgLR5O3rXDMZSjAPSpTKhSetHmJ/LHRO0KQ/A
         +2rhw8R/3nJiuao/kLzsiWQo46sZx38GOkSN9tFUxxzu5EmQDKKeKE3EQq7w7zJIg5Tx
         TLpRfq1srf5+2hQPGAAbQVV3i469MXvc7r2XbuJ4f/9GtVn9cRY+5DtEimhqkQBSNAZn
         otUA==
X-Gm-Message-State: AOJu0YwqrT3D1aG5tNK7ejtzYjdSOGKaUMNa2TAcR6MPP24O12x5R+MT
	IlcP2jjnyJJdWwme+Azpy0TTAhxA+HRJWWj+ReBzkxsfBZDNeg==
X-Google-Smtp-Source: AGHT+IGrAlcRpWxucvqwsc1/ERZuXk0N2sSJ8gsatbwcwVv03z9oBwqPMxWY/LDrXUnQbg+z7RR2d1qVfgbCtNvd/Cc=
X-Received: by 2002:a17:906:58d:b0:a28:893:64a8 with SMTP id
 13-20020a170906058d00b00a28089364a8mr336250ejn.85.1704371808415; Thu, 04 Jan
 2024 04:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20240102220134.3229156-1-samuel.holland@sifive.com> <20240102220134.3229156-6-samuel.holland@sifive.com>
In-Reply-To: <20240102220134.3229156-6-samuel.holland@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 4 Jan 2024 13:36:37 +0100
Message-ID: <CAHVXubi5C=Dt2ACsEYt68AeCSCVO49Udaks=0pf1+cK0igNOoQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] riscv: mm: Combine the SMP and UP TLB flush code
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_043650_517693_304822F9 
X-CRM114-Status: GOOD (  18.46  )
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

T24gVHVlLCBKYW4gMiwgMjAyNCBhdCAxMTowMeKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEluIFNNUCBjb25maWd1cmF0aW9ucywgYWxs
IFRMQiBmbHVzaGluZyBuYXJyb3dlciB0aGFuIGZsdXNoX3RsYl9hbGwoKQo+IGdvZXMgdGhyb3Vn
aCBfX2ZsdXNoX3RsYl9yYW5nZSgpLiBEbyB0aGUgc2FtZSBpbiBVUCBjb25maWd1cmF0aW9ucy4K
Pgo+IFRoaXMgYWxsb3dzIFVQIGNvbmZpZ3VyYXRpb25zIHRvIHRha2UgYWR2YW50YWdlIG9mIHJl
Y2VudCBpbXByb3ZlbWVudHMKPiB0byB0aGUgY29kZSBpbiB0bGJmbHVzaC5jLCBzdWNoIGFzIHN1
cHBvcnQgZm9yIGh1Z2UgcGFnZXMgYW5kIGZsdXNoaW5nCj4gbXVsdGlwbGUtcGFnZSByYW5nZXMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZl
LmNvbT4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjQ6Cj4gIC0gTWVyZ2UgdGhlIHR3byBjb3BpZXMg
b2YgX19mbHVzaF90bGJfcmFuZ2UoKSBhbmQgcmVseSBvbiB0aGUgY29tcGlsZXIKPiAgICB0byBv
cHRpbWl6ZSBvdXQgdGhlIGJyb2FkY2FzdCBwYXRoIChib3RoIGNsYW5nIGFuZCBnY2MgZG8gdGhp
cykKPiAgLSBNZXJnZSB0aGUgdHdvIGNvcGllcyBvZiBmbHVzaF90bGJfYWxsKCkgYW5kIHJlbHkg
b24gY29uc3RhbnQgZm9sZGluZwo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAgLSBNb3ZlIHRoZSBTTVAv
VVAgbWVyZ2UgZWFybGllciBpbiB0aGUgc2VyaWVzIHRvIGF2b2lkIGJ1aWxkIGlzc3Vlcwo+ICAt
IE1ha2UgYSBjb3B5IG9mIF9fZmx1c2hfdGxiX3JhbmdlKCkgaW5zdGVhZCBvZiBhZGRpbmcgaWZk
ZWZzIGluc2lkZQo+ICAtIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKSBpcyB0aGUgb25seSBmdW5jdGlv
biB1c2VkIG9uICFNTVUgKHNtcGJvb3QuYykKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Rs
YmZsdXNoLmggfCAyOSArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2
L21tL01ha2VmaWxlICAgICAgICAgICAgfCAgNSArLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVz
aC5oCj4gaW5kZXggOGYzNDE4YzVmMTcyLi43NzEyZmZlMmY2YzQgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS90bGJmbHVzaC5oCj4gQEAgLTI3LDEyICsyNyw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBs
b2NhbF9mbHVzaF90bGJfcGFnZSh1bnNpZ25lZCBsb25nIGFkZHIpCj4gIHsKPiAgICAgICAgIEFM
VF9GTFVTSF9UTEJfUEFHRShfX2FzbV9fIF9fdm9sYXRpbGVfXyAoInNmZW5jZS52bWEgJTAiIDog
OiAiciIgKGFkZHIpIDogIm1lbW9yeSIpKTsKPiAgfQo+IC0jZWxzZSAvKiBDT05GSUdfTU1VICov
Cj4gLSNkZWZpbmUgbG9jYWxfZmx1c2hfdGxiX2FsbCgpICAgICAgICAgICAgICAgICAgZG8geyB9
IHdoaWxlICgwKQo+IC0jZGVmaW5lIGxvY2FsX2ZsdXNoX3RsYl9wYWdlKGFkZHIpICAgICAgICAg
ICAgIGRvIHsgfSB3aGlsZSAoMCkKPiAtI2VuZGlmIC8qIENPTkZJR19NTVUgKi8KPgo+IC0jaWYg
ZGVmaW5lZChDT05GSUdfU01QKSAmJiBkZWZpbmVkKENPTkZJR19NTVUpCj4gIHZvaWQgZmx1c2hf
dGxiX2FsbCh2b2lkKTsKPiAgdm9pZCBmbHVzaF90bGJfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0p
Owo+ICB2b2lkIGZsdXNoX3RsYl9tbV9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWdu
ZWQgbG9uZyBzdGFydCwKPiBAQCAtNDYsMjYgKzQxLDggQEAgdm9pZCBmbHVzaF90bGJfa2VybmVs
X3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKTsKPiAgdm9pZCBm
bHVzaF9wbWRfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBs
b25nIHN0YXJ0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kKTsK
PiAgI2VuZGlmCj4gLSNlbHNlIC8qIENPTkZJR19TTVAgJiYgQ09ORklHX01NVSAqLwo+IC0KPiAt
I2RlZmluZSBmbHVzaF90bGJfYWxsKCkgbG9jYWxfZmx1c2hfdGxiX2FsbCgpCj4gLSNkZWZpbmUg
Zmx1c2hfdGxiX3BhZ2Uodm1hLCBhZGRyKSBsb2NhbF9mbHVzaF90bGJfcGFnZShhZGRyKQo+IC0K
PiAtc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwKPiAtICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQg
bG9uZyBlbmQpCj4gLXsKPiAtICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiAtfQo+IC0K
PiAtLyogRmx1c2ggYSByYW5nZSBvZiBrZXJuZWwgcGFnZXMgKi8KPiAtc3RhdGljIGlubGluZSB2
b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiAtICAgICAg
IHVuc2lnbmVkIGxvbmcgZW5kKQo+IC17Cj4gLSAgICAgICBsb2NhbF9mbHVzaF90bGJfYWxsKCk7
Cj4gLX0KPiAtCj4gLSNkZWZpbmUgZmx1c2hfdGxiX21tKG1tKSBmbHVzaF90bGJfYWxsKCkKPiAt
I2RlZmluZSBmbHVzaF90bGJfbW1fcmFuZ2UobW0sIHN0YXJ0LCBlbmQsIHBhZ2Vfc2l6ZSkgZmx1
c2hfdGxiX2FsbCgpCj4gLSNlbmRpZiAvKiAhQ09ORklHX1NNUCB8fCAhQ09ORklHX01NVSAqLwo+
ICsjZWxzZSAvKiBDT05GSUdfTU1VICovCj4gKyNkZWZpbmUgbG9jYWxfZmx1c2hfdGxiX2FsbCgp
ICAgICAgICAgICAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+ICsjZW5kaWYgLyogQ09ORklHX01N
VSAqLwo+Cj4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX1RMQkZMVVNIX0ggKi8KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvbW0vTWFrZWZpbGUKPiBpbmRl
eCAzYTRkZmM4YmFiY2YuLjk2ZTY1YzU3MWNlOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21t
L01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9NYWtlZmlsZQo+IEBAIC0xMywxNSArMTMs
MTIgQEAgZW5kaWYKPiAgS0NPVl9JTlNUUlVNRU5UX2luaXQubyA6PSBuCj4KPiAgb2JqLXkgKz0g
aW5pdC5vCj4gLW9iai0kKENPTkZJR19NTVUpICs9IGV4dGFibGUubyBmYXVsdC5vIHBhZ2VhdHRy
Lm8KPiArb2JqLSQoQ09ORklHX01NVSkgKz0gZXh0YWJsZS5vIGZhdWx0Lm8gcGFnZWF0dHIubyB0
bGJmbHVzaC5vCj4gIG9iai15ICs9IGNhY2hlZmx1c2gubwo+ICBvYmoteSArPSBjb250ZXh0Lm8K
PiAgb2JqLXkgKz0gcGd0YWJsZS5vCj4gIG9iai15ICs9IHBtZW0ubwo+Cj4gLWlmZXEgKCQoQ09O
RklHX01NVSkseSkKPiAtb2JqLSQoQ09ORklHX1NNUCkgKz0gdGxiZmx1c2gubwo+IC1lbmRpZgo+
ICBvYmotJChDT05GSUdfSFVHRVRMQl9QQUdFKSArPSBodWdldGxicGFnZS5vCj4gIG9iai0kKENP
TkZJR19QVERVTVBfQ09SRSkgKz0gcHRkdW1wLm8KPiAgb2JqLSQoQ09ORklHX0tBU0FOKSAgICs9
IGthc2FuX2luaXQubwo+IC0tCj4gMi40Mi4wCj4KCk5pY2Ugb25lLCB5b3UgY2FuIGFkZDoKClJl
dmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFu
a3MsCgpBbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
