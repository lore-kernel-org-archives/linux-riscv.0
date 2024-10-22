Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF910D2CE05
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VzUxgA2ruvvBzMme6NVZpfPBEb/0st7XHn3+P2QW7M=; b=IibWyq1dQf7nTSPea0A2wMxcFc
	2oD58M44DlqDUomrPY1ziEt4KNUZ+4fLCZAt+WEXiZySF+/AUgXG+pqUEVZ7ydHCAqrzU4fr3wDPB
	MQggQv+w1U7EnZbf61LwGxe/Abku08PEuMJwI52eFWD5Pw1hCHnCbFxa0+07TSO190s6L91eiFZ6F
	bs8kFNUu8uSsDtIXOFMiUgZOJLcpiSy6MvVxmDWCDW+B2fMI+KXB6hNU7S59HBeyqrCfaiZ1/lTBq
	8KncRqwI31aLXNS2ORnr6883xuRkYeHo5jGDnQm1yUR8c0BfA6VDuHlKigBd/U6U4yRqY6Br5/+lO
	VJT8/jaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3IFx-0000000BZvp-1fJ8;
	Tue, 22 Oct 2024 17:01:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Hx9-0000000BVja-2tMQ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 16:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2721F5C4C65;
	Tue, 22 Oct 2024 16:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDA7C4CEC3;
	Tue, 22 Oct 2024 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729615310;
	bh=EoHMsRQGMuLx+P7zRHzX1qTnz0At3UXNDcHYzQo11LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mheeIFrWDVR6zmPu0VxTdfTU066+am26va4z7qSRWIwYCxL1Ju1pY+feu1JqItBri
	 OQjuVtqZKV0JnHWd14mLckTWO9g6x5LupHnBFWIfBSOMMKtVEp+OBKCiRVz0Ahx/tu
	 ku4+UawUcLC12gH6Qs28lUYrc0kra27LFEYX2Fwv42mqos4hZvJyiUvTE+txNrMDlH
	 /7NWRvRkWjk7/CEoyTRuyRQUjYKUvheJF+Khb+krEKvhFAsrRCkeS7/N9P+FznIJR7
	 Rzk6zGvnhXjIAuh+xWsOLWcIiOMhI2wFEBU+kJcyGX5DqrVT2jKcmz1DUBHUzOA5Q7
	 DQA0nT7UXk+zQ==
Date: Tue, 22 Oct 2024 17:41:45 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Henry Bell <dmoo_dv@protonmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: Update ethernet phy0 delay
 parameter values for Star64
Message-ID: <20241022-amusement-overreach-c5d1d7fd797b@spud>
References: <20241022061004.62812-1-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20241022061004.62812-1-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_094152_466991_19471D8C 
X-CRM114-Status: UNSURE (   9.13  )
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
Content-Type: multipart/mixed; boundary="===============0918231453386993960=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0918231453386993960==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5v1eMG7g4H4NB0I9"
Content-Disposition: inline


--5v1eMG7g4H4NB0I9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 21, 2024 at 11:09:51PM -0700, E Shattow wrote:
> Improve function of Star64 bottom network port phy0 with updated delay values.
> Initial upstream patches supporting Star64 use the same vendor board support
> package parameters known to result in an unreliable bottom network port.

Should I add:
Fixes: 2606bf583b962 ("riscv: dts: starfive: add Star64 board devicetree")
CC: stable@vger.kernel.org
?

"unreliable" sounds to me like something that is worthy of going to
fixes/stable

--5v1eMG7g4H4NB0I9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfVyQAKCRB4tDGHoIJi
0mXyAP4hE8X6wR9mN1YBx29ScBPlWDTvKS+zXqMNQTvwHnCExgEAmFDWhu4p3Ljj
9iV7Tk8QmQBu2ixOzU6EvXethK5Y3A4=
=ZbHC
-----END PGP SIGNATURE-----

--5v1eMG7g4H4NB0I9--


--===============0918231453386993960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0918231453386993960==--

