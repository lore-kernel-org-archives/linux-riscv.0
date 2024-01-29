Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8137C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 01:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjZJ/SRiXQarof+tkrC68eXkGiGtnKFnjZLxIm4tGOM=; b=KWngL+PlwOWBy5
	mv8mW1mc+c6hQYgaP7CnBan/K+XzPoaq6ZEdc/x3XoBU68S6p2jLNFzEhHVqetezWrq8PLmNpocjj
	4wrYEEHudKHwpxBLvggiko/RfGrKxGHkRUnsCC23z7DLK/E6DRXx0I3KmbBtdcx8ve6rE3lpG2Z66
	Jpgw6Q7kHpFg5n2OIwMS9jbBH0gRStsFu50rw6cVsr1xc2MLn0GOZ6osJnumctCFE3ozeWE5wclCi
	VcaWDwzvsDtLxkf9RvpPs5cXpkN+fBsNHgK2JJyhSk7pdqvrFoo9NdirQPHL09bzgvNwz1tIFGids
	Qrl3WMyp+sQK5ZAI11zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUGhM-0000000AxYX-4BK8;
	Mon, 29 Jan 2024 01:44:33 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUGhK-0000000AxXl-1TTP
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 01:44:31 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-214def5da12so988862fac.2
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jan 2024 17:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706492606; x=1707097406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdQUmqGdZQkSaRtssstol3Hg+wBOCg5SlEWZbS6wjcc=;
        b=HTHA/OwxWsDrzyUth3RrszVFMecfdOQWRX/W5sqD6SJ5DNchH2HPldIphWOhY+ZMjM
         nmts+NUT+3MvLBD7QZL6A+BZhPxt3d4cJnIhMWGkroge+xgR/C3Jc/pAuUyIFTN1wdtf
         0/0T+mUtmqA0pc8oIK/eMJBXF6ZwevCmfE7RrME6AXMINIUH+smO48yoyme2jP1qousl
         5oHJk/ZIEy6AHEL/0oEOfSnNIuhxP0uQ+un8wTHA7tuK1CGa6PUEKnqEM/hbBNqchXKa
         IOfNsZgc8PwbLi0yvixMrFKLBRN4ClwKgL46VrCGBAFV3jIdbG2yRPZuN3cCCZVnNHMI
         rdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706492606; x=1707097406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdQUmqGdZQkSaRtssstol3Hg+wBOCg5SlEWZbS6wjcc=;
        b=mxBzJRxcFsTzauhfHYzuw5zm5yENWZM/LruJQ8Kozuo4nZvtbH2OO8LLsBmami4mIw
         h2Tl9DmOEY/pg0wLykrWgJvRjq4BzFMLIc3moFyvcXBHjvenOpSPdhXz6IrKIz6DHg6P
         py1MeurOiz5NVV1f2gvwUyR1POEB7o1Qx4st6BtTj0lXSxFwwzMDX69927fCSKO+4sGY
         +SRfNglbEkUmvbHTugzjaA3of79h82SdpuImo2o67jbqZ/+0Kk+IsluM0YDAOvueJZR0
         enaj/QTgZARJb0hkCgi6LJtc4uuP2quV36MLNyI1ImcuekGFVoC9MJzD+6M/sQrwavy6
         jtMQ==
X-Gm-Message-State: AOJu0YwcGPh06GQv97yU2hCkw+1wPqxSsGojVOSRHKLfkl4VbfTiLR8S
	2BLf9mL/jJ0teOOD9i8Qiaj03EE8zI9Bj5M5NLpilymfnGL9vO4gxG+RXbct9tb9rOJ+5EqXIb+
	1voYjMb+xYWUQqGco10wpbVSBZ3CNomyDhysi5A==
X-Google-Smtp-Source: AGHT+IEh7zJtrT4zoZeDgoIevMP0HldKJUu/niw/hjgIwiABPGc7e8ykKyUMlP3CGRljf3HMKBVGKg9BWeKb6uapTu8=
X-Received: by 2002:a05:6870:5d9a:b0:206:bbc9:be01 with SMTP id
 fu26-20020a0568705d9a00b00206bbc9be01mr2527073oab.41.1706492606614; Sun, 28
 Jan 2024 17:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20240123132730.2297719-1-alexghiti@rivosinc.com>
 <CAEEQ3wk5edUFTuE3H3KDGkCXj0+=i7Z1BM2M+6X-Tk9_m8X_iQ@mail.gmail.com>
 <ZbDICZkatO3/lGf/@snowbird> <cd68cf4e-7a6b-4875-ae1b-0c28a6eacaad@ghiti.fr> <65bd3d38-dcc0-4e64-b35b-8a2e697768ff@ghiti.fr>
