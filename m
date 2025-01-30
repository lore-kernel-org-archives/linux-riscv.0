Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D115FC0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qdh9lA5jKhm8zrDXuS21mMT00wyIQbc0V2oKqq0CsmY=; b=nHji+lF0buraoy
	WRehkae0N5ouw1ie9XHt6WWLZRZjqOCLPhhlmDXUnYVyFmRBPwYxCICZ6+Kk7TmJp25zMskOwoD89
	/udeFnqZeiC4ggOda9wHE9kdvYq4FF1I4eKowZ9AKH89veNFoWC8lp9PiwhbPDCZ7wtmI8ra6nOLk
	VsmUKtydM47TO9Lv/YWsEl1NVxgE4hu/wMym4uX9KBiQpOJ1Gb71QXdAZJh5ov2v0kZzf2DQX+zyY
	Pmu4bdmtO50xTwViZIdsWhhl8EpETnLwyKVSxi6T7cReq6mWytgGCXFtY8n8SFZ8+Z/pNSszO+UvS
	Mz47ZYQ1xpN6ZLz9KE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWNn-000000093pI-1ACJ;
	Thu, 30 Jan 2025 15:23:07 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWNk-000000093oy-3osi
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 15:23:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AF97442BB;
	Thu, 30 Jan 2025 15:23:01 +0000 (UTC)
Message-ID: <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr>
Date: Thu, 30 Jan 2025 16:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mvmed0k4prh.fsf@suse.de>
 <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> <mvm5xlw4anb.fsf@suse.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvm5xlw4anb.fsf@suse.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeuieegveegudffiedvveejhfejiefhgefhkeejtdeufedufeehhfeufeduleehieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepshgthhifrggssehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_072305_077551_1F5930D5 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

T24gMzAvMDEvMjAyNSAxNTo1MiwgQW5kcmVhcyBTY2h3YWIgd3JvdGU6Cj4gT24gSmFuIDMwIDIw
MjUsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPgo+PiBUaGF0J3MgYSBuaWNlIGNhdGNoIGluZGVl
ZC4gSUlVQywgd2UgaGF2ZSB0aGUgc2FtZSBpc3N1ZSBoZXJlCj4+IGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y2LjEzL3NvdXJjZS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z1dGV4
LmgjTDg5Cj4+IHJpZ2h0Pwo+IEluZGVlZCwgdGhvdWdoIGl0IGRvZXNuJ3QgcmVzdWx0IGluIHdy
b25nIGNvZGUgY3VycmVudGx5LiAgVGhpcyBpcwo+IGJlY2F1c2UgdGhlIGNvbXBhcmUgdmFsdWUg
aXMgcGFzc2VkIHVubW9kaWZpZWQgYXMgdTMyIHRvIHRoZSBhc20gYW5kIHRoZQo+IGNvbXBpbGVy
IGtlZXBzIHRoZSB2YWx1ZSBzaWduIGV4dGVuZGVkIGluIHJlZ2lzdGVycy4gIFRoYXQgd291bGQg
YnJlYWsKPiBpZiB5b3Ugd291bGQgYWRkIGEgY2FzdCB0byBsb25nIGxpa2UgaW4gY29tbWl0IDZj
NThmMjVlNjkzOCBhcyB0aGF0Cj4gd291bGQgZXJyb25lb3VzbHkgemVybyBleHRlbmQgaXQuCj4K
ClRoaXMgaXMgdGhlIGRpc2Fzc2VtYmx5IEkgZ2V0OgoKZmZmZmZmZmY4MDBmYzU0MCA8ZnV0ZXhf
YXRvbWljX2NtcHhjaGdfaW5hdG9taWM+OgoKLi4uCgpmZmZmZmZmZjgwMGZjNTY2OsKgwqDCoMKg
wqDCoCAxNjA1YThhZsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsci53LmFxcmwgYTcs
KGExKQpmZmZmZmZmZjgwMGZjNTZhOsKgwqDCoMKgwqDCoCAwMGM4OTU2M8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBibmUgCmE3LGEyLGZmZmZmZmZmODAwZmM1NzQgPGZ1dGV4X2F0b21p
Y19jbXB4Y2hnX2luYXRvbWljKzB4Mwo0PgpmZmZmZmZmZjgwMGZjNTZlOsKgwqDCoMKgwqDCoCAx
ZWQ1YTUyZsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzYy53LmFxcmwgYTAsYTMsKGEx
KQoKYTIgaXMgdXNlZCBhcyBpdCBpcyBwYXNzZWQgYnkgdGhlIGNhbGxpbmcgZnVuY3Rpb24sIHNv
IHdlIGNhbid0IGJlIHN1cmUgCmEyIGlzIHNpZ24gZXh0ZW5kZWQgdG8gbWUsIHdoYXQgYW0gSSBt
aXNzaW5nPwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
