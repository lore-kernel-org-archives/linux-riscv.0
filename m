Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56498C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 00:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdyWWLBqlIeET+Ga3KJixp8dHQbl6qDgTYV9IRJ8GrM=; b=B/1/8hiq+BDwtZ
	dgMo8YYaEZDzHsDeEXTRA9n28pEwv4GYfYJ1T3f2oDsgUYRwo3eXU9Kp9C0lCdXQykx9sfrcu6XBf
	vTI0kaC0iS+KnjYi1WS2tWdMPD31qtWcSStH8ye/KCIyCDzwjXtfcRtJpRrRtivDZmGJJsmyqxWpn
	PhMrdFT5cksPMBGPG6Yp9AKm99wry/baXBQJ+4oIAzbWR3I3qQZoiyJgpYDesrVGWNkUPX7ZUyduB
	MCqnRYrAph+zHR3PNrns4SsTXl4UjMX9AQ+tYnSqsRa11kZ1YdSmtrG6tJYEVrpVI4Hfzqfy+IIqo
	5OnOSE+YSbOGQCPosQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1Y7-00D53X-BT; Thu, 26 May 2022 00:40:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1Xu-00D4yx-RU; Thu, 26 May 2022 00:40:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 629F5B81EC8;
	Thu, 26 May 2022 00:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF13C3411F;
	Thu, 26 May 2022 00:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653525607;
	bh=XbYpsC9yEq2qbfVcCMnpASOsc0x6dM1zetw0N7lzPwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OzeAYiRZdsB0yXNS0g4T0S862JWB2B/LUQvACOo5rMGE2n7o9TZvPB27hB71zz38y
	 vo9jrOt3g7Uz6Ayo1wV41mp4/BSeoUVtantEuSKD5nAs/iu8jdCOVoUa11gVT2bdrc
	 Te2G/7HFQTTP7+EIraOOvVasWY1jJOE6CNGvIfHnnTricGNK2En6oABwY37E52bEjy
	 OerKaDd5ZbVw2Fhm6RTHF/WOyuj0HDTUusgZKY1QYwx5AzZBjQ/IDqX+0Q3Igt0ccj
	 na8+zgUeTUqSTMCBGY8rJGZE3RXEGnIg6ufUHZKVlRoUxxV42EVxFThlBwDoaMNG68
	 /qk7UI4Wse96g==
Received: by mail-vs1-f54.google.com with SMTP id i186so38435vsc.9;
        Wed, 25 May 2022 17:40:07 -0700 (PDT)
X-Gm-Message-State: AOAM530JMrwuyNzsbVJ9KxRhVEYY4ouw/c9JpKzD/fhvgrSXtUcz5I4v
	A2Nr83AtlYhqsfVQxND3G1PdzpjGKQ4Pl4li6eg=
X-Google-Smtp-Source: ABdhPJx0cJkHljwuAHpyaehwgqdzrKWDw6u17/hHUkJNA8qg9NggwxKoibBsRSciUSmCfyeKXeu5IRU/QTIMEigENhQ=
X-Received: by 2002:a67:c117:0:b0:337:a2ea:98e3 with SMTP id
 d23-20020a67c117000000b00337a2ea98e3mr8547786vsj.59.1653525606376; Wed, 25
 May 2022 17:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220322144003.2357128-1-guoren@kernel.org> <3418219.V25eIC5XRa@diego>
 <CAJF2gTTkpHLZf-+VXZE_gCn=5ZJ5FS3jOxKLVoMyL4i=baPd7Q@mail.gmail.com> <1766627.8hzESeGDPO@diego>
