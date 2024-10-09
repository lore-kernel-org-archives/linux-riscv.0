Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7561FCEE33B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 18:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0d6NwWFJ3tIUaVTUrrVBc4OD/pYMeXhBLQuhaR7gQjM=; b=hWOxpSi7PbYvLsvh1OD1Rnh6oN
	vbh51Ndno0tLr821TKsXUHaR2ZhIv+vRjQt50J4gPk+sIDVxfTfqpWj3sQSyXhWvvXS4+O9QL/XSo
	fZ1llOV1BsmDB855R7w1ukGQJCNqhtpu7xZ+LndditLKghoUTDtOyP5Y7zusawdbD0FvTntQE7Or3
	7SMucnF4gRL1sfLP/4CDUuwD8ifrc4HcXh1/kKtR7B55scJJctfeuQjLk/j+THSX9G0YBkoLqiYME
	++0iQbiByLatDPKq/567uNVHWFs4qhhq5E5KbuKyWSDjGo8FeSTg823iG1g3XUQd9PBGu/ciPWlF7
	0bYhxoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sybh1-0000000APCt-3s2B;
	Wed, 09 Oct 2024 18:45:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZRW-00000009vli-1MEL
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 16:21:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6BA49A42605;
	Wed,  9 Oct 2024 16:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516A4C4CEC3;
	Wed,  9 Oct 2024 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728490900;
	bh=G8QnFXEwN9p8AEXQN6J3L68kS1BkNHs26s8ufdLC5vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TLqwNoVNYkmN9GMvy2D/6dIedLXX6m7noGHpLKCw+UMctZnY5iF/edxLaOgpSfkWF
	 8+D1bPF7CYXe3Qv0I40u4D0qMUcil6W3OrMg7oh/P+Nu8/fOFYjctnXfS6pS/73+f6
	 V56iFAJ7TZSH3vAKNKADZVzgcQ4d00FH7H4pYeoLIIPsUZ5IsE7V2VgloFESs0C2WK
	 nuF/LyGRWn7UYab0ptbNxjiltS8OWVPLdg0hC4ePNhYu1TJHCWzxisIXQmz0fqJIlQ
	 gX2m6BFPFfhWRSgXxj0JJpQNA6CSp0V93B0y6dvmJ4ar7JAsyi1Vp2Y6+72VETQ3lo
	 Um+MH28C88BWg==
Date: Wed, 9 Oct 2024 17:21:37 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH v3] selftests: sched_ext: Add sched_ext as proper
 selftest target
Message-ID: <ZwatkYOsp7m40yR7@finisterre.sirena.org.uk>
References: <20241008153519.1270862-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241008153519.1270862-1-bjorn@kernel.org>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_092142_461059_A1FC8789 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Type: multipart/mixed; boundary="===============6293320820800096130=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6293320820800096130==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yz8x4PDVpg37np1h"
Content-Disposition: inline


--yz8x4PDVpg37np1h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2024 at 05:35:18PM +0200, Bj=F6rn T=F6pel wrote:

> The sched_ext selftests is missing proper cross-compilation support, a
> proper target entry, and out-of-tree build support.

Tested-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>

There's still the thing with picking up the host kernel if there's not a
binary built, but that's a generic thing with all the BPF based stuff
that should be addressed separately.

--yz8x4PDVpg37np1h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcGrZAACgkQJNaLcl1U
h9Br6Af/Srr3jmfSdOS51x6LjbX5ESOwqIIU5SRAp9ldg1rfeBkDnXovLXLY8elP
VYftR7nol6ENaZ4Te9tHALpoI5S/Ifxn21a5l7vVWBnruaVlCARWleHsXop5RjxL
KivYy9oheVr2o4ChUguU/oGvlb+AUVT0P7AEQIjYc5zRb8Usxw/hxWX/JMcnOkaZ
R+nDXA53+WJXLTkbWs2oCkon208kIQvjePSrn2Zck+quoDdwgK3jO/vAVfzLKrG1
ohi/oXSbB2AgqPORrNMXVzJ94/JeNjrNrgYajyo2MB6tDQ+aAp63hogJFRQyEDg2
prXC5VLJ1FIDFfm3KzgOWy64lNueYw==
=GLMz
-----END PGP SIGNATURE-----

--yz8x4PDVpg37np1h--


--===============6293320820800096130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6293320820800096130==--

