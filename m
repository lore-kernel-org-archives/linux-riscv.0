Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5866BC4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 13:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A1E820896
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 13:50:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P9W/pS+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A1E820896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJ1JL4XItAN1plHK40h+5VhXgp6KlEHl1sgMstQic4Q=; b=P9W/pS+/2jTOer
	vRz0rAErhVkX9cJ52jo4DLKw0bNBkXs5UE9Hf9x7FERing4nnydqsolQ36baPHiGVDGH9gwj/w5Im
	K6UVnuDRE0M/x7vjpejUKFCqmlB9gYHoKUOQbrIqMF0+m717WKWe29CszI8uOF1jfVFkjm9QLKKp8
	OHkPRJLvxug70u9SoiAXss+WzLtyk+8H3o+aQSVSzfdluD1fGyoJYPFORNo1bXuDxdNDHNHixAjhx
	C6+hRqf9irI0CK+jNzvpMn+Rfvgco9tVO0fAh87gmk4pndUPFZK1/T/pNBANwmqWR8Xjs9tryLV0I
	VlMolFwRicxDKAl1D3/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hahAJ-00037Z-Rn; Tue, 11 Jun 2019 13:50:19 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hahAG-000372-9A
 for linux-riscv@lists.infradead.org; Tue, 11 Jun 2019 13:50:17 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 9C13968AA6; Tue, 11 Jun 2019 15:49:45 +0200 (CEST)
Date: Tue, 11 Jun 2019 15:49:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] riscv: export flush_icache_all
Message-ID: <20190611134945.GA28532@lst.de>
References: <mvm7e9spggv.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvm7e9spggv.fsf@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_065016_470173_831E869E 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@lst.de>, Gary Guo <gary@garyguo.net>,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

NAK.  There is no point to export a symbol that should not generally
exported just for a tester.

I think the right answer is to just don't allow a modular build of
lkdtm.

On Tue, Jun 11, 2019 at 12:24:32PM +0200, Andreas Schwab wrote:
> Before 58de77545e53 ("riscv: move flush_icache_{all,mm} to cacheflush.c"),
> flush_icache_all was a macro, but it is used by a module:
> 
>   ERROR: "flush_icache_all" [drivers/misc/lkdtm/lkdtm.ko] undefined!
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/mm/cacheflush.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 9ebcff8ba263..4a2e5bf8b21a 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -14,6 +14,7 @@ void flush_icache_all(void)
>  {
>  	sbi_remote_fence_i(NULL);
>  }
> +EXPORT_SYMBOL(flush_icache_all);
>  
>  /*
>   * Performs an icache flush for the given MM context.  RISC-V has no direct
> -- 
> 2.22.0
---end quoted text---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
