Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893DBCAC598
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 12:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JmWQlE4/J5pivKnMvMgkRnJwXYA93INmF3aZqAd3Y8=; b=krGqC5QbDAcaW90dU390TJ53Xl
	Mt8m4aYRIWNTz3EEIW56wjQpVVGFr2c2nwNLbsOxoeudaDMOiqtTKn7HTwXOsHpwXXVhqPMKXOB5K
	PgDNdhDj7UyiD7rcDkDbZ3UJtmJLeCPJuvqSewkTd8tgpCkE7JId/2xWFsGTQsCbpm6ufGz9/FGZS
	Yp2EcKlsiemYizSStSrIgGhPaYJE9NNpIw7ZzLJbSWRfszZGtULyM90ZxNxrvewJWxlaAZwj1o7nw
	F8WWLmFUEbuy27OBfvZ1Uxb9epxRfBq+WhgH5Ux+p8aqXoDxl64lNiU4bXeVdLSMoRvQHpxQ2TM2n
	2dvGmbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUyD-00000007noG-2hIc;
	Tue, 16 Sep 2025 12:39:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUyA-00000007nnn-48AF
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 12:39:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45de1084868so29769095e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758026377; x=1758631177; darn=lists.infradead.org;
        h=mime-version:date:user-agent:references:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gt0ZwE2fkLuC8Rptt0cI2XAd8Dj/MEqvhQxNXmrCN3E=;
        b=FrR0JTMvgiY1ikKKhx72eBjvYa6cOiCFXCi8Agck5g7pGH/E9o1YGrZbZaSdfJdJPf
         HcJ1e7Y12UketgdYutaIlhVb7jIh7IHopK3XM0E2suoc310zc3y8BhKLzup+pqJOAG7t
         Z5PvjFPgXJlmIA4nMMESUyh/Wvacto0SXaYlGbJnaI32pLoLMHPfj/lpUqwBiokoPRi0
         42i6q+91u0CncVf1rd+VPZo3GkW1HgdSjMoSptA0upe/ODliMvtUwIjuLqjgsPizOmUs
         RweVIKfLzWXCV997oF6kXZZNUkRPzaPoTEjNxlNUbjnjww7THn8dV7gC6PzLx5VEv2yf
         Z1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758026377; x=1758631177;
        h=mime-version:date:user-agent:references:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gt0ZwE2fkLuC8Rptt0cI2XAd8Dj/MEqvhQxNXmrCN3E=;
        b=SnLUWnEPXv7R75JxS03IHNLOHQPBk27nvlyx9MQt3VgbKwN2lA/fJzBpNfKCNlTWwD
         I6+5aqJ2fLfcOvgrnIRpenXw1+BCw8EXue2+tQFnnpJkk2OCDOUHF3IuwHWWyVtbpf1M
         5dZrjyLR65VCFpQshH+GlZX/fXgkcWOKmF4HFFm0P6Vi5S1gcftTmMo/MPAbdosOGoXX
         DKWKEz7+ZJhHlZ0oYEzwz1Ckeby48sn+4XPnkzKVcHyT0EdegP7sMBZ6s0VEaH6X2/mU
         krcCMK6CjGODF9AQcLcxJdTW4fT1sQEJ1OlMu2TDhtYc/dekHmSV+iijSh4vvPVk+7KB
         J3eg==
X-Gm-Message-State: AOJu0YzmDDV7MBHLFLHM7YE/y6XYsvRR/HjavBkkjRnHA4BTrlRhozdW
	J5GjFHsWNf+agnwh+H3cFVSniwHiFEkSxmWxGfOM3DgR0IXx4uf4xrXH
