Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4F8E63C9C
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqlQ9oIW21xqeXDop6FGDHT+YITsu24D1Ao2NDGlhuM=; b=VIyRvoiPX5fDxX
	xOg+FBrFKWsQiXX1P6JdVRLuGyKJNeBfUUnUHNTs8McEEAiKI0D8VG1e3cWYDlnOr9WjIBNm1KJ41
	ePJ5CGWXXVc6kEeB8RCX4pD+qdjfOVizmiinLsmeYGys19VOMDYt6BLCsHnUUu/wn4N794dMqZVkz
	miFQWl56IL08bh+cVzUB/eSPeaXBxA+ycQb9YlhcsFB/vfvpCA6yqQQYLUc4Cixl+V1sXDYsm12C3
	WbvID3Hbgv6GXficNcdxYG3ZeI9TfnE5yO+0RR38ZbG2fY0Rb/9+wuliT3ypYAjx4LpXU7sPRsdNI
	yyV3coFee7ihRh0BKzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjxuK-0000000B6DB-1bC0;
	Sun, 25 Jan 2026 11:03:52 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjxuH-0000000B6Cm-2FEt
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 11:03:50 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A7618340F77;
	Sun, 25 Jan 2026 11:03:43 +0000 (UTC)
Date: Sun, 25 Jan 2026 19:03:33 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Alex Elder <elder@riscstar.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Message-ID: <20260125110333-GYD71302@gentoo.org>
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn>
 <CAH1PCMZq++FYr_2WB=HvouXvnxcYGFk6tngqNUk3zTOM6xXLZQ@mail.gmail.com>
 <CAH1PCMbEcVa6mAvw9UAG2T2Jy0W-+nEcw79nTHDJr9xgEdm0VA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMbEcVa6mAvw9UAG2T2Jy0W-+nEcw79nTHDJr9xgEdm0VA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_030349_602265_A2B7DA6C 
X-CRM114-Status: GOOD (  29.25  )
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

