Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3C7C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nerj7nTjdLp3ldgBGsp77aPJsIQ0vztcRhO1Vcd4wnA=; b=NYyBmihbLkIW/z4QUQKYBLAP4b
	NQD+jF260lb3pYezVKX+W/tDkMOkvIf55Zhwb8uxveobAsVZNzGo21TqbABhXtnNehfsbz/+721J8
	rZCEwqQM97a0g0s1KgKyzat38XWFi8ajWLuMUYN0lAmQCpmYaA7VCCVvKurbumgPXEuQmzjnq2Z/W
	zqbIep+PG3GHHWhqemzmt4ovS0VSk5+qyasS5mBrf9fNWQeSyV9TXGhX2cykhT5qhUUbJ0bUz8v52
	AcM2whuVw7Pp20+99moeoX0X8MONtRbiGQMlxbHOxwaYppmpZrS8VPGM3pbyEaujoYuar6BkRK7TM
	0cw5ItVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqVF-00000006F1t-0cl8;
	Fri, 19 Apr 2024 15:50:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxqVA-00000006Ezd-3G9K;
	Fri, 19 Apr 2024 15:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F63161A21;
	Fri, 19 Apr 2024 15:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F03C072AA;
	Fri, 19 Apr 2024 15:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713541811;
	bh=jvlGgpkF/Oc6sdS8Ym3wS79QaEfTCeYHkiQivnn6tCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iam3SZGhTHYGjyhPIqc6jp79nf8yZ1hY2eNXix0OK8rGy89GH2t5M+qaX3NMsVTy+
	 1JsmqG9KCdZyLjnLCJa+LQtrmCUF/X+AZbv2vBiGWreXnxTLSDAEvJjTzb5rUUd33o
	 lB5gDX6Wd5EraCkOyV7N38Rs3Ke2p1nun5CjvE612FU67POYlUGPtsJdbP0B4YHQ29
	 0iwGfNudOU0ROjkbrvzCmqGauJEsew7gMU5e/eo8XbWQjLqcbyvt1UK4P6fQrkrHqv
	 VuFagmjQ8S4BcLrJCf+U4KIwAuLGhEg2XtTOLgmsata4QtDWGf0PWAt/Xb9DqTgKpJ
	 jJ/nEOBA7q7kA==
Date: Fri, 19 Apr 2024 16:50:00 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 08/12] dt-bindings: riscv: add Zcmop ISA extension
 description
Message-ID: <20240419-lumpish-synapse-db19786b15cd@spud>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-9-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240418124300.1387978-9-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_085012_885786_1A674BFA 
X-CRM114-Status: UNSURE (   8.60  )
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
Content-Type: multipart/mixed; boundary="===============3714835941236579112=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3714835941236579112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GUO42IRTVVtzYpmy"
Content-Disposition: inline


--GUO42IRTVVtzYpmy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 02:42:31PM +0200, Cl=E9ment L=E9ger wrote:
> Add description for the Zcmop (Compressed May-Be-Operations) ISA
> extension which was ratified in commit c732a4f39a4 ("Zcmop is
> ratified/1.0") of the riscv-isa-manual.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--GUO42IRTVVtzYpmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiKSqAAKCRB4tDGHoIJi
0m3+APsG28OMlzctPcsp9V+PWZH+VVar6PGgqnHMgv4RxiPxAwEA/dAxomnDRjLs
fCfTTVZKzD353yb1BT0EmnILnVijyww=
=FnpG
-----END PGP SIGNATURE-----

--GUO42IRTVVtzYpmy--


--===============3714835941236579112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3714835941236579112==--

