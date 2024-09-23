Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E82CF9C71
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 20:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+zW9dbe2qwqvxkp5A3uxJW2mz61fAPfp71f2DbZhZs=; b=tJY/Ke5py9EGimnqKLkta/bdof
	ZgplW0jZu3Y1HARnhJzJX2HldsbSJM5hbhCH6FfNhJWcW/Z+8NkNuS2GQeag3eiLBEePYDRxkPSMT
	5rpi7V8ODjJQjYquJ5OsDsGFbbh5FpW6RBtM+hanhnDwspd3BMv2zwZ7OHL5cAykUP8BPwjR/0EqJ
	HH3oDUuQN7HRL6P2vaOGbek/32tGYhvBNLcnPdkZXptAmFawkp8NBD4BKAPoTScOOOEnBUZRtdTc7
	lc479DrFTnqcbn0nuL40HBzfL0ckRl45ev0s6c/DulGQwV5KtOyNQF4ZyHw8YrJwqY9gjB1cOqkZ8
	lZ/3yhgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sspTu-00000000Qkt-18MY;
	Mon, 23 Sep 2024 20:16:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sspTr-00000000QkP-1JqV
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 20:16:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso61308185e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Sep 2024 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727122581; x=1727727381; darn=lists.infradead.org;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ODlh4cLidNTSOTpYrIetwaeNVa192xg+fpWel7GtfsI=;
        b=T1/Fxh+r8m82enOSczIOXPCMrvxddjjSoI/O1TEVsHpShvRi7OvzEDW5CASJWKQ709
         TU/x2pbGAo6frwVCq+TqOtQH8whikFnN26yeI6b8986APbBJ9yJFVzUNn07B8rJKSxOf
         k6L9OuQ8g1alugrKwYDje4YI92SA08iqaFbyMiWPj/W1YAvSiAQxyAMjMfjIRT46Pxcl
         Y9m6HkKAR70kfm7+c+qTP1ETU8S+exdE0NBkmSCpentfvaqivbfjcPxO4NL0DiDOi99w
         xlgwnDs/hK+Tozlv8acVdUh9SUJK0HT5YYtpWyixcKQCKIH8z1OZNKeb4C+trYcT0fhL
         2xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727122581; x=1727727381;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODlh4cLidNTSOTpYrIetwaeNVa192xg+fpWel7GtfsI=;
        b=kcWbrs9ZJP+Z9oNexI+kuIJNz5ZrTgvJrk5HPE1rkKVQZSHDTzYFCWBkLvNAT9vv61
         /iJjYHS6hpcjrJcvV+b3ml+ROE1/GG8G3tbpCnl67SOs+o7MvGIhEDRbXZWPdaML+TjG
         RA3P8PXwdeATKRSkXGZtopLBYaKKuknOHETc2YoitT/135GiBTier2OA7DK+2VZF8Ep5
         qvQqm6xy5bV9PF2eKi20frt7h2i+0LxYjWyqM1R34QTvG84tPlDhQMk7jnvioFYNSG+h
         C2qPCtZr1F5Bs+qyq1cUPLgzZP34qDV7Hg+dOiyuDCEhLOfqBR6vTZPOuF7o5Kk56fNU
         tQFA==
X-Forwarded-Encrypted: i=1; AJvYcCWnz/L8FZefjSrhNfHgQtiSssY3BrZKT7MzWpADIBTzPU+jCnQM5nBZdMP0rg9PcSGPFDH4lzxIc+Fu/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiolOOjC35pWItHuxh801+s0BG/jUBIg/MQjcn4Pc5Lzsv6LRx
	juK+Nr4jAtpw9249f6Gvrn7BvAShrplj9GaQkNRaulLSWh756wYq
X-Google-Smtp-Source: AGHT+IFQ0Daau+k02GY2peTPcjNMZzS1+gRzCWmOB4DwjaGNyaEsEnxxLlRtIb+TxVm6KRweUfRK4A==
X-Received: by 2002:a05:600c:1987:b0:42c:bae0:f05f with SMTP id 5b1f17b1804b1-42e7ac2f2a5mr137826935e9.13.1727122580623;
        Mon, 23 Sep 2024 13:16:20 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73f99ebsm25280575f8f.63.2024.09.23.13.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 13:16:19 -0700 (PDT)
Message-ID: <66f1cc93.050a0220.bf7a0.30f3@mx.google.com>
X-Google-Original-Message-ID: <87h6a6gm7i.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,  Jesse
 Taube <jesse@rivosinc.com>,  Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [RESEND PATCH v2] riscv: hwprobe: export Zicntr and Zihpm
 extensions
