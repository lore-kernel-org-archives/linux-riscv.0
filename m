Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB62606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CRmi52X3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=uB1g4tXl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pVIM4PKX1GoeUq41+CsZHuYbRDsWk7kWsZ3ch1gdueA=; b=CRmi52X3n+SG/T/qq9YFqQ3Gwc
	A4vvMA4RnjZMuKqCJ9gHV1ReDUy8ILtjzZ+Qi72mXOgPKntnp9sbNVQ5P1A7c5+tKBdyXfLw7geVm
	4Cz4THRPYkhPGUWFFjuTg0ZGB7G8FnYOdjwSD2M2Y3XUSvXzUJZrd14O9B9QKtawV3jmqNsHLCBAK
	uvDPtt5ntNAmxDBx9DAj2dkwQQtkpGSKqUHxxH61EISD8jJn/FHGCSHQEIFmPZizlwH0qTTX1LoUP
	tXls331g7btQKk4UXv5D0/dQATb4Lzzg2jCE8Yb54nxafsF+ryTV4F1u92VETWac6HHeNHL5LemZs
	8OakEVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfgc-00000002iL6-1vSf;
	Tue, 10 Nov 2026 06:50:30 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfgT-00000002iJB-3A2i
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 06:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794293378;
	bh=/w5jL5vyA9upjdnw5WddL4HeRqRVj2qfta9DH6HupIw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=uB1g4tXlDMNofQmaN4I4jIg7gmJ03AUnk5YUdQvy2CnsHntCb9Ge4czCH84OSR45c
	 A4juJcWRrj7XHhVj2HOhXqMYElcpu/gldwOXCVx3TNawb9Df2xMVw0hANHR2U/SKQ6
	 zjXMqkjgfaYu8nEPTos3AyTavjmYf8hfjtvmn/FE=
X-QQ-mid: zesmtpsz4t1794293371ta564256b
X-QQ-Originating-IP: FdOqUzZJzmmhkbZlIxz+KiVbEzGEuHwXiZl6I0gqZv0=
Received: from = ( [183.48.247.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 10 Nov 2026 14:49:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14734344013771177668
EX-QQ-RecipientCnt: 12
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 10 Nov 2026 06:49:28 +0000
Message-Id: <DMRBWY2S42EN.1CNW1DNHJOKKD@linux.spacemit.com>
Cc: "Alex Elder" <elder@riscstar.com>
Subject: Re: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset
 in atomic context
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Anand Moon" <linux.amoon@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Sebastian Reichel" <sre@kernel.org>, "Yixun Lan" <dlan@kernel.org>,
 "Aurelien Jarno" <aurelien@aurel32.net>, "open list:I2C SUBSYSTEM HOST
 DRIVERS" <linux-i2c@vger.kernel.org>, "open list"
 <linux-kernel@vger.kernel.org>, "open list:SYSTEM RESET/SHUTDOWN DRIVERS"
 <linux-pm@vger.kernel.org>, "open list:RISC-V SPACEMIT SoC Support"
 <linux-riscv@lists.infradead.org>, "open list:RISC-V SPACEMIT SoC Support"
 <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261110061429.2036-1-linux.amoon@gmail.com>
In-Reply-To: <20261110061429.2036-1-linux.amoon@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OAHLEV5KK0ozoH9/EFcv2XP7SqQJgHnczDhCiuw/ZfP1Mw6LrY2OWrpO
	HpbQkU2OqdbZSFxP/0uyeTx9HxmTQT6Yjsjf2/xxf98xAswq7la0KCdmZagnPoIe0ERvhHn
	iP44ybOHog0hj/KyspHL0ZzvmTDvDQTjSRspzCN7y6LJylkKIl6htCJTs5MEvM/IftQj3M7
	hob9moKn0uDu8D9d8rRbzCjRYT6Igzk+UewAdG3W2huL0QJvTw74fcITTPZ+VqGl4Xdp2N9
	jLCtjZSraANL6r3jy2ulILdEVOjWSGS/i1llC+hFB5AGunzdLWsqMKNwHPHrFPnR3ABZaLT
	/Y6MffxtTC97wk9qvwEKdpoCg/6FHRxa8UGAfHGz/RKr4nJ1F9kw4UgNIGwsQkUG1RsK47K
	TgqJB1ATuUROmRcpIp4dUPU1ZjLhFniHntJfb/rISHbFmcUhNfaFplpd7af4lypsCuhfE2J
	T4NQp4HXGQ1u5m5okgeWepjdKxzO3slg+J/rv2eqz+w0Zdj0/VpQCT1iV4AKygg7XAUplVk
	w9FKyxUrdT6sfDOlAS2HKdVnBqDrV4WWSEHUhQ+j11D4OaKtyCSO6RBoEcxqUHNioRGuCYe
	b1dAuTpahEJrHeqbpGPOw+YCzg17CYtzrHArfnZBrACSF7AtANAGriBna7bRLBl1OnPD1nS
	yPyuBmXT/261Qq1AbPDX1Z8Tf3BMLFZUtll0nwqwGIKH0NfF1sd5p8YV51QfE/kFWThSZhO
	Ark4k6lw4k3WPGnholYAxUK5DgntuAcdCkXx/fWR14T/xN+NATnm47DWlhmnj2DFj89/6rP
	cNl0/cX7Eoqwf8IOrFYvSvI7UBTexhy41bGFiAPeb4iE1iprw3FVZ9m7WZAfvNzC0lz+HcG
	fqlwZHgCNJKoO7aict8IGFHC7S1cpFW4x7lcpPVVzP+3+RVNq5Z43E/Mx4wvlz5m3vHGjux
	uBXSBKqieTSdbUQq5CNMqVWO0tInnZXMhsHk5BIwPBQYpBqJfMQ/DB9F/8qm1cLesnUw1pc
	lZ83OMrAOBc2LuwNWmLNOxB+s/EfrBjDbar4pJE2vaM/LU1EUNFCjSf3vZp6GfYTnoJfiT7
	UZ9l09B0KaNURMiC52qyb58f23/byhYGg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_225022_261601_D7AC5271 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1086924842123654257=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1086924842123654257==
Content-Type: multipart/signed;
 boundary=73e506311f5038c7b44d14906978b5da3e801f24689993eeee7050688645;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--73e506311f5038c7b44d14906978b5da3e801f24689993eeee7050688645
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 10, 2026 at 6:14 AM GMT, Anand Moon wrote:
> The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
> to wait after triggering a bus reset request. However, this function can
> be invoked during atomic I2C transfers (such as power-off or restart
> handlers running in atomic notifier chains), where sleeping is illegal.
>
> Replace the sleep operation with the driver's internal helper,
> spacemit_i2c_delay(), which conditionally uses udelay() when running in
> an atomic context, avoiding "scheduling while atomic" bugs.
>
> Assisted-by: LLM
Also, please drop this tag. The same applies to patch 2.
See commit 1e035297ffda.

--=20
Troy Mitchell


--73e506311f5038c7b44d14906978b5da3e801f24689993eeee7050688645
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavK+eCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8WuwEAp7T345IGTixk
luS0mGzMpY26JPDPOjGWsAUNq6ZoV1gA/RWwn34/Jxu8vWe3risrvjxT8VoYL1gt
bpegaV9zkQME
=3GOU
-----END PGP SIGNATURE-----

--73e506311f5038c7b44d14906978b5da3e801f24689993eeee7050688645--


--===============1086924842123654257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1086924842123654257==--

