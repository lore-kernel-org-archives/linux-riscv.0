Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B10CFD364
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsZ/6rmktI9smGILqvmbbc/rkPDeBj2a8ClxrQmenJY=; b=1+X8Kq8MV009jP
	9xDpBviJMz6ag77Qx1s+la4MGInQFFSqBSZcrDxtJxWAR8u8uScwEt1V4Kaxq3clc1njuRTA1E1oX
	TwKeSGEgtOYV9oUwZr1EpL2np/ht6tDX+L/NsXwigatEdawb4DkSwFvOXyZiu0Ke8w9NB3AuNyUO+
	c9+OFhaJKsnceltaYQ4/qqOrBjxeqEmlEY0KOKrNaSVPMniPoq6rEFPcY/r3cTsMz1Tv8NwzaqtIb
	ASVkw6vxjRn73X9KAEuUNhV5k8dcpBftNLOSHf9KXRqfgFQwxpw6nwO2SLIzn5eHQv8D1iHYrRgj9
	jyOENKGgBoqNx7XOkN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnnF-0000000CvIL-3qrE;
	Tue, 25 Nov 2025 07:48:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnnE-0000000CvIE-0ADE
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 07:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2608D600CB;
	Tue, 25 Nov 2025 07:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29151C4CEF1;
	Tue, 25 Nov 2025 07:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764056934;
	bh=x5pM9zLxuZpXecYHZhCLKWNXWy74V7ajlcL8XDCy0hw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FtxFb7IdXe1YA2OK4XCBYVUAEISvUoL6lGCR5hiUmbzY18VuDIyAMN4wmBorYG56C
	 QPEKXVqSs1DE7wk+xjAt57EeQZeeOGlq+S9WzSidsL9TBse+1NZszC9LxMJ1vMeDc+
	 We/nxAW26dKCe5CrobQ8E/NJr3lreZDnSzpcF2ASwmZ/dacdE2L+XPvhx+2iUZuIW0
	 zFeyb2qv0qcdSCdSVjAbHvUYtGMaBAqmdx5EcWGPGr5fmHsvjdNN/3ueen6AaBERyY
	 oG3bKVWGaqLfR48pWSik0JgWEWZQlX7IzF6gjUqtBSNxBbCUTJ9JXdvOEN0JxkNaqw
	 W3GiMhWTaB6Ag==
Message-ID: <489e9d44-fac6-4aa8-b094-ef20196e392b@kernel.org>
Date: Tue, 25 Nov 2025 08:48:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: starfive: add
 xunlong,orangepi-rv
To: Icenowy Zheng <uwu@icenowy.me>, E Shattow <e@freeshell.de>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ff1f0e6b95150896136ab31ce13e0a2c7a3a5fe3.camel@icenowy.me>
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

