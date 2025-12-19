Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F61DD767CB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 11:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+Vk3hl30suuIhYL0MI8Jkczjv1F3fn+NcFuIpSBfQQ=; b=QDtqYi4m0imgpC
	SlgnqTdoUCBs3hjwb1D2GUapFFDICuP8codp6cGfu5jaDIkxBJzsmlVZQK5rb8I+FS9Dw2HX7yjG6
	UJLEQCgcIi17ra+CxD1Q0rzDNAQhF7dYddh8gOtrA3hMC1X0+T/rKEM2hZ0WXVvCqepKmEFbehBQa
	gORQQmFmEn2yNuzJ7zOOpSXF2KDTfvZPFI+AyyLzrQ/fhjECvT5K5ZQwG9plMl6FWKOAc+kAGSnFk
	X0mIdSLLqk+cYk37GvbkDqG4q2wBrD9ZKpxEIR04nYJpIAcj6/WWGVEU8zWESpTi0Sl/1mmheNnty
	/6gp2tPhykfFYpfZQkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYft-0000000AC1s-1wFo;
	Fri, 19 Dec 2025 11:29:33 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYfr-0000000AC1S-2HkO
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 11:29:32 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5162D340E06;
	Fri, 19 Dec 2025 11:29:28 +0000 (UTC)
Date: Fri, 19 Dec 2025 19:29:24 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Johannes Erdfelt <johannes@erdfelt.com>, Yao Zi <me@ziyao.cc>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Message-ID: <20251219112924-GYB1955339@gentoo.org>
References: <aUAF4iNjuP5AWJaf@pie>
 <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie>
 <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
 <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
 <20251217221004.GD31109@sventech.com>
 <d5917806-56db-4945-b336-89bd1027f613@rootcommit.com>
 <e1cb227b-a55e-4962-b7e1-b540ba92012c@rootcommit.com>
 <CABdCQ=N4eZyBNBrhOQsW7jSeJmr=xhicwW8fskOAioV1q9cC5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABdCQ=N4eZyBNBrhOQsW7jSeJmr=xhicwW8fskOAioV1q9cC5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_032931_636077_999F3182 
X-CRM114-Status: GOOD (  22.66  )
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

