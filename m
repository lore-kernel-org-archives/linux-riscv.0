Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159E0C3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 02:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1fRg72sB9CHnP68V9hhvCCb7PjlRgn8C2I7w77Zftw=; b=b2fWc3is+B0+M1
	/bg6TillwZW8egePoHpcXfyGwJHfg2C86lvxWlJyqIq3G3ul6mwJMdHJcfYzKE2JS25Qpbh//kvfQ
	i/rfYxZeM3kzh4x5fNLDc0cjsHtCvbn3FgLCOIWIXMwhloefcq5sDFSP7aHT6FHY2pddfJ3klImy4
	V7zvehoURo2ybwLNsqOSGnWCJxp3uErpob23PYSf0lnYF16cOItDZA2rCraiKyhzIULLod6sEXVml
	+q0pCwe0GQid9SvbZ+EosbLPL+9E0NT3zjIqZlxVmkzROwy6UTwck/O5Y4AkUXkbvTR0Cw94HfpoZ
	g1WkkwTobdb6PUcseQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLvcT-00000001IUg-3P29;
	Tue, 25 Jun 2024 02:09:17 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLvcP-00000001ITu-3N7g
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 02:09:15 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6fd3d9f572fso2427928a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 19:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719281350; x=1719886150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4VgV6qFA43tq7j/BPXZyEIKqUDK/RxNPBkPfT+JLKs=;
        b=KD2TSAfZhkV4VaKegi8jsA+QtFCTpJbDQ5oWaY7/JIAk/f7gabRyHaq+cDd82ImJgU
         Y/jmCPzvy40Ib+7yLC+imZJ8uR0Fx9qUvPBMC1DdNqBBc9UfnHDJpFVrsFBoKsjMo/N9
         gybSv7cCRXRMxeXjoz89Es24nXmJNW5jmWxAXAR8WmZJFWcf4Z+YNj/cspEk+J2avisj
         moDBlsNdZ9y9+SfqmaPadYg+TR0/34Epn+AH4fn7Kce02WXcbS1Swl+mb38c8M9j0nzE
         mqpKcgFAL5y0lV0ZM6wFFTCEIA7KNFWMcSO5wVUcwy+xsvpHrIEtHwqXNQ0f1Qpqh6mg
         zgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719281350; x=1719886150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4VgV6qFA43tq7j/BPXZyEIKqUDK/RxNPBkPfT+JLKs=;
        b=oemjMpcaO7mZlz2O6tyRFBhe9zxf72dSwtuoIbvurtcLsxZ+vWPME3TJCKjgxf8bVj
         HLBWhx54xg0cXof9aTA7S2MCqZPM4Oq1tXhG2fjuunyrUHu7uKhLadiSr8zIbzZEI9mX
         Tlo3nZJQ9X1qZXL/d83RZy46sqBwrT7li9iQ6c7PsqJZl30tR8tchcHJFgglkyYO8i5+
         RjmaBu4272cvyxYKfsSkAUIlxcAkOXbIHBsmqBAy112zyWnzUwkbueeBKi5hG9nXURz5
         FzeX7MEspdUZYhWKzpEu5PgWQIJ8a293MVfKhOpCFsd6Uesg+jilvLI3hgvg0yUe7qmS
         I6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbfRcVrALMbVbYjFE16iKRxXmAcg5fYug3Kob+aYXuSbPBYipMWkjEdWqGP31GtA2ZbwpBylGzuafDR62e182Sf842P/cPAjFofoSIrb8z
X-Gm-Message-State: AOJu0YwsIJ7PdTCJGfkXiezMYgmRSYnfgJ6LtZz7GUuVLiBFXHzZpHBk
	Z4XuYsgAG0G9uRYOadj3RWrLCXxy7jByNM3Sfzy44Ab6WTL7mjxAQ1YP21oVGZzCYqyEH2BTRpa
	5Q+JPqbmdqMx3WjZY76KFfAmCNebmgQcfD5I7Og==
X-Google-Smtp-Source: AGHT+IEf63XSBNB1eogE66LvdOGFLLfaEY5Mo64ee4URqfz824vzQwE0SGokshy/+g/3yRREbtgOp+7oCQjnGfMsbR4=
X-Received: by 2002:a05:6870:c154:b0:24c:a415:fd4b with SMTP id
 586e51a60fabf-25d01753118mr7676775fac.35.1719281350502; Mon, 24 Jun 2024
 19:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240622025514.66537-1-cuiyunhui@bytedance.com>
In-Reply-To: <20240622025514.66537-1-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 25 Jun 2024 10:08:59 +0800
Message-ID: <CAEEQ3wmV56GUNmOMV3ydkKjRu3Jt4Vw9Nb5r-0KYiF9d5tF6fw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Provide the frequency of time CSR via hwprobe
To: jesse@rivosinc.com, jrtc27@jrtc27.com, corbet@lwn.net, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	cleger@rivosinc.com, evan@rivosinc.com, conor.dooley@microchip.com, 
	cuiyunhui@bytedance.com, costa.shul@redhat.com, andy.chiu@sifive.com, 
	samitolvanen@google.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	punit.agrawal@bytedance.com, Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_190914_032621_B2E6E10D 
