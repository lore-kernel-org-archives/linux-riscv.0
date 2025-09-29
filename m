Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E13FCAC5B0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 08:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fza5yyYRYEx5zmfc+cchU3hSxmLe6wViK9LiWgpff+w=; b=HSrrI4dE4J7XzXfHFVHdmgzWty
	4lR0EU8EvnNFm8THelUrz23L9c/vNNeSddEC8Z06re1f6c1sMRN9noCpr8LiqGb1hWBUocrQfIZv3
	Jt0tRtiLYbu4lzrrATqKYHSWMxvfx26D+XwZkueFYc7rSsMt8oseNXug0JYXOFRUaVQGB3taSJoen
	QQE1IM4egiasHKt5PASE/au5c/z9Wu9TjZUeDh/7M6RgkuK+nfMNrVrjAYUFfefHSLOKfg1ggKMu7
	R3JPjNxVzIOv78zqMTRc82H9tytg7cKhM1O9W1w0WahFDl17lY80pXbBq9RNXieEFw4YIufWnU2vB
	e/ABd+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38vj-00000001jN4-1wRY;
	Mon, 29 Sep 2025 08:08:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38vg-00000001jMO-1qW6
	for linux-riscv@lists.infradead.org;
	Mon, 29 Sep 2025 08:08:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e47cca387so21461385e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Sep 2025 01:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759133294; x=1759738094; darn=lists.infradead.org;
        h=mime-version:date:user-agent:references:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GVUj56PTBElUdL5rbfLGdPrTXQDNa/dgDh2G4V1z2Tg=;
        b=MQaATDQPIEgNt5Zh7RN//p+CeTsa0IawwmZFInvMHjoltzBUDaQp7wIbmK/nCNqsO3
         aTh402hW5zJBGihLWwMIud2WgLgbu2/vwhSp4MYjmaMhLK2yW5Juq9JB7rnKPNjkaRcv
         TKX6T1twp2iAsfgjOcg35BkZyn5OoNfra7sQijD1YqH1Xa76wZTJ8u5Zjcj6mwz17XBf
         WGdD3fCFf17RB3MRjV68rc2FcJ3xFWXlVdAh4/yAe6T/ax/J0iw//Z+EPPdDcaxXD4Oa
         Hh1gvzI3hZnWpjVJvnSlDelBsYIYIznvXTJl1qx6w+zIGbGRrsO9HTtKamI1ueIdtSQ9
         oYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759133294; x=1759738094;
        h=mime-version:date:user-agent:references:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVUj56PTBElUdL5rbfLGdPrTXQDNa/dgDh2G4V1z2Tg=;
        b=H7M2RjuN8+Qui3rN8Emi47j4PRJgNvaGAfWqWcFYUY6nhTTUPDR2GIIZYqWDv3XnH0
         xY23IH3rVfrmFxL2hXYQfZreCtHP59VAfA+4qoVPlGZASZlqrTAOdzzCwJI0xU2YCfWQ
         Nq7AmpNp1VXSq0UQy0b/moBsDhI0WlWDjycopHpOhcarS2hqriIsKdjIy7gCgpB7rtUf
         Xo9IFyVinkOsUpN7z7AICOx/+DdohLVcijp+J9LIvdL4Snn3OW3+tn6LXh70zpPZ9ofA
         hY2husjRfHjX73KnegIUVrA9/1C0tubz6eX4LB8UU9Z8bnwuV1mPANUwnPlWXGQJPRiE
         evfw==
X-Gm-Message-State: AOJu0YwAhBrCD40wLfWBq6Kc5Sr+4WGToo8XtCtKMlwAPxI/pqqIaUtE
	ObhsyIRlp4K8qY2Yq30E7UYMdeMsnHPcL0QOLVZTD3/VFBs2Pp0cGH66XVAEyImILhw=
X-Gm-Gg: ASbGnctYTqWHVJyJ/GB7N8D2d9pU9V10+espTRqzUEnkCX0WsqGB1jeEEP3FxemhaWP
	QAxd4O1AXMGofY2LT8vb+60ykDIXIXknZwYfLb1K6BL4Hq0NUzeMezzjMHCSQrpPd2VQCC+DXiB
	WBeXgzG9iz4Y5JvJgvcXwLztFeTxJnkPAtwlT/ln+ne+MCUO+/wA+ixhY7X3Xx7az2GaiQDXNIm
	HHeEdH7lNIqjSfGCIOxlJSxE8m0D4LoDxoohmBUrYwWRKpBSmWQ5cCuiQbQZZ548LDo4cLoZAYE
	zp5g+m9QE4wloUqDoPKskFndDqa7dyN965aNWdUzo+jMyN5/FnUfIsN65CABHni8eqLc639Kmw6
	NxApelCgrSIs2uQPb8vQ/Wz8uJCiBxhIIq5Vp4TFG7UPRfr2Q4jt0/Uax2nI=
X-Google-Smtp-Source: AGHT+IHI1PVHeNoXUhxNikFYnbqcWzMihaSMSG/MVn+wa3bjmjBsAoX15cYb0vlQ+YWd9XGgUfPh/g==
X-Received: by 2002:a05:600c:1394:b0:46e:1f92:49aa with SMTP id 5b1f17b1804b1-46e329c6355mr146802235e9.15.1759133294014;
        Mon, 29 Sep 2025 01:08:14 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2ab31f62sm215500625e9.15.2025.09.29.01.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:08:13 -0700 (PDT)