SGkgSWtlciwKCnRoYW5rcyBmb3IgcHVzaGluZyB0aGlzLCBJIGhhdmUgZmV3IGNvbW1lbnRzCgpP
biAxMDo0OSBUaHUgMTggRGVjICAgICAsIElrZXIgUGVkcm9zYSB3cm90ZToKPiBIaSBNaWNoYWVs
LCBZYW8sIEphdmllciwgSm9oYW5uZXMsCj4gCj4gVGhhbmtzIGV2ZXJ5b25lIGZvciB0aGUgZ3Jl
YXQgZGlzY3Vzc2lvbiBhbmQgdGhlIGd1aWRhbmNlLgo+IAo+IEZpcnN0IG9mIGFsbCwgSeKAmWQg
bGlrZSB0byBjbGFyaWZ5IGEgcG9pbnQgcmVnYXJkaW5nIG15IHByZXZpb3VzIGVtYWlsCj4gdG8g
YXZvaWQgYW55IGNvbmZ1c2lvbjogdGhlIGRldGFpbGVkIHRlY2huaWNhbCBicmVha2Rvd24gYW5k
IHBvaW50ZXJzCj4gd2VyZSBwcm92aWRlZCBieSBZYW8gaGVyZSBpbiB0aGUgdGhyZWFkLiBNeSBt
ZW50aW9uIG9mIEphdmllciB3YXMKPiByZWdhcmRpbmcgYSBzZXBhcmF0ZSBvZmZsaW5lIGNvbnZl
cnNhdGlvbiB3ZSBoYWQgZWFybGllci4gQm90aAo+IGNvbnRyaWJ1dGlvbnMgaGF2ZSBiZWVuIGVz
c2VudGlhbCB0byB1bmRlcnN0YW5kaW5nIHdoeSB0aGUgU0QgY2FyZCBpcwo+IGN1cnJlbnRseSBm
YWlsaW5nLgo+IAo+IEdpdmVuIHRoYXQgd2UgYXJlIGFsbCBhIGJpdCB0aWdodCBvbiB0aW1lLCBJ
IHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgdG8KPiBzcGxpdCB0aGUgd29yayBpbnRvIHNlcGFyYXRl
IHRhc2tzIHNvIHdlIGNhbiBtYWtlIHByb2dyZXNzIGluCj4gcGFyYWxsZWwuIEJhc2VkIG9uIHRo
ZSBmZWVkYmFjaywgaGVyZSBpcyB0aGUgcm9hZG1hcDoKPiAKPiAxLiBEZWZpbmUgYSBzZXBhcmF0
ZSBjb21wYXRpYmxlIHN0cmluZzogdGhlIGVNTUMgc2xvdCBoYXMgYSBQSFksIHdoaWxlCj4gU0Qv
U0RJTyBzbG90cyBkbyBub3QuIFdlIG5lZWQgdG8gZGlmZmVyZW50aWF0ZSB0aGVtIHRvIGFwcGx5
IHRoZQo+IGNvcnJlY3QgcmVzZXQgbG9naWMgKHNraXBwaW5nIFBIWSBpbml0IGZvciBTRCkuCkkg
YWdyZWUsIHNlcGFyYXRlIGNvbXBhdGlibGVzIHNvdW5kcyBtb3JlIGZlYXNpYmlsZSwgdmVuZG9y
IHJldXNlIG1hY3JvCm9mIE1NQ19DQVAyX05PX3tTRCxTRElPLE1NQ30gdG8gZGlmZmVyZW50aWF0
ZSB0aGUgY29udHJvbGxlciB3aGljaCBpcwpraW5kIG9mIHVubWFpbnRhaW5hYmxlCgo+IDIuIEV4
dGVuZCB0aGUgcGluY3RybCBkcml2ZXI6IHN1cHBvcnQgaXMgbmVlZGVkIGZvciBzd2l0Y2hpbmcg
dGhlIFNECj4gdm9sdGFnZSBwaW5zIGZyb20gMy4zViB0byAxLjhWLgp3ZSBwcm9iYWJseSBjb3Vs
ZCBsZWF2ZSBwaW5jdHJsIGZvciBub3cgb3IgdGFrZSBhIGxvb2sgYXQgaXQgbGF0ZXIgd2hlbgpy
ZWFsbHkgbmVjZXNzYXJ5LCAgdGhlIGRlZmF1bHQgcGluIHNldHRpbmdzIHNob3VsZCB3b3JrIGZv
ciBtb3N0IGNhc2VzLApiZXNpZGVzLCB2ZW5kb3IgaXMgYWxzbyBzdGFydGluZyB0byBkcm9wIHR3
byBwaW5jdHJsIHN0YXRlIGltcGxlbWVudGF0aW9uCih0aGUgbm9ybWFsIHZzIGZhc3QgLi4pCgpm
b3IgMy4zdiB0byAxLjh2IHN3aXRjaCwgdGhlcmUgaXMgb25lIE1NQzFfSU9fUkVHIHRvIGNvbnRy
b2wgaXQsIGFuZAp3ZSBkbyBuZWVkIHRvIGltcGxlbWVudCBhIF92b2x0YWdlX3N3aXRjaCgpIGZ1
bmN0aW9uCmFuZCBpdCdzIGluIGFub3RoZXIgYWliIGlvIHNwYWNlLi4KCj4gMy4gQWRkIHR1bmlu
ZyBsb2dpYzogdGhpcyBpcyByZXF1aXJlZCBhdCBsZWFzdCBmb3IgU0RSIG1vZGVzLgo+IApyaWdo
dCwgZXNwZWNpYWxseSBmb3IgaGlnaCBzcGVlZCBjbG9jawoKPiBTaW5jZSBJ4oCZbGwgYmUgZm9j
dXNpbmcgb24gdGhlIGRyaXZlci9yZXNldCBsb2dpYyAoMSksIGlzIHRoZXJlIGFueW9uZQp0aGUg
cmVzZXQgbG9naWMgaXMgYWxzbyBuZWVkZWQgZm9yIEszIFNvQywgc28gSSdkIGxpa2UgdG8gZ2V0
IGl0IGFkZGVkCmVhcmx5LCBJIGNvdWxkIGdldCBhIHBhdGNoIGZvciBpdCBkdXJpbmcgdGhlIHdl
ZWtlbmQgaWYgeW91IGRvbid0IG1pbmQsCm9yIGNhbiBsZWF2ZSBpdCB0byB5b3UgaWYgeW91IHdp
bGwgZG8gaXQgc2hvcnRseS4uCgo+IGVsc2Ugd2lsbGluZyB0byBwaWNrIHVwIHRoZSBwaW5jdHJs
ICgyKSBvciB0aGUgdHVuaW5nICgzKT8KPiAKSSBkbyB3YW50IHRvIHdvcmsgb24gU0QvU0RJTyBz
dXBwb3J0LCBidXQgZm9yIG5vdyBJIG5lZWQgdG8gcHVzaApjbG9jay9waW5jdHJsIGZvciBLMyBT
b0MgZmlyc3QsIHRoZW4gd2lsbCBoYXZlIHRpbWUgdG8gdGFrZSBhIGxvb2sKCj4gTG9va2luZyBm
b3J3YXJkIHRvIHdvcmtpbmcgdG9nZXRoZXIgb24gdGhpcy4KPiAKZ3JlYXQhCgotLSAKWWl4dW4g
TGFuIChkbGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
