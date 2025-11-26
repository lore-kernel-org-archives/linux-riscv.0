Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB65D1038C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 08:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sb4w4cWpzG24jydK++779FVCbCtDLzgNkCTA/jXhqgc=; b=l77LnSKPTwdVaH
	xNO0o1Q63C1uLOWJ89oztoobtVRQ26eK5YLus2UHIS9zJdMjmhEzJHHFSeIDgB2l+Rvx345cs6IJm
	237pCkMJkZgvGbcR+19O+2SVF7k0AzLBwgWeZT8aLtXs5ttUemCHYWDuSw3UNT+xpxXRBeya1r6cO
	rwFBhGtRQxErRifg4u8SmGRC1dUDYkVEFZZmsm91nL3ds0RRoASZPTkvZNtkGFJ0tLCFfS5CntBFI
	v3xFMS6616AL2Y1TPt6HT+DzGBmAAji1f3Wot1YoazGyNa0+U4vWukMXf9n0rquoxEpzyboQdKbsi
	qBsL8y7FxHXU/ECXJysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAoK-0000000EbAm-0Axz;
	Wed, 26 Nov 2025 08:23:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAoG-0000000EbAN-3o15
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 08:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24815443F5;
	Wed, 26 Nov 2025 08:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0935C113D0;
	Wed, 26 Nov 2025 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764145412;
	bh=5Hq009QrYIsRCcF2DN7Wj5FusEdSR9UWmNpXsITJZRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ie2jb7YYxX5+cnqmFG0EgCuBkmKMAWSJqsJmd7ebtMALk5UhZif0BxjG9uyj5XDJn
	 Iw9P23wVU4mCTLI+j5bsibQEfqjlt4xloc9rxolLmZMUSs1qKr3EkBXDUzLWDbLEqq
	 weFdxeufOlH5COjsE9ENqw6PIkBFZBeOwBbKUE2IMphN3+xtpwbuixR6AhKcQ1BkDs
	 49YXDFiWGST+hDrqa0rSj60QvFyWZDgr2rIz0s3ABaYk9h/ksTioh4d72W+9r6d1zO
	 bq7n5HG2CGNUoT0ScTy1H/DZ9JEXE0PjTakXl5auzGWZvXstmzBGjsQOXZxw/KR6Zk
	 Nd6bdJnqK4hzQ==
Message-ID: <9a7bed20-f15a-4b59-925c-5faa52ef909f@kernel.org>
Date: Wed, 26 Nov 2025 09:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: starfive: add
 xunlong,orangepi-rv
To: E Shattow <e@freeshell.de>, Icenowy Zheng <uwu@icenowy.me>,
 Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
References: <20251123225059.49665-1-e@freeshell.de>
 <20251123225059.49665-2-e@freeshell.de>
 <20251124-free-bandicoot-of-skill-fa7d9a@kuoka>
 <20251124-state-campsite-3e7788a495c1@spud>
 <0e851ca0-1f56-437d-ae14-094c114d3b77@freeshell.de>
 <dc48fa76-0a08-4c9d-a3d7-724eb255aff8@kernel.org>
 <ff1f0e6b95150896136ab31ce13e0a2c7a3a5fe3.camel@icenowy.me>
 <489e9d44-fac6-4aa8-b094-ef20196e392b@kernel.org>
 <0a2104faee332ee143b5499c18aea3625971156c.camel@icenowy.me>
 <fb9ca9fd-1591-4e43-b055-b6ea8d55a42a@freeshell.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <fb9ca9fd-1591-4e43-b055-b6ea8d55a42a@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_002332_989630_1CE129A4 
X-CRM114-Status: GOOD (  23.00  )
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

