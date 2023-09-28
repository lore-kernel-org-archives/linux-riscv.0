Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F65BCE7B1A
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4wbMSDHxktd5zU8xo8L/XWzVJxMtjWAH4bM0lT0npo=; b=qRv76et1Dw/SRRtZOrEsRNozKx
	ur8MsZ7+2qY6wrBIw9WJ0hfRVukEj77S+j1iXZbxGefLkpqNRF+abM8dYc/LYOTDOyVawm3LIq86L
	iXiocwPHzoBC8tQWackG0S5SwUWpKMYdVc4V+exzm2qmnteSOzlZApYaWxzl40s1bw0+etZgnWDJe
	X0/qiaYv3EP9+QUDfaUETLzb3eFXRpLhN7Do4T3TeBsahJG6jWrg2sho5GQ54Ib8GpAgFFkdNLmIi
	4p3BePoiYNlXUhcfJicd1W6OBLPNe0Y75dkYds8o23hgJqRJ9WJHEdUaRw2+rrBDRAlcOw0am5jMh
	0h5AdMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloiw-002zz3-2R;
	Thu, 28 Sep 2023 10:58:26 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloit-002zwM-1t
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 10:58:25 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68bed2c786eso10281198b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 03:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695898700; x=1696503500; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r8FHvQbj7rNmFiJppzUFr2acXChGkldi3IkyP6IO254=;
        b=CktNwtKkkaztZiCsFs/hwMCBpqTlMonXzdmTYhU1rERl/ZElK1gUKqJZy1jCVZ36QU
         SHDoXJnjzWnA9Z15RkLJu53ORFyk7lH4PkRFk61pETaPvbZ0nInq1LHWg9KJIqhyJR/c
         4axS7eMHUqCl4OOZMJNA7JkQ/EGjIaxNL8XOgqTDXMBECyTJOiv1D3tmXLmHaDtVuu5Z
         Il4mMAruGWlIe/uxgbLrdT8W0JPnAVYTDCWQbF0JtPoWmaGb4ktoPt35upmd3tIYZmhX
         oRkhOtgwA4WiatQQ4pWiYAS69q9yBDXZ7AmbXIpqJ3e6pTNHVbAPXuZkeE6I/+y01NiJ
         TaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898700; x=1696503500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8FHvQbj7rNmFiJppzUFr2acXChGkldi3IkyP6IO254=;
        b=reheIutz2wHOfu5Srw83yEuC7FxIqc0Hf50W1UC5Le4dCgCWNzoAqRs6G7yPEUAnit
         p3bz7Hdfi5HSvEPzap3BHyABjHe/CmBIV4RsiGP1VOGIf4VLlnD5cl6Tdvdit35bJYKl
         vf62ubixjvaD2oWM5vKpOIp9vGV4emlw1g1zVsn/bohfvpXpKKLFCmUG2RM10G2CdKNp
         QsngpoHh5u83SZZokAQ38cdJ6zA48wDMOGvLQaTB+MmE/CeC6gY1R1A3+7JJgY66TmsP
         snIAYDqX0YDIQ1aZ9pP4D1xf4iDf1+GJuMGJ6OBD9oI9U4qMNmiNd3P/gGxfLkWereLO
         YJEg==
X-Gm-Message-State: AOJu0YxcmI+t1wk0LQpTVoR0Rtm3hURZh03GYFVpdK3yJcRhEAW5RyMq
	9Utz1Otn8Eo4Jalnp8Svr7s=
X-Google-Smtp-Source: AGHT+IGkoIlqHRlYP7Pacij/Tt4HsEzkQDrH/+yO9n+fWmRgJ9u+9+0jz+4WLeu2VEe9Tec0P8kfbA==
X-Received: by 2002:a05:6300:8004:b0:13d:5b70:17da with SMTP id an4-20020a056300800400b0013d5b7017damr804292pzc.26.1695898700374;
        Thu, 28 Sep 2023 03:58:20 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id jj3-20020a170903048300b001a9b29b6759sm9449520plb.183.2023.09.28.03.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 03:58:19 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 78E8C81C9B1B; Thu, 28 Sep 2023 17:58:16 +0700 (WIB)
Date: Thu, 28 Sep 2023 17:58:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Costa Shulyupin <costa.shul@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
	Heiko Carstens <hca@linux.ibm.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>, Andy Chiu <andy.chiu@sifive.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Wu XiangCheng <bobwxc@email.cn>,
	Sami Tolvanen <samitolvanen@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH] docs: move riscv under arch
Message-ID: <ZRVcSDkMmWaePqaL@debian.me>
References: <20230928103134.2779459-1-costa.shul@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230928103134.2779459-1-costa.shul@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_035823_641730_B7D8F951 
X-CRM114-Status: GOOD (  10.36  )
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
Content-Type: multipart/mixed; boundary="===============7899100952298534961=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7899100952298534961==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ix2tTzAorCIauNUV"
Content-Disposition: inline


--Ix2tTzAorCIauNUV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 01:29:42PM +0300, Costa Shulyupin wrote:
> and fix all in-tree references.
>=20
> Architecture-specific documentation is being moved into Documentation/arc=
h/
> as a way of cleaning up the top-level documentation directory and making
> the docs hierarchy more closely match the source hierarchy.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Ix2tTzAorCIauNUV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRVcSAAKCRD2uYlJVVFO
oxopAQDpgNiTTDa6zSkvdGa04UmmwznBVnQSr7ZXi8fu4RKxpgD/dDib4v3kjHl7
o8u4EurgRVctwGPMU1PvkP2OK6s6ygs=
=e+Pu
-----END PGP SIGNATURE-----

--Ix2tTzAorCIauNUV--


--===============7899100952298534961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7899100952298534961==--

