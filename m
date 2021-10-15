Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6688C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 14:14:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A96E460FDA
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 14:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A96E460FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPFFnAnlltVsiiIbgfzV1K6tkxHOjR5V0le68d/b3iA=; b=YEiLMF8cZbVFb5
	zFRV8u5aA/l1kuPef2jkyZfxVQuwHa4M/xamYGqPf9iSno67pELUMVbUYo/s2hfEPrcTRi2pRAWxH
	ZzjaQT+Ol35PpHJ+CNeR+sdf5X/5196ZsuGK9aZT9vbVHsosXMESk926b+8A9y0pkopBApKy1Cy6H
	03hXY5quSWbO3UoPHww5s4kRLeaEA8vU4eip4XA00dacLWwakRiQqiIFPQFTOiT/b5CbZcEbD17YE
	DPO7kX8xVEZBhbUMAEL60BiIUoI3r8h3M2Bg8o6H8Wi/9GCWtTcoreqoY8qdk9SZ3Sne7AS2kOEYA
	555kn0Gqb3eZdUgU/T4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNyQ-007V0S-No; Fri, 15 Oct 2021 14:14:14 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbNXI-007Lgi-Le; Fri, 15 Oct 2021 13:46:15 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id r184so4177949ybc.10;
 Fri, 15 Oct 2021 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UMmMwoh0d9xOMBuf6Cb27qJgX9NIbwQbOxUehDVoXW4=;
 b=mSDy6QRxK1GWCZFRze2z/WPjTfj8t295fUbQbf1kfgfC1DUUqn1r6OUB82lPqEziqO
 aPvbyCh7Fdmn7+U2T9aXBbvBtchCJWUvjWlTV+h4GFPiyaj9eOjPDeaevyfDx+XswY9O
 qlsP/N0k3ISA1BsIf11JnASBHQ+NVZOu6UIordsImPMmoVJ2eY/Mu64O44OsXQNgP3Uu
 GAwVOrPFCVDcaz9D9GLZ36hsUqoxlc4cNtH0hVd6r/OJGWnboEInE6zKcQGGMklOLgBs
 5qXHsjF3iMMJ/cwwo/tgbfTSCYNdGAYh4RpqZn+X97Ho5avE4EmgJ0pgCpZvhtcZcV2d
 nePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UMmMwoh0d9xOMBuf6Cb27qJgX9NIbwQbOxUehDVoXW4=;
 b=esiZeg/Kg38ot8E8GxUxwHo875scfCWM2OhH21BbubG5R8s3Mt5uMim8dvq1Q6jQ9g
 udJcD/+yOAfX4PwPUryPH5wJD6rRRm0mqu5urDSFj+/GefqTeH4W9WPeA66ae+ymeh7S
 onT8hT8G2TAybt+KvdyH+DQf4uttmXXFRR8ghH9b9nw0v03zl1ROdOnD4rTeV1ri7m3R
 uoMDf+fD8qbsBkpHkjUOZcK4VHp55NyJcd6Hml6aVAN1+lDgudxLs14/NnPfd1Mztex1
 egcNytwgyod5uhp/lUr3BofRWx42K9dKq1YXSHVaC787aOZ4YE6WmgItNG8IVU4eLVRM
 Nk9Q==
X-Gm-Message-State: AOAM533dLsyY7NmzXhNxC44m3jFKqlRkTMWTVGxCtvHzg+W/m2czujoa
 3WKXL0U7OhiB+YPfDBXxV/KrDJ5gC61acPs3TJw=
X-Google-Smtp-Source: ABdhPJwfK40oo9nWMVG1fm09vk4sNWiVNDk0gjrfy78SzbWYqPeXgWz5q5WvAASkenwS0WeJTbIxH9crZgrqZMEVb7k=
X-Received: by 2002:a25:3843:: with SMTP id f64mr12590756yba.313.1634305571737; 
 Fri, 15 Oct 2021 06:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
 <CAEUhbmUSmi9mbiHpatBjGgRjrtyJPms9BRmyBPs5BWeVb7n1Nw@mail.gmail.com>
 <49af3dc8-0d1e-e82f-6df2-2bf8338acd3a@canonical.com>
 <D976B0F9-6AE4-4C04-8D52-75B24D6E4359@jrtc27.com>
