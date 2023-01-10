Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE497C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 22:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktiO7vn36ntZF5wp5R8JbkcIdzGv1i+18HvWIilsXE0=; b=IJnmQynDmwQT4I4rAWWLENaceo
	x/CKgBcaLdOHvKJFX/PhLjZTxGwGe8wsgPOZh0XDImL39Xcua6D2MCxd+1YPrJY4b8iACyBgs4MNi
	1teZvzAgE4dFGI0x082RQFgNr7MARxzvcbq9NQI8MMqYV/98SdxbkvMjTGQG0U4j5bUJaQF8c4Wi7
	377b/oalNXtyy+8f/kK2xZuL6oII8eNtb+MGQgA+HJuoagOWVUEm0nNezXCcM3jOWV/JN7dZIAAIt
	wK6HSlMUQOtvvxDNaOhdXgDLZjYHmpeVMzGoM9baZ2EjKIe3/80PmHvQmFrBjq2Iyr103yuML9PVR
	zvc1orZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFNCz-008mnG-FM; Tue, 10 Jan 2023 22:35:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFNCw-008mmJ-5N
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 22:35:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82B5061920;
	Tue, 10 Jan 2023 22:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7A4C433EF;
	Tue, 10 Jan 2023 22:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673390100;
	bh=iFGn2opowMwfPaJNeuO4FtqF0e0uvSnF7APmzM7zVrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKYDOXqeYt2uZwtbwd7PuvxJs4j3H83bRxUC8s+kh6QAEsEVteEJTXTf/kPivw509
	 nbkjJVgKW3ULs/j3xYh0tgOumFpeeLeUKzpjNByOtRtCQQAYHicrIHf0Wc4tRwCnLb
	 8rNaKja6k/BSKEKJThzKy1/fFUYYaOJb1u0mW0rPEAYb4L1npM96Mpkzd/4HmqdoNo
	 tYtSLWX/sIV29c/48R/pCZ1cblyTC/Sm4UKKctYKiipRKGVMt5t9gRkrz6iMNmvgzp
	 3olflIYvlp/VT4K/HozrEass/71XlfueKT6/ZsI8Et2tebIs4WTHb3VYkmJecNMsba
	 RA6mUZcuUtUhg==
Date: Tue, 10 Jan 2023 22:34:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@infradead.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v1 1/7] RISC-V: introduce ARCH_FOO kconfig aliases for
 SOC_FOO symbols
Message-ID: <Y73oECczK3bklSyS@spud>
References: <20221121221414.109965-1-conor@kernel.org>
 <20221121221414.109965-2-conor@kernel.org>
 <CAMuHMdVoMzox6FdPFsR515nnEYXtCt-Xs5qBgGQigzL2=Q7kPg@mail.gmail.com>
 <125360d7-9f06-05f6-e3bb-300514b9f821@opensource.wdc.com>
MIME-Version: 1.0
In-Reply-To: <125360d7-9f06-05f6-e3bb-300514b9f821@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_143502_268324_AA3CD2BA 
X-CRM114-Status: GOOD (  14.52  )
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
Content-Type: multipart/mixed; boundary="===============2169281364170179616=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2169281364170179616==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EAU4gwKVkSRLL2Fu"
Content-Disposition: inline


--EAU4gwKVkSRLL2Fu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 11, 2023 at 07:22:47AM +0900, Damien Le Moal wrote:
> By the way, I recall some pushback with the renaming of SOC_XXX to
> ARCH_XXX. I personally do not like it and Christoph suggested the revers
> approach of renaming arm ARCH_XXX to something else instead. I did not
> follow further on that discussion, but it looks like the riscv SOC_XXX
> renaming went through ?

We asked the ARM guys about it, I think on IRC as they'd not replied to
the thread, and cold water was poured on the idea.

It's Murphy's Law that the thing with the problem would be the k210 too
isn't it.
I could've sworn I booted one of each vendor so kinda kicking myself
right now.

--EAU4gwKVkSRLL2Fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY73oEAAKCRB4tDGHoIJi
0togAQCVgBU+UhBX70P2smqLTk27ILlAbnu7pAzJ0iX0i+wbqQD/QzS6Igo+zMzD
73vrxWsu525ieESexpOlMReEG/XtEQo=
=v9cL
-----END PGP SIGNATURE-----

--EAU4gwKVkSRLL2Fu--


--===============2169281364170179616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2169281364170179616==--

