Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AA5C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 23:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDmd0WehrHN2nFmB2DzJBqz4H0YFRcsX52VhdhrTrkc=; b=Np7BUaeuYjMGXp0qE8l92GZHVW
	YM/+o+UqY5RBI4QnVt/o3/CLF83eVA27z5JZYZyo00yaJB4qWZaYSS7PA8dHBrOkIwXF38WHgTqpY
	bLpESu3X2q1nxOS1m8FwiOLQPF8wRZFRvqaTKtcDJoM5wGiYT+N4KsniKy7DQnHLkMGsNjAtApohL
	k0wYC9NMt1Tc0a62xqVIvHNFyrK693p1+4/XGEgcfh3eP3s+4XeE3+hcIet6jOYCCnGxgehKMg1Oo
	Q1aj2N6byF60IGZYva3q1unfzA3xmImWq7BXaU4o0WDrMkBAR5106o4UDeRtYqyVV9VEMu6Fnhdvv
	5NUwUbhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMdcu-005n5Y-1f; Mon, 30 Jan 2023 23:31:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMdcs-005n4D-FK
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 23:31:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64E40612FE;
	Mon, 30 Jan 2023 23:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB6DC433D2;
	Mon, 30 Jan 2023 23:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675121501;
	bh=kQdyhhnp1NGKhPRfqFs6D+X8Ra0io1rlsLTX9E03Q+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/138daDBT3ln1dyOBImUCW/coBz/GMt6xZUS2s/3F12DdMcXOZjAlmDd3Ou7uBcT
	 yHXr5Sca68TemuXGd2WPO8I5OgVUkeNyewfQOkElkkrf3+SenoakDDp+8a47MmuhEj
	 YLwJqtcQoDe0T94T0NM5yNvB4fVq3G3eNRRGwckpLIBgfPDSFMXq5p/lvIlAp/12HH
	 MVeQzez4UbhZUNY1hobVDpRn8vGd4QFDOTOaqkWwKBu2LIESBg1jV89Fd8AjXQB2Uu
	 pdZ1vXeyPq7v5Ud3mJHrFo1MixtXj5aQtZoH7z9Xj0SGArXlULJpGsBjmQqpcV7uI1
	 vEkmXvX4o4WDg==
Date: Mon, 30 Jan 2023 23:31:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
Subject: Re: [PATCH v3 1/4] RISC-V: Change suspend_save_csrs and
 suspend_restore_csrs to public function
Message-ID: <Y9hTWRaShrsjm2gP@spud>
References: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com>
 <20230127091051.1465278-2-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230127091051.1465278-2-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_153150_570809_6D247DAC 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Type: multipart/mixed; boundary="===============7495008683056344160=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7495008683056344160==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GSvx5mJI3gnKODba"
Content-Disposition: inline


--GSvx5mJI3gnKODba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 27, 2023 at 05:10:48PM +0800, Sia Jee Heng wrote:
> Currently suspend_save_csrs() and suspend_restore_csrs() functions are
> statically defined in the suspend.c. Change the function's attribute
> to public so that the functions can be used by hibernation as well.

Seems reasonable to me!
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--GSvx5mJI3gnKODba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9hTWQAKCRB4tDGHoIJi
0ks5AQCmPLLnyZYHe0vRc8cRkhKi7oBHkrZ7GAaSvqW9fdoLRQD/WzdFRThaXYfL
njcQg8Tdt2SyukvBwDzhBd1G8JjEEAw=
=0h76
-----END PGP SIGNATURE-----

--GSvx5mJI3gnKODba--


--===============7495008683056344160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7495008683056344160==--

