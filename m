Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2A4C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 09:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQqgcSywyQBontCKnyYIAEV3kuZ04RX/xfDz6kItu90=; b=pZwAMAVNYHyU26YTGfQ1T/7mjb
	JcYdlCE5sDJmrvxqcE+pbPsArHskeOdtat1hHItdida7r+ShdBJS94N/4MJTYiIQQnn7/+agYVUFr
	iirU1EMtGbC2OJpNw5Q6tWpREIRtjozlL2PFcGi03LF+UeXZHEu8/nkh+7apH3PLODg4/bfid5Rij
	xo8mv8q+6OIgH99fhf/VO+aQLFp8ajQb/VP6UcvTgPi5r9seRVFXa0gxhyig1+Oe6V5Cbw4ad/USE
	qNHVhl1BsYs3tUBNNUvO04CtFcT314iS8UitxTFAENsIOd4Vc89TqmYcGisFnpaE07Pyge11a44DS
	rAW9y8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q51LX-006QQf-3B;
	Fri, 02 Jun 2023 09:45:23 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q51LV-006QOn-0s
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 09:45:23 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id BACD1FF805;
	Fri,  2 Jun 2023 09:45:13 +0000 (UTC)
Message-ID: <47f933c3-96db-51c9-2bf2-dc360c4ef261@ghiti.fr>
Date: Fri, 2 Jun 2023 11:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance (2)
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: syzbot <syzbot+a74d57bddabbedd75135@syzkaller.appspotmail.com>,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, syzkaller-bugs@googlegroups.com
References: <000000000000f76bf505fd139515@google.com>
 <811d21e0-3071-d82e-204b-26834eca7b92@ghiti.fr>