In-Reply-To: <20240913051324.8176-1-mikisabate@gmail.com> ("Miquel
 =?utf-8?Q?Sabat=C3=A9=09Sol=C3=A0=22's?= message of "Fri, 13 Sep 2024
 07:13:24 +0200")
Organization: Linux Private Site
References: <20240913051324.8176-1-mikisabate@gmail.com>
Date: Mon, 23 Sep 2024 22:16:17 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_131623_380215_574C5E71 
X-CRM114-Status: GOOD (  22.07  )
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
Content-Type: multipart/mixed; boundary="===============0223258247251205135=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0223258247251205135==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dv., de set. 13 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:

> Export Zicntr and Zihpm ISA extensions through the hwprobe syscall.
>
> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
> Acked-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> This is a resend because I sent v2 as a reply to the original thread and
> it most probably was lost by most people. Fortunately Conor picked it up
> and gave it a review.
>
> I am resending this so it can be properly applied. Thank you for your tim=
e and
> sorry for the inconvenience.
>
> Changes since v1 [1]: the EXT_KEY instructions have been written in order.
>
> [1] https://lore.kernel.org/linux-riscv/20240817075629.262318-1-mikisabat=
e@gmail.com/
>
>  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
>  3 files changed, 10 insertions(+)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 3db60a0911df..cfd2929d0562 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -183,6 +183,9 @@ The following keys are defined:
>         defined in the Atomic Compare-and-Swap (CAS) instructions manual =
starting
>         from commit 5059e0ca641c ("update to ratified").
>
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICNTR`: The Zicntr extension version 2.0
> +       is supported as defined in the RISC-V ISA manual.
> +
>    * :c:macro:`RISCV_HWPROBE_EXT_ZICOND`: The Zicond extension is support=
ed as
>         defined in the RISC-V Integer Conditional (Zicond) operations ext=
ension
>         manual starting from commit 95cf1f9 ("Add changes requested by Ved
> @@ -192,6 +195,9 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         d8ab5c78c207 ("Zihintpause is ratified").
>
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZIHPM`: The Zihpm extension version 2.0
> +       is supported as defined in the RISC-V ISA manual.
> +
>    * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve32x=
 is
>      supported, as defined by version 1.0 of the RISC-V Vector extension =
manual.
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index b706c8e47b02..098a815b3fd4 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -72,6 +72,8 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
> +#define		RISCV_HWPROBE_EXT_ZICNTR	(1ULL << 49)
> +#define		RISCV_HWPROBE_EXT_ZIHPM		(1ULL << 50)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 8d1b5c35d2a7..910b41b6a7ab 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -107,9 +107,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *p=
air,
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
>  		EXT_KEY(ZICBOZ);
> +		EXT_KEY(ZICNTR);
>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTNTL);
>  		EXT_KEY(ZIHINTPAUSE);
> +		EXT_KEY(ZIHPM);
>  		EXT_KEY(ZIMOP);
>  		EXT_KEY(ZKND);
>  		EXT_KEY(ZKNE);

Hello,

Gently ping :) Can we get this merged for 6.12?

Thanks!
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmbxzJEVHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlbkUP/0FCi4UpJgRtrVl5dDUqdaHjpBh0
Un2ADisIcSFK92mP4NV7fDpsR+8wBb2rY0YNC6nNgSF0giyHTnuXliNaLG7QejSC
iiZtqXVsztctSsB5DYJ2KnqoGsec8xf7rX8fbwksGmwXI4idQwv1xy/JVyi8YYht
0QncnRXbX36w7Sv6D8Zo1An8xw9wv07mhBOgffUoVNJqtWU4LeuxOTwR2zs5XOkJ
1Sv1odbAkiQPACPE8/pJgfKgQry78uBaB90Nq7w0tQrswbXUAa5Lf0zeuiCt0XTD
aFWO9HRoQ2INlLlpZr6gsc7ejpZ1KXQYVr9sGhlydv+TCIqkVyNGQaYtmrmB5JYY
JOKMotB/PQSBKCV9X1C/UnK13l9sfRWLxENv6OUXDZ39P6s+CNFJXkW4ClxbWGIk
uJuP/o108qHBYK6YpYOSNa4EuJR35LJZoVknawyBJOVnHJw+aOJT91XypkfAyFde
zHsof2xtRmOP/SjXi0I6+paIV9ZX4/MXE524/FUcjbd2FjdM2DqbOPVI4qS4uIdK
l6G6lIMykrHK1zCdssCFE3j7MrLx6op4dKOj95wtg2DsfusN3IppP1+yoAbnIAvR
GlrfX8SuP1DwXxviLRaz8HivEuUV8M+U7/bdksha1K9q31EVfjTL0Pnz6L1samcM
r2ydSikhuBxycwry
=U4SI
-----END PGP SIGNATURE-----
--=-=-=--


--===============0223258247251205135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0223258247251205135==--

