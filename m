Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC164C4708E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2v9IpfYY7KDDixqE54by1TnMdLNNZdbsW4rI96F0FkI=; b=2Sy2hZB3j5WTC2
	tzf1jq2nqvzRbKEDg7zkO+5xTW6qjDBkfzcDvPfp+Zu2HI7tA7o7hJHvoMPNPRC9Z84wQ173ZCtrG
	18Y37k2Z8cWPc7pcNBq0pcpUREx04FOuQutmBg0ewzgNUCeEdD40WS76tCY0pvdClPjyczEmwRZD+
	3tS4wVpvakdduyYWkggPFL6LAPwUZ1vcWHjZLvRqr8kkZkG7SydmlyJX58PNyusn5wW3P8t5wJbHV
	EDHZhN6Y3+dK8fwwu9IEEk9kVHJKwo4FacskFv20D50cTRXm73pVtCCiVcVujbHwtBSCjhviOUyR6
	e3WS6ena6DiT3JFgbh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2waj-0063g9-1c; Wed, 07 Dec 2022 15:44:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2waf-0063c7-Kx
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 15:44:11 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p2wae-000435-9a; Wed, 07 Dec 2022 16:44:08 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, anup@brainfault.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 3/4] Documentation: RISC-V: Mention the UEFI Standards
Date: Wed, 07 Dec 2022 16:44:07 +0100
Message-ID: <3113825.CbtlEUcBR6@diego>
In-Reply-To: <20221207020815.16214-4-palmer@rivosinc.com>
References: <20221207020815.16214-1-palmer@rivosinc.com> <20221207020815.16214-4-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_074409_715193_B7A56F80 
X-CRM114-Status: GOOD (  19.35  )
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

Am Mittwoch, 7. Dezember 2022, 03:08:14 CET schrieb Palmer Dabbelt:
> The current patch acceptance policy requires that specifications are
> approved by the RISC-V foundation, but we rely on external
> specifications as well.  This explicitly calls out the UEFI
> specifications that we're starting to depend on.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  Documentation/riscv/patch-acceptance.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 16b90a31d267..02e6a48809ef 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -20,9 +20,11 @@ Submit Checklist Addendum
>  -------------------------
>  We'll only accept patches for new modules or extensions if the
>  specifications for those modules or extensions are listed as being
> -"Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
> -course, maintain their own Linux kernel trees that contain code for
> -any draft extensions that they wish.)
> +unlikely to be incompatibly changed in the future.  For
> +specifications from the RISC-V foundation this means "Frozen" or
> +"Ratified", for the UEFI forum specifications this means a published
> +ECR.  (Developers may, of course, maintain their own Linux kernel trees
> +that contain code for any draft extensions that they wish.)

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
