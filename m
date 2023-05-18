Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162AFC7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QSGxwEZ6tsM3Eeacf8sxHlEBi3bUv+GavicXNSC9Qc=; b=iXMMAjKgUaqciaKAHLkrePcz+L
	gLOeu7yFzWiH5UGrynIwFgAfePa0OBWqXOeDxwCx28aVYmd6edcWdZoxAU14RMXAdj+JgupCE7XwE
	3qttY1D7JAiyRsET3KPJIIvcXnFBWjZGg8wsWDhDYgWKrrtqryuQzsXRdqqXKJ1XMm9+Gvxm4h8Vx
	nhnSrXTsj6EsHtqBlJwXeYWsLIKVJ63jTm/XgespX+HpbYxVvYQSLgCMjyts49D31LdE02O5yoWpv
	derSx6ot6gp5kV5BGxNPoyi8X9N0bO0zHOWfzsg0TY0QiJQusP7oM/WOq0eTap1i3FbHIpjuuc9Dh
	h4+IkEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhQw-00Ddh7-0q;
	Thu, 18 May 2023 17:28:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhQt-00DdgC-1y;
	Thu, 18 May 2023 17:28:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 620A765122;
	Thu, 18 May 2023 17:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7A6C4339B;
	Thu, 18 May 2023 17:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684430934;
	bh=92QcsgMHry019d9efae2Tj4VZis/VYU62VUDqpKGFXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRS+DDn9w6WfvQsflgrH8SenSC4v1Yuv/8wGqfDtG6weJu9cQA1AxVBwf64s686IC
	 7ft13Rcf5pBKMGCgp+Sp8VX7ECqS97WfxsY0H90YNaMXzcIZQqCvvxC9owSBIgfoiO
	 cS1+p/9t0hwZq+sot3BqHd0ggzf8JUMqtlEAX56zGNMhNqggrrJFKNe91m7sG4zn3W
	 z5ZDpgsb9hRaOowyEYF+Mo7IZgXqdEISXIbitlkeo4pLY5FNbZ3e9jsFWxtb8XMfbD
	 lbI+jXcj+fcT6fiFr9+Bn1zosb48/HM1AvdeV5jXhUo3MizVZuIJb/BsZfkh4oiQdm
	 REeSzzO/Y9OFQ==
Date: Thu, 18 May 2023 18:28:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>
Subject: Re: [PATCH -next v20 03/26] riscv: hwprobe: Add support for probing
 V in RISCV_HWPROBE_KEY_IMA_EXT_0
Message-ID: <20230518-decade-slighting-02219199662e@spud>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-4-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230518161949.11203-4-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_102855_709951_83DDF892 
X-CRM114-Status: GOOD (  10.37  )
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
Content-Type: multipart/mixed; boundary="===============5026724922798303949=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5026724922798303949==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G2eka028RqLLt5eR"
Content-Disposition: inline


--G2eka028RqLLt5eR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 04:19:26PM +0000, Andy Chiu wrote:
> Probing kernel support for Vector extension is available now. This only
> add detection for V only. Extenions like Zvfh, Zk are not in this scope.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Looks grand now!
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--G2eka028RqLLt5eR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZgTwAKCRB4tDGHoIJi
0ioKAP9v5j65uZSJMmCxWO99hc/abZpOXqLcl4pLcp2TGXlIrwEA6Z5gFAi0kYrs
IpiAjb2x78S5AN5z1f+e8rsWop8xdQQ=
=MG8z
-----END PGP SIGNATURE-----

--G2eka028RqLLt5eR--


--===============5026724922798303949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5026724922798303949==--