X-Gm-Gg: ASbGncsr4GzMGmgx880ABILJ27yl3y8qREQ+oIJoz6OyDNGL7n8+gjeFnBkUJnys3/C
	ZZydNC9uLK5lujKXZNNANCAvCh/EsA0Jn7l17OwHTmgF2UKZs+9FKliq23nL8bATwY+YwgfuCvr
	9uek2OyG97fYDSIC52GxmGuzeDG/98vFGfhz9CcFSo1Vnau61xG+9qtxZh0hJ/lGD+ZC0Cp31lw
	h4a2yFwvDOnCrJYh6G4lDnFfXW2CdaRxLOrmj0lDdqvcbudgYVgXj+pkI+NguEnbci32BpfuKb2
	fzQvWl/zU5Vy+q2/YrXXgmqKL9TXVa4ScsbBOft/5TY6O7N1A7+PzzJuCq5p6moCFV0RdNX9b56
	mt5wPlA5Tz1/Zb0rBCPAq7JH3K08=
X-Google-Smtp-Source: AGHT+IEDyzCIO/ZrWzZXXRqUqdpxBC3NkftkP3PMQ8QxO7unshVAe8c94K1S3RCZ/wnrdlM3sihzmg==
X-Received: by 2002:a05:600c:a4b:b0:45c:b5eb:b0c6 with SMTP id 5b1f17b1804b1-45f211c856dmr165318615e9.5.1758026376551;
        Tue, 16 Sep 2025 05:39:36 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e81dbf9acdsm14817927f8f.55.2025.09.16.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 05:39:35 -0700 (PDT)
Message-ID: <68c95a87.050a0220.362e95.5aa5@mx.google.com>
X-Google-Original-Message-ID: <877bxylgft.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-riscv@lists.infradead.org,  oe-kbuild-all@lists.linux.dev,
  linux-kernel@vger.kernel.org,  pjw@kernel.org,  palmer@dabbelt.com,
  alex@ghiti.fr,  wangyuli@uniontech.com,  chenhuacai@kernel.org
Subject: Re: [PATCH] riscv: kgdb: Prefer strscpy instead of strcpy
In-Reply-To: <202509161619.eJeLbfU0-lkp@intel.com> (kernel test robot's
	message of "Tue, 16 Sep 2025 17:10:50 +0800")
References: <20250915200644.200498-1-mikisabate@gmail.com>
	<202509161619.eJeLbfU0-lkp@intel.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 16 Sep 2025 14:39:34 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_053939_064992_3D753333 
X-CRM114-Status: GOOD (  18.36  )
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
Content-Type: multipart/mixed; boundary="===============2670830153457770895=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2670830153457770895==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Hello,

kernel test robot @ 2025-09-16 17:10 +08:

