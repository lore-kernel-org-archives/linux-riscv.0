Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4DCC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pd3q78/jMqqsQoXf4OGBKqHXZrk0tLzVJU0QNtMl//Q=; b=NYqZSL9vN4vMco
	VR2krypaWYQYX3J77Rwy5Mqj6XwI/Pfgek8fs0+PEoCVsnqT77nVYcZnkrfhnECHIsM0AAux2oGHs
	vfkjjRoIP5SSWubo7iRjiscbMEiNehdp3Qsr9JjMMIfyVL6fGndxkBxutcHLHw/t6SInrPT1B2GM+
	hazr1+TEkIwDLD6qiRPEKawMw0vmz1ROiDIqlw5orgfT5IfxB9jopnqtDNYliQth+QWQUT39yCB/p
	ApquoqF8dPaM4CeUjjQ6NPHFStRCGcps/07gKqlZ2lw57TpcTb7tY82ghG3NSNDAW3r+ZAOvdUwrL
	hpidillCbPL9wSVkv6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJGG-00AKn2-30;
	Tue, 24 Oct 2023 15:24:04 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJGD-00AKjn-2y
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 15:24:03 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53ebf429b4fso7159126a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698161038; x=1698765838; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1fviiS1AszYTyj2li+p8PK0RJzrCXpglYTVJAued7Y=;
        b=eUdxP2XwE59auSqQANWDrMkBqPl6jpRSgTRWohM0Vma+kjBADGtCl0jE4DKwMTkefV
         f0/bXNSslkHYVrvlOwTDTe8zrgW8nHHkLHSQuJmLTjD3oRj0mnQdat99S5fZ7VMjkjCw
         fyHzVjwiT4GSDxk2koZkFJ/9gubcIjRB7MDw3PsVzQJYhtFe42AcWqrBeFRsSrS9tZ0T
         ej/4De388eosybe8Tx2xu2ngU8+T/gEZQbfZtvPCZfm4qL9z3qtfzN09q8nbHID4CUbS
         1e9v+0vMVnX5wQgrSlBxJHWsEYj0gCkQ9/DSJUaUdITW2OF+o9UiZbrePfvTSXHYr/1I
         SpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698161038; x=1698765838;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1fviiS1AszYTyj2li+p8PK0RJzrCXpglYTVJAued7Y=;
        b=PTj+Dg/DOZOiASZNUgS4eAdx+WK9B4rOh2lbzSv3f0BaVzNZFV/QE2FnYfANWqeAtK
         N/gZgaiWPBvDXk+kOj9+7POxbkQRgpXOOxYGmZJhrRWUK/s8Ng9CN8rcqtkO0hqhOZpL
         k2hFuzFBrZhZQQVoCVZuJFYtsEJV71gn08IW7KW/DWtz3phUT8djf/flXLvPsZToB6mS
         RjMnvo1jRztM8OiuF9EPsxjfRdVj46k7jHcN0eo/L/6p9TNcmhl4NSDqoJXo5aq1n9iN
         t+o9rhpZ/E/J1uuuIviOxpwMvf/SeaKjPKGZoksc+GLBDS2UxXDrbaDRlGKv/1avVsuJ
         au9w==
X-Gm-Message-State: AOJu0YyjgdsV4x0wKhjLKaFQ1MHQoq/wsTicgr8eKkt2GoBj8J4OvchC
	csgSros1wY/ogcMlSYJ6sqQrlA==
X-Google-Smtp-Source: AGHT+IHosvnhTLuVYkeXIvJ7KzqWh5m4Y6kWu6GMxO2clq9pqbrTRL9hn3cSr81QKm1O62OOf9in3g==
X-Received: by 2002:a50:c35c:0:b0:53d:b6ac:5f64 with SMTP id q28-20020a50c35c000000b0053db6ac5f64mr9069019edb.18.1698161038062;
        Tue, 24 Oct 2023 08:23:58 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ch28-20020a0564021bdc00b0053ff311f388sm6572487edb.23.2023.10.24.08.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 08:23:57 -0700 (PDT)
Date: Tue, 24 Oct 2023 17:23:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/5] riscv: Use SYM_*() assembly macros instead of
 deprecated ones
Message-ID: <20231024-e122c317599cd4c6db53c015@orel>
References: <20231024132655.730417-1-cleger@rivosinc.com>
 <20231024132655.730417-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231024132655.730417-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_082401_968555_38748AF8 
X-CRM114-Status: GOOD (  10.86  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 24, 2023 at 03:26:52PM +0200, Cl=E9ment L=E9ger wrote:
...
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 09b47ebacf2e..3ab438f30d13 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -10,8 +10,7 @@
>  	_asm_extable	100b, \lbl
>  	.endm
>  =

> -ENTRY(__asm_copy_to_user)
> -ENTRY(__asm_copy_from_user)
> +SYM_FUNC_START(__asm_copy_to_user)
>  =

>  	/* Enable access to user memory */
>  	li t6, SR_SUM
> @@ -181,13 +180,13 @@ ENTRY(__asm_copy_from_user)
>  	csrc CSR_STATUS, t6
>  	sub a0, t5, a0
>  	ret
> -ENDPROC(__asm_copy_to_user)
> -ENDPROC(__asm_copy_from_user)
> +SYM_FUNC_END(__asm_copy_to_user)
>  EXPORT_SYMBOL(__asm_copy_to_user)
> +SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
>  EXPORT_SYMBOL(__asm_copy_from_user)

I didn't see any comment about the sharing of debug info among both the
from and to functions. Assuming it isn't confusing in some way, then

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
