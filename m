Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7062C6FA86
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIQc57q9/Yk3+zVj7wx2KAXIfp/RedXmRM/IwiRpUSM=; b=eLSGx526NKI79h
	Fx8MzLgYnYS84Jpbw9Rz+IrNzayMGZIQ53ac4iu6e7UHoQsYQjY53pPkxu1ValULEqBZY/pD+7G0q
	VfLH3ndZ+4HGQUcnsg4Lh+E491lvOiXhuns71G7zk4JS+mb52KiSN6I/9/S+j2FbATDFofJ94NWjw
	VsR2NiV5PgucSsrKG/Fnniha8ODUCosIV9ekVCxddN3Hh0JM3QqI0qS9L5WnMgR//WitmZzZ02DsR
	HIPhgpvrvSN5CFGm+2EOpYZD7eBDLtTWAA5szDyfWphZ14S00BKMHTdCo7eylJts+A6b0gxGQNYcL
	YA0RW2vi7C/cVPg2ACmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVvPi-006c7L-BS; Wed, 07 Sep 2022 13:48:22 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVvPe-006c2q-KX
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 13:48:20 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id A507B580392;
	Wed,  7 Sep 2022 09:48:11 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 07 Sep 2022 09:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1662558491; x=
	1662562091; bh=x8FEmyd46Ech5SbUlxrK+zLn7yS/pATtQbRStypEsQk=; b=R
	98+L5TR/6KxWm9Rz3/V2adnKa0kBcUdCYyi8h7CcO3sM2Z057GdgQ5FU5v2B7n6/
	Dw003SC1kdbbbzv9O5IAQsJRyHXXo5T432pCE+Rl05dk7UJLo9nQwKn4csyxyJ4N
	uX7EzPHwsH9lvB2zdu5o1PUMg6bwv2oJNZTpiLCS4EOkHsN23hOMXUiWYkf/wHYA
	SzkuM/o78nIBG7VMY27LVTufzB8KvclMHDzKt0by8FvrMf15fOpVGd+WTQIsAwHe
	Gy8ygWPsnnln6veJ3EWCxP+VbwZkBuzUKY7XrOMz9dtML4htjEgA0kUEVUV9HO+k
	x+ws+j/JVJGDfdkEt5eXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662558491; x=
	1662562091; bh=x8FEmyd46Ech5SbUlxrK+zLn7yS/pATtQbRStypEsQk=; b=Z
	1Oz5b5imBIqKK8mQc+QM2nx6VJZBc+1wP36WSriFxKeRKlBDK/+rce9sjnb9ZNLp
	o9XUK2YDCPfGkV8QWHsf80IpaTvY3ygbGK1lM8lHUkSYqtKPA/OGxWWIhdhK1GCG
	f/Y99HUH5anBPFdlovtHZ40m+N6tBvJj9zIXUM0T/CIsIiyPXtHCVYzZl/m3ehUT
	EzpWVzz4145kDKjyZtdM34BSmT0VBr30BP8GnZ+pqd0oaPVX0gaHeBtr6Bi4W0L/
	6KSW3Pq6dbKmgx9+DsOunxftgk6oarQIGhYeCTG4OS5YIg7uWBbfVxFNx3M/4s0V
	yDVYK4PPi/a25+VqpYBOQ==
X-ME-Sender: <xms:GqEYYxDWCvU49c4G2SuzitU-q-EGGFo0TD8uGIsB3MWQb43uKcPR7g>
    <xme:GqEYY_igpZDCTaDriY57FfvGXZJG6FWkEQA_KR5A793oXMyKNGMAL0GKpE32rANPH
    NiKR8lSclevzgwJtRY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeelfefgueeviefgudduueefueffkeelleeijeelkefgudfgueelledtuddu
    ieegvdenucffohhmrghinhepghhouggsohhlthdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:GqEYY8mxJNEzXYNyW6UmoHK2gyScOl0FHrhxgeBVlej95LCwK_bLzQ>
    <xmx:GqEYY7y0iXybYPVs746Zu0fooqvnpq8lY3njZYNthIw4v5nqnMZRFQ>
    <xmx:GqEYY2SglqA4OkjXC_q6hG1amHEgkXwVVCVoRTT52i5tM5nYLM0S4w>
    <xmx:G6EYY9_URdg-CZRU8m7pUfehO-rRGyrQ3Lxj-edmZcTaXJxCyYCQbQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0E14FB60083; Wed,  7 Sep 2022 09:48:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <af980df4-a308-4aab-8628-ca02b55de43f@www.fastmail.com>
In-Reply-To: <e5f1ac97-e67f-bb68-d89a-f6f246ff6388@linux.intel.com>
References: <20220906104805.23211-1-jslaby@suse.cz>
 <Yxcvbk281f/vy4vb@hovoldconsulting.com>
 <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
 <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
 <715b40ba-1bcc-4582-bed1-ef41126c7b94@www.fastmail.com>
 <cfd16d53-6aa0-e848-91d0-dce8ff72bb4d@linux.intel.com>
 <YxiONiDgGYp8MGQA@kroah.com>
 <c66f9c98-dcef-27c-d74a-ea826f6a799@linux.intel.com>
 <YxiQVTN/jX8AfO4L@kroah.com>
 <e5f1ac97-e67f-bb68-d89a-f6f246ff6388@linux.intel.com>
