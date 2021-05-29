Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A37AC4708F
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 23:42:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FA061003
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 23:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FA061003
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:CC:In-Reply-To:Subject:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QIsXDiXjSqnodDcLE6dDwVwU41SjFeYGFOYpJLpC9cc=; b=2qTvOfiB5gDF52lmhGkxHEGq39
	Cht/kXlSTTDJAuC6cCNp2FeYO/z08KHNXzXvaNbZSASGPeqH3uCBkgHeb7t3u/jy0BR6U9lgHry/7
	v5dTeGWqNu3Ai/5VApyvxlA/h+Nd0MzN98IomGj4IFl1WAT+iLSzxXoO7rnVH4SWmLTZLTeqmTx3A
	J/bQM6v6mNpoQHfRIh2EzcRgAh+sjxqj3E5kpY92ojT2Z+rHTrnIbVlahvpa6YMZape7Hp7SLMTk9
	07qnl6ji89WRnsdedUyg6hUuJ0bPLbwKgcPg0e1EFxJEGFahXSDemgn6ngnlJ+JgRPespv/1q8GGT
	lb4/raig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln8bI-008bUK-6e; Sat, 29 May 2021 23:42:40 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln8bE-008bTJ-Vr
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 23:42:38 +0000
Received: by mail-pg1-x535.google.com with SMTP id r1so5446712pgk.8
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 16:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
 :content-transfer-encoding;
 bh=nCF8S4c2UqVaSQfWVl5eT5cODWPKUpixcjFKEGaEBsg=;
 b=E5j3/R9jGWjyCkfveb2hFi3KRV59el0pmSmh+8jttzaEE49YnjYfWQrISUX64DQTYD
 CYRdBqqAhVie9tBk2A+r2dzPZRJyuQP4ps6vdHoJucMBqoeUE4mUuxgptKEKmked618I
 L7Ab8AynI+ph9zaO9IkGNdX1bYp7Nxg5H2TbkY/SYhwpws1R9fVlrkrE1LHF5r+cqVLS
 U7DxNqsMin6gbEHkEqcnymxvPahPMJwWPB5nKL8bBBKQQyP9ayWCz6441HZ8LELXsyxN
 MazOBw7l0X7C3ebInAujp8DqGA1qKg6P393sKCixoqXtj6RnfI8kVG4RTuL5Jyr88dRY
 n0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
 :mime-version:content-transfer-encoding;
 bh=nCF8S4c2UqVaSQfWVl5eT5cODWPKUpixcjFKEGaEBsg=;
 b=j9i854eo/84RZQ2o7DXbYHqPt7TTArnTj2C2d5RTrvgIFj+GmVnQ427vHGPygAByu/
 UfPTtoaSBCHOT5z5P/uw3D3HE/vuc8N7mLNgLlPivfLRUdc6/z+OtA8Wg9HKr855oc3J
 WijWF1PtBpD98hXLJMtIzfdCwwVnpzeCeEhGnlQCtKhDcjm+3RK4tlETlp0P38ydSTZw
 NrCTLtN/Fp7aeE5ENrQMcDIKACOEb/xKKaSeDSDkI78E2N8CO/JYV0Q4sWFhGNg55UZq
 ReQoRATuJtyUEjuNrOT++yLjpSNMyxOQARw+PdPp1oMCYNvHGtoeL/EYGfJ77D+ofdG3
 tT8w==
X-Gm-Message-State: AOAM533/dPt7Plkp7Tic4LwfJv+gUz1JN/FkrVPSdT8rK/otnvIYBTbX
 xVMEodgb+g+8DShoz+i4FpcwZA==
X-Google-Smtp-Source: ABdhPJyBM9qTLEBjQIl1kZoPH7198QqOL+uALfz0g+QnABTxRKo7JOcZf9HC769u0b3OkMLMhkHXdQ==
X-Received: by 2002:a65:584d:: with SMTP id s13mr16053871pgr.97.1622331756137; 
 Sat, 29 May 2021 16:42:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k20sm7843994pgl.72.2021.05.29.16.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 16:42:35 -0700 (PDT)
Date: Sat, 29 May 2021 16:42:35 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 16:16:36 PDT (-0700)
From: palmerdabbelt@google.com
X-Google-Original-From: palmer@dabbelt.com
Subject: Re: [PATCH V4 1/2] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
In-Reply-To: <1622008161-41451-2-git-send-email-guoren@kernel.org>
CC: guoren@kernel.org, Anup Patel <Anup.Patel@wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-sunxi@lists.linux.dev, guoren@linux.alibaba.com
To: guoren@kernel.org
Message-ID: <mhng-60806045-5ac7-4057-b596-a4d9cb79b7be@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_164237_080160_503F9D25 
X-CRM114-Status: GOOD (  17.99  )
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

On Tue, 25 May 2021 22:49:20 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Kernel virtual address translation should avoid to use ASIDs or it'll
> cause more TLB-miss and TLB-refill. Because the current ASID in satp
> belongs to the current process, but the target kernel va TLB entry's
> ASID still belongs to the previous process.

Sorry, I still can't quite figure out what this is trying to say.  I 
went ahead and re-wrote the commit text to

    riscv: Use global mappings for kernel pages

    We map kernel pages into all addresses spages, so they can be marked as
    global.  This allows hardware to avoid flushing the kernel mappings when
    moving between address spaces.

LMK if I'm misunderstanding something here, it's on for-next.

>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 9469f46..346a3c6 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -134,7 +134,8 @@
>  				| _PAGE_WRITE \
>  				| _PAGE_PRESENT \
>  				| _PAGE_ACCESSED \
> -				| _PAGE_DIRTY)
> +				| _PAGE_DIRTY \
> +				| _PAGE_GLOBAL)
>
>  #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
>  #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
