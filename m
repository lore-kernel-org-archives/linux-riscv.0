Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6711FC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 May 2022 09:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2FW0Te6rIFgpsxXXyTj2F9DxYydUogm49vyMZF0SL0=; b=TvAbpmw8YwcQNn
	i9rQ2P1sr6mNljlQrfCArI+MrBGZugTHBLUo3LO2kltbH5Ekh5Oftcx5cjcYhduQNhHnn5cmaOupO
	SpzcBkVY6R5iZiOJwomXzLsudSWMhexkbnjRUGISJ8Mo+ayr3oRW1BTYHvDSIfxVffF8kC8+hOp2t
	tPLqIlP5cjOEdltrw0+qpRNo1jRFp8h03VRT1f9ZePruLroPouWXdq4zow44EXdEhtWJGCE0iv7Pq
	PNdRdKH0Krq1rqxeyDbOpCtvm4SCIuESo+ul6khFlBMNWK5fgSxnLlKb51by6H9TDBPA9KYJLG5Da
	palULuE11IOti2BeCOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nusVg-001o7Y-Jg; Sat, 28 May 2022 09:13:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nusVd-001o6q-NU
	for linux-riscv@lists.infradead.org; Sat, 28 May 2022 09:13:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53F5560C5F
	for <linux-riscv@lists.infradead.org>; Sat, 28 May 2022 09:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22E3C34117
	for <linux-riscv@lists.infradead.org>; Sat, 28 May 2022 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653729199;
	bh=7bnoiHIViPgO9U0WBW7xtT2w4ftinyPcd5Qmfmeu5kY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eb2KkxmW/U6ZjycuVvCALb0qStoqFaa+17w+kMmOA792eQViI1RUTJW2omfWHCY+8
	 /p/mdBGBFl4IsVSBb5qf8j4HRupWvffVZ34Jiwt+G8bn+INuzkqqfqb4sXBQf+Q4oV
	 lgHRw8fC9K/pbxWBRnVloPMcCnkYXwrv9E1yRexYxWIEtTLZrOrwJJGKoekPhqE6yK
	 as1W3uhSrYFXTsSharfEBtivlq8QYti8lGBk2YosQ6wehjlO080YglenVjeSdwdsJi
	 81LPcxg2Fk2cymozZa7vTiT/OxpaJ2QDlVnMG9l/QQziU1owNdM58oGKiuDXyAvlkq
	 lnIoFTld2jIiA==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-f30da9aadaso1977274fac.4
        for <linux-riscv@lists.infradead.org>; Sat, 28 May 2022 02:13:19 -0700 (PDT)
X-Gm-Message-State: AOAM5322qPTpN34EwcbWCApjIxP3ixu5GdV/yfO2Tkf79UYmr2cw3Jdv
	OtJQ8UsDiW+tYHbWyz8JnVG/W8POyWVkjUp+nnk=
X-Google-Smtp-Source: ABdhPJxZtGgnd64LAweAANO6XIozQibeM29xEcVKUYcAJvUbDi+OAN2iDLx4o0nLK83aa5xyfeeYn2AwDK0IEfWRnrc=
X-Received: by 2002:a05:6870:eaa5:b0:da:b3f:2b45 with SMTP id
 s37-20020a056870eaa500b000da0b3f2b45mr6130869oap.228.1653729198931; Sat, 28
 May 2022 02:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220528014132.91052-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20220528014132.91052-1-heinrich.schuchardt@canonical.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 28 May 2022 11:13:07 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGmwwD==yOnzfYgPg8Bpz1POK7aPBULcuMdgS-E1G2EAw@mail.gmail.com>
Message-ID: <CAMj1kXGmwwD==yOnzfYgPg8Bpz1POK7aPBULcuMdgS-E1G2EAw@mail.gmail.com>
Subject: Re: [PATCH] riscv: read-only pages should not be writable
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	linux-efi <linux-efi@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_021321_840993_EFBBBBA0 
X-CRM114-Status: GOOD (  19.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 28 May 2022 at 03:41, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> If EFI pages are marked as read-only,
> we should remove the _PAGE_WRITE flag.
>
> The current code overwrites an unused value.
>
> Fixes: b91540d52a08b ("RISC-V: Add EFI runtime services")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/riscv/kernel/efi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
> index 024159298231..1aa540350abd 100644
> --- a/arch/riscv/kernel/efi.c
> +++ b/arch/riscv/kernel/efi.c
> @@ -65,7 +65,7 @@ static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
>
>         if (md->attribute & EFI_MEMORY_RO) {
>                 val = pte_val(pte) & ~_PAGE_WRITE;
> -               val = pte_val(pte) | _PAGE_READ;
> +               val |= _PAGE_READ;
>                 pte = __pte(val);
>         }
>         if (md->attribute & EFI_MEMORY_XP) {
> --
> 2.36.1
>

Thanks Heinrich

Queued in efi/urgent.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
