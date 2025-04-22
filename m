Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90785C369CB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ee2wr6SxKqABBVnTttBdvSrkr+hm92b+47G6FClaCRg=; b=TjhELhikHwVBv+04kWIy7DDI+u
	iLkxbkCc1poR5+WcKkGeFhS9ksbtEdg/XIe7nahMmbLlt3iL8L/EOByfB5hLuzI9n+Cf5MHIQyqNC
	09K3GS3apFxpFPMROgtnEHYgbq/Z+KehG7YESL3y9Bt0gfhTjaJmGPI/jIXYZNnuKdoI9vs6zij4R
	FtkEEIAz4UN/deyLQ0u2GbB245ZLIVhoMu18f0TH4bU/ndTgZJcnLwG+71luP/Qs/lErlzpne5g4h
	UANyU5qAWUs+G1IHxIThybtkAvMeq/tSc+vT3qy3041AWcozCiZPYIrnkbL9AAJV9KD8OE3sH0M+e
	d8lsgWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GgU-00000007wtf-3oTp;
	Tue, 22 Apr 2025 16:41:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FOI-00000007gHx-3ORm
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 15:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B8C85C3E39;
	Tue, 22 Apr 2025 15:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B8DC4CEE9;
	Tue, 22 Apr 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335109;
	bh=WSMzleGFy5SmEw/j4q9eyuXjRU6ZVJnLQEIuew9yvVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWBQ/H/2TVFvh3OZ/Tt93sOb71VNku4po0HT1VsmH436FwKK6EliKkY3dzmRtHT0C
	 dYvjZBMqmQpXXI6SE/44S8O2bl7XNZ/xg4cdnqK/zUpG6dhOecOCaeI+ImDp2jzEst
	 aSEZs0N0wByyhsO/as/LKs7V9mi6qneEfFWXwoNkE0SMyI66/PmRcE7JghcHVQg2Ww
	 3LJ1Mm/Nrm/sGNdFQtUFf0z9Wq5RbsXW69OKU1BzTe2qjobyOAdffcxmjmsYiOLfyE
	 SdnlohYB4zqRKQTa6pfCZ+ChEbOVNA6gj01lgeDHY4bprH395RXB/sqCHaJrNyVYYd
	 v6FOY3VqvP+mg==
Date: Tue, 22 Apr 2025 16:18:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Cyan Yang <cyan.yang@sifive.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA
 extension description
Message-ID: <20250422-dictate-parade-3ad965f6c9c6@spud>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
 <20250418053239.4351-10-cyan.yang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20250418053239.4351-10-cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_081830_901630_921BC2DB 
X-CRM114-Status: UNSURE (   7.54  )
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
Content-Type: multipart/mixed; boundary="===============3300031396041917236=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3300031396041917236==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PSo2xE1X0sDiDPUV"
Content-Disposition: inline


--PSo2xE1X0sDiDPUV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 01:32:36PM +0800, Cyan Yang wrote:
> Add "xsfvfwmaccqqq" ISA extension which is provided by SiFive for
> matrix multiply accumulate instructions support.
>=20
> Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PSo2xE1X0sDiDPUV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAezQAAKCRB4tDGHoIJi
0lVhAQC6EzX10joPYVO8GsoAVGpEsRXt1kEptH5AAgI6JS9alwD/VqeWssBvDGY6
G0Cp3nBek9TbCmYL+hYS2935WUSTbwA=
=QwvL
-----END PGP SIGNATURE-----

--PSo2xE1X0sDiDPUV--


--===============3300031396041917236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3300031396041917236==--

