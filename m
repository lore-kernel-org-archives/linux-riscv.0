Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524CDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 15:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsjePNcbc3YQzMePZrGXQoNU8O9JA5N37kBrxY4lI4w=; b=lgeyxnQE4OHbguX1gPme/V8bim
	4Jo2KwYeO+9E6in2MJTAvwmpOd1Ay/Riy0XJOfMtmhNulloQZFUIQ0pcVBlOOHJaKev6t4DpzcJYW
	lIW5e8AqylT2NRQcn2W1mgJM1ZPXFnG/DH1/fSvTJ4YaeP1C2Y3hgoy74JRXRmT92gaQPC1ZmvHO1
	6aiJT/3y6+1oR8N1EobBu26HvBDN01E287JAcDdhAsejBcQEPisRbOT5cxygT/JzXnIrIcfTxPOhY
	GXsPKYHPtu8fzUwnhLRMeBAaPTGAyeSQDgy8c1TDtIxmkrdRmod5JTPWilh1e8tOnFmuY8YkOpxcV
	x077K8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vVV-00GLs2-2a;
	Tue, 14 Nov 2023 15:39:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vVT-00GLrJ-0U;
	Tue, 14 Nov 2023 15:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DCBB6126C;
	Tue, 14 Nov 2023 15:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7240C433C7;
	Tue, 14 Nov 2023 15:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699976354;
	bh=o/n07uroe/LsCsfhW3cCV8PEfXTLYoMNaFE2DwZDbtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkS/sf7PTrY1RWsoMYn24n7URroOP4x3iiWLIyViZ1mAO5OK9MsjXyV3jVdiASinM
	 UAehNMpBbpGIuO6slNfqhrdY7gZ5zFJdVuXR3V4KpxPWh1Q6hYyW2P4JH9W11yS+7q
	 1/W8Pu22yY9oA6Uo0VppBoCg8lGQPfIaDVzV7NPcmy5BD5GfdLoTbJOCWvglHHpZjB
	 5Hey3i2cJY+FXkMZsnMVl1lJXz/Ur4I5XjqYR0jEFeeP2TAU+hXvxvtN8Hi0VwXD5q
	 RaIZ5/bfrn1M2cevx4qQnk8/0uUfRpnFPDflRBaEFZLJW1fubJj5K4G57lfpI2ZJgs
	 wEx9FHwLJXeDw==
Date: Tue, 14 Nov 2023 15:39:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	greentime.hu@sifive.com, vincent.chen@sifive.com, tjytimi@163.com,
	alex@ghiti.fr, conor.dooley@microchip.com, ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3 0/4] Add Svadu Extension Support
Message-ID: <20231114-herald-cried-9122f8bbb218@squawk>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231102120129.11261-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_073915_232496_25ABE6DF 
X-CRM114-Status: GOOD (  10.24  )
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
Content-Type: multipart/mixed; boundary="===============6273675049050043038=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6273675049050043038==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ssbwg8ZtZzOKdtR5"
Content-Disposition: inline


--Ssbwg8ZtZzOKdtR5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 12:01:21PM +0000, Yong-Xuan Wang wrote:
> Svadu is a RISC-V extension for hardware updating of PTE A/D bits. This
> patch set adds support to enable Svadu extension for both host and guest
> OS.

=46rom patch one onwards for rv32_defconfig:
  /tmp/tmp.TRw8gWHZCe/arch/riscv/include/asm/pgtable.h:636:9: error: call t=
o undeclared function 'riscv_has_extension_unlikely'; ISO C99 and later do =
not support implicit function declarations [-Wimplicit-function-declaration]
  /tmp/tmp.TRw8gWHZCe/include/linux/signal.h:97:11: warning: array index 3 =
is past the end of the array (that has type 'unsigned long[2]') [-Warray-bo=
unds]

There seem to be quite a few of these -Warray-bounds issues, all in
code included from signal.h. Could you please do an rv32 build and fix
up these build issues?

Thanks,
Conor.

--Ssbwg8ZtZzOKdtR5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVOUmwAKCRB4tDGHoIJi
0uDSAQDZE0cpxTn2Ol12ymcPjTrD4pIq/iTCNux454LFLyvmOwEA4YJnc8ALiWOm
WJ2tQPQG2YAC2Zap2/vi4ZCxD7+V5gU=
=dweC
-----END PGP SIGNATURE-----

--Ssbwg8ZtZzOKdtR5--


--===============6273675049050043038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6273675049050043038==--

