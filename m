Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F25CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 10:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=np8gDR7PYAs1O9F4iuhDOBTZDHvm/l0YRUEcL3E6zr8=; b=xCwnR0joTKClgsQACwJcDepYB0
	4KEk9iwvqQgsQt3Ap9f6zFR7fBIv9gbO2EmZQ/RQCSiaeMJzn7ijW8sRumGFKicxp6crNGTtC0nz1
	9E1KeqzS+a6x36O0C/+wqT77uDKza6TEiMMpsOSdteIEckJlI4G3V1ImvRHKHhz82wrwUpFykDpk5
	Zyrzjaq3TW5y9yT/J2/q9SjxrVtONDBuiyYGZ1NKdXZrxObZ+/bw3PaW0dKWLFATSXl6uwTDBKOhD
	j+o5arMACuOZaj9eLAKy0DHWuOXkTpgK9YfVy6x68dne1Xz9CBUjH9b2pQOovS5a3hhJ5urBFgszF
	bGUoExNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3yl-00ESiv-2R;
	Wed, 18 Oct 2023 10:40:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3yj-00ESiU-0q
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 10:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94C456176E;
	Wed, 18 Oct 2023 10:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD70C433C7;
	Wed, 18 Oct 2023 10:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697625640;
	bh=6l2WAUtlA/ULfa6NCxDUETqJdzJBr+uJX9Jc00RLa6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/C5LuA/3W86f45UzFmRsSluYAyI+NSFtCRiONkE73zYopAHjvTcxWK67TNxMxVq3
	 au1QLL4hxTbPD9lARsdyXNcs4uN0xRqYXK2ykPlRFpPtffcxvBljAJE9XZj7JrqNyz
	 In+MytDdk+07dsr61GI0PyIlcK1rihDofRTlA3Gc4Q0xfYm4K7eidg/E1Ko62tRvfg
	 En9zIAweZyweybmuTdSSKgeiKmwcIGKp+5rSSuVQzG9cxQt413w1xY04lJfwnbbI7Y
	 k7D7lZ4mY2gfFpRRFGxZc4WlfDhO+LXic3sQzeMJW7j3nt2BvcCZnng2AbBlkP0bM4
	 HDVGmh1ZoB+ow==
Date: Wed, 18 Oct 2023 11:40:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v8 05/22] PCI: microchip: Rename two PCIe data structures
Message-ID: <20231018-secret-tightrope-818ef4ffd2b7@spud>
References: <20231011110514.107528-1-minda.chen@starfivetech.com>
 <20231011110514.107528-6-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231011110514.107528-6-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_034041_344218_1D8F7693 
X-CRM114-Status: UNSURE (   5.67  )
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
Content-Type: multipart/mixed; boundary="===============3573294971620270084=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3573294971620270084==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hDtbUqOVfdHu31+w"
Content-Disposition: inline


--hDtbUqOVfdHu31+w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--hDtbUqOVfdHu31+w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS+2IgAKCRB4tDGHoIJi
0mowAQDAMLOnsRviLr4bHPlvbZB4oFttuKiB+rGTUeGDfrjp3gD/X/YaDWfTmR6B
zMS6AwCbC9ZxUmq46s34IQx6IlfBng4=
=mxSE
-----END PGP SIGNATURE-----

--hDtbUqOVfdHu31+w--


--===============3573294971620270084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3573294971620270084==--

