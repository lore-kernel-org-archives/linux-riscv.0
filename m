Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C452CE7C4DA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fis7+fQ3tl1iRm/9QmbYzYFUN2flQ5Dqi0cF3QQiDlc=; b=LCB2AIGBGLpZ6K
	MhQRDVsxu2w6E5U40bfIVsXQ//ZFI8R5CupA5JaG0IILvMHkR6SLVCzVLbFb+5nMZCqbSHPPUzROC
	EXhfbBjoVQCt42/Vczd0RuJAsB5v/qRUCyWXzfBzYk/SFH0zGK12O6ToQ3uIgrlC5Z5MhPpXg5c/v
	0IbhbnWDpYr82LIITIh/H7Og7Xmfgx+zWA+XrMA5C5PeOzGAxy7g9vefspDjYJV0DhRN8/Zj4V15o
	rDZVjckJULjxwhLEIE6A8xE0cRXuGrDcshp4QMECuF5as/Ezz/H4U2rLs15STb+FwS/1CytHSSD6e
	kzn8I0l0ncfrF+i7eMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4QB-000RP1-10;
	Wed, 04 Oct 2023 16:08:23 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4Q8-000ROJ-2G
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 16:08:22 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso1790921a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696435698; x=1697040498; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArAGPHgh3ozAFw+P3T3leViQVG79Y2xBPqOZ8Wv+fnM=;
        b=HIieVek7AjOJhUKFgdGucnZGoz+zOMI0U48NGIo29py2lYygHPlnQqTQLoISsurYuq
         ovamD03KLDKtvGM4oV+4n6b+8jobZjEp5ef4hTBbbkIT9hT1GgOAYUmi9DLBKXF/KPhw
         AXveGaaWVIDGh35V0ykN3ihFdAoRv97jOnYEx8Kmg1+jWQwzAyyHqflhDmuE0DqS3FCt
         m0me+T1oZRi+uBxC1BKJk2yQFmiPH99N1ks5K6V2hGdqXt7KruCnR51uHXL6VyzxOmJo
         DGQUvLW/Y5FAiig+aj6YGN86r9aWE62kjC6Z2IqaHJV/BnwSWS8KHAb6+yJjjeu/nLn0
         vMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696435698; x=1697040498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArAGPHgh3ozAFw+P3T3leViQVG79Y2xBPqOZ8Wv+fnM=;
        b=Jysp7eRXcAm5Q1L8S46DnP55X843NIs81/uDQ8ah93xeCkeIxM+Qhb295sJDEH/EpI
         Txda9aZ0C6Uggpq8vfKKxKCwMMR1VulZEEONUV4HI9GNKQ8DAvaRFtnQcGQM5mi8uDgR
         MEqXVIpLoYjipu8HVYI1YZIx9R6cUrSHJy7fmH3pyYTtzHySlrN3WOvdJHjbMXBGPzAU
         XggRmANoYfDjinJJOJTfjqLQvY+MRbMXz5seYQy/IV/xEMHvNg82eM83GE9eC3u+vKPF
         e5gCPzJ93sIP/zI6nstC07TRw6QUBRivu78fuQHEbiqgJYs8fnW3/K/o9Jw46i/FfRNh
         RBZQ==
X-Gm-Message-State: AOJu0YxkQcKURfALh03j3O6IAGc8wMMP3KBGF7yNsrdqx71J4R4hnQav
	pR24czYhf64RMA0r9tCAdlVj/SRY7fIVKd46v2TugA==
X-Google-Smtp-Source: AGHT+IFahlwd2MGDSD/UYYt8bxNZKia47kJFK5G12tNZu0xaYee3sS1go2QSPWZJ5H6NX/KCiQ+9Eb5A9aLjQZvveHs=
X-Received: by 2002:a17:90a:b891:b0:273:441a:dae6 with SMTP id
 o17-20020a17090ab89100b00273441adae6mr2549660pjr.19.1696435698141; Wed, 04
 Oct 2023 09:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230926102801.1591126-1-dunaev@tecon.ru> <CAK9=C2UiBNQtv0Q2yJMKqc5pMX_jam+ZmfRz3Rme0ZYuqN68HA@mail.gmail.com>
 <86il7mofmm.wl-maz@kernel.org> <CAK9=C2UUQ+ChueJVs+AnY0oCTb1zSv7qOCTijSchwxiMspX74w@mail.gmail.com>
 <86cyxuo128.wl-maz@kernel.org>
