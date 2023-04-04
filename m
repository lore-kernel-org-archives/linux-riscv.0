Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE0CC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgK7UFzRZ5EqmU/0NWUmKzd6DaYHSMf/qoopvtkx2Ys=; b=buCDRxEpdg88iMigFu7RL4/g2u
	w1pT57aoxRk39IPAv75C3X5Fy27iY3Z0VSUaKv6djAzkbCfFcHx1YYrlzyc0f0Hn7+ZjIfredKV2O
	wYeCxLAD+F3avy/Cq3vUAi5jSwc2MTx++7rkYPivLLqr7PI5LF02ZW8HTdLuqowy+IBJBA1fQSO4K
	jBarxsuRow2IpUuyIKPF9JEpciTAnz51+EZUu+z0k5DtVvp7PEMu6jxVeJffkjgoZCDUiIlvVEltH
	7kcW8yYgpJgbReBlTgDDgDzsiQB37gVF/Lhqmxwoh/jIyNTHwnBbkOWBi/FmEIVztV1FImJDodQxD
	OTHVY+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlc4-002XFo-1W;
	Tue, 04 Apr 2023 18:42:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlc2-002XFD-03
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:42:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D0736313E;
	Tue,  4 Apr 2023 18:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE822C4339C;
	Tue,  4 Apr 2023 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680633753;
	bh=zDhYU6D+v5oh3MOa170mNSdjnkCLYr4lBbRFOu6bosw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDdmcVC7EiqCpY/NuuTRAzQNQ7AKtwGewCOlsDbIWP4IcnMCguYvY6XxptEdKcKqg
	 yxU3LBSQ2GbTTtl1+vl5jvXhi/+SDFefsmVDWtxYuNv+DUP+s+yXl5CMcv0p+5ru0C
	 OiDZGYNc5JLUyxGtzoVr0+cX1ahr0Spnzh8nyXCEnCrqV+JUX8+ZQ5cIWzfwm1m6ga
	 JAv6VCpKdpz3WDuMGOm5aveBmHDSLYFku9vKxKUeybvcTDiaMokCbhNp3+bhczF2Du
	 N09YjCB54FhLZtkkBsD264/yMrPvUfHXHrK1q7kB97XwwZ+Ko62CV2AlZjLcAjEGu+
	 a/5HekhOjzy1w==
Date: Tue, 4 Apr 2023 19:42:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 00/23] Add basic ACPI support for RISC-V
Message-ID: <20230404-prefix-faceless-843e95740928@spud>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_114234_087132_53919792 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Type: multipart/mixed; boundary="===============5793223678112977112=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5793223678112977112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P6BjEwt5vfZbU/m5"
Content-Disposition: inline


--P6BjEwt5vfZbU/m5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 11:50:14PM +0530, Sunil V L wrote:

> Changes since V3:
> 	1) Added two more driver patches to workaround allmodconfig build failure.

btw, you need to fix the issues *before* you enable ACPI, not after.

--P6BjEwt5vfZbU/m5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCxvkQAKCRB4tDGHoIJi
0uBcAQDX+NfYsma68JAoKD0l8rwd2Z8A1BSIB6zAyAemOermLgEAkgqBUTmq+KiW
ixVikD+HzAYjJnqwKLuwjrai/H1oaQQ=
=pkaH
-----END PGP SIGNATURE-----

--P6BjEwt5vfZbU/m5--


--===============5793223678112977112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5793223678112977112==--

