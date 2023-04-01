Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C020C76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbDy9IDCUoVRldM3RQJptBVUPHpxBn/gMAeOPLtdx5E=; b=C8DjfHoEqk42yiA/i2cuNjcHz0
	XCEDOsBAgcSGDnAlIv2X7NucLUuu3KOiUihVfi9POuRH+PvMKsdMTeVrLPKrR7T5Zr0uK3/brQLtM
	ZaLu/C0nGVg1u6D21GWX9eKsN8+cvAiJW/+bpn1zV22wEWZO9FpZkZLEZgI8MAJw3zUPVcdXZ0Fv9
	+l/dkRzI5e0IlGp2zJXivF/RfNi1Ow3Ts+W/rFebEm1ifPD6bVYMLUeIV1QzptSwudp1fxL9FRpQO
	3TqpctZJpS5GrGEyzZvCv3uqKtmcxYQ7Jehb0QYnwdGUgjWp3Sc9qJjobZ9hysLZlhWS23SwRwRXY
	BJEgYR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piXat-00A7Fe-1U;
	Sat, 01 Apr 2023 09:32:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piXaq-00A7Er-1P
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 09:32:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA01F60C41;
	Sat,  1 Apr 2023 09:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3059C433EF;
	Sat,  1 Apr 2023 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680341535;
	bh=A5HEcH0POC1LQ0vBBzRHCMIcClN+LFwasAfQrlGntQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZr15WEFQvk2JjTe5rDaNJERa72I1D5N3iTbwZYVZhm3A8FHrQVJ/zIoyjci9cpTn
	 rIckJFN3fk9BuZ6SAJQmwWV7zcH+ENysMgdjkjUHauEbIkWoy1ns+aqXFElH/+ATju
	 1wGzr7lLqcsKA5/iA7/9FoJBKfaIH3HqDp34hP5Kn/APT1IKUVvBH1CP0OO2p4n0QL
	 UMQa1eKUhagaALNCtxGNDmPSqYf7pUtVa8IqF/g1t++7IqvHYX39SE/r8jEkpyO+E1
	 zFtSk3gGP68oPd9Q9kUMbaqCQBmoI28yl19pP2wDgoZgnWMCh3VBLe9khZJ3HpGk9M
	 35HuN/nleBrXA==
Date: Sat, 1 Apr 2023 10:32:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, mark.rutland@arm.com, ben@decadent.org.uk,
	bjorn@kernel.org, palmer@dabbelt.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Yipeng Zou <zouyipeng@huawei.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
Message-ID: <0d07b570-07ac-4a36-a988-b2ffa2a4d433@spud>
References: <20230222033021.983168-1-guoren@kernel.org>
 <20230222033021.983168-5-guoren@kernel.org>
 <60ee7c26-1a70-427d-beaf-92e2989fc479@spud>
 <CAJF2gTQJB3f=80sOsgXpYn7JqfGmq+FSaCwCJ-Er=d7fKhwJcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTQJB3f=80sOsgXpYn7JqfGmq+FSaCwCJ-Er=d7fKhwJcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_023216_510318_C33F8D37 
X-CRM114-Status: UNSURE (   9.14  )
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
Content-Type: multipart/mixed; boundary="===============7212159200146112113=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7212159200146112113==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N697bhe7hq7YhlHp"
Content-Disposition: inline


--N697bhe7hq7YhlHp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 09:39:32PM -0400, Guo Ren wrote:
> On Fri, Mar 31, 2023 at 2:34=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> > [   72.337818] systemd[1]: Failed to start Load Kernel Modules.
> > [FAILED] Failed to start Load Kernel Modules.

> Are you sure, you've compiled all kernel modules? This patch needs all
> kernel stuff re-compiled.

It does this with CONFIG_MODULES=3Dn kernels too FWIW.

--N697bhe7hq7YhlHp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCf6GAAKCRB4tDGHoIJi
0ty8AP4pLw9M1SQ8agp95E8v0ZshSN4g/vspxvoTn3ZBCm1TfgD9FPZ4yEkwdAj/
ar7NYJ22grdRYVRIMczJ3M7lD9nLMgE=
=pMx5
-----END PGP SIGNATURE-----

--N697bhe7hq7YhlHp--


--===============7212159200146112113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7212159200146112113==--

