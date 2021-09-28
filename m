Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE48C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 06:03:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6166761159
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 06:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6166761159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7infAd4HKM9T7dgoLkY5vwajuipo8ibdB6vQEHH6e6k=; b=37ks8XmVfSdn08
	O97EYSmQDbC15IVY07nX0QLiaG+LZiVYrCHm//L3DyrEUD1BZhctt4rV9nAcPNS3X7h3fRjAwxPYL
	7ffpE5+Z6/Pvz3Ojltt1RrCJYBJZW9oV+gvZ+mYR1BNX9b3gX0Kg1y1v/4DFZ9fsFyjfn51dJh2YY
	xDoqZmnQpDgu6AKLWOjXyZ4qRfECV/WLOk7zNOrjhqqnwse0f8LlJXcKEIZW0cmef0/P3vp/XEAp/
	S/Wd73XzQSqqWZj7RPyjZNPIVMsQXdGeraWTThsdhq6R6apg67NKrDwYRzG7xhWtP4DNDgoxpjHbf
	CRjz5ZGi0+1ZPgAHcgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV6DM-005k9z-W5; Tue, 28 Sep 2021 06:03:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV6DK-005k90-Ac
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 06:03:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2D5F611CA
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 06:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632809018;
 bh=vjVfKXJy2xx64ITHbCITCyC+acx70L3tyY38fPQ7Dl4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BQlnqrMapEqzveec14mb/O6Sn/bQPcYWXjE8IUOUXyUVUO3b0pXepgH2c2mnnUXgM
 C8z1jjnpLJkklKHqh6YZmCSLSSHhNW1ObqmVw+e0XDGVVKwu6Qmwq775ZRrpZjGY4H
 UvsFZQsHaEr/40GnKVPhxbl0v0d0eq5u9oDJuXzUsVhbaVc4C4yMCulD5rT7FqHnwr
 7Zoo3Bj6K1rtUtNdlGDXncEpsagdK1EE6nyGOsTMVMB5XUKGs68jPHtTIMkaFePZta
 PDyHJMYSsONlbZ9VSyTJmDb6Hl3pZ+BlQZCDysTT7a5wh/82poqwRs7bI8g1RgOe1M
 iEcUbbc6QdUww==
Received: by mail-vs1-f43.google.com with SMTP id o124so20852578vsc.6
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 23:03:37 -0700 (PDT)
X-Gm-Message-State: AOAM5318XcasgtYwQ5i9cXu0F1u8O5y63RGBOTZDysFgrYbJaztSbaRo
 QkjKXMbgg/ErpUo3Rkmyh5FhDTXaQlQzHiQigco=
X-Google-Smtp-Source: ABdhPJxXsGz/5A0ua6jddc3SvcqVj+i4dfTq8E463AgvrxLuZGOteWmC0ebDC4j5ubWscKRWo/TBkVPE1uCasriKomw=
X-Received: by 2002:a67:f9da:: with SMTP id c26mr3643460vsq.50.1632809017047; 
 Mon, 27 Sep 2021 23:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172107.1117604-1-guoren@kernel.org>
 <CAOnJCUJWnDB+uRxDh=YSbGW4bf5RQvke03iCTYMYHPsw3cwnHQ@mail.gmail.com>
 <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
 <0790abcfa1174e0e9b5e7b185f87ced9@mailhost.ics.forth.gr>
 <CAAhSdy2-y4xpM9PCrS0vgCN9ngFiBygeDOWcbgsX6Myb4XjDQg@mail.gmail.com>
 <CAOnJCULg36kNiDV6ymTSRff8yYZvFKpxm5uh=cAicQT44OcLYw@mail.gmail.com>
