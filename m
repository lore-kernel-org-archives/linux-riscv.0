Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E508C25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EsNqavWdLRYHb4/EkatxZtn0FV7Itjza7GQMahXIGkQ=; b=kV5jQbXu3YL+B69bSr9oP0g3MD
	aRfnpECiugZdUWxTM8yGa1UIBSBAQ7mLIhm3y9q/01NKOiAp2v9cXrKxCw3Jt+k5pp8OqBpdz15H0
	aH/YjaVPac0Byb5tp+PRkvosBc0k0IU26YkVvGyrukZND1V2nHPA09BYxTKMMakTDjd0aWZWsA9C/
	edzn9KkUa4P4Qr8z+OSZxjZ5pcts0odO7FCA00/zgiizrS4fsVydCOSd7nNd33BqjPDSq4r+KXjDC
	QZ+bWR3KKuH633/O4vFbBdKlgaI9UstCp4bWTgMjRoDNVn5QXtzjpb7DZ0AJTY3qjXwl2vxnoRMEo
	iCp0ZZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAr-00Ab7S-CA; Fri, 12 Aug 2022 16:06:13 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAj-00AapI-LQ
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 16:06:11 +0000
Received: by mail-pg1-x52f.google.com with SMTP id r69so1162594pgr.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 09:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=41thsikUnOBpKquX0yYprBquXZl/i18xaq4QyWaaIsM=;
        b=xMie3ATRikq2kM8y0hVHSflq23R37Ac4oWTXyxzw8X/J2+ujetldHkylrIisKSY56F
         mK/L3edNwRz2qteRFb104sxOBeX3qIZwsBOjV+WAvV6mf9TDAqASoU5SUanjjr69IJSH
         UefBOT62akqXiDRMFIHQNPw6BsJq1QrqOEW29LfwAPswv1mhDMEBXJllQjIXu6kxj4Rb
         SXmkqBUdaFVlwn7UMhfjq/DKovpTNeqg6GRx1kR6SkkfACEyn9RJ96P3UNEyAIbPWx/2
         AQCphAbeTavdE7z1mg3kmTAvRhw1U0zwNmN95+Xu2IiZUtSNw9LeyWTut0G51oo0v7FZ
         pxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=41thsikUnOBpKquX0yYprBquXZl/i18xaq4QyWaaIsM=;
        b=HqmvA7lYY3x+RpAfF49iE9nj3lPOgA/QmFpcQlPG1vjUrlnzu3n71pQ4SMzlFO5T4i
         LqbcmggZDluNokpny8BcGRrw819VCRF1RqRJKxeyuMIN3+CeiZ3g1p3Ssk/hMJUDiQSt
         wfBHts6JjWcUZnlx9LFpMQ9PRltHqvsANdOls1jCB4LrUGwOQfAvRV/ySMhb21Ns717p
         9jy2HHhSiXx77nfHhas1aZq2lsSl7uTpn0CqP59fQKlAT3yW8oAUM+7dYbJtDMA2WrD0
         hR160BlDZ07WzzHtzxKX7ITTEtkmkKdiKCmdZrJseCgi3wn7mWSe/luPIDEFiEF0vDul
         vd4w==
X-Gm-Message-State: ACgBeo3lw7sLiWkjlrKxsPPlWQ+3xk/K+OeHHGKLf2vfMYj1lvqbzEtD
	zysxq9M613Ul+aAaREZjQFMF3OeScB5svg==
X-Google-Smtp-Source: AA6agR7oAPWWLooILnq7zpDcgNbqnrSNRPkblXezUf37CFyPppecZcwSGwlmQd4pgn0vJLKh5PdTig==
X-Received: by 2002:a65:58c2:0:b0:41a:7581:c921 with SMTP id e2-20020a6558c2000000b0041a7581c921mr3663836pgu.532.1660320349295;
        Fri, 12 Aug 2022 09:05:49 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id oo10-20020a17090b1c8a00b001f4fb21c11asm1718420pjb.21.2022.08.12.09.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 09:05:48 -0700 (PDT)
Date: Fri, 12 Aug 2022 09:05:48 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 07:48:20 PDT (-0700)
Subject: Re: [PATCH] wireguard: selftests: set CONFIG_NONPORTABLE on riscv32
In-Reply-To: <20220809145757.83673-1-Jason@zx2c4.com>
CC: linux-riscv@lists.infradead.org, Jason@zx2c4.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Jason@zx2c4.com
Message-ID: <mhng-d7e501c6-589d-4db0-b461-6daee3dbc95f@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_090605_801962_DE581836 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 09 Aug 2022 07:57:57 PDT (-0700), Jason@zx2c4.com wrote:
> When the CONFIG_PORTABLE/CONFIG_NONPORTABLE switches were added, various
> configs were updated, but the wireguard config was forgotten about. This
> leads to unbootable test kernels, causing CI fails. Add
> CONFIG_NONPORTABLE=y to the wireguard test suite configuration for
> riscv32.
>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Atish Patra <atishp@rivosinc.com>
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Cc: Guo Ren <guoren@kernel.org>
> Fixes: 44c1e84a38a0 ("RISC-V: Add CONFIG_{NON,}PORTABLE")
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  tools/testing/selftests/wireguard/qemu/arch/riscv32.config | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/wireguard/qemu/arch/riscv32.config b/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
> index 0bd0e72d95d4..2fc36efb166d 100644
> --- a/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
> +++ b/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
> @@ -1,3 +1,4 @@
> +CONFIG_NONPORTABLE=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_MMU=y
>  CONFIG_FPU=y

Thanks, this is on for-next (still planning on sending the PR for 5.20, 
things just got a bit hung up on my end).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