Message-ID: <68da3e6d.050a0220.c13dc.0f9a@mx.google.com>
X-Google-Original-Message-ID: <87cy79y93o.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,  pjw@kernel.org,  palmer@dabbelt.com,
  alex@ghiti.fr,  wangyuli@uniontech.com
Subject: Re: [PATCH] riscv: kgdb: Ensure that BUFMAX > NUMREGBYTES
In-Reply-To: <20250915143252.154955-1-mikisabate@gmail.com> ("Miquel
 =?utf-8?Q?Sabat=C3=A9=09Sol=C3=A0=22's?= message of "Mon, 15 Sep 2025
 16:32:52 +0200")
References: <20250915143252.154955-1-mikisabate@gmail.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Mon, 29 Sep 2025 10:08:11 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_010816_495299_332AFD3E 
X-CRM114-Status: GOOD (  18.71  )
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
Content-Type: multipart/mixed; boundary="===============8151825733828158823=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8151825733828158823==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miquel Sabat=C3=A9 Sol=C3=A0 @ 2025-09-15 16:32 +02:

> The current value of BUFMAX is similar as in other architectures, but as
> per documentation on KGDB (see
> 'Documentation/process/debugging/kgdb.rst'), BUFMAX has to be larger
> than NUMREGBYTES.
>
> Some NUMREGBYTES architectures (e.g. powerpc or hexagon) actually define
> BUFMAX in relation to NUMREGBYTES, and thus this condition is always
> guaranteed. Since 2048 is a value that is generally accepted on all
> architectures, and that is larger than the current value of NUMREGBYTES,
> we can keep this value in arch/riscv, but we can at least add an
> 'static_assert' as an extra measure just in case NUMREGBYTES changes in
> the future for some unforseen reason.
>
> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
> ---
>  arch/riscv/include/asm/kgdb.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
> index cc11c4544cff..66ff46e434fa 100644
> --- a/arch/riscv/include/asm/kgdb.h
> +++ b/arch/riscv/include/asm/kgdb.h
> @@ -3,14 +3,18 @@
>  #ifndef __ASM_KGDB_H_
>  #define __ASM_KGDB_H_
>
> +#include <linux/build_bug.h>
> +
>  #ifdef __KERNEL__
>
>  #define GDB_SIZEOF_REG sizeof(unsigned long)
>
> -#define DBG_MAX_REG_NUM (36)
> -#define NUMREGBYTES ((DBG_MAX_REG_NUM) * GDB_SIZEOF_REG)
> +#define DBG_MAX_REG_NUM 36
> +#define NUMREGBYTES (DBG_MAX_REG_NUM * GDB_SIZEOF_REG)
>  #define CACHE_FLUSH_IS_SAFE     1
>  #define BUFMAX                  2048
> +static_assert(BUFMAX > NUMREGBYTES,
> +	      "As per KGDB documentation, BUFMAX must be larger than NUMREGBYTE=
S");
>  #ifdef CONFIG_RISCV_ISA_C
>  #define BREAK_INSTR_SIZE	2
>  #else
> @@ -97,6 +101,7 @@ extern unsigned long kgdb_compiled_break;
>  #define DBG_REG_STATUS_OFF 33
>  #define DBG_REG_BADADDR_OFF 34
>  #define DBG_REG_CAUSE_OFF 35
> +/* NOTE: increase DBG_MAX_REG_NUM if you add more values here. */
>
>  extern const char riscv_gdb_stub_feature[64];

Gentle ping :)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJlBAEBCgBPFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmjaPmsbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyFRxtaWtpc2FiYXRlQGdtYWlsLmNvbQAKCRCWvoxv
2J1lZa/kD/0SS0w13cbSDsDAHnIMSkwzhsxBOPIOH+FnsVfA5umjAhSchivjDOVh
l6tl7s9XJoUH91fNuySbMOxgZvPa/TBHqBdImhKOqS+x9HtIAk8F4KT+RuXN28VH
dOrOjXLin/qksjl0t7BEDvLZMrK9l8DkKN9RluE0902wvQOIt/2sEQsm1gF3tndD
W8j7enoHf0A3nDEk71RcgtG3TVc4I4ds+9t5bE5xcZAOsftaW724lCsQMuL7/VAE
pzPnmHC/t4ksx/Hp+7RSDu15l6HHeUXy3lsVFVD3VXkHcX0fjdvtk8WGGzj/s7nH
LbWAOrHYJWW4vmHemAGbMq59AJFN/sHd0K81hfifCkOvFWqM4yx5W7dxhmyShaHi
t2I1Wh4Tg5UNRbRA/gCunnXhUvBPSgcFNWij+eWZskGG3HsHTREvWeSXuOScY6uf
ayKt3cL5DqhB9uh+CFD9//uaTmleZfVPNC/19w02CUmgUCFbKMRr7FyNkvjmUy+D
jEWP89FctIhttKlfff6wwFlQm8AmagxkqHg9WhQu1PY3a/A8NPbUxhR0FDZMxbjp
l5Mfj/5huZ53FM9XjzRUtFnCcEO4jfvedJUX3/6LDm4Fsx25BduXjZtUOdv0XJ3E
1Y+ND6zCVD17mtrwict9mI3B8Hd+EE8QoW9v7TPq7k/j2RT1leltAA==
=GfxR
-----END PGP SIGNATURE-----
--=-=-=--


--===============8151825733828158823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8151825733828158823==--

