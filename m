Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D570FCAC5AE
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcNLKZh86Nc351+SxOff9nIaMlvoGTUB7kRbjc2qlIg=; b=EjF+mGD7SbY01n332hJXHDkXb6
	2sXCtMrCxLdGL/ZQUY+gU9gFDZ3fuQye0RH7PCzWqgtcBEAyZE8kn9q/k87x210VTgXHjXLySUyTU
	w5jYiwbDofCX1zw70HbSBAp97xCAK8LXHlwwbItiXpV3qB3MC8oPux7iTy5j9v9dAAjDWyZsYBvoi
	RCqEAjP15EBeeO5AMn4oaLIfXn/ItZ//ri5JoKVSjuoOrwKEArnKfXJnTlWU/CIFknoU7GuU+Ljz+
	SSNZM1DCpEYcuxFzeJZDRbISy1QTDXh8ZMRU3+6bExarPex5wrUBcIMUQ6iIrtuenqNkrf1a1xCnF
	LsY2aodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Ly-0000000EcYa-28bN;
	Tue, 23 Sep 2025 19:07:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18Lw-0000000EcY3-1vXR
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:07:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25EB743BAF;
	Tue, 23 Sep 2025 19:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A52C4CEF7;
	Tue, 23 Sep 2025 19:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758654424;
	bh=A5KuCxvXzisCMZQ6ZLL6eW8r5jlhUbt8FDx4TRI3YOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZsEq/SfeWwVHc+goEzZ8oxCNFzrW/53fa1JMhKWMj9ARS5b+EyVsnHhBV8F7Coyj
	 q+rlcp+sBoHLj8w95I2BPYOzXV1S10NkyrTjiehzxdzwTz1X116/IlZxNMYU4c+u9V
	 Ib8OBwpE4GO+6R7Ltg8687ZMgEkJgAKPigBQmFXe1KrJBCWLQIU+QIYEeACugDxME7
	 OJ/zebogv2iQckWbW7JGGuP+nZxAeIXMIogeFjvkyLzcM6a5ITr2nhkpXGaoFq2wbF
	 6hM70RO8EcJpbGRuQVPVlWkOnfBybzgPqQ/GPd+qWF2V2Pl+qPvMqpH9+gLOWzwvi2
	 QEQVP0qiLBaRg==
Date: Tue, 23 Sep 2025 20:06:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 07/11] riscv: Add Anlogic SoC famly Kconfig support
Message-ID: <20250923-culpable-unifier-735865b6e6db@spud>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250922-dr1v90-basic-dt-v2-7-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250922-dr1v90-basic-dt-v2-7-64d28500cb37@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_120704_511721_89434138 
X-CRM114-Status: UNSURE (   6.49  )
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
Content-Type: multipart/mixed; boundary="===============0913479051481992154=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0913479051481992154==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rgTIzb98iU3E7UwD"
Content-Disposition: inline


--rgTIzb98iU3E7UwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rgTIzb98iU3E7UwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLv0gAKCRB4tDGHoIJi
0rahAQDIa7iQcHkcobvPkRUM+vqUfxfP+uo/OOKYSvUNPq7FNAEA1s6ZHkmeTn1R
yIP1l7ue+9aXtFr/XMwe7K+F4b0QxQ8=
=Mycz
-----END PGP SIGNATURE-----

--rgTIzb98iU3E7UwD--


--===============0913479051481992154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0913479051481992154==--

