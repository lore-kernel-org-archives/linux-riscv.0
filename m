Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2447AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoFqlktXZJRdR60H+YOV9QiReTMYYGP7W7vk410zMSc=; b=dyArDQmvt+6HDHMLW+9PDRd66g
	0Dz8je1x0U98tubl9WHBjityYT0uWgsf1zs0cPjdtIzumi+GyAGTCxmtTNVhJMbk5OSZ6qbrMsoLr
	gRPtjRxkqNft6P7oeeElMwJHgPgQumz/yEEng2ipMU0Pg4G4FfLWdQiWn46yfrO9YbV17Bm6JKcm5
	8wiBHqH4RCsFnAf/23wY3wsPIRK54g69pweR+Hh9FKSCoWqlS8Se1yL7UJCsiEoG6zWQeFAf+D0Pm
	6ZvPFVwZE7r1txEcfZ/rmvbMiTq3nW9vJD0iG5c+/LOhhOqvzsVBqw+vaPEU+wDecMBau2bhaxCW2
	WY0A62jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nefCE-001eUr-39; Wed, 13 Apr 2022 15:46:18 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nefCB-001eSC-Ey
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 15:46:17 +0000
Received: by mail-qk1-x730.google.com with SMTP id j6so1721990qkp.9
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 08:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1YdLQXxMOH03x0SbnGmKpWrPU6dm2R7TxKypWUEVbgQ=;
 b=N/5+rE05+wJmxX89f5a2Dz/r6Gp205oy9BOnTqiTZF7l9Y5vVpWcvsfpxfraZ/Y7Xt
 3MROOCvvSLcekz4PRkWNLWGxUl4YCX8xD3sKvNMse3NTnPFyPa/gEaMbEUVAiSwXupJc
 dqttYsb+nzr4FRMNrBwXwd3hz4Br4LuKqgbR+L/yAg1bIvPn8FErdyW9aU/vMdds9ZX1
 Ij5xEPKixKBlkp8BqT2K641J2keHtI8bfjq9iULbWq3FzNv6MqsYN7ehORgGUzhEuFAv
 8gf8uLCNXroOVEE2gl9eMggstv2bmY0Z9By7PIrFSZChD8kiEKJ4E16YYaDYutzVVvfQ
 hJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1YdLQXxMOH03x0SbnGmKpWrPU6dm2R7TxKypWUEVbgQ=;
 b=x3MrAFsETjqBml8uPsyDdXOP0g3pNDnl84QiMx8w1DQbe5wzc73NX4ph3mjHavyQLS
 ySbaUTYv/CFWLAt9LIZrVLTanHG9Kpsdaexequx6VLpXwLNLYUc722p8R9A1hjQzGaBI
 lisOt5DyFH7EV+rUBSzQ6MMXKCJtSWjdtcq3JSTYpzoP2rjqK7/cMhOKhDYx5C6i7roS
 H2Wstvg9SW7HvJ0X6V2xluLnqYMP3ughywLo77XTcok3DrBQErxuyjlqeT5nRPSE41H9
 lda3JCguVS3vBwoV7sE83D9tIsoSq4J10X4Lyyrdb6nnX+ZB4HA73BbB1nxupk4cowh5
 DW7Q==
X-Gm-Message-State: AOAM533P6sJJLp0p+ckkdzgnowCfjHAR3W191Fje9RgDFQJYvM003rQM
 lXGkUz+DM+5oIVenpfNgD+o=
X-Google-Smtp-Source: ABdhPJwucGmNCNzNG5RX1VXPuLCdwMFZeNJYY+st3YU+BqtTMgL90GMQoqUyb8tpFQO3S5dXc/Bcjw==
X-Received: by 2002:a37:389:0:b0:69b:f56e:1672 with SMTP id
 131-20020a370389000000b0069bf56e1672mr7463010qkd.614.1649864770825; 
 Wed, 13 Apr 2022 08:46:10 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228]) by smtp.gmail.com with ESMTPSA id
 2-20020a05620a070200b0069c231ab4a9sm5351832qkc.16.2022.04.13.08.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 08:46:09 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 9B8BD27C005A;
 Wed, 13 Apr 2022 11:46:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 13 Apr 2022 11:46:08 -0400
