Return-Path: <SRS0=G4ZZ=5T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E158C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2020 10:22:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD67920787
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2020 10:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dLFicUeA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uo3AEcIh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD67920787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SJNt42CfsZfbktzQWlyuv/BNnhlZfiPggeX/EX84Fx0=; b=dLFicUeAyLlOyO973PEtIeXUl
	i7zLu+JwPtQvaMc6oLqE89iiMV0ofFdfIeHtYbMfQtf3qhYCtnzug1Cw1gX6dx47lQToRb+rsEt1s
	iugdodFGK9pctyfx0F9zvhISASBB92hyQPByLZXfZ8mX936XOsPciMLJoX+9WPWZNciZMh4SaeTnY
	ZVDnnARkAOeHUV3xAWGx1OeOdCPtg4ZW7kgkrTd4fK1hAJKgJRmQQLxuLxHIX7g3lLscvrvgoO7sM
	UISdLh9cbwJWvnHkJqkxzjRa5DFVvEYgA+Ip9ao/Tl4x6QoJNP9IGVXmD1Q/GykEOxL23QbGRgj6K
	xix/qFgmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKJSh-0005mq-0S; Fri, 03 Apr 2020 10:22:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKJSd-0005mW-L3
 for linux-riscv@lists.infradead.org; Fri, 03 Apr 2020 10:22:05 +0000
Received: by mail-wr1-x441.google.com with SMTP id p10so7857660wrt.6
 for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2020 03:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SJNt42CfsZfbktzQWlyuv/BNnhlZfiPggeX/EX84Fx0=;
 b=Uo3AEcIhtQ1yrlT+2wvMkL8dO3YNkwihb398/S12SDQdRUIlUt2FNLvD8Hk1Kh6hNs
 lGXm6lHwDsTZyuj3v1/Tyz0fDYJjtGwnkVS+2pLkAq96Azic5ywkC2qVnc5PSprosbDc
 Oe0RgAUva/IJP3Pa2mAV90l/cF2GwdUoPaeRpvyfxrtzXA28mgSgsbT2YN+u8SUfUccS
 RlHbUIXRDIU54HZWfxxTAqT0DIHkKJ2TN3EeJnjlvDD/qRD6IrIjDi0/kxnngZfHWIOv
 ONl1Iob8SXcoW7R93Gc8S2nPv+4keuzWoRqsOmvlpFWnMWh2IbRk9HahCJTAz7wB2GUw
 lCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SJNt42CfsZfbktzQWlyuv/BNnhlZfiPggeX/EX84Fx0=;
 b=ZG6exsZ44LliRo8OZt258ePQJMIkqYyL9gso5/iKT+Uad/HOkSLBsV0fzn3xtNO2rx
 W2nJRaxk8pg7XHJBgqGC4jrtxV0/nDFQoNqV6WVitForSeTCgIs8sD3o6lLGY9VWqn7A
 nSxkUfy8sGeaaJAGZphKWoMdaEeIHil+trNPYQofhTSK+drWngyzqxQwGq1zsa7WsUNN
 G69+GNsE83bjFQbtsuVqFZdVJ93/Me9DjExhi4AeAimxPB8AGnO6bynHTbg0d+aeB0e7
 BtaF09u2XCGu+SNB8hBzio1M4RFVZ3EswQkyvM9eL/EQz9c3qrdktr5Wfqq3WurghlZb
 XMEw==
X-Gm-Message-State: AGi0PuY2Gk53iu9Uw8YxAE4m1GFjT97suAabmBeurGp490wfeGB+a51W
 qlryzBTRcQiZuN7uUQ03dn9Ksg==
X-Google-Smtp-Source: APiQypJr6hcoO3o83/34kzUQba4K3ZIXDGFSw8EWqo43odX2M1L53tJIlkBNUswjkWNs8hRGGTI++g==
X-Received: by 2002:a5d:54c8:: with SMTP id x8mr8633049wrv.357.1585909322364; 
 Fri, 03 Apr 2020 03:22:02 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 91sm5508347wrf.79.2020.04.03.03.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 03:22:01 -0700 (PDT)
Date: Fri, 3 Apr 2020 11:22:00 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH v2 1/5] kgdb: Add kgdb_has_hit_break function
Message-ID: <20200403102200.kx34epzjlfoy54ay@holly.lan>
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
 <1585668191-16287-2-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585668191-16287-2-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_032204_212906_0413FCF0 
X-CRM114-Status: GOOD (  16.86  )
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com,
 dianders@chromium.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 31, 2020 at 11:23:07PM +0800, Vincent Chen wrote:
> The break instruction in RISC-V does not have an immediate value field, so
> the kernel cannot identify the purpose of each trap exception through the
> opcode. This makes the existing identification schemes in other
> architecture unsuitable for the RISC-V kernel. To solve this problem, this
> patch adds kgdb_has_hit_break(), which can help RISC-V kernel identify
> the KGDB trap exception.

I was just reflecting on this again.

The approach is fine from a kgdb point of view (where breakpoints are
expensive heavy weight operations) but it might be wise to share
how much implementing kgdb in this manner slows down kprobe tracing
since these are normally pretty light weight.

If the benchmarks do look bad I'd certainly entertain patches to
optimize kgdb_has_hit_break(). For example by tracking the highest
currently allocated breakpoint number would make a big difference
(since it would normally be zero or close to).


Daniel.

> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  kernel/debug/debug_core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
> index 2b7c9b67931d..01bc3eea3d4d 100644
> --- a/kernel/debug/debug_core.c
> +++ b/kernel/debug/debug_core.c
> @@ -417,6 +417,18 @@ int kgdb_isremovedbreak(unsigned long addr)
>  	return 0;
>  }
>  
> +int kgdb_has_hit_break(unsigned long addr)
> +{
> +	int i;
> +
> +	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> +		if (kgdb_break[i].state == BP_ACTIVE &&
> +		    kgdb_break[i].bpt_addr == addr)
> +			return 1;
> +	}
> +	return 0;
> +}
> +
>  int dbg_remove_all_break(void)
>  {
>  	int error;
> -- 
> 2.7.4
> 

