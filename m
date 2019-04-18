Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1C6C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:28:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B695D21479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:28:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQZuA7RR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hNSJWi7d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B695D21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkeKupAJcbgKNgpFsdzG0mha0RuAtc6ZXIipiQ0BXjI=; b=TQZuA7RRRmPSdc
	0kqgJ5+UqIKBOXrU1vd+rXVlZFSMxwG1QR3uIbMvGHUo/uIW4/zOZWIMAgENm37b+A6ijwMOFYXPH
	FwOEu5R2Ik+X2MR/cyVSqE3kr6fR1v04+JT3S2toFF19qddjfcOFfEBPXE49V4wScMUrM6wTAHjqp
	tyNXuSQP/pIq0a+UM13AF3RqduXFqV0U9zvsCQvqzgzg6BLfGfMXFiQZd2U++R4JCeZCE2IhgbRvi
	lIFsOK6szaZrPHbQHolkW0vmCcLHp9z/hYQbCg0vvxgmq85E/xFdgbIRnujjovJYD0a1de54vHj2O
	wZy7wAjz4QoJJfyFZNjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGzal-0008QJ-EC; Thu, 18 Apr 2019 05:28:11 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGzai-0008Pc-Ad
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 05:28:09 +0000
Received: by mail-vs1-xe41.google.com with SMTP id s2so508666vsi.5
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ohjMtnRuoMZoK8NFCIw9UXTAaT8mCgqZCZ9c725i5mE=;
 b=hNSJWi7dfZS6icOBYs4kZRM3P2+rnM98qjGabtZHa2binvsfr93Ocxkw+IwxUASlD/
 pQX01+gyN8BW8yJYMgeqgS/eAzOZQEpQCg6E3xJ+hbrCPgvJPgJJi4wI0J+FiIbsUSP6
 0k+cQm02mdD+oM5hLDG6hhfyjMKa1vlN3OhUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohjMtnRuoMZoK8NFCIw9UXTAaT8mCgqZCZ9c725i5mE=;
 b=M/CIG9Fx3LVNNtWKARmQ6qnghx9jWFu+PFrilA7dYp1DrG1jnhw+eGakkuY21S9LB/
 KJ2G69CV5XK7TE1aPRS15HTk52o0qqGwhYaZzIJa6RwQhA4kFqjbH1OHMrDsDA/pzztx
 C1+DPOkY5Jyb9WTRFeJR7JGs/baBecK/aIB4W5Wg880yYZ6QtEWG+ebvSv+U+pusP82B
 9CcpB9BACKktg2ae3GZiHiORL24BMuEZ8dAmyUVhr/Dt5nwzB3PMu9DMOk9+DFWw/5EE
 DKTwE6IBdHVXMBLiOKGc3L8M0YkY1Hv56+gBrtdsYibGhQ9LQ2Ru/fspoYq8uxD3R0eb
 1gKQ==
X-Gm-Message-State: APjAAAUqKkLUhZSaJLYY1xXrDUTxGt8mbLdjVzDIiddxhP9/n9nS/IDj
 zaGrwsimtZTE10tAS/WBoRnRl4e7aH4=
X-Google-Smtp-Source: APXvYqxA3bo7o54KvVut2LsGqTMyYy+Nk6LdOLF7bBCdGvJh9GradZEfy2O309NSHaQpcpbgkO9HMQ==
X-Received: by 2002:a67:f615:: with SMTP id k21mr50879865vso.136.1555565286546; 
 Wed, 17 Apr 2019 22:28:06 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id e81sm412142vkd.56.2019.04.17.22.28.05
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 22:28:05 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id x84so220224vkd.1
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:28:05 -0700 (PDT)
X-Received: by 2002:a1f:2e07:: with SMTP id u7mr49260276vku.44.1555565284857; 
 Wed, 17 Apr 2019 22:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-7-alex@ghiti.fr>
In-Reply-To: <20190417052247.17809-7-alex@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 18 Apr 2019 00:27:53 -0500
X-Gmail-Original-Message-ID: <CAGXu5jLFtaiRqvd_Lw2B688bzUyti2O8o_iZVmQhb7rmnEKzBQ@mail.gmail.com>
Message-ID: <CAGXu5jLFtaiRqvd_Lw2B688bzUyti2O8o_iZVmQhb7rmnEKzBQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] arm: Use STACK_TOP when computing mmap base
 address
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_222808_368906_1D5FC77D 
X-CRM114-Status: GOOD (  15.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 12:29 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> mmap base address must be computed wrt stack top address, using TASK_SIZE
> is wrong since STACK_TOP and TASK_SIZE are not equivalent.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/arm/mm/mmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
> index bff3d00bda5b..0b94b674aa91 100644
> --- a/arch/arm/mm/mmap.c
> +++ b/arch/arm/mm/mmap.c
> @@ -19,7 +19,7 @@
>
>  /* gap between mmap and stack */
>  #define MIN_GAP                (128*1024*1024UL)
> -#define MAX_GAP                ((TASK_SIZE)/6*5)
> +#define MAX_GAP                ((STACK_TOP)/6*5)

Parens around STACK_TOP aren't needed, but you'll be removing it
entirely, so I can't complain. ;)

>  #define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))
>
>  static int mmap_is_legacy(struct rlimit *rlim_stack)
> @@ -51,7 +51,7 @@ static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
>         else if (gap > MAX_GAP)
>                 gap = MAX_GAP;
>
> -       return PAGE_ALIGN(TASK_SIZE - gap - rnd);
> +       return PAGE_ALIGN(STACK_TOP - gap - rnd);
>  }
>
>  /*
> --
> 2.20.1
>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