X-ME-Sender: <xms:P_BWYiQedrJBlnrkpQdIcsCc7hFTsPI0L7yWwa4BV7HIb4YG4CIQhQ>
 <xme:P_BWYnxJhWRjCWjO6KLRlldt_tZ5c67hmLXR5DaQ5TsF3PLCQ3OWS0exShUpuWrmQ
 941FaZ6ztTOFRAhaA>
X-ME-Received: <xmr:P_BWYv0Jdsrpiy41epwEZa6weK_4rZPLqwKgaq8eWkSDRQ_nOb2Hp0entQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeluddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepheefudejueffjeelkedtgeelleelgfffhffhvdehtdekveehjeeivdejgedu
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
 hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
 qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
 hmvgdrnhgrmhgv
X-ME-Proxy: <xmx:P_BWYuD6WiFuchiGBVOVEkc3jIF5jJtpq-YT7juylSfnP0EXIyeSog>
 <xmx:P_BWYrjV5bPEaPU14ER2Q6kh3yMOu3DqAf-qgL1yUdcLo4FloLDDKQ>
 <xmx:P_BWYqrrZS3ZbYKqR54cNSrrP2v528-Jxxm5MLK6Pq1cqso_liHivQ>
 <xmx:QPBWYgZGzeB2-jB3xuemWJbTtBt6WL_jAwARAn7XOLwOV3JlTL16VQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 11:46:04 -0400 (EDT)
Date: Wed, 13 Apr 2022 23:46:00 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Andrea Parri <parri.andrea@gmail.com>
Subject: Re: [PATCH V2 0/3] riscv: atomic: Optimize AMO instructions usage
Message-ID: <YlbwOG46mCR8Q5tJ@tardis>
References: <20220412034957.1481088-1-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220412034957.1481088-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_084615_546584_95DEFEB4 
X-CRM114-Status: GOOD (  11.46  )
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
Content-Type: multipart/mixed; boundary="===============0885980989260931833=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0885980989260931833==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3IglbufFOlP6AShH"
Content-Disposition: inline


--3IglbufFOlP6AShH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Cc Andrea]

On Tue, Apr 12, 2022 at 11:49:54AM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> These patch series contain one cleanup and some optimizations for
> atomic operations.
>=20

Seems to me that you are basically reverting 5ce6c1f3535f
("riscv/atomic: Strengthen implementations with fences"). That commit
fixed an memory ordering issue, could you explain why the issue no
longer needs a fix?

Regards,
Boqun

> Changes in V2:
>  - Fixup LR/SC memory barrier semantic problems which pointed by
>    Rutland
>  - Combine patches into one patchset series
>  - Separate AMO optimization & LRSC optimization for convenience
>    patch review
>=20
> Guo Ren (3):
>   riscv: atomic: Cleanup unnecessary definition
>   riscv: atomic: Optimize acquire and release for AMO operations
>   riscv: atomic: Optimize memory barrier semantics of LRSC-pairs
>=20
>  arch/riscv/include/asm/atomic.h  | 70 ++++++++++++++++++++++++++++++--
>  arch/riscv/include/asm/cmpxchg.h | 42 +++++--------------
>  2 files changed, 76 insertions(+), 36 deletions(-)
>=20
> --=20
> 2.25.1
>=20

--3IglbufFOlP6AShH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmJW8DMACgkQSXnow7UH
+rj7oQf+M4BWYub6wHMeoa6yx+iNDGo5x5qEHT1XmIZjZUrpk3Nl3YNVCrZq9oaf
6IwoRm1XKJhmlrkqUcrp0P8Bm/mq6PZ1mOTdSRtW3cp6mmjl+y6zhidet3KOJJFp
gZz8CquT+PbQaNsnUMwWoosE85hL8FG/XYTQhoiCFVKF7PeqyFix2doCw66nRzvY
Wdj458el5Yf+XrEIzEBsrBHCeSdBRiqjulU+SHBbtivfhoaIvpjKdvBOBxF9CC7+
DI0HuLWz38I6coBeHOmo64WoC8amPCi8xVUZvUgFdUGMSRT25elqoS0qSbq9Afm2
npRG/rZbHDLvSC1t4rCiN+HS1lVQYw==
=lcp2
-----END PGP SIGNATURE-----

--3IglbufFOlP6AShH--


--===============0885980989260931833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0885980989260931833==--

