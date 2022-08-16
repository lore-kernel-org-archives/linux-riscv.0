Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A239C00140
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 02:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7AayM4U/yWys3gjH4Fmrwo3lV7xWHneI4UKwU7RUrks=; b=NoanuJpCpjXLid1fQ8bIGPl2hj
	JziuOQwAwWQzhYXq6x9xj0YbSWEIGdB/emUKHQvH5F6M/g2PtpumdkLcA/xYSwlRa1GSO9VQnrQrf
	rpQ7FL5ey/h5ZuKkZSxfEPUd0VLq8f2eBEeJ6DGHCLHxFaNcWfTNncUwShC73o4AfMTqgLYGeC9i8
	M/bfWF7zTvn4ZYVsfnKm0PrI3Oy5wsuyPrxX/8CjBgJ/z2wMw51/ErTYvG3T9dORcsWZD2loPgd2D
	0RpP0SbIHlhgxMujsXl67EytbSpOGJuqwrOmlDAP5dPFQKseGMf1Wczd77t9meAn+5cjFa68EG73E
	uw11KAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNmX8-009KBN-Dg; Tue, 16 Aug 2022 02:42:22 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNmX3-009Jzm-Q8
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 02:42:19 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 6C16E32006F5;
	Mon, 15 Aug 2022 22:42:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 15 Aug 2022 22:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1660617729; x=
	1660704129; bh=HaNW5dTGTh6zJmCxeaRGccdi0HcEeWElpDsk1nTJqRI=; b=t
	O3umcuiU77ia+LxIcGxlsoBkD7xGUydhdJ15OVQ8IJk9/9QnSs6Nw4VOHLJvQZPR
	Ca1LbWEeCaqVL2cKflNzJaTwpFPgJEqXlAmZ2T6VBtQD6Yr37epnef8pxbcXYlvW
	N+5zRAps2D9YmYCHJxmyjgvszqrWn0AYMVHhKNPANOYg1IV4dvYgouGLe+vwgl5e
	rrYL2n3bnJgPrD3fgSj6c8U7+KftUG8ATZfp86bgdH8fJ0zvZQDRu4A/LdJzCh3Z
	uq7KzhuzOoGpxprxU+n2WwFfyjR8y08ICKbOgOGeDL+Es3zqUy0I7fqSS5SMTu3O
	cT5VlqGObjDw605UnpXyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660617729; x=
	1660704129; bh=HaNW5dTGTh6zJmCxeaRGccdi0HcEeWElpDsk1nTJqRI=; b=D
	pBGByD80wJUgFGnrCdO0dVRLJ7XXMteN7lEhuAw8XdBCtKAdlFlI/MdiBGdK3YI3
	SxubzMPY0N8bSAPjjfYi3ndKcjo9C4eeGDAyKvSMmphrrHQb8XMitiNTNhBbTI9Q
	uONwdbhGXDhEV1pdB8Gb6n2tXqxzHSaOBABa3z2uZYPlwo/pXqO8V+riWzLnETnO
	dzyZkMx9RaJGtrk0sRqpeLCehCs64PSxExpZ+spgWbT0Fyh6QOKkAXj2V6EO0eL7
	BZoFKE9czxotQfQg/WJIazwYjK8fkK6ZVvVa7ULKQdrs95sQ5uOWxqcGHijHbNvR
	N/forPXnfLqWuj/R5IX2g==
X-ME-Sender: <xms:AQT7YgPH9943MR27JtlDLBMQ1UDWv047NevytleYTJvMF2n4a1I9-A>
    <xme:AQT7Ym-KBuVqpclJKq1G-J0IMAKHEuQ6tmR4qAdEgb9RiweiBQIlCmPzKTYZGrNzY
    tKAJTDiCTh44ADd_g>
X-ME-Received: <xmr:AQT7YnQD3TuKms4VX3_s7lvp7z8BjA6ZAq4wP1Dq_F1qJqgmtQujYSv8MZOY2rJBUF7_XWg0GrRH-2pVBgiffAeEAdxhH1X2clArD9SXWfbpDmcjYE9FkRQDVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehfedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfevfhfhkffffgggjggtgfesth
    ekredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghl
    sehshhholhhlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepjeelfedutdeggeevvd
    ekheefjeefvefgfeeiffefgeduieeutdehkeejleegueejnecuffhomhgrihhnpehkvghr
    nhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:AQT7YoscCBqM9HQ9Yup77uhI-lPB4SA5oRa0GwitHz5blQu4F_fpJg>
    <xmx:AQT7YofNgHWbEhKUo6Q17YMlIynT7IQXQLpYbhxVchQ_K0jSM441vA>
    <xmx:AQT7Ys1o2cu0k8uFmGdfJrpCjLqalFsZA60oI0oGL2RajLzD0iQhgw>
    <xmx:AQT7YpXP4SgluZnONeW9Hylpj8Z5FhmZ0jq6Vt-1cLdxys3KCAl3kA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 22:42:08 -0400 (EDT)
