Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03BCCCF9F0
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 01:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxfc72LvfPnez+ZjQ81haeh1KemO6Qc50EzqZYvEgog=; b=r0lgFqz2O5DuinLqu67hR42L2j
	ZYjO/nahlsrQxoBTpbqmk/IlzrcTzWH0tcgbFO4mvvbqh0rlhWCVMxFc64wd1s63vUzSvnWkVxByK
	qkhhApoOnoXlE8cmL8DweBvfGzxlrOzbwiFWGSGCQNOxsJKUauTKibrmqZG17ELWYtaCQSugegRa/
	NHhmDNgnEkqH8OGoYjEir+WjlB2BNaKzhMO8nrH1jfjcqJFL07xHvWdMywa0cbpKwIgyCwlv4V87E
	2IjCDFjN6N8BusZ8rBaVxNMzuB8hOiqB/D4K2ZMDuWbhtbP1WhAsndEuwDUSuVjHTBIT1PBUqrfSv
	0TELQh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdsZ-00000005DtC-1L29;
	Fri, 31 Oct 2025 01:24:35 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdsV-00000005Dst-1pDJ
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 01:24:33 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7a59ec9bef4so2264275b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 18:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761873870; x=1762478670; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KcSBl+fombjs6jhb+boYVCpSv0fgyDJ8iOMAQkc0Fa8=;
        b=RMwGmBT5SggqBdZzpD39Zgc+3FmT4+wWqr5I81an3P3Vrm751HHIB3c5lliDROjACU
         4lToKdO40tn8JWd3MNgPfQ0jRqFjgZZD0kmDetldOWgMw4DT6/TP7mEm4Gw9G3ffUvuY
         wPb1zG68+m3MW94tCDm+nrIXS8IQkkOb8rf0ivd3PSC/QuJ6lg6QaohNsX5WefDy1HAj
         IP9yW+5Vow3QI7CsdCt3yOOrBmWsj9NM5CPnkAW1gutb/2CHoalfabgOdnd3V1I56NCP
         Y4J3t7vz1R39OZvfQPT6clZ6cPzWOma1SM9bBPJgvhvoYKEYENQxaskjztx9FPmzfEJl
         7zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873870; x=1762478670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcSBl+fombjs6jhb+boYVCpSv0fgyDJ8iOMAQkc0Fa8=;
        b=gHp+iZIFuDe/4L90jE5xhJGUOO90WhY3LlS66SXqCVVMMScs6+XnKVfUraNU9etpoE
         KGXtNJ9hokSd+k/tUpQx8HeDkH/mwu3/zNvHdc5oXpTKb1uoRs3GrOYFTpdme2xv/32V
         A/DuwgHhHbRm3vDbnzU07sO9dZ5f2iM/dT7NYytFlyg9hYVUpjxbdGPfYsF2nFbh5QNm
         D9IN5JWldZVCoc2WqhfP8rd7YHAeNlsOIQQkVLT4EROySxcuQ/KfcKwyWivLAoySUxU2
         NHyVMMwPDpx+jR+9IzjTps7Y3Ulxg4SC5J+adJBKUTajCCj0TcuDQ9llQVLKBcDNf2jn
         JH1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOqL/BD/ihD6n0LJC/Has1l8WKSOHBAFia7frDvub2yb/FbEmTTsLj9z6ZS3ViaF7bJC9lKzI+UI1yDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+lFl4fLay75qkTnBfkGWSYqWn+ukRT7YOMsbkvIgWDrBy129b
	72Qda1KgndYV+EOwJPITVVEjZNw9/+gxtlkOCkowWbFQy//ifIkOadnZ
X-Gm-Gg: ASbGnctZLOue4md9BogDTygnU8LWUSUkqOXSnySaIzJdKjPX9OdiSpg2bdo+rhVyLWb
	FWyXiGaa2ch9fC0UpQW/2U4Jv+Xtkvu5RFhDpTMsMs6tiW2j6D7OiA7iSDSGruhmp8726IgiCAk
	3FbL6ISkSQ7D+tJe/rxpGNzFSxgMOylHQh+HQv0DXRqmVFDHgqDq2LRcH5ofvGoRqcfwv2SDId/
	mHRcRW3fjRNoDeLX5iZ9JsHeAD/XHjcnhe2KxoMVWChfhtf4oYjX+6c5KZBqxhgExy4bjUEyvN1
	n/UWUZeRC4vzcBuyHhnQi8TT7/6mHhy9FOUvCKjhARQWOAszbWSFdWpHmKHxRkkQmZfVUP17t8M
	yv5ac/NVcI8jxil11ny+76rdgQw5kFu0+ANSLw6sT+ocjs1O8chGEMxX8qBHpPr7F0wHeUpJJ0Z
	scf/ca++6mUSY=
X-Google-Smtp-Source: AGHT+IFmcP0ESU85vjNBrC9Xk91hvqDQ9l7Vj8fu5fIwvpUmwTv0sGAr8xsWOWJ1HNzSt9GGNxsHwg==
X-Received: by 2002:a05:6a21:3283:b0:340:4bb7:8d02 with SMTP id adf61e73a8af0-348cd211f18mr2293295637.60.1761873869735;
        Thu, 30 Oct 2025 18:24:29 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8aa3ff1sm223032a12.14.2025.10.30.18.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:24:28 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 6D1FE4209E4A; Fri, 31 Oct 2025 08:24:25 +0700 (WIB)
Date: Fri, 31 Oct 2025 08:24:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Atish Patra <atish.patra@linux.dev>,
	Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	conor@kernel.org, luxu.kernel@bytedance.com, cleger@rivosinc.com,
	ajones@ventanamicro.com, apatel@ventanamicro.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	songshuaishuai@tinylab.org, bjorn@rivosinc.com,
	charlie@rivosinc.com, masahiroy@kernel.org,
	valentina.fernandezalanis@microchip.com, jassisinghbrar@gmail.com,
	conor.dooley@microchip.com
Subject: Re: [PATCH 3/3] riscv: crash: use NMI to stop the CPU
Message-ID: <aQQPyan9ifX84e4h@archie.me>
References: <20251027133431.15321-1-cuiyunhui@bytedance.com>
 <20251027133431.15321-4-cuiyunhui@bytedance.com>
 <e9c2021a-fa7f-4b01-9b48-afe5fa73135f@linux.dev>
MIME-Version: 1.0
In-Reply-To: <e9c2021a-fa7f-4b01-9b48-afe5fa73135f@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_182431_715219_249FF867 
X-CRM114-Status: UNSURE (   8.22  )
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
Content-Type: multipart/mixed; boundary="===============8149529951262594661=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8149529951262594661==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l4Iyd7nhM5+T6dxQ"
Content-Disposition: inline


--l4Iyd7nhM5+T6dxQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 01:46:40AM -0700, Atish Patra wrote:
> 1. Invoking SSE on this path may lead to some race conditions if
> interruption is enabled.

What race condition?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--l4Iyd7nhM5+T6dxQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQQPyQAKCRD2uYlJVVFO
oxE6AP9I4NFyMCoGzkBrmBIf+863ij8NRBMe873QzL81xOT7KgD9G1rHfUK7x3LI
SqjtNdTIOSPzqUUofHFp4CAjKdmkkQw=
=ejAp
-----END PGP SIGNATURE-----

--l4Iyd7nhM5+T6dxQ--


--===============8149529951262594661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8149529951262594661==--

