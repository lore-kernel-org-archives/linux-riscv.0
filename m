Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC52C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 18:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5T4EQD0W+UWY5BuzpeKlYambtLTTk2MeQrfkQH3KoM=; b=tm1bbuKQ9asiFHzEiXyNYlqksJ
	GxAgHnvyLJnqrU9Ha12wd88SAzJtcUdXP3WbfG7gfd+388Wl9ITTOfJk88ZWPmQjdGs62E39isjgn
	dQIVTTB21Tant2TOdbNdkuN9hoFtSOGRk8E0BXmpjxpWjGintijdIpaKSufb92SwGU4YNCh9ES1be
	TUW2MEqMYAzkadoI8nObn1MR2zyRJ76zBERwQnkFL33OGpSS4zmuiosOxrHxQHkdgLbHYVCHxKixt
	azbTMG4fzLvENqr2Mw9Bz4kZTJ41iLq1qyegmXBuzYZqTJ9fU4cW0BoV/LwG1DtKoMtHceP3zq73U
	PuaQdcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwSA3-0041wF-1y;
	Tue, 09 May 2023 18:34:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS9w-0041v1-1F
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 18:34:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E0AA760A4D;
	Tue,  9 May 2023 18:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED74C433EF;
	Tue,  9 May 2023 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683657239;
	bh=HJ9e9VEl0w7VA2rj0PZsLjymzP7aQa2aO0mYgN6i5ZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8ndzo/NHgZ73cuB8D7wJMXyyMi9eG+3Ww8xiDTLg+aqo+wfwcR1QLAOao1U7TGBC
	 K7EuXY2AWtXYqLBCiKcf+qgVvdfnV8qXX7HEYMp4W7ZWogBYdoEzw2/9GkvaJa5Fcl
	 ORFBGzUGBKNltFswSw9wQr2Hg8291Dcn+HxdgpUto1lYfex4cyoxN5d/qn+rf7rEyK
	 5ZfvKQUzCc+NS+yYqRcmOMWb9QqW9gt3PR8h708wXLRXTQmen5e8zq1X3WVBhTci1j
	 hpIBxEW95QHgU5crpKfm0WbEkT1fxF2DVLa00T9uzA0RCNFR7NqzkyQl7N5+3FfV88
	 WCfKAK3cq4O8Q==
Date: Tue, 9 May 2023 19:33:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] RISC-V: hwprobe: Expose Zba, Zbb, and Zbs
Message-ID: <20230509-backlands-unplug-62e4837d843a@spud>
References: <20230509182504.2997252-1-evan@rivosinc.com>
 <20230509182504.2997252-4-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230509182504.2997252-4-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_113400_509685_4B87DB30 
X-CRM114-Status: GOOD (  12.22  )
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
Content-Type: multipart/mixed; boundary="===============2908224554283087614=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2908224554283087614==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kjDsgYq9beFkZuRU"
Content-Disposition: inline


--kjDsgYq9beFkZuRU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 09, 2023 at 11:25:03AM -0700, Evan Green wrote:
> +		if (riscv_isa_extension_available(isainfo->isa, ZBA))
> +			pair->value |= RISCV_HWPROBE_EXT_ZBA;
> +		else
> +			missing |= RISCV_HWPROBE_EXT_ZBA;

Part of me wonders if we should just have a macro for this, since it's
just boilerplate w/ the only "variable" being the extension name.

Just a thought, and we'll have plenty more cracks at changing things
here, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--kjDsgYq9beFkZuRU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFqSEQAKCRB4tDGHoIJi
0hSEAQDCIH7muHrlaxe+6rHOQyGwsuzPXIuwwl3Icu/7bk/QVAD+LHGFXFJ1zPcN
XdCeb4P9lcmKyh7eyXbBPOlO1y/GDw0=
=mgNB
-----END PGP SIGNATURE-----

--kjDsgYq9beFkZuRU--


--===============2908224554283087614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2908224554283087614==--

