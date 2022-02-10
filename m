Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CEEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlrpzqOS0QelOF6AFVgHZXodfbtjCGHjBX9IwiOwOGQ=; b=0alM5Rp8MGhNMQ
	6+/8/Id//uKQk2RopS3dlCLlSnzUXO8A3bYxXOR3d0ePj1XxyHSmSWosFak2R+eO8Iyin2mlgWmgs
	NOhqEHq2mE17mAh239/2bt2FWD6rmwww6KKMid6RuThpR7jm8Pwdw+ipUz1/H3z3WY5Y6GJez2y/V
	Hj1/YoD0vZF6OnNcADOIeTMiwt28bzNHwFoDqgeWF0cZdAK81zKvH1QOxsWCKTQ/ux2KeME01jX0g
	wK03x6dgJmRlTBOrr+POTmq4+Y2UfhLYpBZYclWBH7MJEAWestk3bL0pLT+Ik/d5HkemeRlRHQF1z
	9rS3VzK+nlHuyto07gwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIC1S-004KUh-Tg; Thu, 10 Feb 2022 16:10:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIC1P-004KU3-Hr
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 16:10:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2F46B82657;
 Thu, 10 Feb 2022 16:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3A9C004E1;
 Thu, 10 Feb 2022 16:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644509412;
 bh=ZAorFPJpvUFVFfC8NuB8t266XcSbj42njOVNokd0dNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZeNgkJL9Trv43cyPqcRNLgzsO9LuxFTQK2vJ1dEhPqEN7KQ3PmsPrIwNYbDpvKGZn
 69d0QHkczLmrGiQqx+EbiEEYNRPZupkA2CJ70hnLTad+V4HKubd5nfhRlgJVAOROLF
 +yhe7l1O2oYK/N+DTMpY5XAMN2O/GjdubZisOnu+ZMRIDx/C1U9h6t0DK/RmDS+gDz
 k9KrryjofYBOiuRRRVj71l4dCBP8uNIfapILtwiz03tA6wE9GyNBYT8iiIYSqcKeyc
 dXGm3ASW46sBzRiPJ4Mfd+l8b2SM6KZMU8E4PS/u+VAkDizpgLU0qpPcSuxXng9Pa8
 rLGhJD9zkLtyQ==
Date: Fri, 11 Feb 2022 00:01:42 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, huffman@cadence.com,
 mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH v6 00/14] riscv: support for Svpbmt and D1 memory types
Message-ID: <YgU25sWTf8EXTina@xhacker>
References: <20220209123800.269774-1-heiko@sntech.de>
 <YgP+n5OMhQPSbICV@xhacker> <14426959.46CLvVMboC@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14426959.46CLvVMboC@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_081015_929378_F0A2B501 
X-CRM114-Status: GOOD (  44.66  )
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