In-Reply-To: <65bd3d38-dcc0-4e64-b35b-8a2e697768ff@ghiti.fr>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 29 Jan 2024 09:43:15 +0800
Message-ID: <CAEEQ3w=+yDpvsjd3NqZjJOCR8WaHyMBArpavvXPDgU5eKczk+g@mail.gmail.com>
Subject: Re: [External] [PATCH] riscv: Fix wrong size passed to local_flush_tlb_range_asid()
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Dennis Zhou <dennis@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_174430_437174_C6C281BF 
X-CRM114-Status: GOOD (  32.33  )
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

SGkgQWxleGFuZHJlLAoKT24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgNDo0MeKAr1BNIEFsZXhhbmRy
ZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4KPiBPbiAyNC8wMS8yMDI0IDA5OjM4LCBB
bGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBIaSBEZW5uaXMsIFl1bmh1aSwKPiA+Cj4gPiBPbiAy
NC8wMS8yMDI0IDA5OjE5LCBEZW5uaXMgWmhvdSB3cm90ZToKPiA+PiBIZWxsbywKPiA+Pgo+ID4+
IE9uIFdlZCwgSmFuIDI0LCAyMDI0IGF0IDEwOjQ0OjEyQU0gKzA4MDAsIHl1bmh1aSBjdWkgd3Jv
dGU6Cj4gPj4+IEhpIEFsZXhhbmRyZSwKPiA+Pj4KPiA+Pj4gT24gVHVlLCBKYW4gMjMsIDIwMjQg
YXQgOTozMeKAr1BNIEFsZXhhbmRyZSBHaGl0aQo+ID4+PiA8YWxleGdoaXRpQHJpdm9zaW5jLmNv
bT4gd3JvdGU6Cj4gPj4+PiBsb2NhbF9mbHVzaF90bGJfcmFuZ2VfYXNpZCgpIHRha2VzIHRoZSBz
aXplIGFzIGFyZ3VtZW50LCBub3QgdGhlCj4gPj4+PiBlbmQgb2YKPiA+Pj4+IHRoZSByYW5nZSB0
byBmbHVzaCwgc28gZml4IHRoaXMgYnkgY29tcHV0aW5nIHRoZSBzaXplIGZyb20gdGhlIGVuZCBh
bmQKPiA+Pj4+IHRoZSBzdGFydCBvZiB0aGUgcmFuZ2UuCj4gPj4+Pgo+ID4+Pj4gRml4ZXM6IDdh
OTJmYzhiNGQyMCAoIm1tOiBJbnRyb2R1Y2UgZmx1c2hfY2FjaGVfdm1hcF9lYXJseSgpIikKPiA+
Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNv
bT4KPiA+Pj4+IC0tLQo+ID4+Pj4gICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgfCAyICstCj4g
Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4+
Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgYi9hcmNoL3Jp
c2N2L21tL3RsYmZsdXNoLmMKPiA+Pj4+IGluZGV4IDhkMTJiMjZmNWFjMy4uOTYxOTk2NWY2NTAx
IDEwMDY0NAo+ID4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPj4+PiArKysg
Yi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+Pj4+IEBAIC02OCw3ICs2OCw3IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZAo+ID4+Pj4gbG9jYWxfZmx1c2hfdGxiX3JhbmdlX2FzaWQodW5zaWduZWQg
bG9uZyBzdGFydCwKPiA+Pj4+Cj4gPj4+PiAgIHZvaWQgbG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9y
YW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZAo+ID4+Pj4gbG9uZyBlbmQpCj4gPj4+
PiAgIHsKPiA+Pj4+IC0gICAgICAgbG9jYWxfZmx1c2hfdGxiX3JhbmdlX2FzaWQoc3RhcnQsIGVu
ZCwgUEFHRV9TSVpFLAo+ID4+Pj4gRkxVU0hfVExCX05PX0FTSUQpOwo+ID4+Pj4gKyAgICAgICBs
b2NhbF9mbHVzaF90bGJfcmFuZ2VfYXNpZChzdGFydCwgZW5kIC0gc3RhcnQsIFBBR0VfU0laRSwK
PiA+Pj4+IEZMVVNIX1RMQl9OT19BU0lEKTsKPiA+Pj4+ICAgfQo+ID4+IFdlbGwgdGhpcyB3YXMg
YSBtaXNzIGR1cmluZyBjb2RlIHJldmlldy4uIEknbSBnb2luZyB0byB0YWtlIGFub3RoZXIgbG9v
awo+ID4+IHRvbW9ycm93IGFuZCB0aGVuIGxpa2VseSBwdWxsIHRoaXMgaW50byBhIGZpeGVzIGJy
YW5jaC4KPiA+Pgo+ID4+PiBXaGF0IG1ha2VzIG1lIGN1cmlvdXMgaXMgdGhhdCB0aGlzIHBhdGNo
IGhhcyBub3QgYmVlbiB0ZXN0ZWQ/Cj4gPj4+IEJUVywgSXQgaXMgYmVzdCB0byBrZWVwIHRoZSBw
YXJhbWV0ZXIgb3JkZXIgb2YgYWxsIGZ1bmN0aW9ucyBpbgo+ID4+PiB0bGJmbHVzaC5jIGNvbnNp
c3RlbnQ6IGNwdW1hc2ssIHN0YXJ0LCBzaXplLCBzdHJpZGUsIGFzaWQuCj4gPj4+Cj4gPj4gSSBj
YW4ndCBzcGVhayB0byB0aGUgcmlzY3YgY29tbXVuaXRpZXMgdGVzdGluZy9yZWdyZXNzaW9uIHN1
aXRlcywgYnV0Cj4gPj4gdGhpcyB3b3VsZCBvbmx5IGJlIGNhdWdodCBpbiBhIHBlcmZvcm1hbmNl
IHJlZ3Jlc3Npb24gdGVzdC4KPiA+Pgo+ID4+IFRoYXQgYmVpbmcgc2FpZCwgQWxleGFuZHJlLCBj
YW4geW91IHBsZWFzZSBsbWsgd2hhdCBsZXZlbCBvZiB0ZXN0aW5nCj4gPj4gdGhpcyBoYXMgZ29u
ZSB0aHJvdWdoPwo+ID4KPiA+Cj4gPiBBbGwgbXkgcGF0Y2hlcyBnbyB0aHJvdWdoIHRoZSBzYW1l
IGxldmVsIG9mIHRlc3Rpbmc6Cj4gPgo+ID4gKiBCdWlsZC9ib290IGFuIFVidW50dSBrZXJuZWwg
d2l0aCBhbmQgd2l0aG91dCBLQVNBTiArIGEgZmV3IHNpbXBsZQo+ID4gdGVzdHN1aXRlcyAobGli
aHVnZXRsYmZzLCByaXNjdiBrc2VsZnRlc3RzIGFuZCBvdGhlcikKPiA+ICogQnVpbGQvYm9vdCBh
IHNpbXBsZSByb290ZnMgb24gfjQwIGRpZmZlcmVudCBydjY0IGNvbmZpZ3MKPiA+ICogQnVpbGQv
Ym9vdCBhIHNpbXBsZSByb290ZnMgb24gfjMwIGRpZmZlcmVudCBydjMyIGNvbmZpZ3MKPiA+Cj4g
PiBBbmQgSSBydW4gTFRQL2Z1bGwga3NlbGZ0ZXN0cy9wZXJmIHRlc3RzdWl0ZSBvbiBhIHdlZWts
eSBiYXNpcyBvbgo+ID4gZXZlcnkgcmMuIEFsbCB0aGlzIHZhbGlkYXRpb24gaXMgZG9uZSBvbiBx
ZW11Lgo+ID4KPiA+IFRoZSBwYXRjaCBpcyBmdW5jdGlvbmFsLCBpdCAic2ltcGx5IiBmbHVzaGVz
IHRoZSB3aG9sZSBUTEIgaW5zdGVhZCBvZgo+ID4gYSBmZXcgZW50cmllcywgc28gdGhlIG9ubHkg
d2F5IHRvIGNhdGNoIHRoYXQgd291bGQgaGF2ZSBiZWVuIGEKPiA+IHBlcmZvcm1hbmNlIHJlZ3Jl
c3Npb24uIEJ1dCBnaXZlbiBpdCBvbmx5IHJ1bnMgb24gcWVtdSwgaXQgd291bGQgaGF2ZQo+ID4g
YmVlbiBoYXJkIHRvIGNhdGNoIGFueSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIHNpbmNlIHRoYXQg
aW52b2x2ZXMgdGhlCj4gPiBUTEIuCj4gPgo+ID4gQFl1bmh1aTogUGxlYXNlIGxldCBtZSBrbm93
IGhvdyBJIHNob3VsZCB2YWxpZGF0ZSBteSBwYXRjaGVzIGJldHRlci4KPgo+Cj4gQFl1bmh1aTog
QW5kIEJUVywgd2UgbGFjayByZXZpZXdlcnMsIHNvIGZlZWwgZnJlZSB0byBoZWxwIDspCgpPa2F5
LCBpZiB5b3UgZG9u4oCZdCBtaW5kLCBJIHdpbGwgYWxzbyByZXZpZXcgdGhlIFJJU0MtViBUTEIg
cmVsYXRlZApwYXRjaGVzIGxhdGVyLgpCVFcsIEkgbWFpbGVkIGEgcGF0Y2ggIlJJU0MtVjogYWRk
IHVuaXByb2Nlc3NvciBmbHVzaF90bGJfcmFuZ2UoKQpzdXBwb3J0IiwgYW5kIHBsZWFzZSBoZWxw
IG1lIHJldmlldyBpdCwgdGhhbmsgeW91IH4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
