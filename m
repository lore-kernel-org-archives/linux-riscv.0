Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A02C5AD49
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7OO84/t0az5JFGC13GrbYMB7zkvnnNZV50IKCopUz0=; b=P0w81Kq9KKCIr6QDDP/A2/n7PI
	ytYkTE2uPd6uzIjfQ7MVn43YR5MnvpoX9L7JhNSU7sqSiBGWXVM3PLCsffTLTKPP5C7Do59TeLUQn
	Qkwvplp/jtNMDa9gwhs3rKnmcKxNeO6HOKhdKb1foHg04sd2IdkP8cBUxi9+zoMtyaNILDCmBrV4X
	3pKaRUkNCCGgdM2MBYh9IIZBve7y3k0w6tGip04ExuV+5JRArrEVx7YUNP2/t/ybriK3oYFsDT17U
	H18sYGGRdj0EtgWJuogbJNOkNFUXPUo2Mx37MPBjqMlLq3RoItWlI4jmEPDoDNPmLCqUXvkOihiuF
	ojeapGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL15G-00000000wq9-2llI;
	Fri, 30 May 2025 14:51:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL15D-00000000wpU-29FC
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 14:51:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5CE41A4F6E2;
	Fri, 30 May 2025 14:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD99C4CEE9;
	Fri, 30 May 2025 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748616702;
	bh=YUVxmlvmDsTTQBrqHZZvodbvDIfS5ELujSc15JpoURQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUv9IlhmyLZafr0OwzIxVzfFT2RlP8qNYB6ZemazQaN9wWQV3WOXA4tj9Yh6brOxr
	 28z68kK1Yhn7vq5oCAICTC+ZUw1prw2tmW9u/JceQIRWALuFpm3hFg2JlJWedHDEzf
	 TxeLUhagPvDSnVeVrQkYTx2eulerMhMmEhl6sCR+3CnQDtIYYlyx4hdMNGI16gRb2E
	 yP/5XCO9NABPGQZPnC9++ZTuJNj0uA+3n/iUYpLhPqKLhBogdDGPqWIxxczhq183Fx
	 FZcQU2/QRzUgea3gfRiHJ3YSwYjqyJlzB+p9swn2PGlOUIY32908jsC4pOXBJWEVar
	 se4n6DdOc8OIw==
Date: Fri, 30 May 2025 16:51:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/3] pwm: sophgo: add driver for SG2044
Message-ID: <el33us4hbjl2e3o4zsnbtfhjlry6bujgrdq6jdj3zq6b6yn3ao@lxmcia3ysttf>
References: <20250528101139.28702-1-looong.bin@gmail.com>
 <20250528101139.28702-4-looong.bin@gmail.com>
 <azf5lzfkegr6wt3mratxra2mlfah45dc3comtkjbrbdzf4x5xc@tlzxp7oqtcfl>
 <oo3pevzuyhrsf7t2ja7mxytaxhnthfar73iwvqxgawr5gjiudf@hbevzjog7akj>
MIME-Version: 1.0
In-Reply-To: <oo3pevzuyhrsf7t2ja7mxytaxhnthfar73iwvqxgawr5gjiudf@hbevzjog7akj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_075143_620083_17335867 
X-CRM114-Status: UNSURE (   8.01  )
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
Content-Type: multipart/mixed; boundary="===============5661369817726402864=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5661369817726402864==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j7ixwxshhas4xuxd"
Content-Disposition: inline


--j7ixwxshhas4xuxd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 3/3] pwm: sophgo: add driver for SG2044
MIME-Version: 1.0

Hello,

On Fri, May 30, 2025 at 05:48:27PM +0800, Longbin Li wrote:
> Thanks, it's ok to go.

Great, pushed out to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-nexxt

as 6.17-rc1 material with the changes mentioned earlier. If you don't
agree to a change I did there, please tell me.

Best regards
Uwe

--j7ixwxshhas4xuxd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg5xfgACgkQj4D7WH0S
/k5srAgAhbX8qLIToQ+QZkTJMqqqQcE5IHOSXM+GQUnkylpXSDwcg/fC2hEHl1+p
cXvGBd/nGPc1+Eewe2HjxG+ghQ408jregwS3QiqGqSaau7FhUU4AN1XC6GFR7QEr
WHQ+7zJ5KdT2xGAtFRjlGAPCWkhOKQPV02nn7M0GQaUI89IDgHpb9XkP9glH1qJd
KBBjD8lqI2pPBptRtCkModmgynQDQhNE/GpNegQZAkO3m0vN/NL9pTSFfs9cMHBU
Cz3OeGLF2kxooemevn8hJx8TIm669P+cmcESVBJtmUxb4h341HOdHkp/YIhG7sGF
tWqcQ3178t688NepvCjh0zlDgymu0Q==
=5Epk
-----END PGP SIGNATURE-----

--j7ixwxshhas4xuxd--


--===============5661369817726402864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5661369817726402864==--

