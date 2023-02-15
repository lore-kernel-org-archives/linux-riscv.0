Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC9C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWZi0VsnEWAmgCpM/ZwCVwTRq2yfBNaPwyP9u5uNmM8=; b=vZ/5Q3enoDeA9F
	gjhXPVUFd+r+FS/IE5QqWo4mlQfy5/SYR8wpVTK5uT6/Yw5xRwYQpHjO5yi1I86nWU04mrZA/hJ4+
	9p4Rtj/tswhoqZ3EylIFCc+SDdKRqi+wH4zafMxwD6/yDVaUJqJ/UkfwmnUZV6kRjdJYH7mYL4eqa
	b+ZBQCWUzL1M6oPWnUGEX/g5hsH7PIoxyDcxXVs2WZxRHjBncxWdPqmBMNw9lGlrIuO+d4uVw4+M+
	T66nkjl1JLuUP5EL7TnVg8opEvlX/++531FkUnukMyp6RgvT+CoGEJiX5K53EqgpOvY+l8lasdXMz
	cr4VRUcDsjH7eadLso6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSH7H-005ou9-G5; Wed, 15 Feb 2023 12:42:31 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSH7F-005ot1-8I
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 12:42:30 +0000
Received: by mail-pj1-x1029.google.com with SMTP id w20-20020a17090a8a1400b00233d7314c1cso2019181pjn.5
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 04:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SvSl6ThCdWqKRe4zYfnxgKVIEaSQwkIeIdBTFRT8VP4=;
        b=f5k6dXKGOzQe2OiwqhZWuJhlBG/hvEe1Xtdgd8K8uvklzP+vSCnptaYdFKKBDzk6Jw
         UD5rL/utjWjkowKEbm4C86tJwgP3AAW4e72/1ZKykKT+aQVrFVT+WLE6UZLTxfHTjogU
         scTesfe9gskIuu2MOOWGmyxGyy8zA7ITMlOj4HPuxSWrNWP50TJedU8fN75PeRHQauqA
         2iafASMsrjTtsC5FaLsWmNHaUzyb4SRYcUDdrlMn8qIvR7m9gO1hFwGSP7tErcukT86o
         pQV5SMkWPxYCU5Yx3IZ8U6WNTq6rHQsm6RriK/t1HgysWh5ITHkWbjBbIvnp0HuKqF3T
         NJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvSl6ThCdWqKRe4zYfnxgKVIEaSQwkIeIdBTFRT8VP4=;
        b=L+WaUk7SKCi7XxXVioGQpnbvkfL1ENoZJqrBaCBVHbB94eVbGf6G4P2wftVCNEvlWS
         7Qor8d0udZaDQTihvuwluqFHrgdcIe67GilxAywr7lqM7Jmn79KMgc0cCVgigug/P68T
         Guyah0nq4M/l0uGIcOLVWsvEuaXffCFSFz6w11v8wQkq+AazuX11JUbURRquFwvMVqqT
         NXBghesLaZwwDKDnUiM43B24/CSJI26Q88YSCwKNy6dJ5F4l9Uva/L6Ht60MBX/59Std
         PpTyMbxBONSiWBUzad+1nLepZjlEaiu7O7RHOxdzfJxDU5s9tACQ3DLLB05YzSdjcUT/
         bMWA==
X-Gm-Message-State: AO0yUKUR4/ee3sx/+Can12bnhSTNq+sX895pC9zUO4SQ3ZrhgMfC5c50
	ehI8Al3KG1Qs+DInBIe16FuKXBdD8KH6GTygAS+YDA==
X-Google-Smtp-Source: AK7set9xk53NZMnBPICoLZUVqQb9RhnSV1n12yQt1PuRnUTdI72hiz4+PIK1X6DLk8fsSd8wWAE1eY7iTZ2nkRjQOcE=
X-Received: by 2002:a17:90a:2dcf:b0:230:ae51:1cdc with SMTP id
 q15-20020a17090a2dcf00b00230ae511cdcmr461604pjm.120.1676464947685; Wed, 15
 Feb 2023 04:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20230215080203.27445-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230215080203.27445-1-lukas.bulwahn@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Feb 2023 13:41:51 +0100
Message-ID: <CAPDyKFpmAB9qwkZN_=HoydR2_oO6ARU3nc-aSoANeq6gRg6J5w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: repair file entry for STARFIVE JH7110
 MMC/SD/SDIO DRIVER
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: William Qiu <william.qiu@starfivetech.com>, linux-riscv@lists.infradead.org, 
	linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_044229_325558_D9414E55 
X-CRM114-Status: GOOD (  19.15  )
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

On Wed, 15 Feb 2023 at 09:02, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit bfde6b3869f5 ("mmc: starfive: Add sdio/emmc driver support") adds a
> section in MAINTAINERS refering to the file drivers/mmc/dw_mmc-starfive.c,
> but the file is actually located at drivers/mmc/host/dw_mmc-starfive.c.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> Repair this file entry in STARFIVE JH7110 MMC/SD/SDIO DRIVER.
>
> Fixes: bfde6b3869f5 ("mmc: starfive: Add sdio/emmc driver support")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks for the patch!

However, this time William needed to send a new version of the
complete series to fix other problems too, which then also
incorporated a fix for the mistake in the MAINTAINERS file. I have
decided that it was easier for me to replace the old commits with a
rebase.

Kind regards
Uffe

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 945b86f93cf7..74a30e724f7c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19935,7 +19935,7 @@ STARFIVE JH7110 MMC/SD/SDIO DRIVER
>  M:     William Qiu <william.qiu@starfivetech.com>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/mmc/starfive*
> -F:     drivers/mmc/dw_mmc-starfive.c
> +F:     drivers/mmc/host/dw_mmc-starfive.c
>
>  STARFIVE JH71XX PMU CONTROLLER DRIVER
>  M:     Walker Chen <walker.chen@starfivetech.com>
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
