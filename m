Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C82C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 02:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKm4LQ0blHk2xL36bIIvF0Jr+wwuHpDlfg2H3uGdszY=; b=g5x9pZfMc54a6q
	X7WnMFEHTFp1/v1/bsIFKgYUah5dDSvGttYvBDo6g3ReYUB6/WP7CrdnYhdYmmLzWDth2MB4DYkMb
	MWaxsQVZqnMeh/hqqSVnyUvd6mjaFGATK4qIfFNgl9ETHXMVQOLHSTUYnOkzFmoP2jttgkia0Cghm
	Ftp5Srg3pVYk692TAYFZQpHVsS60trOJfmGVoIBpF19r2m0RRpG3SHUjqAvdOk1Hd2OS+zlHkkKfy
	ScHHDedP4133kHzrcvBefaoz1SJn048Nf8RcydSGLIcyu0VluPbIv03qqkUbZE+/uwhN/Ey7gbrxt
	GGNz6xYxqifOfyDQKaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msbO5-00Ab1h-En; Thu, 02 Dec 2021 01:59:53 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msbO2-00Ab0Z-Hm
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 01:59:52 +0000
Received: by mail-yb1-xb33.google.com with SMTP id d10so68994635ybe.3
 for <linux-riscv@lists.infradead.org>; Wed, 01 Dec 2021 17:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PQbQ01wzti4a86s0mzuGmyRjqSgKeOKXJvkaPDwlmQQ=;
 b=l772S4I6Tkc3ncYGTm3hyJ6KUOQ+rw07AuwbzNu25E6Do8pPBFWhd/Miizq6QPvNXu
 aB2NfCg3dtdaTtPJxvUwr6Ru9ZQbrKzNbFRAYkRWDRTnMKwebo9UgYTzExwuRT9QTMVn
 8iWC3EsuWZoYomEElDfdw55q0ij2Jf1rQzYa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PQbQ01wzti4a86s0mzuGmyRjqSgKeOKXJvkaPDwlmQQ=;
 b=4O3SITCr/KcwZcDuyC1qO/8HVQcFfQS3Mv7r0cIlepJX9hit8+NTmwsW8goQiKC7B2
 f4T7zybPckxXNxcWRGsyjVqHLpNgSq0xL52s0suAayPELWK1mKLMyAipPNzh/PPwRcbr
 NttfvY3buAr3fvS0BOl1jGSxWU9H8KyCrlZBfgPY/I9ddDQpzCF+7IBIs1OUZhUMEc3m
 7E6QK0G/sWtOWPLozcD9eg/pc6POi1X2Htq50ijfWETf3lfJDGsqVN5IWxnACNX1M/oU
 4oJYGQHUDWgyTAeAD+SCmkbt7L831qPE95P2wBSynHok7Zk7RnTQCWuNtkxyJgYOYZ7l
 O5sg==
X-Gm-Message-State: AOAM53372JXfiv3bagsX5YZkREsywE53TYqQveQGugE2Fq+6UIVAtdwL
 6uJ+dwoQQK0fMDxyrBfh1n9RcENxNMmgp+ksl+eN
X-Google-Smtp-Source: ABdhPJzXw9ht1p5IdtspfcR3Rs31FHDZBP5k4GYV+tQ/lSwPnczsQhO+EW5S+Wbr18E9RrHAhOwm6ttYnXIiMVMAryM=
X-Received: by 2002:a25:4d8:: with SMTP id 207mr11543751ybe.320.1638410389172; 
 Wed, 01 Dec 2021 17:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20211129014007.286478-1-wefu@redhat.com>
 <03B8F784-4AF3-425D-99B6-F753F7970273@jrtc27.com>
 <CAOnJCUKmP6dsrV9xWC52uEaM0=fZh-FNDYyFg1VxQybpQZABMA@mail.gmail.com>
 <3495709.4EXlkQ93OV@diego>
