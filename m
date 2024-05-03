Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFABC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4t47+Fvt9zZfDHbn5EjTFwt5t7ITq7Z8TsYILZX9Nc=; b=PSMvD8OLjbp5VrmcNyLItYTydF
	v+6kunXJ5gJjMBSIXnXZQWthF5nSBKNN/PVUT50U8KCoT06ib7xmp/LN4R62bGG9m/Naug6T3peGB
	D/aVUJIqMqURtgAv0zk1FaIE/N48w6bhZesDapIZWD/UoBs976Dv192LTFJJ9/DD/SQasIDMD8N+n
	ZAF5ka9o3KykCmBuK84wjzz1izki7yyZRWyqg8i2clMSGRwK8CNj7pr3NihDOqN0GtZE5WC5Avxxi
	PfMsHQlDNK9IrPmI9JRJSm8rDBouEWrkO0R8MHK/CU6JBozDCDjY9BXNwujupfs/GAZ0v9BegoeNX
	HExpNM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2wgh-0000000HOMO-1ybm;
	Fri, 03 May 2024 17:27:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2wgd-0000000HOKc-3Kdj;
	Fri, 03 May 2024 17:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BC136CE18D4;
	Fri,  3 May 2024 17:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5F7C116B1;
	Fri,  3 May 2024 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714757224;
	bh=nGEZklClkgBR7BRosaj0yPV5zjkbbDrLHzYD/gw9AC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNa29oPuBF1NYMCQTctSCetUcoanK9ZORjS4DtGu0fhqFLWJAwEw8Vjk0mDOqpURA
	 DaB6H54oNzJrRCkIkr9rNN8oP3M2LOfl+kyFet3PaSBwKduWXGpB93IpvvOv024h8f
	 K6KuKUJhb4QQGSInF1f2P66NQJiIVeqmFC2XsnsNian9lFI1n99N511rTqIxQgl+Ih
	 3VO2HveLvF2W6uugRvMfyyLkxGDwoMy4GGgVNxVr6PJE2hnHX+JRijSGmAWWh3c9cD
	 PyOvWKgyYVAVAszqkO8RJds3IqPY+5EkR8RAqB/JsXKZsesSy7yg8uwyoOAdrRuwFG
	 m6kI6fHJEa1tw==
Date: Fri, 3 May 2024 18:26:58 +0100
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
Subject: Re: [PATCH v5 03/17] riscv: vector: Use vlenb from DT
Message-ID: <20240503-reviver-unify-b07f33cb6053@spud>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
 <20240502-dev-charlie-support_thead_vector_6_9-v5-3-d1b5c013a966@rivosinc.com>
 <20240503-zippy-skeletal-e5f63c9f17c1@spud>
 <ZjUbpKKobaLXhqPz@ghost>
MIME-Version: 1.0
In-Reply-To: <ZjUbpKKobaLXhqPz@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_102708_018255_B7A18A4B 
X-CRM114-Status: GOOD (  10.72  )
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
Content-Type: multipart/mixed; boundary="===============3737508011364373319=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3737508011364373319==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/UUPLeA56FpcadHp"
Content-Disposition: inline


--/UUPLeA56FpcadHp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 03, 2024 at 10:15:16AM -0700, Charlie Jenkins wrote:
> The DT is improperly
> formatted since it has heterogeneous vlenb entries and has V enabled,
> but since the user disabled V in the kernel skipping the warning is
> reasonable.

I wouldn't go as far as "improperly formatted", as if the harts really
do have differing vector lengths, it's correctly formatted. It's just
not something we support in Linux.

--/UUPLeA56FpcadHp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjUeYgAKCRB4tDGHoIJi
0k/kAQDEpgDHBn8tOwN0/14xdb9NcbMKBl4+/Ralt0/MHWhQMQEA5rEhU78uLQW6
Rb1OYeDRleOf59Xkg5uXzIq/CHsNzg0=
=xwgV
-----END PGP SIGNATURE-----

--/UUPLeA56FpcadHp--


--===============3737508011364373319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3737508011364373319==--

