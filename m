Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1150AC54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 22:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRrAA0VhffayvwKUpv/r9WfCI+jXb55Xs+Enc/16erg=; b=XsQhduwDOUQzzf7dIfDivxJFDK
	vKwN9rnwR3lo4J8aFRz4MehiGFgcytm23VRxZ4wmwQ35RnMMq8oYWubtcI6QPwny4X6tG322u9yZh
	vUiqnFs7hHqpo+jmlld3fA3e3LeHidylUkjx6N6XfIJGESI0eSP5Ckx4bxyu0x26Syxm0cWBoM7Zx
	brKbb/G4JahWUqJmLo6EvYF+HrKXwCg5ynTUVYzNxC9AdvhGeklazi/ZydJrhG5xnXJJMjDLWXgZA
	zpsdlDKpZuVd6og7jqbn5yyrhqO3om/EIn+SSZcUKFYI1oN9mw/3//yP8a80pYsRczhSQhN5GeKMF
	aZdo94Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKo75-008yMk-Tk; Wed, 25 Jan 2023 22:19:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKo6W-008y4n-WF; Wed, 25 Jan 2023 22:18:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D5C1B81C09;
	Wed, 25 Jan 2023 22:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B39C433D2;
	Wed, 25 Jan 2023 22:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674685130;
	bh=qUbU6mhOLmqFlPJ6M9CMSUW8qu63FhjFw9HO4CS4Ius=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SR0ULMZJZaIAKNb1VEeLQfR3+5cGIObw/PpMhJQfyfoE+3cvgd1K61mYfHUH47Ctk
	 3Bm9xaIub7jo+y7U73PBRd9H7Zp8WhT7BkRPF3swiGRvM4iXTA7eKvM1fTMW6W6v4h
	 I6LIZFfjwhVK4yIcaV1PLhX8l8LG7WnFpfezKjqq87i0vMeUZ0hd1zw14VGqZSwyrv
	 LxOM6iI3nBM5URZH3LXaFjlwgAyNr0hPD7GoMwdiJUeVZM3i/ymXJGhWUxczliWlH5
	 D4puxSN7c+LeweP3OjFbn0EoyRS6WcTfsxQurzV7H7RrWFOs1CjywyS8QY4Tu/F+7x
	 UPTquyLqwvRfg==
Date: Wed, 25 Jan 2023 22:18:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	greentime.hu@sifive.com, guoren@linux.alibaba.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: Re: [PATCH -next v13 04/19] riscv: Clear vector regfile on bootup
Message-ID: <Y9GqxMFz+m6K9k5c@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-5-andy.chiu@sifive.com>
 <Y9Gk/FCFBbWC/Pyi@spud>
 <428eb479-5066-f8c6-ad98-4eeac53a5be8@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <428eb479-5066-f8c6-ad98-4eeac53a5be8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_141853_228734_CAA2708A 
X-CRM114-Status: GOOD (  17.51  )
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
Content-Type: multipart/mixed; boundary="===============4080815919983692743=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4080815919983692743==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/ZHPm/CBrzLmEWjf"
Content-Disposition: inline


--/ZHPm/CBrzLmEWjf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 01:57:28PM -0800, Vineet Gupta wrote:
>=20
> On 1/25/23 13:54, Conor Dooley wrote:
> > n Wed, Jan 25, 2023 at 02:20:41PM +0000, Andy Chiu wrote:
> > > clear vector registers on boot if kernel supports V.
> > >=20
> > > Signed-off-by: Greentime Hu<greentime.hu@sifive.com>
> > > Signed-off-by: Vineet Gupta<vineetg@rivosinc.com>
> > > [vineetg: broke this out to a seperate patch]
> > > Signed-off-by: Andy Chiu<andy.chiu@sifive.com>
> > But this patch didn't carry over the long list of contributors from it's
> > source? Seems a bit odd, that's all.
> > There was also an Rb from Palmer that got dropped too. Was that
> > intentional?
> > https://lore.kernel.org/linux-riscv/20220921214439.1491510-6-stillson@r=
ivosinc.com/
>=20
> In v12 this and 5/19 were in one patch, which I broke off into two for
> clarity. Hence the Rb technically doesn't apply.

Technically correct, the best kind, huh?

Anyways, I just noticed that this patch had a comment from Heiko that
wasn't addressed to maybe the omission is for the better!

https://lore.kernel.org/linux-riscv/2331455.NG923GbCHz@diego/

Thanks,
Conor.


--/ZHPm/CBrzLmEWjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9GqxAAKCRB4tDGHoIJi
0k2lAQD2+2dy+geW+jSBc7VzfJD+dF70e87vWWhhXkfIojnrvAD/ZbZtaBGlguSI
by+i5QSl0Gsowy15w/2Kg3yF3mLfzw0=
=Udh4
-----END PGP SIGNATURE-----

--/ZHPm/CBrzLmEWjf--


--===============4080815919983692743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4080815919983692743==--

