Return-Path: <SRS0=xysQ=M7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C277BC4338F
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Aug 2021 12:28:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79DC061004
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Aug 2021 12:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79DC061004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cURRtv0PCR2TgqecR+obFjOAJ0tNeRcrpLRTsGNaDDc=; b=K0JP0hzcu52OOI
	quy5tB4UaxMsGRlYCwOJJxC2bzTJa42hlnnThs8rROU4g/NVfse+pYUnvkLdv4/dZnxn4dzLvqj11
	R7IwrhY1jXShhBJ47TCYoQPbbXbyPs7gLrP6jxILrGhjgc0EmzuqHvDq9/jx5OXmS41y4AtO/GY9Q
	DfS25V4V6/6wXDBR9KPa0Tpyo4EvZLi4wqhbupQqnUyGi/Zqno7g9bJ0Kc2IX33qmbr9wG1nEuh13
	7Oo6e9pGl91g2vx3yUOLWxVGlcW/FpuXYxs6gsv9wl3IQU7MaypSanfouKnZ1kU8EvmLSJcrJEUe5
	utSwQsj8KIP+N8nMyXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mChu2-00FoSe-Dp; Sun, 08 Aug 2021 12:27:42 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mChty-00FoSK-Iv
 for linux-riscv@lists.infradead.org; Sun, 08 Aug 2021 12:27:40 +0000
Received: by mail-yb1-xb32.google.com with SMTP id b133so24254738ybg.4
 for <linux-riscv@lists.infradead.org>; Sun, 08 Aug 2021 05:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=phMNIVj2qh5Du4B6LD+6E2MJYFQ9Q1V0OB1WzMXLNFU=;
 b=Jjrqo0/3RbtObZC7WL8AdwOuloACp+IvdwQwoWlUJ2BEcbiqhiF52mnRn3vori6fcR
 tLI6wo1l9tXONSW9culbVNy2ImUe5+k68c2YpGKxJ6aABynNsqDz2mSH8bPp/BLC5XU8
 Nz7anivszhrH5HUwc1iB/Oo62hDH22fVKaElg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=phMNIVj2qh5Du4B6LD+6E2MJYFQ9Q1V0OB1WzMXLNFU=;
 b=rBlxgqylkgFIJk1nNs1HKPk7sUCfvbXkCRMuJjw5w2rLo+WrAA5Dg3E2lWtGYH6MLm
 Y/O1yWv+PtNYcJG/uCbz60Aiwd38E618DPuZKg4n8bTzKfGgDC19/VqWmta6NaIZLY/v
 S/WRzhb8ADuQ0nb7T5KM2k/7TWYF1d+oAFSJy6QnYEVeb2ehPO50eVNeHJOTic1nLNM8
 xnmzO6/FVFZjs1bUb/XoChbsrsrPN/JJ88EC4Irj/vbVjqZCluysjDAph2A9vS/MaUOv
 taeg/LOos1o2Pa/0vSl1ez0Tq/hr1C08GjESq2i4ji+fe7hJB1oGMN6OsH3Z6wvuVNqx
 6pig==
X-Gm-Message-State: AOAM530XJqYC8QG4aBtcHCmhESoFXMzBg3p4kX+2sLzT5+RGhYSFE6k3
 szHgAFaBnMx6XcfQuVeZK2qOzq3EmkS7qWNpKewH2A==
X-Google-Smtp-Source: ABdhPJw+tMVd0eSGz+SyKmTaXzXcQaC8wPqbpS5lM1+UR5o7T8opjWH2YU9GIg6BOef3NCSdqDuK8Oi2NW7cd2X9emg=
X-Received: by 2002:a25:1f46:: with SMTP id f67mr24752430ybf.421.1628425656723; 
 Sun, 08 Aug 2021 05:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210721075937.696811-1-alex@ghiti.fr>
 <20210721075937.696811-4-alex@ghiti.fr>
In-Reply-To: <20210721075937.696811-4-alex@ghiti.fr>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Sun, 8 Aug 2021 14:27:25 +0200
Message-ID: <CAM4kBBKEU4zKkRJKe27Y0uvt7SN=K6HsyNMdPu7Y+WWyh7QRHg@mail.gmail.com>
Subject: Re: [PATCH -fixes 3/3] riscv: Optimize kernel virtual address
 conversion macro
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_052738_674431_0CFE293A 
X-CRM114-Status: GOOD (  16.05  )
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

On Wed, Jul 21, 2021 at 10:04 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> The current test in kernel_mapping_va_to_pa only applies when
> CONFIG_XIP_KERNEL is set, so use IS_ENABLED to optimize this macro at
> compile-time in standard kernels that do not require this test.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Just in case you need it, here comes

Reviewed-By: Vitaly Wool <vitaly.wool@konsulko.com>

> ---
>  arch/riscv/include/asm/page.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index b0ca5058e7ae..10dc063868f6 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -123,7 +123,7 @@ extern phys_addr_t phys_ram_base;
>  #define linear_mapping_va_to_pa(x)     ((unsigned long)(x) - kernel_map.va_pa_offset)
>  #define kernel_mapping_va_to_pa(y) ({                                          \
>         unsigned long _y = y;                                                   \
> -       (_y < kernel_map.virt_addr + XIP_OFFSET) ?                                      \
> +       (IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ?     \
>                 ((unsigned long)(_y) - kernel_map.va_kernel_xip_pa_offset) :            \
>                 ((unsigned long)(_y) - kernel_map.va_kernel_pa_offset - XIP_OFFSET);    \
>         })
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
