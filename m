Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C65CED619
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DK1pPG8Tfo0tuXOJuja1Ye0kDYRSN8AXN2gUEWrvHNU=; b=kFGlez51WHpqg2
	5aDrI2Vx7dy+1XGU3b7VIpK3HpftMvDiF5tS6gfLt825hTEGyg7cA5DPN13dL6brAh16uAN/luPiA
	wJpLiHV+bLGWY4xsBdLL9ASuCEIgSE6aQWtAZzRqQsmdMv8dO3oXat1eHSQEZgcdDr4WfJ1N+kcW1
	z8jXumm61faXF3lzBKlF5nTZ8UCIN6wYfFYBPWsRDxeGH4haf4LqqSO/UckDZi220QesuD3jkSAHr
	Lhs2sbo62MToOQwQ6dhKqL6vXshfG8wRC5+HnnaArSM+kS6zi9t3U3dlj7HlSufVo+qrh54VGhxyI
	WI5PE0Nc2vifktvxyYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRDJ-00000008FjK-3t3K;
	Wed, 09 Oct 2024 07:34:29 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRDF-00000008FgY-2Vcj
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 07:34:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 226911BF209;
	Wed,  9 Oct 2024 07:34:18 +0000 (UTC)
Message-ID: <2d907c14-5b43-446e-9640-efb0fa0ba385@ghiti.fr>
Date: Wed, 9 Oct 2024 09:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: efi: Set NX compat flag in PE/COFF header
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
 <3c2ff70d-a580-4bba-b6e2-1b66b0a98c5d@ghiti.fr>
 <811ea10e-3bf1-45a5-a407-c09ec5756b48@canonical.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <811ea10e-3bf1-45a5-a407-c09ec5756b48@canonical.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_003425_803861_BAB8F2C7 
X-CRM114-Status: GOOD (  19.24  )
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

