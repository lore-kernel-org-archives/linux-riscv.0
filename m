Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6FD606A327
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1SAZ4o7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNu0g4i1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5jr1PcAfA6x4hTvMwsR0GZxsQJNWpQ64y0w8XqtP20c=; b=Y1SAZ4o7NnIs26VYhamQUzmS9e
	51KgLT38SuHYJcEb691gYiZyWLiGDR337V3gnV45cJKrRGYmUytCyBvsdYokml08ZV2uIQpLS4DEw
	n/A3zUbRwg1lmmKQziLzfX/eXcPw+03FLynJpG1SWodkeZLaSYzcH4t9fVgF7J0JsO4zStC4kCF/t
	Bj0s6qMQE3cDVTOTaAsIJaW4v8a7Q+81ejHOxB9Fp++WpHqkd8aNhsqdY0VJjZBgzj103bDLeHIwj
	WDwQekho4N/sX03LgDKZzQWxMVDaFBr2lZsgRbyGCnwCIZ61FHAtNfHgED46kulXy2k87CzV8hKg4
	hKivIXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxwd-0000000080x-2fkt;
	Mon, 02 Nov 2026 19:43:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxwc-0000000080g-38SX
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 19:43:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C785437A8;
	Mon,  2 Nov 2026 19:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC8F1F00A16;
	Mon,  2 Nov 2026 19:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648630;
	bh=bNXMc6Fqp3PDxjL/dRqblzNk3YcAk9DQxRLdcWrTbog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hNu0g4i14OLJCP3bifErYOhzW0NxuOhO1LFKwxBqnlctLn49ps/UMYD5U3l1eXnzv
	 Y5bRkfu+5B9i4wyBWeYYq7mU32DQlxlRc3UHOhrAgPnGukF6f73X894GUXOCU6EC+2
	 LgXy8g6Ho6elBM2HtqPHCeIWVISQYXn7tFdTlD0JlkPzpGdV4c+UiMgPHYlaoKpTXw
	 3TjIFE7Uj97v6Oybknj3DK0vLed6wrMRcDeALXsvOkme2DKlJa7qvoHGhCeeUPvFtr
	 /hhIAqqcq+tO2Z+1oxJvGx5ivVcIqWA257941QkxehNOqhVQL78CtbAvaLRCm/tRpw
	 19CCFP1aR+Xyg==
Date: Mon, 2 Nov 2026 19:43:45 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: timer: add the FU740 CLINT
Message-ID: <20261102-battery-patience-0c6d810c33be@spud>
References: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
 <20261101-b4-sifive-fu740-clint-v1-1-b4821199a733@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261101-b4-sifive-fu740-clint-v1-1-b4821199a733@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6253696178594103383=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6253696178594103383==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RC9Cs/46Lsy1/De1"
Content-Disposition: inline

--RC9Cs/46Lsy1/De1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--RC9Cs/46Lsy1/De1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujn8QAKCRB4tDGHoIJi
0hLLAP9M24vz8ap4cClkIgkJN4frJuXgVA8Fg5ec95KS4e33/wEApywaPJCZO3Q+
UjQJhFVsS1X96YEbVNVFD1l9MsCfIAA=
=712p
-----END PGP SIGNATURE-----

--RC9Cs/46Lsy1/De1--


--===============6253696178594103383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6253696178594103383==--

