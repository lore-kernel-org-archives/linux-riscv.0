Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232DCC433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 04:46:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E218420792
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 04:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QKVUvHh1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="gCf//hqr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E218420792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=gZV8Ma8kDY8JaDIXuRWsxWWqWHNLV4j6KKP4xiTd5Us=; b=QKVUvHh1WeaKDuhdJsaRK1xOH
	9Scpbs4Zvptsa5776JHGtO6ioEzHbzYw33d5c6RuyIx1BTydueOB0vcDXlYStNlhyGmxQqwWCxm3h
	nuQ/3xnAqINiXMQzgbLddEq9L8J+kw1cJNOZB9GUgyPWjJDmYLOzX/DHfTyl2LY3I4uW1rdTnLtAf
	Wept+37jAyf1gORoeXWx4WiD8Rbmxo1oEJWjlqMXspO2huxK0/bSKPhP+ojeXTmVCaqQsouuGRhJw
	GcXUKAws8MW9CHo01REwGhdr+nNpixmo6Ms0oVEBHKd+0fCJFYWkGuc7ba3M3Asklfiyyqs64hlPO
	jaaaSFH6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy6eL-0002ad-6M; Wed, 22 Jul 2020 04:46:37 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy6eI-0002Zx-8P
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 04:46:35 +0000
Received: by mail-pj1-x1042.google.com with SMTP id o22so523682pjw.2
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 21:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=p+1Zg+rcxW9W9uDo4bgbPd44JqLnl98/h6B7hdCMtAk=;
 b=gCf//hqrs62GJkXJuGGad1rarIOGvqn3r37DEoNV/vZtFeyKNDeLfQk70kHP3nTyro
 38KQBw4dK2Y/BWKSpLg1xYhnDPnUZtUjd7a2Ha37fC2bD6tzeRjv+LPApWyZGM/kMwkd
 gh3TsqQTgXrqJN1AaPSIWgunV8vIKH6OXSQJWhSbqLEpxDa+1RNtwDogGUYWBLK5T0/1
 k1JeyZDWt3f0Bo7qokEE1wDW/CLMPv/pFOm9V1V3b1/q1IsAX4WPu75JBd+2rbccpajn
 r5DE4EF/PgI3FZkyiqH48N0BZhS8MnxTlxWu26zEiKIS3uX11Db0Ta26Itli29LCvuix
 XF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=p+1Zg+rcxW9W9uDo4bgbPd44JqLnl98/h6B7hdCMtAk=;
 b=SYkZbUif5O9ctNUdcgZo6G4Nj9ZURKz089JMDl5cSqekC6oZaF+pCyXPN0M0WbaQ5j
 IJSHeNxy0OBXEAA3ThuMCL5co9Bp9MwUdNJWhbfDiDZCEQYoTpq1aoyviBPx/I+/YvD3
 maRx55ADyF9PNSuYfvfyDFSAGGtpYxgLTcjtyl7m5jCm0RFd0mhBxyAFtvwyecVzfxV3
 G76VVeyv8XN4ww+B0f2bV+dpVB9LD9udYCsOLKCImyUNYm3K346eshFrajOET7T1NDWM
 mz7PrqU9uOATnGn0BvIyiuDuvmynIs9l/C/u21DefnlmNKI+9kxRjS9IZSY01ctT9Qwv
 B9Yw==
X-Gm-Message-State: AOAM530y/S7yomR9w/PJCXim8fvLvqx0KG22G9Nn6qqEtzJxND2escqL
 wrwR/voHO5N8Tn/E8//G0ZHpsOFHH0A=
X-Google-Smtp-Source: ABdhPJx9RXCa2cd2bkgXO7d6w24bQWdI88P7ZrINXX0REFMfx/nbF2LCD4l4X2VAacAmHXbe+VusPg==
X-Received: by 2002:a17:90a:1342:: with SMTP id
 y2mr8133192pjf.98.1595393189642; 
 Tue, 21 Jul 2020 21:46:29 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 9sm21710120pfx.131.2020.07.21.21.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 21:46:28 -0700 (PDT)
Date: Tue, 21 Jul 2020 21:46:28 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 21:46:22 PDT (-0700)
Subject: Re: [PATCH] riscv: Select ARCH_HAS_DEBUG_VM_PGTABLE
In-Reply-To: <20200714212611.19692-1-kernel@esmil.dk>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: kernel@esmil.dk
Message-ID: <mhng-23ad157f-d2c5-4948-88dd-176b8be99cf1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_004634_466095_F913F751 
X-CRM114-Status: GOOD (  16.40  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 anshuman.khandual@arm.com, kernel@esmil.dk,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 14 Jul 2020 14:26:11 PDT (-0700), kernel@esmil.dk wrote:
> This allows the pgtable tests to be built.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>
> The tests seem to succeed both in Qemu and on the HiFive Unleashed
>
> Both with and without the recent additions in
> https://lore.kernel.org/linux-riscv/1594610587-4172-1-git-send-email-anshuman.khandual@arm.com/
>
>  Documentation/features/debug/debug-vm-pgtable/arch-support.txt | 2 +-
>  arch/riscv/Kconfig                                             | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> index c527d05c0459..c9a764c3c795 100644
> --- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> +++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 3230c1d48562..b4e674b1e857 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -15,6 +15,7 @@ config RISCV
>  	select ARCH_CLOCKSOURCE_INIT
>  	select ARCH_HAS_BINFMT_FLAT
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
> +	select ARCH_HAS_DEBUG_VM_PGTABLE
>  	select ARCH_HAS_DEBUG_WX
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE

This is on for-next.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
