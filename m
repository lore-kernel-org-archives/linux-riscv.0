Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E5CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 06:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7n0nPUdubxKGeGZwh8VcOALn1J4FUhcSChukF0oN06c=; b=y7PTt44aCB5OOI
	W5MdQQQTYBKJZcccpSzrIOjLgZZuu6N8Fz9C3myNJNvHzTc7UvDiiGqzykzghFcPfQszEOAjY9xVy
	MxCg8g3lt9f64xuoPuNv+lbEHhgAV/7N935bvXBj/pdKrxKcbr90eGiE0UJ3X8OcVsPgiAdF3X+hf
	/ua2F3u99NbmiknVPjtUGOhNE3oA8molpmmtYKcmpFlYWrmh64FdgDZ/C242Ir7KQ1gKlJCP3U8mt
	oZ4xGXwaqwDYhOBaJKAAbLcDDaDQIftzUZZXhDpEHkbqn0o5WtPN1qBxx2iCfpGICGoUTeMMWP3JZ
	RPDWuqAQUK5WZu5TrzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njEas-00CiuR-JR; Tue, 26 Apr 2022 06:22:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njEao-00CitY-SU
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 06:22:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6B70B81C1E
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 06:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03D9C385B7
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 06:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650954151;
 bh=GrOAZVVQ/R3qESFmB6K9j+YKkA1RomF1reYz1F8tQ1c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jgNCDr//0vStMZL6omBQsaE4YNjcKOHrLfmDrcP2/Rv+eLYOs8El/7fAUxF+EiFKM
 /TTQtZrJrPIl+imZwLkPPFbsy6Zosab5Bqr9VFXknB9zvvmD8mFeoc4ZY7zJ1k7pwd
 ATQPsjCg2oAcbrhnzRZpfoDvJReWmJQ0gPLE+crVdHyQVpdm93w88NjfTH8IgV4gh/
 E5C4HSeYbeWQMaWteI7/N8sT9Q+Jn6VIOMzcnuLinZvzwxWx4nWN5tu1ce1PenvsZ1
 gJ1inWmbw+1u/WvrFaqT4hxybUV2sEEJEo/Ifgo7T+DpZNW5sSSvNdYdwIkLBGfX74
 uJTvKZ97egE1Q==
Received: by mail-vs1-f53.google.com with SMTP id m14so16486344vsp.11
 for <linux-riscv@lists.infradead.org>; Mon, 25 Apr 2022 23:22:30 -0700 (PDT)
X-Gm-Message-State: AOAM5330wfQxoNiEARITdbxtH39UjSLxrAotaXEdyllmJhaHYBwjisOt
 Is2WIwJK+COgb2l9aeiea29Y2832XJGzSFMPXio=
X-Google-Smtp-Source: ABdhPJxHM08tDWKEqh3dfn41b7uQsUekJkJTEgUx6ZJGzh9kexwGAqDOrHpx93X8d/uQE0QcgAMW5+M3iuIkTRQgy1M=
X-Received: by 2002:a05:6102:150f:b0:32c:e4f2:77b4 with SMTP id
 f15-20020a056102150f00b0032ce4f277b4mr442485vsv.51.1650954149754; Mon, 25 Apr
 2022 23:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220426015751.88582-1-lihuafei1@huawei.com>
In-Reply-To: <20220426015751.88582-1-lihuafei1@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 26 Apr 2022 14:22:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR6hL1DfaGpPqfVwtmCHaVYK1nz_-W-h_mye34UjeeAcg@mail.gmail.com>
Message-ID: <CAJF2gTR6hL1DfaGpPqfVwtmCHaVYK1nz_-W-h_mye34UjeeAcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: ftrace: Fix the comments about the number of
 ftrace instruction
To: Li Huafei <lihuafei1@huawei.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, 
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 David Miller <davem@davemloft.net>, jszhang@kernel.org, 
 Peter Zijlstra <peterz@infradead.org>, liaochang1@huawei.com, 
 =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>, 
 Pekka Enberg <penberg@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_232235_279255_36F1DF29 
X-CRM114-Status: GOOD (  20.11  )
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

On Tue, Apr 26, 2022 at 9:59 AM Li Huafei <lihuafei1@huawei.com> wrote:
>
> When DYNAMIC_FTRACE is enabled, we put four instructions in front of the
> function for ftrace use, not five.
>
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
>  arch/riscv/kernel/ftrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 4716f4cdc038..63f457650fa4 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -73,7 +73,7 @@ static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
>  }
>
>  /*
> - * Put 5 instructions with 16 bytes at the front of function within
> + * Put 4 instructions with 16 bytes at the front of function within
Yeah, 5 instructions are for mcount, -fpatchable-function-entry=8
cause 8 16bit instructions.

Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")

I recommend just delete "4 instructions with"
- * Put 5 instructions with 16 bytes at the front of function within
- * patchable function entry nops' area.
+ * Put 16 bytes at the front of the function within the patchable
+ * function entry nops' area.

>   * patchable function entry nops' area.
>   *
>   * 0: REG_S  ra, -SZREG(sp)
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