T24gMjUvMTEvMjAyNSAxNDowNywgRSBTaGF0dG93IHdyb3RlOgo+IAo+IAo+IE9uIDExLzI1LzI1
IDAwOjAxLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDlnKggMjAyNS0xMS0yNeaYn+acn+S6jOea
hCAwODo0OCArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoKPj4+IE9uIDI1LzEx
LzIwMjUgMDg6MzMsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+Pj4g5ZyoIDIwMjUtMTEtMjXmmJ/m
nJ/kuoznmoQgMDg6MjggKzAxMDDvvIxLcnp5c3p0b2YgS296bG93c2tp5YaZ6YGT77yaCj4+Pj4+
IE9uIDI0LzExLzIwMjUgMjI6NTksIEUgU2hhdHRvdyB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBPbiAx
MS8yNC8yNSAwNToyMiwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4+Pj4+IE9uIE1vbiwgTm92IDI0
LCAyMDI1IGF0IDA4OjI4OjEwQU0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kKPj4+Pj4+PiB3
cm90ZToKPj4+Pj4+Pj4gT24gU3VuLCBOb3YgMjMsIDIwMjUgYXQgMDI6NTA6NDRQTSAtMDgwMCwg
RSBTaGF0dG93IHdyb3RlOgo+Pj4+Pj4+Pj4gRnJvbTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5v
d3kubWU+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQWRkICJ4dW5sb25nLG9yYW5nZXBpLXJ2IiBhcyBh
IFN0YXJGaXZlIEpINzExMCBTb0MtYmFzZWQKPj4+Pj4+Pj4+IGJvYXJkLgo+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+Pj4+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRSBTaGF0dG93IDxlQGZyZWVzaGVsbC5kZT4KPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gPGZvcm0gbGV0dGVyPgo+Pj4+Pj4+PiBUaGlzIGlzIGEgZnJpZW5kbHkgcmVtaW5k
ZXIgZHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSXQgbG9va3Mg
bGlrZSB5b3UgcmVjZWl2ZWQgYSB0YWcgYW5kIGZvcmdvdCB0byBhZGQgaXQuCj4+Pj4+Pj4KPj4+
Pj4+PiBJdCdzIGZyb20gbWUsIGRvbid0IHJlc3VibWl0IGp1c3QgdG8gYWRkIGl0IHNpbmNlIGl0
J2xsIGJlIG1lCj4+Pj4+Pj4gYXBwbHlpbmcKPj4+Pj4+PiBhbnl3YXkuCj4+Pj4+Pj4KPj4+Pj4+
Cj4+Pj4+PiBIaSBDb25vciwKPj4+Pj4+Cj4+Pj4+PiBPa2F5LiBZZXMgSSdkIGRyb3BwZWQgdGhl
IHRhZyBzaW5jZSB0aGUgY29tbWl0IG1lc3NhZ2UgaXMKPj4+Pj4+IGFwcHJlY2lhYmx5Cj4+Pj4+
PiBkaWZmZXJlbnQsIGFuZCB5b3Ugd291bGQgYmUgaGFuZGxpbmcgaXQgYWdhaW4gYW55d2F5cy4g
VGhhbmtzIQo+Pj4+Pj4gQW5kCj4+Pj4+PiB0aGFuawo+Pj4+Pj4geW91IEtyenlzenRvZiBmb3Ig
dGhlIHJlbWluZGVyIC1FCj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEFuZCB3aGVyZSBkaWQgeW91IGV4cGxh
aW4gdGhhdCB5b3UgZHJvcHBlZCB0aGUgdGFnIGJlY2F1c2Ugb2YKPj4+Pj4gdGhhdD8KPj4+Pj4g
UGxlYXNlIHJlYWQgdGhlIGZvcm0gbGV0dGVyIGNhcmVmdWxseS4KPj4+Pgo+Pj4+IFdlbGwgSSB0
aGluayB0aGVyZSdzIG5vIGNsZWFyIGRlZmluaXRpb24gb2YgInRoZSBwYXRjaCBoYXMgY2hhbmdl
ZAo+Pj4+IHN1YnN0YW50aWFsbHkiIGhlcmUuCj4+Pj4KPj4+PiBFIG1heSB0aGluayBmb3IgdGhp
cyBzdWNoLXNob3J0IHBhdGNoLCB0aGUgY29tbWl0IG1lc3NhZ2Ugd2VpZ2hzIGEKPj4+PiBsb3QK
Pj4+PiBhbmQgdGhlIGNoYW5nZSB0byBpdCBpcyBzaWduaWZpY2FudCB0byB0aGUgcGF0Y2ggKGUu
Zy4gbWFraW5nIHRoZQo+Pj4+IHBhdGNoCj4+Pj4gbm90IGNsZWFyIGVub3VnaCkuCj4+Pgo+Pj4g
WW91IHN0aWxsIGRpZCBub3QgYm90aGVyIHRvIHJlYWQgd2hhdCB3ZSBleHBlY3QuIEkgZG8gbm90
IGRpc2N1c3MgaWYKPj4+IHRoaXMgY2hhbmdlZCBzaWduaWZpY2FudGx5IG9yIG5vdCwgYWx0aG91
Z2ggaXQgaXMgb2J2aW91cyB0aGF0IGl0IGRpZAo+Pj4gbm90IGNoYW5nZSBhbmQgdGFnIHNob3Vs
ZCBoYXZlIGJlZW4gcmV0YWluZWQuCj4+Pgo+Pj4gTG9vayBhZ2FpbjoKPj4+IDxRVU9URT4KPj4+
IFBsZWFzZSByZWFkOgo+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTIt
cmMzL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCNM
NTc3Cj4+Pgo+Pj4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3Rh
dGUgd2h5IGFuZCB3aGF0IGNoYW5nZWQuCj4+PiA8L1FVT1RFPgo+Pj4KPj4+IFdoZXJlIGRpZCB5
b3UgZXhwbGFpbiB0aGF0Pwo+Pgo+PiBTdXJlLCBJIGFncmVlIHRoYXQgZXhwbGFpbmF0aW9uIG9m
IHRoaXMgc2hvdWxkIGJlIGRlbGl2ZXJlZC4KPj4KPj4+Cj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+
Pj4gS3J6eXN6dG9mCj4+Cj4gCj4gS3J6eXN6dG9mLAo+IAo+IFRoZSBzdWJtaXR0aW5nLXBhdGNo
ZXMgZG9jdW1lbnQgZG9lcyBub3Qgc3VwcG9ydCB5b3VyIGFzc2VydGlvbiBpbiB0aGlzCgpJIHNl
bnQgcGF0Y2ggdG8gZml4IHRoYXQgYmVjYXVzZSB0aGF0IHdhcyB0b28gbGl0ZXJhbC4gQWNrIGhh
cyB0aGUgc2FtZQpydWxlcyBhcyBSYi4KCj4gc2l0dWF0aW9uLiBJIGV2aWRlbnRseSBoYXZlIGEg
ZGlmZmVyZW50IHVuZGVyc3RhbmRpbmcgb2YgdGhhbiB5b3UsIGFzCj4gd2hlbiBJIHJlYWQgaXQg
YmVmb3JlIHNlbmRpbmcgdGhlIHNlcmllcyBJIGRpZCBhcnJpdmUgYXQgdGhlIGFjdGlvbiBvZjoK
PiAKPiAxLiBBY2tlZC1ieSBpcyBsZXNzIGZvcm1hbCBhbmQgc28gaXQgaXMgYSBtYXR0ZXIgb2Yg
b3BpbmlvbiBhbmQKPiBqdWRnZW1lbnQgd2hldGhlciB0byByZXRhaW4gaXQgb3Igbm90LiBJIGNo
b29zZSBub3QgdG8gaGVyZSBkdWUgdG8KPiBjaGFuZ2VzIHZpc2libGUgaW4gdGhlIGNvbW1pdCBs
b2cgKHRoZSBjb21taXQgbWVzc2FnZXMgYW5kIHRpdGxlcykuIEkKPiB3b3VsZCBsZXQgQ29ub3Ig
ZGVjaWRlIGlmIHRoZXkgd2lsbCBhY2tub3dsZWRnZSB0aGUgcmV2aXNlZCBzZXJpZXMKPiBpbnN0
ZWFkIG9mIG1ha2luZyB0aGF0IGRlY2lzaW9uIGZvciB0aGVtLgoKSSB2YWx1ZSBteSB0aW1lIGFu
ZCB5b3UgZHJvcHBpbmcgdGhlIHRhZyBjYXVzZXMgdGhlIHBhdGNoIGFwcGVhcmluZyBmb3IKb3Vy
IHJldmlldyBBR0FJTi4gRG9pbmcgcmV2aWV3IGFnYWluIHdpdGhvdXQgYW55IGV4cGxhbmF0aW9u
IGZyb20Kc3VibWl0dGVyIGZlZWxzIGxpa2Ugc29tZW9uZSBpcyBub3QgcmVzcGVjdGluZyBvdXIg
dGltZSwgdGhlcmVmb3JlLApzaW5jZSB5b3Uga2VlcCBkaXNhZ3JlZWluZyBvbiB0aGF0IG1hdHRl
ciwgSSB3aWxsIHN3aXRjaCB0byBwYXRjaGVzIGZyb20Kb3RoZXIgYXV0aG9ycy4KCgpCZXN0IHJl
Z2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
