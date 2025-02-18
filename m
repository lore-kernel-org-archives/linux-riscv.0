Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AB0C021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOJ1xZ86O5LUWCuZxhwllbc1RL27G+L7RTy6tq53h2U=; b=ZDIf0PEtjZjX30
	DjyCynKkt9s6uZ2uAnvZzxsuMlwkMRgaW6sX4Q66Yd9NhYWj89uoqtUFcQ5Pv9lLhRMsd2ln6yqD7
	sQGn1CsWXYt3BS8fVLxuI4oPZY/T+oTMvjrMjJ6s43d23pisXBNljTrKEMDfb19+FV0tuNoE2ejYZ
	Gil8GrJNDF5HlvvvB3AJmCXT1YPhEtkwas8bD14LDiHBXN29JvZlqJyowmjn6n7UZyKt6QtmnqYTR
	mFeABOnIOk7jxE/bPiTktgQusAwPAhTmSDxwFVkId5tO1rBD2kx61obEFfJ+27I5PC1VxxAoD5Y97
	stCHhc83ZuHHQEbeT91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkP1Y-00000008eIE-0P3O;
	Tue, 18 Feb 2025 14:56:36 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOrm-00000008cP1-1sXp
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 14:46:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB4C844196;
	Tue, 18 Feb 2025 14:46:23 +0000 (UTC)
Message-ID: <52e0c3d1-239b-475e-8ddd-932a460c6da1@ghiti.fr>
Date: Tue, 18 Feb 2025 15:46:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x' is
 never less than zero.
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Philip Li <philip.li@intel.com>
Cc: David Laight <david.laight.linux@gmail.com>,
 Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-riscv@lists.infradead.org
References: <202502171326.j4Xd3I0j-lkp@intel.com>
 <20250217092445.GA29568@lst.de>
 <a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
 <20250217131203.2657cc4b@pumpkin> <Z7PWuSA4jtZnxp5J@rli9-mobl>
 <78ff844a-0fb4-42f6-b54f-4d19e14cfd05@stanley.mountain>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <78ff844a-0fb4-42f6-b54f-4d19e14cfd05@stanley.mountain>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepuefffedvleetleetjefhjeehudejteetvedtvddvtdfhieetffelvdffgefgieeinecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppeduleefrdeffedrheejrdduleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelfedrfeefrdehjedrudelledphhgvlhhopegludelvddrudeikedrvddurddvhegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhhihhlihhprdhlihesihhnthgvlhdrtghomhdprhgtphhtthhopegurghvihgurdhlrghighhhthdrlhhinhhugiesghhmrghilhdrtghomhdprhgtphhtthhopehhtghhsehlshhtrdguvgdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtohepohgvq
 dhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtvghmsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_064630_639654_82D37649 
X-CRM114-Status: GOOD (  19.44  )
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

