Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADC5C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fj5fqeL8M+wha6VIBPV9rl56uKBwcu5jA1ABdSbZKkY=; b=NOrhnWQZBUmEQHQG2BUvKUF0K6
	Im3lKmH+DZQo9Yy4XsuHas7RfVYAzq/LK6U4ya9KI0pO99yzmKax/V+o71MaAwcu2W8+qbPJUPZts
	EavjC0bKFnSk7/EMcgqDY9yMoPL21Wc3Zu6UKhmiVfucBmZVrM6Jd2igWozJA/LHzTS1meSseesml
	P1ymJ8NwPqlKEtonpp0xEkMr2qTxoPJ3a6XjWexDJSDfiXLPX8vNcVMFWkv29I6qfA39S3jJaeSGB
	fo7k3LjQGEiBeVlbjpkulEk1LV/xQGN+SRHHxWl/FlTUoWuKXw1pRsvFFtNRQDOvHrIWFiCbmTPE7
	n8fmpIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28IQ-00000009ET6-3HgB;
	Wed, 01 May 2024 11:38:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28IM-00000009EQA-0faW;
	Wed, 01 May 2024 11:38:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B9E9CE11D9;
	Wed,  1 May 2024 11:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90A0C113CC;
	Wed,  1 May 2024 11:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714563519;
	bh=/55ONdJEW2X9oAD5btDemF//yv3ORl2OA+oFizHG6JE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2BuQ5e0a9DNCCo7tCuthfljUqfNLkwUuryqnm5IHklymdW/O2lg27ffqur72AwGL
	 6lEnMwE2Zz+uQOdE9Jjz1wCVBu/gM7yXU2Gs7uXtsd0BGmi6n5fHXgnDcHZycOmwg4
	 iyHn8HcHUtsPtAoCcMT+n+/OHC1pyK83mQMJQYLlj9PnsCNoXB2aMTOjVex0Sy39aN
	 tSRyUMCcCFEyjNO8q7N6MW8Zst4EBw4LJ96OR2ASLglldzHrpwbBdZKTLZjdbnrXao
	 9wPulaWHo6iGAgJXCAg7NeUH3b0WNzk6jW0/Kg/27SYF8Vi3lrqioebfEvQ3gYRpmG
	 G7ASKIWm1GKHA==
Date: Wed, 1 May 2024 12:38:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 08/16] riscv: Convert xandespmu to use the vendor
 extension framework
Message-ID: <20240501-delay-ferret-e026ef351cf3@spud>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-8-b692f3c516ec@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-8-b692f3c516ec@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_043842_444271_9EEAE8DA 
X-CRM114-Status: UNSURE (   9.39  )
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
Content-Type: multipart/mixed; boundary="===============5467654439875055386=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5467654439875055386==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ocThCKwZewsPkwD9"
Content-Disposition: inline


--ocThCKwZewsPkwD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 26, 2024 at 02:29:22PM -0700, Charlie Jenkins wrote:
> Migrate xandespmu out of riscv_isa_ext and into a new Andes-specific
> vendor namespace.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--ocThCKwZewsPkwD9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjIpuAAKCRB4tDGHoIJi
0oyTAQCiGsBokvzqKTzrHPoRR7fnwiqQeIuvwafaOFH8XRia6QD9HWIP9f2o2O5W
1rqoWHA0c7U10muh1gRmeqbHG3IRoQI=
=shDB
-----END PGP SIGNATURE-----

--ocThCKwZewsPkwD9--


--===============5467654439875055386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5467654439875055386==--

