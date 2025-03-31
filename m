Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E493C36011
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 08:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jn9BuooeQJTfcT3FtvoXEfQflXsM82O2QBjaA65xFqE=; b=YWmN7OP3ap8IwN
	pasP+ayDcaON2kMNErYTg9aDQYYPBSm9VqBOlX3OipIqqrZEYNUPLitB0n0Mahu9iEz9DbXFdhfXO
	/mwzrG7ihLuEgt23nN2afulH99VR9P5QqzZ+eBt637jZP4gzh36y9QM8ZKLVBk4aUayqK9IEl0jPH
	kD6apSuMrVu9gJ7ITI5tF9fKOzMiZYL15GuGEF/2TT8QqHh2G51b3dyqczoRLpdXDasFtQxoCH2gg
	+QRvk9D6t6plFZi6tPUR0Uk4N52Bj3QII5OYN/upcpY+oqGart//DdvH1pO/GhlBQL3jNz2XNq+90
	rT3GiRZsqJf+OVqOBIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA9Y-0000000HIQX-0dVt;
	Mon, 31 Mar 2025 08:05:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA77-0000000HHyH-37DX
	for linux-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 08:03:22 +0000
Date: Mon, 31 Mar 2025 10:03:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743408200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75LtVyshrpJURZDN4urZhi8S9CoAlSOeTIRvPjPMZJo=;
	b=NKxlC4/aH1YHe9/fhfvyILrpo3cMwJRrA3MFoqOXhsalLN0hCEuLUmhulZUI6aP/kfEP7R
	F+ldAEzgmSrbYKeTRjv0YpRZzCqHzZxy9i97E4RRAJMLWpnFBdS6Estd1uvSZfl5s4X3yX
	4mEpV7ZoJqX+BN1SulNpzWxr8EJD29jq6fVRIaR92jKEvmrP2MncgunbT9Bv8oayllbaRD
	in1wKZ8q7SvTjQPjNcONitjYJGxWqSHbbPT6xuwQTSBj91G8uuD0Yl0Sn0Jmjpw+BYiGMw
	0Xmh3jkUymzKlVxhSEmPwKSXUwYLoBdbLpKML7FKGhFO/BL3PAmqNF8LNMd4Uw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743408200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75LtVyshrpJURZDN4urZhi8S9CoAlSOeTIRvPjPMZJo=;
	b=uSSqXfQnv8ErdniQp/vNTsDTt7J4Z1TE9vvTE//wlMYTSEmbq9c5pBUmTKI3fWplCy+UbN
	s4MdZgfQfCBhYnDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pmladek@suse.com,
	samuel.holland@sifive.com, conor.dooley@microchip.com,
	u.kleine-koenig@baylibre.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 2/2] serial: sifive: Switch to nbcon console
Message-ID: <20250331080318.BdZQodhu@linutronix.de>
References: <20250330110957.392460-1-ryotkkr98@gmail.com>
 <20250330112109.393526-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250330112109.393526-1-ryotkkr98@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_010321_921560_A44454BA 
X-CRM114-Status: UNSURE (   6.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyNS0wMy0zMCAyMDoyMTowOSBbKzA5MDBdLCBSeW8gVGFrYWt1cmEgd3JvdGU6Cj4gLS0t
IGEvZHJpdmVycy90dHkvc2VyaWFsL3NpZml2ZS5jCj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFs
L3NpZml2ZS5jCj4gQEAgLTc4NSwzMyArNzg2LDg4IEBAIHN0YXRpYyB2b2lkIHNpZml2ZV9zZXJp
YWxfY29uc29sZV9wdXRjaGFyKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIHVuc2lnbmVkIGNoYXIK
PiAgCj4gIAlfX3NzcF93YWl0X2Zvcl94bWl0cihzc3ApOwo+ICAJX19zc3BfdHJhbnNtaXRfY2hh
cihzc3AsIGNoKTsKPiArCj4gKwlzc3AtPmNvbnNvbGVfbGluZV9lbmRlZCA9IChjaCA9PSAnXG4n
KTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgc2lmaXZlX3NlcmlhbF9kZXZpY2VfbG9jayhzdHJ1
Y3QgY29uc29sZSAqY28sIHVuc2lnbmVkIGxvbmcgKmZsYWdzKQo+ICt7Cj4gKwlzdHJ1Y3QgdWFy
dF9wb3J0ICp1cCA9ICZzaWZpdmVfc2VyaWFsX2NvbnNvbGVfcG9ydHNbY28tPmluZGV4XS0+cG9y
dDsKPiArCj4gKwlyZXR1cm4gX191YXJ0X3BvcnRfbG9ja19pcnFzYXZlKHVwLCBmbGFncyk7Cgp0
aGlzIGRvZXMgbG9vayBvZGQuIEEgcmV0dXJuIHN0YXRlbWVudCBpbiBhIHJldHVybi12b2lkIGZ1
bmN0aW9uLiBUaGUKaW14IGRyaXZlciBzdGFydGVkIGl04oCmCgo+ICt9Cj4gKwo+ICtzdGF0aWMg
dm9pZCBzaWZpdmVfc2VyaWFsX2RldmljZV91bmxvY2soc3RydWN0IGNvbnNvbGUgKmNvLCB1bnNp
Z25lZCBsb25nIGZsYWdzKQo+ICt7Cj4gKwlzdHJ1Y3QgdWFydF9wb3J0ICp1cCA9ICZzaWZpdmVf
c2VyaWFsX2NvbnNvbGVfcG9ydHNbY28tPmluZGV4XS0+cG9ydDsKPiArCj4gKwlyZXR1cm4gX191
YXJ0X3BvcnRfdW5sb2NrX2lycXJlc3RvcmUodXAsIGZsYWdzKTsKPiAgfQoKU2ViYXN0aWFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
