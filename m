Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4CFFA373D
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNoZRGlqkfrqIHA4i+dfKxclqJz2yyMR+kCq0+GZZR8=; b=uj1vnbo4FOBUfEK8sNN5W6yW65
	BzNU0aVfG7jrK9frN1pqeZRXHpHE65OU+CBDDMqyALjf/MVDIOHe3YgPexJUiZqtHbFD9R4zSb05U
	LjvzYRU0+cY2n7ee5BhBgtedA4YbiBghSe2gS0nNSSMozYCGEiu0dxOBPa0XBsrwfYbfc52yqX/FU
	4UhC36zcrNzkDmvyXOHeovE8ZzEL+OsgwTBLgpvANQH8LGzlApLydt2J0m5QDus1lfPW20JEaat96
	iR3478nvOUSRH9MzNF0i8l1pLQOvPjWj5SRuA35/deDz2AFv3C7MyWNTAFzoIzPHPRf7yI/aveWbX
	ICFa5AyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opnBP-003RGt-UB; Tue, 01 Nov 2022 09:03:43 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opnBN-003RDR-4h
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 09:03:42 +0000
Received: by mail-pg1-x529.google.com with SMTP id q1so12862889pgl.11
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 02:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jp+csowDa92K9Gj0Zlh1HwJPe/hGB3+s+A80Tb78+7c=;
        b=PlBnwCFj/devdsxINsouq1TNwqE3Gv2Cf42Gt4oDsBmwhywKBOs0UW41+PzLJyeB/I
         alwC/d8+Rx1OBVva+gPVisQjliGQ9UhP6NJhF6rdpQfNbCPuWnDXrqh8SY4PGEimAjOf
         4UdSWxS3W+0wGX/eaXmgYFf7AzGjsAgu125OI+2Pwg0tvJJP4ouhixL2+G1iyqUXrl3h
         IcQgkE7argHMeHF6uAAaAzinarZAW4TCPwd9bPSS62vb/KCjzT39f1E/xct/IEzquRB8
         P28tm6bbLzYiRrFAgb77qtI0qslEjLedbzSK2onquhZ9uBvDi3e+fnd7UqCPKRsrHV2R
         hHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jp+csowDa92K9Gj0Zlh1HwJPe/hGB3+s+A80Tb78+7c=;
        b=JYW3lXKYWzHWJoMy/7i7bbvLXhOS/A9lQuZGIuMaI2HM0WZLiLp5jy4994kzOqwi6H
         qKsiicQ+X42/2u+/AV4zI1cjC1hPV52cPAr/03GoseQS6YiL6vthhuOMkxMfypTrQAsg
         Qdc3slamIbwgfG5pFkhNBaR+f72yEiLypvZMMkV9QEdWj45usAtDm/81F6ijpQ/Jl7c6
         Sc27yJohGdsX7NC4qU9KFEXf0Q3mF2Bp/9fbG+vLzcvzEaO8ZEZMeRPDPglfimqgoWU1
         faOnWUtQVkce/ojsw1jI5E4igvnGIZ0q4NnmFPr1rdrBr1AIOwYUnECJ2K+DSd8pWiTV
         yTJg==
X-Gm-Message-State: ACrzQf1jPlBSuDserZmFGDIc5sspBHVXa7/W0MAWI3U1lL/JKThHDofY
	byOdRBD+bFsP2cWTc6zNmvM=
X-Google-Smtp-Source: AMsMyM66rtYVH7/JlJZJMrQXeQVD3xLeP/D4a2pKGRHeo6+m+qYIkLeoSfDNZx+42IS3EyGBZ3i9Bw==
X-Received: by 2002:a05:6a00:4c9c:b0:56b:a9bd:ee4f with SMTP id eb28-20020a056a004c9c00b0056ba9bdee4fmr18822763pfb.35.1667293417505;
        Tue, 01 Nov 2022 02:03:37 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-24.three.co.id. [116.206.28.24])
        by smtp.gmail.com with ESMTPSA id x184-20020a6231c1000000b0056bbd286cf4sm1216532pfx.167.2022.11.01.02.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 02:03:37 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 8C749101AC5; Tue,  1 Nov 2022 16:03:33 +0700 (WIB)
Date: Tue, 1 Nov 2022 16:03:33 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Document the sv57 VM layout
Message-ID: <Y2Dg5fYVfhoJmOX3@debian.me>
References: <20221031180230.1420544-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221031180230.1420544-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_020341_227300_943DC6CB 
X-CRM114-Status: GOOD (  16.78  )
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
Content-Type: multipart/mixed; boundary="===============2948874773204267009=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2948874773204267009==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yURbL6TMLgVl+TwT"
Content-Disposition: inline


--yURbL6TMLgVl+TwT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 07:02:30PM +0100, Bj=C3=B6rn T=C3=B6pel wrote:
> +
> +
> +RISC-V Linux Kernel SV57
> +------------------------
> +
> +::
> +
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +      Start addr    |   Offset   |     End addr     |  Size   | VM area =
description
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +                    |            |                  |         |
> +   0000000000000000 |    0       | 00ffffffffffffff |   64 PB | user-spa=
ce virtual memory, different per mm
> +  __________________|____________|__________________|_________|_________=
__________________________________________________
> +                    |            |                  |         |
> +   0100000000000000 | +64     PB | feffffffffffffff | ~16K PB | ... huge=
, almost 64 bits wide hole of non-canonical
> +                    |            |                  |         | virtual =
memory addresses up to the -64 PB
> +                    |            |                  |         | starting=
 offset of kernel mappings.
