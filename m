Return-Path: <SRS0=HnHo=DJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE467C4363D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 06:49:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59AE2206DD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 06:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HeIKwoEB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KDDxxvWM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59AE2206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ENlGeSvbLBNvjWTlkKwMZhrZtdpZaGn0alQkN3m0gco=; b=HeIKwoEB9kGdNARcU3DJlCTky
	n8gOyxIU/jnA6eB+FTjXRfoes5L82SQiLBweQsr9uIvu2X3Cz94DzXijz1bb/wqCySgOmrTFHSOlj
	sBKHoN6W+EkUigR1WAhpbo4jHZc23fRY/6rwgALrGXXmaTSs/i4eGHtfDypVLEVSUZuWWg46AuOOg
	iaPK69OkaA91uqnSf19+PtE1ylrOHBzqP1Z/Y/Nl15pfbk7ivI1msVLpuACMB19CsZyq3aeNMrzo1
	UJcTbS4+WFGq0518bNeNlniPeHTpkBiL42p8O2uk0Tothi1WNMUfbsTYaKXmN72WGyjMpLVuK+NE7
	0BKGXQ/8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOEsP-0004cB-JV; Fri, 02 Oct 2020 06:49:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOEsO-0004bx-Bp
 for linux-riscv@merlin.infradead.org; Fri, 02 Oct 2020 06:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=F0HxCM48zlkqvSK9HVb3prVdbtr0XoJkMcMZ8q5cNvA=; b=KDDxxvWM+qd+VQy/Z9mnWYLcrp
 VPcBmyOR0oC8nWvEYSkDW2MLWZ7ZsnvBDbhUPxXsUP7NiB3KZEPdJgXdtfJQI/d+tF5UbJR4W+SIq
 clptew4ZQQo8cacoEUinGzP4g4x4Y5oaz9/JtjccY5fesqA8GDnOOx377W0WwIuqUD4sSbYNkEnBe
 h+O5gx9IDFJvsVPyX7/3QEnZXiuHEYlaH+8SgPbpOY5B+vftVpHvQkm6k78TG54crxU4xHqQgdpCt
 yg6HpDXyGGYupQltDce++CaqvL7dchYJ/fsCUegBIg3GpqScn3s3Ff069AXOZ+ragf9ss4ZcGko/X
 vuD2YdAw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kOEsL-0007XM-Ky; Fri, 02 Oct 2020 06:49:05 +0000
Date: Fri, 2 Oct 2020 07:49:05 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: get_cycles from modular code in jitterentropy, was Re: [PATCH]
 clocksource: clint: Export clint_time_val for modules
Message-ID: <20201002064905.GA27115@infradead.org>
References: <20200930065617.934638-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930065617.934638-1-palmerdabbelt@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: kernel test robot <lkp@intel.com>, smueller@chronox.de,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2020 at 11:56:18PM -0700, Palmer Dabbelt wrote:
> clint_time_val will soon be used by the RISC-V implementation of
> random_get_entropy(), which is a static inline function that may be used by
> modules (at least CRYPTO_JITTERENTROPY=m).

At very least this needs to be an EXPORT_SYMBOL_GPL.  But I really don't
think modules have any business using get_cycles, so I'd much rather
fix CRYPTO_JITTERENTROPY to be required to be build in.

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  drivers/clocksource/timer-clint.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index d17367dee02c..6cfe2ab73eb0 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -38,6 +38,7 @@ static unsigned int clint_timer_irq;
>  
>  #ifdef CONFIG_RISCV_M_MODE
>  u64 __iomem *clint_time_val;
> +EXPORT_SYMBOL(clint_time_val);
>  #endif
>  
>  static void clint_send_ipi(const struct cpumask *target)
> -- 
> 2.28.0.709.gb0816b6eb0-goog
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
