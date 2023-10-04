Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166CEE7C4D0
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5I9f7Uy6XfC7RUcMqeR2CdXBQD1ZUUgJoAZehos3Ug=; b=HQ83JHZTW181qCydFO7KIdAsXb
	HLJ1278d5QVxlHDTmot5jAMxSEB1wiyNxLY4FFiq8eeRlvnRbHbtQAiEP8FqaVzZoXLb9VBgeUSU4
	e+kANAzhWpkwhcPbjQ7CAX3Qsac1kTn+nWcdFESGx7GPpkpIX1KnKUt4SYH8ldW9a3HGs4DtjMYyg
	nqOOUC0zWV4FiR+c3EvvRhAcCFHuHBWK5GCz4OfbFg1JDaez+PzuotQAx/Zm9axpLtlACXkGp1H/Z
	hEzx22H3UpWqFZgTpf/jqM3tiIolVLieeURZJS762gzsZhCvCkiVBzorVQo3XB8U9SC41gu6IO46m
	/BJytF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3jR-000LWM-2b;
	Wed, 04 Oct 2023 15:24:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3jO-000LUK-1F
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E00B7B81EE2;
	Wed,  4 Oct 2023 15:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58834C433C8;
	Wed,  4 Oct 2023 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696433048;
	bh=XYBsuHW907+37LNlNvc8QulBglPUKmO3oxD+nsjr5xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MVyNmValrtZe2Vc5YkvlCJf3e/WsBXJIjJNaiq3p39iwrpyDc8rnK/wZeQrYaH+4E
	 cA7S/cWXbCwZxg1kjoTZabtM9V4Ul+VBXwhRj6WiMwi1DZCuHbxxdWTyWIvKQe/pQC
	 toV/Dc1KJ9OEHrgKUO0wzXynQVH2NPW3qGasA7Qrz2cuhvN67+6U6rYoxzSXxq7OWX
	 Qk0IA4yxY/n3Xj3+8R4KdjcQ/5Ra21OnrUINtnjmkn0wRqjlAfff1NS4303z6U87F3
	 m2my0HxK3jO4n44l5pMcPJ/5SFaIdyUQ2BiPUBG8HOOraf8K0BH4dNCazNNeQmkAVM
	 BoNla2fpPufDA==
Date: Wed, 4 Oct 2023 16:24:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, devicetree@vger.kernel.org,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, apatel@ventanamicro.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v4 00/10] Add Milk-V Pioneer RISC-V board support
Message-ID: <20231004-rival-wow-1412dca8c490@spud>
References: <cover.1696426805.git.unicorn_wang@outlook.com>
 <CAHAQgRChywKWKX2=Cyn4VBrZKfy6pY2meHtVqRyBcfRUm7mHYQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHAQgRChywKWKX2=Cyn4VBrZKfy6pY2meHtVqRyBcfRUm7mHYQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_082410_555884_1A22CFA2 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Type: multipart/mixed; boundary="===============7098271234275500905=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7098271234275500905==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TloKwboP8KmYAarL"
Content-Disposition: inline


--TloKwboP8KmYAarL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 04, 2023 at 11:14:54PM +0800, Chen Wang wrote:
> Sorry, please ignore this email, it was sent out by mistake.

What are you doing that this has happened twice today?
Don't you just do `git send-email /path/to/directory/containing/patches`?

--TloKwboP8KmYAarL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZR2DjwAKCRB4tDGHoIJi
0id8AP9VBtdP8SAWk9a9uS9dCCZf5WNu7DZEO6o2UQpneBc0kgEAyElB94W41QsD
/UAb3Z04CCd3me0nZbIjiWhgnLjDEgM=
=nahl
-----END PGP SIGNATURE-----

--TloKwboP8KmYAarL--


--===============7098271234275500905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7098271234275500905==--

