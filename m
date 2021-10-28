Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AE0C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:10:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6432E61038
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6432E61038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=w5zFe53/AT1hbiyog4UesuG0mbtuxcKzVqsg/CWfR1U=; b=LR8jSKlA1kah3Qasw65xjXxASf
	8LmFeaMO0vTPWyXO/i953bKQdo0qIhmoXQIxGqYAjis9c+WIr0+YqFjOzSDjODqrRIU5nseTpuqgl
	QZV0vQXePG7yiqHSBedFCnbP/l5hmXpHkyhAf8OUwbUs38Ug+rnk9OH0PRcTGGaxSZgdHiapLBDQU
	aL8KV/8wnl9lXyvJ98u2YD5Z3trz18QgVKM6DjVPaG8U5EIab6IPFLdjb8UNhTRwhbiZTs8/T3dpY
	XDXXZx6gHIb7x3e6/Im/m0h/AQOmUUPu64sczw9tzzEWgc1Hf07SShFBe+nN34ggOSI6xRY/0a4iv
	mmmSA1BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg72K-008N2o-PH; Thu, 28 Oct 2021 15:09:48 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg72I-008N1y-2A
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 15:09:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id m14so6244559pfc.9
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=N7Lz9MlAMZ2EGF4S5jNyBSYl14bB0H20CJuEnD/geJQ=;
 b=2uuYfs53wDiP8SOJND/mT1QmnMTq1Kvus1r7zENS40yq0e8Rq2cQndpVU5VWhK3o+m
 6JmwQXM0xnR46VZ/3ftL32FoXfce6Hi6jt7T210datbosHDW8dndLg3dBvzBb32YSyqi
 EgjgLHDrAJcCqauSzjfeAy9llX6NfTFNUwMDSWwPPQW7jr00B59kg5mfx28kAFn2nGuV
 5i0ERVPQUlmWBxEWUnU3dseyi+V70LdAYXPGFaEfNET+d7b3OyJsww9BdxwqlD7qNlne
 uPVeahnkmGPqF2Cso2ALiepQBsSLd78TXqmrBY9NIhrazNWpzz+EFSMVk3jRid1Gn7pf
 YBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=N7Lz9MlAMZ2EGF4S5jNyBSYl14bB0H20CJuEnD/geJQ=;
 b=op54uU1L2KH2YtPTlgMcX0ZypBfpaHNs8c+MjtgUL9oejgCiV9NeHc9Hiem3FElo2I
 irN4zZ6rMp7uxMnZj/RB7+mMcZQvKFWfhj4dil+ps8KEsBW6DS6Tt1Gf11R9+Fe1Yrhr
 +eQ48EKkAngfdFv4oCwBn7PSp8si1jI/0Am0Nachzo+dGUPfQfIbBjW/89XX7fanQnm3
 xiIuFGw+m0sftGHfWSa/P+0E9Oh1Nj1SpgZfSw9NdBa1udD+D7MuW/bFFIfNWmngEM1D
 6gGDr5V4lTrVDmiQHwnX8GEZ0vRyei9m5aAokwYEqiJWXfGGeuFD88/C/bNL4z/PqE8O
 Rx3g==
X-Gm-Message-State: AOAM532n/9RERYYVdRh0/YTSC6EesDY/vneziUY1SWcXwlJ9BUGXrwcC
 TwsiZJmhajsPIPHXJtrxuU7Ojw==
X-Google-Smtp-Source: ABdhPJwRRDZyKhXpNUtdLZyEV4kcEI+U8JXXFrleCFGmkM6ObKtrEsBtJfXxxHCTLi6yvm+nwByeJg==
X-Received: by 2002:a05:6a00:158d:b0:47c:2341:264f with SMTP id
 u13-20020a056a00158d00b0047c2341264fmr4997658pfk.80.1635433784596; 
 Thu, 28 Oct 2021 08:09:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y9sm3212418pjj.6.2021.10.28.08.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:09:44 -0700 (PDT)
