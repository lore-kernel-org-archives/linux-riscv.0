Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E689BCD4F44
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKU7J6efThF4E7jA3UPLTogwFkEfNq9k6J9GsS5iMVI=; b=bD9qR8EUZcsfAbg2uf7U5JuOtM
	DnKxuD5Rq3dPLFwUJOW+v6uYFF/3JrWQr56esHhHFvJY5uQkisXku7yPd1pzBMH5FdDH9cl6GMUuL
	E0lkv08zeFpJ/4jbFRZg8D2MgandDtLOB4D+XPErZ2DaVkhE/axkouj41wJpZDI1IL0tMitQdRtiC
	5YzQeV8J69IAb3RBgRN1leJTRJ10MyXH1ssjaGHGVIMZr6mERxsyuR8i/eHrdzJnGD2agIvLJoi9A
	0kjz304ZZqo1F4jZN3IzFibr4LxeJtbJFzmJVRJxhkebuJZTb2wOjHbf2dCSBPRwJdARiWAYsCu78
	S4tCk+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjccn-008bXt-1H;
	Fri, 22 Sep 2023 09:39:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjccj-008bVx-2h;
	Fri, 22 Sep 2023 09:38:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6F078CE22BD;
	Fri, 22 Sep 2023 09:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D5BC433C7;
	Fri, 22 Sep 2023 09:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695375533;
	bh=6x7OVLHHQ75Pnr2xNF7AcbI629MqB8424pBLt1b4zJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AE2G41lCD8oy6p9WUm4ci2i1unJemR9tqF7c5SAXFqBtaQ25hWiz7CEG+VQ7BxK6a
	 FxC26RZC9Hvhz02QHpQDjipk2/5ZuU94M17DYRxnjPan7auMzmiyT0Sk0DAlB4Wyb5
	 vMjvxrH8T9vvNDyuq8ommbMoxVfdI4R55Z9tlWLhARthdUxT0Y/tn2lvqOU5ARWq9k
	 91lN9S39OLfMsoMOFwMuB0fw7Fe+NRQrTLpFTK4yKpJKNJzu+eZTvbGSP5xnMZ3L6T
	 EJ4WNdInIf5L15hPsonKHqR6nTPGtGeBOTN7SA0Za6NAblIfH72MCcTxy30Ce5BIyL
	 C6iD0ME3hoAYA==
Date: Fri, 22 Sep 2023 10:38:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Detect and Enable Svadu Extension Support
Message-ID: <20230922-italics-pursuit-424b1ad71ef1@spud>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-2-yongxuan.wang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230922085701.3164-2-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_023858_085781_6636FD2B 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Kemeng Shi <shikemeng@huaweicloud.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org, alex@ghiti.fr, David Hildenbrand <david@redhat.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, tjytimi@163.com, greentime.hu@sifive.com, wchen <waylingii@gmail.com>, Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org, vincent.chen@sifive.com, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============5328517262634367810=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5328517262634367810==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="utwYTRBgGxs2RSTx"
Content-Disposition: inline


--utwYTRBgGxs2RSTx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 08:56:47AM +0000, Yong-Xuan Wang wrote:
> We detect Svadu extension support from DTB and add arch_has_hw_pte_young()
> to enable optimization in MGLRU and __wp_page_copy_user() if Svadu
> extension is available.
>=20
> Co-developed-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--utwYTRBgGxs2RSTx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1gpQAKCRB4tDGHoIJi
0m5MAQCRz8PBnOE4Bp1PoLmi9u02FVUOL0CJOkyE2NVDSwChwAD9HVYje5mmlwS7
mUCfIPG0oUVn8wjDaQ1qsoHh6UPyHgA=
=9y+/
-----END PGP SIGNATURE-----

--utwYTRBgGxs2RSTx--


--===============5328517262634367810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5328517262634367810==--

