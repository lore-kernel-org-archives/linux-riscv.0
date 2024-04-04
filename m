Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B92CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 19:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4/3bo5Rur+OA2nTu/0vd/bX/MzDCBUjGdYZTKnWhMc=; b=vFfBPT680Lu4oA472ANwIMhj5x
	uyCK6f0uG4IO797uXZd8cCDyFWnuPqtZQUnTVzTVEYJy4aXyvwlS7zLJnjakmllt0AQbkTQ/T/qDs
	ivSUIuPqlbpKkwwdImfgAxze9mJ+Si/fzxWMiHHVxxmttx/lKzyTeTWiICsa0ps8IaFda2SGheMx0
	bBgpW288YN/LqFA0AYdtm/m1qv5NoBPkKWM89MJdDvQs/Q+mvHPn1zoz4rPbpeMu6d+Wgykiu8EEq
	VPMAmPiJYIhWwIclMP4qqtJv3LfC6qf84j+yqtx1gaQxNc0gfDkPR8J8oEKlmBtEUi47wn3t7iYs+
	A7zd4QRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSNr-00000003xo3-0ZgK;
	Thu, 04 Apr 2024 19:04:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSNo-00000003xml-00Tm
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 19:04:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EBEE60F30;
	Thu,  4 Apr 2024 19:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B1FC433C7;
	Thu,  4 Apr 2024 19:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712257458;
	bh=rNly9F2P9OdTExq18M642lONbtjeAMZI50NvvyYjTA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rrHS/o8F+rLpX2ZKpX8B9hjkRFhechDLI6DI0vt9JNZg4IFEN2Yk75PF5PL8NnAgv
	 g01Ak48kRGFEk0xR/32kl/QzD5QXbYMXXqwJ/TBW9J/87Gkldb5FVAGhvbNDEcS168
	 v6TURXoHAavMjrBtDBzvm+kddqqpOhtZFzjVnCyS8WIKeCYcgy6j/zdX69zjWqhHTB
	 BsYqDCpZhzhLckh7DHaKuZ/M0jFxzpaq0ukApjVqDN+FpkdEpk7CXa9WD4G7PWNwSG
	 iUNJVR0y4ntzYgDmeidcdI2GYlbiOI4BjQnODSmARl+JY8eOSn64ri2mV0mkayTG1I
	 lPSaQqjXu2OSQ==
Date: Thu, 4 Apr 2024 20:04:00 +0100
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, atishp@atishpatra.org, alex@ghiti.fr,
	bjorn@rivosinc.com, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, catalin.marinas@arm.com, revest@chromium.org,
	josh@joshtriplett.org, shr@devkernel.io, deller@gmx.de,
	omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com
Subject: Re: [PATCH v3 08/29] mm: Define VM_SHADOW_STACK for RISC-V
Message-ID: <d3689521-58a7-47df-bd6a-0e2e60464491@sirena.org.uk>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-9-debug@rivosinc.com>
 <8fb37319-288c-4f77-9cd7-92f17bb567ee@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8fb37319-288c-4f77-9cd7-92f17bb567ee@redhat.com>
X-Cookie: Buckle up!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_120420_197634_380BE740 
X-CRM114-Status: UNSURE (   9.68  )
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
Content-Type: multipart/mixed; boundary="===============0556978319586264335=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0556978319586264335==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3H0qyxN/1AXzqBUq"
Content-Disposition: inline


--3H0qyxN/1AXzqBUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 04, 2024 at 08:58:06PM +0200, David Hildenbrand wrote:

> or even introduce some ARCH_HAS_SHADOW_STACK so we can remove these
> arch-specific thingies here.

It would be convenient if you could pull the ARCH_HAS_USER_SHADOW_STACK
patch out of my clone3 series to do that:

   https://lore.kernel.org/all/20240203-clone3-shadow-stack-v5-3-322c69598e4b@kernel.org/

--3H0qyxN/1AXzqBUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYO+Z8ACgkQJNaLcl1U
h9DK1Af9H1qYKVWDvox7q04WCtsfCFsMMGVPBMGaRQVduMIls1x5LQmfVpAOPyqf
UZjyR8MbmEsEV+112AF9Fj3j7TK8j82BiGfS7vSX6Ui0DYE1o5X7g+7Dm7n1l5kz
WVTXuxJTDrr5WAIj5i2XVJ7/IcGTG69iu+Dy5lAe8d4xwSZ7sBKWNbjV1TM31VR5
AHXCdjeM9oNGJ6IdSvwjBrruoUwO8TUsLoZGHYEdxBdTYM7gNiJsDhRaFYgk4RdA
mox+wfY+QCl/Q13A0+3194XiBpuCoo9PO6C8+zbQxR2mvFfC4YxE69wC3/U1iR4T
VWxny2roSj6OTfzkesBui3R0qehJZA==
=LTGw
-----END PGP SIGNATURE-----

--3H0qyxN/1AXzqBUq--


--===============0556978319586264335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0556978319586264335==--