Subject: Re: [PATCH 00/12] riscv: Allwinner D1 platform support
To: Conor.Dooley@microchip.com, wens@csie.org, jernej.skrabec@gmail.com,
 linux-sunxi@lists.linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org
References: <20220815050815.22340-1-samuel@sholland.org>
 <50dc816c-3129-f5aa-9777-99c6f0fa58f1@microchip.com>
 <6b8cd27d-5671-7bcb-549d-e903cf019fe3@microchip.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <6d54da3f-d4fc-7c40-38d6-4f02c7346458@sholland.org>
Date: Mon, 15 Aug 2022 21:42:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6b8cd27d-5671-7bcb-549d-e903cf019fe3@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_194218_159776_F4DD5F79 
X-CRM114-Status: GOOD (  25.46  )
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

T24gOC8xNS8yMiAxMjoxMiBQTSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4g
T24gMTUvMDgvMjAyMiAwODowNSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiBIZXkgU2FtdWVsLAo+
PiBBcG9sb2dpZXMgZm9yIHRoZSBsYXN0IGVtYWlsLCB0aGUgZmlyc3QgNSBwYXRjaGVzIGluIHRo
aXMgc2VyaWVzCj4+IGRpZG4ndCBjb3JyZWN0bHkgbGFuZCBpbiBteSBpbmJveCBhbmQgSSBza2lt
bWVkICYgcmVwbGllZCB0byB0aGUKPj4gd3JvbmcgY292ZXIgbGV0dGVyLi4uIEkgYmxhbWUgaXQg
YmVpbmcgcHJlIDggQU0gOykKPj4KPj4gT24gMTUvMDgvMjAyMiAwNjowOCwgU2FtdWVsIEhvbGxh
bmQgd3JvdGU6Cj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPj4+Cj4+PiBU
aGlzIHNlcmllcyBhZGRzIHRoZSBLY29uZmlnL2RlZmNvbmZpZyBwbHVtYmluZyBhbmQgZGV2aWNl
dHJlZXMgZm9yIGEKPj4+IHJhbmdlIG9mIEFsbHdpbm5lciBEMS1iYXNlZCBib2FyZHMuIE1hbnkg
ZmVhdHVyZXMgYXJlIGFscmVhZHkgZW5hYmxlZCwKPj4+IGluY2x1ZGluZyBVU0IsIEV0aGVybmV0
LCBhbmQgV2lGaS4KPj4+Cj4+PiBUaGUgU29DIGRldmljZXRyZWUgdXNlcyBiaW5kaW5ncyBmcm9t
IHRoZSBmb2xsb3dpbmcgc2VyaWVzIHdoaWNoIGhhdmUKPj4+IG5vdCB5ZXQgYmVlbiBtZXJnZWQ6
Cj4+PiAtIFNSQU0gY29udHJvbGxlcjoKPj4+IMKgwqAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDIyMDgxNTA0MTI0OC41MzI2OC0xLXNhbXVlbEBzaG9sbGFuZC5vcmcvCj4+PiAtIE5W
TUVNIGNlbGwgYml0cyBwcm9wZXJ0eSBjaGFuZ2U6Cj4+PiDCoMKgIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyMjA4MTQxNzM2NTYuMTE4NTYtMS1zYW11ZWxAc2hvbGxhbmQub3JnLwo+
Pj4gLSBJbi1wYWNrYWdlIExETyByZWd1bGF0b3JzOgo+Pj4gwqDCoCBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjIwODE1MDQzNDM2LjIwMTcwLTEtc2FtdWVsQHNob2xsYW5kLm9yZy8K
Pj4+Cj4+PiBBbGwgdGhyZWUgb2YgdGhlc2UgYXJlIHJlcXVpcmVkIHRvIHNldCB0aGUgY29ycmVj
dCBJL08gZG9tYWluIHZvbHRhZ2VzCj4+PiBpbiB0aGUgcGluIGNvbnRyb2xsZXIsIHdoaWNoIEkg
d291bGQgY29uc2lkZXIgaW1wb3J0YW50IHRvIGhhdmUgaW4gdGhlCj4+PiBpbml0aWFsIHZlcnNp
b24gb2YgdGhlIGRldmljZXRyZWUuCj4+Pgo+Pj4gVGhlIFNvQyBkZXZpY2V0cmVlIGRvZXMgY29u
dGFpbiBvbmUgc21hbGwgaGFjayB0byBhdm9pZCBhIGRlcGVuZGVuY3kgb24KPj4+IHRoZSBhdWRp
byBjb2RlYyBiaW5kaW5nLCBzaW5jZSB0aGF0IGlzIG5vdCByZWFkeSB5ZXQ6IHRoZSBjb2RlYyBu
b2RlCj4+PiB1c2VzIGEgYmFyZSAic2ltcGxlLW1mZCIsICJzeXNjb24iIGNvbXBhdGlibGUuCj4+
Cj4+Cj4+IEkgdHJpZWQgdGhpcyBzZXJpZXMgb24gdG9wIG9mIGJvdGggNi4wLXJjMSAmIG5leHQs
IGJ1dCBJIHNhdyBhIHNoZWQKPj4gbG9hZCBvZiBlcnJvcnMgZnJvbSBkdGJzX2NoZWNrLiBJJ2xs
IHRha2UgYSBsb29rIGF0IHRoZSByZXN0IG9mIHRoZQo+PiBzZXJpZXMgbGF0ZXIgb24sIGJ1dCBq
dXN0IEZZSS4gVGhpcyB0aW1lIEkgZGlkIGF0IGxlYXN0IHJlYWQgdGhlCj4+IHJpZ2h0IGNvdmVy
IGxldHRlciBhbmQgYWN0dWFsbHkgYXBwbGllZCB5b3VyIGRlcGVuZGVudCBzZXJpZXMuLgo+PiAv
ZmFjZXBhbG0KPj4KPj4gSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIGdldCByaXNjdiBkb3duIHRvIDAg
d2FybmluZ3MgYW5kIHdvdWxkIG5vdCBiZQo+PiBpbiBmYXZvdXIgb2YgYWNjZXB0aW5nIHBhdGNo
ZXMgdGhhdCBnbyBpbiB0aGUgb3RoZXIgZGlyZWN0aW9uLgo+PiAoVGhpcyBwYXRjaHNldCBjdXJy
ZW50bHkgcHJvZHVjZXMgYWJvdXQgNDcgbmV3IHdhcm5pbmdzKQoKT25seSA0IHVuaXF1ZSBvbmVz
IDopCgpUaGFua3MgZm9yIGNoZWNraW5nIHRoaXMuIEkgaGFkIGRvbmUgYSBjb3VwbGUgb2YgcGFz
c2VzIGNsZWFuaW5nIHRoaW5ncyB1cC4gVGhlCnJlbWFpbmluZyB3YXJuaW5ncyBhcmUgdGhlIG9u
ZXMgSSB3YXMgdW5zdXJlIGhvdyB0byBmaXguCgo+IEZXSVcgdGhpcyBpcyB3aGF0IEkgc2VlLCBM
TUsgaWYgSSBhbSBtaXNzaW5nIHNvbWV0aGluZy4KPiBhbGx3aW5uZXIvc3VuMjBpLWQxLWxpY2hl
ZS1ydi5kdGI6IGkyY0AyNTAyMDAwOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxs
b3dlZCAoJ2RtYS1uYW1lcycsICdkbWFzJyB3ZXJlIHVuZXhwZWN0ZWQpCgpUaGlzIG9uZSBpcyBu
ZXcgd2l0aCBkdC1zY2hlbWEgMjAyMi4wOC4xIChJIHdhcyBwcmV2aW91c2x5IG9uIGQxZjMxMDJl
IGxvY2FsbHkpLgpJJ20gbm90IHN1cmUgaWYgaXQgaXMgYSBidWcgaW4gdGhlIGJpbmRpbmcgb3Ig
aW4gdGhlIGR0LXNjaGVtYSB0b29sLiBUaGUKd2FybmluZ3MgZ28gYXdheSBpZiBJIGRvOgoKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9tYXJ2ZWxsLG12NjR4eHgt
aTJjLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9tYXJ2
ZWxsLG12NjR4eHgtaTJjLnlhbWwKQEAgLTcyLDYgKzcyLDcgQEAgcmVxdWlyZWQ6CiAgIC0gaW50
ZXJydXB0cwoKIGFsbE9mOgorICAtICRyZWY6IC9zY2hlbWFzL2RtYS9kbWEueWFtbCMKICAgLSAk
cmVmOiAvc2NoZW1hcy9pMmMvaTJjLWNvbnRyb2xsZXIueWFtbCMKICAgLSBpZjoKICAgICAgIHBy
b3BlcnRpZXM6CgpCdXQgSSB3b3VsZG4ndCBleHBlY3QgdGhpcyB0byBiZSBuZWNlc3NhcnksIHNp
bmNlIGRtYS55YW1sIGhhcyAic2VsZWN0OiB0cnVlIi4KQ29tcGFyZSB0aGUgdGhpcyB3aXRoIHRo
ZSBVQVJUcy4gTmVpdGhlciBzZXJpYWwvc25wcy1kdy1hcGItdWFydC55YW1sIG5vcgpzZXJpYWwv
c2VyaWFsLnlhbWwgcmVmZXJlbmNlcyBhbnkgRE1BIHByb3BlcnRpZXMsIHlldCB0aGVyZSBpcyBu
byB3YXJuaW5nIGZvciB0aG9zZS4KCj4gYWxsd2lubmVyL3N1bjIwaS1kMS1jbG9ja3dvcmtwaS12
My4xNC5kdGI6IHBtaWNAMzQ6IGNvbXBhdGlibGU6ICdvbmVPZicgY29uZGl0aW9uYWwgZmFpbGVk
LCBvbmUgbXVzdCBiZSBmaXhlZDoKPiBhbGx3aW5uZXIvc3VuMjBpLWQxLWRldnRlcm0tdjMuMTQu
ZHRiOiBwbWljQDM0OiBjb21wYXRpYmxlOiAnb25lT2YnIGNvbmRpdGlvbmFsIGZhaWxlZCwgb25l
IG11c3QgYmUgZml4ZWQ6CgpUaGUgbmV3IGNvbXBhdGlibGUgaXMgaW4gbGludXgtbmV4dC4gSSBj
YW4gYWRkIGl0IHRvIHRoZSBjb3ZlciBsZXR0ZXIgZm9yIHYyOgpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1kZXZpY2V0cmVlLzIwMjIwODEwMDEzNDMwLjI3MDYxLTEtc2FtdWVsQHNob2xs
YW5kLm9yZy8KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9sZWUvbWZkL2MvOTdlY2RhMGY2MTVlCgo+
IGFsbHdpbm5lci9zdW4yMGktZDEtbGljaGVlLXJ2LmR0YjogZXRoZXJuZXRANDUwMDAwMDogVW5l
dmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdtZGlvJywgJ3Jlc2V0LW5hbWVz
JywgJ3Jlc2V0cycgd2VyZSB1bmV4cGVjdGVkKQoKVGhpcyBzaG93ZWQgdXAgd2l0aCBhIGR0LXNj
aGVtYSB1cGRhdGUgaW4gdGhlIGxhc3QgeWVhciBvciBzby4gVGhpcyBtYXkgYmUgYSBidWcKaW4g
dGhlIGJpbmRpbmc/IGFsbHdpbm5lcixzdW44aS1hODN0LWVtYWMueWFtbCBwaWNrcyB1cCB0aGVz
ZSB0aHJlZSBwcm9wZXJ0aWVzCmZyb20gc25wcyxkd21hYy55YW1sLCBidXQgZG9lcyBub3QgaGF2
ZSB0aGVtIGluIGl0cyBvd24gInByb3BlcnRpZXMiIGJsb2NrLgoocmVzZXRzIGFuZCByZXNldC1u
YW1lcyBhcmUgZXZlbiBpbiAicmVxdWlyZWQiISkKCj4gYWxsd2lubmVyL3N1bjIwaS1kMS1saWNo
ZWUtcnYtODYtcGFuZWwtNzIwcC5kdGI6IGV0aGVybmV0QDQ1MDAwMDA6IFVuZXZhbHVhdGVkIHBy
b3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgncGh5LXN1cHBseScgd2FzIHVuZXhwZWN0ZWQpCj4g
YWxsd2lubmVyL3N1bjIwaS1kMS1kb25nc2hhbi1uZXpoYS1zdHUuZHRiOiBldGhlcm5ldEA0NTAw
MDAwOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ3BoeS1zdXBwbHkn
IHdhcyB1bmV4cGVjdGVkKQoKSSB0aGluayB0aGlzIG9uZSBpcyBqdXN0IGZsYXQgb3V0IG1pc3Np
bmcgZnJvbSB0aGUgYmluZGluZy4gSXQgaXMgcHJlc2VudCBpbiB0aGUKb3RoZXIgdHdvIEFsbHdp
bm5lciBFdGhlcm5ldCBNQUMgYmluZGluZ3MsIGJ1dCBub3QgdGhpcyBvbmUuCgpSZWdhcmRzLApT
YW11ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