In-Reply-To: <1766627.8hzESeGDPO@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 26 May 2022 08:39:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRrrwDUOTqLDTxZLNnWM1LXEq4VFVB8jZPdYvnS2i0ung@mail.gmail.com>
Message-ID: <CAJF2gTRrrwDUOTqLDTxZLNnWM1LXEq4VFVB8jZPdYvnS2i0ung@mail.gmail.com>
Subject: Re: [PATCH V9 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
	linux-s390 <linux-s390@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Parisc List <linux-parisc@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_174011_225204_9C55C819 
X-CRM114-Status: GOOD (  35.68  )
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

T24gVGh1LCBNYXkgMjYsIDIwMjIgYXQgMzozNyBBTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIE1pdHR3b2NoLCAyNS4gTWFpIDIwMjIsIDE4OjA4OjIyIENF
U1Qgc2NocmllYiBHdW8gUmVuOgo+ID4gVGh4IEhlaWtvICYgR3VlbnRlciwKPiA+Cj4gPiBPbiBX
ZWQsIE1heSAyNSwgMjAyMiBhdCA3OjEwIFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2gu
ZGU+IHdyb3RlOgo+ID4gPgo+ID4gPiBBbSBNaXR0d29jaCwgMjUuIE1haSAyMDIyLCAxMjo1Nzoz
MCBDRVNUIHNjaHJpZWIgSGVpa28gU3TDvGJuZXI6Cj4gPiA+ID4gQW0gTWl0dHdvY2gsIDI1LiBN
YWkgMjAyMiwgMDA6MDY6NDYgQ0VTVCBzY2hyaWViIEd1ZW50ZXIgUm9lY2s6Cj4gPiA+ID4gPiBP
biBXZWQsIE1heSAyNSwgMjAyMiBhdCAwMTo0NjozOEFNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+
ID4gPiA+ID4gWyAuLi4gXQo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGUgcHJvYmxlbSBpcyBj
b21lIGZyb20gIl9fZGxzMydzIHZkc28gZGVjb2RlIHBhcnQgaW4gbXVzbCdzCj4gPiA+ID4gPiA+
ID4gbGRzby9keW5saW5rLmMiLiBUaGUgZWhkci0+ZV9waG51bSAmIGVoZHItPmVfcGhlbnRzaXpl
IGFyZSB3cm9uZy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEkgdGhpbmsgdGhlIHJvb3Qg
Y2F1c2UgaXMgZnJvbSBtdXNsJ3MgaW1wbGVtZW50YXRpb24gd2l0aCB0aGUgd3JvbmcKPiA+ID4g
PiA+ID4gPiBlbGYgcGFyc2VyLiBJIHdvdWxkIGZpeCB0aGF0IHNvb24uCj4gPiA+ID4gPiA+IE5v
dCBlbGYgcGFyc2VyLCBpdCdzICJhdXggdmVjdG9yIGp1c3QgcGFzdCBlbnZpcm9uW10iLiBJIHRo
aW5rIEkgY291bGQKPiA+ID4gPiA+ID4gc29sdmUgdGhpcywgYnV0IGFueW9uZSB3aG8gY291bGQg
aGVscCBkaWcgaW4gaXMgd2VsY29tZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJ
IGFtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgc2F5aW5nIGhlcmUuIFBvaW50
IGlzIHRoYXQgbXkKPiA+ID4gPiA+IHJvb3QgZmlsZSBzeXN0ZW0sIGdlbmVyYXRlZCB3aXRoIG11
c2wgYSB5ZWFyIG9yIHNvIGFnbywgY3Jhc2hlcyB3aXRoCj4gPiA+ID4gPiB5b3VyIHBhdGNoIHNl
dCBhcHBsaWVkLiBUaGF0IGlzIGEgcmVncmVzc2lvbiwgZXZlbiBpZiB0aGVyZSBpcyBhIGJ1Zwo+
ID4gPiA+ID4gaW4gbXVzbC4KPiA+IFRoeCBmb3IgdGhlIHJlcG9ydCwgaXQncyBhIHZhbHVhYmxl
IHJlZ3Jlc3Npb24gZm9yIHJpc2N2LWNvbXBhdC4KPiA+Cj4gPiA+ID4KPiA+ID4gPiBBbHNvIGFz
IEkgc2FpZCBpbiB0aGUgb3RoZXIgcGFydCBvZiB0aGUgdGhyZWFkLCB0aGUgcm9vdGZzIHNlZW1z
IGlubm9jZW50LAo+ID4gPiA+IGFzIG15IGNvbXBsZXRlbHktc3RhbmRhcmQgRGViaWFuIHJpc2N2
NjQgcm9vdGZzIGlzIGFsc28gYWZmZWN0ZWQuCj4gPiA+ID4KPiA+ID4gPiBUaGUgbWVyZ2VkIHZl
cnNpb24gc2VlbXMgdG8gYmUgdjEyIFswXSAtIG5vdCBzdXJlIGhvdyB3ZSB0aGlzIGRpc2N1c3Np
b24KPiA+ID4gPiBlbmRlZCB1cCBpbiB2OSwgYnV0IEkganVzdCB0ZXN0ZWQgdGhpcyByZXZpc2lv
biBpbiB0d28gdmFyaWFudHM6Cj4gPiA+ID4KPiA+ID4gPiAtIHY1LjE3ICsgdGhpcyB2OSAtPiB3
b3JrcyBuaWNlbHkKPiA+ID4KPiA+ID4gSSB0YWtlIHRoYXQgYmFjayAuLi4gbm93IGdvaW5nIGJh
Y2sgdG8gdGhhdCBidWlsZCBJIHNvbWVob3cgYWxzbyBydW4gaW50bwo+ID4gPiB0aGF0IGlzc3Vl
IGhlcmUgLi4uIHdpbGwgaW52ZXN0aWdhdGUgbW9yZS4KPiA+IFllYWgsIGl0J3MgbXkgZmF1bHQu
IEkndmUgZml4ZWQgdXAgaXQsIHBsZWFzZSBoYXZlIGEgdHJ5Ogo+ID4KPiA+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIwNTI1MTYwNDA0LjI5MzA5ODQtMS1ndW9yZW5A
a2VybmVsLm9yZy9ULyN1Cj4KPiB2ZXJ5IGNvb2wgdGhhdCB5b3UgZm91bmQgdGhlIGlzc3VlLgo+
IEkndmUgdGVzdGVkIHlvdXIgcGF0Y2ggYW5kIGl0IHNlZW1zIHRvIGZpeCB0aGUgaXNzdWUgZm9y
IG1lLgo+Cj4gVGhhbmtzIGZvciBmaWd1cmluZyBvdXQgdGhlIGNhdXNlCkkgc2hvdWxkIHRoeCBH
dWVudGVyIFJvZWNrLCBJdCBqdXN0IHN1cnByaXNlZCBtZSB0aGF0IGNvbXBhdF92ZHNvCmNvdWxk
IHdvcmsgd2l0aCBxdWl0ZSBhIGxvdCBvZiBydjY0IGFwcHMuCgo+IEhlaWtvCj4KPgo+ID4gPiA+
IC0gdjUuMTgtcmM2ICsgdGhpcyB2OSAocmViYXNlZCBvbnRvIGl0KSAtPiBicmVha3MgdGhlIGJv
b3QKPiA+ID4gPiAgIFRoZSBvbmx5IHJlYmFzZS1jb25mbGljdCB3YXMgd2l0aCB0aGUgaW50cm9k
dWN0aW9uIG9mIHJlc3RhcnRhYmxlCj4gPiA+ID4gICBzZXF1ZW5jZXMgYW5kIHJlbW92YWwgb2Yg
dGhlIHRyYWNlaG9vayBpbmNsdWRlLCBidXQgdHVybmluZyBDT05GSUdfUlNFUQo+ID4gPiA+ICAg
b2ZmIGRvZXNuJ3Qgc2VlbSB0byBhZmZlY3QgdGhlIGJyZWFrYWdlLgo+ID4gPiA+Cj4gPiA+ID4g
U28gaXQgbG9va3MgbGlrZSBzb21ldGhpbmcgY2hhbmdlZCBiZXR3ZWVuIDUuMTcgYW5kIDUuMTgg
dGhhdCBjYXVzZXMgdGhlIGlzc3VlLgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBIZWlrbwo+ID4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIw
NDA1MDcxMzE0LjMyMjU4MzItMS1ndW9yZW5Aa2VybmVsLm9yZy8KPiA+ID4gPgo+ID4gPgo+ID4g
Pgo+ID4gPgo+ID4gPgo+ID4KPiA+Cj4gPgo+Cj4KPgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3Vv
IFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
