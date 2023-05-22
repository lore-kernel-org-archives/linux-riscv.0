Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781CAC77B73
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 17:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUrTCrcFxjDCW4Y5Y0aCaVZHcWxJ6Q/Hrl84xbk/ytI=; b=ULhcMaQ90r30ZVU7ox2zZwxUgC
	1fl4Adqq8tip//HUAqs85upqrvkw9LI/5ecZhIU/XP7oEOXwfuoNokrJi7pYrzDXQuqR1cINqG0Qj
	Pwl4va6rNl1WLLFx43TU3jTcbufyRXlEJAV56Fr/6z6EMnF8VYCqNhHTpab52nTMlstHVw0EKJ0mu
	7PiKKh357Pb7k9OYfcrCzEMgjAcU+bAxPZdDjLP+zstIvpzt9GBvtGl0lXIkfmBJ0haS6UFyWl63U
	zB9gh2TblqKe1V1MssE5WAUivjmLhXcOAH9hI1OBGBH0kijhA0GihCGCwF5ljgjpn+83fiOzXy2np
	Bcm+mMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q19Z4-007PGY-1p;
	Mon, 22 May 2023 17:43:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q19Z2-007PFZ-0P
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 17:43:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9CB7E62128;
	Mon, 22 May 2023 17:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BD8C433EF;
	Mon, 22 May 2023 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684777399;
	bh=V9lNYJ1FODYT/ky9VFFLcxluNDglQQa2NTObXOY9NqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2JQPcGf9ehkYuyB4drRzH9X3jFTW0zdwhiVIwkYZz4U7SXS/fRPccRy8ZfjC01ma
	 1yvJlrYo5hcRl1L6OlZL6wMaUrTxDTnx9RMY923HodgZHt/f7qZHOBFQeuDs8y64wr
	 pUvEad5kpUcFs6LScL1YSG276tgOlPkwFeUA1cQ6FC6FgwZNzvzJxoGfCiiZurEoW/
	 a3MyXDgIdqcIYMccdrqs+FQxjG4QaKgAMjFFp6K/Vq/TVMshBAfVlQmcf/qyrExxee
	 YMNC9iW3n1YydFlsH9ISJRCddRkSs3yF/nE7Hc/JUNFLxgOMRqFnPkusMDDgDzF0Aq
	 Qo8G0qvCwL97Q==
Date: Mon, 22 May 2023 18:43:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
	christoph.muellner@vrull.eu, David.Laight@aculab.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v3 2/2] riscv: Add Zawrs support for spinlocks
Message-ID: <20230522-karaoke-reproduce-be1bb503b49c@spud>
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
 <20230521114715.955823-3-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
In-Reply-To: <20230521114715.955823-3-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_104320_248890_81B9BE9B 
X-CRM114-Status: GOOD (  20.67  )
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
Content-Type: multipart/mixed; boundary="===============3492240131301932060=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3492240131301932060==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IYoWI8tHVLtleIAG"
Content-Disposition: inline


--IYoWI8tHVLtleIAG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Heiko,

On Sun, May 21, 2023 at 01:47:15PM +0200, Heiko Stuebner wrote:
> From: Christoph M=FCllner <christoph.muellner@vrull.eu>
>=20
> The current RISC-V code uses the generic ticket lock implementation,
> that calls the macros smp_cond_load_relaxed() and smp_cond_load_acquire().
> Currently, RISC-V uses the generic implementation of these macros.
> This patch introduces a RISC-V specific implementation, of these
> macros, that peels off the first loop iteration and modifies the waiting
> loop such, that it is possible to use the WRS.STO instruction of the Zawrs
> ISA extension to stall the CPU.
>=20
> The resulting implementation of smp_cond_load_*() will only work for
> 32-bit or 64-bit types for RV64 and 32-bit types for RV32.
> This is caused by the restrictions of the LR instruction (RISC-V only
> has LR.W and LR.D). Compiler assertions guard this new restriction.
>=20
> This patch uses the existing RISC-V ISA extension framework
> to detect the presence of Zawrs at run-time.
> If available a NOP instruction will be replaced by WRS.NTO or WRS.STO.
>=20
> The whole mechanism is gated by Kconfig setting, which defaults to Y.
>=20
> The Zawrs specification can be found here:
> https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
>=20
> Signed-off-by: Christoph M=FCllner <christoph.muellner@vrull.eu>
> [rebase, update to review comments]
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

I do intend actually reviewing these two, but busy this week with dt
stuff! In the interim, got some build complaints..

gcc-13 & clang-16 allmodconfig:
kernel/rcu/rcuscale.c:819:3: warning: logical not is only applied to the le=
ft hand side of this comparison [-Wlogical-not-parentheses]

k210_nommu_defconfig:
include/linux/atomic/atomic-arch-fallback.h:249:23: error: implicit declara=
tion of function 'smp_load_acquire' [-Werror=3Dimplicit-function-declaratio=
n]
include/linux/atomic/atomic-arch-fallback.h:265:17: error: implicit declara=
tion of function 'smp_store_release' [-Werror=3Dimplicit-function-declarati=
on]

Thanks,
Conor.

--IYoWI8tHVLtleIAG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGupsgAKCRB4tDGHoIJi
0qJzAQDWqaUWfrtpQ6OYOg/TnaIxCu72rx/hm9EmU/Ml4he2BAD/RiZe8j6xfCGn
UBL1FP69hwwqCPGkT5OGlsqx7ZrruQM=
=Zm9B
-----END PGP SIGNATURE-----

--IYoWI8tHVLtleIAG--


--===============3492240131301932060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3492240131301932060==--