T24gMjUvMTEvMjAyNSAwODozMywgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0xMS0y
NeaYn+acn+S6jOeahCAwODoyOCArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gMjQvMTEvMjAyNSAyMjo1OSwgRSBTaGF0dG93IHdyb3RlOgo+Pj4KPj4+IE9uIDExLzI0
LzI1IDA1OjIyLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+Pj4gT24gTW9uLCBOb3YgMjQsIDIwMjUg
YXQgMDg6Mjg6MTBBTSArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraQo+Pj4+IHdyb3RlOgo+Pj4+
PiBPbiBTdW4sIE5vdiAyMywgMjAyNSBhdCAwMjo1MDo0NFBNIC0wODAwLCBFIFNoYXR0b3cgd3Jv
dGU6Cj4+Pj4+PiBGcm9tOiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPj4+Pj4+Cj4+
Pj4+PiBBZGQgInh1bmxvbmcsb3JhbmdlcGktcnYiIGFzIGEgU3RhckZpdmUgSkg3MTEwIFNvQy1i
YXNlZAo+Pj4+Pj4gYm9hcmQuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBa
aGVuZyA8dXd1QGljZW5vd3kubWU+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBFIFNoYXR0b3cgPGVA
ZnJlZXNoZWxsLmRlPgo+Pj4+Pgo+Pj4+PiA8Zm9ybSBsZXR0ZXI+Cj4+Pj4+IFRoaXMgaXMgYSBm
cmllbmRseSByZW1pbmRlciBkdXJpbmcgdGhlIHJldmlldyBwcm9jZXNzLgo+Pj4+Pgo+Pj4+PiBJ
dCBsb29rcyBsaWtlIHlvdSByZWNlaXZlZCBhIHRhZyBhbmQgZm9yZ290IHRvIGFkZCBpdC4KPj4+
Pgo+Pj4+IEl0J3MgZnJvbSBtZSwgZG9uJ3QgcmVzdWJtaXQganVzdCB0byBhZGQgaXQgc2luY2Ug
aXQnbGwgYmUgbWUKPj4+PiBhcHBseWluZwo+Pj4+IGFueXdheS4KPj4+Pgo+Pj4KPj4+IEhpIENv
bm9yLAo+Pj4KPj4+IE9rYXkuIFllcyBJJ2QgZHJvcHBlZCB0aGUgdGFnIHNpbmNlIHRoZSBjb21t
aXQgbWVzc2FnZSBpcwo+Pj4gYXBwcmVjaWFibHkKPj4+IGRpZmZlcmVudCwgYW5kIHlvdSB3b3Vs
ZCBiZSBoYW5kbGluZyBpdCBhZ2FpbiBhbnl3YXlzLiBUaGFua3MhIEFuZAo+Pj4gdGhhbmsKPj4+
IHlvdSBLcnp5c3p0b2YgZm9yIHRoZSByZW1pbmRlciAtRQo+Pgo+Pgo+PiBBbmQgd2hlcmUgZGlk
IHlvdSBleHBsYWluIHRoYXQgeW91IGRyb3BwZWQgdGhlIHRhZyBiZWNhdXNlIG9mIHRoYXQ/Cj4+
IFBsZWFzZSByZWFkIHRoZSBmb3JtIGxldHRlciBjYXJlZnVsbHkuCj4gCj4gV2VsbCBJIHRoaW5r
IHRoZXJlJ3Mgbm8gY2xlYXIgZGVmaW5pdGlvbiBvZiAidGhlIHBhdGNoIGhhcyBjaGFuZ2VkCj4g
c3Vic3RhbnRpYWxseSIgaGVyZS4KPiAKPiBFIG1heSB0aGluayBmb3IgdGhpcyBzdWNoLXNob3J0
IHBhdGNoLCB0aGUgY29tbWl0IG1lc3NhZ2Ugd2VpZ2hzIGEgbG90Cj4gYW5kIHRoZSBjaGFuZ2Ug
dG8gaXQgaXMgc2lnbmlmaWNhbnQgdG8gdGhlIHBhdGNoIChlLmcuIG1ha2luZyB0aGUgcGF0Y2gK
PiBub3QgY2xlYXIgZW5vdWdoKS4KCllvdSBzdGlsbCBkaWQgbm90IGJvdGhlciB0byByZWFkIHdo
YXQgd2UgZXhwZWN0LiBJIGRvIG5vdCBkaXNjdXNzIGlmCnRoaXMgY2hhbmdlZCBzaWduaWZpY2Fu
dGx5IG9yIG5vdCwgYWx0aG91Z2ggaXQgaXMgb2J2aW91cyB0aGF0IGl0IGRpZApub3QgY2hhbmdl
IGFuZCB0YWcgc2hvdWxkIGhhdmUgYmVlbiByZXRhaW5lZC4KCkxvb2sgYWdhaW46CjxRVU9URT4K
UGxlYXNlIHJlYWQ6Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEyLXJjMy9z
b3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDU3NwoK
SWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFuZCB3
aGF0IGNoYW5nZWQuCjwvUVVPVEU+CgpXaGVyZSBkaWQgeW91IGV4cGxhaW4gdGhhdD8KCgpCZXN0
IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
