Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B3FCCFA05
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 11:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ngc3x9eQW5TJFLXRS0V9y1ZJ6hGMwuZXJMP7StQvYuo=; b=KbIcGWqSZ3EfkhjbZ3TrxRPxGi
	mMULjwMlcuUPrjEeeY6tzh2m5D7hQRRrkzRo8iH7QVCv5cQfTG9SkgHCDppdfo27Aj1yY4EFbMVtW
	QiCFp2oNwAHP9nHaHUm+Z/z1L0Wf2hLnQShPb7qmcpM0auFkIagmKmAujPAq68NwCPGMjn59UB+nr
	tsDYVoz8yH74xgTVy6moDDRj0bw6IdxpA369VcavGd++p13y4k/WLv263BSnqBqT3STvgE5cJ84+s
	SL6Ayf9ng0kOaiAFFp0v6g14YwZLM8EUewMO2FFFwSNmXSA7GiSv7Xwu++XU0wP0m8na/tZ382iNh
	VekE/KuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxt2-0000000FMkC-0n1t;
	Thu, 06 Nov 2025 11:10:40 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxsz-0000000FMjm-18LL
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 11:10:38 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so1374437a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Nov 2025 03:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762427435; x=1763032235; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2HOJE+HVsVq4jDi0RFJp+8lGPaPymLnBxCpDhoqIT6Q=;
        b=kizcoP8zGRIflvJcGap2uRQtSaELWlEZTZQWlucJu0Vkjsep/LFNx+j/NN59jenMyg
         gs6vdnWtjh8W5K+/ZIIffVGR7eXLit5FYlMqL8HoGilolSgYbjaENHEw04XT6jZ5zpSh
         qvmgF8zGBP5PG8hxrTj2PRCzgHEsHzP75USF2RyWatFSFp0pGuKzzPkCKK5e211rzlmZ
         tkMYUWVgPns70Wjhuzc2vBP8LCfrLwQWRPyoNFhLdvtkzEEAp7ZMHCiOnX/lbqdSvF9y
         oRloiVk1xA2OyjOyCnc37OCGIGKuK0ExGwFo3sN/+7B+hhUJEY8ldY2IkJKwpztvsJpo
         R0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762427435; x=1763032235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HOJE+HVsVq4jDi0RFJp+8lGPaPymLnBxCpDhoqIT6Q=;
        b=RlmW8c7vnTYsHFEVo4pk1I9FlCCpMfGd0WHOeVUhc61zqpPwDyK1RqRy5Ak+KuLE8l
         jOyBCHwZ++xEhIJ4chiJroO2tGdAYffyTln1zBg7mCPyKltUgb9PgWKoZYCe2gGIvXAK
         iAWBlxYlTxWAd5/s7RPsiKLsc2Aj2+lZkMCGQXoNF4vTHqJ40Zpl+tECdRn0B3j7iwSC
         GJatKWKQNymfiCZ/P+sCkcHIysdbdlQDqR8a7NJKXGYzujUQsHHzKML9K2tIk+X3Ri0/
         9dn4wJuMlW1C5AhPP8KE2Hxx2zhhTyDAsKfpxkC3RWS7NO4NtKGQENmHOzQ4KGPyJK6m
         XdBw==
X-Forwarded-Encrypted: i=1; AJvYcCUNIdwAnErBSiUQ8g/NWPmG0pajmAjXCOfcOcTpoohedS1Q42I7OQbb56TVio1dizhP6zHlNz2WiDi7Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLX0IvkesrFKMBcKUClQ98ik/X/k3ycbvTbMuhjT5q23h7NOsd
	Ips63Qpe10ptT6U88eOqK5aVR8aWBp01QsbmpuQndly/IX+vVg+CEtdg
X-Gm-Gg: ASbGncsoK6iS3gUvR8zlIjOcNIPW1coeAQ0IN+vCTt/hcizw4HGxs/6b4Bu2UlxKYbG
	wPNAzdCKsuC7PMArqQuIXFiMB948fawXHKhVvizO1GAX6MlqJ439wbexefQ32Exj4OAQDGO+TW0
	M/GNvCLcRBpEi60TRyYPFzEyDAd1tujKqrO7LyTXi3OnTyZsYN042dP634oJ09eQPlGgwzR9SdI
	IWRKZzFqDW4wr0elcirpzC16KX60i/Vglak3/2f1eQBoXrIBafKoCuEtdKmcabLZ79IMkqbmKXV
	YbTYPZYkxiWMvbVHdA6m1bScR2SuBtH+X+KqzHupDHCTLmB6NsLr5mZ1FpEzFL8r8n02ofJ2ON3
	aJw7akqmk9HK+pkjkbcA25gSEofCUPd6h7fsXyC2tksHFvvJgGZfZ1WFg86ROnkEm9jNyqj1xsY
	1k
X-Google-Smtp-Source: AGHT+IGaxhluR1EdJp1LK95NPfDa80lJF7xKFLk2zAG333TwyEnCysl7N+wlyZkybqLt0nbS4usvag==
X-Received: by 2002:a05:6402:40c1:b0:63c:2e3:6cb with SMTP id 4fb4d7f45d1cf-64105a578f4mr6255036a12.26.1762427435349;
        Thu, 06 Nov 2025 03:10:35 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f86e0cesm1578811a12.33.2025.11.06.03.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:10:34 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 09CA5420A685; Thu, 06 Nov 2025 18:10:26 +0700 (WIB)
Date: Thu, 6 Nov 2025 18:10:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux RISC-V <linux-riscv@lists.infradead.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Remove Albert Ou from riscv
Message-ID: <aQyCIoipfejuaONp@archie.me>
References: <20251031112702.41271-2-bagasdotme@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20251031112702.41271-2-bagasdotme@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_031037_338974_B646B09A 
X-CRM114-Status: GOOD (  10.10  )
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
Content-Type: multipart/mixed; boundary="===============0662249653352245857=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0662249653352245857==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fZuX68Rtq6BKZVir"
Content-Disposition: inline


--fZuX68Rtq6BKZVir
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 06:27:03PM +0700, Bagas Sanjaya wrote:
> From: Charlie Jenkins <charlie@rivosinc.com>
>=20
> Albert is not an active maintainer (he only posted on LKML three times
> in 2019 [1]) and his inbox rejects all emails. Remove him from the
> maintainer's list to put an end to everybody who interacts with the
> riscv linux mailing list from getting spammed with rejection emails.
=20
review ping

--fZuX68Rtq6BKZVir
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQyCHwAKCRD2uYlJVVFO
o5FvAP4kSjGOvT4bALDy0P/jnLCWzceZqua2ANQSbtHWsEukQQD/YV69wA7u3yzr
jL/3ST0vq9rRs7f0XoYiCac68VBUMgo=
=CRee
-----END PGP SIGNATURE-----

--fZuX68Rtq6BKZVir--


--===============0662249653352245857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0662249653352245857==--