X-CRM114-Status: GOOD (  18.42  )
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

QWRkIHB1bml0IGFuZCBzdW5pbCBpbiB0aGUgbG9vcC4KCgpPbiBTYXQsIEp1biAyMiwgMjAyNCBh
dCAxMDo1NeKAr0FNIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToK
Pgo+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+Cj4gQSBoYW5k
ZnVsIG9mIHVzZXItdmlzaWJsZSBiZWhhdmlvciBpcyBiYXNlZCBvbiB0aGUgZnJlcXVlbmN5IG9m
IHRoZQo+IHRpbWUgQ1NSLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1l
ckByaXZvc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5
dGVkYW5jZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29t
Pgo+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+IC0tLQo+
ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMiArKwo+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCAgICAgIHwgMiArLQo+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3By
b2JlLmMgICAgICAgfCA1ICsrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2
L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gaW5k
ZXggZGY1MDQ1MTAzZTczLi5lYzNjOTk0NzRlZDcgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2
L2h3cHJvYmUucnN0Cj4gQEAgLTIzMywzICsyMzMsNSBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJl
IGRlZmluZWQ6Cj4KPiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9aX0JMT0NL
X1NJWkVgOiBBbiB1bnNpZ25lZCBpbnQgd2hpY2gKPiAgICByZXByZXNlbnRzIHRoZSBzaXplIG9m
IHRoZSBaaWNib3ogYmxvY2sgaW4gYnl0ZXMuCj4gKwo+ICsqIDpjOm1hY3JvOmBSSVNDVl9IV1BS
T0JFX0tFWV9USU1FX0NTUl9GUkVRYDogRnJlcXVlbmN5IChpbiBIeikgb2YgYHRpbWUgQ1NSYC4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+IGluZGV4IDE1MGE5ODc3YjBhZi4uZWYwMWMxODJh
ZjJiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPiBAQCAtOCw3ICs4LDcgQEAKPgo+
ICAjaW5jbHVkZSA8dWFwaS9hc20vaHdwcm9iZS5oPgo+Cj4gLSNkZWZpbmUgUklTQ1ZfSFdQUk9C
RV9NQVhfS0VZIDcKPiArI2RlZmluZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgOAo+Cj4gIHN0YXRp
YyBpbmxpbmUgYm9vbCByaXNjdl9od3Byb2JlX2tleV9pc192YWxpZChfX3M2NCBrZXkpCj4gIHsK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiBpbmRleCAyZmI4YTgxODVlN2Eu
LjUwNTNhOWIxODcxMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
aHdwcm9iZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+
IEBAIC03NCw2ICs3NCw3IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKPiAgI2RlZmluZSAgICAg
ICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfTUFTSyAgICAgICAgICAgKDcgPDwg
MCkKPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0laRSAgICA2Cj4g
ICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfTUlTQUxJR05FRF9QRVJGICAgICAgNwo+ICsjZGVm
aW5lIFJJU0NWX0hXUFJPQkVfS0VZX1RJTUVfQ1NSX0ZSRVEgICAgICAgIDgKPiAgLyogSW5jcmVh
c2UgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdoZW4gYWRkaW5nIGl0ZW1zLiAqLwo+Cj4gIC8qIEZs
YWdzICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gaW5kZXggZTRlYzkxNjYzMzlmLi4zZDQ3
ZWRjMDRhM2YgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiBAQCAtOCw2ICs4LDcgQEAK
PiAgI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+Cj4gICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVy
ZS5oPgo+ICAjaW5jbHVkZSA8YXNtL2h3cHJvYmUuaD4KPiArI2luY2x1ZGUgPGFzbS9kZWxheS5o
Pgo+ICAjaW5jbHVkZSA8YXNtL3NiaS5oPgo+ICAjaW5jbHVkZSA8YXNtL3N3aXRjaF90by5oPgo+
ICAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KPiBAQCAtMjI3LDYgKzIyOCwxMCBAQCBzdGF0aWMg
dm9pZCBod3Byb2JlX29uZV9wYWlyKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhaXItPnZhbHVlID0gcmlzY3ZfY2Jvel9ibG9ja19zaXplOwo+
ICAgICAgICAgICAgICAgICBicmVhazsKPgo+ICsgICAgICAgY2FzZSBSSVNDVl9IV1BST0JFX0tF
WV9USU1FX0NTUl9GUkVROgo+ICsgICAgICAgICAgICAgICBwYWlyLT52YWx1ZSA9IHJpc2N2X3Rp
bWViYXNlOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArCj4gICAgICAgICAvKgo+ICAgICAg
ICAgICogRm9yIGZvcndhcmQgY29tcGF0aWJpbGl0eSwgdW5rbm93biBrZXlzIGRvbid0IGZhaWwg
dGhlIHdob2xlCj4gICAgICAgICAgKiBjYWxsLCBidXQgZ2V0IHRoZWlyIGVsZW1lbnQga2V5IHNl
dCB0byAtMSBhbmQgdmFsdWUgc2V0IHRvIDAKPiAtLQo+IDIuMjAuMQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
