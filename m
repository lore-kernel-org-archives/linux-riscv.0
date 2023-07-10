Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F197EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 22:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1ZTuil/DgXeaC3NEyrlxmcYjOM8+UKW8hkuZkzOhvM=; b=Rhsy9SMCur8puEoEfb2LkKS+mu
	rz4r1S4nM6Sm0GEqgcH1RPWJKeyi6DrdoT/ORnylweG48HbNLMzCteXRy8x804TtP46G+WuhkR7BX
	mpDRUWV5QMrYQJEcTLMac3lRj7GVGctqf3M8pT3ymGMqvivQ541XGT1Vzfn3TP9WijJnQ+WhQlo4U
	OzzgrOar2tGWR/V+Sfh1CbfmDZhuy9BBDjp03qQpkO1TIFremGSKoLrMChBK91Z8RJkWoaImEnuB2
	J4u8wbt2qLoQ5k+rTI90LOcKv106kEMNRdMn2XtDxuSQj5ad2yf4nZgtlpFMONkP7TAUMu9W9h+xP
	TxmHXPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIzXZ-00CsYI-22;
	Mon, 10 Jul 2023 22:39:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIzXX-00CsXv-0o
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 22:39:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF9646122E;
	Mon, 10 Jul 2023 22:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9BEC433C8;
	Mon, 10 Jul 2023 22:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689028769;
	bh=O/CW9tIuzx26NQX0JvkfDKa65lUbxxeZWmHKJIv1YGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsHmKbEA1cwBwXVQm/AJFbzBTfcCW4W9w+qzNOubZKBlyJvvwIAnjWt1Du7gUXOpz
	 5DlNeiSw3lmEGcN+VmbWN7SGkRpkT1MgKkqKFvEx5fImdLieCpjibUeYV044c8/aJJ
	 Woi3xsyXyiDyYIlrwES5oMhrGuX7Agtvy2xjCPcTHnJD+sbbJbn9YAjvvJMzPPfTNc
	 QE6GHDUY5n16HqI4vP/1hf7fSvsGK4MngIfn41UxZA0xJnHtgHKdc0fhBc5eFu9gC2
	 uxSi8dP0h8csRKux8QeYA/hp8H2Gmn1pv4E3GsKOP51xxWzYbeZzszODxTSA2peq+I
	 YXCWbXmu4LFlw==
Date: Mon, 10 Jul 2023 23:39:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v3] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230710-frown-boogieman-b36445c1b5a7@spud>
References: <20230710192413.2089085-1-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230710192413.2089085-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_153931_351222_BF6B6BAA 
X-CRM114-Status: UNSURE (   8.65  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============4901988188787593719=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4901988188787593719==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D7ZcV3Z0Ccixd94M"
Content-Disposition: inline


--D7ZcV3Z0Ccixd94M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 12:24:13PM -0700, Evan Green wrote:
> +"isa" vs "hart isa" lines in /proc/cpuinfo
> +-----------------------------------------

This underline is too short :/

--D7ZcV3Z0Ccixd94M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKyInAAKCRB4tDGHoIJi
0rEwAQCYddZNxdTtB8VIuBY8H5RzTdEtz8EP5J62N/KTxodlPQD/UOlv4155wrff
VqMQUpTDU8K8uut/ONPsUSWLS7LDvgE=
=w2Wn
-----END PGP SIGNATURE-----

--D7ZcV3Z0Ccixd94M--


--===============4901988188787593719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4901988188787593719==--

