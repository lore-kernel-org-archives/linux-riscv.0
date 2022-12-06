Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBCAC3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFbt896lBsKn86uRB8dpPOnxJpNiA7ItXvLIc125b0A=; b=fu+4OEBUzplSQR31oNYW6Bhb8Q
	HOq5OO2Ecvw6S2uSdP652vSqXlAcU1/QLgi0RxajqYrU/svHhzHMqlOd3hm2zqLYAwPd9bk13UMLX
	aj4P2vmCu0xhXcq3GRvNXjNg/3zx2NZ/AeQPRb+G5TByAet4OFAOlKfl4PeV9mRx+GKb8ogSmxCyN
	UrBvhgDzbuPQJ/jMnUpdretoHrNrl3PneXiz8qy+FUnniL8IF63dW4dNKDuHF6d5+YG5RK45WyxV6
	/szRrnDYfDguzdQW7n10amMWqi24evNWWAox4QsaS4TsvDD1DA/kinivFJ8hzt5YzB5RTn3sk1H1t
	9ZhWmWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2h05-004kDx-5h; Tue, 06 Dec 2022 23:05:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2h01-004kB5-Pl; Tue, 06 Dec 2022 23:05:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78E19B81AB8;
	Tue,  6 Dec 2022 23:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D9EC433D7;
	Tue,  6 Dec 2022 23:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670367914;
	bh=og+XXRY2fcLp4gyF1cWGrNQBduIHbwxbJ9D95CNM7Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=umT7knoeOpvPszf6KmB4AiA4y/HSTcRedLIFNwXhTf0A1KEFJzXgh4Zz8XEpILLLl
	 w8OeIYneZ+B52rdVoywZiSMDpKBn4knhvD14tNPX6NGrewdF5r6AyQxbM3hWv3rL7C
	 6lAqtIKwdtfsGeMOtupyCHk14w4fHcyB4sewVB00bPCiWwQ2oFxzjd+PANn1Rrfy70
	 YFVdIatqoVfh+WPvf0vkDIpScqmvBy2odt7AO35IttAOAeZRULI18c59y+r/ZCqxAX
	 H3FTqf54Pbxf/VuHXasDtm6Hjif4p4SmWoqtLg/2VZHYimxkyT/JIvWbSTnln+UvO4
	 jb/UP6+RRIpmw==
Date: Tue, 6 Dec 2022 23:05:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: mick@ics.forth.gr, corbet@lwn.net, alexandre.ghiti@canonical.com,
	vgoyal@redhat.com, bhe@redhat.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>, bagasdotme@gmail.com,
	dyoung@redhat.com, Palmer Dabbelt <palmer@dabbelt.com>,
	heiko@sntech.de, Xianting Tian <xianting.tian@linux.alibaba.com>,
	guoren@kernel.org, anup@brainfault.org, aou@eecs.berkeley.edu,
	hschauhan@nulltrace.org, yixun.lan@gmail.com,
	kexec@lists.infradead.org, heinrich.schuchardt@canonical.com,
	linux-doc@vger.kernel.org, crash-utility@redhat.com,
	linux-kernel@vger.kernel.org, k-hagio-ab@nec.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH V5 0/2] Support VMCOREINFO export for RISCV64
Message-ID: <Y4/KoiFhdvRBDdzH@spud>
References: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
 <167002857934.4256.16584443879212253129.b4-ty@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <167002857934.4256.16584443879212253129.b4-ty@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_150518_003241_84C48531 
X-CRM114-Status: GOOD (  14.96  )
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
Content-Type: multipart/mixed; boundary="===============4730760569820048714=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4730760569820048714==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wfcBHXZ3OW3XTejR"
Content-Disposition: inline


--wfcBHXZ3OW3XTejR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Palmer, Xianting,

On Fri, Dec 02, 2022 at 04:49:39PM -0800, Palmer Dabbelt wrote:
> On Wed, 26 Oct 2022 22:42:06 +0800, Xianting Tian wrote:
> > As disscussed in below patch set, the patch of 'describe VMCOREINFO exp=
ort in Documentation'
> > need to update according to Bagas's comments.
> > https://lore.kernel.org/linux-riscv/22AAF52E-8CC8-4D11-99CB-88DE4D11344=
4@kernel.org/
> >=20
> > As others patches in above patch set already applied, so this patch set=
 only contains below two
> > patches.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/2] RISC-V: Add arch_crash_save_vmcoreinfo support
>       https://git.kernel.org/palmer/c/649d6b1019a2

So this patch seems to be causing issues for the nommu build:
https://lore.kernel.org/oe-kbuild-all/202212062250.tR0otHcz-lkp@intel.com/

I had a bit of a poke at trying to see if there were some headers we
could pull in before actually checking the .config only to see:
# CONFIG_MMU is not set

Do we have to wrap the whole thing in a `#ifdef CONFIG_MMU` to fix
compilation here?

Thanks,
Conor.


--wfcBHXZ3OW3XTejR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4/KogAKCRB4tDGHoIJi
0pEgAQDO1wUgu3/ufYbAAAOzCbPjVQcdX8ujzegnAAh5TgId0gD/ZtqmgZf/j7Cp
hVtujGiLlEEzQkgyBIg36ipLFTYYsQ8=
=gIhU
-----END PGP SIGNATURE-----

--wfcBHXZ3OW3XTejR--


--===============4730760569820048714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4730760569820048714==--

