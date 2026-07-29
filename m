Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2883C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drfeG1lTvLfCXcKlIiqUWgwgVJef7ztTSOCynDRB52A=; b=opWSjuE+ypXqoS
	yk4I/pLWZXgvtn/eNuznrBmI0DcRjBqCIBYtbSgTGVsI2TJ8b+xBo9ARuQ5K2iN2fYKEq0fOqrRFM
	dtkJw4m8l752pybkDCjNPyG0tW3aG8MCNiy0iXS3sJU84T/28dpieKvmWQbh6/MLvqb3GixkfF7o4
	mFgi0SGKhLYEBMZ7Q2A32qsOb1FooaWKEfQ9fojNn1T3iqCNz+njXpzcjw2PAz4dTHiOqohPdEnXp
	hAbKKGbpmASGT0pAtAJt62Cwlp6XubVRZTUTvY9kJJo2wMxPcBd2Zo3PX4g2kveP3eW2cG8FNa+Yi
	EwOtTrPWXjflu99OS/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpBo1-000000090ZR-24yD;
	Wed, 29 Jul 2026 21:27:13 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpBnx-000000090YX-3z2h
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 21:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1785360411;
	bh=qIeB7odIPYqV8wTIrHOpI6P/vGVIYxJtiGk+dolwf/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R5PrIS8UrT3OoxRFc88eOYa3p0BWuImXPSWlI7GxpU2i0ZaYtD7Ki+HzqTgssZKPm
	 grbRgQIixF21CyT8fN0C+kiUIGWwTQquolHJWW7Sg42yF2Z3PDvt7Af6cNh7+kjD3l
	 CvFyfYPeWfHlPgaMdIHpTNOiuEA9O1vCMMETCH9PIqnKAqlE6SsfA4z4Onn++ssPOw
	 Yk3IvO3d5QSLcyl37AXaStjHaFRPbdFZj+XWSBvy022z6f5H9mHTLlo9QN8lAF8rAG
	 wg6jYEw1ZTuDv2xdy9w0+F1DNCMUYiEMCjGXaGfkvGnaR1R8jKDbqyXUB5flb4sf5S
	 CjbDkf6Ddv4tw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 0BC81B220608;
	Wed, 29 Jul 2026 23:26:49 +0200 (CEST)
Message-ID: <d09431e5-37c0-4b92-ac93-d6f01a053b96@freeshell.de>
Date: Wed, 29 Jul 2026 14:26:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot
 from SD-card.
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Conor Dooley <mail@conchuod.ie>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 Ilya Sorochan <k0tran@altlinux.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20260306171939.84568-1-k0tran@altlinux.org>
 <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
 <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
 <bb94e760-c7c3-43be-a221-5a45f8ec2db2@canonical.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <bb94e760-c7c3-43be-a221-5a45f8ec2db2@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_142710_479733_20D0054A 
X-CRM114-Status: GOOD (  15.57  )
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