In-Reply-To: <CAOnJCULg36kNiDV6ymTSRff8yYZvFKpxm5uh=cAicQT44OcLYw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 28 Sep 2021 14:03:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQSvKxekXqNQ6ttra5nVTV02ZKu+x0ThFYvSQermVbNgQ@mail.gmail.com>
Message-ID: <CAJF2gTQSvKxekXqNQ6ttra5nVTV02ZKu+x0ThFYvSQermVbNgQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] riscv: Add RISC-V svpbmt extension
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_230338_426039_85ED084D 
X-CRM114-Status: GOOD (  43.52  )
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

T24gVHVlLCBTZXAgMjgsIDIwMjEgYXQgMTI6MjYgUE0gQXRpc2ggUGF0cmEgPGF0aXNocEBhdGlz
aHBhdHJhLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAyNywgMjAyMSBhdCA4OjUwIFBNIEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgU2Vw
IDI4LCAyMDIxIGF0IDY6MzIgQU0gTmljayBLb3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IM6jz4TOuc+CIDIwMjEtMDktMjcgMjM6MTMsIEF0aXNoIFBhdHJh
IM6tzrPPgc6xz4jOtToKPiA+ID4gPj4gV2UgbmVlZCB0byBkZWNpZGUgd2hldGhlciB3ZSBzaG91
bGQgc3VwcG9ydCB0aGUgdXBzdHJlYW0ga2VybmVsIGZvcgo+ID4gPiA+PiBEMS4gRmV3IHRoaW5n
cyB0byBjb25zaWRlci4KPiA+ID4gPj4g4oCTIENhbiBpdCBiZSBjb25zaWRlcmVkIGFzIGFuIGVy
cmF0YSA/Cj4gPiA+Cj4gPiA+IEl0J3Mgb25lIHRoaW5nIHRvIGZvbGxvdyB0aGUgc3BlYyBhbmQg
aGF2ZSBhbiBlcnJvciBpbiB0aGUKPiA+ID4gaW1wbGVtZW50YXRpb24sIGFuZCBhbm90aGVyIHRv
IG5vdCBmb2xsb3cgdGhlIHNwZWMuCj4gPiA+Cj4gPiA+ID4+IOKAkyBEb2VzIGl0IHNldCBhIGJh
ZCBwcmVjZWRlbnQgYW5kIG9wZW4gY2FuIG9mIHdvcm1zIGluIGZ1dHVyZSA/Cj4gPiA+Cj4gPiA+
IElNSE8geWVzLCBJJ20gdGhpbmtpbmcgb2YgS2VuZHJ5dGUgMjEwIGRldnMgZm9yIGV4YW1wbGUg
Y29taW5nIHVwIGFuZAo+ID4gPiBhc2tpbmcgZm9yIE1NVSBzdXBwb3J0LCB0aGV5ICd2ZSBhbHNv
IHNoaXBwZWQgbWFueSBjaGlwcyBhbHJlYWR5LiBJIGNhbgo+ID4gPiBhbHNvIGltYWdpbmUgb3Ro
ZXIgdmVuZG9ycyBpbiB0aGUgZnV0dXJlIGNvbWluZyB1cCB3aXRoIGltcGxlbWVudGF0aW9ucwo+
ID4gPiB0aGF0IHZpb2xhdGUgdGhlIHNwZWMgaW4gd2hpY2ggY2FzZSBoYW5kbGluZyB0aGUgc3Rh
bmRhcmQgc3R1ZmYgd2lsbAo+ID4gPiBiZWNvbWUgbWVzc3kgYW5kIGNvbXBsZXgsIGFuZCBodXJ0
IHBlcmZvcm1hbmNlL3NlY3VyaXR5LiBXZSdsbCBlbmQgdXAKPiA+ID4gZmlsbGluZyB0aGUgY29k
ZSB3aXRoIGV4Y2VwdGlvbnMgYW5kIHR3ZWFrcyBhbGwgb3ZlciB0aGUgcGxhY2UuIFdlIG5lZWQK
PiA+ID4gdG8gYmUgc3RyaWN0IGFib3V0IHdoYXQgaXMgInJpc2N2IiBhbmQgd2hhdCdzICJkcmFm
dCByaXNjdiIgb3IgInJpc2N2Cj4gPiA+IGluc3BpcmVkIiwgYW5kIHdoYXQgd2UgYXJlIHdpbGxp
bmcgdG8gc3VwcG9ydCB1cHN0cmVhbS4gSSBjYW4gdW5kZXJzdGFuZAo+ID4gPiBzdXBwb3J0aW5n
IHZlbmRvciBleHRlbnNpb25zIHVwc3RyZWFtIGJ1dCB0aGV5IG5lZWQgdG8gZml0IHdpdGhpbiB0
aGUKPiA+ID4gc3RhbmRhcmQgc3BlYywgd2UgY2FuJ3QgaGF2ZSBmb3IgZXhhbXBsZSBleHRlbnNp
b25zIHRoYXQgdXNlIGVuY29kaW5nCj4gPiA+IHNwYWNlL2NzcnMvZmllbGRzIGV0YyByZXNlcnZl
ZCBmb3Igc3RhbmRhcmQgdXNlLCB0aGV5IG1heSBvbmx5IHVzZQo+ID4gPiB3aGF0J3MgcmVzZXJ2
ZWQgZm9yIGN1c3RvbS92ZW5kb3IgdXNlLiBBdCBsZWFzdCBsZXQncyBhZ3JlZSBvbiB0aGF0Lgo+
ID4KPiA+IFRvdGFsbHkgYWdyZWUgd2l0aCBOaWNrIGhlcmUuIEl0J3MgYSBzbGlwcGVyeSBzbG9w
ZS4KPiA+Cj4gPiBJbmNsdWRpbmcgRDEgUFRFIGJpdHMgKG9yIEtlbmRyeXRlIEsyMTAgTU1VKSBw
YXJ0IG9mIHRoZSBMaW51eCBSSVNDLVYKPiA+IG1lYW5zIGZ1dHVyZSBoYXJkd2FyZSB3aGljaCBp
bnRlbnRpb25hbGx5IHZpb2xhdGVzIHNwZWNzIHdpbGwgYWxzbyBoYXZlIHRvCj4gPiBiZSBtZXJn
ZWQgYW5kIHRoZSBSSVNDLVYgcGF0Y2ggYWNjZXB0YW5jZSBwb2xpY3kgd2lsbCBoYXZlIG5vIHNp
Z25pZmljYW5jZS4KPiA+Cj4gPiA+Cj4gPiA+ID4+IOKAkyBDYW4gd2UganVzdCBpZ25vcmUgRDEg
Z2l2ZW4gdGhlIG1hc3Mgdm9sdW1lID8KPiA+ID4gPj4KPiA+ID4KPiA+ID4gSU1ITyBubywgd2Ug
bmVlZCB0byBmaW5kIGEgd2F5IHRvIHN1cHBvcnQgaXQgdXBzdHJlYW0gYnV0IEkgYmVsaWV2ZQo+
ID4gPiB0aGVyZSBpcyBhbm90aGVyIHF1ZXN0aW9uIHRvIGFuc3dlcjoKPiA+ID4KPiA+ID4gRG8g
d2UgYWxzbyBndWFyYW50ZWUgIm9uZSBpbWFnZSB0byBydWxlIHRoZW0gYWxsIiBhcHByb2FjaCwg
cmVxdWlyZWQgYnkKPiA+ID4gYmluYXJ5IGRpc3Ryb3MsIGZvciBpbXBsZW1lbnRhdGlvbnMgdGhh
dCB2aW9sYXRlIHRoZSBzcGVjID8gQXJlIHdlIG9rCj4gPiA+IGZvciBleGFtcGxlIHRvIHN1cHBv
cnQgQWxsd2lubmVyIEQxIHVwc3RyZWFtIGJ1dCByZXF1aXJlIGEgY3VzdG9tCj4gPiA+IGNvbmZp
Z3VyYXRpb24vYnVpbGQgaW5zdGVhZCBvZiBzdXBwb3J0aW5nIGl0IHdpdGggdGhlICJnZW5lcmlj
IiBpbWFnZSA/Cj4gPiA+IEluIG9uZSBjYXNlIHdlIG5lZWQgdG8gaGFuZGxlIHRoZSB2aW9sYXRp
b24gYXQgcnVudGltZSBhbmQgaW50cm9kdWNlCj4gPiA+IG92ZXJoZWFkIGZvciBldmVyeW9uZSAo
bGlrZSBsb29raW5nIHVwIF9fcmlzY3Zfc3ZwYm10IGV2ZXJ5IHRpbWUgd2Ugc2V0Cj4gPiA+IGEg
UFRFIGluIHRoaXMgY2FzZSksIGluIHRoZSBvdGhlciBpdCdzIGFuICNpZmRlZi4KPiA+Cj4gPiBB
dCBsZWFzdCwgd2Ugc2hvdWxkIG5vdCBoYXZlIGhhcmR3YXJlIHZpb2xhdGluZyBzcGVjcyBhcyBw
YXJ0IG9mIHRoZQo+ID4gdW5pZmllZCBrZXJuZWwgaW1hZ2UgaW5zdGVhZCBoYXZlIHRoZXNlIGlu
dGVudGlvbmFsIGRldmlhdGlvbnMvdmlvbGF0aW9ucwo+ID4gdW5kZXIgc2VwYXJhdGUga2NvbmZp
ZyB3aGljaCB3aWxsIG5vdCBiZSBlbmFibGVkIGJ5IGRlZmF1bHQuIFRoaXMgbWVhbnMKPiA+IHZl
bmRvcnMgKG9mIHN1Y2ggaGFyZHdhcmUpIGFuZCBkaXN0cm9zIHdpbGwgaGF2ZSB0byBleHBsaWNp
dGx5IGVuYWJsZQo+ID4gc3VwcG9ydCBmb3Igc3VjaCB2aW9sYXRpb25zL2RldmlhdGlvbnMuCj4g
Pgo+Cj4gSWYgd2UgbWVyZ2UgdGhlIGNvZGUgYW5kIGFyZSBub3QgZW5hYmxlZCBieSBkZWZhdWx0
LCBpdCB3b3VsZCBiZSBhCj4gbWFpbnRlbmFuY2UgbmlnaHRtYXJlIGluIGZ1dHVyZS4KPiBUaGVz
ZSBwYXJ0IG9mIHRoZSBrZXJuZWwgd2lsbCBub3QgYmUgcmVndWxhcmx5IHRlc3RlZCBidXQgd2Ug
aGF2ZSB0bwo+IGNhcnJ5IHRoZSBjaGFuZ2VzIGZvciBhIGxvbmcgdGltZS4KPiBTaW1pbGFyIGNo
YW5nZXMgd2lsbCBvbmx5IGdyb3cgb3ZlciB0aW1lIGNhdXNpbmcgYSBsb3Qgb2YgY3VzdG9tCj4g
Y29uZmlncyB0aGF0IGFyZSBub3QgZW5hYmxlZCBieSBkZWZhdWx0LgpEMSBjb3VsZCBzdGlsbCB1
c2UgZ2VuZXJpYyBJbWFnZS4gVGhlIHJlYXNvbiB3aHkgSSBzZW5kIHRoZSBzdGFuZGFyZAppbXBs
ZW1lbnRhdGlvbiBvZiBzdnBibXQgaXMgdGhhdCB3aGVuIHdlIGludHJvZHVjZSBzdnBibXQsIHdl
IGFjdHVhbGx5CmludHJvZHVjZSB0aGUgcGFnZSBhdHRyaWJ1dGUgZnJhbWV3b3JrcyBmb3IgZGlm
ZmVyZW50IHBsYXRmb3JtcyhzdnBibXQKJiBub24tc3ZwYm10KS4gVGhlbiwgImN1c3RvbSBzdnBi
bXQiIGNhbiBhbHNvIG1vZGlmeSAicHJvdGVjdF9tYXBwIFtdIgphbmQgc3ZwYm10IFtdICJpbiBl
cnJhdGEgYnkgbGltaXRlZCBjb2RlcyBmcm9tIHZlbmRvci4KSWYgd2Ugc3VwcG9ydCBzdGFuZGFy
ZCBzdnBibXQgZmlyc3QsIHRoZW4gbGV0ICJnZW5lcmljIEltYWdlIiBzdXBwb3J0CkQxIHdvdWxk
IGJlIHZlcnkgbGl0dGxlIG1vZGlmaWNhdGlvbiBhbmQgYWxsIGNvdWxkIGJlIGtlcHQgaW4gZXJy
YXRhLgoKQW5vdGhlciBwYXRjaCBbMV0gY2xlYW5zIHVwIHRoZSB3cm9uZyB1c2FnZSBvZiAicHJv
dGVjdF9tYXAgW10iIHNvCnRoYXQgdGhlIGVudGlyZSBMaW51eCB1c2VyIHN0YXRlIHBhZ2UgYXR0
cmlidXRlcyBjb21lIGZyb20gaXQuIFRoZQpkZXNpZ24gcHJpbmNpcGxlIG9mIExpbnV4IGlzIHRv
IGFsbG93IHRoZSBwbGF0Zm9ybSB0byBpbml0CiJwcm90ZWN0X21hcCBbXSIgZmxleGlibHkuClsx
XTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjEwOTI3MDY0MzQwLjI0MTEzOTctMS1n
dW9yZW5Aa2VybmVsLm9yZy8KCj4KPiBJTUhPLCBpZiB3ZSB3YW50IHRvIHN1cHBvcnQgdGhpcyBi
b2FyZCBpbiB1cHN0cmVhbSwgd2Ugc2hvdWxkIGp1c3QKPiBjbGVhcmx5IHN0YXRlIHRoYXQgaXQg
aXMgb25lIHRpbWUgc3BlY2lhbCBleGNlcHRpb24KPiBmb3IgdGhpcyBib2FyZCBvbmx5IGJlY2F1
c2Ugb2YgdGhlIGZvbGxvd2luZyByZWFzb25zCj4KPiAxLiBUaGUgYm9hcmQgZGVzaWduIHByZWRh
dGVzIHRoZSBwYXRjaCBhY2NlcHRhbmNlIHBvbGljeS4KRDEgaXMgZGVzaWduZWQgYXQgMjAxOS4K
Cj4gMi4gV2UgZG9uJ3QgaGF2ZSBlbm91Z2ggYWZmb3JkYWJsZSBMaW51eCBjb21wYXRpYmxlIHBs
YXRmb3JtcyB0b2RheS4KRDEgb25seSAgJDY1LgoKPiAzLiBBbGxvd2luZyBydW5uaW5nIGFuIHVw
c3RyZWFtIGtlcm5lbCBvbiBEMSBoZWxwcyB0aGUgUklTQy1WIHNvZnR3YXJlCj4gZWNvc3lzdGVt
IHRvIGdyb3cuClllcwoKPgo+IE5vIG1vcmUgZXhjZXB0aW9ucyB3aWxsIGJlIGFsbG93ZWQgaW4g
ZnV0dXJlIGZvciBzdWNoIGhhcmR3YXJlIHRoYXQKPiB2aW9sYXRlcyB0aGUgc3BlYy4gUGVyaW9k
Lgo+Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+Cj4KPgo+IC0tCj4gUmVnYXJkcywKPiBBdGlzaAoK
CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtY3NreS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