T24gVGh1LCBGZWIgMTAsIDIwMjIgYXQgMTI6NDQ6MDRBTSArMDEwMCwgSGVpa28gU3TDvGJuZXIg
d3JvdGU6Cj4gSGksCj4gCj4gQW0gTWl0dHdvY2gsIDkuIEZlYnJ1YXIgMjAyMiwgMTg6NDk6MTkg
Q0VUIHNjaHJpZWIgSmlzaGVuZyBaaGFuZzoKPiA+IE9uIFdlZCwgRmViIDA5LCAyMDIyIGF0IDAx
OjM3OjQ2UE0gKzAxMDAsIEhlaWtvIFN0dWVibmVyIHdyb3RlOgo+ID4gPiBTdnBibXQgaXMgYW4g
ZXh0ZW5zaW9uIGRlZmluaW5nICJTdXBlcnZpc29yLW1vZGU6IHBhZ2UtYmFzZWQgbWVtb3J5IHR5
cGVzIgo+ID4gPiBmb3IgdGhpbmdzIGxpa2Ugbm9uLWNhY2hlYWJsZSBwYWdlcyBvciBJL08gbWVt
b3J5IHBhZ2VzLgo+ID4gPiAKPiA+ID4gCj4gPiA+IFNvIHRoaXMgaXMgbXkgMm5kIHRyeSBhdCBp
bXBsZW1lbnRpbmcgU3ZwYm10IChhbmQgdGhlIGRpdmVyZ2luZyBEMSBtZW1vcnkKPiA+ID4gdHlw
ZXMpIHVzaW5nIHRoZSBhbHRlcm5hdGl2ZXMgZnJhbWV3b3JrLgo+ID4gPiAKPiA+ID4gVGhpcyBp
bmNsdWRlcyBhIG51bWJlciBvZiBjaGFuZ2VzIHRvIHRoZSBhbHRlcm5hdGl2ZXMgbWVjaGFuaXNt
IGl0c2VsZi4KPiA+ID4gVGhlIGJpZ2dlc3Qgb25lIGJlaW5nIHRoZSBtb3ZlIHRvIGEgbW9yZSBj
ZW50cmFsIGxvY2F0aW9uLCBhcyBJIGV4cGVjdAo+ID4gPiBpbiB0aGUgZnV0dXJlLCBuZWFybHkg
ZXZlcnkgY2hpcCBuZWVkaW5nIHNvbWUgc29ydCBvZiBwYXRjaGluZywgYmUgaXQKPiA+ID4gZWl0
aGVyIGZvciBlcnJhdGFzIG9yIGZvciBvcHRpb25hbCBmZWF0dXJlcyAoc3ZwYm10IG9yIG90aGVy
cykuCj4gPiA+IAo+ID4gPiBUaGUgZHQtYmluZGluZyBmb3Igc3ZwYm10IGl0c2VsZiBpcyBvZiBj
b3Vyc2Ugbm90IGZpbmlzaGVkIGFuZCBpcyBzdGlsbAo+ID4gPiB1c2luZyB0aGUgYmluZGluZyBp
bnRyb2R1Y2VkIGluIHByZXZpb3VzIHZlcnNpb25zLCBhcyB3aGVyZSB0byBwdXQKPiA+ID4gYSBz
dnBibXQtcHJvcGVydHkgaW4gdGhlIGRldmljZXRyZWUgaXMgc3RpbGwgdW5kZXIgZGljdXNzaW9u
Lgo+ID4gPiBBdGlzaCBzZWVtcyB0byBiZSB3b3JraW5nIG9uIGEgZnJhbWV3b3JrIGZvciBleHRl
bnNpb25zIFswXSwKPiA+ID4gCj4gPiA+IFRoZSBzZXJpZXMgYWxzbyBpbnRyb2R1Y2VzIHN1cHBv
cnQgZm9yIHRoZSBtZW1vcnkgdHlwZXMgb2YgdGhlIEQxCj4gPiA+IHdoaWNoIGFyZSBpbXBsZW1l
bnRlZCBkaWZmZXJlbnRseSB0byBzdnBibXQuIEJ1dCB3aGVuIHBhdGNoaW5nIGFueXdheQo+ID4g
PiBpdCdzIHByZXR0eSBjbGVhbiB0byBhZGQgdGhlIEQxIHZhcmlhbnQgdmlhIEFMVEVSTkFUSVZF
XzIgdG8gdGhlIHNhbWUKPiA+ID4gbG9jYXRpb24uCj4gPiA+IAo+ID4gPiBUaGUgb25seSBzbGln
aHRseSBiaWdnZXIgZGlmZmVyZW5jZSBpcyB0aGF0IHRoZSAibm9ybWFsIiB0eXBlIGlzIG5vdCAw
Cj4gPiA+IGFzIHdpdGggc3ZwYm10LCBzbyBrZXJuZWwgcGF0Y2hlcyBmb3IgdGhpcyBQTUEgdHlw
ZSBuZWVkIHRvIGJlIGFwcGxpZWQKPiA+ID4gZXZlbiBiZWZvcmUgdGhlIE1NVSBpcyBicm91Z2h0
IHVwLCBzbyB0aGUgc2VyaWVzIGludHJvZHVjZXMgYSBzZXBhcmF0ZQo+ID4gPiBzdGFnZSBmb3Ig
dGhhdC4KPiA+ID4gCj4gPiA+IAo+ID4gPiBJbiB0aGVvcnkgdGhpcyBzZXJpZXMgaXMgMyBwYXJ0
czoKPiA+ID4gLSBzYmkgY2FjaGUtZmx1c2ggLyBudWxsLXB0cgo+ID4gPiAtIGFsdGVybmF0aXZl
cyBpbXByb3ZlbWVudHMKPiA+ID4gLSBzdnBibXQrZDEKPiA+ID4gCj4gPiA+IFNvIGV4cGVjaWFs
bHkgcGF0Y2hlcyBmcm9tIHRoZSBmaXJzdCAyIGFyZWFzIGNvdWxkIGJlIGFwcGxpZWQgd2hlbgo+
ID4gPiBkZWVtZWQgcmVhZHksIEkganVzdCB0aG91Z2h0IHRvIGtlZXAgaXQgdG9nZXRoZXIgdG8g
c2hvdy1jYXNlIHdoZXJlCj4gPiA+IHRoZSBlbmQtZ29hbCBpcyBhbmQgbm90IHJlcXVpcmluZyBq
dW1waW5nIGJldHdlZW4gZGlmZmVyZW50IHNlcmllcy4KPiA+ID4gCj4gPiA+IAo+ID4gPiBUaGUg
c2JpIGNhY2hlLWZsdXNoIHBhdGNoIGlzIGJhc2VkIG9uIEF0aXNoJ3Mgc3BhcnNlLWhhcnRpZCBw
YXRjaCBbMV0sCj4gPiA+IGFzIGl0IHRvdWNoZXMgYSBzaW1pbGFyIGFyZWEgaW4gbW0vY2FjaGVm
bHVzaC5jCj4gPiA+IAo+ID4gPiAKPiA+ID4gSSBwaWNrZWQgdGhlIHJlY2lwaWVudCBsaXN0IGZy
b20gdGhlIHByZXZpb3VzIHZlcnNpb24sIGhvcGVmdWxseQo+ID4gPiBJIGRpZG4ndCBmb3JnZXQg
YW55Ym9keS4KPiA+ID4gCj4gPiA+IGNoYW5nZXMgaW4gdjY6Cj4gPiA+IC0gcmViYXNlIG9udG8g
NS4xNy1yYzEKPiA+ID4gLSBoYW5kbGUgc2JpIG51bGwtcHRyIGRpZmZlcmVudGx5Cj4gPiA+IC0g
aW1wcm92ZSBjb21taXQgbWVzc2FnZXMKPiA+ID4gLSB1c2UgcmlzY3YsbW11IGFzIHByb3BlcnR5
IG5hbWUKPiA+ID4gCj4gPiA+IGNoYW5nZXMgaW4gdjU6Cj4gPiA+IC0gbW92ZSB0byB1c2UgYWx0
ZXJuYXRpdmVzIGZvciBydW50aW1lLXBhdGNoaW5nCj4gPiAKPiA+IGFub3RoZXIgY2hvaWNlIGlz
IHVzaW5nIHN0YXRpYyBrZXkgbWVjaGFuaXNtLiBQcm9zOiBubyBuZWVkIHRvIGNvZGluZwo+ID4g
aW4gYXNtLCBhbGwgaW4gYy4KPiA+IAo+ID4gVG8gc3VwcG9ydCBuZXcgYXJjaCBmZWF0dXJlcywg
SSBzZWUgb3RoZXIgYXJjaCBzb21ldGltZXMgdXNlIHN0YXRpYwo+ID4ga2V5LCBzb21ldGltZXMg
dXNlIGFsdGVybmF0aXZlIG1lY2hhbmlzbSwgc28gb25lIHF1ZXN0aW9uIGhlcmUgd291bGQKPiA+
IGJlIHdoaWNoIG1lY2hhbmlzbSBpcyBiZXR0ZXI/IEFueSBndWlkZT8KPiAKPiBGb3IgbWUgaXQn
cyBhbHNvIGEgYml0IG9mIGEgbGVhcm4tYXMteW91LWdvIGV4cGVyaWVuY2UsIGJ1dCBJIGRvIHNl
ZSBzb21lCgpJIGhvcGUgb2xkIGhhbmRzIGNhbiBnaXZlIHNvbWUgc3VnZ2VzdGlvbnMgaGVyZSBh
Ym91dCBzdGF0aWMga2V5IFZTLgphbHRlcm5hdGl2ZSA7KS4gV2hlbiB0byB1c2Ugd2hpY2ggbWVj
aGFuaXNtLCBhbmQgd2h5LgoKPiBhZHZhbnRhZ2VzIGluIHVzaW5nIGFsdGVybmF0aXZlczoKPiAK
PiAtIFN0YXRpYyBrZXlzIG5lZWQgdGhlIGp1bXAtbGFiZWwgaW5mcmFzdHJ1Y3R1cmUsIHdoaWNo
IHRoZSBSaXNjViBrZXJuZWwKPiAgIG9ubHkgc2VlbXMgdG8gcHJvdmlkZSBvbiBub24tWElQIGtl
cm5lbHMgWzBdCgpJIHRoaW5rIHlvdSBmb3VuZCBvbmUgYnVnIGhlcmUuCkkgYmVsaWV2ZSBhbHRl
cm5hdGl2ZSBtZWNoYW5pc20gYWxzbyBkb2Vzbid0IHdvcmsgZm9yIFhJUCBrZXJuZWwuIEkgd2ls
bApzdWJtaXQgYSBwYXRjaCBmb3IgdGhpcyBjYXNlLgoKPiAtIHRoZSBhbW91bnQgb2YgYXNtIGhl
cmUgaXMgc29tZXdoYXQgbWluaW1hbCBmb3IgdGhlIGNvcmUgbm8tY2FjaGUgYW5kIGlvCj4gICB0
eXBlcyAobG9hZCBpbW1lZGlhdGUgKyBzaGlmdCkKPiAtIHVzaW5nIHRoZSBzdGF0aWMga2V5IG1l
Y2hhbmlzbSBzdGlsbCBkb2VzIGluY3VyIG1vcmUgb3ZlcmhlYWQgZm9yIHRoZQo+ICAgY29uZGl0
aW9uYWwKCmRvIHlvdSBtZWFuIHRoZSBpY2FjaGUgb3ZlcmhlYWQgZHVlIHRvIHRoZSBvdGhlciBk
aXNhYmxlZCBicmFuY2ggb2YKc3RhdGljIGtleT8gSXQgZGVzZXJ2ZXMgYSBjaGVjay4KCj4gLSBh
bmQgaWYgd2Ugd2FudCB0byBzdXBwb3J0IHRoZSBzdHJhbmdlIGZhbWlseS1tZW1iZXJzIGxpa2Ug
dGhlIEQxLAo+ICAgKGFuZCBpdCBzZWVtcyB3ZSBkbyB3YW50IHRoYXQpIHRoaXMgd291bGQgY3Jl
YXRlIG1vcmUgY29uZGl0aW9uYWxzCgpNYXliZSBpbXBsZW1lbnQgdGhlIHN0YW5kYXJkIHN2cGJt
dCB2aWEuIHN0YXRpYyBrZXkgYW5kIGNvcGUgd2l0aCBEMSBhcwplcnJhdGEgYWx0ZXJuYXRpdmUu
Cj4gICBhcyB3ZSBoYXZlIHRvIHRlc3QgZm9yIHN2cGJtdCwgZDEgYW5kIG1heWJlIGZ1dHVyZSBz
cGVjaWFsIGNhc2VzLAoKRnJvbSBEb2N1bWVudGF0aW9uL3Jpc2N2L3BhdGNoLWFjY2VwdGFuY2Uu
cnN0LCB0aGUgIlN1Ym1pdCBDaGVja2xpc3QKQWRkZW5kdW0iIHNlY3Rpb24sICJ3ZSdsbCBvbmx5
IHRvIGFjY2VwdCBwYXRjaGVzIGZvciBleHRlbnNpb25zIHRoYXQKaGF2ZSBiZWVuIG9mZmljaWFs
bHkgZnJvemVuIG9yIHJhdGlmaWVkIGJ5IHRoZSBSSVNDLVYgRm91bmRhdGlvbi4iClRoaXMgcnVs
ZSBoYXNuJ3QgYmVlbiBjaGFuZ2VkLgpQZXIgbXkgdW5kZXJzdGFuZGluZyBvZiBoaXN0b3J5IG9m
IHRoZSBzdnBibXQgcGF0Y2ggc2V0LCBubyBmdXR1cmUKc3BlY2lhbCBjYXNlcyBhbnkgbW9yZS4K
Cj4gICB3aGVyZSBhbHRlcm5hdGl2ZXMtcGF0Y2hpbmcgb24gdGhlIG90aGVyIGhhbmQgc2ltcGx5
IHJlcGxhY2VzIHRoZQo+ICAgcmVsZXZhbnQgY29kZSB3aXRoIHRoZSBhcHByb3ByaWF0ZSB2YXJp
YW50Lgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
