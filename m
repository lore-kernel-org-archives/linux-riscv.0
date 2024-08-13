Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BA6C52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 12:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwvnBbhBszIRguNsU+kCP8idHi76gYaT4yXqVnCpjRE=; b=sDrs7sJqfIkfsVkm7udge3iMEC
	i8Gg9QIqcS1T1KXnxvYyXs2GaAmI3Nj+M575AZJzCJy7KWhkUq0YXG8dk7mAC+L1o1NFKydjycUVt
	hqG3b55GECDWUqsO++GhfjNU7+rvQtoZ4aR+FfOdLAfo06DJdB4pUkjtjNW5rXoQ9jK5wkCcCp+eI
	Kdgdxr62Ub3dRXHjVrQeMHLMTzCUVc2LXaZO5oGP1EaADDkRVW0PDU1yUptv/ox18lpkgqi0kWV6K
	RW5K9X/elMZRa2+OBRLqyjtqgaul/13q6Arcq63XAVsiLk0Hl+dMxfkHaD6KUO+aQHBMboX4pAc4x
	5PqKGK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqzg-00000003lhI-0pD1;
	Tue, 13 Aug 2024 12:51:20 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdqzb-00000003lgX-3OHf
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 12:51:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C56C40005;
	Tue, 13 Aug 2024 12:51:10 +0000 (UTC)
Message-ID: <28cf8a77-e9af-45e4-b178-fd7a478f9b4c@ghiti.fr>
Date: Tue, 13 Aug 2024 14:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: riscv syscall performance regression
Content-Language: en-US
To: "Wu, Fei" <fei2.wu@intel.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, guoren@kernel.org,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
References: <738d3b74-1e10-4eb5-8c0d-1db33feb740a@intel.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <738d3b74-1e10-4eb5-8c0d-1db33feb740a@intel.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_055116_013718_F18FD460 
X-CRM114-Status: GOOD (  18.86  )
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

