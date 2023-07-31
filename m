Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DACC001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yXYaxnHnHuqPfJjMUFz00W97DD2QURyZJVnZGBph2E=; b=TtP/8y1tkEORfGnZMzocqhgNxz
	0Hk4E71k3Ojbk0Feqet+cDKiEwR2ZTb6bnl0Geb8WmJmGx+qBc6c+fvBrNz0mu1f2XQOj6T4Kpfp9
	aUE48glD4kWOcmmHmqqDXCu5QRH2NEyKnxzJgow+j6qD4z61g3gWdztIOGBObuFj+ee5xKi496Fls
	wk/J/kK7sITe5Wd5U+LzGR7KpXekvpbrsPYMZyW6iU9MjL4j9TuBuAfoxJYDltUaMpZHJWOWq0BF2
	Dpawd0+C5FxdKZDZkH3BVzmS87A1UpS7KzblY8viIQaHjRhXSUJoedIOaFO1JSt6vbt2GSUJWlUzx
	Sgo+/1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUfU-00GLDo-0q;
	Mon, 31 Jul 2023 15:18:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUfS-00GLCw-27
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 15:18:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF08C6119B;
	Mon, 31 Jul 2023 15:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64906C433C9;
	Mon, 31 Jul 2023 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690816719;
	bh=Q50MzpVmQKShkDddA+wpPlFfKFSboVbPTpXchnb6DeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cw1AN4sEbkCY5xbvYMock2xl3WqJNANZjWb0jPrZu+CbiG7XHSWMEkcafGIpV6voQ
	 9AflccHPF6GI0mzn46QhEv4VgwA9JgvNAiCCjROXTR8hVeO2WN+V4ZhXOd4t1aGRE9
	 p0wDSChdnpd6Cwipg7tiYWS6YO6JWrHeqznYE+JULoxRdbM5iBY0yqZJuOzAwsxQVF
	 ycX59BhKJsNyTR3Vohgsof4L7UJkcFPz5mVApNE6L0JjtJB4+nKzavqI9PYVi8JT64
	 3/DSmeCB1K1jRXxbujsX1cjKqsNAWssBtLLw0Fh8z2UHlakAZ3BNUeQz39sqUxzZw3
	 I5aiv9NwNQ8Gw==
Date: Mon, 31 Jul 2023 16:18:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Bin Meng <bmeng@tinylab.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230731-mangy-violation-b388807be1f0@spud>
References: <20230731095936.23397-1-xingmingzheng@iscas.ac.cn>
 <20230731-calzone-gratified-dbc51639beec@wendy>
 <90d97914-9576-42e7-0d7d-c752b5bd6a68@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <90d97914-9576-42e7-0d7d-c752b5bd6a68@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_081842_754293_5E9E784A 
X-CRM114-Status: GOOD (  11.22  )
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
Content-Type: multipart/mixed; boundary="===============1447946307375644923=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1447946307375644923==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MYBW3sdjBDT2ibnW"
Content-Disposition: inline


--MYBW3sdjBDT2ibnW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 11:16:14PM +0800, Mingzheng Xing wrote:
>=20
> Thanks for your review, I've made the changes and submitted a
> new PATCH but there seems to be an email thread issue,
> hopefully it won't have an effect, sorry about that.

Is there? It seemed fine to me, apart from the missing v4, was about to
take a look.

--MYBW3sdjBDT2ibnW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMfQyQAKCRB4tDGHoIJi
0uweAQDTVPr61XcFSC3dLzT5u2GCzcBIT18GT/3MfmaUsXxiQAD/aCvFyVbhmGo+
3/JOuJhaJcuO4Zq8aMt2Vx4QctA8RAE=
=ktAQ
-----END PGP SIGNATURE-----

--MYBW3sdjBDT2ibnW--


--===============1447946307375644923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1447946307375644923==--

