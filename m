Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EEAC636D3
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvVWZCY+UalDAIKCVmLmbUBUUO88/sYCkGrEj/7FuEw=; b=0OSVgJBI/Oqmd1E6RZMvt8MWSy
	2reLuZVHoJSE57UBYOy6AMH/cR6hJ7UEHwvpwP2KNVEawptCYvdrVBE/zYWC6WPGkNxWmmf3NArv9
	dT3w2FQXWUpIGMjB2lfMN8iozFSVdo2P7iwSbBMH5rUKh5p+dP7iiZlghKQAXpLnFsvx73I6ha9GQ
	/MV4FmC+fSRdzOBkohAH99ePJb7b+Yvmtg98woMk8DMeIOeX1Gjwz5/eMyllgDYsVJRmZuMHKi+tD
	CEChjNQqJi7o+RHeAzWYiY8RUc4RaXtPUOw6vZU0hAty7Y3/jC/z/DF2kU0I0Cq/4yJx4kUUyIWur
	12QC8ImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRDyi-00BeXR-3N; Sun, 12 Feb 2023 15:09:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRDyf-00BeVU-AT
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 15:09:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 73442B80AB5;
	Sun, 12 Feb 2023 15:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A24C433D2;
	Sun, 12 Feb 2023 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676214546;
	bh=Jv5s9BYTm0CiAwaoo6yTi+7p0Sq+M8TtW0BR2+nGXj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gA7jsqsOGweKsTHdwGhUSiKOVU6CMGjjrUazMTHGzZAVNizP5M3n7dPekMpvJGyFd
	 hlEetqB/OxPTfMYe0PhfwzoDRU50EVaX0hKynTepPl7A7u6fZnb+BYqBjxIWs2AjVY
	 kSFOfZ47j3tQTYcX9NasMMRv9KhDt4mg35EkN30sY6eZAB+UD445fAI97T3DjcOdk/
	 U/A5YCtC9uUMcEA14RcW9bB7b9GeRoz57asdAAw2S55JCsZcfkN5E4P9pAzaOEdFLY
	 XOuvi7dAtk9Z0LE1vSfuFiZfh4IvNQ03NKs5CWWVOGs5Bbzt8gOLRTUoF3bX99jKrs
	 Upa6hwk5Q6LlA==
Date: Sun, 12 Feb 2023 15:09:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: Fix alternatives issues on for-next
Message-ID: <Y+kBDQARCqIucrWi@spud>
References: <20230212021534.59121-1-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20230212021534.59121-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_070917_553652_7604AFFC 
X-CRM114-Status: GOOD (  10.88  )
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
Content-Type: multipart/mixed; boundary="===============5773511939596106286=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5773511939596106286==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4e/rMjy/0rNyLepq"
Content-Disposition: inline


--4e/rMjy/0rNyLepq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Samuel,

On Sat, Feb 11, 2023 at 08:15:31PM -0600, Samuel Holland wrote:
> Several people have reported that D1 fails to boot on linux-next.
> Patch 1 fixes a bug where early alternative patching used the wrong
> address. Patch 2 fixes a separate issue where the Zbb alternatives
> are incorrectly applied based on the 'C' extension instead of Zbb.

On Icicle, Nezha & VisionFive 2:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

I was really curious why my CI didn't catch this, but I think boot
on Icicle wasn't broken as the toolchains pre-date Zbb and therefore it
isn't even compiled in.
And the VisionFive 2 doesn't care as it has Zbb.

Thanks for the fixes :)
Conor.


--4e/rMjy/0rNyLepq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+kA/QAKCRB4tDGHoIJi
0t1YAQCCqBxh12UJYWn/YAcF7Ohr8omkhzgR75R1JQ/4Isj9ewEAmWLLN7v+hRWU
+gfOHdDANwboZ4YWyRwhCG2ZutjDlA0=
=3PTq
-----END PGP SIGNATURE-----

--4e/rMjy/0rNyLepq--


--===============5773511939596106286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5773511939596106286==--