In-Reply-To: <3495709.4EXlkQ93OV@diego>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 1 Dec 2021 17:59:38 -0800
Message-ID: <CAOnJCUL0mffufWZzWVBDo2akb+kd6rpnDG6aYOuXHWM274i6OA@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Jessica Clarke <jrtc27@jrtc27.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Wei Fu <wefu@redhat.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>,
 Gordan Markus <gordan.markus@canonical.com>, 
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Dan Lustig <dlustig@nvidia.com>, 
 Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>, 
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, 
 Bill Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>, 
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh+dt@kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 atishp04@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 Wei Wu <lazyparser@gmail.com>, Drew Fustini <drew@beagleboard.org>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_175950_621950_BA701BE6 
X-CRM114-Status: GOOD (  53.25  )
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

T24gV2VkLCBEZWMgMSwgMjAyMSBhdCA1OjI4IEFNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+Cj4gSGkgQXRpc2gsCj4KPiBBbSBNaXR0d29jaCwgMS4gRGV6ZW1iZXIg
MjAyMSwgMDI6MjE6NDYgQ0VUIHNjaHJpZWIgQXRpc2ggUGF0cmE6Cj4gPiBPbiBUdWUsIE5vdiAz
MCwgMjAyMSBhdCA4OjEzIEFNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIDMwIE5vdiAyMDIxLCBhdCAxNTowMSwgUGhpbGlwcCBUb21zaWNo
IDxwaGlsaXBwLnRvbXNpY2hAdnJ1bGwuZXU+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gV2UgZGlk
IHRvdWNoIG9uIHRoaXMgaW4gb3VyIGNvb3JkaW5hdGlvbiBjYWxsIGEgZmV3IHdlZWtzIGFnbzog
dGhlCj4gPiA+ID4gZ3JvdXBpbmcgdW5kZXIgbW11IGFuZCB0aGUgYm9vbC1lbnRyaWVzIHdlcmUg
Y2hvc2VuIGJlY2F1c2Ugb2YgdGhlaXIKPiA+ID4gPiBzaW1pbGFyaXR5IHRvIG90aGVyIGV4dGVu
c2lvbnMgKGkuZS4gZm9yIFpiW2FiY3NdIHRoZXJlIGNvdWxkL3Nob3VsZAo+ID4gPiA+IGJlIGEg
Ym9vbC1lbnRyeSB1bmRlciBlYWNoIGNwdS1ub2RlIOKAlCBmb3Igc29tZSBadiogZW50cmllcyBh
IHN1Ym5vZGUKPiA+ID4gPiBtaWdodCBiZSBuZWVkZWQgd2l0aCBmdXJ0aGVyIHBhcmFtZXRlcnMp
Lgo+ID4gPiA+Cj4gPiA+ID4gVGhlIHN0cmluZy1iYXNlZCBhcHByb2FjaCAoYXMgaW4gdGhlIG9y
aWdpbmFsbHkgcHJvcG9zZWQgIm1tdS10eXBlPSIpCj4gPiA+ID4gd291bGQgbGlrZSBub3Qgc2Nh
bGUgd2l0aCB0aGUgcHJvbGlmZXJhdGlvbiBvZiBzbWFsbCAmIG1vZHVsYXIKPiA+ID4gPiBleHRl
bnNpb25zLgo+ID4gPgo+ID4gPiBJIGRvbuKAmXQgc2VlIHdoeSB0aGUgU3YqIGV4dGVuc2lvbnMg
bmVlZCB0byBiZSB1bmRlciBhbiBtbXUgbm9kZSB0aGVuLAo+ID4gPiB1bmxlc3MgdGhlIGludGVu
dCBpcyB0aGF0IGV2ZXJ5IGV4dGVuc2lvbiBiZSBncm91cGVkIHVuZGVyIGEgc3ViLW5vZGUKPiA+
ID4gKHdoaWNoIGRvZXNu4oCZdCBzZWVtIHZpYWJsZSBkdWUgdG8gZXh0ZW5zaW9ucyBsaWtlIFpi
ayosIHVubGVzcyB5b3UKPiA+ID4gZ3JvdXAgYnkgU3MsIFN2IGFuZCBaKT8KPiA+ID4KPiA+Cj4g
PiBJdCBzaG91bGRuJ3QgYmUuIEFsbCB0aGUgSVNBIGV4dGVuc2lvbnMgKGkuZS4gc3RhbmRhcmQs
IHN1cGVydmlzb3IgJiBoeXBlcnZpc29yKQo+ID4gd2l0aCBwcmVmaXggUyxaLEggc2hvdWxkIGJl
IGtlcHQgc2VwYXJhdGUgaW4gYSBzZXBhcmF0ZSBub2RlIGZvciBlYXN5Cj4gPiBwYXJzaW5nLgo+
ID4KPiA+ICJyaXNjdixpc2EiIGR0IHByb3BlcnR5IHdpbGwgbm90IHNjYWxlIGF0IGFsbC4gSnVz
dCBsb29rIGF0IHRoZSBmZXcKPiA+IGV4dGVuc2lvbnMgdGhhdCB3ZXJlIHJhdGlmaWVkIHRoaXMg
eWVhcgo+ID4gYW5kIExpbnV4IGtlcm5lbCBuZWVkcyB0byBzdXBwb3J0IHRoZW0uCj4gPgo+ID4g
IlNzY29mcG1mIiwgIlN2cGJtdCIsICJaaWNib20iCj4gPgo+ID4gPiBBbHNvLCB3aGF0IGlzIGdv
aW5nIHRvIGhhcHBlbiB0byB0aGUgY3VycmVudCByaXNjdixpc2E/IFdpbGwgdGhhdAo+ID4gPiBj
b250aW51ZSB0byBleGlzdCBhbmQgZHVwbGljYXRlIHRoZSBpbmZvLCBvciB3aWxsIGtlcm5lbHMg
YmUgcmVxdWlyZWQKPiA+ID4gdG8gcmVjb25zdHJ1Y3QgdGhlIHN0cmluZyB0aGVtc2VsdmVzIGlm
IHRoZXkgd2FudCB0byBkaXNwbGF5IGl0IHRvCj4gPiA+IHVzZXJzPwo+ID4gPgo+ID4KPiA+IFRo
aXMgaXMgbXkgcGVyc29uYWwgcHJlZmVyZW5jZToKPiA+IHJpc2N2LGlzYSB3aWxsIGNvbnRpbnVl
IHRvIGJhc2UgU3RhbmRhcmQgSVNBIGV4dGVuc2lvbnMgdGhhdCBoYXZlCj4gPiBzaW5nbGUgbGV0
dGVyIGV4dGVuc2lvbnMuCj4gPgo+ID4gVGhpcyBuZXcgRFQgbm9kZSB3aWxsIGVuY29kZSBhbGwg
dGhlIG5vbi1zaW5nbGUgbGV0dGVyIGV4dGVuc2lvbnMuCj4gPiBJIGFtIG5vdCBzdXJlIGlmIGl0
IHNob3VsZCBpbmNsdWRlIHNvbWUgcHJvdmlzaW9ucyBmb3IgY3VzdG9tCj4gPiBleHRlbnNpb25z
IHN0YXJ0aW5nIHdpdGggWCBiZWNhdXNlCj4gPiB0aGF0IHdpbGwgYmUgcGxhdGZvcm0gc3BlY2lm
aWMuCj4gPgo+ID4gQWdhaW4sIHRoaXMgaXMganVzdCBteSBwZXJzb25hbCBwcmVmZXJlbmNlLiBJ
IHdpbGwgdHJ5IHRvIHNlbmQgYSBwYXRjaAo+ID4gc29vbiBzbyB0aGF0IHdlIGNhbiBpbml0aWF0
ZSBhIGJyb2FkZXIKPiA+IGRpc2N1c3Npb24gb2YgdGhlIHNjaGVtZSBhbmQgYWdyZWUvZGlzYWdy
ZWUgb24gc29tZXRoaW5nLgo+Cj4gdGhhdCB3b3VsZCBiZSByZWFsbHkgaGVscGZ1bCwgYXMgaXQg
Y3VycmVudGx5IGxvb2tzIGxpa2Ugd2UgaGF2ZSBhIG51bWJlcgo+IG9mIGRpZmZlcmVudCBwb2lu
dHMtb2YtdmlldyBzbyBkaXNjdXNzaW5nIGFuIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiB3aWxsCj4g
cHJvYmFibHkgbWFrZSB0aGluZ3MgYSBsb3QgZWFzaWVyIGNvbXBhcmVkIHRvIGRhbmNpbmcgYXJv
dW5kIHRoZW9yZXRpYwo+IGNhc2VzIDotKSAuCj4KPiBPdXQgb2YgY3VyaW9zaXR5LCBob3cgc29v
biBpcyAic29vbiIgPyA6LUQKPgoKSSB3aWxsIGJlIG9uIHZhY2F0aW9uIGZvciBuZXh0IHdlZWsg
YW5kIEkgbmVlZCB0byB3cmFwIHVwIGEgZmV3IG90aGVyCnRoaW5ncyBiZWZvcmUgdGhhdC4KVGh1
cywgc29vbiBtYXkgbm90IGJlIHRoZSAic29vbiIgeW91IGFyZSBleHBlY3RpbmcgOykuCgpJZiB5
b3Ugb3IgVHN1a2FzYSBoYXZlIHNvbWUgZnJlZSBjeWNsZXMsIGZlZWwgZnJlZSB0byBzZW5kIHRo
ZSBwYXRjaAppbiB0aGUgbWVhbnRpbWUuCgo+Cj4gSGVpa28KPgo+Cj4gPiA+IEFzIGEgRnJlZUJT
RCBkZXZlbG9wZXIgSeKAmW0gb2J2aW91c2x5IG5vdCBhIHBhcnQgb2YgbWFueSBvZiB0aGVzZQo+
ID4gPiBkaXNjdXNzaW9ucywgYnV0IHdoYXQgdGhlIExpbnV4IGNvbW11bml0eSBpbXBvc2VzIGFz
IHRoZSBkZXZpY2UgdHJlZQo+ID4gPiBiaW5kaW5ncyBoYXMgYSByZWFsIGltcGFjdCBvbiB1cy4K
PiA+ID4KPiA+ID4gSmVzcwo+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgMzAgTm92IDIwMjEgYXQgMTQ6
NTksIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4gPiA+ID4+Cj4g
PiA+ID4+IE9uIDMwIE5vdiAyMDIxLCBhdCAxMzoyNywgSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4gd3JvdGU6Cj4gPiA+ID4+Pgo+ID4gPiA+Pj4gSGksCj4gPiA+ID4+Pgo+ID4gPiA+
Pj4gQW0gRGllbnN0YWcsIDMwLiBOb3ZlbWJlciAyMDIxLCAxNDoxNzo0MSBDRVQgc2NocmllYiBK
ZXNzaWNhIENsYXJrZToKPiA+ID4gPj4+PiBPbiAzMCBOb3YgMjAyMSwgYXQgMTI6MDcsIEhlaWtv
IFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+ID4gPiA+Pj4+Pgo+ID4gPiA+Pj4+
PiBBbSBNb250YWcsIDI5LiBOb3ZlbWJlciAyMDIxLCAxMzowNjoyMyBDRVQgc2NocmllYiBIZWlr
byBTdMO8Ym5lcjoKPiA+ID4gPj4+Pj4+IEFtIE1vbnRhZywgMjkuIE5vdmVtYmVyIDIwMjEsIDA5
OjU0OjM5IENFVCBzY2hyaWViIEhlaW5yaWNoIFNjaHVjaGFyZHQ6Cj4gPiA+ID4+Pj4+Pj4gT24g
MTEvMjkvMjEgMDI6NDAsIHdlZnVAcmVkaGF0LmNvbSB3cm90ZToKPiA+ID4gPj4+Pj4+Pj4gRnJv
bTogV2VpIEZ1IDx3ZWZ1QHJlZGhhdC5jb20+Cj4gPiA+ID4+Pj4+Pj4+Cj4gPiA+ID4+Pj4+Pj4+
IFByZXZpb3VzIHBhdGNoIGhhcyBhZGRlZCBzdnBibXQgaW4gYXJjaC9yaXNjdiBhbmQgYWRkICJy
aXNjdixzdnBtYnQiCj4gPiA+ID4+Pj4+Pj4+IGluIHRoZSBEVCBtbXUgbm9kZS4gVXBkYXRlIGR0
LWJpbmRpbmdzIHJlbGF0ZWQgcHJvcGVydHkgaGVyZS4KPiA+ID4gPj4+Pj4+Pj4KPiA+ID4gPj4+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIEZ1IDx3ZWZ1QHJlZGhhdC5jb20+Cj4gPiA+ID4+Pj4+
Pj4+IENvLWRldmVsb3BlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+ID4+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gPiA+
Pj4+Pj4+PiBDYzogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiA+ID4gPj4+Pj4+
Pj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gPiA+ID4+Pj4+Pj4+
IENjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+ID4gPiA+Pj4+Pj4+PiAtLS0K
PiA+ID4gPj4+Pj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2Nw
dXMueWFtbCB8IDEwICsrKysrKysrKysKPiA+ID4gPj4+Pj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKykKPiA+ID4gPj4+Pj4+Pj4KPiA+ID4gPj4+Pj4+Pj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiA+ID4+Pj4+
Pj4+IGluZGV4IGFhNWZiNjRkNTdlYi4uOWZmOWNiZGQ4YTg1IDEwMDY0NAo+ID4gPiA+Pj4+Pj4+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1s
Cj4gPiA+ID4+Pj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9jcHVzLnlhbWwKPiA+ID4gPj4+Pj4+Pj4gQEAgLTYzLDYgKzYzLDE2IEBAIHByb3BlcnRp
ZXM6Cj4gPiA+ID4+Pj4+Pj4+ICAgICAgLSByaXNjdixzdjQ4Cj4gPiA+ID4+Pj4+Pj4+ICAgICAg
LSByaXNjdixub25lCj4gPiA+ID4+Pj4+Pj4+Cj4gPiA+ID4+Pj4+Pj4+ICsgIG1tdToKPiA+ID4g
Pj4+Pj4+Pgo+ID4gPiA+Pj4+Pj4+IFNob3VsZG4ndCB3ZSBrZWVwIHRoZSBpdGVtcyBiZSBpbiBh
bHBoYWJldGljIG9yZGVyLCBpLmUuIG1tdSBiZWZvcmUKPiA+ID4gPj4+Pj4+PiBtbXUtdHlwZT8K
PiA+ID4gPj4+Pj4+Pgo+ID4gPiA+Pj4+Pj4+PiArICAgIGRlc2NyaXB0aW9uOgo+ID4gPiA+Pj4+
Pj4+PiArICAgICAgRGVzY3JpYmVzIHRoZSBDUFUncyBNTVUgU3RhbmRhcmQgRXh0ZW5zaW9ucyBz
dXBwb3J0Lgo+ID4gPiA+Pj4+Pj4+PiArICAgICAgVGhlc2UgdmFsdWVzIG9yaWdpbmF0ZSBmcm9t
IHRoZSBSSVNDLVYgUHJpdmlsZWdlZAo+ID4gPiA+Pj4+Pj4+PiArICAgICAgU3BlY2lmaWNhdGlv
biBkb2N1bWVudCwgYXZhaWxhYmxlIGZyb20KPiA+ID4gPj4+Pj4+Pj4gKyAgICAgIGh0dHBzOi8v
cmlzY3Yub3JnL3NwZWNpZmljYXRpb25zLwo+ID4gPiA+Pj4+Pj4+PiArICAgICRyZWY6ICcvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcnCj4gPiA+ID4+Pj4+Pj4+ICsgICAg
ZW51bToKPiA+ID4gPj4+Pj4+Pj4gKyAgICAgIC0gcmlzY3Ysc3ZwbWJ0Cj4gPiA+ID4+Pj4+Pj4K
PiA+ID4gPj4+Pj4+PiBUaGUgcHJpdmlsZWdlZCBzcGVjaWZpY2F0aW9uIGhhcyBtdWx0aXBsZSBN
TVUgcmVsYXRlZCBleHRlbnNpb25zOgo+ID4gPiA+Pj4+Pj4+IFN2bmFwb3QsIFN2cGJtdCwgU3Zp
bnZhbC4gU2hhbGwgdGhleSBhbGwgYmUgbW9kZWxlZCBpbiB0aGlzIGVudW0/Cj4gPiA+ID4+Pj4+
Pgo+ID4gPiA+Pj4+Pj4gSSByZW1lbWJlciBpbiBzb21lIGVhcmxpZXIgdmVyc2lvbiBzb21lIHdh
eSBiYWNrIHRoZXJlIHdhcyB0aGUKPiA+ID4gPj4+Pj4+IHN1Z2dlc3Rpb24gb2YgdXNpbmcgYSBz
dWItbm9kZSBpbnN0ZWFkIGFuZCB0aGVuIGFkZGluZyBib29sZWFuCj4gPiA+ID4+Pj4+PiBwcm9w
ZXJ0aWVzIGZvciB0aGUgc3VwcG9ydGVkIGV4dGVuc2lvbnMuCj4gPiA+ID4+Pj4+Pgo+ID4gPiA+
Pj4+Pj4gQWthIHNvbWV0aGluZyBsaWtlCj4gPiA+ID4+Pj4+PiAgIG1tdSB7Cj4gPiA+ID4+Pj4+
PiAgICAgICAgICAgcmlzY3Ysc3ZwYm10Owo+ID4gPiA+Pj4+Pj4gICB9Owo+ID4gPiA+Pj4+Pgo+
ID4gPiA+Pj4+PiBGb3IgdGhlIHJlY29yZCwgSSdtIHRhbGtpbmcgYWJvdXQgdGhlIG1haWwgZnJv
bSBzZXB0ZW1iZXIKPiA+ID4gPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvQ0FBZUx0VUNoamp6RytQOHlnNDVHTFpNSnk1VVIySzVSUkJvTEZWWmh0T2FaNXBQdEVBQG1h
aWwuZ21haWwuY29tLwo+ID4gPiA+Pj4+Pgo+ID4gPiA+Pj4+PiBTbyBoYXZpbmcgYSBzdWItbm9k
ZSB3b3VsZCBtYWtlIGFkZGluZyBmdXR1cmUgZXh0ZW5zaW9ucwo+ID4gPiA+Pj4+PiB3YXkgbmlj
ZXIuCj4gPiA+ID4+Pj4KPiA+ID4gPj4+PiBTdnBibXQgaXMganVzdCBhbiBJU0EgZXh0ZW5zaW9u
LCBhbmQgc2hvdWxkIGJlIHRyZWF0ZWQgbGlrZSBhbnkgb3RoZXIuCj4gPiA+ID4+Pj4gTGV04oCZ
cyBub3QgaW52ZW50IHR3byBkaWZmZXJlbnQgd2F5cyBvZiByZXByZXNlbnRpbmcgdGhhdCBpbiB0
aGUgZGV2aWNlCj4gPiA+ID4+Pj4gdHJlZS4KPiA+ID4gPj4+Cj4gPiA+ID4+PiBIZWlucmljaCBh
c2tlZCBob3cgdGhlIG90aGVyIGV4dGVuc2lvbnMgc2hvdWxkIGJlIGhhbmRsZWQKPiA+ID4gPj4+
IChTdm5hcG90LCBTdnBibXQsIFN2aW52YWwpLCBzbyB3aGF0IGRvIHlvdSBzdWdnZXN0IHRvIGRv
IHdpdGggdGhlc2U/Cj4gPiA+ID4+Cj4gPiA+ID4+IFdoYXRldmVyIGlzIGRvbmUgZm9yIFpiW2Fi
Y3NdLCBaayosIFp2KiwgWmljYm8qLCBldGMuIFRoZXJlIG1heSBub3QgYmUKPiA+ID4gPj4gYSBj
b25jcmV0ZSBwbGFuIGZvciB0aGF0IHlldCwgYnV0IHRoYXQgbWVhbnMgeW91IHNob3VsZCBzcGVh
ayB3aXRoIHRoZQo+ID4gPiA+PiBwZW9wbGUgaW52b2x2ZWQgd2l0aCBzdWNoIGV4dGVuc2lvbnMg
YW5kIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcKPiA+ID4gPj4gYXBwcm9wcmlhdGUgdG9nZXRoZXIu
Cj4gPiA+ID4+Cj4gPiA+ID4+IEplc3MKPiA+ID4gPj4KPiA+ID4KPiA+ID4KPiA+ID4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0Cj4gPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+
ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo+ID4KPiA+Cj4gPgo+ID4gLS0KPiA+IFJlZ2FyZHMsCj4gPiBBdGlzaAo+ID4KPgo+Cj4KPgoK
Ci0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
