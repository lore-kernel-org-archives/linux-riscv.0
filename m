Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D89C9832A
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 07:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rkr66xLUFpyLquyNpum3de8El64ltBX48MoW/u2PYpE=; b=QvZKurr0DOehSt
	C9QtsbOYvW4XzDUS47mPWid8oK/V50yYjYDI0+ECkN73uz4ODXbkB8v2I9skk3y5XkV4GOke52JRG
	ZJrFPBcisg0UaMdLTyIET/ouAQnRRGW34X4tJ+N4z+9xHf98NspdI0nrcHXK8PrmUB6mg8azOtlyZ
	u96WKdNmv2FNbGKvybVcfHRYMiKW69OqBH+CFqwVC25Xc3G7WkDW9eo6bOj7QekNtdmc1RP7kaioS
	gEXkjbSIIwaq3ylU3Q+c59AuG/Ts0F6tMENrYWSx8Qyc8jQXa2lMGSJPefiS7mulCoQ98QRr+in2C
	XwpYJtzsEcgz4gNvq8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSFT-00000002by5-0eqz;
	Tue, 29 Sep 2026 07:27:35 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSFO-00000002bwj-4367
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 07:27:34 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-03 (Coremail) with SMTP id rQCowAC3tjRRaLtqNVgdCQ--.1183S2;
	Tue, 29 Sep 2026 15:27:13 +0800 (CST)
Message-ID: <84e4511ea8e3e6bdff72ce2038bf3a3272744619.camel@iscas.ac.cn>
Subject: Re: [PATCH] drm: verisilicon: support non-coherent DMA framebuffers
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Dominique Belhachemi <domibel@debian.org>
Cc: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Simona Vetter
 <simona@ffwll.ch>,  Paul Cercueil <paul@crapouillou.net>, Michal Wilczynski
 <m.wilczynski@samsung.com>, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 ganboing@gmail.com
Date: Tue, 29 Sep 2026 15:27:12 +0800
In-Reply-To: <CAAvaLCy7jC-jFM5ZpPVeg7gKpweAW4nPKn4HXR+xpqUHD2soXQ@mail.gmail.com>
References: <20260505042631.1916555-1-domibel@debian.org>
	 <8d1e3735c40b452f7ab89228ad5a0040f5f41b35.camel@iscas.ac.cn>
	 <CAAvaLCy7jC-jFM5ZpPVeg7gKpweAW4nPKn4HXR+xpqUHD2soXQ@mail.gmail.com>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: rQCowAC3tjRRaLtqNVgdCQ--.1183S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr18Gw15GFyUWw1DKw4kZwb_yoW8CF1rpa
	yfKwn0yF4vqwn7Ar42kw48XFWrZ393Jry3u345Gry8ZrZ8uFyrKr40vryagF1jgrnrC34r
	ZFs2gFykXw1kCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2wIDUUUUU
X-Originating-IP: [120.85.96.244]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_002731_502730_994E1643 
X-CRM114-Status: GOOD (  14.71  )
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

