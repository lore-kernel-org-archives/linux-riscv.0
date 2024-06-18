Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82199C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 23:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCk+9+21hfvFu45Jv890YJkNRS6y1KRmaOvXIasLJe0=; b=EVIjHY5pmTtEcn
	jRhEOusrEEBTT1XwmRlZSsW1idarRJgtyEF+kao66bhuheCXwhX+mVpu1Z4oLOw0UhsUyt8NEBJfP
	QMIlsTQbKbAIAXddZ872dgo/0zSWb+ePqQ1CRNelG3uvHIdQAaX8R2wsS6j3FFD3BKrMQGVEtjN01
	rrYIV3AqemQjuOCU5han04qHg3KYbhxpv0/GeM4NJG9cdxU0QnQhy6ETR6vhuXGDxcyq+NTYWqZcx
	XFXgff38o+MqJfnTck/PE5VuPLdeHwwa83pC1bLtYl0n0b3XnqQCFzqnQLJjNec9ttIS+f17XBTD2
	A5mAnzHfm7XxpFCYlbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJibs-0000000Gw9d-2WWj;
	Tue, 18 Jun 2024 23:51:32 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJibo-0000000Gw8u-3g8b
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 23:51:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1718754682; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=APEcdjFAtRIbhxF/xsgrQoVwfrmx5OOtET1Cn9LfEDyPa0qsMZEvf3xZvYrCbEoGlf++llpjN3GtR7d+u2Iff/eXRj1ss83JiZYXS09tlrfkKVFXYlfdSLqFNXcnSML52vvY6tsJ+vw65Q6J7vv573s9WK2RiVpVETPaXxM/lug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1718754682; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RfFl+97EXHWl4m+G7vuwvFRzulFXQEXrJmZAgGUBbHU=; 
	b=bylbvPZC6WOwYQ8YKBZq0lww14/9rcmPR2Nt0cimM71nHYhQXiTRE5dgzqwn/IkeF9JAK4YH7gYIdPlZ0hypTL5d+xavwWAkZIch8CwTrXeEvmbn2ji/MslE1u7vXyEHxGbvDbM09pEfMispqC3YvZLx/ILYoYHlehlWXulWZ8M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718754682;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=RfFl+97EXHWl4m+G7vuwvFRzulFXQEXrJmZAgGUBbHU=;
	b=YLQxXRMlT8Z+fs6JVbqrT6vz8sPZlQyZAA58vIxmHVlJixEnc6ycfN/RbJkDl2z8
	7ZVO7FBV5mHbOIF6tDW3T1cnW8WcBSBacyoK6B2BaVaF8I270KHk+BbZHJRaoZQ2Ezz
	eUpHXKjsH4xtHWjJgcFvp1tnPbOz9bMYyVVoCt4/n6XnNi1psU3wqDbwli7bmQKigcD
	u4TJZkwWRGYpsSDaAgXkOasiPLAaVyqRaxqp0vDARzN9p0tp1Zd4LHnhZ4nzBv4B9e9
	8iKi6spRIaZfDBIkUd5k3f9ldj+e8WkAzljC92ZgLlGBCKkx2QoOCyg5Nwn1ddwclaB
	Fwbe/eKUDQ==
Received: by mx.zohomail.com with SMTPS id 1718754680063854.9774986659605;
	Tue, 18 Jun 2024 16:51:20 -0700 (PDT)
Message-ID: <3c20c9f15cd7a9fb1f2e88560c1b089ac8032898.camel@icenowy.me>
Subject: Re: [PATCH] RISC-V: Provide the frequency of mtime via hwprobe
From: Icenowy Zheng <uwu@icenowy.me>
To: Jessica Clarke <jrtc27@jrtc27.com>, Yunhui Cui <cuiyunhui@bytedance.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>, Conor Dooley
 <conor.dooley@microchip.com>, costa.shul@redhat.com, Andy Chiu
 <andy.chiu@sifive.com>, samitolvanen@google.com, linux-doc@vger.kernel.org,
  linux-riscv <linux-riscv@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Date: Wed, 19 Jun 2024 07:51:14 +0800
In-Reply-To: <2BA519C8-D258-4D98-AD49-AC7D30D8B0D2@jrtc27.com>
References: <20240618114653.12485-1-cuiyunhui@bytedance.com>
	 <2BA519C8-D258-4D98-AD49-AC7D30D8B0D2@jrtc27.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_165129_000340_9E4D4D6F 
X-CRM114-Status: GOOD (  11.01  )
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

5ZyoIDIwMjQtMDYtMTjmmJ/mnJ/kuoznmoQgMTg6MTEgKzAxMDDvvIxKZXNzaWNhIENsYXJrZeWG
memBk++8mgo+IE9uIDE4IEp1biAyMDI0LCBhdCAxMjo0NiwgWXVuaHVpIEN1aSA8Y3VpeXVuaHVp
QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gCj4gPiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQHJpdm9zaW5jLmNvbT4KPiA+IAo+ID4gQSBoYW5kZnVsIG9mIHVzZXItdmlzaWJsZSBiZWhh
dmlvciBpcyBiYXNlZCBvbiB0aGUgZnJlcXVlbmN5IG9mIHRoZQo+ID4gbWFjaGluZS1tb2RlIHRp
bWUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3Np
bmMuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Cj4gCj4gSSB3b3VsZCBzdWdnZXN0IHJlZmVycmluZyB0byB0aGUgdXNlci1tb2RlIENT
UiBpbnN0ZWFkLCBpLmUuIOKAnHRpbWXigJ0KPiByYXRoZXIgdGhhbiDigJxtdGltZeKAnSB0aHJv
dWdob3V0IGluIG5hbWVzIGFuZCBkZXNjcmlwdGlvbnMsIHNpbmNlCj4gdGhhdOKAmXMKPiB0aGUg
dGhpbmcgdGhhdCB1c2VyLW1vZGUgc29mdHdhcmUgaXMgYWN0dWFsbHkgcmVhZGluZyBmcm9tLgoK
QWdyZWUuIE1USU1FIGlzbid0IGV2ZW4gYSB0aGluZyBkZWZpbmVkIGluIFJJU0MtViBJU0EgLS0g
aXQncyBwYXJ0IG9mCnRoZSBBQ0xJTlQgdGltZXIgc3BlYywgYnV0IGJlZm9yZSBBQ0xJTlQgZ2V0
cyB3aWRlbHkgYWNjZXB0ZWQsIGl0J3MKanVzdCBzb21lIFNpRml2ZSB0aGluZyB0aGF0IGdvdCBj
b3BpZWQgYnkgbWFueSBvdGhlciB2ZW5kb3JzIChhbmQKdmVuZG9ycyBzdWNoIGFzIFQtSGVhZCBl
dmVuIHByb3ZpZGVzIENMSU5UIHcvbyBNVElNRSByZWdpc3RlciAod2VsbApiZWNhdXNlIHRoZXNl
IFQtSGVhZCBjb3JlcyBoYXZlIHJlZmVyZW5jZSBzb3VyY2UgY29kZSBhdmFpbGFibGUsIHRoaXMK
aXMgYmVjYXVzZSBvZiB0aGVpciBDUFUgZGVzaWduIHVzZXMgYW4gZXh0ZXJuYWwgY291bnRlciBm
ZWQgYXMgVElNRQpyZWdpc3RlcikpLgoKPiAKPiBKZXNzCj4gCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