Date: Thu, 28 Oct 2021 08:09:44 -0700 (PDT)
X-Google-Original-Date: Thu, 28 Oct 2021 08:09:41 PDT (-0700)
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
In-Reply-To: <CAOnJCU+MSP1QdpRRGYUpen8xZU+kn3PcSMJnZnRQw-iATs8JgQ@mail.gmail.com>
CC: heiko@sntech.de, geert@linux-m68k.org, re@w6rz.net,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-51188428-41ff-4962-b548-bf514a779723@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_080946_135149_4B4C0A16 
X-CRM114-Status: GOOD (  33.63  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyNyBPY3QgMjAyMSAxNjozNDoxNSBQRFQgKC0wNzAwKSwgYXRpc2hwQGF0aXNocGF0
cmEub3JnIHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDI2LCAyMDIxIGF0IDI6MzQgQU0gSGVpa28gU3TD
vGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4+Cj4+IEFtIERpZW5zdGFnLCAyNi4gT2t0
b2JlciAyMDIxLCAxMDo1NzoyNiBDRVNUIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOgo+PiA+
IEhpIEhlaWtvLAo+PiA+Cj4+ID4gT24gVHVlLCBPY3QgMjYsIDIwMjEgYXQgMTA6NTMgQU0gSGVp
a28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4+ID4gPiBBbSBEaWVuc3RhZywg
MjYuIE9rdG9iZXIgMjAyMSwgMDg6NDQ6MzEgQ0VTVCBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZl
bjoKPj4gPiA+ID4gT24gVHVlLCBPY3QgMjYsIDIwMjEgYXQgMjozNyBBTSBSb24gRWNvbm9tb3Mg
PHJlQHc2cnoubmV0PiB3cm90ZToKPj4gPiA+ID4gPiBPbiAxMC8yNS8yMSA4OjU0IEFNLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4+ID4gPiA+ID4gPiBXaGVuIGJvb3RpbmcgYSBrZXJuZWwg
d2l0aCBDT05GSUdfTlJfQ1BVUz00IG9uIE1pY3JvY2hpcCBQb2xhckZpcmUsCj4+ID4gPiA+ID4g
PiB0aGUgNHRoIENQVSBlaXRoZXIgZmFpbHMgdG8gY29tZSBvbmxpbmUsIG9yIHRoZSBzeXN0ZW0g
Y3Jhc2hlcy4KPj4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiBUaGlzIGhhcHBlbnMgYmVjYXVzZSBQ
b2xhckZpcmUgaGFzIDUgQ1BVIGNvcmVzOiBoYXJ0IDAgaXMgYW4gZTUxLAo+PiA+ID4gPiA+ID4g
YW5kIGhhcnRzIDEtNCBhcmUgdTU0cywgd2l0aCB0aGUgbGF0dGVyIGJlY29taW5nIENQVXMgMC0z
IGluIExpbnV4Ogo+PiA+ID4gPiA+ID4gICAgLSB1bnVzZWQgY29yZSBoYXMgaGFydGlkIDAgKHNp
Zml2ZSxlNTEpLAo+PiA+ID4gPiA+ID4gICAgLSBwcm9jZXNzb3IgMCBoYXMgaGFydGlkIDEgKHNp
Zml2ZSx1NzQtbWMpLAo+PiA+ID4gPiA+ID4gICAgLSBwcm9jZXNzb3IgMSBoYXMgaGFydGlkIDIg
KHNpZml2ZSx1NzQtbWMpLAo+PiA+ID4gPiA+ID4gICAgLSBwcm9jZXNzb3IgMiBoYXMgaGFydGlk
IDMgKHNpZml2ZSx1NzQtbWMpLAo+PiA+ID4gPiA+ID4gICAgLSBwcm9jZXNzb3IgMyBoYXMgaGFy
dGlkIDQgKHNpZml2ZSx1NzQtbWMpLgo+PiA+ID4gPiA+ID4KPj4gPiA+ID4gPiA+IEkgYXNzdW1l
IHRoZSBzYW1lIGlzc3VlIGlzIHByZXNlbnQgb24gdGhlIFNpRml2ZSBmdTU0MCBhbmQgZnU3NDAK
Pj4gPiA+ID4gPiA+IFNvQ3MsIGJ1dCBJIGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoZXNlLiAgVGhl
IGlzc3VlIGlzIG5vdCBwcmVzZW50Cj4+ID4gPiA+ID4gPiBvbiBTdGFyRml2ZSBKSDcxMDAsIGFz
IHByb2Nlc3NvciAwIGhhcyBoYXJ0aWQgMSwgYW5kIHByb2Nlc3NvciAxIGhhcwo+PiA+ID4gPiA+
ID4gaGFydGlkIDAuCj4+ID4gPiA+ID4gPgo+PiA+ID4gPiA+ID4gYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1X29wcy5jIGhhczoKPj4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiAgICAgIHZvaWQgKl9fY3B1
X3VwX3N0YWNrX3BvaW50ZXJbTlJfQ1BVU10gX19zZWN0aW9uKCIuZGF0YSIpOwo+PiA+ID4gPiA+
ID4gICAgICB2b2lkICpfX2NwdV91cF90YXNrX3BvaW50ZXJbTlJfQ1BVU10gX19zZWN0aW9uKCIu
ZGF0YSIpOwo+PiA+ID4gPiA+ID4KPj4gPiA+ID4gPiA+ICAgICAgdm9pZCBjcHVfdXBkYXRlX3Nl
Y29uZGFyeV9ib290ZGF0YSh1bnNpZ25lZCBpbnQgY3B1aWQsCj4+ID4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHRhc2tfc3RydWN0ICp0aWRs
ZSkKPj4gPiA+ID4gPiA+ICAgICAgewo+PiA+ID4gPiA+ID4gICAgICAgICAgICAgIGludCBoYXJ0
aWQgPSBjcHVpZF90b19oYXJ0aWRfbWFwKGNwdWlkKTsKPj4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4g
PiAgICAgICAgICAgICAgLyogTWFrZSBzdXJlIHRpZGxlIGlzIHVwZGF0ZWQgKi8KPj4gPiA+ID4g
PiA+ICAgICAgICAgICAgICBzbXBfbWIoKTsKPj4gPiA+ID4gPiA+ICAgICAgICAgICAgICBXUklU
RV9PTkNFKF9fY3B1X3VwX3N0YWNrX3BvaW50ZXJbaGFydGlkXSwKPj4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHRhc2tfc3RhY2tfcGFnZSh0aWRsZSkgKyBUSFJFQURfU0laRSk7
Cj4+ID4gPiA+ID4gPiAgICAgICAgICAgICAgV1JJVEVfT05DRShfX2NwdV91cF90YXNrX3BvaW50
ZXJbaGFydGlkXSwgdGlkbGUpOwo+PiA+ID4gPiA+ID4KPj4gPiA+ID4gPiA+IFRoZSBhYm92ZSB0
d28gd3JpdGVzIGNhdXNlIG91dC1vZi1ib3VuZCBhY2Nlc3NlcyBiZXlvbmQKPj4gPiA+ID4gPiA+
IF9fY3B1X3VwX3tzdGFjayxwb2ludGVyfV9wb2ludGVyW10gaWYgaGFydGlkID49IENPTkZJR19O
Ul9DUFVTLgo+PiA+ID4gPiA+ID4KPj4gPiA+ID4gPiA+ICAgICAgfQo+PiA+Cj4+ID4gPiA+IGh0
dHBzOi8vcmlzY3Yub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE3LzA1L3Jpc2N2LXByaXZpbGVn
ZWQtdjEuMTAucGRmCj4+ID4gPiA+IHNheXM6Cj4+ID4gPiA+Cj4+ID4gPiA+ICAgICBIYXJ0IElE
cyBtaWdodCBub3QgbmVjZXNzYXJpbHkgYmUgbnVtYmVyZWQgY29udGlndW91c2x5IGluIGEKPj4g
PiA+ID4gICAgIG11bHRpcHJvY2Vzc29yIHN5c3RlbSwgYnV0IGF0IGxlYXN0IG9uZSBoYXJ0IG11
c3QgaGF2ZSBhIGhhcnQKPj4gPiA+ID4gICAgIElEIG9mIHplcm8uCj4+ID4gPiA+Cj4+ID4gPiA+
IFdoaWNoIG1lYW5zIGluZGV4aW5nIGFycmF5cyBieSBoYXJ0IElEIGlzIGEgbm8tZ28/Cj4+ID4g
Pgo+PiA+ID4gSXNuJ3QgdGhhdCBhbHNvIHNpbWlsYXIgb24gYWFyY2g2ND8KPj4gPiA+Cj4+ID4g
PiBPbiBhIHJrMzM5OSB5b3UgZ2V0IDAtMyBhbmQgMTAwLTEwMSBhbmQgd2l0aCB0aGUgcGFyYWdy
YXBoIGFib3ZlCj4+ID4gPiBzb21ldGhpbmcgbGlrZSB0aGlzIGNvdWxkIHZlcnkgd2VsbCBleGlz
dCBvbiBzb21lIHJpc2N2IGNwdSB0b28gSSBndWVzcy4KPj4gPgo+PiA+IFllcywgaXQgbG9va3Mg
bGlrZSBoYXJ0IElEcyBhcmUgc2ltaWxhciB0byBNUElEUnMgb24gQVJNLgo+Pgo+PiBhbmQgdGhl
eSBoYXZlIHRoZSBzZXRfY3B1X2xvZ2ljYWxfbWFwIGNvbnN0cnVjdCB0byBtYXAgaHdpZHMKPj4g
dG8gYSBjb250aW51b3VzIGxpc3Qgb2YgY3B1LWlkcy4KPj4KPj4gU28gd2l0aCBoYXJ0aWRzIG5v
dCBiZWluZyBuZWNlc3NhcmlseSBjb250aW51b3VzIHRoaXMgbG9va3MgbGlrZQo+PiByaXNjdiB3
b3VsZCBuZWVkIGEgc2ltaWxhciBtZWNoYW5pc20uCj4+Cj4KPiBSSVNDLVYgYWxyZWFkeSBoYXMg
YSBzaW1pbGFyIG1lY2hhbmlzbSBjcHVpZF90b19oYXJ0aWRfbWFwLiBMb2dpY2FsCj4gY3B1IGlk
cyBhcmUgY29udGludW91cwo+IHdoaWxlIGhhcnRpZCBjYW4gYmUgc3BhcnNlLgo+Cj4gVGhlIGlz
c3VlIGhlcmUgaXMgdGhhdCBfX2NwdV91cF9zdGFjay90YXNrX3BvaW50ZXIgYXJlIHBlciBoYXJ0
IGJ1dAo+IGFycmF5IHNpemUgZGVwZW5kcyBvbiB0aGUgTlJfQ1BVcwo+IHdoaWNoIHJlcHJlc2Vu
dHMgdGhlIGxvZ2ljYWwgQ1BVLgo+Cj4gVGhhdCdzIHdoeSwgaGF2aW5nIGEgbWF4aW11bSBudW1i
ZXIgb2YgaGFydGlkcyBkZWZpbmVkIGluIGNvbmZpZyB3aWxsCj4gYmUgaGVscGZ1bC4KCkkgZG9u
J3QgdW5kZXJzdGFuZCB3aHkgd2UnZCBoYXZlIGJvdGg6IGlmIHdlIGNhbid0IGZpbmQgYSBDUFUg
bnVtYmVyIGZvciAKYSBoYXJ0LCB0aGVuIGFsbCB3ZSBjYW4gZG8gaXMganVzdCBsZWF2ZSBpdCBv
ZmZsaW5lLiAgV291bGRuJ3QgaXQgYmUgCnNpbXBsZXIgdG8ganVzdCByZWx5IG9uIE5SX0NQVVM/
ICBXZSdsbCBuZWVkIHRvIGZpeCB0aGUgY3Jhc2hlcyBvbiAKb3ZlcmZsb3dzIGVpdGhlciB3YXku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