> Hi Miquel,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.17-rc6 next-20250915]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Sabat-Sol/riscv-kgdb-Prefer-strscpy-instead-of-strcpy/20250916-040750
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250915200644.200498-1-mikisabate%40gmail.com
> patch subject: [PATCH] riscv: kgdb: Prefer strscpy instead of strcpy
> config: riscv-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161619.eJeLbfU0-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161619.eJeLbfU0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509161619.eJeLbfU0-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/ptrace.h:5,
>                     from arch/riscv/kernel/kgdb.c:6:
>    arch/riscv/kernel/kgdb.c: In function 'kgdb_arch_handle_qxfer_pkt':
>>> include/linux/compiler.h:197:67: error: static assertion failed: "must be array"
>      197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>          |                                                                   ^~~~~~~~~~~~~~
>    include/linux/compiler.h:202:28: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
>      202 | #define __must_be_array(a) __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/string.h:80:40: note: in expansion of macro '__must_be_array'
>       80 |  sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) + \
>          |                                        ^~~~~~~~~~~~~~~
>    include/linux/args.h:25:24: note: in expansion of macro '__strscpy0'
>       25 | #define __CONCAT(a, b) a ## b
>          |                        ^
>    include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
>       26 | #define CONCATENATE(a, b) __CONCAT(a, b)
>          |                           ^~~~~~~~
>    include/linux/string.h:114:2: note: in expansion of macro 'CONCATENATE'
>      114 |  CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
>          |  ^~~~~~~~~~~
>    arch/riscv/kernel/kgdb.c:268:3: note: in expansion of macro 'strscpy'
>      268 |   strscpy(remcom_out_buffer, riscv_gdb_stub_target_desc);
>          |   ^~~~~~~
>>> include/linux/compiler.h:197:67: error: static assertion failed: "must be array"
>      197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>          |                                                                   ^~~~~~~~~~~~~~
>    include/linux/compiler.h:202:28: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
>      202 | #define __must_be_array(a) __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/string.h:80:40: note: in expansion of macro '__must_be_array'
>       80 |  sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) + \
>          |                                        ^~~~~~~~~~~~~~~
>    include/linux/args.h:25:24: note: in expansion of macro '__strscpy0'
>       25 | #define __CONCAT(a, b) a ## b
>          |                        ^
>    include/linux/args.h:26:27: note: in expansion of macro '__CONCAT'
>       26 | #define CONCATENATE(a, b) __CONCAT(a, b)
>          |                           ^~~~~~~~
>    include/linux/string.h:114:2: note: in expansion of macro 'CONCATENATE'
>      114 |  CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
>          |  ^~~~~~~~~~~
>    arch/riscv/kernel/kgdb.c:271:3: note: in expansion of macro 'strscpy'
>      271 |   strscpy(remcom_out_buffer, riscv_gdb_stub_cpuxml);
>          |   ^~~~~~~
>
>
> vim +197 include/linux/compiler.h
>
> 230fa253df6352 Christian Borntraeger 2014-11-25  193
> cb7380de9e4cbc Kees Cook             2025-02-05  194  #ifdef __CHECKER__
> 243c90e917f5cf Vincent Mailhol       2025-03-29  195  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) (0)
> cb7380de9e4cbc Kees Cook             2025-02-05  196  #else /* __CHECKER__ */
> 243c90e917f5cf Vincent Mailhol       2025-03-29 @197  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
> cb7380de9e4cbc Kees Cook             2025-02-05  198  #endif /* __CHECKER__ */
> cb7380de9e4cbc Kees Cook             2025-02-05  199

I was testing on the RISC-V tree, but I should've definitely tested this
on 'next' instead to catch this compiler error.

Since this is not too important, feel free to drop this patch.

Sorry for the noise,
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJlBAEBCgBPFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmjJWoYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyFRxtaWtpc2FiYXRlQGdtYWlsLmNvbQAKCRCWvoxv
2J1lZeTYD/9XO7FVYKCzIaCQhLxyHR3kNYkwsvWUl/OCr1dbInnW87CuFXOKZGY1
Skj7F1e8SQXoDWit5UvL7+C8MSH9KOxAmA4H5GFtQ2N/Y4cQlTgi5IjrxeWG42iy
NTG5FMkVxgVNh1QUJzwiz1RcC9HwVzsKPy0IcyaEoMcJ15bIjItWi4Q7ntyU+U+L
4yY+GWc5E/8li+RPDGW32eVvfejgwhJfdhrimINRHxfqcJdwVbmsj1hDgqecQP7+
w5xzHvcj8m/WP/tlJhGw0ed8NE3SQyIrTj23dr4aOD7XI2pOTyDHp2zRJgIDu5mA
zNzZ3PbesW7PwRKWmjCDnrYVgZolnZnjMvYTnfxfLQMLNaa7bCYPmf4j2BYrO2sV
XpYvqDM6vkL6fyrfnIpSnfeu603H90/jJPGRFgLUIpSJYumzu40XRlNVyvDGolSq
btqPneJ7XFKqHFDd3TsUqk//XQseTxGUFWh+ol27SYaGLxP/Y2iAMM5AaFCry7Rs
nVLtOAjPKfu0Nwopjn7FmLcwGG3QDEym4Pr9pxVSdThPLVxPlbGWZNk6reyiL8o5
JcgyiMFHI/u1PCgEsqJbur1uSzoQOEj4nYPBuVAZq0hYG92B7wpUUcFuxKlAtGmD
X3ys2ZjYEENYy/rcU/mU+6XeUjhVDCZ0Fkrn+NUBzuiMnmcwzvthwQ==
=KjrK
-----END PGP SIGNATURE-----
--=-=-=--


--===============2670830153457770895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2670830153457770895==--

