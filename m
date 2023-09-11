Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88283CA0ECD
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 22:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=tEmnjCeJZEybvG956Tc57CiTq4uWBDgBfJgI9e/oWuA=; b=uJJ
	wdaSlUIw/H1PvMtTNVXG1jyKYunEjtqKXqij2VHWIJytGVhy1FKm/m18jpIZ2EENB+1Oc0lbpQ0oE
	1xcYFyhP5XWvZxS6kMog8XQpx3LpEHcoHtkCoSpDtLMLvsTX8OcN9rSZIQa39QIT7G8aTUdWukz6L
	ijM5EC/3ZF4XhleXhmz1aLndiX2f0iIiaiC6osMRlGdE1ymVm54Zb4X2jXv2vmcNU2kXG00MKM2fN
	HPxHZhwek/4Y6nWgI3+vZSOOyPJgckEw24hlLYf9V3jPRFRVeOgIovScFXocpVpPOqmX18c+b/Bmm
	1y9EJF9MonknGUyRp9mzTx4uCEyMZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfp87-001Tp5-0H;
	Mon, 11 Sep 2023 22:11:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfp82-001ToB-0k
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 22:11:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B335AB819F7;
	Mon, 11 Sep 2023 22:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FA2C116AC;
	Mon, 11 Sep 2023 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694470291;
	bh=9xgcfoLXpsarcdZ6MsksuhWsqxyGuMU2EIpeJoma7qs=;
	h=Date:From:To:Cc:Subject:From;
	b=D3eAlDlsRFAHgs4mtSQu2piofthwM4zq3cFD5K+W8eB5ShdiLrXeea+gayFRGJjVz
	 yCs7YtnjKb7vndqhvAj6JZisyEkmVVuFR/DKz6p5881r7mH8Z6AWb1O0AwWmd4qs6V
	 /VdI4IzsSGQBL96q230GKQhGvgSK55oUjh/nucIcOIfC5N1l3LJdwANtC/SbJOD9/U
	 czHrEZGHIT0B6VwhD3aQPazKB5GG7q/UODvFjWOf+MH9idy+c/labr7D+PWTkGgP61
	 4/9lb+Tk0jCkm3hp3XUUrqatwHXaEN0WVzNPf5H680rP2+bEv2UNuUxFuU5iBuRkM3
	 1vTauKJjQagYQ==
Date: Mon, 11 Sep 2023 23:11:27 +0100
From: Conor Dooley <conor@kernel.org>
To: arnd@arndb.de, ulf.hansson@linaro.org
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>, conor@kernel.org,
	linux-pm@vger.kernel.org
Subject: Missed soc/genpd PR for 6.6 mw
Message-ID: <20230911-scouring-squash-3ef2cc8b1ee2@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_151134_404681_96F39624 
X-CRM114-Status: GOOD (  10.89  )
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
Content-Type: multipart/mixed; boundary="===============0891689632800209375=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0891689632800209375==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LnID/Z83AY46bbrF"
Content-Disposition: inline


--LnID/Z83AY46bbrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all,

So I've been informed that I made a hames of things and forgot to send
my soc driver PR for the 6.6 merge window. There's not too much in my
branch
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-soc-for-next
so I would've kicked the can to 6.7, but the majority of changes there were
made to the starfive pmu driver that has since moved to the new genpd
subsystem.

Sending a PR to Arnd for 6.7 with the pmu bits & based on v6.5-rc1 doesn't
seem to make all that much sense to me, since that stuff is no longer in
drivers/soc, but rebasing on top of v6.6-rc1 would make these genpd changes,
with a different path to Linus.

What's the best way to rectify me screwing this up? Should I split out
the non genpd patch and send a PR for that for the genpd tree for 6.7?

Thanks,
Conor.

--LnID/Z83AY46bbrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP+QjwAKCRB4tDGHoIJi
0i6DAQCjnuw+oBFXw1zVZ5b8WdW2dD3CGQ2g/4PC180nUzfLRQEAx43AhfrVwniN
23fOLn51eWMkM8KAMRCDmDdnhgUBWwE=
=pTt1
-----END PGP SIGNATURE-----

--LnID/Z83AY46bbrF--


--===============0891689632800209375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0891689632800209375==--

