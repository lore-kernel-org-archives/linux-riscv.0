Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525B9C3ABCB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 18:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OU1XfQMLwQk/NCASQhx+Eely3tcRGTzuM1CCt18nKHo=; b=v8M7FhgGWk6LQX2uvreII46nrf
	gsQYAHhmmzkqk/615DZGcKrPyB9240x6Gkgix6uFIULEK15Vlltz7QyzuNl6mn8TjQg9Z2uxoBSTH
	vhTiCQnulIUhdkm88jvdNEukufd/fwHcMP0YBZSjc/oJnILWO06k+c2P3QQaudjk5eY5I2yx05Oo0
	CwadRnWkgP4Z5+KBUrVARKM8CxfVXCK47g0X3HWfpUltuI+2gtZiRDzVzLGHKPncyzAgh4ZfCegRS
	Iovm7kxPyMsIcwSzNutQapzvtNPn2aaSXtZv+9N5z7kDM/a0rcNn8lsmcCWxoIsqf9LEbYxa6Korp
	7NZ0sXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqGuK-00000004jOI-27SJ;
	Mon, 16 Sep 2024 18:57:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqGuI-00000004jNi-14a3
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 18:57:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C194A42885;
	Mon, 16 Sep 2024 18:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619BFC4CEC4;
	Mon, 16 Sep 2024 18:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726513024;
	bh=2rOpEhNpvCP5tv41uT2H58Pziu7pmFrgPvj3jAcIgk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYjquCjVo93Cjg6pRa3FlOisSx9MJ0vXCu4xMq2Xjz4aidkOJMUNj+MnONJfY8OLP
	 7aOsfYtBLdwKewXDfHgrowYJe2tuR/BgBKovwDNM7AEMfIx1n/eW0BPKaqfaXCEztm
	 6frSYxvTmE7M70IH/+kpaw4Kc5GrGDjOH8AGqTb+F+vdcO1KAHBsqQcnoGfHBTyMDg
	 lTMiQKecGCgTJGbUi/FX4GXOHoVZ7Cf0Fq6nPUOSd8yhBT+oGBA8h8qT/UAxAA+rxM
	 NTITXtsr6HwaVyrryQY59zZmbjucqRJGzixpHDF0y0Q7EFaB5tZfp4rCnTp7iJCSTO
	 Fm0LLPVS95KnA==
Date: Mon, 16 Sep 2024 19:56:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 14/14] riscv: Add ghostwrite vulnerability
Message-ID: <20240916-profanity-superjet-33a08a8b0b3f@spud>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
 <20240911-xtheadvector-v10-14-8d3930091246@rivosinc.com>
 <20240916-pretext-freehand-20dca1376cd4@spud>
 <Zuh8dLsA50IHXymz@ghost>
MIME-Version: 1.0
In-Reply-To: <Zuh8dLsA50IHXymz@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_115706_381203_6E98301B 
X-CRM114-Status: GOOD (  11.07  )
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
Content-Type: multipart/mixed; boundary="===============4463290348119730444=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4463290348119730444==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1W3qJ42zpxTLHb35"
Content-Disposition: inline


--1W3qJ42zpxTLHb35
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2024 at 11:44:04AM -0700, Charlie Jenkins wrote:
> I figured that since T-Head didn't feel it was
> valuable to change the archid/implid between cores that Linux shouldn't
> go out of its way to fix the granularity issue.

I mean, when you put it like that, I'm not particularly inclined to
disagree...

--1W3qJ42zpxTLHb35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuh/egAKCRB4tDGHoIJi
0m9ZAP4p4x2mD8mK/6PbASnwkCkRX6uLXgKlb3Og6pl+CuOYXQD+Pot5fkAszZBn
jOtHr1hp7qBYQvOX0qqA+aF3UF/INAc=
=rRd0
-----END PGP SIGNATURE-----

--1W3qJ42zpxTLHb35--


--===============4463290348119730444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4463290348119730444==--

