Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7E2C64EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 22:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6kVq0ehbrkNhcCpQ8Dffp6AfcAUTcljxquUeGMT8I4=; b=cF0TmYAKksLlnkVrgfzIcRIcs7
	pThzr41veomHx7z+7Ynnm2Su2YY3wiea6d/Hr48oXwlpcYc8+duODHAkLx+azhdoPC5R0gZWpSzso
	yV9UZf8RIygY63Rfeldy8YKR/9r4YCGTb+UNq7rpAssKDTXWVssNkltXwkr3yXJwHybI+P/4EymL5
	WOjI26T6SOZeR/y2zlIQ8oUFLJNNGwp6r8ULO/bBvvWaQ7Sg4Nf4VgbqvXhtAIS1I5Nn48hDzZT4K
	dHty0NXsMNBxzmXhHPJfUhbbGUfHVUGp017fiuHk4LrP9cEC2XpYYS4tQRL/jL5Be/bKjOMU6BZVh
	w2FJa3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8cm-00EV1K-BN; Tue, 28 Feb 2023 22:39:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8cj-00EUzd-K5; Tue, 28 Feb 2023 22:39:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 03CA0B80EDC;
	Tue, 28 Feb 2023 22:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C96DC433D2;
	Tue, 28 Feb 2023 22:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677623943;
	bh=0WaCdvsHVq/zDbPI5+vxHe1OJGeYo+0fvMauhsIrMgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLn+oa0cOugw7DxCKlN5cYGgNHwiJtneb68umXcFETE3MNlD6J/VPgQvzwSGcsl94
	 DZiKwhyslYMgJkNkyEOROB5h/qC1bOYnXODmx0tnusw3IoAfMNHY+1RvBWNqs/RQbG
	 Bu46fKUMOEs47HBLD1gwtuS0Gd0qlhLB2crqQWESkfqLv5WVDiFe2TvUXFd2kXmFL7
	 3tElyGESpGiN+oCWLqk/E43oqBzAoh0AslrQgRs4+kUC8rAVfHon+OGj4wvpbvGSNV
	 JHgsCDMsdqDr33onlQYWf543l1yym6ykniOj1RQz91623YKNJMQFf+XFS/8fXSqEBh
	 rTaJQhyfh9Vzw==
Date: Tue, 28 Feb 2023 22:38:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Changbin Du <changbin.du@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v14 07/19] riscv: Introduce riscv_v_vsize to record
 size of Vector context
Message-ID: <Y/6CgMvoRciA7Ow1@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-8-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-8-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_143905_825420_CD2ACBE8 
X-CRM114-Status: GOOD (  11.81  )
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
Content-Type: multipart/mixed; boundary="===============0564702504855104276=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0564702504855104276==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sf16JiWW3vpd/Nea"
Content-Disposition: inline


--Sf16JiWW3vpd/Nea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:06PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> This patch is used to detect the size of CPU vector registers and use
> riscv_v_vsize to save the size of all the vector registers. It assumes all
> harts has the same capabilities in a SMP system.
>=20
> [guoren@linux.alibaba.com: add has_vector checking]
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--Sf16JiWW3vpd/Nea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/6CgAAKCRB4tDGHoIJi
0pdCAP0TVVosuKQXadUzRi4eBz0sZMFW7opQG4CjSCnDyGjR/gD/SxyYi9mpkTm8
1z16AO9+1IzUFa0Sn9L6CJyL/0OdIgQ=
=aci0
-----END PGP SIGNATURE-----

--Sf16JiWW3vpd/Nea--


--===============0564702504855104276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0564702504855104276==--

