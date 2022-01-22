Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F212C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jan 2022 03:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0oG7flE6aYan39UhUpq7tm8TqRFwTaCB+Atbry+qT8=; b=LkZoJMcFI8UMnq
	TG0Xek+R/CkoTiiFcBsDsOSmGR42RWOouv9TMiTJXHgDpUP5EdtGWENGS4HnmaFynOUpMHNSX6wVb
	DBZiQxVlGaqx7gbU9u1qJrewgm8W3y5ONkc3PZ1se3Z/6OsSdY5u9R6d18kmGWTzCNxnr8X/VQeOI
	qp51ZyN0NytjY4Ng+3srYvIiSKFXZ4m5I546liEY8jOI+whM86sfwKjuge9a/YvdIoKDXOQMaPurt
	JWPQMRripywVHD2Ec1vEFVL2k6OXArWatPXfiJh88VFO/MuOk+IqfEnshABOsiVEMY7BQu/1JoX0a
	BXeHF8DV8PdJnT8s8gUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB7Lr-00GRyS-Qe; Sat, 22 Jan 2022 03:46:07 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB7Lp-00GRy8-GG
 for linux-riscv@lists.infradead.org; Sat, 22 Jan 2022 03:46:07 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id c10so33233048ybb.2
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jan 2022 19:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GK+DRe45zgKVXKFo8gPG6uGiKgyXp2cTD0RJLmCvZSY=;
 b=QGr+ig/1NkNSQ/DVpGfdNvXcytkEpcUB2Z3Lt1CjofEcwFvFzBHGWU/x6bjfbD+BJM
 28sNmiu9uZQkQfT183g4IwINmBs6qBDPjmUX9tPWIkCpWWqqVLq8KPBLi/4G28cYL2Qc
 XGeEdtOfShkYp+2YRobhPxXvQANlnoodCC1rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GK+DRe45zgKVXKFo8gPG6uGiKgyXp2cTD0RJLmCvZSY=;
 b=6HTfAi+x0Z+igqeHx16nDI/8tAhvbVVUt19ggJzFu3cyo99iK+vy4Ts3wiVkbejlVn
 aDas+DgAO+zNXdQlfn22hwp7Y7vxjbFlH6guQDfHcEQ09yWm9ctSEKU8fOi09XCj20Dm
 1gqBbN1iJvURQ+N0ZFW5HiZ20LFzLti0xMD2wyavsTIifyrnUmU7+pLxaFLtElmq/5yU
 Qpt8AqThg9rodRsz0nmICaw/XlFD8ZHOKAmX2MtRLQaPE3FVZqg2thfLX6i8Ik7xkvoa
 O49jwPbMBoVTo4U8LNhnJjXN/fpAD2i2/RUFn2PwzHRzsXxUaGesVg1hFFRBD+DmcKAQ
 tFqA==
X-Gm-Message-State: AOAM532Ic+0w1OGuQW+Ja//vuMWQKCN/uok62tlIAJpdowh0X3AkKy7o
 z8vwole0nnRkW6qmC6lRJs2FdOqjTsqoJVkqoykm
X-Google-Smtp-Source: ABdhPJxqUxGbofs9AyGZqKNuQHUzAvH8Oar5nZINBL0NQkR2tr89y472EbgCFBjmW5/Z2aBrOhhnBxjAZN3ITVL7G/c=
X-Received: by 2002:a25:b852:: with SMTP id b18mr10998199ybm.651.1642823163252; 
 Fri, 21 Jan 2022 19:46:03 -0800 (PST)
MIME-Version: 1.0
References: <20220121163618.351934-1-heiko@sntech.de>
 <20220121163618.351934-2-heiko@sntech.de>
In-Reply-To: <20220121163618.351934-2-heiko@sntech.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 21 Jan 2022 19:45:52 -0800
Message-ID: <CAOnJCU+NR_hOrvS_+B+OKXeg4s+uh37gYWGVTs_kDd3LQDVEkQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] riscv: only use IPIs to handle cache-flushes on
 remote cpus
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Wei Fu <wefu@redhat.com>, liush <liush@allwinnertech.com>,
 Guo Ren <guoren@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>, 
 Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>, 
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, 
 Bill Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>, 
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_194605_592552_CFFBE4F7 
X-CRM114-Status: GOOD (  25.99  )
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

On Fri, Jan 21, 2022 at 8:37 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Right now, the flush_icache functions always use the SBI remote-fence
> when SBI is available, leaving using IPIs as a fallback mechanism.
>
> IPIs on the other hand are more flexible, as the ipi_ops are initially
> set to go through SBI but later will be overwritten to go through the
> ACLINT/CLINT.
>
> In a discussion we had, Nick was of the opinion that "In general we
> should prefer doing IPIs on S-mode through CLINT instead of going
> through SBI/M-mode,

Yes. Once Anup's ACLINT drivers are merged, that should be the
preferred approach.

https://github.com/avpatel/linux/commit/416c667fd77d6f1fc310cbf727ec127aaf96cae2

>so IMHO we should only be using
> on_each_cpu_mask(ipi_remote_fence_i) on flush_icache_all()/
> flush_icache_mm() and remove any explicit calls to sbi_remote_fence_i(),

That's a bit confusing because we will be using SBI calls for all other fences
while using IPIs for fence.i

> because this way we continue using SBI for doing remote fences even after
> CLINT/ACLINT driver is registered, instead of using direct IPIs through
> CLINT/ACLINT."
>
> So follow this suggestion and just do ipi calls to have the proper kernel
> parts do them,
>
> This also fixes the null-ptr dereference happening when flush_icache_all()
> is called before sbi_init().
>

IMHO, this series should only fix the null-ptr dereference issue.
The IPI based fence (for all) should only be disabled along with the
ACLINT driver
that actually enables S-mode IPIs.

> Suggested-by: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/mm/cacheflush.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..c35375cd52ec 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -17,11 +17,7 @@ static void ipi_remote_fence_i(void *info)
>  void flush_icache_all(void)
>  {
>         local_flush_icache_all();
> -
> -       if (IS_ENABLED(CONFIG_RISCV_SBI))
> -               sbi_remote_fence_i(NULL);
> -       else
> -               on_each_cpu(ipi_remote_fence_i, NULL, 1);
> +       on_each_cpu(ipi_remote_fence_i, NULL, 1);
>  }
>  EXPORT_SYMBOL(flush_icache_all);
>
> @@ -66,8 +62,6 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>                  * with flush_icache_deferred().
>                  */
>                 smp_mb();
> -       } else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
> -               sbi_remote_fence_i(&others);
>         } else {
>                 on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
>         }
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