In-Reply-To: <811d21e0-3071-d82e-204b-26834eca7b92@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_024521_456173_74FB24D3 
X-CRM114-Status: GOOD (  13.19  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDAyLzA2LzIwMjMgMDk6NTgsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPgo+IE9uIDAxLzA2
LzIwMjMgMTg6MDQsIHN5emJvdCB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+IHN5emJvdCBmb3VuZCB0
aGUgZm9sbG93aW5nIGlzc3VlIG9uOgo+Pgo+PiBIRUFEIGNvbW1pdDrCoMKgwqAgOGRjMmE3ZTgw
MjdmIHJpc2N2OiBGaXggcmVsb2NhdGFibGUga2VybmVscyB3aXRoIAo+PiBlYXJseSBhbHQuLgo+
PiBnaXQgdHJlZTogCj4+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9yaXNjdi9saW51eC5naXQgZml4ZXMKPj4gY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6
a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTE3ZTlmYmNkMjgwMDAwCj4+IGtlcm5lbCBj
b25maWc6IAo+PiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD02YjRi
ZjAxYmJiMDdmOTQ1Cj4+IGRhc2hib2FyZCBsaW5rOiAKPj4gaHR0cHM6Ly9zeXprYWxsZXIuYXBw
c3BvdC5jb20vYnVnP2V4dGlkPWE3NGQ1N2JkZGFiYmVkZDc1MTM1Cj4+IGNvbXBpbGVyOsKgwqDC
oMKgwqDCoCByaXNjdjY0LWxpbnV4LWdudS1nY2MgKERlYmlhbiAxMC4yLjEtNikgMTAuMi4xIAo+
PiAyMDIxMDExMCwgR05VIGxkIChHTlUgQmludXRpbHMgZm9yIERlYmlhbikgMi4zNS4yCj4+IHVz
ZXJzcGFjZSBhcmNoOiByaXNjdjY0Cj4+Cj4+IERvd25sb2FkYWJsZSBhc3NldHM6Cj4+IGRpc2sg
aW1hZ2UgKG5vbi1ib290YWJsZSk6IAo+PiBodHRwczovL3N0b3JhZ2UuZ29vZ2xlYXBpcy5jb20v
c3l6Ym90LWFzc2V0cy9hNzQxYjM0ODc1OWMvbm9uX2Jvb3RhYmxlX2Rpc2stOGRjMmE3ZTgucmF3
Lnh6Cj4+IHZtbGludXg6IAo+PiBodHRwczovL3N0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vc3l6Ym90
LWFzc2V0cy84MjJlM2NiZTI5YWQvdm1saW51eC04ZGMyYTdlOC54ego+PiBrZXJuZWwgaW1hZ2U6
IAo+PiBodHRwczovL3N0b3JhZ2UuZ29vZ2xlYXBpcy5jb20vc3l6Ym90LWFzc2V0cy83YmRhMjRh
YmYxYzIvSW1hZ2UtOGRjMmE3ZTgueHoKPj4KPj4gSU1QT1JUQU5UOiBpZiB5b3UgZml4IHRoZSBp
c3N1ZSwgcGxlYXNlIGFkZCB0aGUgZm9sbG93aW5nIHRhZyB0byB0aGUgCj4+IGNvbW1pdDoKPj4g
UmVwb3J0ZWQtYnk6IHN5emJvdCthNzRkNTdiZGRhYmJlZGQ3NTEzNUBzeXprYWxsZXIuYXBwc3Bv
dG1haWwuY29tCj4+Cj4+Cj4+Cj4+IC0tLQo+PiBUaGlzIHJlcG9ydCBpcyBnZW5lcmF0ZWQgYnkg
YSBib3QuIEl0IG1heSBjb250YWluIGVycm9ycy4KPj4gU2VlIGh0dHBzOi8vZ29vLmdsL3Rwc21F
SiBmb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCBzeXpib3QuCj4+IHN5emJvdCBlbmdpbmVlcnMg
Y2FuIGJlIHJlYWNoZWQgYXQgc3l6a2FsbGVyQGdvb2dsZWdyb3Vwcy5jb20uCj4+Cj4+IHN5emJv
dCB3aWxsIGtlZXAgdHJhY2sgb2YgdGhpcyBpc3N1ZS4gU2VlOgo+PiBodHRwczovL2dvby5nbC90
cHNtRUojc3RhdHVzIGZvciBob3cgdG8gY29tbXVuaWNhdGUgd2l0aCBzeXpib3QuCj4+Cj4+IElm
IHRoZSBidWcgaXMgYWxyZWFkeSBmaXhlZCwgbGV0IHN5emJvdCBrbm93IGJ5IHJlcGx5aW5nIHdp
dGg6Cj4+ICNzeXogZml4OiBleGFjdC1jb21taXQtdGl0bGUKPj4KPj4gSWYgeW91IHdhbnQgdG8g
Y2hhbmdlIGJ1ZydzIHN1YnN5c3RlbXMsIHJlcGx5IHdpdGg6Cj4+ICNzeXogc2V0IHN1YnN5c3Rl
bXM6IG5ldy1zdWJzeXN0ZW0KPj4gKFNlZSB0aGUgbGlzdCBvZiBzdWJzeXN0ZW0gbmFtZXMgb24g
dGhlIHdlYiBkYXNoYm9hcmQpCj4+Cj4+IElmIHRoZSBidWcgaXMgYSBkdXBsaWNhdGUgb2YgYW5v
dGhlciBidWcsIHJlcGx5IHdpdGg6Cj4+ICNzeXogZHVwOiBleGFjdC1zdWJqZWN0LW9mLWFub3Ro
ZXItcmVwb3J0Cj4+Cj4+IElmIHlvdSB3YW50IHRvIHVuZG8gZGVkdXBsaWNhdGlvbiwgcmVwbHkg
d2l0aDoKPj4gI3N5eiB1bmR1cAo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KPgo+IEknbSBsb29raW5nIGludG8gdGhvc2UgZmFp
bHVyZXMuCgoKU28gS0ZFTkNFIHdhcyBicm9rZW4gYnkgY29tbWl0IDMzMzUwNjhmODcyMSAoInJp
c2N2OiBVc2UgUFVEL1A0RC9QR0QgCnBhZ2VzIGZvciB0aGUgbGluZWFyIG1hcHBpbmciKSBzaW5j
ZSBvdXIga2ZlbmNlIGltcGxlbWVudGF0aW9uIG9ubHkgCmJyZWFrcyBwbWQgaHVnZXBhZ2VzLiBM
ZXQgbWUgZml4IHRoYXQgZm9yIDYuNC4KCgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
