Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1A8C44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TUV7pjiM1OPqkxUkvyvyqBbFvwAModMJ7Li/nXGVxo=; b=fEOJfdF8/e/cFG
	zG3W+iWbPeGuXfnoXoChDEKAhq/Hl6KnYZ4NrBk2CFQjQmYrRNaE6aFRM//kXhVWqOExtPtMp4sj2
	Rm07XJfLQFU1sjUU5PVjMgidiqmQ4WkBLP9sc+vpv2xrRwS9pwKTFP8M0zS+RtPgI5zvw5EgnDrq6
	KqU7OuxV7jY3M69dvbjdERmdpdgaksOl2yTsmYlT+JEKDc2/ZtrDyYmacRY4wSRPUOjhACri+/mxE
	fsvuu67DJILhNqZ/rUGN37KCuHBXFabQHj8Mgw7fIbxDIYlfNYg4HMTVHHgn1ZonUgrTdwr+H1G+v
	P81dUw1NxgUVYxMXulUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaXP-0000000BaUm-01Xu;
	Tue, 14 Jul 2026 10:38:55 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaXM-0000000BaUE-2jAA
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 10:38:53 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gzwlF1FH2zKn6W;
	Tue, 14 Jul 2026 12:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784025529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQRClI1WHGqvIeiewR59N1xWQ5Dskfhayb2qkUVyZyk=;
	b=GVjizdYYnDvtzhcGVhi53BMPE6ECY25CIiUjvHtRW2n8R0Ay4OUB3BZA5mBaQNX+WcC0ls
	yEVYBAapDQmKYalE5Q50VppsXKSjwtV3+Jt33btsFhUwY94Hd5jSRTaSeXyLjxB8H8IaW3
	nTxxBaXnbKx4FG0TbgE3jIZtBkAE9Ib6J5l8Tq/AbsTLNjnMKUDzCnp8wP30oXRrQaIMc0
	sjwtQ/t27k+GKA/xN7X0FpyuVUoblCw7c+A95Er5K99PxuF7XVmEYj3+o7vdH4dUa+XHlD
	BIjj0ARlthj23hcWRJxdRww8g2zodEqY2NoXUwnB6xbVTHbvnhFshVJ+3HPwzw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wx9EybNJ;
	spf=pass (outgoing_mbo_mout: domain of shuwei.wu@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=shuwei.wu@mailbox.org
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784025527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQRClI1WHGqvIeiewR59N1xWQ5Dskfhayb2qkUVyZyk=;
	b=wx9EybNJh/mNTtcPVrb+Oo3WjXlCx+IH5OVOTsN+UA06FT7OEVBhuHgUfdtDMjoI0oH5nJ
	tF3aw2KbR2S4ARSDCYCg45o103pJpM0TIjqb6QBLFFpqXl1LFCBKfkE/US2lmko+ibaHtj
	O5rcUpSo5ECyvMUf3Wr03b8nCpQrEJNryB3q7qFTzwI8uVC1mumnru+sy+Jrjx3+0ZmFhO
	FO7yiVFt5wNsb2YH3OhL4L7+f2KDXcTttDaaCQfPwMCinuBeUqEjaj7osaIt7hIkEdyrnZ
	2tuMhVDr9F9C40vsf6fXmM9RfS7cegPOLZFvpgY101/FNZSJv7Lc7/wY2fa3Pg==
Date: Tue, 14 Jul 2026 18:38:35 +0800
Message-Id: <DJY89JCAP6HK.2RUO09KG9FSWA@mailbox.org>
Subject: Re: [PATCH] thermal: spacemit: k1: disable hardware on driver
 remove
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Pei Xiao" <xiaopei01@kylinos.cn>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, <dlan@kernel.org>, <rafael@kernel.org>,
 <shuwei.wu@mailbox.org>, <linux-pm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <1db7d94eeaced9a92e3670d28e0c97c22f15f108.1783931396.git.xiaopei01@kylinos.cn> <DJXB4PDMYX0G.1TC9VBR96MHMA@linux.spacemit.com> <b7803ac7-c9e1-4905-9256-4b67e41ad1ac@kylinos.cn>
In-Reply-To: <b7803ac7-c9e1-4905-9256-4b67e41ad1ac@kylinos.cn>
X-MBO-RS-META: g1pnnbscjrnt9rtbja9g3w6t59ioi4yr
X-MBO-RS-ID: 45e1db2ad9b25c0df3c
X-Rspamd-Queue-Id: 4gzwlF1FH2zKn6W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_033852_862214_1EE4B948 
X-CRM114-Status: GOOD (  13.97  )
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

SGkgUGVpLAoKT24gTW9uIEp1bCAxMywgMjAyNiBhdCA0OjU1IFBNIENTVCwgUGVpIFhpYW8gd3Jv
dGU6Cj4KPgo+IOWcqCAyMDI2LzcvMTMgMTY6NDAsIFRyb3kgTWl0Y2hlbGwg5YaZ6YGTOgo+PiBP
biBNb24gSnVsIDEzLCAyMDI2IGF0IDE6MzIgQU0gUERULCBQZWkgWGlhbyB3cm90ZToKPj4+IFRo
ZSBkcml2ZXIgdXNlcyBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCkgYnV0IG5ldmVyIGRpc2Fi
bGVzIHRoZQo+Pj4gaGFyZHdhcmUgaW50ZXJydXB0IGVuYWJsZSwgc2Vuc29yIGVuYWJsZSwgb3Ig
c2Vuc29yIHBvd2VyIGJpdHMgd2hlbgo+Pj4gdGhlIGRyaXZlciBpcyB1bmJvdW5kLgo+Pj4KPj4+
IEFkZCBhIGRldm0gYWN0aW9uIHRoYXQgY2xlYXJzIEsxX1RTRU5TT1JfSU5UX0VOX1JFRywKPj4+
IEsxX1RTRU5TT1JfRU5fQUxMLCBhbmQgSzFfVFNFTlNPUl9QQ1RSTF9FTkFCTEUgb24gcmVtb3Zl
LCBtaXJyb3JpbmcKPj4+IHdoYXQgazFfdHNlbnNvcl9pbml0KCkgc2V0cyB1cC4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBQZWkgWGlhbyA8eGlhb3BlaTAxQGt5bGlub3MuY24+Cj4+PiAtLS0KPj4+
ICBkcml2ZXJzL3RoZXJtYWwvc3BhY2VtaXQvazFfdHNlbnNvci5jIHwgMjcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVybWFsL3NwYWNlbWl0L2sxX3RzZW5zb3IuYyBi
L2RyaXZlcnMvdGhlcm1hbC9zcGFjZW1pdC9rMV90c2Vuc29yLmMKPj4+IGluZGV4IDc5MjIyZDIz
MzEyOS4uY2Y3OWRjN2Q0MDNmIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy90aGVybWFsL3NwYWNl
bWl0L2sxX3RzZW5zb3IuYwo+Pj4gKysrIGIvZHJpdmVycy90aGVybWFsL3NwYWNlbWl0L2sxX3Rz
ZW5zb3IuYwo+Pj4gQEAgLTE5OSw2ICsxOTksMjkgQEAgc3RhdGljIGlycXJldHVybl90IGsxX3Rz
ZW5zb3JfaXJxX3RocmVhZChpbnQgaXJxLCB2b2lkICpkYXRhKQo+Pj4gIAlyZXR1cm4gSVJRX0hB
TkRMRUQ7Cj4+PiAgfQo+Pj4gIAo+Pj4gK3N0YXRpYyB2b2lkIGsxX3RzZW5zb3Jfc2h1dGRvd24o
c3RydWN0IGsxX3RzZW5zb3IgKnRzKQo+Pj4gK3sKPj4+ICsJdTMyIHZhbDsKPj4+ICsKPj4+ICsJ
LyogRGlzYWJsZSBhbGwgaW50ZXJydXB0cyAqLwo+Pj4gKwl3cml0ZWwoMHhmZmZmZmZmZiwgdHMt
PmJhc2UgKyBLMV9UU0VOU09SX0lOVF9FTl9SRUcpOwo+Pj4gKwo+Pj4gKwkvKiBEaXNhYmxlIGFs
bCBzZW5zb3IgKi8KPj4+ICsJdmFsID0gcmVhZGwodHMtPmJhc2UgKyBLMV9UU0VOU09SX0VOX1JF
Ryk7Cj4+PiArCXZhbCAmPSB+SzFfVFNFTlNPUl9FTl9BTEw7Cj4+PiArCXdyaXRlbCh2YWwsIHRz
LT5iYXNlICsgSzFfVFNFTlNPUl9FTl9SRUcpOwo+Pj4gKwo+Pj4gKwkvKiBQb3dlciBkb3duIHRo
ZSBzZW5zb3IgbW9kdWxlICovCj4+PiArCXZhbCA9IHJlYWRsKHRzLT5iYXNlICsgSzFfVFNFTlNP
Ul9QQ1RSTF9SRUcpOwo+Pj4gKwl2YWwgJj0gfksxX1RTRU5TT1JfUENUUkxfRU5BQkxFOwo+PiBX
aHkgaXMgb25seSB0aGUgRU5BQkxFIGJpdCBjbGVhcmVkIGhlcmU/Cj4+IEF0IGluaXQgdGltZSB0
aGUgZHJpdmVyIGFsc28gc2V0czoKPj4gICAgIHZhbCB8PSBLMV9UU0VOU09SX1BDVFJMX1JBV19T
RUwgfAo+PiAgICAgSzFfVFNFTlNPUl9QQ1RSTF9URU1QX01PREUgfAo+PiAgICAgSzFfVFNFTlNP
Ul9QQ1RSTF9IV19BVVRPX01PREUgfAo+PiAgICAgSzFfVFNFTlNPUl9QQ1RSTF9FTkFCTEU7Cj4+
Cj4+IFNob3VsZCB0aGUgb3RoZXIgYml0cyBiZSBjbGVhcmVkIGluIHNodXRkb3duIGFzIHdlbGws
IG9yIGlzIGNsZWFyaW5nIEVOQUJMRQo+PiBhbG9uZT8KPiBIaSBUcm95LAo+IMKgTWF5YmUgV3Uo
YXV0aG9yKSBoYXZlIHNvbWV0aW5nIHRvIHNheSBhYm91dCB0aGVzZSByZWdzLgo+IMKgVGhhbmtz
Lgo+Cj4gUGVpLgoKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4KCkkgYWdyZWUgdGhhdCB0
aGUgc2h1dGRvd24gcGF0aCBzaG91bGQgY2xlYXIgYWxsIGNvbnRyb2wgYml0cwpzZXQgYnkgazFf
dHNlbnNvcl9pbml0KCkuCgpUaGUgbWFuYWdlZCBjbGVhbnVwIHdpbGwgYXNzZXJ0IHRoZSByZXNl
dCwgYnV0IHRoZSByZXNldCBvcGVyYXRpb24gbWF5IGZhaWwKYW5kIGl0cyByZXR1cm4gdmFsdWUg
aXMgaWdub3JlZC4gVGhlcmVmb3JlLCBpdCBpcyBzYWZlciB0byBkaXNhYmxlIHRoZXNlCnNldHRp
bmdzIGV4cGxpY2l0bHkgYmVmb3JlIHJlbGVhc2luZyB0aGUgcmVzb3VyY2VzLgoKPgo+Cj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtIFRyb3kKCi0tIApCZXN0IHJlZ2FyZHMsClNodXdl
aSBXdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