5ZyoIDIwMjYtMDktMjjkuIDnmoQgMDE6MjEgLTA0MDDvvIxEb21pbmlxdWUgQmVsaGFjaGVtaeWG
memBk++8mgo+IE9uIEZyaSwgU2VwIDExLCAyMDI2IGF0IDExOjMz4oCvQU0gSWNlbm93eSBaaGVu
Zwo+IDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4gd3JvdGU6Cj4gPiAKPiA+IEkgYW0gc3RpbGwg
dGhpbmtpbmcgaG93IHRvIGRlY2lkZSB3aGV0aGVyIHRvIHVzZSBkaXJ0eS10cmFja2luZy0KPiA+
IGJhc2VkCj4gPiBjYWNoZSBjb2hlcmVudCBtYWludGVuYW5jZSBvciB3cml0ZWNvbWJpbmUvdW5j
YWNoZWQgbWFwcGluZy4KPiA+IAo+IEhpIEljZW5vd3ksCj4gCj4gSSBsb29rZWQgaW50byB0aGlz
IGFnYWluIGFuZCB3cml0ZWNvbWJpbmUvdW5jYWNoZWQgbWFwcGluZyBpcyB0aGUgd2F5Cj4gdG8g
Z28uCgpJIHRoaW5rIGRybS9pbWFnaW5hdGlvbiByZWFsbHkgcmVxdWlyZXMgaXQgKGJlY2F1c2Ug
dGhlIGNvcnJlc3BvZGluZwp1c2Vyc3BhY2UgZHJpdmVyIGFkdmVydGlzZXMgb25seSBvbmUgbWVt
b3J5IHR5cGUgd2l0aApgSE9TVF9DT0hFUkVOVF9CSVRgIHNldCksIGhvd2V2ZXIgaW4gdGhlIGZ1
dHVyZSBpdCBjb3VsZCBhbHNvIGFkZCBjYWNoZQptYWludGVuYW5jZSBzdXBwb3J0IGZvciBwZXJm
b3JtYW5jZSByZWFzb25zLgoKPiBJIHVzZWQgQm8gR2FuJ3MgWFBibXRVQyBzZXJpZXMgYW5kIE1p
Y2hhbCBXaWxjenluc2tpJ3Mgamg3MTEwIGRpc3BsYXkKPiBzZXJpZXMgYW5kIGZpbmFsbHkgZ290
IHRoZSBpbnRlZ3JhdGVkIEJYRS00LTMyIEdQVSB0byB3b3JrLgoKVGhlIFhQYm10VUMgc2VyaWVz
IGlzIHByb2JsZW1hdGljIC0tIGl0ICJzdXBwb3J0cyBFSUM3NzAwIiAid2l0aCBhCmh5cGVydmlz
b3IiLCB3aGljaCBtZWFucyBpdCBjYW5ub3QgcnVuIG9uIEVJQzc3MDAgbmF0aXZlbHkuIFRoaXMK
c2V2ZXJlbHkgcmVzdHJpY3RzIGl0cyB1c2FnZS4KClNhbXVlbCBIb2xsYW5kIGZyb20gU2lGaXZl
IGlzIHdvcmtpbmcgb24gcGF0Y2hpbmcgdGhlIFBURSBvbi10aGUtZmx5LApidXQgdGhhdCB3aWxs
IGNoYW5nZSBhbGwgY29kZSBhY2Nlc3NpbmcgUFRFIGluIHRoZSBrZXJuZWwgYW5kIHRodXMgaXMg
YQpoZWF2eSB3b3JrLgoKUC5TLiBGb3IgdGhlIEpINzExMCByYXNjYWwrZHVzdCBwb3dlciBpc3N1
ZSwgSSBkaWQgYSB0cnktYW5kLWVycm9yIGhhY2sKYXQgWzFdLiBUaGUgYmFzaWNhbCByZWdpc3Rl
ciBkZWZpbml0aW9uIG9mIHRoaXMgcmVnaXN0ZXIgKGNhbGxlZApSR1hfQ1JfUE9XRVJfRVZFTlQp
IGlzIGF2YWlsYWJsZSBpbiB0aGVpciBLTSB2b2xjYW5pYyBwYXJ0IChidXQgaXQKc2VlbXMgdG8g
YXBwbHkgZm9yIHJvZ3VlIHRvbyksIGJ1dCB0aGUgaW5kaXZpZHVhbCBiaXRzIGZvciBkb21haW5z
IGFyZQp1bmRvY3VtZW50ZWQsIGFuZCB0aGUgaGlnaGVzdCA4LWJpdCBzZWVtcyB0byBiZSBzb21l
IGtpbmQgb2YgbXVsdGktY29yZQptYXNrIG9uIFJvZ3VlLgoKVGhhbmtzLApJY2Vub3d5CgpbMV0K
aHR0cHM6Ly9naXRodWIuY29tL0ljZW5vd3kvbGludXgvY29tbWl0LzA5ZGIzMTdjOWMyMjllZjM1
OWUzNTQ2M2Y4YzA4ZWZkM2UyM2M2ODUKCj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjYwMzE2MDYwMzI4LjExNzM2MzQtMS1nYW5ib2luZ0BnbWFpbC5jb20vCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwOTE1LWpoNzExMC1jbGVhbi1zZW5kLXY0LTAtZjBlNGZk
NmYyY2M4QHNhbXN1bmcuY29tLwo+IGh0dHBzOi8vZ2l0aHViLmNvbS9kb21pYmVsL3Zpc2lvbmZp
dmUyX2dwdV9icmluZ3VwCj4gCj4gQmVzdAo+IC1Eb21pbmlxdWUKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
