Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94ADC7EE22
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 18:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrv5bqzgj9MFjsM1SHvLl1G0WH33FdIIzA6XxudyDhk=; b=knnnSgBhCInWV4mt8i9y5sXA4X
	n+3wuNK4RuWwL/np2Sr7dpKpovEc0lZVW+wfM8ZMItSSKP5lbDPGoWO62jcbGWWPSzw4E1u836XsP
	53M9sjsSU7C5CKIZF8Uu3KJXIole/FrmrQNL1Ageq6K+KIFne9ZD+1t/qQaHSUWiLtRJPKQOWMCmk
	lg4v2bzDOq6sZWetBFJoq93Lfk4E/1nLbSH+BT/jPEzxNdbZuCGCycgQcprV6Pm0qE87hSSeIcwqv
	+mo3KqN6OE3TQlbOFjIdw0plzIAG33eQ8AGg/azc5N/gVWDpKbCtz4ZDVSdNrtoiH2U8bmIn/fDKl
	6S/WGusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyGHu-0002wz-1R;
	Sun, 14 May 2023 18:17:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyGHs-0002wW-0O
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 18:17:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 600FA60C70;
	Sun, 14 May 2023 18:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A925C433EF;
	Sun, 14 May 2023 18:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684088253;
	bh=SXJLVv/HvNDzSRRKMFSxrVM4xR+cEIslWBlIbmqArow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iE6+p7ALLemY+7tmB7CNTX4o5H7iYKssz/NaNU+tfDQZQ/sorTRwd7Fbf+ZAWbuIY
	 dXyfw+odRVZoe3FUn7+m5tWtJYurYT7PZTRX9Lpz2b2GJeTLA+Po4SZoVdpRnGKoxH
	 tPsCevqXuuScEcRncjUQqQVGCTjVObKPvDWsFDFqmqE0mMDNYk8xVSl10eHoQJri9l
	 ylEqq2QbSXYc603Tegi9kKMFRZIJalHwQbvIPytXWFL5NUyTexD2csMuTSgORd+FOB
	 UE3bafqueIaM17vgICWjFjgWlt4yJoKs0Km7QA8e/TSL11xc/5KoAcut/DgmnqgxhD
	 MPhgPhkKIR6pw==
Date: Sun, 14 May 2023 19:17:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 03/10] dt-bindings: serial: add documentation for
 Bouffalolab UART Driver
Message-ID: <20230514-bust-slam-10c7b9cbe455@spud>
References: <20230514165651.2199-1-jszhang@kernel.org>
 <20230514165651.2199-4-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230514165651.2199-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_111740_226965_2231A9D9 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Type: multipart/mixed; boundary="===============0113602843111614230=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0113602843111614230==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ki4ujBbqbmYfXfWC"
Content-Disposition: inline


--Ki4ujBbqbmYfXfWC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 15, 2023 at 12:56:44AM +0800, Jisheng Zhang wrote:

> +$id: http://devicetree.org/schemas/serial/bouffalolab,uart.yaml#

$id: relative path/filename doesn't match actual path or filename
        expected: http://devicetree.org/schemas/serial/bouffalolab,bl808-uart.yaml#

Please test the bindings before submission - even dtbs_check catches
that one!
Otherwise, looks fine.

Thanks,
Conor.

--Ki4ujBbqbmYfXfWC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGEltwAKCRB4tDGHoIJi
0sJzAP4wOVsTrnPAx57F7gbDXMwebUBq2uM/cNtSEUKhxRG3hQEA1rTf27u+b4/N
rFfHcmLPetqevaLUWqT9ZTVqLimRyAA=
=QtXo
-----END PGP SIGNATURE-----

--Ki4ujBbqbmYfXfWC--


--===============0113602843111614230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0113602843111614230==--

