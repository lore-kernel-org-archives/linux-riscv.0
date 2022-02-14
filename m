Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD3BC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 09:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foVCAwJ7xDpyq2t48Vh0lPseuD/Nsv+5RwqYT6thLJg=; b=xiJhiCfum5qfeE
	EuvtCBD6qItsPZBFRtt5lj1+pclS2r8WaRY3jSvk3LNoIIa5LetQW7Hh+YpkHzy9ne0Se9fE2vfnA
	yN2EqEOuWzebEqNqR6LQCeEYDrgTrRs3f4A6pAbQFznA1hvD9DprNlr0xAlsbAYodMvM3l413D00j
	7shLChWOYf4yj1xSQkfwYWuSyY9zh5TfMz3jPZt9ub/KbWD2sdRySaAChc46OiPzdIFeu/90DwBEP
	ZWNi5TzHdrz4Uqt2qhsYyac+AyPdqcGURxqA8POlbGHzwYGD95ixjV8ZuEq5kY4FP+eaG3e5cEPrY
	kWG5HwORbArK/NR46uOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJXj9-00EFxM-Br; Mon, 14 Feb 2022 09:32:59 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXPl-00EBgA-4F
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 09:12:59 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Jxz5Z129sz1sr4Y;
 Mon, 14 Feb 2022 10:12:50 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Jxz5Y6ThLz1qqkD;
 Mon, 14 Feb 2022 10:12:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id pdJ6wzpt_XJf; Mon, 14 Feb 2022 10:12:48 +0100 (CET)
X-Auth-Info: i81bJA8adEdhuMnwODt1w9ZYPCIJmRzN5xVOLlFPDwvVOgLBggv7jog9GhkXrxg2
Received: from igel.home (ppp-46-244-178-131.dynamic.mnet-online.de
 [46.244.178.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 14 Feb 2022 10:12:48 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 375862C39FF; Mon, 14 Feb 2022 10:12:48 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Atish Patra <atishp@atishpatra.org>,
 linux-efi@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,  Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Anup Patel <apatel@ventanamicro.com>,  stable@vger.kernel.org
Subject: Re: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return
 value
References: <20220128045004.4843-1-sunilvl@ventanamicro.com>
X-Yow: .. If I cover this entire WALL with MAZOLA, who I have to give my
 AGENT ten per cent??
Date: Mon, 14 Feb 2022 10:12:48 +0100
In-Reply-To: <20220128045004.4843-1-sunilvl@ventanamicro.com> (Sunil V. L.'s
 message of "Fri, 28 Jan 2022 10:20:04 +0530")
Message-ID: <877d9xx14f.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_011257_387087_6E5196EB 
X-CRM114-Status: GOOD (  11.29  )
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

On Jan 28 2022, Sunil V L wrote:

> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 380e4e251399..9c460843442f 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -25,7 +25,7 @@ typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
>  
>  static u32 hartid;
>  
> -static u32 get_boot_hartid_from_fdt(void)
> +static int get_boot_hartid_from_fdt(void)

I think the function should be renamed, now that it no longer returns
the hart ID, but initializes a static variable as a side effect.  Thus
it no longer "gets", but "sets".

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
