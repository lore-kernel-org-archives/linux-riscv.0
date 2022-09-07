Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DC1C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 11:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQxwNkE3T7lXZyvM73tEC+p8cvy8l/zPraFqxgLWQwc=; b=yDSebEU8Oc7b8B
	9dO+hoiSSkd+ttgqtdXrGGhlCTo3HsTyf1mzLhABMMKZteCucCWMr5FPyl2C5GAjPMnoLLfcfN+IL
	FGddJv++qFy5xM01aFyUNP9RkGZIs/M0cJT/83FkGHlzTGCSiUwzoHGkvLkSLijHcMv6lRDib4Cio
	cYbMdDyHh28WCgDhtIG141y9J4lEBuwvhldWU1CAzAfLttxsoEkeI6eFX2+4aJoLF6kLXaL/3utcG
	4BsTs/WB3IgXwGUvnuQhJefVirCrkGihTKSAKtyi7VFYDLNx8/hSs3YmbyhjozKLnimY61WFayK67
	+sUldEzP6r++gvk2Yb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVtiV-005uks-M6; Wed, 07 Sep 2022 11:59:39 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVtiR-005uhW-Cu
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 11:59:37 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id CF3F42B05B84;
	Wed,  7 Sep 2022 07:59:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 07 Sep 2022 07:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1662551967; x=
	1662555567; bh=93TgYd152lsMJGukyVn+n+/KYrXdTp+yDhOzZKjQ6j4=; b=a
	wpcaSjMpvQxH/r24XuOYbW7qzgwqAdiOOcxmaxHRSpFS2LCPs7/QaE7SECr3bjYK
	2Z+jM3dw7YVeZ8RXWAD7G7FUfk+9OS3ywJEyDpRJAe7FpvG4kn8iLIETYUC2kkd4
	eYqMwh/QjEC4DT3fuqot48hq6mCjuNZWUI8khrReQASrv67oy9hh2WdIRJHDANKT
	ECnpC46+2xeAQE2iO1DLlrVGJx/+4bvljtivxPZkM2/eFoT2AVIwwXF0hNviWEpq
	DOGp/Nfe3w+yxCXNN5cPZcEEVqwFDyA/E1K3DLpHistUEIn/z3bmlTVTr5ygN47z
	Cvsrm/UjC2Fd3YRLfC83g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662551967; x=
	1662555567; bh=93TgYd152lsMJGukyVn+n+/KYrXdTp+yDhOzZKjQ6j4=; b=a
	vHCxVUc2IdvYCG0t9AqWn7NS7WrBBG4UCH6F/qqtXeczJkJrszU9X1x2ZwdoIX/o
	9qLujK/2ikjuw90nv2kxe+NZrtQB37QxU8HR+t8ibz6DgkUrk93UJ6ieXq89vNsI
	/A+BKCEclvpZh0zRJoTINAHLB86Rjx91Yyqwlr1Xd4mQIwzm1xoiF/vM1C+QzzEo
	q0gx5JitIaESQZ/3OX9Racmy3WsUUfhIl/QdfHwXTkV4JpazE1QXscwrqpXcXrAT
	B1gOuIa/T5SEAmbA6PasO47lvyTWMOvkWuZh+gtFAjCAFBTIte9R6hrOZG4OwVBY
	fGNqnc2owYBFb3g/YRBkg==
X-ME-Sender: <xms:nYcYY1oX_Y-wC5X1wR2qHcedMPqDeTl2ns1mCbB3eSVEVlX0S7vCRQ>
    <xme:nYcYY3rpq4yC_ZlA8DKRZLFXe4CRkFFkZ69MaOfwy-hjPWdrhiqqxEV64gkUfkY3U
    wP2LK3OVcLpOVO3kTM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:nocYYyNdzljoXCNjYeoa-shYLTaCax1-IzEHxZfwDo5DB0KdeyFC2Q>
    <xmx:nocYYw6GsrKwte3Wldp8tl1SQ6nCpsO-Hhgts03HjI9va09UlTVk0g>
    <xmx:nocYY05sn2_rs2Wz_CWm0LztL1KRLOObjYocAb11SdH-hhMiYV0sMQ>
    <xmx:n4cYY6F0VJXmjySOdLPk-Wkcz93cHgkwuV-QLF1CUOJbLpr4VVDN7a0cUh4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DB8EBB60083; Wed,  7 Sep 2022 07:59:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <715b40ba-1bcc-4582-bed1-ef41126c7b94@www.fastmail.com>
In-Reply-To: <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
References: <20220906104805.23211-1-jslaby@suse.cz>
 <Yxcvbk281f/vy4vb@hovoldconsulting.com>
 <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
 <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
