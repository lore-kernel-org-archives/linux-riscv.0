Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9111CC61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hr2QtVLzrc7W6qUK22F31TXBhAlcr3aaaTBQ59npnhM=; b=AMXrjI5CGaR/1iRdS5KXK32O26
	JbSjKlMxGSLJm/QAsUTUQAcUDQaPWiDvJogeypOBjh6fTIdDMfGrVqi4muDaX6B0BZ8MTBBZk88sb
	YqdIzhT2dEAWkMhmvlBJsnI5fx3icgm8nnnf59PC2poMRPXtvu0E/a8SY7zhfH0qDX/BEf0OrgnNY
	vOkRUAYZIWNhLzaPb+pw/1u46vk8SDPeeK3tE4XdYbbQ/63BG0NTwvXmNM6Tu/zootWZrnOWNMNq4
	OL1w3BdVIBw4HBdOk6IJhYGADLgC4P9n71Tua6dqPVeHiSbamSNKgnHa8L5TON/xGcKu9uiGancpu
	zsHRe9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lFx-001WxK-1e;
	Wed, 22 Nov 2023 11:18:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5lFu-001Wx0-1N
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 11:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C99D561D10;
	Wed, 22 Nov 2023 11:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8029CC433C8;
	Wed, 22 Nov 2023 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700651933;
	bh=MQOyWaD28qGZWRp1OTCZzDWS6KW+slPGyTvC7Pw3pBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubRctM7gadyqCUKoLvHPNiN+FJfnNLEynLUQChmKNSRoYQ20hxlYeiqQaa4BGhYCs
	 pmPMyiFoeQciOt7LAau1gQoK3BWyTd/RiZZpF42IqYdCN67EZ5OcummvSVkPgiBPfc
	 ELv6GHKsNO95NRL2f5CcBk9krIck8qYiZPsS//HFQ2AGIcN3lb4qdIDPZiCsV43C6p
	 ovupTzYwSJnyvHehql98yTQls/M8maoUqWdQhudpF4SZfGy7V1ndK8DUhE4vUAIqGY
	 90inD5GVSIQdyU5jze6Iaggm5qwVg7sQ/GNSL7NQMhTx5bOe77Jz5zSpVuYPRWfp06
	 sohnRbUst/K5A==
Date: Wed, 22 Nov 2023 11:18:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: Deduplicate code in setup_smp()
Message-ID: <20231122-scuff-sinner-3a6e70535efa@spud>
References: <20231121234736.3489608-1-samuel.holland@sifive.com>
 <20231121234736.3489608-2-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231121234736.3489608-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_031854_506626_0343B773 
X-CRM114-Status: UNSURE (   9.12  )
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
Content-Type: multipart/mixed; boundary="===============4024014232362149034=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4024014232362149034==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g4QIhuRDBzcjEDtx"
Content-Disposition: inline


--g4QIhuRDBzcjEDtx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 03:47:24PM -0800, Samuel Holland wrote:
> Both the ACPI and DT implementations contain some of the same code.
> Move it to the calling function so it is not duplicated.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--g4QIhuRDBzcjEDtx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV3jmgAKCRB4tDGHoIJi
0gXNAQCzo3O9dInv1Bg0Kw/qx2mGPmeeZHu568mN8CTWSE0R7gD9FNGwy279OHD1
Xp7KTTeA4nI8ghBhuVtNT54zXGHOtgI=
=AC/F
-----END PGP SIGNATURE-----

--g4QIhuRDBzcjEDtx--


--===============4024014232362149034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4024014232362149034==--

