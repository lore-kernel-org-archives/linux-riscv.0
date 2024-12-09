Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C84E77173
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 00:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9Hz4fjwarv0KLqx8d9HbgeJ3tURnagU5b0/l/BSKZw=; b=Wh4SqtNcey3xAbuQHUbuLYfg+B
	hw9caLhEBpZ3M7jEdAij1yRgmGPGFDfA5t7vCpO/R0ZvBB1/nEsYGphWlPKzwEIRjz5fpTtpv9VEM
	lWH7EeBQZN6xDOChAXewoHwMc7vuJfjucXVBgzLdbljOjCveg9a9lnUDa2886jLWqKuVLZfsjJZTp
	MvOuT4xcw+cpH9+1rYc9fNIf0e5KDA/UIJAK6YhWPs9UqI6QjVN/+AvZmx9p8p68fUTha2uyI6Yfs
	zEQHzw1L2TxERjrWHko8DSROjy8gFuBjfE6Qmphd1j4t2SovqzYULmhGQbDwHp8HzibDAHGhRFEN8
	4OZqax8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKRN7-000000063OE-1wds;
	Mon, 09 Dec 2024 00:11:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKRN5-000000063Ns-0a0f
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 00:11:32 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2161eb95317so18373655ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 16:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733703090; x=1734307890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zM7n/vAl3TGJzgch0WGJOduuRP0DYKVShZ95CA6dAc0=;
        b=AsGjaQc1aKT1ULIqZZP/gAcPErwYtFuSV1bGbW8aWePZwd6S89BgkacfhpfAeXB2oB
         W4foXQ3IBZzI9IfRal2e973LvLiNmgSrK1Qc6jDZSKTDSWzC52NVl2vscj47ysuFZ2zQ
         09VIqUl84lnna82uVkVYLbCfrR9L8v/gy2Akd5/1jR7Itn93h2DPOKWQoSPRrzt48db0
         9Ed6p1dYqLf0oi/z3lcmCyu1JW5AVyG/JSY6CWdYHPrVC2BVGPrpLNnrN3SDVUmbrm0v
         tw209brI7QM3uNzi93NqGnCTArPmpS1i1j0Fson2raowXf2U81GG4noCk2WEqW73EWtY
         BwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733703090; x=1734307890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zM7n/vAl3TGJzgch0WGJOduuRP0DYKVShZ95CA6dAc0=;
        b=Q6F1cWKgrDDrGnCnkbBaSVY4Tkzr9MCP/eTIGODI6bdyuIb09pOV8c0lGJuHaptRMb
         T1Hob4o5Nb9pPN6VQEqZpOHuL4UFLhvheRhl7Mov2aDCRKvBDxa/rZkub9KeAToMMYuT
         XZr6sVDrEuQtT7bEBO41wEUNE7LNP7EmlU36tsYPjtf6AMfS+PMOEZQjREh4f1uHNsbl
         cYBN4jqmieLUYQSuGFxLTyX0nfodXttR34I3F9oEN/4pTBkJQzoCIQ+2Dqa0/9zLrsop
         VD0hK+t1ZELXHFrUhGc5bmczFJNfHUdzcENyreckDnudav6EMn6ocXecEARCy0nJBFnM
         UdAg==
X-Forwarded-Encrypted: i=1; AJvYcCU9BtIuFIIxRlirAuvNanrmByB3IsRkkz7Cvp3M4kH8gMkcbj2QKvM/kYJD26w36HLaS1sVcNe9BGe2dQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu4aRbNDGUH+Cf23rOXLwqbUn3U8A/rKj37MKK/zNA2loMTrDd
	iq1aLHuvW9k8lS+Xqo//a4wQW+lkhfdlHPGSgK3nsIKE72xug9CUKi3k4w==
X-Gm-Gg: ASbGncsVTf3gt0K7Ix7F7SobslTv+Nl5dpU842Veo7J1rSkxGKoRL57pWo8Q6g/utG3
	cSOA9EWCprmqM5Kx2BE2lV6IJ5nuA+v2F7f+3N0xNIbEal3g9qdj9mNlvZxh2hSLuP18f8IYB5q
	Y4Irfbs/yijJt5xyicwI1DCqLwmmO8PPAX+/7mLBw4OGxkOrpGulz6eQoyLjU+xwqbUa8LK6Ydh
	5zwYxe4d90fbML+u8usfEhhTDhyEwNITfjp01v3JBiBwBSabw==
X-Google-Smtp-Source: AGHT+IGJC0WMpE+hNO9t4xiHfPXRmI6Z3vUqZe/12jkfwlmxl1MVDpPG/kpEiCWWDGHoAHEhw/OpXQ==
X-Received: by 2002:a17:903:188:b0:215:431f:268a with SMTP id d9443c01a7336-21614d7b357mr199952985ad.31.1733703089620;
        Sun, 08 Dec 2024 16:11:29 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21615dbcd48sm44977055ad.109.2024.12.08.16.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 16:11:28 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 105D7420A6FD; Mon, 09 Dec 2024 07:11:24 +0700 (WIB)
Date: Mon, 9 Dec 2024 07:11:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Remove Albert Ou from riscv
Message-ID: <Z1Y1rAmvhGitq05T@archie.me>
References: <20241205-remove_albert-v1-1-17eb850f1540@rivosinc.com>
 <Z1PihReuTF3Gx5K6@archie.me>
 <8b4a7f3d-0c3c-472f-914f-7e3971697d7c@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <8b4a7f3d-0c3c-472f-914f-7e3971697d7c@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_161131_211017_2C70A777 
X-CRM114-Status: GOOD (  16.96  )
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
Content-Type: multipart/mixed; boundary="===============8461799755740568485=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8461799755740568485==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D1MvfAhn36B/cRzY"
Content-Disposition: inline


--D1MvfAhn36B/cRzY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 08, 2024 at 07:18:09PM +0100, Alexandre Ghiti wrote:
> Hi Bagas,
>=20
> On 07/12/2024 06:52, Bagas Sanjaya wrote:
> > On Thu, Dec 05, 2024 at 02:46:19PM -0800, Charlie Jenkins wrote:
> > > Albert is not an active maintainer and his inbox rejects all emails.
> > > Remove him from the maintainer's list to put an end to everybody who
> > > interacts with the riscv linux mailing list from getting spammed with
> > > rejection emails.
> > I didn't get bounce message on my spam folder when sending to Albert,
> > though.
> >=20
> > BTW, have you contact him off-band, confirming that he no longer wants
> > to maintain?
>=20
>=20
> I have been working on the riscv kernel for more than 6 years and I have
> never seen Albert posting on the mailing list or sending a patch.
>=20
> I don't mean to be disrespectful but it's not his choice anymore, being a
> maintainer is a full time job and we need that.

Acknowledged, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--D1MvfAhn36B/cRzY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ1Y1pwAKCRD2uYlJVVFO
o0khAP4iOWC0nBXMm4QULXr895qQr0SABQlQ0JghqL3R3edFUAD/aV2Ncd4bD0eh
JoS6KMRWNG/3X0Tly4mrSlz8igWVHAw=
=eVlR
-----END PGP SIGNATURE-----

--D1MvfAhn36B/cRzY--


--===============8461799755740568485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8461799755740568485==--

