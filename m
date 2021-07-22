Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60383C63793
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 06:09:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F9C60551
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 06:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29F9C60551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=WRrTagDf2mdaiETHUoRSuQ68DR5ro7peqytBOU9b3tA=; b=oNP/I0fjrCqUhmOJGK0mYHx+LZ
	5FkZt/tW4EWS54nOOFYSPD+yyalrksTtteOqTMQLCHGAzuH4oofQFyWfH818Q0Y6ApOmYU8jm6Uso
	K3rzDQljeHbPUYyj1TV/anZswO1evB9M38RuDzaWCy6d5iptLI6mASFiFXnSLuPXdNTzCDzXLhsq8
	B7ORoFtZP1w3n1rlKAEfaGA5J76xMCsPxm+bEsf7ekmNP63t1zcwsHr0eEVjU1159ya3/dLBTxEF7
	EuW+jw/adpjNENAL4p0v5bBTiZHG3MPPmqM09X/g53vLI7f6vZHkstHFdNmdnqb1GZFEewNdr3k60
	eqNgWBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6RtS-000Jnz-9B; Thu, 22 Jul 2021 06:09:14 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6RtO-000JlX-JS
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 06:09:12 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so4046649pju.1
 for <linux-riscv@lists.infradead.org>; Wed, 21 Jul 2021 23:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=JGZNlAbWwH8KnKtTTLQVUHCmfrYBjCcYZGAw8CpDvDY=;
 b=1evNGewArFpgG6ErFTJdQbJ3CgYm4mc2jK3DWn0rs7MMNuV61pPUXSYiijX0XfcXeO
 Te0ApunX5CtjlgRjmzUUZGDGaa4UJZMB1cvrno8V0pXCa8BLwkYiperEM0pDWx1mB3wL
 g/ar3PmfYDbuLzviAwHxbolEbwotsdsu5Ck2R0iwGhT9dtrBeuUTJApheQ+xzmWWEmBp
 aXoLLEaGEo/MX7tPz0MoAyV7di0Ph2EpTcXoc6wIdU7LgghMLNRF3B8XjfMY6TLl9seC
 RxjPXBSy9om7Rfa5/jqspLJPCCTxxg/H7Bv8NcsRV2hmGhl54PQ6OmpYbYzP9YgWVSah
 aA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JGZNlAbWwH8KnKtTTLQVUHCmfrYBjCcYZGAw8CpDvDY=;
 b=X9Ufyj8Nnnmoxyr0iiW9cUEHGkG0cHCi7YzGJYYhrETssBxgazdJ9zH4/IS9mtIpVi
 2TizM8osYfLm0lTzQ0Ffkqhr6CSaPKbTXceuNl6gVQKHp3TNxJLeCZKhNX/pD+7qB3e2
 zjngufH27izTEWKwKJb+9UJMNZv2mPVBOZEPEImQ3hd7kKMvkVon6jgJTw3Lm0M69E+s
 /vBFnvgwsg5VJ+a2VHnbsvKoupIt3s+aPMca62IDXP0ZS74ivtRa/1b+78eBCvkd5j5Q
 SmHRfKYQTBQT4b7pBbwK/XBb1VeFm3Gx1EaT9S62tK2FiE3i1OpMWCW+Zr+A10VlsQlc
 gmvQ==
X-Gm-Message-State: AOAM5336QCPzOb4v5T1oXWK1WUv/yY1ZtQpn4R2waaK8i2PL1uq4ye62
 bMzFwCtvJp/Lb8ESYiXpMaBvaw==
X-Google-Smtp-Source: ABdhPJwbH8JkdIu9/4V/l6vl783ox75sPe2K7cYNoJWAhro5WSE2yrNRSmzunbrlu3M2pVUVp8RyMw==
X-Received: by 2002:a17:90a:bc84:: with SMTP id
 x4mr7324526pjr.236.1626934145393; 
 Wed, 21 Jul 2021 23:09:05 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v69sm29927398pfc.118.2021.07.21.23.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 23:09:04 -0700 (PDT)
Date: Wed, 21 Jul 2021 23:09:04 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jul 2021 22:58:55 PDT (-0700)
Subject: Re: [PATCH 1/1] RISC-V: load initrd wherever it fits into memory
In-Reply-To: <20210629134018.62859-1-xypron.glpk@gmx.de>
CC: ardb@kernel.org, schwab@linux-m68k.org,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, Atish Patra <Atish.Patra@wdc.com>,
 linux-efi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 xypron.glpk@gmx.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: xypron.glpk@gmx.de
Message-ID: <mhng-34467fe7-5a31-4c88-a5ad-6dea683fcfeb@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_230910_684217_6C2EE61E 
X-CRM114-Status: GOOD (  18.37  )
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

On Tue, 29 Jun 2021 06:40:18 PDT (-0700), xypron.glpk@gmx.de wrote:
> Requiring that initrd is loaded below RAM start + 256 MiB led to failure
> to boot SUSE Linux with GRUB on QEMU, cf.
> https://lists.gnu.org/archive/html/grub-devel/2021-06/msg00037.html
>
> Remove the constraint.
>
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  arch/riscv/include/asm/efi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
> index 7542282f1141..649ab513dc99 100644
> --- a/arch/riscv/include/asm/efi.h
> +++ b/arch/riscv/include/asm/efi.h
> @@ -33,10 +33,10 @@ static inline unsigned long efi_get_max_fdt_addr(unsigned long image_addr)
>
>  #define ARCH_EFI_IRQ_FLAGS_MASK (SR_IE | SR_SPIE)
>
> -/* Load initrd at enough distance from DRAM start */
> +/* Load initrd anywhere in system RAM */
>  static inline unsigned long efi_get_max_initrd_addr(unsigned long image_addr)
>  {
> -	return image_addr + SZ_256M;
> +	return ULONG_MAX;
>  }
>
>  #define alloc_screen_info(x...)		(&screen_info)

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
