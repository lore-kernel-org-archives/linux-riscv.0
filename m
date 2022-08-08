Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F936C25B08
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZWxV7LzpwT52JuiyHJlZcQ0C1FsYmJT0EL+tGZJKmU=; b=2CmVTCFIMZoukS
	LIhCmEZon/FL49RQR3of2Mysh8JkyVknwXB+DEykyaju7cc5HzSLx+cUHdLZe96tyQMggiwKkcrSe
	TkWQAGST0EzSzxy7sy8xOcJPWHr0Vl1T1pcJt2mwoU6gKMjQeuhkwyOMJ34lB5fFaRhkFnvNLOHxk
	TAbZuh7T0CDCLPjYIqkWi/RWHcuK5sDWYxUFg+13KxRlEUMiQkzbNtNd561U0b+zULFWpdIZW7ufx
	XYOaOqiRhtZwiXucNRQ08xc/XyPHj7pexETvZj7oj+fgR3UOqFPBZbbDO4sVcfFjDs9d7wQWDj0J9
	4lzRr/OvWFh/uGxqc9ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLF3s-000Sv5-PL; Tue, 09 Aug 2022 02:33:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLBtu-00GjWj-3m
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 23:11:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BC91AB810F6
	for <linux-riscv@lists.infradead.org>; Mon,  8 Aug 2022 23:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDE3C43140
	for <linux-riscv@lists.infradead.org>; Mon,  8 Aug 2022 23:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660000266;
	bh=jHSuHCtp6RDvJVvP/NS479tQWR2ltG97ra6kLxQO21E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pdQD+ZMD28AZ/EvgVscNpomgIUJDtNl7b/2+R9PQvRJi7BIxGEKn6ShqiMqUjaRQN
	 AnbxNlmAcVzH5bLd7lURPD9Z1c0zu7OPK8Etf5J0oz+LXzx5bO09/EfeNHL/9f0cVP
	 LJuv10nghovOYidRAoxH86tZQIYO8cRVPHFqCKG6em0kDfLJuBnnbzDAfiiuI+V3RF
	 RQrNi+HHxFVd3cXhXBN7eW0njcGYrl0TOGwlU2fdTzUdSha7kvnGKIBk1qPrxEH35F
	 0DAcbUlBZBGiSf9/IdKxbX1xMcT6bfedODOLKZ6k1Wb3Dh0tjCSE+NSMNJyrSoBIMn
	 kNZ9bz1REDo6Q==
Received: by mail-vs1-f45.google.com with SMTP id d126so6052793vsd.13
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 16:11:06 -0700 (PDT)
X-Gm-Message-State: ACgBeo2oOxqzwqdiJGwFADEP9DxOmHz6kl+mFwFj4uh34njHxPDI+gv2
	AFJUuSKw8HBY1En6MkCnN1h6bltiZXbjZOKF9g==
X-Google-Smtp-Source: AA6agR47bM6PXZpdbPUPn1sGnCTqktT46MegrwfONsfHijrksV9DCm6sE3X3dlRmFEWMqFkZMMInWHQn3vKBNHFqLrA=
X-Received: by 2002:a67:a246:0:b0:388:7e82:1d80 with SMTP id
 t6-20020a67a246000000b003887e821d80mr7289670vsh.26.1660000265768; Mon, 08 Aug
 2022 16:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220808210643.2192602-1-mail@conchuod.ie> <20220808210643.2192602-4-mail@conchuod.ie>
 <4BA66590-3A82-4B5C-829B-67F8B5D5029D@jrtc27.com> <842525b8-2716-4d87-7024-070fe858da6f@microchip.com>
In-Reply-To: <842525b8-2716-4d87-7024-070fe858da6f@microchip.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Aug 2022 17:10:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLa2xJN0oLaCzzE1fS-enRhv-XkLBsn_mHQ7kvXy6yWnQ@mail.gmail.com>
Message-ID: <CAL_JsqLa2xJN0oLaCzzE1fS-enRhv-XkLBsn_mHQ7kvXy6yWnQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/riscv: virt: fix syscon subnode paths
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, 
	QEMU Developers <qemu-devel@nongnu.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_161110_474739_D990658E 
X-CRM114-Status: GOOD (  32.53  )
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

