Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEE6EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 18:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQoalgDMWKYsRjMLc1CvyVG+NZ76C13dFS1PWA2tpiw=; b=gDVwhmAmArtZ9qS2Pmi203juML
	V68LsCKopIvkq4cBUtPATHbZ9S0Vi3Kgmd9NsIbdUBNCScQu72CakAixsrg/j0VRu+44uaTMymqYn
	IQupaTgoyQ0XjBYuS2usRVGGnFhSX2apKZXb0utz191pET8GuqZbbJzblOUs2LrQy97EqrzRHPBOI
	KRu4cjXe5AS0QEVw7n7aj9y3gZG44tJRePKMZZoYQ4b/nr5gsDo/SPdwIM0symlDhRmbHe7wUyqGB
	6dfHnE+jwYfo6kckgKnoXQe5pnWUOJU3f9IXToiPRROdgEGq97co0Rsh2VgGN2R8innk1fy6U4lWz
	jR2yDUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEBB-001Qov-0f;
	Fri, 16 Jun 2023 18:28:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEB8-001QoH-1U;
	Fri, 16 Jun 2023 18:28:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0330961D61;
	Fri, 16 Jun 2023 18:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57CBC433B8;
	Fri, 16 Jun 2023 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686940089;
	bh=Gdv9fvJ1NHmCLB70+je1Emv0mXKmQqEenEYSf/icR8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6R6K73ye+wTMFv327hPtl64SX3bEnBBUvtEeYJoB1QxtXXAgM57dmtI2G18XGi1s
	 TonhT4YRZGKIGVHXm1Wd3Tb8RZkqZDZdYaL7perPPC8lSHp5ViFGZMq+COssttMSaa
	 BUjha8DukbYt3F65G9xFNV+YbzdDJujwnvNvcHBWbrQVmsR9JE8OHvUo7xkC4s78Cf
	 Ijg70078BR+8lj4Q8P/voqDiJqbO8f7XjfiDFU9V1R3FY+dXuvBAt7beQuNxx1Tij3
	 TWJljneOGDrMkdJf1xw7OCD2XK1BL6GPG0SXnjkP/D52Hl/d7r7/vXglQrx5vdPU9v
	 UVViuWgLKz0ZA==
Date: Fri, 16 Jun 2023 19:28:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH v2] riscv: kvm: define vcpu_sbi_ext_pmu in header
Message-ID: <20230616-army-portable-4b604631bc5a@spud>
References: <20230616142203.168996-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20230616142203.168996-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_112810_538332_44234EAF 
X-CRM114-Status: GOOD (  10.97  )
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
Content-Type: multipart/mixed; boundary="===============1890792873521646317=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1890792873521646317==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wuezkFbRNqG8HV/z"
Content-Disposition: inline


--wuezkFbRNqG8HV/z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 03:22:03PM +0100, Ben Dooks wrote:
> Sparse is giving a warning about vcpu_sbi_ext_pmu not being
> defined, so add a definition to the relevant header to fix
> the following:
>=20
> arch/riscv/kvm/vcpu_sbi_pmu.c:81:37: warning: symbol 'vcpu_sbi_ext_pmu' w=
as not declared. Should it be static?
>=20
> Fixes: cbddc4c4cb9e ("RISC-V: KVM: Add SBI PMU extension support")
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--wuezkFbRNqG8HV/z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIyptQAKCRB4tDGHoIJi
0utWAQDOZoqWIkYQnbkMm7nO53K0YDVrTgVmA09ry26g74O7xwD9Fex5dGTbA89O
lXXITUjjMd48RWstSMKcZhZ2orMIGA4=
=p5AJ
-----END PGP SIGNATURE-----

--wuezkFbRNqG8HV/z--


--===============1890792873521646317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1890792873521646317==--

