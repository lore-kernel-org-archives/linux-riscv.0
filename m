Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6596C25B47
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 06:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBJtMB2CveLmja6LXvGoHzka5FSTkv7MoTu0jewmVQ4=; b=aDY+XcwPfMuXbq
	MpvIHQDd5T5n0BNXAgBbnYm7RxC0Zh36crxt88ssDMqAmgxOITcpmgV8RFoQtTuUDrGH6PR8l2OM7
	cSoLpkIfTaC+wdGQedHhYIwsh9gd6O4HuoRG2MePXdYtaAF29RuDoHWjNEHJVN58BslUTAeiSWZiz
	dcjfnF1RXbfEj52VqbKfQsBjcI6+nLA5huRenwotL4rowAWaKtZSAcbWY4aEwooK4Qih0GCiv8NF5
	HpEv02oAEcqKdjkM6i/+EgawcfN6gymRbLIBu3OBCzHAVvYXlQyaZr7KsI/QMx48bXCmaAsNgXqM+
	AHuvLpWvnIBznQuv3bXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvXj3-00BVtG-2r;
	Wed, 25 Oct 2023 06:50:45 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvXj0-00BVsQ-2v
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 06:50:44 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9be1ee3dc86so763290366b.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698216640; x=1698821440; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MwdrCLs7J8pw9TLHstYCMVRsUZqiCP56vCN/PW3QTMo=;
        b=ilgMQqh+ScKAUfbJbkqBlnpITvypGUvKIiS2vLDNrctR9cMA3GAhbvjqUJrRZbwjpF
         PK+kYBd1cK9unugBBD3i8n4v5BHmPeShB5/BnWe3imzAg21yFlfo6lX/zrW5iUjryQTY
         gRbQ9Xpm2BS7vfDR10iKp1RJPhjJCzjv1cvZEC5udMCMs+Nh3f/OJWi44c8/0arP6631
         90lHQvv9O9ewN8SjtkstAaIsvJdH+J57Sifv/xahtKQdeA6elSEBC4fJfP49cETLKv4r
         U/6Ki28a6NgKR5HQuO5w+holFDQbBNz3Xih6mgumGI87ht0A4ORHEu/HPh+Asqq8lAFs
         D5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698216640; x=1698821440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwdrCLs7J8pw9TLHstYCMVRsUZqiCP56vCN/PW3QTMo=;
        b=aibcCJ+pzpT8Ac4EU2zMaemCjgpupG1RlIMqZyGPbF1wFAZgKeZxUomPqDq+vLl3io
         rXgfNKBYltQx2JpMqlngmGHhzDNn+Kz/HfDjIJl8LOhlTxSirPz1vrzrjSB8+1dixZtd
         nByimd8fDRBO598PpACx8wmr1sUPsERV8tHid9iX7+g96Kx1gQWftcLV6EFNaSvNTNZQ
         usMHQIMVoQkr5N9pq5fXV+u3nW3EZqxQOGDUYXA5GwbDttzX9B7XR4U4kzuyqDj2+gQy
         RgPRI7agDIvcw99sSfRsA4TdMDoFNwQBW+mjAb+JnZXKIKar2E+qwqkb9LcXVqjXxg8l
         kjBQ==
X-Gm-Message-State: AOJu0YxVQ+LJKCOL3N175fer3j/2tM20jVO4QG5pUsAUNCkL+R2RrGMc
	KCVhrUcXDpdqMKk30si+oaIboA==
X-Google-Smtp-Source: AGHT+IEHX75CQrrE1AAOHnqkbOnbbTtmku7y2INZej13eNL87gyTFaPI5KTEJpDz3xLYzWLGvD/1wg==
X-Received: by 2002:a17:906:dace:b0:9c3:730e:6947 with SMTP id xi14-20020a170906dace00b009c3730e6947mr11584331ejb.41.1698216640370;
        Tue, 24 Oct 2023 23:50:40 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id s18-20020a1709060d7200b009cd52d08563sm678032ejh.223.2023.10.24.23.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 23:50:40 -0700 (PDT)
Date: Wed, 25 Oct 2023 08:50:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/5] riscv: Use SYM_*() assembly macros instead of
 deprecated ones
Message-ID: <20231025-d21b7077ff99828bef7cfaa8@orel>
References: <20231024132655.730417-1-cleger@rivosinc.com>
 <20231024132655.730417-3-cleger@rivosinc.com>
 <20231024-e122c317599cd4c6db53c015@orel>
 <da308888-0e47-4ca4-b318-8f089421dc0b@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da308888-0e47-4ca4-b318-8f089421dc0b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_235042_954566_CA2BE546 
X-CRM114-Status: GOOD (  16.95  )
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

On Tue, Oct 24, 2023 at 08:03:52PM +0200, Cl=E9ment L=E9ger wrote:
> =

> =

> On 24/10/2023 17:23, Andrew Jones wrote:
> > On Tue, Oct 24, 2023 at 03:26:52PM +0200, Cl=E9ment L=E9ger wrote:
> > ...
> >> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> >> index 09b47ebacf2e..3ab438f30d13 100644
> >> --- a/arch/riscv/lib/uaccess.S
> >> +++ b/arch/riscv/lib/uaccess.S
> >> @@ -10,8 +10,7 @@
> >>  	_asm_extable	100b, \lbl
> >>  	.endm
> >>  =

> >> -ENTRY(__asm_copy_to_user)
> >> -ENTRY(__asm_copy_from_user)
> >> +SYM_FUNC_START(__asm_copy_to_user)
> >>  =

> >>  	/* Enable access to user memory */
> >>  	li t6, SR_SUM
> >> @@ -181,13 +180,13 @@ ENTRY(__asm_copy_from_user)
> >>  	csrc CSR_STATUS, t6
> >>  	sub a0, t5, a0
> >>  	ret
> >> -ENDPROC(__asm_copy_to_user)
> >> -ENDPROC(__asm_copy_from_user)
> >> +SYM_FUNC_END(__asm_copy_to_user)
> >>  EXPORT_SYMBOL(__asm_copy_to_user)
> >> +SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
> >>  EXPORT_SYMBOL(__asm_copy_from_user)
> > =

> > I didn't see any comment about the sharing of debug info among both the
> > from and to functions. Assuming it isn't confusing in some way, then
> =

> Hi Andrew,
> =

> I did some testing with gdb and it seems to correctly assume that
> __asm_copy_to_user maps to __asm_copy_from_user for debugging. The basic
> tests that I did (breakpoints, disasm, etc) seems to show no sign of
> problems for debugging. Were you thinking about other things specifically=
 ?

Mostly just backtrace symbols, but I suppose we can live with it, since
it wouldn't be the only weird thing in a backtrace.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
