Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5950EC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 01:09:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9BAF6120A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 01:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9BAF6120A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5s8WKSiv3RtDCBjoBqFlvToTHMdFhkK7Ica1DiPHeBQ=; b=IZEw7XpjuqD547Xhgl9usJqr2
	dLFnVq5Y7ANJrUbaVnbu88ejgya3opZHqZKr6SiAjQ0g3/kz2FHwbQBHDgIlcEMZPGCis0qDnwIDV
	RV709nEJXjj4NeMhr5ICCPlkJADpXsMEYbAAnAmm+wXIFVfuMH1UIZIPd87m3suJz7kSDXc0V99T7
	DyyTZ6l0WjW7/ynFyhnbt3upM9l1gz+n3O0gpYt/yZVxkBANkh02LLGuyOc6Wh87d1rxwQffciUge
	fcVqUc36GXuMWxj7GHgZIAP36uFxCmwU9EJLymhaSpd2hVpuNCTgwevLUIkB36cH4OskoCW9YOPgw
	DDvSa6l3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVl4j-005PB6-EB; Mon, 12 Apr 2021 01:09:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVl4h-005PAc-1X
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 01:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=H0g+omOZRisVxOUCibASZBPuFW5oO6sfiDj+exX2xb8=; b=fpvCgbpWIZmJx+8mgdAq/rAOEx
 r9C9LnGGo5/UWVa8pCLGBuLfSgXuvgB1mpohKB1v5kHlBBoB24W7FSaZ6s0BZWhPwMmGlsVtvexIi
 ijD/QJ1yVHdFWe1W5NzvnBI2DWc+ijamNlBj9uD6HdzbIgFnru6oqGnof53pMlasIAcJe9XvR5JD6
 AsmI1DAcf9Ngf1Z4aQn7wE3pIz5R1HDmNpT0BTVb4IRitllDhNgx5qr1HWV9yRiUMmKTbRJE5+2qy
 sRWOLzUyXc1GTbXXwF6E19qcbEDbDXB8ubrQBef58SNxjJiVIRBVkOqfhD08/ARp37YmXMVVMrayX
 Fl3WnNug==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVl4e-005ooU-4N
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 01:09:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id r13so1967870pjf.2
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 18:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=H0g+omOZRisVxOUCibASZBPuFW5oO6sfiDj+exX2xb8=;
 b=QJKFUkch8Spoy4s9wnEGAx0YrpcEpV64JASS356NZi9pczejxlp7M1g+XZ32G8+c8i
 wnHFYd93yMA7dXnTzY0wQUOu/qiAFFBkUBXHJfOglrZeeizgg419wphgscbmtxfwr9dS
 EDsL0wPGZu/WxO3qw3vbTb2ez9xdEwfiV0IbVOMB7YNdd0sUtVLVqugDtrP4bErJqHLh
 4hGCYpinVOuk9NSDFJweiFYZAbXA37YHdMeBud1NwVmj2S7EQHUe+pJ8r80C3BwVm8h1
 Wqskp+vm5aXgWBlK+5Odymy5gEKsQThYbX8KARX7OUSp5y4hfDiC+g/2ZKiBl8zlowDu
 5EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=H0g+omOZRisVxOUCibASZBPuFW5oO6sfiDj+exX2xb8=;
 b=nc+qpykx+wnOGXD5JvzHn4umNGJJUC8FYHBIuOA3W5j50WlKGoPGVaoO17udVad42g
 LEh9EkZ2X9UJTdN6/hTma0S2F8hJC7U9bo8pIcfnA8SwD4zluelx0lQzQ2RVnIk6gBRl
 Smjbosy6DuIFSX8iZZBfqjVJ93juK0LjrHNKiJX6IxG2jR8mwO4+NaZZ0LvRvGhYjJWm
 lTo7/PugQSFX8AH4jQUEuOeo0A4n/e/mQ70Mh0sTUKha8bJ6tIrwp4eiFl7dUXtUsoY8
 sithYVeQimbh/ZHRURIa0QqVEoEkO1sn03L8udIHiW5mqPRUJnRmxGST0On1hNzrFBBj
 43vg==
X-Gm-Message-State: AOAM5313iruoHP4vQiaKGmeSbWvf7/oHtSwJJXk0M4GMIBA1cOLoZMxi
 Cwepb2l2dp/IN5NBTAqDQ3VOiA==
X-Google-Smtp-Source: ABdhPJwvuSL0mkG9IZzcdprvLrtsE1aVfrEWlk2Lz1Skb6+IGoNfACxrBt5na7A3HahfIdueYHTclw==
X-Received: by 2002:a17:90a:990a:: with SMTP id
 b10mr25844340pjp.178.1618189747014; 
 Sun, 11 Apr 2021 18:09:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e1sm9385380pgl.25.2021.04.11.18.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 18:09:06 -0700 (PDT)
Date: Sun, 11 Apr 2021 18:09:06 -0700 (PDT)
X-Google-Original-Date: Sun, 11 Apr 2021 17:38:25 PDT (-0700)
Subject: Re: [PATCH] riscv: add do_page_fault and do_trap_break into the
 kprobes blacklist
In-Reply-To: <20210330021226.2fc7b2ec@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 mhiramat@kernel.org, guoren@linux.alibaba.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-91078457-1fd6-425a-a7d8-d18be7088cea@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_180908_251868_A2FCC4B0 
X-CRM114-Status: GOOD (  15.83  )
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

On Mon, 29 Mar 2021 11:12:26 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> These two functions are used to implement the kprobes feature so they
> can't be kprobed.
>
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/traps.c | 1 +
>  arch/riscv/mm/fault.c     | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 0879b5df11b9..1357abf79570 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -178,6 +178,7 @@ asmlinkage __visible void do_trap_break(struct pt_regs *regs)
>  	else
>  		die(regs, "Kernel BUG");
>  }
> +NOKPROBE_SYMBOL(do_trap_break);
>
>  #ifdef CONFIG_GENERIC_BUG
>  int is_valid_bugaddr(unsigned long pc)
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 8f17519208c7..c5dbd55cbf7c 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -328,3 +328,4 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  	}
>  	return;
>  }
> +NOKPROBE_SYMBOL(do_page_fault);

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