CgpPbiA3LzI5LzI2IDA0OjIxLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+IE9uIDcvMjkv
MjYgMTE6MzksIEUgU2hhdHRvdyB3cm90ZToKPj4KPj4KPj4gT24gNy8yOC8yNiAxMTowMiwgQ29u
b3IgRG9vbGV5IHdyb3RlOgo+Pj4gRnJvbTogQ29ub3IgRG9vbGV5IDxtYWlsQGNvbmNodW9kLmll
Pgo+Pj4KPj4+IE9uIEZyaSwgMDYgTWFyIDIwMjYgMjA6MTk6MzkgKzAzMDAsIElseWEgU29yb2No
YW4gd3JvdGU6Cj4+Pj4gQWRkIGJvb3RwaC1wcmUtcmFtIHRvIG1tYzFfcGlucyBjbGstcGlucy4K
Pj4+Pgo+Pj4+IFUtQm9vdCBwcnVuZWQgdGhlaXIgb3ZlcnJpZGVzIHJlY2VudGx5IGluIGZhdm9y
IG9mIExpbnV4IHdoaWNoIGJyb2tlCj4+Pj4gYm9vdGluZwo+Pj4+IGZyb20gc2QtY2FyZCBmb3Ig
bWUgYW5kIEhlaW5yaWNoIFNjaHVjaGFyZHQgWzFdLiBQcnVuaW5nIGNvbW1pdDoKPj4+PiAyN2Y2
MTcwMTlkZDA3MGNiNjFmMiAoInJpc2N2OiBkdHM6IHN0YXJmaXZlOiBwcnVuZSByZWR1bmRhbnQg
amg3MTEwLQo+Pj4+IGNvbW1vbiBvdmVycmlkZXMiKQo+Pj4+Cj4+Pj4gWzFdwqAgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLwo+Pj4+IGZmZGZjNTUwLTU1OWItNGM1OS05ODczLTNmMDQwZmMz
YmIwZUBjYW5vbmljYWwuY29tLwo+Pj4+Cj4+Pj4gWy4uLl0KPj4+Cj4+PiBSaWdodCwgSSBhbSBn
b2luZyB0byB0cnkgdGhpcyBhZ2Fpbi4gSSBkb24ndCB0aGluayB0aGVyZSdzIGFjdHVhbGx5IGEK
Pj4+IHZhbGlkIHRlY2huaWNhbCBhcmd1bWVudCBhZ2FpbnN0IGl0LCBzaW5jZSBpdCBqdXN0IGFm
ZmVjdHMgdGhlIHN0YWdlIGF0Cj4+PiB3aGljaCBjb25maWd1cmF0aW9uIGlzIGFwcGxpZWQgcmF0
aGVyIHRoYW4gY29uZmlndXJhdGlvbiBpdHNlbGYuCj4+PiBJZiB0aGUgY29uZmlndXJhdGlvbiBp
cyB3cm9uZywgYW5kIG1vcmUgZGV2aWNlcyBkb24ndCB1c2UgdGhpcwo+Pj4gY29uZmlndXJhdGlv
bgo+Pj4gdGhhbiBkbywgcGVvcGxlIG5lZWQgdG8gbW92ZSB0aGUgbm9kZSB0byB3aGVyZSB0aGV5
IHRoaW5rIHNob3VsZCBiZS4KPj4+IFRoYXQKPj4+IHNoYWxsIGJlIGRvbmUgc2VwYXJhdGVseS4K
Pj4+Cj4+PiBJIGRvbid0IHdhbnQgdG8gaGVhciBhYm91dCB0aGUgcG9saXRpY3MgYWJvdXQgd2hl
dGhlciBvciBub3QgU3RhcmZpdmUKPj4+IHdhbnQKPj4+IHRvIHN1cHBvcnQgaXQgb3IgcmV2ZXJz
ZSBlbmdpbmVlcmluZyBvZiBiaW5hcmllcyBldGMuIEFsbCB0aGF0IEkgY2FyZQo+Pj4gYWJvdXQK
Pj4+IGlzIGRpc2N1c3Npb24gb2YgdGhlIGhhcmR3YXJlIGl0c2VsZiBhbmQgd2hpY2ggYm9hcmRz
IG5lZWQgdGhpcyBhbmQKPj4+IHdoaWNoIGRvCj4+PiBub3QuCj4+Pgo+Pj4gQXBwbGllZCB0byBy
aXNjdi1kdC1maXhlcywgdGhhbmtzIQo+Pj4KPj4+IFsxLzFdIHJpc2N2OiBkdHM6IHN0YXJmaXZl
OiBqaDcxMTAtY29tbW9uOiBmaXggamg3MTEwIFNvQyBib290IGZyb20KPj4+IFNELWNhcmQuCj4+
PiDCoMKgwqDCoMKgwqAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jb25vci9jLzQyYzU3YzA0OTA1
NAo+Pj4KPj4+IFRoYW5rcywKPj4+IENvbm9yLgo+Pgo+PiBTZWNvbmQgTkFLIHRvIHRoaXMgYmVp
bmcgYXBwbGllZCwgYWdhaW4sIGRvIG5vdCBhcHBseSBhcy1pcy4KPj4KPj4gQXMgeW91J3JlIG5v
dCBpbnRlcmVzdGVkIGluIHRoZSB0ZWNobmljYWwgZGlzY3Vzc2lvbiwgdGhlbiB5b3Ugd29uJ3QK
Pj4gaGF2ZSBvbmUuCj4+Cj4+IC1FCj4gCj4gQXMgRSBkb2VzIG5vdCBvZmZlciBhbnkgcmVhc29u
IGZvciB0aGVpciBOQUssIEkgZ3Vlc3MgaXQgY2FuIGJlIHNhZmVseQo+IGlnbm9yZWQgYXMgaW52
YWxpZC4KPiAKPiBCZXN0IHJlZ2FyZHMKPiAKPiBIZWlucmljaAo+IAo+IAoKUmVhc29uIGhhcyBu
b3QgY2hhbmdlZCBpbiA0KyBtb250aHMgc2luY2UgdGhlIGxhc3QgYXR0ZW1wdCB0byBzaG92ZSB0
aGlzCnBhdGNoIHRocm91Z2ggd2l0aG91dCB0ZWNobmljYWwgbWVyaXQuIFBsZWFzZSBwYXJ0aWNp
cGF0ZSBpbnN0ZWFkIG9mCmJlaW5nIGxpa2UgaG93ZXZlciB0aGlzIGlzIHRvd2FyZCBtZSwgSSB3
b3VsZCBncmVhdGx5IHZhbHVlIHlvdXIKYW5hbHlzaXMgaWYgeW91IHdvdWxkIGp1c3QgYXR0ZW1w
dCB0byBkbyBzbyBhcyBIYWwgYW5kIG15c2VsZiBoYXZlIGRvbmUuCkl0IGlzIHVuZm9ydHVuYXRl
IEkgZmluZCBkaXNjcmVwYW5jaWVzIGluIEhhbCdzIGRlc2NyaXB0aW9uIHRoYXQgcGxhaW5seQpk
b2VzIG5vdCBtYXRjaCB3aGF0IEkgZmluZCBpbiB0aGUgYWN0dWFsIGhhcmR3YXJlLiBXZSBzaG91
bGQgZG8gc29tZSBvZgp0aGUgd29yayBoZXJlIG5vdCByZWx5aW5nIG9uIEhhbCwgYW5kIGVzcGVj
aWFsbHkgbm90IHJlbHlpbmcgb24gbXlzZWxmCihJJ20gbm90IGEgY2FyZWVyIHByb2dyYW1tZXIg
b2J2aW91c2x5KS4gV2lsbCB5b3UgZmluZCB0aW1lIHRvCnBhcnRpY2lwYXRlIGluIHJldmlldyBv
ZiB0aGUgU3RhckZpdmUgbG9hZGVyIGNvZGUgYW5kIGZlYXR1cmVzIHRoYXQgYXJlCnB1cnBvcnRl
ZCB0byBiZSBzbyBkZXNpcmVkIGZvciBVLUJvb3QgY29tcGF0aWJpbGl0eT8KCmh0dHBzOi8vd2Vi
LmFyY2hpdmUub3JnL3dlYi8yMDI2MDUwMTIxMDYwNS9odHRwczovL2ZyZWVzaGVsbC5kZS9lL3Jp
c2N2NjQvaHJ2LWpocmUtSkgtNzExMCUyMEJvb3RST00lMjBhbmFseXNpc18yMDI2XzAyXzIyLmdh
cgoKLUUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
