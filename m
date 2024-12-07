Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28106E7716E
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Dec 2024 05:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6LgSrg+kXnnkCvTdj79ccvuFGHS+Pq4r9+N2f7BEtY=; b=dfdHKicesZo7UqR6X6AgRkd3Oq
	7Jz8Pla9uZ6vT2wNdkicvxc9//eEzNqqxSS+uIrjanTs5p4vU1XGRLklegXTRJthgoMJVEyVQoZwJ
	m79ivtNXMkn8q5Iy/JyaWMyAiVRuuLHXaQsLmfXVZt3M1THIg8gciqYZcRbGJUr2KSKnflOyAutmj
	ku1vj3Q2hu1OrqH4Tk6wXCkMyLEKUtkHGA11jrwLsoJZP6vvhpOJL3Q5oTQ37VukXziq3Aa5tKwDs
	tIBco1+ma7DxTTkj2j4rs2HY2zym4IU4ALcj824oPmV/fX9e+aDAnfy/fGm9e8Ktr670D5dHdZQM2
	vOQeIi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJnjl-00000003Si6-2PNv;
	Sat, 07 Dec 2024 05:52:17 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJnji-00000003Shf-3ZTt
	for linux-riscv@lists.infradead.org;
	Sat, 07 Dec 2024 05:52:16 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso183678a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 21:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733550734; x=1734155534; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0FM9srz/QgrdixQmzQvfRg/ckQemKOXP7hM6wSYyw5k=;
        b=Z0IVkyhX6wNnuDVowmEwIpW2Mogi4itGL52HcL0z1HdIREoNIUotAH9lvTPuaazCxu
         OtSwsTKmqMUKku4uOqlrIVfncdKaKGWLk9HT6ye6jNaGF6mM7PURKub1ihG4vLFZSZfC
         zJ0/oQElAY1zZsAYf4rCLLPdjaeNz/SCZX2cXAoYgWdtuUbj//7FRkIKf08k2zMUfdVS
         ECrB1waT8+Lkxk6aWdGrVk7Umo1tEBbYiyEqWWwvMdLvYqHDETa73gcMOeI88VDqyNDa
         v86cfoxhS47bS3sbD00z6oIeYWpzvfu0i4EoXrG+398/SFng44B3g0zWI51fdSri+xXZ
         1L9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733550734; x=1734155534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FM9srz/QgrdixQmzQvfRg/ckQemKOXP7hM6wSYyw5k=;
        b=N8YxiEAX3d12HRGR2TkarVXAaN50iwe3LnKDgGxHFR4aRACPlfj7sY/bfxnKQb6rF2
         5exl8zEldr/OPr+hDLh+QkEt+dEDaN4hljJmQHQURaFEP0MSXCG8f8DilS/n/KN0nSv5
         AU/mstgp/M0/ayfbVQyVmBfP/W5ItQeMZXgRb/bJ7Z9ZYOfzhAlvziFcqrxbEnQtAl+w
         m1Wg0BjrDBXtRtifN1MzE6fiNPduRRuaeMvtyMz0doy09H89Qh1kWFtLFJBGdK9uBHHw
         /L/bouEHq7buKN4FHEsURIIZwODlmOD/DM7UOEWCszTr7rEEBhPWepxbnlTmid8pT6sN
         xhIw==
X-Forwarded-Encrypted: i=1; AJvYcCXezIGr5uIZdNj2vpWtV2KKJmZ8rNDl49iqLjXOoD9Al6WHp91eXH6k/NWGIuHcdmDSNHXApY0EbaWmhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywib1x7sXHjhLZrdicJNDZFym1wl1KXP8Lakl8+ottkTm4p0K2M
	QdIYyHuqjd6RUVIxYXfPpgDLbPQ4voVsEKzd3C3MUVtCFiH2fBYj
X-Gm-Gg: ASbGncv8BixT8uu2BvZSEAd2Nhub3VzBbtazVia7IDKML8cNr9JCz2PAM9SjcMARAC6
	5ov9RHR9PCTVWI1ziB0iF0T8nUbsArKdIuhdRpxlDd+IR+wHcl9fFVpAWZBxhCJ0xQwjQii/5L1
	+hHZpCwv/LCXW472Rz8ihbebR0d/vmE65/K5xxPahg2xzSuIKgsniGt5Kulz7ziEWiRPgnqe8JP
	8asbvZTtFeg9qm5bgkFD3GWb26FTAnEWgdQGYdfziuqJcruaQ==
X-Google-Smtp-Source: AGHT+IHwQ6WOOnaN6G7vBY90oGbLgh/9U7n18PbMAmQ9jBl1NozBNwfcNOU4u/ki/etqkxFDgxn3zg==
X-Received: by 2002:a17:90b:3a48:b0:2ee:c9d8:d01a with SMTP id 98e67ed59e1d1-2ef69e12847mr8511268a91.11.1733550733536;
        Fri, 06 Dec 2024 21:52:13 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef27078b03sm6530425a91.38.2024.12.06.21.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 21:52:12 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 1A3414630038; Sat, 07 Dec 2024 12:52:06 +0700 (WIB)
Date: Sat, 7 Dec 2024 12:52:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Remove Albert Ou from riscv
Message-ID: <Z1PihReuTF3Gx5K6@archie.me>
References: <20241205-remove_albert-v1-1-17eb850f1540@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20241205-remove_albert-v1-1-17eb850f1540@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_215214_908418_3F4A7726 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Type: multipart/mixed; boundary="===============1360845924095566543=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1360845924095566543==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iLNBBf4HmemCN1hw"
Content-Disposition: inline


--iLNBBf4HmemCN1hw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 02:46:19PM -0800, Charlie Jenkins wrote:
> Albert is not an active maintainer and his inbox rejects all emails.
> Remove him from the maintainer's list to put an end to everybody who
> interacts with the riscv linux mailing list from getting spammed with
> rejection emails.

I didn't get bounce message on my spam folder when sending to Albert,
though.

BTW, have you contact him off-band, confirming that he no longer wants
to maintain?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--iLNBBf4HmemCN1hw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ1PibwAKCRD2uYlJVVFO
o+5oAP4jYdfVjpvxdgksoGfeT21R8gMOOMDkjQeSkhvQSPAEaAD/Zv2ZnBe5vKSo
xaXWuaFtE7t4dnTEl6popwfQ6KhkBgM=
=bC26
-----END PGP SIGNATURE-----

--iLNBBf4HmemCN1hw--


--===============1360845924095566543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1360845924095566543==--

