Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFECF606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dSLdWQsW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=mIvoRN0S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aNIYeJi75L0uRUHNKk2tCiUkQzaJEfj/IDchlCCqQ8g=; b=dSLdWQsWsFGdYJBP5WNznHiwS7
	j+hkMw6arhrxgXJxqmfjkAFiSJMytmK5bYYv/lxVO8k5UkAyPAgrYkceECNXMhe0rtaSTkOfvTiD3
	tHkUgp4KV3Rza7Y4/DDNijPdH+gTuC9GNFQytBKUzBx6cvKLD6hRuj/BpHWVbu51ulmBJp36ANiI/
	xQMow2Y+vKR6QJINaqtrvhMXGjnOAlKG7kWh5fssmn43F3z38/atRJN8AIQvqVeiMkLiGHhiVw1iq
	tonKHlUYpaLEcZXsTTblq733x2SvnhTQ19UNrkSGDLBTv9o2MgHkbR7Aq4AkDr1TNOokzN2xvgwcD
	M+N7wu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrQr-00000001Svy-0BGP;
	Mon, 16 Nov 2026 07:47:17 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrQo-00000001Svd-47l1
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:47:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794815227; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b3dX3z7c8GFLUI5FjH8mIhgOyYSA51JeUkEOFuLCLF133Gle+fjvbB+ac6keHKZeDlHSaofM0sf3vs23/gppDwsE317B4UO6N9cAEvvzp+M3wvnthvpt68p7YiFGLpALccy9LE8keCwW+sidDGtBO9WCel7jztJ2dAfBiGYH7Aw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794815227; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OUTfZXv8x7eL7MqFjv0jmWWqCW17mS56gXHeKOmtpac=; 
	b=dcA/+LPEvCvS2urZRT7Gh5ZEPbzq2EduvUULHDPVgosMueAZ/Xym4Kn6zQYxYcHeMm3DQ5H4zyO4Y0JRNSaXUGtJyl341MU39l1kxug0F1iN18H/coynhi0QmTGE8CBvTsgepj3H4dgN11YXTBXAnfYz4fQLrFJoeZdQv0ykZ84=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=mIvoRN0ST5AP8MT6qVavjzJyxAQ7SFGcjKnUup5BQLCsGI7ny6wSsMQLnrb9M8PwFElqyVUHsR/JaHuE2YPNvHp/n1IWkesy//TYSYp6FtgmVYBHF0hLYzraTTswWdBQIOYoSEK0ArLmw0s1YmwtChkhnf2AoQi3Iu9dEOySWJgsJxFCagsm2m5WIx6Sg4iMtEMpvA/G1YL5kc7OcAVl72hw3d2+so0zGpKapw15ZG2DgYXRboefObfWqg4jkGsqqftoOSIhBbujYFmKHuKLBIu84y6kfd90D93MUtJ3cb4MEWUfHrUXN+mIgAuEICkxsgsjMoHL2PjHWwgmT0TF6g==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=OUTfZXv8x7eL7MqFjv0jmWWqCW17mS56gXHeKOmtpac=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794815225743796.5951054994644;
	Sun, 15 Nov 2026 23:47:05 -0800 (PST)
Message-ID: <b7d7ac2eee0e64aa7c267def5c2a8a022c7da425.camel@icenowy.me>
Subject: Re: [PATCH] pmdomain: core: connect consumer with supplier via
 device link
From: Icenowy Zheng <uwu@icenowy.me>
To: Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>,  Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Date: Mon, 16 Nov 2026 15:46:59 +0800
In-Reply-To: <20261116072442-GKA100890@kernel.org>
References: <20261112-01-pm-device-link-v1-1-8932e0862378@kernel.org>
	 <CAPx+jO-37Km71oSW+zOO7BBWLj86SNCn=U=EGmBXdC5SfX4nbA@mail.gmail.com>
	 <20261116072442-GKA100890@kernel.org>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_234715_107712_1E54B3A2 
X-CRM114-Status: GOOD (  12.76  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMTbkuIDnmoQgMDc6MjQgKzAwMDDvvIxZaXh1biBMYW7lhpnpgZPvvJoKPiBI
aSBVbGYsCj4gCj4gT24gMTI6MzMgU2F0IDE0IE5vdsKgwqDCoMKgICwgVWxmIEhhbnNzb24gd3Jv
dGU6Cj4gPiBPbiBUaHUsIE5vdiAxMiwgMjAyNiBhdCA4OjQ14oCvQU0gWWl4dW4gTGFuIDxkbGFu
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiAKPiA+ID4gQ29ubmVjdCBkb3duc3RyZWFtIFBvd2Vy
IERvbWFpbiBjb25zdW1lciB3aXRoIHRoZSBzdXBwbGllcgo+ID4gPiB0aHJvdWdoCj4gPiA+IHRo
ZSBkZXZpY2UgbGluayBBUEksIFNvIHdoZW4gdGhlIHBtZG9tYWluIGRyaXZlciBpcyB1bmxvYWRl
ZCBvcgo+ID4gPiB1bmJpbmRlZCwKPiA+ID4gdGhlIGNvbnN1bWVyIGNhbiBiZSBhdXRvbWF0aWNh
bGx5IG5vdGlmaWVkIGFuZCBwdXJnZWQgZ3JhY2VmdWxseS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPgo+ID4gCj4gPiBDYW4geW91IGNoZWNr
IGlmIHRoZSBiZWxvdyBjb21taXQgdGhhdCBzaXRzIG9uIG15IGZpeGVzIGJyYW5jaAo+ID4gc29s
dmVzCj4gPiB0aGlzIHByb2JsZW0gZm9yIHlvdT8KPiA+IAo+IE5vLCBJJ3ZlIGNoZXJyeS1waWNr
ZWQgYmVsb3cgY29tbWl0IGFuZCBpdCBkb2VzIG5vdCBzb2x2ZSBteSBpc3N1ZSwKPiDCoGl0J3Mg
YSBkaWZmZXJlbnQgcHJvYmxlbS4KPiAKPiBQcm9ibGVtIGhlcmUgaXMgdGhlIHBtIGNvbnN1bWVy
IHNpZGUgaXNuJ3QgYXdhcmUgcG0gZHJpdmVyIGlzCj4gcmVtb3ZlZC4gCj4gCgpJIGRvIHRoaW5r
IGl0J3MganVzdCBiZXR0ZXIgdG8gcHJldmVudCBQTSBkcml2ZXJzIGZyb20gYmVpbmcgcmVtb3Zl
ZC4KClRoYW5rcywKSWNlbm93eQoKPiAKPiA+IGUyNzk4MzNhNTM2MiBwbWRvbWFpbjogY29yZTog
V2FpdCBmb3IgZGV2aWNlIGxpbmsgcmVtb3ZhbHMgYmVmb3JlCj4gPiBkcm9wcGluZyBnZW5wZC0+
ZGV2Cj4gPiAKPiA+IEtpbmQgcmVnYXJkcwo+ID4gVWZmZQo+ID4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