SGkgR3VvZG9uZywKCk9uIDEyOjI3IFN1biAyNSBKYW4gICAgICwgR3VvZG9uZyBYdSB3cm90ZToK
PiBPbiBTdW4sIEphbiAyNSwgMjAyNiBhdCAxMjoxOOKAr1BNIEd1b2RvbmcgWHUgPGd1b2RvbmdA
cmlzY3N0YXIuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIEphbiAyNCwgMjAyNiBhdCAyOjI1
4oCvUE0gVml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2FzLmFjLmNuPiB3cm90ZToKPiA+ID4K
PiA+ID4KPiA+ID4gT24gMS8yNC8yNiAwODoyMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+ID4gPiBb
Li4uXQo+ID4gPiA+Cj4gPiA+ID4gTm90ZTogUGF0Y2ggMyBpbnRyb2R1Y2VzIGEgYmlzZWN0IGJy
ZWFrYWdlIGJ5IHRyYW5zaXRpb25pbmcgdG8KPiA+ID4gPiBwaW4tc3BlY2lmaWMgc3VwcGx5IG5h
bWVzLiBQcm9iZSBmYWlsdXJlcyB3aWxsIG9jY3VyIG9uIGV4aXN0aW5nIGJvYXJkcwo+ID4gPiA+
IHVudGlsIFBhdGNoIDQgdXBkYXRlcyB0aGUgY29ycmVzcG9uZGluZyBEVFMgZmlsZS4KPiA+ID4K
PiA+ID4gT3VjaCwgdGhhdCdzIG5vdCBhIGJpc2VjdCBicmVha2FnZSwgdGhhdCdzIGFuICpBQkkg
YnJlYWthZ2UqLiBBbmQgQUZBSUNUCj4gPiA+IHRoaXMgaXMgc3RpbGwgbm90IG9rYXkgaW4gMjAy
NiwKPiA+ID4gc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9BQkkucnN0Cj4g
PiA+Cj4gPiA+IFNvIHRoZSBiaW5kaW5ncyB3b3VsZCBuZWVkIHRvIGJlIGNoYW5nZWQgdG8gYWNj
ZXB0IGJvdGggdGhlIG5ldyBhbmQgb2xkIHdheS4KPiA+Cj4gPiBJZGVhbGx5IHllcy4gSG93ZXZl
ciwgY29uc2lkZXJpbmcgdGhpcyBBQkkgY2hhbmdlJ3MgYWN0dWFsIGVmZmVjdCwgdGhlIHR3bwo+
ID4gSzEgYm9hcmRzIChCUEktRjMgYW5kIEp1cGl0ZXIpIGluIHRoZSBrZXJuZWwgZ2V0IHRoZWly
IHBvd2VyIHNldHRpbmdzCj4gPiBmcm9tIGJvb3QgZmlybXdhcmUgYXMgd2VsbCwgYW5kIHRoZSB0
eXBlcyBvZiBwZXJpcGhlcmFscyBlbmFibGVkIGluIHRoZSAuZHRzCj4gPiBmaWxlcyBhcmUgdmVy
eSBsaW1pdGVkLCB0aGUgcHJvYmUgZmFpbHVyZSBvZiB0aGUgcG1pYyByZWd1bGF0b3IgZG9lc24n
dAo+ID4gYWZmZWN0IG11Y2guIFNvLCBJIHRoaW5rIHRoaXMgYnJlYWthZ2UgaXMgYWNjZXB0YWJs
ZS4KPiA+Cj4gPiA+Cj4gPiA+IERyaXZlci13aXNlLCBhdCBhIGN1cnNvcnkgbG9vayBmcm9tIHNv
bWVvbmUgbm90IGZhbWlsaWFyIHdpdGggdGhlCj4gPiA+IHJlZ3VsYXRvciBzdHVmZiwgbWF5YmUg
d2UgY2FuIG1ha2UgaXQgY29tcGF0aWJsZSB3aXRoIG9sZCBEVFMgYnkgYWRkaW5nCj4gPiA+IHRo
ZSBuZXcgbmFtZXMgYXMgYWxpYXNlcyAoe2Rldm1fLH1yZWd1bGF0b3JfcmVnaXN0ZXJfc3VwcGx5
X2FsaWFzPykgYXMKPiA+ID4gInZpbiIgb3IgImJ1Y2s1IiwgaWYgd2Ugc2VlIHRoZSBvbGQgdmlu
LXN1cHBseSBkZWZpbml0aW9ucz8KPiA+ID4KPiA+Cj4gPiBXZSBjYW4gZG8gdGhhdCBvZiBjb3Vy
c2UuIE15IGhlc2l0YXRpb24gaXMsIGhvd2V2ZXIsIGl0IG1ha2VzIHRoZSBkcml2ZXIgdGFrZQo+
ID4gZXh0cmEgY29kZSB3aGljaCBtYXkgbm90IGJlIG5lZWRlZCBvbmNlIGFsbCAuZHRzIGZpbGVz
IGhhdmUgYmVlbiB1cGRhdGVkLiBUaGUKPiA+IGRyaXZlciBjb2RlIHdpbGwgYmUgbGVmdCB0aGVy
ZSBmb3JldmVyLgo+ID4KPiAKPiBNYXJrIGdhdmUgaGlzIG9waW5pb24gaW4gdjEgcmV2aWV3IFsx
XSwgcGxlYXNlIGFsbG93IG1lIHRvIHBhcnRpYWxseSBxdW90ZQo+IGhlcmU6ICIoaXQncyBhbiBB
QkkgY2hhbmdlIHNvIHNob3VsZG4ndCByZWFsbHkgaGFwcGVuLCBidXQgcGVyaGFwcyB0aGVyZSBh
cmUKPiBmZXcgZW5vdWdoIHVzZXJzIGZvciBldmVyeW9uZSB0byBjb29yZGluYXRlIGFuZCBpdCdz
IHdoYXQgeW91IGFsbCBwcmVmZXIpLiIKPiAKPiBJIGRvIGV4cGVjdCB0byBjb2xsZWN0IG1vcmUg
aWRlYXMgYmVmb3JlIEkgZGVjaWRlIHdoZXRoZXIgYW5kIHdoYXQgdG8gZG8gaW4KPiB2Mywgb3Ig
bWF5YmUgdjMgaXMgbm90IHJlcXVpcmVkLgo+IApBcyBJIGNoZWNrZWQgdGhlIGR0cyB0cmVlIChE
VCBxdWV1ZWQgZm9yIHY2LjIwKSwgYWx0aG91Z2ggd2UgaW50cm9kdWNlZCB0aGUKcmVndWxhdG9y
IG9mIFAxL1BNSUMsIGJ1dCB0aGVyZSBpcyBubyBjb25zdW1lcnMgc28gZmFyLCBzbyBpbiByZWFs
IGxpZmUsIHdlCnNob3VsZG4ndCBicmVhayBhbnl0aGluZy4gSW4gdGhpcyBjYXNlLCBJJ2Qgc3Vn
Z2VzdCB3ZSBqdXN0IGdpdmUgdXAgZm9yIGRvaW5nCnRoZSBBQkkgYmFja3dhcmQgY29tcGF0aWJs
ZSB3b3JrIHdoaWNoIHNob3VsZCBzaW1wbGlmeSBvdXIgbGlmZS4uCgo+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yZTJjMjc1NC1mZDNlLTRmZDMtYWFlNC1kN2FmNjNlM2I1MjhA
c2lyZW5hLm9yZy51ay8KPiBbMV0KPiAKPiA+IEJSLAo+ID4gR3VvZG9uZyBYdQo+IAoKLS0gCllp
eHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