Date: Wed, 07 Sep 2022 13:59:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Johan Hovold" <johan@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Tobias Klauser" <tklauser@distanz.ch>,
 "Richard Genoud" <richard.genoud@gmail.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@microchip.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "NXP Linux Team" <linux-imx@nxp.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Florian Fainelli" <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Kevin Cernekee" <cernekee@gmail.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Orson Zhai" <orsonzhai@gmail.com>,
 "Baolin Wang" <baolin.wang7@gmail.com>,
 "Chunyan Zhang" <zhang.lyra@gmail.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] tty: TX helpers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_045935_744807_844BBF40 
X-CRM114-Status: GOOD (  25.29  )
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

T24gV2VkLCBTZXAgNywgMjAyMiwgYXQgMTI6MTYgUE0sIElscG8gSsOkcnZpbmVuIHdyb3RlOgo+
IE9uIFdlZCwgNyBTZXAgMjAyMiwgSmlyaSBTbGFieSB3cm90ZToKPj4gT24gMDYuIDA5LiAyMiwg
MTM6MzAsIEpvaGFuIEhvdm9sZCB3cm90ZToKPj4gPiBPbiBUdWUsIFNlcCAwNiwgMjAyMiBhdCAx
Mjo0ODowMVBNICswMjAwLCBKaXJpIFNsYWJ5IHdyb3RlOgo+PiA+IE5BSwo+PiAKPj4gSSdkIGxv
dmUgdG8gY29tZSB1cCB3aXRoIHNvbWV0aGluZyBuaWNlci4gVGhhdCB3b3VsZCBiZSBhIGZ1bmN0
aW9uIGluCj4+IHNlcmlhbC1jb3JlIGNhbGxpbmcgaG9va3MgbGlrZSBJIGhhZCBbMV0gZm9yIGV4
YW1wbGUuIEJ1dCBwcm92aWRlZCBhbGwgdGhvc2UKPj4gQ1BVIHdvcmthcm91bmRzL3RodW5rcywg
aXQnZCBiZSBxdWl0ZSBleHBlbnNpdmUgdG8gY2FsbCB0d28gZnVuY3Rpb25zIHBlcgo+PiBjaGFy
YWN0ZXIuCj4+IAo+PiBPciBjcmVhdGluZyBhIHN0YXRpYyBpbmxpbmUgKGhhdmluZyDCsSB0aGUg
bWFjcm8gY29udGVudCkgYW5kIHRoZSBob29rcyBhcwo+PiBwYXJhbWV0ZXJzIGFuZCBob3BlIGZv
ciBvcHRpbWl6YXRpb25zIHRvIGVsaW1pbmF0ZSB0aHVua3MgKGFsc28gc3VnZ2VzdGVkIGluCj4+
IHRoZSBwYXN0IFsxXSkuCj4+IAo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjIwNDExMTA1NDA1Ljk1MTktMS1qc2xhYnlAc3VzZS5jei8KPgo+IEkgc2Vjb25kIEppcmkgaGVy
ZS4KPgo+IFNhdmluZyBsaW5lcyBpbiBkcml2ZXJzIGlzIG5vdCB0aGF0IGltcG9ydGFudCBjb21w
YXJlZCB3aXRoIGFsbCByZW1vdmluZyAKPiBhbGwgdGhlIHZhcmlhbnRzIG9mIHRoZSBzYW1lIHRo
aW5nIHRoYXQgaGF2ZSBjcmVwdCB0aGVyZSBvdmVyIHRoZSB5ZWFycy4KPgo+IEkgc3VzcGVjdCB0
aGUgbWFpbiByZWFzb24gZm9yIHRoZSB2YXJpYW50cyBpcyB0aGF0IGV2ZXJ5Ym9keSBqdXN0IHVz
ZWQgCj4gb3RoZXIgZHJpdmVycyBhcyBleGFtcGxlcyBhbmQgdGhlcmVmb3JlIHdlJ3ZlIGEgZmV3
ICJtYWluIiB2YXJpYW50IAo+IGJyYW5jaGVzIGRlcGVuZGluZyBvbiB3aGljaCBvZiB0aGUgZHJp
dmVycyB3YXMgdXNlZCBhcyBhbiBleGFtcGxlIGZvciB0aGUgCj4gb3RoZXIuIFRoYXQgaXMgaGFy
ZGx5IGEgZ29vZCBlbm91Z2ggcmVhc29uIHRvIGtlZXAgdGhlbSBkaWZmZXJlbnQgYW5kIGFzIAo+
IGxvbmcgYXMgZWFjaCBkcml2ZXIga2VlcHMgaXRzIG93biBmdW5jdGlvbiBmb3IgdGhpcywgaXQg
d2lsbCBldmVudHVhbGx5IAo+IGxlYWQgdG8gc2ltaWxhciBkaWZmZXJlbnRpYXRpb24gc28gZS5n
LiBhIG9uZS10aW1lIGJhbmQtYWlkIHNpbWlsYXJpemF0aW9uIAo+IHdvdWxkIG5vdCBoZWxwIGlu
IHRoZSBsb25nIHJ1bi4KPgo+IEFsc28sIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IHNlZSBp
dCB1bnJlYWRhYmxlIHdoZW4gdGhlIGFjdHVhbCBjb2RlIGlzIAo+IG91dCBpbiB0aGUgb3BlbiBp
biB0aGF0IG1hY3JvLiBJdCdzIGZvcm1hdHRlZCBtdWNoIGJldHRlciB0aGFuIGUuZy4gCj4gcmVh
ZF9wb2xsX3RpbWVvdXQoKSBpZiB5b3Ugd2FudCBhbiBleGFtcGxlIG9mIHNvbWV0aGluZyB0aGF0
IGlzIGhhcmRseSAKPiByZWFkYWJsZSA7LSkuIEkgYWdyZWUgdGhvdWdoIHRoZXJlJ3MgYSBsZWFy
bmluZy1jdXJ2ZSwgYWxiZWl0IHNtYWxsLCB0aGF0IAo+IGl0IGFjdHVhbGx5IGNyZWF0ZXMgYSBm
dW5jdGlvbiBidXQgdGhhdCBkb2Vzbid0IHNlZW0gdG8gbWUgYXMgYmlnIG9mIGFuIAo+IG9ic3Rh
Y2xlIHlvdSBzZWVtIHRvIHRoaW5rLgoKSSB0aGluayBpdCB3b3VsZCBoZWxwIHRvIHJlcGxhY2Ug
dGhlIG1hY3JvIHRoYXQgZGVmaW5lcwp0aGUgZnVuY3Rpb24gd2l0aCBhIHNldCBvZiBtYWNyb3Mg
dGhhdCBjYW4gYmUgdXNlZCBpbgpmdW5jdGlvbiBib2RpZXMuIFRoaXMgd291bGQgYXZvaWQgdGhl
IF9fVkFfQVJHU19fIHN0dWZmCmFuZCBhbGxvdyByZWFkZXJzIHRoYXQgYXJlIHVuZmFtaWxpYXIg
d2l0aCB0dHkgZHJpdmVycyB0bwp0cmVhdCBpdCBhcyBhIGZ1bmN0aW9uIGNhbGwuCgpTbyBlLmcu
IGluc3RlYWQgb2YgCgpzdGF0aWMgREVGSU5FX1VBUlRfUE9SVF9UWF9IRUxQRVJfTElNSVRFRChh
bHRlcmFfanRhZ3VhcnRfZG9fdHhfY2hhcnMsCgkJdHJ1ZSwKCQl3cml0ZWwoY2gsIHBvcnQtPm1l
bWJhc2UgKyBBTFRFUkFfSlRBR1VBUlRfREFUQV9SRUcpLAoJCSh7fSkpOwoKdGhlIGFsdGVyYV9q
dGFndWFydCBkcml2ZXIgd291bGQgY29udGFpbiBhIGZ1bmN0aW9uIGxpa2UKCnN0YXRpYyBpbnQg
YWx0ZXJhX2p0YWd1YXJ0X2RvX3R4X2NoYXJzKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjb3VudCkKewog
ICAgICAgY2hhciBjaDsKCiAgICAgICByZXR1cm4gdWFydF9wb3J0X3R4X2hlbHBlcl9saW1pdGVk
KHBvcnQsIGNoLCBjb3VudCwgdHJ1ZSwKICAgICAgICAgICAgICAgIHdyaXRlbChjaCwgcG9ydC0+
bWVtYmFzZSArIEFMVEVSQV9KVEFHVUFSVF9EQVRBX1JFRyksCiAgICAgICAgICAgICAgICAoe30p
KTsKfQoKb3Igc29tZSB2YXJpYXRpb24gb2YgdGhhdC4gSXQncyBhIGZldyBtb3JlIGxpbmVzLCBi
dXQgdGhvc2UKZXh0cmEgbGluZXMgd291bGQgaGVscCBtZSB1bmRlcnN0YW5kIHdoYXQgaXMgYWN0
dWFsbHkgZ29pbmcgb24Kd2hpbGUgc3RpbGwgYXZvaWRpbmcgdGhlIHVzdWFsIGJ1Z3MgYW5kIGR1
cGxpY2F0aW9uLgoKSWYgdGhlIGNhbGxlciBvZiB0aGF0IGZ1bmN0aW9uIGlzIGl0c2VsZiB0cml2
aWFsIChsaWtlCnNlcmlhbDIxMjg1X3R4X2NoYXJzKSwgdGhlbiB0aGUgaW50ZXJtZWRpYXRlIGZ1
bmN0aW9uIGNhbgpiZSBvbWl0dGVkIGluIG9yZGVyIHRvIHNhdmUgc29tZSBvZiB0aGUgZXh0cmEg
Y29tcGxleGl0eS4KCiAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
