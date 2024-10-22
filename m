Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CD4D2C56D
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMhnXgZqZv9A4ilfKczarRGIx0KzDhdZKH0Mjw8kEZ8=; b=Y/xCXb/hD8Wz2cRajugGUtqm+q
	UaJYSANbVnM4PepmCIPD5R+ASpj5W1IDUrrcD1o6ulBSW0YL7qQtVEzZYbcHEGwBsYw2D1I+tL4eM
	WRJQFYl0Dc8ek5sSAmUVRelCEzq8LjxddItC+hAqIq9q7iLxoQvf3QJuMpF1DxROG2p8hb1jaxfHf
	zIozWJQSwrvx8yn8hUHCqRWZGCUHR8NeeisttdSP2LyvBPj1DZeyxTDikE2XE1Y2C5Mx0j7Dimo8J
	oLi9BeoS1i2NvM3bJSawBz+OPt3NUxb7FUz8KhxVFUpMKhpEWg0lYzoJXRdThVoyW1d7sbKl6p+Py
	y+OxAScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3H20-0000000BHXY-0ET9;
	Tue, 22 Oct 2024 15:42:48 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3H1w-0000000BHVr-0JXh
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 15:42:46 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso916880666b.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 08:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729611762; x=1730216562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb5ba7CKLTn8rkhkDlReivWDEzP/Y12f+/EWqIfz6pM=;
        b=SKtnZAGoSxvgNwndNNxO4SqgV1ixq+wdULVynV1dezy6W7jF9S11BjhMvA0opceIl3
         sEOJn00OZ8TmCchkGm9c9yxnw60Fdua/accvxIn1j5dO3U6gWfo7SVHK8MUyMaABpWAt
         07CFNkxwAb4GNmUQI5eNjJd97sF5i/jgaE0UqNIxC+Gxldr2OxmiZMX+52lJGxbYaxYp
         pAUqW4IPn7O6zwgvpt8SyflJ8ehVW72LE3ru7bzV3Qra3wH/LzdcCWX9K0hCAvYOJI5N
         cFxPEudDxwq9K8ajwWltQcTk6zPhmsw4srDzB1B5Z0LE0QTNW2Jgjjkz76e6Ty6kSIGv
         q5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729611762; x=1730216562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tb5ba7CKLTn8rkhkDlReivWDEzP/Y12f+/EWqIfz6pM=;
        b=nN4yp412BwDS0wcGiMMru3+o7iKWXyb1k/o3qUJo7l949qL9k3UhULnQmdFUIHjT4y
         ptpGOu8q4IxRDc2XFDKkipWvTK028/359dB9NXp9AJ8ivYgECVfNzfXMd4yxIhcPFMGI
         xA/y++nTJg/B2PksdcTEK48mdGIIKPSFg9dPzkRt3TZOQtSaErY8xn3MCOOY/LgKQbaa
         PYB7cShqbquv+NlEPyKxR0R33FR8TGcs/LnkinGcygMrp4ckP+gTeDxgHFbAuN10twAi
         oK81aS6K9eBeDHs1wJN7o5Ht9JKU9gx9ji6XuBEQzbQB/kAcdVOV6MV+u0KiivezNpGB
         yg3w==
X-Forwarded-Encrypted: i=1; AJvYcCU6gJKSQlEV3rvzCPrKBIggD2eDEODdLEtJ5LwbmhPXiVTe/PmCUmcr77fDth5Q8T0e9iiaSvoS/iBKyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2y5md0AtjeZETQVLXmNG28UPfQNDpfQiyQPJpN4sTU1D/H7n+
	/R2cREJYUTcqp8RSQQrq5iKQslw6gPr7p+DvFkwL8hR74yuBWVuHW/bhbGN9LK4=
X-Google-Smtp-Source: AGHT+IH31g9A5tvlodwEJG6AIYxAUczXnCG2y8sRDax4YawMtiLAN/avicWxie7/dj2TwfmEdo/6WA==
X-Received: by 2002:a17:906:6a07:b0:a9a:3cc6:f14c with SMTP id a640c23a62f3a-a9aa8a05ea6mr439944866b.48.1729611761895;
        Tue, 22 Oct 2024 08:42:41 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912f67f1sm353775166b.85.2024.10.22.08.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:42:41 -0700 (PDT)
Date: Tue, 22 Oct 2024 17:42:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com
Subject: Re: [PATCH v4 0/3] pwm: Add pwm driver for Sophgo SG2042
Message-ID: <i3zf5qoy7mrbqg2shag4rdwdptcjmfhr2zfxqcqzcobbnl4trd@n6ib4fobduq6>
References: <cover.1729037302.git.unicorn_wang@outlook.com>
 <MA0P287MB2822808440B26B1C445118BAFE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2822C080A81F87037F9EE94CFE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB2822C080A81F87037F9EE94CFE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_084244_336547_330AFE1D 
X-CRM114-Status: GOOD (  13.03  )
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
Content-Type: multipart/mixed; boundary="===============0697534187240694440=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0697534187240694440==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3p5yql6s3yusktbg"
Content-Disposition: inline


--3p5yql6s3yusktbg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/3] pwm: Add pwm driver for Sophgo SG2042
MIME-Version: 1.0

Hello,

On Tue, Oct 22, 2024 at 08:53:42PM +0800, Chen Wang wrote:
> Adding another email address of Uwe.
>=20
> Hi, Uwe, not sure if <u.kleine-koenig@baylibre.com>is another emailbox
> adderss of yours?
>=20
>=20
> On 2024/10/22 8:00, Chen Wang wrote:
> > If it looks good to you, can you please apply the binding & driver part
> > of this patchset for next v6.13=EF=BC=9FFor dts part, I will handle it.

It's on my todo list, but not at the top. (See
https://patchwork.ozlabs.org/project/linux-pwm/list/ for a part of my
todo list that I usually tackle from old to new.)

So please have some more patience. And FTR: Both email addresses reach
me just fine.

Best regards
Uwe

--3p5yql6s3yusktbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcXx+sACgkQj4D7WH0S
/k4X9wf+LjLZn7Y6+CUC3ywDEyn58ElxJveW4VehciYRmEqEsXeQEIVMOyuZTYzs
sQAmqS+7ykouw7tQuJ+sVHPdO0sMHqFadkJ1ZIGEwTdYrRnFSL0YvZIAUB9nsKE6
sJRLd9vuRdIrWPyQTeC/lrDU4RRlGM65Qtvbea5XTGu2vzXcjru9NuVjETol6F4Q
MNDjvUNF7Aw0WKRSzxCzlA3CkxpMkmUPJn1TVnVrwXz2wSEcq4P7mPdMgBcYkHas
9johxTldvYqd3SW4LgsbLmvi4zBK/hw+X4HTjfFvnzjPG6yDYziT2S+kPW9qMAZK
KbWYT69PgQ7lWbfwC3k0pgsWu/G/aw==
=L4hC
-----END PGP SIGNATURE-----

--3p5yql6s3yusktbg--


--===============0697534187240694440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0697534187240694440==--

