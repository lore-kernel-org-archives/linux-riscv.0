Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1447CCD5BB4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 16:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKuEV1V9LZmkksVTljAMZgPFrLLn5llx2cdFiHj89Ig=; b=TBFHt7k2Nu9Ykuj6T38mjAP514
	gudQUkbid++QnxR7pyJLOnvXoMivcG8O2OJ+BcEwn8dJ46910eQuq+W5eX9RCt4T0DE2B09cU93Z8
	A5ENQjB3X483IxFStMnJVQ5cNFqTIuB28oc3MdCjcdOSXu16e8WeuiTVWDLUV2uAFGK8a7/LrrqAU
	ALeTtnMNg1ExHu7iSPfPutCdUfZFlVHX+Ahr/yjUdTS4+eiLGtj3CHHJ5db8WSz0amzRpOgNYQ6hb
	YOWq2lIL9RYwdSo9d5NoX3hCYOgGhCfncRZgyk2IoqrNFS9oWACmE2HqwMbeIgGN+xBMmafBcQ7Ah
	9x3shGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTl-0000000BNxY-1tBy;
	Fri, 22 May 2026 16:12:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTg-0000000BNrg-1CHi
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 16:12:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8534B42BAA;
	Fri, 22 May 2026 16:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218241F00A3F;
	Fri, 22 May 2026 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779466319;
	bh=2U5XU9h6HYcXCdG4wEmURLpHZMMYjCkqLOCkJD6b5Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fA93VpCPmy+jWUvyevRGqWdtiIeTGi7HFk9lql29Ms9RUwm0t0Alp58nr/myQB+ZM
	 eOmaYytmMdpk+23mwYjnTEtVoH5K0ODmzWwNDdf8QtKUiAYR1kFKU2tLTyW82pFN7w
	 w9ciZb6K9wlrC+drD9a9umF1kuWbq4RCdhXYPM1FB9MinqnYvBUwD3gMwm14J1rZU+
	 P5qSxWJPTp+dzGXupvcioJxP/2FRBve10aSZdBMbEdNuoV1smd0rNEYtcZXVa2m1w3
	 9lLYadMeUtVuUfIZP009hb0Dbk8TH4STSRjX0PS+YdPYYKCZ3c12OAUVjILDhlKSJw
	 ndLx3E0oDaCTg==
Date: Fri, 22 May 2026 17:11:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
	Paolo Abeni <pabeni@redhat.com>, Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6
 compatible
Message-ID: <20260522-endpoint-refueling-892a742e3251@spud>
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
 <20260522-bpi-cm6-v1-1-707ef1917a30@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20260522-bpi-cm6-v1-1-707ef1917a30@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091201_367251_A556E542 
X-CRM114-Status: UNSURE (   5.85  )
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
Content-Type: multipart/mixed; boundary="===============6250361375261635386=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6250361375261635386==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GnUjvP1EuQAp69tA"
Content-Disposition: inline


--GnUjvP1EuQAp69tA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--GnUjvP1EuQAp69tA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahCASQAKCRB4tDGHoIJi
0p+yAP0d8Sxf6GoYo9bB7UbBSI7sa9vU7FdmIgQHUBrpqHLJ4QEA+MIg1uouFWTU
Qi9GvV5bXvR2VMKO3dJbHBBql3EM+gk=
=aTs1
-----END PGP SIGNATURE-----

--GnUjvP1EuQAp69tA--


--===============6250361375261635386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6250361375261635386==--