> +  __________________|____________|__________________|_________|_________=
__________________________________________________
> +                                                              |
> +                                                              | Kernel-s=
pace virtual memory, shared between all processes:
> +  ____________________________________________________________|_________=
__________________________________________________
> +                    |            |                  |         |
> +   ff1bfffffee00000 |  -57    PB | ff1bfffffeffffff |    2 MB | fixmap
> +   ff1bffffff000000 |  -57    PB | ff1bffffffffffff |   16 MB | PCI io
> +   ff1c000000000000 |  -57    PB | ff1fffffffffffff |    1 PB | vmemmap
> +   ff20000000000000 |  -56    PB | ff5fffffffffffff |   16 PB | vmalloc/=
ioremap space
> +   ff60000000000000 |  -40    PB | ffdffffeffffffff |   32 PB | direct m=
apping of all physical memory
> +   ffdfffff00000000 |  - 8    PB | fffffffeffffffff |    8 PB | kasan
> +  __________________|____________|__________________|_________|_________=
___________________________________________________
> +                                                              |
> +                                                              | Identica=
l layout to the 39-bit one from here on:
> +  ____________________________________________________________|_________=
___________________________________________________
> +                    |            |                  |         |
> +   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules,=
 BPF
> +   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
> +  __________________|____________|__________________|_________|_________=
___________________________________________________

The memory layout figure above should have been in table format (it is
written as such, isn't it?):

---- >8 ----

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-lay=
out.rst
index 35f76798b6e41b..f87b63a0cc9cfa 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -102,34 +102,32 @@ RISC-V Linux Kernel SV48
 RISC-V Linux Kernel SV57
 ------------------------
=20
-::
-
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-      Start addr    |   Offset   |     End addr     |  Size   | VM area de=
scription
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-                    |            |                  |         |
-   0000000000000000 |    0       | 00ffffffffffffff |   64 PB | user-space=
 virtual memory, different per mm
-  __________________|____________|__________________|_________|___________=
________________________________________________
-                    |            |                  |         |
-   0100000000000000 | +64     PB | feffffffffffffff | ~16K PB | ... huge, =
almost 64 bits wide hole of non-canonical
-                    |            |                  |         | virtual me=
mory addresses up to the -64 PB
-                    |            |                  |         | starting o=
ffset of kernel mappings.
-  __________________|____________|__________________|_________|___________=
________________________________________________
-                                                              |
-                                                              | Kernel-spa=
ce virtual memory, shared between all processes:
-  ____________________________________________________________|___________=
________________________________________________
-                    |            |                  |         |
-   ff1bfffffee00000 |  -57    PB | ff1bfffffeffffff |    2 MB | fixmap
-   ff1bffffff000000 |  -57    PB | ff1bffffffffffff |   16 MB | PCI io
-   ff1c000000000000 |  -57    PB | ff1fffffffffffff |    1 PB | vmemmap
-   ff20000000000000 |  -56    PB | ff5fffffffffffff |   16 PB | vmalloc/io=
remap space
-   ff60000000000000 |  -40    PB | ffdffffeffffffff |   32 PB | direct map=
ping of all physical memory
-   ffdfffff00000000 |  - 8    PB | fffffffeffffffff |    8 PB | kasan
-  __________________|____________|__________________|_________|___________=
_________________________________________________
-                                                              |
-                                                              | Identical =
layout to the 39-bit one from here on:
-  ____________________________________________________________|___________=
_________________________________________________
-                    |            |                  |         |
-   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, B=
PF
-   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
-  __________________|____________|__________________|_________|___________=
_________________________________________________
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  |    Start addr    | Offset |     End addr     |  Size   | VM area descr=
iption                                          |
+  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+  | 0000000000000000 |    0   | 00ffffffffffffff |   64 PB | user-space vi=
rtual memory, different per mm                  |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | 0100000000000000 | +64 PB | feffffffffffffff | ~16K PB | ... huge, alm=
ost 64 bits wide hole of non-canonical          |
+  |                  |        |                  |         | virtual memor=
y addresses up to the -64 PB                    |
+  |                  |        |                  |         | starting offs=
et of kernel mappings.                          |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  |                              Kernel-space virtual memory, shared betwe=
en all processes:                               |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ff1bfffffee00000 | -57 PB | ff1bfffffeffffff |    2 MB | fixmap       =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ff1bffffff000000 | -57 PB | ff1bffffffffffff |   16 MB | PCI io       =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ff1c000000000000 | -57 PB | ff1fffffffffffff |    1 PB | vmemmap      =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ff20000000000000 | -56 PB | ff5fffffffffffff |   16 PB | vmalloc/iorem=
ap space                                        |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ff60000000000000 | -40 PB | ffdffffeffffffff |   32 PB | direct mappin=
g of all physical memory                        |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ffdfffff00000000 | -8 PB  | fffffffeffffffff |    8 PB | kasan        =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  |                                   Identical layout to the 39-bit one f=
rom here on:                                    |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ffffffff00000000 | -4 GB  | ffffffff7fffffff |    2 GB | modules, BPF =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ffffffff80000000 | -2 GB  | ffffffffffffffff |    2 GB | kernel       =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+

However, for consistency, other similar figures should also be converted
to tables (as separate patch).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--yURbL6TMLgVl+TwT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY2Dg5QAKCRD2uYlJVVFO
oyoHAQDSvuixaPsTu33sJAg6+XOwOCjsAT9k0V97zVoeWcDVWwD/TSOkf07TlUXD
TPktqmAI6ey9cx5GFTqFoUnqWP2GQAk=
=u90+
-----END PGP SIGNATURE-----

--yURbL6TMLgVl+TwT--


--===============2948874773204267009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2948874773204267009==--