SGkgRGFuLAoKT24gMTgvMDIvMjAyNSAxNToyMSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBPbiBU
dWUsIEZlYiAxOCwgMjAyNSBhdCAwODozOToyMUFNICswODAwLCBQaGlsaXAgTGkgd3JvdGU6Cj4+
ICsgRGFuCj4+Cj4+IEhpIERhbiwKPj4KPj4gT24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMDE6MTI6
MDNQTSArMDAwMCwgRGF2aWQgTGFpZ2h0IHdyb3RlOgo+Pj4gT24gTW9uLCAxNyBGZWIgMjAyNSAx
MzowNjo0OSArMDEwMAo+Pj4gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToK
Pj4+Cj4+Pj4gSGkgQ2hyaXN0b3BoLAo+Pj4+Cj4+Pj4gT24gMTcvMDIvMjAyNSAxMDoyNCwgQ2hy
aXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+Pj4+IE9uIE1vbiwgRmViIDE3LCAyMDI1IGF0IDAxOjUz
OjA4UE0gKzA4MDAsIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOgo+Pj4+Pj4gTmV3IHNtYXRjaCB3
YXJuaW5nczoKPj4+Pj4+IGZzL3hmcy94ZnNfYnVmLmM6MTUzNCB4ZnNfYnVmX3N1Ym1pdF9iaW8o
KSB3YXJuOiB1bnNpZ25lZCAnX3gnIGlzIG5ldmVyIGxlc3MgdGhhbiB6ZXJvLgo+Pj4+PiBMb29r
cyBsaWtlIHRoaXMgaXMgYW4gaXNzdWUgaW4gdGhlIHJpc2N2IHZpcnRfdG9fcGFnZSBpbXBsZW1l
bnRhdGlvbgo+Pj4+PiB3aGljaCBhbHNvIHNob3dzIHVwIGluIHZhcmlvdXMgb3RoZXIgcGxhY2Vz
LiAgQW55IGNoYW5jZSB0aGlzIGNvdWxkIGdldAo+Pj4+PiBmaXhlZCBpbiB0aGUgcmlzY3YgY29k
ZT8KPj4+Pgo+Pj4+IFRvIG1lLCB0aGUgb25seSB0ZXN0IHRoYXQgY291bGQgZ2l2ZSByaXNlIHRv
IHRoaXMgd2FybmluZyBpcyB0aGUgbGFzdAo+Pj4+IHBhcnQgb2Y6Cj4+Pj4KPj4+PiAjZGVmaW5l
IGlzX2xpbmVhcl9tYXBwaW5nKHgpIFwKPj4+PiAgIMKgwqDCoMKgwqDCoMKgICgoeCkgPj0gUEFH
RV9PRkZTRVQgJiYgKCFJU19FTkFCTEVEKENPTkZJR182NEJJVCkgfHwgKHgpIDwKPj4+PiBQQUdF
X09GRlNFVCArIEtFUk5fVklSVF9TSVpFKSkKPj4+Pgo+Pj4+IEJ1dCBnaXZlbiB0aGF0IHRoZSBj
b25maWcgaXMgYSAzMi1iaXQgY29uZmlnLCBpdCBzaG91bGQgbm90IGJlIGV2YWx1YXRlZAo+Pj4+
IGF0IGFsbC4KPj4+Pgo+Pj4+IENvdWxkIHRoYXQgYmUgYSBmYWxzZS1wb3NpdGl2ZSBhbmQgdGhl
biBhbiBpc3N1ZSBpbiBzbWF0Y2g/Cj4+PiBXaHkgaXMgc21hdGNoIGV2ZW4gbG9va2luZy4KPj4+
IFRoZSBlcXVpdmFsZW50IGNoZWNrIGluIGdjYyBoYXMgYmVlbiBtb3ZlZCB0byAtVzIgYmVjYXVz
ZSBvZiBhbGwgZmFsc2UgcG9zaXRpdmVzLgo+IFRoZSBTbWF0Y2ggY2hlY2sgaXMgYSBiaXQgbW9y
ZSBzb3BoaXN0aWNhdGVkIHRoYW4gdGhlIEdDQyBjaGVjay4uLgo+IEkgdGhpbmsgaWYgeW91IHJl
bW92ZWQgdGhlICghSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpIGNvbmRpdGlvbiB0aGVuCj4gU21h
dGNoIHdvdWxkbid0IHRyaWdnZXIgYSB3YXJuaW5nIGhlcmUuICBIb3cgd291bGQgSSBkdXBsaWNh
dGUgdGhpcwo+IHdhcm5pbmc/ICBUaGUgIkFSQ0g9cmlzY3YgbWFrZS5jcm9zcyIgY29tbWFuZCBk
b2VzIGEgNjRiaXQgYnVpbGQuCgoKcmlzY3YgdXNlcyB0aGUgc2FtZSB0b29sY2hhaW4gZm9yIGJv
dGggMzIgYW5kIDY0LWJpdCwgaWYgeW91IGxvb2sgYXQgdGhlIApmYXVsdHkgY29uZmlnLCB5b3Ug
Y2FuIHNlZSB0aGF0IENPTkZJR18zMkJJVCBpcyBlbmFibGVkIHNvIGl0IGFjdHVhbGx5IAppcyBh
IDMyLWJpdCBidWlsZC4KClRoYW5rcyBmb3IganVtcGluZyBpbiwKCkFsZXgKCgo+Cj4gU2NyZXcg
aXQsIEkgY2FuIGp1c3Qgc2lsZW5jZSB0aGlzIHdhcm5pbmcgYmFzZWQgb24gdGhhdCBpdCdzIGEg
a2VybmVsCj4gYnVpbGQgYW5kIHRoZSB2YXJpYWJsZSBpcyBjYWxsZWQgIl94Ii4KPgo+IHJlZ2Fy
ZHMsCj4gZGFuIGNhcnBlbnRlcgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
