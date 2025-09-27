Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC59CAC5B9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kB0Cz0BiSY9hnQ8uF78QcQaIgB7OLxcnuFHotEw/6TA=; b=msqKWEgl9zs3Mi
	Gu+k4nzqFNVUTGHmi3dr3wzzlwfILYcfwbUyvxEP04OX4s8oTxGDXcgA42jn8yharC4qh8/SD/A6j
	jVa6IHsymFXTz+GbotlGfE3fy1EWK1kfCeXGCj8F+V5xJNan1PxqeGtaTzsEmmIcbMnwNuyQKAhPq
	FmRPlPriUliKmngWHZ01KW/3sqsjxn+P3ASb4773BlQP5xBcuWHsqUUUe1tYB/3Z6FbeekxUkPUZi
	ljDPcRp2aYG2aRYiEJUAM3xBTgIZYx8z8ir1F69LCZaTm9MVQUCBDzDtlXf1MFVo1Mt7vGRFKx6T5
	dXo8fQEVyjGhLRXVQJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2RzE-00000008w0G-3UqT;
	Sat, 27 Sep 2025 10:17:04 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2RzC-00000008vzo-1fJV
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 10:17:03 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 424F0340D96;
	Sat, 27 Sep 2025 10:16:59 +0000 (UTC)
Date: Sat, 27 Sep 2025 18:16:48 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250927101648-GYA1338789@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927014547-GYA1336612@gentoo.org>
 <7F98284B9618900A+aNdiTKvvbg4G-LwM@troy-wujie14pro-arch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7F98284B9618900A+aNdiTKvvbg4G-LwM@troy-wujie14pro-arch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_031702_463333_02DFD2C7 
X-CRM114-Status: GOOD (  20.49  )
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

SGkgVHJveSwKCk9uIDEyOjA0IFNhdCAyNyBTZXAgICAgICwgVHJveSBNaXRjaGVsbCB3cm90ZToK
PiBPbiBTYXQsIFNlcCAyNywgMjAyNSBhdCAwOTo0NTo0N0FNICswODAwLCBZaXh1biBMYW4gd3Jv
dGU6Cj4gPiBIaSBUcm95LAo+ID4gCj4gPiBPbiAxMDowMiBUaHUgMjUgU2VwICAgICAsIFRyb3kg
TWl0Y2hlbGwgd3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBJMkMgUElPIGZ1bmN0
aW9uYWxpdHkgZm9yIHRoZSBTcGFjZW1pdCBLMSBTb0MsCj4gPiA+IGVuYWJsaW5nIHRoZSB1c2Ug
b2YgSTJDIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZC4KPiA+IEkgZmVlbCBpdCdzIG1vcmUgcHJv
cGVyIHRvIHNheQo+ID4gcy93aXRoIGludGVycnVwdHMgZGlzYWJsZWQvaW4gYXRvbWljIGNvbnRl
eHQvCj4gR29vZCBwb2ludC4KPiAKPiA+IAo+ID4gSSd2ZSBub3RpY2VkIHRoYXQgSzEgSTJDIGNv
bnRyb2xsZXIgc3VwcG9ydCB0aHJlZSBkaWZmZXJlbnQgdHJhbnNtaXNzaW9uIG1vZGU6Cj4gPiAg
bm9uLWZpZm8sIGZpZm8gbW9kZSwgZG1hIG1vZGUKPiA+IAo+ID4gd2hpbGUgeW91IGFyZSB0cnlp
bmcgdG8gaW1wbGVtZW50IHBpbyBzdXBwb3J0LCBJJ2Qgc3VnZ2VzdCB0byB0aGluayBvbmUKPiA+
IGZ1cnRoZXIgc3RlcCBpbiB0aGUgbG9uZyBydW4gLSBzdXBwb3J0IG1vcmUgZmlmby9kbWEgKyBu
b3JtYWwvYXRvbWljIGZlYXR1cmVzLAo+IEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4sIGJ1dCBJ
IGhhdmUgcmV2aWV3ZWQgdGhlIGNvZGUgc3RydWN0dXJlLAo+IGFuZCBhZGRpbmcgRklGTyBzdXBw
b3J0IHdvdWxkIG5vdCBzaWduaWZpY2FudGx5IGFmZmVjdCB0aGUgY3VycmVudCBQSU8gaW1wbGVt
ZW50YXRpb24uCndlIHdpbGwgc2VlLi4KCj4gCj4gPiAKPiA+IFBlcnNvbmFsbHksIEknZCBsaWtl
IHRvIHNlZSBmaWZvIG1vZGUgaW1wbGVtZW50ZWQgYmVmb3JlIGFkZGluZyBwaW8KPiA+IHN1cHBv
cnQsIGFzIGl0IHdpbGwgYnJpbmcgcXVpdGUgc2lnbmlmaWNhbnQgY29kZSBjaGFuZ2VzLCByZXF1
aXJlIGhlYXZ5Cj4gPiBjb2RlIHJldmlldyBlZmZvcnQuIEFuZCB5ZXMsIHRoaXMgd2lsbCBwdXQg
bW9yZSBkZW1hbmRpbmcgd29yayBvbiB5b3VyIHNpZGUKPiA+IGFuZCBtYXkgc2xvdyB0aGluZ3Mg
YSBiaXQuLgo+IFRoYXQgc2FpZCwgd2UgZG9u4oCZdCBoYXZlIGFueSBwbGFucyB0byBzdXBwb3J0
IEZJRk8gYXQgdGhpcyBwb2ludCwKPiBhbmQgUElPIGZ1bmN0aW9uYWxpdHkgaXMgc29tZXRoaW5n
IHdlIG5lZWQgdXJnZW50bHkuCj4gU28gSSB3aWxsIGNvbnRpbnVlIHRvIHB1c2ggdGhpcyBwYXRj
aCAodG9tb3Jyb3cpLgpwbGVhc2UgZG8gbm90IGZsdXNoIHRoZSBtYWlsaW5nIGxpc3QgYW5kIGdp
dmUgcGVvcGxlIHNvbWUgdGltZSwgSSBoYXZlbid0IHNlZW4gCmVub3VnaCByZXZpZXdzIGNvbWlu
ZywgcGxlYXNlIHdhaXQgZm9yIH5vbmUgd2VlayBiZWZvcmUgc2VuZGluZyBuZXh0IHZlcnNpb24s
Cm9yIG1ha2Ugc3VyZSB5b3UndmUgYWNjdW11bGF0ZWQgZW5vdWdoIGNoYW5nZXMuLgoKPiBUaGFu
a3MgZm9yIHlvdXIgdW5kZXJzdGFuZGluZy4gRm9yIGRldGFpbHMgb24gdGhlIGNvZGUgY2hhbmdl
cywgcGxlYXNlIHNlZSBhYm92ZS4KPiAKPiBJbiBhZGRpdGlvbiwgaWYgYW55b25lIGlzIGludGVy
ZXN0ZWQgaW4gYWRkaW5nIEZJRk8gc3VwcG9ydCwgSeKAmWQgYmUgaGFwcHkgdG8gaGVscC4KPiAK
ZG8geW91IHdhbnQgdG8gcHVzaCB0aGUgd29yayAoc3VwcG9ydCBmaWZvIG1vZGUpIHRvIGNvbW11
bml0eT8KCi0tIApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