In-Reply-To: <86cyxuo128.wl-maz@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 4 Oct 2023 21:38:06 +0530
Message-ID: <CAK9=C2WcOy0_iEF7EF0LwjSRqVf2bbFaVNbxPXa=0OJtUkoVMw@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-intc: Mark INTC nodes for secondary CPUs as initialized.
To: Marc Zyngier <maz@kernel.org>
Cc: Dmitry Dunaev <dunaev@tecon.ru>, dunaich@mail.ru, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_090820_741435_A7D03975 
X-CRM114-Status: GOOD (  39.87  )
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

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA5OjAy4oCvUE0gTWFyYyBaeW5naWVyIDxtYXpAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIDA0IE9jdCAyMDIzIDE1OjU5OjMzICswMTAwLAo+IEFu
dXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQs
IE9jdCA0LCAyMDIzIGF0IDM6NDjigK9QTSBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPiB3
cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCAyNiBTZXAgMjAyMyAxMTozNjozMSArMDEwMCwKPiA+
ID4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gT24gVHVlLCBTZXAgMjYsIDIwMjMgYXQgMzo1OeKAr1BNIERtaXRyeSBEdW5hZXYgPGR1
bmFldkB0ZWNvbi5ydT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIGN1cnJlbnQgTGlu
dXggZHJpdmVyIGlycS1yaXNjdi1pbnRjIGluaXRpYWxpemUgSVJRIGRvbWFpbiBvbmx5IG9uY2Us
Cj4gPiA+ID4gPiB3aGVuIGluaXQgZnVuY3Rpb24gY2FsbGVkIG9uIHByaW1hcnkgaGFydC4gSW4g
b3RoZXIgY2FzZXMgbm8gSVJRIGRvbWFpbiBpcwo+ID4gPiA+ID4gY3JlYXRlZCBhbmQgbm8gb3Bl
cmF0aW9uIG9uIGludGVycnVwdC1jb250cm9sbGVyIG5vZGUgaXMgcGVyZm9ybWVkLgo+ID4gPiA+
ID4gVGhpcyBpcyBjYXVzZSBvZiB0aGF0IG5vIGNvbW1vbiBMaW51eCBkcml2ZXIgY2FuIHVzZSBw
ZXItY3B1IGludGVycnVwdHMKPiA+ID4gPiA+IG1hcHBlZCB0byBzZXZlcmFsIENQVXMgYmVjYXVz
ZSBmd25vZGUgb2Ygc2Vjb25kYXJ5IGNvcmVzIElOVEMgaXMgbm90Cj4gPiA+ID4gPiBtYXJrZWQg
YXMgaW5pdGlhbGl6ZWQuIFRoaXMgZGV2aWNlIGlzIGFsd2F5cyB3aWxsIGJlIG1hcmtlZCBhcyBk
ZWZlcnJlZC4KPiA+ID4gPiA+IEZvciBleGFtcGxlIHRoZSBzeXN0ZW0gd2l0aCBkZXZpY2V0cmVl
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgIGNwdTA6IGNwdUAwIHsKPiA+ID4gPiA+ICAgICAgICAg
Y3B1MF9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7Cj4gPiA+ID4gPiAgICAgICAgICAgICBp
bnRlcnJ1cHQtY29udHJvbGxlcjsKPiA+ID4gPiA+ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSBy
aXNjdixjcHUtaW50YzsKPiA+ID4gPiA+ICAgICAgICAgfTsKPiA+ID4gPiA+ICAgICB9Owo+ID4g
PiA+ID4KPiA+ID4gPiA+ICAgICBjcHUxOiBjcHVAMSB7Cj4gPiA+ID4gPiAgICAgICAgIGNwdTFf
aW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgewo+ID4gPiA+ID4gICAgICAgICAgICAgaW50ZXJy
dXB0LWNvbnRyb2xsZXI7Cj4gPiA+ID4gPiAgICAgICAgICAgICBjb21wYXRpYmxlID0gcmlzY3Ys
Y3B1LWludGM7Cj4gPiA+ID4gPiAgICAgICAgIH07Cj4gPiA+ID4gPiAgICAgfTsKPiA+ID4gPiA+
Cj4gPiA+ID4gPiAgICAgYnVzZXJyIHsKPiA+ID4gPiA+ICAgICAgICAgY29tcGF0aWJsZSA9IHJp
c2N2LGJ1c2VycjsKPiA+ID4gPiA+ICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmY3B1
MF9pbnRjIDE2ICZjcHUxX2ludGMgMTY+Owo+ID4gPiA+ID4gICAgIH07Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gd2lsbCBhbHdheXMgcmVwb3J0ICdidXNlcnInIG5vZGUgYXMgZGVmZXJyZWQgd2l0aG91
dCBjYWxsaW5nIGFueQo+ID4gPiA+ID4gYnVzIHByb2JlIGZ1bmN0aW9uLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFRoaXMgcGF0Y2ggd2lsbCBtYXJrIGFsbCBzZWNvbmRhcnkgbm9kZXMgcGFzc2VkIHRv
IGlycS1yaXNjdi1pbnRjCj4gPiA+ID4gPiBkcml2ZXIgaW5pdCBmdW5jdGlvbiBhcyBpbml0aWFs
aXplZCB0byBiZSBhYmxlIHRvIGFjdCBhcyBjb3JyZWN0Cj4gPiA+ID4gPiBJUlEgcGhhbmRsZSBu
b2RlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBEdW5hZXYgPGR1
bmFldkB0ZWNvbi5ydT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGRyaXZlcnMvaXJxY2hpcC9p
cnEtcmlzY3YtaW50Yy5jIHwgOCArKysrKystLQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIGIvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbnRjLmMKPiA+ID4gPiA+IGluZGV4IDRhZGVlZTFiYzM5MS4uYzAxYTRlOGQ0
OTgzIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRj
LmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gPiA+
ID4gPiBAQCAtMTU1LDggKzE1NSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRjX2lu
aXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+ID4gPiA+ID4gICAgICAgICAgKiBmb3IgZWFj
aCBJTlRDIERUIG5vZGUuIFdlIG9ubHkgbmVlZCB0byBkbyBJTlRDIGluaXRpYWxpemF0aW9uCj4g
PiA+ID4gPiAgICAgICAgICAqIGZvciB0aGUgSU5UQyBEVCBub2RlIGJlbG9uZ2luZyB0byBib290
IENQVSAob3IgYm9vdCBIQVJUKS4KPiA+ID4gPiA+ICAgICAgICAgICovCj4gPiA+ID4gPiAtICAg
ICAgIGlmIChyaXNjdl9oYXJ0aWRfdG9fY3B1aWQoaGFydGlkKSAhPSBzbXBfcHJvY2Vzc29yX2lk
KCkpCj4gPiA+ID4gPiArICAgICAgIGlmIChyaXNjdl9oYXJ0aWRfdG9fY3B1aWQoaGFydGlkKSAh
PSBzbXBfcHJvY2Vzc29yX2lkKCkpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBmd25vZGVf
ZGV2X2luaXRpYWxpemVkKG9mX25vZGVfdG9fZndub2RlKG5vZGUpLCB0cnVlKTsKPiA+ID4gPgo+
ID4gPiA+IFRoZXJlIGlzIGFscmVhZHkgYSBwYXRjaCBvbiBMS01MIHRvIGFkZHJlc3MgdGhpcy4K
PiA+ID4gPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9rZXJuZWwvbXNnNDkyOTg4Ni5o
dG1sCj4gPiA+Cj4gPiA+IElmIHRoaXMgaXMgYSBmaXgsIHdoeSBpcyBpdCBidXJpZWQgaW4gYSBo
dWdlIHNlcmllcyBhbmQgbm90IGJyb3VnaHQKPiA+ID4gZm9yd2FyZCBhcyBhbiBpbmRlcGVuZGVu
dCBmaXggdGhhdCBuZWVkcyB0byBiZSBwaWNrZWQgZWFybHk/Cj4gPgo+ID4gRG1pdHJ5IHNhdyB0
aGlzIGlzc3VlIGluIGEgdG90YWxseSBkaWZmZXJlbnQgY29udGV4dCB3aGljaCBpcyBub3QKPiA+
IHJlcHJvZHVjaWJsZSB3aXRoIGV4aXN0aW5nIERUUyBmaWxlcyBpbiBrZXJuZWwgc291cmNlcy4K
Pgo+IEkgaG9wZSB5b3UncmUgbm90IHN1Z2dlc3RpbmcgdGhhdCBvbmx5IHRoZSBEVHMgdGhhdCBh
cmUgcHJlc2VudCBpbiB0aGUKPiBrZXJuZWwgdHJlZSBhcmUgdmFsaWQuIEJlY2F1c2UgYXMgZmFy
IGFzIEknbSBjb25jZXJuLCB0aGUgRFRzIGluIHRoZQo+IGtlcm5lbCB0cmVlIGFyZSBvbmx5IHNv
bWUgKmV4YW1wbGVzKiwgYW5kIG5vdCBhIHJlZmVyZW5jZS4KCkkgYW0gb25seSBzYXlpbmcgd2h5
IHRoaXMgaXNzdWUgd2FzIG5vdCBvYnNlcnZlZCBiZWZvcmUuCgo+Cj4gSSBmdWxseSBleHBlY3Qg
dGhlIHZhc3QgbWFqb3JpdHkgb2YgRFRzIHRvIGxpdmUgKm91dHNpZGUqIG9mIHRoZQo+IGtlcm5l
bCB0cmVlLCBwcm92aWRlZCBieSB0aGUgZmlybXdhcmUsIGFuZCBuZXZlciB1cHN0cmVhbWVkLiBX
b3VsZCB5b3UKPiBleHBlY3QgZXZlcnkgUEMgdmVuZG9yIHRvIHVwc3RyZWFtIHRoZWlyIEFDUEkg
dGFibGVzPwoKSSBhZ3JlZS4gV2UgY2FuJ3QgZXhwZWN0IGFsbCB2ZW5kb3JzIHRvIHN1Ym1pdCBE
VCB0byBrZXJuZWwgc291cmNlcy4KCj4KPiA+IFRoaXMgaXNzdWUgb25seSBtYW5pZmVzdHMgd2hl
biBzb21lIHBsYXRmb3JtIGRyaXZlciBEVCBub2RlCj4gPiBwb2ludHMgdG8gdGhlIHBlci1IQVJU
IElOVEMgbm9kZXMuIEZvciBleGFtcGxlLCBSSVNDLVYKPiA+IGlycWNoaXAgZGV2aWNlIERUIG5v
ZGVzIHBvaW50IHRvIHBlci1IQVJUIElOVEMgbm9kZXMuCj4KPiBJcyB0aGlzIGNvbmZpZ3VyYXRp
b24gbGVnYWwgb3Igbm90IGFzIHBlciB0aGUgRFQgYmluZGluZz8gSSBkb24ndCBzZWUKPiBhbnl0
aGluZyB0aGF0IHN1Z2dlc3RzIGl0IGlzbid0IGxlZ2FsLCBhbmQgaGF2aW5nIHBlci1DUFUgaW50
ZXJydXB0cwo+IGlzbid0IGV4YWN0bHkgYSBuZXcgdGhpbmcuCgpUaGlzIGlzIGEgcGVyZmVjdCBs
ZWdhbCBjb25maWd1cmF0aW9uIGluIHRoZSBSSVNDLVYgd29ybGQuIFdlIGhhdmUKc2ltaWxhciBE
VCBiaW5kaW5nIGZvciBBSUEgZHJpdmVycyBhcyB3ZWxsLgoKPgo+ID4gQ3VycmVudGx5LCBhbGwg
UklTQy1WIGlycWNoaXAgZHJpdmVycyAoSU5UQyBhbmQgUExJQykgYXJlIHByb2JlZAo+ID4gZWFy
bHkgKG5vdCBhcyBwbGF0Zm9ybSBkcml2ZXJzKSBzbyB3ZSBkb24ndCBzZWUgdGhpcyBpc3N1ZSB3
aXRoCj4gPiBleGlzdGluZyBpcnFjaGlwIGRyaXZlcnMuCj4KPiBZb3UgZG9uJ3QsIGJ1dCBEaW1p
dHJ5IGRvZXMuIFdobyB3aW5zPwoKSSBhbSB0b3RhbGx5IGZpbmUgdGFraW5nIFBBVENIMyBvZiB0
aGUgTGludXggQUlBIHYxMCBzZXJpZXMgYXMgYQpmaXggUEFUQ0ggZm9yIDYuNi1yY1guIFRoZSBQ
QVRDSDMgaXMgcHJldHR5IHNlbGYgY29udGFpbmVkIGFuZApkb2VzIG5vdCBkZXBlbmQgb24gYW55
IG90aGVyIFBBVENIIG9mIExpbnV4IEFJQSB2MTAgc2VyaWVzLgoKRG8geW91IHdhbnQgbWUgdG8g
cmUtc2VuZCBpdCBhcyBhbiBpbmRpdmlkdWFsIFBBVENIID8KClJlZ2FyZHMsCkFudXAKCj4KPiAg
ICAgICAgIE0uCj4KPiAtLQo+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dy
ZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
