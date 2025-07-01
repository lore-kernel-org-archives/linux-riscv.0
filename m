Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D929C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkCsQm+NaoDBS0QOsrxFOE+TC4AFnSQnXTUucOCNZo4=; b=HwBCfe3GaoKsIc
	/+Bj+vcslAewW6cF2DEB+95qXd4AmcDkk/hP+QolAMLev6A061jSc3Ks8UDDE9JcdZSWBa6sacxtQ
	fbBYME7Eml69lGaMQR5UjPiAfN7UVox6VuFPRfV0eVr8YmAj5pmNblo9FwOMaChc4wD/BzsHCMaNU
	REqwESBp4bi05xEOB4BEIkpQete5anjfik43JQwbSthGLITLguTmXgFAEeAYWKQam4aYdlTeG0mo9
	HXKiSdn1l3GhKw4Upn+vonyjaUMg+gLpoEW9TFimoQbpvr0JbI/b4fXWTj6sskTVpfHN8lL97ctUt
	Y2b+/toqSJz/wKrMBXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWiy-00000004TSc-01EK;
	Tue, 01 Jul 2025 08:52:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWA9-00000004NzO-16iA
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:16:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 103806114D;
	Tue,  1 Jul 2025 08:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10349C4CEEB;
	Tue,  1 Jul 2025 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357778;
	bh=lkyQWlDYZofRSdo3cjmJVwtr+h8AbrUJVHwsg1OHwAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhASyXBSp1TfbTVVt9FzAonfgB5IzVQg25SEFAEiWqtr24f8TCOMdbHdPDore/c+c
	 BSlhDV0j1Y+DuRr7e2rDUhv7NRmdZd4awvExo6UVAZyZkEQuLQCPdRfdSqaRbM/cnB
	 MeE/FK/cZvXYRUM9m4u3qZ/lxDySrM3wdS97caPomlAmmWg+kotBptY9W7OTj4h6bQ
	 m1wTjrml48N/8bJh++SLxzDCsKrJ9V+9aVTs8LLJEe3iQa6Ejb8M0x3i1GHuDr8bLq
	 Y/gOPtkpaC49ptHNe9wriifPqwopfTYVKozbsI6M6c3CjOca7exr0plX8bzyCasItT
	 6cRwoOS8EvGHQ==
Date: Tue, 1 Jul 2025 10:16:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel.holland@sifive.com>, Richard Cochran <richardcochran@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Cyrille Pitchen <cyrille.pitchen@atmel.com>, Harini Katakam <harini.katakam@xilinx.com>, 
	Rafal Ozieblo <rafalo@cadence.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>, 
	Jeff Garzik <jeff@garzik.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next v2 01/18] dt-bindings: net: cdns,macb: sort
 compatibles
Message-ID: <20250701-archetypal-teal-of-virtuosity-9a9e9b@krzk-bin>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-1-ff8207d0bb77@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250627-macb-v2-1-ff8207d0bb77@bootlin.com>
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgMTE6MDg6NDdBTSArMDIwMCwgVGjDqW8gTGVicnVuIHdy
b3RlOgo+IENvbXBhdGlibGVzIGluc2lkZSB0aGlzIGVudW0gYXJlIHNvcnRlZC1pc2guIE1ha2Ug
aXQgc29ydGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8dGhlby5sZWJydW5A
Ym9vdGxpbi5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvY2RucyxtYWNiLnlhbWwgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKQmVzdCByZWdhcmRzLApLcnp5c3p0
b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