In-Reply-To: <D976B0F9-6AE4-4C04-8D52-75B24D6E4359@jrtc27.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Oct 2021 21:46:01 +0800
Message-ID: <CAEUhbmWFAJpVxproxX-iH3Tj7jHGqu_SwN6-tGuxqi7NXVhOhA@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Guo Ren <guoren@linux.alibaba.com>, Xiang W <wxjstz@126.com>, 
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_064612_773529_6E922E66 
X-CRM114-Status: GOOD (  23.66  )
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

T24gRnJpLCBPY3QgMTUsIDIwMjEgYXQgODoxNSBQTSBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpy
dGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMTUgT2N0IDIwMjEsIGF0IDEyOjU0LCBIZWlucmljaCBT
Y2h1Y2hhcmR0IDxoZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+ID4K
PiA+IE9uIDEwLzE1LzIxIDEyOjE0LCBCaW4gTWVuZyB3cm90ZToKPiA+PiBPbiBGcmksIE9jdCAx
NSwgMjAyMSBhdCA2OjA5IFBNIEhlaW5yaWNoIFNjaHVjaGFyZHQKPiA+PiA8aGVpbnJpY2guc2No
dWNoYXJkdEBjYW5vbmljYWwuY29tPiB3cm90ZToKPiA+Pj4KPiA+Pj4gVGhlIENMSU5UIGluIHRo
ZSBULUhFQUQgOXh4IHByb2Nlc3NvcnMgZG8gbm90IHN1cHBvcnQgNjRiaXQgbW1pbyBhY2Nlc3Mg
dG8KPiA+Pj4gdGhlIE1USU1FUiBkZXZpY2UuIFRoZSBjdXJyZW50IHNjaGVtYSBkb2VzIG5vdCBh
bGxvdyB0byBzcGVjaWZ5IHRoaXMuCj4gPj4+Cj4gPj4+IE9wZW5TQkkgY3VycmVudGx5IHVzZXMg
YSBwcm9wZXJ0eSAnY2xpbnQsaGFzLW5vLTY0Yml0LW1taW8nIHRvIGluZGljYXRlIHRoZQo+ID4+
PiByZXN0cmljdGlvbi4gU2FtdWFlbCBIb2xsYW5kIHN1Z2dlc3RlZCBpbgo+ID4+PiBsaWI6IHV0
aWxzL3RpbWVyOiBVc2Ugc3RhbmRhcmQgcHJvcGVydHkgdG8gc3BlY2lmeSAzMi1iaXQgSS9PCj4g
Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9zbWFldWwvb3BlbnNiaS9jb21taXQvYjk1ZTljZjdjZjkz
YjBhZjE2ZmM4OTIwNDM3OGJjNTlmZjMwMDA4ZQo+ID4+PiB0byB1c2UgInJlZy1pby13aWR0aCA9
IDw0PjsiIGFzIHRoZSByZWctaW8td2lkdGggcHJvcGVydHkgaXMgZ2VuZXJhbGx5IHVzZWQKPiA+
Pj4gaW4gdGhlIGRldmljZXRyZWUgc2NoZW1hIGZvciBzdWNoIGEgY29uZGl0aW9uLgo+ID4+Pgo+
ID4+PiBBIHJlbGVhc2UgY2FuZGlkYXRlIG9mIHRoZSBBQ0xJTlQgc3BlY2lmaWNhdGlvbiBpcyBh
dmFpbGFibGUgYXQKPiA+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFjbGludC9y
ZWxlYXNlcwo+ID4+Pgo+ID4+PiBBZGQgcmVnLWlvLXdpZHRoIGFzIG9wdGlvbmFsIHByb3BlcnR5
IHRvIHRoZSBTaUZpdmUgQ29yZSBMb2NhbCBJbnRlcnJ1cHRvci4KPiA+Pj4KPiA+Pj4gU2lnbmVk
LW9mZi1ieTogSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmlj
YWwuY29tPgo+ID4+PiAtLS0KPiA+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy90aW1lci9zaWZpdmUsY2xpbnQueWFtbCB8IDcgKysrKysrKwo+ID4+PiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gPj4+IGlu
ZGV4IGEzNTk1MmY0ODc0Mi4uMjY2MDEyZDg4N2I1IDEwMDY0NAo+ID4+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiA+Pj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGlu
dC55YW1sCj4gPj4+IEBAIC00MSw2ICs0MSwxMyBAQCBwcm9wZXJ0aWVzOgo+ID4+PiAgICByZWc6
Cj4gPj4+ICAgICAgbWF4SXRlbXM6IDEKPiA+Pj4KPiA+Pj4gKyAgcmVnLWlvLXdpZHRoOgo+ID4+
PiArICAgIGRlc2NyaXB0aW9uOiB8Cj4gPj4+ICsgICAgICBTb21lIENMSU5UIGltcGxlbWVudGF0
aW9ucywgZS5nLiBvbiB0aGUgVC1IRUFEIDl4eCwgb25seSBzdXBwb3J0Cj4gPj4+ICsgICAgICAz
MmJpdCBhY2Nlc3MgZm9yIE1USU1FUi4KPiA+Pj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiA+Pj4gKyAgICBjb25zdDogNAo+ID4+IEJ1dCB0aGlz
IGlzIG5vdCBhICJzaWZpdmUsY2xpbnQiIGFueXdheS4gU2hvdWxkIHRoZXJlIGJlIGEgbmV3Cj4g
Pj4gZHQtYmluZGluZ3MgZm9yIFQtSGVhZCBjbGludCB2YXJpYW50Pwo+ID4KPiA+IEkgYXNzdW1l
IGJ5IG5ldyBkdC1iaW5kaW5ncyB2YXJpYW50IHlvdSBtZWFuOiBBZGQgYSBuZXcgY29tcGF0aWJs
ZSBzdHJpbmcgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2
ZSxjbGludC55YW1sLgo+ID4KPiA+IFRoZSB2ZW5kb3IgRGViaWFuIGltYWdlIHVzZXM6Cj4gPiBj
b21wYXRpYmxlID0gInthbGx3aW5uZXIsc3VuMjBpLWQxLWNsaW50IiwgInNpZml2ZSxjbGludDDi
gJ19Owo+Cj4gSSBhc3N1bWUgQmluIG1lYW5zIHRvIHN0b3AgY2FsbGluZyBpdCBhIHNpZml2ZSxj
bGludDAgYW5kIGluc3RlYWQgaGF2ZQo+IHNvbWV0aGluZyBsaWtlCj4KPiAgICAgImFsbHdpbm5l
cixzdW4yMGktZDEtY2xpbnQiLCAidGhlYWQsY2xpbnQwIgoKWWVwLCB0aGF0J3Mgd2hhdCBJIHdh
bnRlZCB0byBzZWUuIFNvcnJ5IGZvciBub3QgYmVpbmcgY2xlYXIuIFRoZQpULUhlYWQgQ0xJTlQg
aXMgZGVmaW5pdGVseSBub3QgY29tcGF0aWJsZSB3aXRoICJzaWZpdmUsY2xpbnQwIi4KCj4gYXMg
aXMgYmVpbmcgZG9uZSBmb3IgdGhlaXIgbm9uLWNvbmZvcm1pbmcgUExJQy4gSXTigJlzIHdvcnRo
IHBvaW50aW5nIG91dAo+IHRoYXQgdGhlIHNhbWUgaXMgdHJ1ZSBoZXJlOyB0aGUgU2lGaXZlIENM
SU5UIHN1cHBvcnRzIDY0LWJpdCBhY2Nlc3Nlcwo+IG9uIFJWNjQsIHNvIHRoaXMgaXMgbm90IGNv
bXBhdGlibGUgd2l0aCBhIFNpRml2ZSBDTElOVC4gTW9yZW92ZXIsIHRoZQo+IFJJU0MtViBzcGVj
IHdhcyBjbGVhcmx5IHdyaXR0ZW4gaW4gYSB3YXkgdGhhdCBpbnRlbmRlZCA2NC1iaXQgYWNjZXNz
ZXMKPiB0byBiZSBzdXBwb3J0ZWQgZm9yIFJWNjQsIHRob3VnaCB3YXMgbm90IGNvbXBsZXRlbHkg
ZXhwbGljaXQgYWJvdXQKPiB0aGF0LCB3aGljaCBoYXMgbm93IGJlZW4gcmVzb2x2ZWQgKHNlZQo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL2lzc3Vlcy82MzkpLCBz
byB0aGlzIENMSU5UCj4gdmlvbGF0ZXMgdGhlIG9idmlvdXMgaW50ZW50IG9mIHRoZSBwcmUtMS4x
MiBwcml2aWxlZ2VkIHNwZWNzIChzZWUKPiBBbmRyZXfigJlzIG1lc3NhZ2UgaW4gdGhlIGlzc3Vl
LCB3aGljaCBhZ3JlZXMgd2l0aCBteSByZWFkaW5nKS4KClJlZ2FyZHMsCkJpbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