T24gTW9uLCBBdWcgOCwgMjAyMiBhdCA0OjEwIFBNIDxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNv
bT4gd3JvdGU6Cj4KPiBPbiAwOC8wOC8yMDIyIDIyOjI4LCBKZXNzaWNhIENsYXJrZSB3cm90ZToK
PiA+IE9uIDggQXVnIDIwMjIsIGF0IDIyOjA2LCBDb25vciBEb29sZXkgPG1haWxAY29uY2h1b2Qu
aWU+IHdyb3RlOgo+ID4+Cj4gPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KPiA+Pgo+ID4+IFRoZSBzdWJub2RlcyBvZiB0aGUgc3lzY29uIGhhdmUgYmVl
biBhZGRlZCB0byB0aGUgaW5jb3JyZWN0IHBhdGhzLgo+ID4+IFJhdGhlciB0aGFuIGFkZCB0aGVt
IGFzIHN1Ym5vZGVzLCB0aGV5IHdlcmUgb3JpZ2luYWxseSBhZGRlZCB0byAiL2ZvbyIKPiA+PiBh
bmQgYSBsYXRlciBwYXRjaCBtb3ZlZCB0aGVtIHRvICIvc29jL2ZvbyIuIEJvdGggYXJlIGluY29y
cmVjdCAmIHRoZXkKPiA+PiBzaG91bGQgaGF2ZSBiZWVuIGFkZGVkIGFzICIvc29jL3Rlc3RAIyMj
L2ZvbyIgYXMgIi9zb2MvdGVzdCIgaXMgdGhlCj4gPj4gc3lzY29uIG5vZGUuIEZpeCBib3RoIHRo
ZSByZWJvb3QgYW5kIHBvd2Vyb2ZmIHN1Ym5vZGVzIHRvIGF2b2lkIGVycm9ycwo+ID4+IHN1Y2gg
YXM6Cj4gPj4KPiA+PiAvc3R1ZmYvcWVtdS9xZW11LmR0Yjogc29jOiBwb3dlcm9mZjogeyd2YWx1
ZSc6IFtbMjE4NDVdXSwgJ29mZnNldCc6IFtbMF1dLCAncmVnbWFwJzogW1s0XV0sICdjb21wYXRp
YmxlJzogWydzeXNjb24tcG93ZXJvZmYnXX0gc2hvdWxkIG5vdCBiZSB2YWxpZCB1bmRlciB7J3R5
cGUnOiAnb2JqZWN0J30KPiA+PiAgICAgICAgRnJvbSBzY2hlbWE6IC9ob21lL2Nvbm9yLy5sb2Nh
bC9saWIvcHl0aG9uMy45L3NpdGUtcGFja2FnZXMvZHRzY2hlbWEvc2NoZW1hcy9zaW1wbGUtYnVz
LnlhbWwKPiA+PiAvc3R1ZmYvcWVtdS9xZW11LmR0Yjogc29jOiByZWJvb3Q6IHsndmFsdWUnOiBb
WzMwNTgzXV0sICdvZmZzZXQnOiBbWzBdXSwgJ3JlZ21hcCc6IFtbNF1dLCAnY29tcGF0aWJsZSc6
IFsnc3lzY29uLXJlYm9vdCddfSBzaG91bGQgbm90IGJlIHZhbGlkIHVuZGVyIHsndHlwZSc6ICdv
YmplY3QnfQo+ID4+ICAgICAgICBGcm9tIHNjaGVtYTogL2hvbWUvY29ub3IvLmxvY2FsL2xpYi9w
eXRob24zLjkvc2l0ZS1wYWNrYWdlcy9kdHNjaGVtYS9zY2hlbWFzL3NpbXBsZS1idXMueWFtbAo+
ID4+Cj4gPj4gUmVwb3J0ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPj4g
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMjA4MDMxNzA1NTIu
R0EyMjUwMjY2LXJvYmhAa2VybmVsLm9yZy8KPiA+PiBGaXhlczogMThkZjBiNDY5NSAoImh3L3Jp
c2N2OiB2aXJ0OiBBbGxvdyBjcmVhdGluZyBtdWx0aXBsZSBOVU1BIHNvY2tldHMiKQo+ID4+IEZp
eGVzOiAwZTQwNGRhMDA3ICgicmlzY3YvdmlydDogQWRkIHN5c2NvbiByZWJvb3QgYW5kIHBvd2Vy
b2ZmIERUIG5vZGVzIikKPiA+PiBSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3Rh
aXIuZnJhbmNpc0B3ZGMuY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPgo+ID4gVGhpcyBicmVha3MgRnJlZUJTROKAmXMg
ZHJpdmVyICh3ZWxsLCBpdCBqdXN0IHdvbuKAmXQgcHJvYmUvYXR0YWNoKSwgd2hpY2gKPiA+IGlz
IHdyaXR0ZW4gdG8gaGFuZGxlIHN5c2Nvbi1wb3dlcm9mZi9yZWJvb3QgZXhpc3RpbmcgYXMgYSBj
aGlsZCBvZiBhCj4gPiBzaW1wbGVidXMgbm90IGEgc3lzY29uLgoKSXQgcHJvYmFibHkgYnJlYWtz
IExpbnV4LCB0b28uCgo+IEkga25vdyBuZXh0IHRvIG5vdGhpbmcgYWJvdXQgRnJlZUJTRCB1bmZv
cnR1bmF0ZWx5IG9yIGhvdyBpdCBoYW5kbGVzCj4gYnVzZXMuIE15IHVuZGVyc3RhbmRpbmcgb2Yg
c2ltcGxlLWJ1cyB3YXMgdGhhdCBpdCBpcyBzdXBwb3NlZCB0bwo+IHJlcHJlc2VudCBhIGJ1cyB3
aXRoICJ0aGluZ3MiIG1hcHBlZCB0byBhZGRyZXNzZXMsIHJlbHlpbmcgb24gdGhlICJyZWciCj4g
cHJvcGVydHkuIEFuZCB0aGVuIHN5c2NvbiBpcyB1c2VkIHdoZW4gdGhlcmUgaXMgc29tZSBtdWx0
aWZ1bmN0aW9uCj4gcmVnaXN0ZXIgcmVnaW9uIHRoYXQgY29udHJvbHMgbXVsdGlwbGUgZmVhdHVy
ZXMgb2YgdGhlIGhhcmR3YXJlLgo+IFNpbmNlIHNpbXBsZS1idXMgZGVmaW5lcyBhIHJlZyBwcm9w
ZXJ0eSBhbmQgdGhlIGZ1bmN0aW9uIG5vZGVzIGRvIG5vdAo+IGRlZmluZSBvbmUsIEknZCBsaWtl
IHRvIGtub3cgaG93IEZyZWVCU0QncyBkcml2ZXIgaGFuZGxlcyB0aGF0Lgo+Cj4gPiBNb3Jlb3Zl
ciwgd2hhdCBpcyB0aGUgcG9pbnQgb2YgcmVnbWFwIGluIHRoaXMKPiA+IGNhc2U/IEl0cyBleGlz
dGVuY2Ugc3VnZ2VzdHMgdGhlIHBvaW50IGlzIGZvciB0aGVtIHRvICpub3QqIGJlIGNoaWxkcmVu
Cj4gPiBvZiB0aGUgc3lzY29uLCBvdGhlcndpc2UgeW91IHdvdWxkbuKAmXQgbmVlZCBhbiBleHBs
aWNpdCBwaGFuZGxlLCB5b3XigJlkCj4gPiBqdXN0IGxvb2sgYXQgdGhlIHBhcmVudC4gTW92aW5n
IHRoZSBub2RlcyB3aGlsc3Qga2VlcGluZyB0aGUgcHJvcGVydHkKPiA+IGRvZXNu4oCZdCBtYWtl
IHNlbnNlIHRvIG1lLgo+Cj4gVGhhdCdzIGhvdyBzeXNjb24gYmluZGluZ3MgYXJlIGNvbnN0cnVj
dGVkLCBtYWtlcyBpdCBlYXNpZXIgdG8gZm9sbG93Cj4gSSBzdXBwb3NlIGlmIHRoZXkgZnVuY3Rp
b25zIGFyZSBjaGlsZHJlbiBvZiB0aGUgc3lzY29uIG5vZGUuIFN0cmljdGx5Cj4gSSB0aGluayB0
aGV5IGRvbid0IG5lZWQgdG8gYmUgdW5kZXIgdGhlIHN5c2NvbiBpdHNlbGYsIEkgdGhpbmsgdGhl
eSBjYW4KPiBhbHNvIGdvIGF0IHRoZSB0b3AgbGV2ZWwgLSB0aGV5IGp1c3QgYXJlbid0IHZhbGlk
IHVuZGVyIHRoZSAvc29jIG5vZGUKPiBhcyBpdCBoYXMgYmVlbiBkZWZpbmVkIGFzIGEgInNpbXBs
ZS1idXMiLgo+Cj4gSXQgd291bGQgYXBwZWFyIHRoYXQgdGhlIG9yaWdpbmFsIHBhdGNoIDBlNDA0
ZGEwMDcgKCJyaXNjdi92aXJ0OiBBZGQKPiBzeXNjb24gcmVib290IGFuZCBwb3dlcm9mZiBEVCBu
b2RlcyIpIHRoYXQgYWRkZWQgdGhlbSBwdXQgdGhlbSBhdCB0aGUKPiB0b3AgbGV2ZWwgYW5kIGl0
IHdhcyBpbiB0aGUgcmVmYWN0b3IgdGhhdCB0aGV5IGdvdCBtb3ZlZCB0byB0aGUgc29jIGJ1cy4q
Cj4gTWF5YmUgdGhlIHNvbHV0aW9uIHdvdWxkIGJlIHRvIHB1dCB0aGVtIGJhY2sgYXQgdGhlIHRv
cCBsZXZlbD8KClBlcmhhcHMuCgpUaGUgb3RoZXIgb3B0aW9uIGlzIGFkZGluZyAnc2ltcGxlLW1m
ZCcgdG8gdGhlICd0ZXN0JyBub2RlIGNvbXBhdGlibGUuClRoYXQgd291bGQgd29yayBmb3IgTGlu
dXguIE5vdCBzdXJlIGZvciBGcmVlQlNELgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