Date: Wed, 07 Sep 2022 15:47:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Jiri Slaby" <jirislaby@kernel.org>, "Johan Hovold" <johan@kernel.org>,
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
X-CRM114-CacheID: sfid-20220907_064819_163821_2DE09AD8 
X-CRM114-Status: GOOD (  17.00  )
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

T24gV2VkLCBTZXAgNywgMjAyMiwgYXQgMjo1NiBQTSwgSWxwbyBKw6RydmluZW4gd3JvdGU6Cj4g
T24gV2VkLCA3IFNlcCAyMDIyLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4+IE9rLCBubywg
SSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgQXJuZCBtZWFudCBoZXJlIHRoZW4gOigKPgo+IEkgdGhp
bmsgaGUgZGlkIGp1c3QgMiB0aGluZ3MgKGNvbXBhcmVkIHdpdGggMi80IG9mIHRoaXMgc2VyaWVz
KToKPgo+IC0gX19ERUZJTkVfVUFSVF9QT1JUX1RYX0hFTFBFUigpIGRvZXNuJ3QgY3JlYXRlIGEg
ZnVuY3Rpb24gYnV0IGp1c3Qgd3JhcHMgCj4gdGhlIG1hY3JvIGJvZHkgd2l0aCAoeyB9KS4gVGhl
cmVmb3JlLCBhIGRyaXZlciBtdXN0IHVzZSBpdCBpbnNpZGUgCj4gYSBmdW5jdGlvbiByYXRoZXIg
dGhhbiB0aGUgbWFjcm8gY3JlYXRpbmcgYSBuZXcgZnVuY3Rpb24gd2l0aCBuYW1lLgo+IC0gVXNl
IGxvd2VyY2FzZSBpbnN0ZWFkIG9mIHVwcGVyY2FzZSAodGhpcyBpcyBhIHRyaXZpYWwgY2hhbmdl
KQo+Cj4gV2hlbiBhIGRyaXZlciBpcyB1c2luZyB0aGVzZSAiZnVuY3Rpb24iIHRoYXQgYXJlIGp1
c3QgbWFkZSBsb29rIGZ1bmN0aW9ucyAKPiBidXQgYXJlIG1hY3JvcyBmb3IgcmVhbCwgaXQgd2ls
bCBub3QgYWRkIGZ1bmN0aW9uLXBvaW50ZXItaW5kaXJlY3Rpb24tY2FsbCAKPiBwZXIgY2hhcmFj
dGVyIGJ1dCBwdWxscyB0aGUgd2hvbGUgbG9vcCBmcm9tIHRoZSBtYWNybyBpbnRvIHRoZSBmdW5j
dGlvbiAKPiBpbiB0aGUgZHJpdmVyIGFuZCBpbmplY3RzIHRob3NlIHB1dGNoYXIsIGV0Yy4gZGly
ZWN0bHkgaW50byB0aGF0IGxvb3AuIAo+IC4uLkl0IGlzIGp1c3QgbGlrZSByZWFkX3BvbGxfdGlt
ZW91dCgpIGNvbnN0cnVjdHMgdGhlIGxvb3AuCgpSaWdodCwgdGhlIGV4YW1wbGUgSSB3YXMgdGhp
bmtpbmcgb2Ygd2FzIHdhaXRfZXZlbnQoKSwgd2hpY2ggaXMKYW5vdGhlciBjb21tb24gbWFjcm8g
dGhhdCB0YWtlcyBleHByZXNzaW9ucyBhcyBhcmd1bWVudHMgYnV0IGdldHMKdXNlZCBsaWtlIGEg
ZnVuY3Rpb24gY2FsbC4gU2FtZSB0aGluZyByZWFsbHkuCgpOb3RlIHRoYXQgZXZlbiB3aXRoIGFu
IGFsd2F5c19pbmxpbmUgZnVuY3Rpb24gdGhhdCB0YWtlcyBhCmZ1bmN0aW9uIHBvaW50ZXIgYXJn
dW1lbnQsIGFueXRoaW5nIGZyb20gZ2NjLTQuNyB1cCBoYXMgbm8gCnByb2JsZW0gaW5saW5pbmcg
dGhyb3VnaCB0aGF0LCBzbyBpdCBzaG91bGQgbm90IGJlIGFueSBsZXNzCmVmZmljaWVudCB0aG91
Z2ggaXQgbWlnaHQgbm90IGhlbHAgcmVhZGFiaWxpdHkgZWl0aGVyLgpTZWUgaHR0cHM6Ly9nb2Ri
b2x0Lm9yZy96L284R0dHOFR6TSBmb3IgYW4gZXhhbXBsZSBvZiB0aGF0LgoKICAgICBBcm5kCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
