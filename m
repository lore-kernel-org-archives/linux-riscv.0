Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B00C56202
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 22:23:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FA5B206D9
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 22:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jk0wA6yD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="CuHq7PCb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FA5B206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xsO2cJIUUdRXOO74ID8a9IILQ9v9C99JblUw+KdfDU0=; b=Jk0wA6yDmjOv7nxoUGsqQuv/v
	M9eDmsE5D/nZWJVNYFSTnZZRHlVXjRwxS/RoZiwMg05euwMrUDqUiOmPZN5abEtd/RA1zMbAFsQJA
	PUUehua1KjEFz5RpC1r9g3xR0qpXvAm4lkGF0mwSiCtq1DccSwBUGuW8fU2BNaYTOibd1DISLeAmn
	lAMGoGnSzpjcmqZxmQg9OQ6wrOTr2ddU6YMaAifMVErGuJOhhu67oNoWxJ9c2uV9RsdZTU0I/Jmg8
	ll61k5K0YxMaNsYwpoTqpVX+Rvkj8kXnkvw+2pMtBUyFbEaMOGes0qfA1AgBWai86iB44u1xm9Ha7
	bsELEc9Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki3CI-0004aE-Qr; Wed, 25 Nov 2020 22:23:34 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki3CF-0004Zk-HK
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 22:23:32 +0000
Received: by mail-il1-x141.google.com with SMTP id w8so55242ilg.12
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 14:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P4fSseuUDkF72EVISoG/Otds+xMHGbUooGtI19qB6eM=;
 b=CuHq7PCbfrHF0SPoiaoJXMYDNgo8HlTyg5TQ4xZaSdJUq/QWlEHE1GpA9W+CUAYnr1
 y+M0ONnzSsWa754QAYsQCD77c10HvzvC2gU72xPOPVivW3h2r4u2A+DhbcgmHwV9Tmpq
 gQiXMP0UqGi3PhZrry2As1JEk4xtHJ3vXVK0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P4fSseuUDkF72EVISoG/Otds+xMHGbUooGtI19qB6eM=;
 b=lo1FM3/yVTJkW9El/dmxki1BnMrC/Ne97+iHJdbfHn3UJ/naIR5NgKEcZJeoJ/z0FZ
 6JpPVazaSDRO016aHY0KQBWsMpPl0ucj0TBOGSf6FYgU75ZD8RyUMqmIj+Bi1RAcbdxP
 I3lng5g+QoT1CqbHlaHbLa9sZ+H7HmwULRwA6x6fxcS93aW3EBE/lZiUZCFIOwldo3BI
 /S73/REXWIC06SbZ74VkjFd4LyoMyd7NNMuCE7FfTPC1XEP16FHbja/6KdWibM4Nagvy
 uzl7y4PcUB4iBOSDaMK8K2Gv4qELUllXQdHt7oeBU2WPO10gQUfC1olvXQf72wlEXneD
 1aBA==
X-Gm-Message-State: AOAM5332B8DxuFaeDy7iZvBgGlLQAR/o+lHXeRBKSKVSoyujn/s4EZiE
 CFDk2dSudKLaf5xRKPPDg0pnDa9yl+eRu02u0Gw6YsiNACyM
X-Google-Smtp-Source: ABdhPJwwuYvxJ6HvFMi1Q0K59YCEOU141q4wr394wJ/Gfa4gkkBlYcl1CtkE+71tMasA+4XVM3u6ED3Ck9PWWcVBEZ4=
X-Received: by 2002:a92:d588:: with SMTP id a8mr5209085iln.79.1606343009520;
 Wed, 25 Nov 2020 14:23:29 -0800 (PST)
MIME-Version: 1.0
References: <20201125195703.3780383-1-palmer@dabbelt.com>
In-Reply-To: <20201125195703.3780383-1-palmer@dabbelt.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 25 Nov 2020 14:23:19 -0800
Message-ID: <CAOnJCUJy1Jai2YBTfOOnKUmx3vydFwchD7dRLacL8iTDihbpKw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Define get_cycles64() regardless of M-mode
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_172331_592315_BE03A1DB 
X-CRM114-Status: GOOD (  20.77  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, kernel-team@android.com,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 25, 2020 at 11:58 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> The timer driver uses get_cycles64() unconditionally to obtain the current
> time.  A recent refactoring lost the common definition for some configs, which
> is now the only one we need.
>
> Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation for M-mode systems")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/include/asm/timex.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index ab104905d4db..81de51e6aa32 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -60,6 +60,8 @@ static inline u32 get_cycles_hi(void)
>  }
>  #define get_cycles_hi get_cycles_hi
>
> +#endif /* !CONFIG_RISCV_M_MODE */
> +
>  #ifdef CONFIG_64BIT
>  static inline u64 get_cycles64(void)
>  {
> @@ -79,8 +81,6 @@ static inline u64 get_cycles64(void)
>  }
>  #endif /* CONFIG_64BIT */
>
> -#endif /* !CONFIG_RISCV_M_MODE */
> -
>  #define ARCH_HAS_READ_CURRENT_TIMER
>  static inline int read_current_timer(unsigned long *timer_val)
>  {
> --
> 2.29.2.454.gaff20da3a2-goog
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