SGkgRmVpLAoKT24gMjMvMDIvMjAyNCAwNjoyOCwgV3UsIEZlaSB3cm90ZToKPiBIaSBBbGwsCj4K
PiBJIGFtIGRvaW5nIHNvbWUgcGVyZm9ybWFuY2UgcmVncmVzc2lvbiB0ZXN0aW5nIG9uIGEgc29w
aGdvIG1hY2hpbmUsIHRoZQo+IHVuaXhiZW5jaCBzeXNjYWxsIGJlbmNobWFyayBkcm9wcyAxNCUg
ZnJvbSA2LjEgdG8gNi42LiBUaGlzIGNoYW5nZQo+IHNob3VsZCBiZSBkdWUgdG8gY29tbWl0IGYw
YmRkZjUwIHJpc2N2OiBlbnRyeTogQ29udmVydCB0byBnZW5lcmljIGVudHJ5Lgo+IEkga25vdyBp
dCdzIGEgdHJhZGVvZmYsIGp1c3QgY2hlY2tpbmcgaWYgaXQncyBiZWVuIGRpc2N1c3NlZCBhbHJl
YWR5IGFuZAo+IGFueSBpbXByb3ZlbWVudCBjYW4gYmUgZG9uZS4KPgo+IFRoZSB1bml4YmVuY2gg
YmVuY2htYXJrIEkgdXNlZCBpczoKPiAJJCAuL3N5c2NhbGwgMTAgZ2V0cGlkCj4KPiBUaGUgZHlu
YW1pYyBpbnN0cnVjdGlvbiBjb3VudCBwZXIgc3lzY2FsbCBpcyBpbmNyZWFzZWQgZnJvbSB+MjAw
IHRvCj4gfjI1MCwgdGhpcyBzaG91bGQgYmUgdGhlIGtleSBmYWN0b3Igc28gSSBzd2l0Y2ggdG8g
dGVzdCBpdCBvbiBzeXN0ZW0KPiBRRU1VIHRvIGF2b2lkIHBvcnRpbmcgZGlmZmVyZW50IHZlcnNp
b25zIG9uIHNvcGhnbywgYW5kIHVzZSBwbHVnaW4KPiBsaWJpbnNuLnNvIHRvIGNvdW50IHRoZSBp
bnN0cnVjdGlvbnMuIFRoZXJlIGFyZSBhIGZldyBiYWNrZ3JvdW5kIG5vaXNlcwo+IGR1cmluZyB0
ZXN0IGJ1dCB0aGUgaW1wYWN0IHNob3VsZCBiZSBsaW1pdGVkLiBUaGlzIGlzIGR5bmluc3QgY291
bnQgcGVyCj4gc3lzY2FsbCBJIGdvdDoKPgo+ICogY29tbWl0IGQwZGIwMmM2IChyaWdodCBiZWZv
cmUgdGhlIGNoYW5nZSk6IH4yMDAKPiAqIGNvbW1pdCBmMGJkZGY1MCAodGhlIGNoYW5nZSk6IH4y
NTAKPiAqIGNvbW1pdCBmZmQyY2I2YiAobGF0ZXN0IHVwc3RyZWFtKTogfjI1MAo+Cj4gQW55IGNv
bW1lbnQ/Cj4KPiBUaGFua3MsCj4gRmVpLgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKClNvIEkgZmluYWxseSB0b29rIHNvbWUgdGltZSB0
byBsb29rIGludG8gdGhpcy4gSW5kZWVkIHRoZSBjb252ZXJzaW9uIHRvIAp0aGUgZ2VuZXJpYyBl
bnRyeSBpbnRyb2R1Y2VkIHRoZSBvdmVyaGVhZCB5b3Ugb2JzZXJ2ZS4KClRoZSBudW1iZXJzIEkg
Z2V0IGFyZSBzaW1pbGFyOgoKKiBjb21taXQgZDBkYjAyYzYgKHJpZ2h0IGJlZm9yZSB0aGUgY2hh
bmdlKTogMTg1CgoqwqAgNi4xMS1yYzM6IDI0NQoKSSBkaXZlZCBhIGJpdCBkZWVwZXIgYW5kIG5v
dGljZWQgdGhhdCB3ZSBjb3VsZCByZWdhaW4gfjQwIGluc3RydWN0aW9ucyAKYnkgaW5saW5pbmcg
c3lzY2FsbF9leGl0X3RvX3VzZXJfbW9kZSgpIGFuZCBkb190cmFwX2VjYWxsX3UoKToKCi0gd2Ug
dXNlZCB0byBpbnRlcmNlcHQgdGhlIHN5c2NhbGwgdHJhcCBidXQgbm93IGl0J3MgZGVhbHQgd2l0
aCBpbiB0aGUgCmV4Y2VwdGlvbiB2ZWN0b3IsIG5vdCBzdXJlIGlmIHdlIGNhbiBpbmxpbmUgZG9f
dHJhcF9lY2FsbF91KCkKLSBJIHF1aWNrbHkgdHJpZWQgdG8gaW5saW5lIHN5c2NhbGxfZXhpdF90
b191c2VyX21vZGUoKSBidXQgaXQgcHVsbHMgCnF1aXRlIGEgZmV3IGZ1bmN0aW9ucyBhbmQgSSBm
YWlsZWQgdG8gZG8gc28uCgpOb3RlIHRoYXQgYSByZWNlbnQgZWZmb3J0IGFscmVhZHkgaW5saW5l
ZCBtb3N0IG9mIHRoZSBjb21tb24gZW50cnkgCmZ1bmN0aW9ucyBhbHJlYWR5IApodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMzEyMTgwNzQ1MjAuMTk5ODAyNi0xLXN2ZW5zQGxpbnV4Lmli
bS5jb20vCgpUaGUgcmVtYWluaW5nIGluc3RydWN0aW9ucyBhcmUgY2F1c2VkIGJ5OgoKKiB0aGUg
dmVjdG9yIGV4dGVuc2lvbiBoYW5kbGluZy4gSXQgd29uJ3QgaW1wcm92ZSB0aGUgYWJvdmUgbnVt
YmVycyAKYmVjYXVzZSB0aGUgdGVzdCBkb2VzIG5vdCB1c2UgdGhlIHZlY3RvciBleHRlbnNpb24s
IGJ1dCB3ZSBjb3VsZCBpbXByb3ZlIApfX3Jpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQoKSBhcyBtZW50
aW9uZWQgaW4gY29tbWl0IDk2NTdlOWI3ZDI1MyAoInJpc2N2OiAKRGlzY2FyZCB2ZWN0b3Igc3Rh
dGUgb24gc3lzY2FsbHMiKQoqIHRoZSByYW5kb20ga2VybmVsIHN0YWNrIG9mZnNldAoKSSdsbCBh
ZGQgc29tZSBwZXJmb3JtYW5jZSByZWdyZXNzaW9ucyBpbiBteSBDSSBpbiB0aGUgbmVhciBmdXR1
cmUgOikKClRoYW5rcywKCkFsZXgKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