SGkgSGVpbnJpY2gsCgpPbiAwMS8xMC8yMDI0IDE3OjI0LCBIZWlucmljaCBTY2h1Y2hhcmR0IHdy
b3RlOgo+IE9uIDAxLjEwLjI0IDE1OjUxLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+IEhpIEhl
aW5yaWNoLAo+Pgo+PiBPbiAyOS8wOS8yMDI0IDE2OjAyLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdy
b3RlOgo+Pj4gVGhlIElNQUdFX0RMTENIQVJBQ1RFUklTVElDU19OWF9DT01QQVQgaW5mb3JtcyB0
aGUgZmlybXdhcmUgdGhhdCB0aGUKPj4+IEVGSSBiaW5hcnkgZG9lcyBub3QgcmVseSBvbiBwYWdl
cyB0aGF0IGFyZSBib3RoIGV4ZWN1dGFibGUgYW5kCj4+PiB3cml0YWJsZS4KPj4+Cj4+PiBUaGUg
ZmxhZyBpcyB1c2VkIGJ5IHNvbWUgZGlzdHJvIHZlcnNpb25zIG9mIEdSVUIgdG8gZGVjaWRlIGlm
IHRoZSBFRkkKPj4+IGJpbmFyeSBtYXkgYmUgZXhlY3V0ZWQuCj4+Pgo+Pj4gQXMgdGhlIExpbnV4
IGtlcm5lbCBuZWl0aGVyIGhhcyBSV1ggc2VjdGlvbnMgbm9yIG5lZWRzIFJXWCBwYWdlcyBmb3IK
Pj4+IHJlbG9jYXRpb24gd2Ugc2hvdWxkIHNldCB0aGUgZmxhZy4KPj4+Cj4+PiBDYzogQXJkIEJp
ZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9y
Zz4KPj4+IFNpZ25lZC1vZmYtYnk6IEhlaW5yaWNoIFNjaHVjaGFyZHQgPGhlaW5yaWNoLnNjaHVj
aGFyZHRAY2Fub25pY2FsLmNvbT4KPj4+IC0tLQo+Pj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvZWZp
LWhlYWRlci5TIHwgMiArLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VmaS1o
ZWFkZXIuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VmaS0gCj4+PiBoZWFkZXIuUwo+Pj4gaW5kZXgg
NTE1YjJkZmJjYTc1Li5jNWYxN2MyNzEwYjUgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9lZmktaGVhZGVyLlMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIu
Uwo+Pj4gQEAgLTY0LDcgKzY0LDcgQEAgZXh0cmFfaGVhZGVyX2ZpZWxkczoKPj4+IMKgwqDCoMKg
wqAgLmxvbmfCoMKgwqAgZWZpX2hlYWRlcl9lbmQgLSBfc3RhcnTCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC8vIFNpemVPZkhlYWRlcnMKPj4+IMKgwqDCoMKgwqAgLmxvbmfCoMKgwqAgMMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIENoZWNrU3VtCj4+PiDCoMKgwqDCoMKg
IC5zaG9ydMKgwqDCoCBJTUFHRV9TVUJTWVNURU1fRUZJX0FQUExJQ0FUSU9OwqDCoMKgwqDCoMKg
wqAgLy8gU3Vic3lzdGVtCj4+PiAtwqDCoMKgIC5zaG9ydMKgwqDCoCAwwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gRGxsQ2hhcmFjdGVyaXN0aWNzCj4+PiArwqDCoMKg
IC5zaG9ydMKgwqDCoCBJTUFHRV9ETExfQ0hBUkFDVEVSSVNUSUNTX05YX0NPTVBBVMKgwqDCoCAv
LyAKPj4+IERsbENoYXJhY3RlcmlzdGljcwo+Pj4gwqDCoMKgwqDCoCAucXVhZMKgwqDCoCAwwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gU2l6ZU9mU3RhY2tSZXNlcnZl
Cj4+PiDCoMKgwqDCoMKgIC5xdWFkwqDCoMKgIDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvLyBTaXplT2ZTdGFja0NvbW1pdAo+Pj4gwqDCoMKgwqDCoCAucXVhZMKgwqDC
oCAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gU2l6ZU9mSGVhcFJl
c2VydmUKPj4KPj4KPj4gSSBkb24ndCB1bmRlcnN0YW5kIGlmIHRoaXMgZml4ZXMgc29tZXRoaW5n
IG9yIG5vdDogd2hhdCBjb3VsZCBnbyAKPj4gd3JvbmcgaWYgd2UgZG9uJ3QgZG8gdGhpcz8KPj4K
Pj4gVGhhbmtzLAo+Pgo+PiBBbGV4Cj4+Cj4KPgo+IEhlbGxvIEFsZXhhbmRyZSwKPgo+IGh0dHBz
Oi8vbGVhcm4ubWljcm9zb2Z0LmNvbS9lbi11cy93aW5kb3dzLWhhcmR3YXJlL2RyaXZlcnMvYnJp
bmd1cC91ZWZpLWNhLW1lbW9yeS1taXRpZ2F0aW9uLXJlcXVpcmVtZW50cyAKPgo+IGRlc2NyaWJl
cyBNaWNyb3NvZnQncyBlZmZvcnQgdG8gaW1wcm92ZSBzZWN1cml0eSBieSBhdm9pZGluZyBtZW1v
cnkgCj4gcGFnZXMgdGhhdCBhcmUgYm90aCBleGVjdXRhYmxlIGFuZCB3cml0YWJsZS4KPgo+IElN
QUdFX0RMTF9DSEFSQUNURVJJU1RJQ1NfTlhfQ09NUEFUIGlzIGFuIGFzc2VydGlvbiBieSB0aGUg
RUZJIGJpbmFyeSAKPiB0aGF0IGl0IGRvZXMgbm90IHVzZSBSV1ggcGFnZXMuIEl0IG1heSB1c2Ug
dGhlIAo+IEVGSV9NRU1PUllfQVRUUklCVVRFX1BST1RPQ09MIHRvIHNldCB3aGV0aGVyIGEgcGFn
ZSBpcyB3cml0YWJsZSBvciAKPiBleGVjdXRhYmxlIChidXQgbm90IGJvdGgpLgo+Cj4gV2hlbiB1
c2luZyBzZWN1cmUgYm9vdCwgY29tcGxpYW50IGZpcm13YXJlIHdpbGwgbm90IGFsbG93IGxvYWRp
bmcgYSAKPiBiaW5hcnkgaWYgdGhlIGZsYWcgaXMgbm90IHNldC4KCgpHcmVhdCwgc28gdGhhdCdz
IGEgbmVjZXNzYXJ5IGZpeCwgaXQgd2lsbCBnZXQgbWVyZ2VkIGluIHRoZSBuZXh0IHJjIG9yIHNv
OgoKRml4ZXM6IGNiN2QyZGQ1NjEyYSAoIlJJU0MtVjogQWRkIFBFL0NPRkYgaGVhZGVyIGZvciBF
Rkkgc3R1YiIpCgpUaGFua3MsCgpBbGV4CgoKPgo+IEJlc3QgcmVnYXJkcwo+Cj4gSGVpbnJpY2gK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
