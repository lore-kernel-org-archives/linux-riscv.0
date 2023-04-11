Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED58C7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 21:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYRtfdoVIXqxYCExXhdZoHLL+n94CmP4tciFwCZ6b+c=; b=X1l3MZba2D/3h7GBhQ7TJkHHNW
	C7xBnQTS65jED5iR4R10FEnk/OHNoh/tcFSDJKcUcE07i4NT4+o2gJC9tLgqEIm509akDs9lBQplW
	SmhaSw4UXgGVoWqiowwNpXZYEtBmqzWc1PtJ0dJlPK9CJgqcUL8VizMfUnhTcHrFLfHbGf7D3dPtp
	1S7RB6C0qGANfvhKscPVsY7b+F1fktTbPgl9RwsZ74tDXGJfZud5GfES5lMDd79k6S4Or39lv7mrz
	KRnfkYoK9XzjM6plNkQdnuQS97+xgbgOYiYiMmBUMSKzl+Sz+kbHecKvZmschJwUe6SO9O5/4dETq
	XNVi2Rsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmLc4-001CJ7-1r;
	Tue, 11 Apr 2023 21:33:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmLc2-001CIi-2e
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 21:33:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33BD260F4E;
	Tue, 11 Apr 2023 21:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B08C433EF;
	Tue, 11 Apr 2023 21:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681248793;
	bh=a/Ibkn+oiRDOCtEQMuKBzxAMKNVKsFoB2724VcRyOPk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=lc9Vd94rlQfsOHp2xlvfcUz3DAiSrthDRZM4fIjiS3zdT/11OiT1I+nh7ry1nrQ6d
	 TPb/MwV8H1juQ00+xmqWedqWgnX5roaFJqglBvHzArn1TK1R7ksWT42HvWx5Ym0+lI
	 ti5wFHmDMoF0OSiX0shrJt+3IHn1lWmejV1+gWDlYfRV8ajCgLGEAFTEi2MUjSRp4A
	 ryM8wa5ucv2ZywyuE2QzWhwuERv8t2LcYbn1horMhDmN1IztrEb/aVKhfOQYvIQYog
	 hvMykkUaOboUA/mlte6MINTIY9ooT2cg0txz7arO5Wbju6wUNl3rixsdF5VfmTWaBz
	 yanOWloU1vPNg==
Date: Tue, 11 Apr 2023 22:33:10 +0100
From: Conor Dooley <conor@kernel.org>
To: arnd@arndb.de
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, soc@kernel.org
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.4
Message-ID: <20230411-sacrifice-liable-524c033b70a8@spud>
References: <20230406-shank-impromptu-3d483bbc249f@spud>
MIME-Version: 1.0
In-Reply-To: <20230406-shank-impromptu-3d483bbc249f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_143314_900116_5BB22BCA 
X-CRM114-Status: GOOD (  13.38  )
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
Content-Type: multipart/mixed; boundary="===============9056202897473384820=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9056202897473384820==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Aal+fc4OVB1GV+w9"
Content-Disposition: inline


--Aal+fc4OVB1GV+w9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 06, 2023 at 09:24:40PM +0100, Conor Dooley wrote:

> I may have another
> PR adding some of the peripherals (pmu, mmc) for the StarFive stuff
> that are already reviewed etc, but need a rebase on top of what
> actually got applied. Is that okay, or will the end of next week be
> too late for you?

FWIW, the patches didn't show up yet, and now it is too late for me :)

--Aal+fc4OVB1GV+w9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDXSFgAKCRB4tDGHoIJi
0nGOAQDvZS6TFvs0s6z5xx7uf6KIc6DCnrfDdn1ZEaKSpOnHHAEAzyzP+fPmqrkn
Ao9sgz676dQL5BwAaXTTXJ4CVZ9H+wo=
=/3f6
-----END PGP SIGNATURE-----

--Aal+fc4OVB1GV+w9--


--===============9056202897473384820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9056202897473384820==--

