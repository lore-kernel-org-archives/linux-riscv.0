Return-Path: <SRS0=JNhR=YL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD785CA9EC8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 02:50:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAA9021897
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 02:50:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJuo7MIa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="pUdAa7J2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAA9021897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjBINAP5do3WKuHK7dQJ66FtqIMQWqHiQmO9mdTqjWo=; b=WJuo7MIa4RIcsp
	vJuPprY3b2tIhzjskhwXzCkCQo+ycc3MJe4Gyq8Jn/7I7vdJ+qIcrJ8FsPu6guQkX4d7A9En/98up
	oG0qKJrIq/WjTBt4fzg6GsnB8eC5utnl0rK/uwb+URfZ4kJZ3x1Ipgg4eq4dqc6jHOOqofZX5nn54
	FICet5N0oKPTWKazll4N00IYuoOlKzWqKdQkLjVER6oTYZo7pRyWIS6l3DP4BgYcD3l8eBLnu2VE2
	nBUXmrdTARDtuVUfx7A0QqM6MyQfZ5pbRyup+kAjVFqQzPvwNNZl0TKIitKk+P2lfqg07ZLYaJ8vR
	PvgwgunQiqECxdbnDSEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLILx-0008SZ-CJ; Fri, 18 Oct 2019 02:50:57 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLILu-0008SC-8p
 for linux-riscv@lists.infradead.org; Fri, 18 Oct 2019 02:50:55 +0000
Received: by mail-wr1-x441.google.com with SMTP id o15so4072790wru.5
 for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2019 19:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMtJ/rq4br1ldAroW8Dm9Xv9y05Fk6K5c9x3oKp9k7Q=;
 b=pUdAa7J2Gehc3Z5S9pU0pPhmaabw9SjD3IScdYFCqeiH3a9/O0nd+npGP8SCaXV7ud
 Mq/tpXJ03zoiJlySIp+C2bLcFQE3kz3xaUxLuoAgZsHlPhtDFPgaJgtQMwLCgRcyLqKl
 pdNCMoaioINJYJGKaVPopoS23vLTZ8HYzl0/Toz2zbNO7gNdxWPh+lUW8akLY5nFvoaB
 kR88ZMGqusSaZpH70Hpwo8f62b5xlkn/owvdAxJezCkYbdpfqMAygH4I6W6zwMcqPTrZ
 jBxqiBp9fNjosicT7b99eNAyLeQ51Exl8xFWH245qIEAIQFebZQvModDW1RNp3gphBe/
 N/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMtJ/rq4br1ldAroW8Dm9Xv9y05Fk6K5c9x3oKp9k7Q=;
 b=LKLDKm9F8/EcNAFnHGQ/TZcM56qn9PoVmjrgB8GO4SvizlPK4S5bTDbOGLEg34UfiL
 P07cWItjZoQ/F2ZkfLWeRl1kk7AR8b4Ax16/N7pNJeru5G+e+FGq5hPIuflhJ1R/Gz1N
 7os5Y1vG4Jbq9IzqCElNPwfEdeAJdw3VXlwwYPsEw+EK74u6ZXza4t4cOJbdXDbYm1/F
 SHRCgk/yh7rgC4Ba3r/9Uok+dZ8YG6QPQQiJResBM5wBNhnTrAUffYea/XWIOIB4nmAe
 CRS5E8caU4XChS/hmPpNy96YfwQhfsP1riWoYcuzdBwmhouMahSD7yg+6jmyT4JGb2vg
 3Y8A==
X-Gm-Message-State: APjAAAXdqy/YdjTJ/zxcb13DoqqGF/LuIYgXXNyO2SJ9e+UEPtVI6Gio
 4dnRhq7JG+AnA9RekxBqCgAaqAXjdZOiVkzevxZP2w==
X-Google-Smtp-Source: APXvYqyzL5PfqPUeOPJfIRSruOHCy55CDY3oAd0o+CVn7dWhpcrArUiDxTSajhvUF6JsyyNVFOA2Vcdi1oVTjp+LITs=
X-Received: by 2002:a5d:440b:: with SMTP id z11mr5349333wrq.309.1571367051591; 
 Thu, 17 Oct 2019 19:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191017173743.5430-1-hch@lst.de>
 <20191017173743.5430-2-hch@lst.de>
In-Reply-To: <20191017173743.5430-2-hch@lst.de>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Oct 2019 08:20:40 +0530
Message-ID: <CAAhSdy2fKnGbNHQHaxcthEsVDX_Jv3ZqPWHfmqn1gpB4sPho5g@mail.gmail.com>
Subject: Re: [PATCH 01/15] riscv: cleanup <asm/bug.h>
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_195054_370315_736D7482 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2019 at 11:07 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Remove various not required ifdefs and externs.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/bug.h | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> index 07ceee8b1747..75604fec1b1b 100644
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@ -12,7 +12,6 @@
>
>  #include <asm/asm.h>
>
> -#ifdef CONFIG_GENERIC_BUG
>  #define __INSN_LENGTH_MASK  _UL(0x3)
>  #define __INSN_LENGTH_32    _UL(0x3)
>  #define __COMPRESSED_INSN_MASK _UL(0xffff)
> @@ -20,7 +19,6 @@
>  #define __BUG_INSN_32  _UL(0x00100073) /* ebreak */
>  #define __BUG_INSN_16  _UL(0x9002) /* c.ebreak */
>
> -#ifndef __ASSEMBLY__
>  typedef u32 bug_insn_t;
>
>  #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> @@ -43,6 +41,7 @@ typedef u32 bug_insn_t;
>         RISCV_SHORT " %2"
>  #endif
>
> +#ifdef CONFIG_GENERIC_BUG
>  #define __BUG_FLAGS(flags)                                     \
>  do {                                                           \
>         __asm__ __volatile__ (                                  \
> @@ -58,14 +57,10 @@ do {                                                                \
>                   "i" (flags),                                  \
>                   "i" (sizeof(struct bug_entry)));              \
>  } while (0)
> -
> -#endif /* !__ASSEMBLY__ */
>  #else /* CONFIG_GENERIC_BUG */
> -#ifndef __ASSEMBLY__
>  #define __BUG_FLAGS(flags) do {                                        \
>         __asm__ __volatile__ ("ebreak\n");                      \
>  } while (0)
> -#endif /* !__ASSEMBLY__ */
>  #endif /* CONFIG_GENERIC_BUG */
>
>  #define BUG() do {                                             \
> @@ -79,15 +74,10 @@ do {                                                                \
>
>  #include <asm-generic/bug.h>
>
> -#ifndef __ASSEMBLY__
> -
>  struct pt_regs;
>  struct task_struct;
>
> -extern void die(struct pt_regs *regs, const char *str);
> -extern void do_trap(struct pt_regs *regs, int signo, int code,
> -       unsigned long addr);
> -
> -#endif /* !__ASSEMBLY__ */
> +void die(struct pt_regs *regs, const char *str);
> +void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr);
>
>  #endif /* _ASM_RISCV_BUG_H */
> --
> 2.20.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
