Return-Path: <SRS0=xAtJ=27=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C3DC33CA3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2020 21:24:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D63B2082E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2020 21:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/7eFBLP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Zveaai5/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D63B2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:References:
	In-Reply-To:To:Subject:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maSb7NbKA8RvJCKXTu3J6eAjmLjqK2UyEvGtUUh/Ctc=; b=X/7eFBLPLYoAaS
	oPFMkCowd7gZu0Ws5h0jVMXqrK/9OJojhJ5QFJ3xMX33I/yo+LpdZG8MRH9DEwhD/DmEojljSG5CB
	B5TrIdB92XyO9IVi32rZaZVq0xzscPkoX4Wy3JiLZxDaLuHapeVg2thcnDDgTvfVyVS7As63guMDq
	D9EIsDJJGHo7XfV86JF/R7FaY4gTQqTIuEHpj8TXn0yAlpTMJsM8N8m4wlTMY70EfSL5rCa6cwCPc
	C16LVm66dIQnhfXLY6xnyKdaUTSokz6iCcXx9uK5clc/DeabGKrtA2cylq93ZUVZw2AU0b034VuAe
	GiI4VI8FTMEJ0n2diVGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iq1lX-0003yd-4o; Fri, 10 Jan 2020 21:24:23 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iq1lU-0003xe-9X
 for linux-riscv@lists.infradead.org; Fri, 10 Jan 2020 21:24:21 +0000
Received: by mail-pl1-x644.google.com with SMTP id g6so1324393plt.2
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2020 13:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=maSb7NbKA8RvJCKXTu3J6eAjmLjqK2UyEvGtUUh/Ctc=;
 b=Zveaai5/9cXZtqeck7OmqZP52tAyNc8qpNe54bieASVVuCSGAWQvdNywubCKZt6Hyc
 jNnNCwCwd8Ee41gYguC2uRH18nHbhLeMhwYhhsiL95t4hwBNtLU0YFFnT4+9zP3cQmOp
 QbfFuDHwqi2dIKCvd+JrRHK0iDIop4xNQKogoZ0Rlm3mJvNvhoqTJPR0fwaE97Pk9x7x
 JJgmYjp65pdZ3cKWseBYTBJGdpV+bnjAuALSoB+xk0vxiEGCjq74PzUx/TGaLTpUx7e4
 8B00vnCl0dPDfKT0akhxe1KhVh0zLsSzg6+NkRRtO8eO8Ytm5KMBep5wEYePm8LDTrm1
 MCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=maSb7NbKA8RvJCKXTu3J6eAjmLjqK2UyEvGtUUh/Ctc=;
 b=gue/fFvP1ap+4obSJVfpOCT3nDwB+jhz1P8N6CMdvaniZzfC1HXmob1malgpzdXlbP
 3YrJNVr5ICEie0/9OD3PR3gR9l5lwnphSvQLxTVu3LEnx1UgLycbs/qycGTniYbhWjxP
 qCb7SquyUdLPXo+vIHdgPjHvTB+6BTeD2t9CS7kklys4m1ok+Tlqe1wk94MKRlusI1cD
 RMc7CwsSmjqF/qLkOrMvgecMesDtENX3X2TQyNJHQHvf/mjrwZg9YsYNg9fPLRrfR5VC
 6bacb08LeBpOO8bhJN/dJ0Oo2VhDWRxjtB5GsGmaE7IEzC8X4dNu2yrs/6KikYV2bRJe
 p5/w==
X-Gm-Message-State: APjAAAUUlwM+O/YcoKG/EUW1lOku0g0ixtDnOJtHntaAjBK5FMJMk1Uk
 bChFRSd6lczXy7sMXppWYZhK8w==
X-Google-Smtp-Source: APXvYqz0xN3YzQi+V8Q6l0p+gowP+/bS/MOw7GEhPN3cUQ2tDIyWmEtQw9cQ4CP20+JsQGY+xUpETA==
X-Received: by 2002:a17:902:b609:: with SMTP id b9mr669024pls.70.1578691458706; 
 Fri, 10 Jan 2020 13:24:18 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id d2sm3914889pjv.18.2020.01.10.13.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 13:24:18 -0800 (PST)
Date: Fri, 10 Jan 2020 13:24:18 -0800 (PST)
X-Google-Original-Date: Fri, 10 Jan 2020 13:24:08 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2] riscv: keep 32-bit kernel to 32-bit phys_addr_t
To: Olof Johansson <olof@lixom.net>
In-Reply-To: <20200106232024.97137-1-olof@lixom.net>
References: <20200106232024.97137-1-olof@lixom.net>
 <20200106231611.10169-1-olof@lixom.net>
Message-ID: <mhng-d39bd2da-7e27-484a-b8f8-a96edf1336c0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_132420_358339_FA62C925 
X-CRM114-Status: GOOD (  18.05  )
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
Cc: Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 06 Jan 2020 15:20:24 PST (-0800), Olof Johansson wrote:
> While rv32 technically has 34-bit physical addresses, no current platforms
> use it and it's likely to shake out driver bugs.
>
> Let's keep 64-bit phys_addr_t off on 32-bit builds until one shows up,
> since other work will be needed to make such a system useful anyway.
>
> PHYS_ADDR_T_64BIT is def_bool 64BIT, so just remove the select.
>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>
> v2: Just remove the select, since it's set by default if CONFIG_64BIT
>
>  arch/riscv/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a31169b02ec06..569fc6deb94d6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -12,8 +12,6 @@ config 32BIT
>
>  config RISCV
>  	def_bool y
> -	# even on 32-bit, physical (and DMA) addresses are > 32-bits
> -	select PHYS_ADDR_T_64BIT
>  	select OF
>  	select OF_EARLY_FLATTREE
>  	select OF_IRQ

I gave 5.5-rc5 a quick test on a 32-bit QEMU with 8GiB of RAM and the system
wouldn't boot, so we've got at least some bugs floating around somewhere.
Given that this doesn't work I don't see any reason to keep it around as an
option, as if someone wants to make it work there's a lot more to do than make
things compile.

I've put this on for-next.  If anyone cares about 34-bit physical addresses on
rv32 then now is the right time to speak up... ideally by fixing it :)

Thanks!

