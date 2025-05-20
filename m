Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677E3C3ABDD
	for <linux-riscv@archiver.kernel.org>; Tue, 20 May 2025 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwTZEZ/Gmb132470psq97s5mAFkAgEp0D1bQld74/jM=; b=tU3QsjKSgOlToowaJ1KuhkN46A
	n4+kHGPVmgyaW4vJUjt/F9txziIGMqCROb5oNolFcTWNeaQWsAqCtMw3I4GmaMXJuzfuck/MQxCyT
	vVzgMEAQEhg5V28+CZXQufIsWGH6Ng7F/9vTkran7qG72J4UKJUlMUJX6DvLK2j420mWFFTvm53n5
	9M0t9IG02y37gVOjcqAC+deFxAGjjjUnMcH1KAfoSULHZ9UoU4m9YMGzxggNIRNyB7Yn68++GRc0n
	IFq9rLea3SJRbI3MpgwSJIIfvdYo8lWNpMf0vXBs5vHC4ssNoLh2Gfi6/JzUotYZi2FcqplqHpLCA
	vTnwKRkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPf8-0000000DUtA-0uCD;
	Tue, 20 May 2025 16:17:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPDJ-0000000DPB7-3LhK
	for linux-riscv@lists.infradead.org;
	Tue, 20 May 2025 15:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B703A4ECA5;
	Tue, 20 May 2025 15:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB804C4CEE9;
	Tue, 20 May 2025 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747756148;
	bh=Djfvw13Di5h1WEYv/wdJ4pyB60lqEVC0i629xf9VdTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjlBdkD6DBgzziBb46ZSsbNQnyq+H8E+Sr1eUHe2d/q/LWPcLMpOw6/fJUyyD7Xl4
	 9vB2TQ4z5sYBRlGSk/8mjJRKDbvlc2kAvwTnUEdQ4RI9soswlCyncb3A5yp6OK92Wk
	 GLlJ3ddjlXuyoHaU+gYw9SCAucalRGVx4NxytA9ct/AXD327+3tkrpE6N4Gbz5sxNV
	 qHJCpEK5UfnikHoQxb60UrU3l7Qkfoq8BQf8arwPIK2cQc+iPjZPlqPM2ESVVLeclw
	 b9ZB9w5IDSwXVlnYyl8EllqQtTJymIwT3wc5EwNOVrELsQ1WLIFxx03F0wAOKP/qDz
	 lW2ZlN5nHmKdg==
Date: Tue, 20 May 2025 16:49:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yuntao Dai <d1581209858@live.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mailbox: add Sophgo CV18XX series SoC
Message-ID: <20250520-reentry-trustable-6c6aa3785919@spud>
References: <20250520-cv18xx-mbox-v4-0-fd4f1c676d6e@pigmoral.tech>
 <20250520-cv18xx-mbox-v4-1-fd4f1c676d6e@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250520-cv18xx-mbox-v4-1-fd4f1c676d6e@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_084909_906158_445287ED 
X-CRM114-Status: UNSURE (   8.68  )
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
Content-Type: multipart/mixed; boundary="===============3992596217181856633=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3992596217181856633==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/TkBY91k/ckTKX/e"
Content-Disposition: inline


--/TkBY91k/ckTKX/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 03:44:23PM +0800, Junhui Liu wrote:
> From: Yuntao Dai <d1581209858@live.com>
>=20
> Introduce the mailbox module for CV18XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
>=20
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/TkBY91k/ckTKX/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCykbwAKCRB4tDGHoIJi
0uYTAP9r70nR7dQGdhMBh4sE5wnyubPu4ABhYRGEwp7MXm1HlAEArp88wtemDtBe
1dpH25fBrGpJJbNWpgLLjdVgIbxnngs=
=IUSn
-----END PGP SIGNATURE-----

--/TkBY91k/ckTKX/e--


--===============3992596217181856633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3992596217181856633==--

