Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB1DCF45CF
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 21:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpXqRhK+4xA9KFuCHzEctWMfhWUhB3oXVJxDvJFq8rg=; b=LmpRe8H1J0oBh2Xpk/sgxikAqW
	bzQJaV3XLajOHhkpV6K6/YjBuvqDQANX8NrR4Ed+LhTy6Md60ZZyoUog1nGxaBWgAcsJdFY83bSq7
	T2OhKqQG0CD17mFKBfDg9veqTV/a0/1eD4Agoji7DAVYWyxMDMAto06z6Gvv9UcNCwkFJSAQP3VLb
	g/cSKiVsMG6ycbbIwn1GYwP44IyU2fHI0k1FVQz87dDWcKqlGDWCIJEaUQzCQ5w9L0k7GuaghqKi2
	Ez4W50pnZpfwRf5kz30Yui9oQ7JK2qq1MFhzgRx8OZDQiF+jiLCRGTnxzvLZstWJwcztDQBJy97BY
	OPiXZs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPd9-00000006Drt-1XfV;
	Mon, 12 Jan 2026 21:39:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPd7-00000006Dr9-06BD
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 21:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32079401AE;
	Mon, 12 Jan 2026 21:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69929C116D0;
	Mon, 12 Jan 2026 21:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768253956;
	bh=FWT3DFQ17PQuQNbf8lbPWQJloV82WeIIgcbUlhAjsg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juxH6ompWuZeMkJ77UnGSdBIltEPBSc+yJ5kAdENbdFosLqW2lC2vQgsIeATmSeQ7
	 cvUyKea6+EfFWMnwIU28WIyNCMdN5T+hK2/OYJeQAudCNdzwJriCGNUgsnHZ55EaB7
	 AhUOFn2YRbwdr1vv+DrNdjwLaaCkcOuYjmrDQcHp4mWiH3VB7zT3yTJWW8kHU0LaUD
	 6I7EPK6SiN5lOnwkfOKag+MrnalmXO341xWD93ih6tYhsnioBWoRBQtUYJJIMJ9mb8
	 Jr56Ld5AK0t5hmxSMZpVhMWbYf/k7ximjsXZ3e/VSODRp5nb2ey2VwAMFZ5Cdz325k
	 eYsb0fVtV5k5Q==
Date: Mon, 12 Jan 2026 21:39:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 08/11] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
Message-ID: <20260112-diaphragm-verbose-142d6a60d33b@spud>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-8-d492f3a30ffa@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260110-k3-basic-dt-v4-8-d492f3a30ffa@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_133917_085449_4788932C 
X-CRM114-Status: UNSURE (   6.57  )
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
Content-Type: multipart/mixed; boundary="===============5327925506426591939=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5327925506426591939==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+vzLOfp326l2Yqre"
Content-Disposition: inline


--+vzLOfp326l2Yqre
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+vzLOfp326l2Yqre
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWVp/QAKCRB4tDGHoIJi
0gvQAP0TUGTl1CYn4JsYoUUXRTUGAJN3oi7YgYIzDHYy8Bld4QEAuy3WfklDTJeL
3AbHkMbLmB4OPplmtLOqGFoyUsmU5QE=
=hgdS
-----END PGP SIGNATURE-----

--+vzLOfp326l2Yqre--


--===============5327925506426591939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5327925506426591939==--

