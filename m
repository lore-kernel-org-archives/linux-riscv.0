Return-Path: <SRS0=UkPV=2H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4003C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2019 11:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B670206D7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2019 11:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SzsPXqFj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="uiHGsBGP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B670206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X/S+8zEUBS7YPWXh0mAqGVkUFdobNHA//t57aWOlO+4=; b=SzsPXqFj+DweCN1y+BkhlpTbh
	Vxbp26upw/VMLbNoI0lvSf2aAACCpefxGmzD8+mZcMcaRliUamE5+wYvhfar3NjPqGBT7OIcumBvF
	Y/yBHolQf9e8psueFeyhigUdPmX8tNJ58zEqgYEJuC7yondTNJDHPn5xSihcEA4yvFulh2Ke7vCd4
	MWzyf7D4qjNHZNUbAoguS4mj/1YwqMukk86Q/WP/k557/JEWEadNaYQ0gV6YkHrzAdlGX2JYCM9CN
	evg6E+Lqam4pfrSu3gZXW6om9m+KQJJa8Q9iotPfZHFTFDswaRQhYMn4HX3ZyVGsSjszi8SCw0BEz
	GQ3enkPZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihBIL-0003sR-SQ; Tue, 17 Dec 2019 11:45:41 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihBGX-0000yA-2D
 for linux-riscv@lists.infradead.org; Tue, 17 Dec 2019 11:43:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id p9so2615811wmc.2
 for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2019 03:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X/S+8zEUBS7YPWXh0mAqGVkUFdobNHA//t57aWOlO+4=;
 b=uiHGsBGPY4Zn8I5fXuBLbY+pNHLuauUCd09bD4LQS3nnDHbm25XUp7gCaqTjdf4u9I
 l1rU/BmE4qvIQ+mFxd4OIHc/OnEy5NSfcLDbrGGcGOzK8VH1OlBcCovlvZwP08FPCiwE
 YK2rqumlhVXbX6kn+M/85Gy/j3cTkI43avbbWeq5vS45ImCN3DCBIdLFSqBe+4yMYdt1
 4TF1v3ejSh5qjtAVlI//sw72d+aLLDEQH53ldEDTiycoLvJW2Lq9e2gDuHF184+xBpZX
 xZ7+g/oa8DbSiaAUFiLcWFejHJ/w4mDd+cAT+1SCfvXgeUrDMFtrP3t3OZ6oQ1oF2sYI
 /zaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X/S+8zEUBS7YPWXh0mAqGVkUFdobNHA//t57aWOlO+4=;
 b=SqExtEuQucuytJ72PFGKnFc8Yg+Ly4xRFk/oPyrfpHV0HgJEwup+OyBkGmr/Ye5Rob
 edoSgjtmzIzOCLSle0Dr8hgnFY55Yc/zTg8ERO/ocwf95OeA7u1W8RF45YioRfwWhJbr
 2q3yeOZFygUhKj1djhEzeYnEPTWDFUIPwaEjE8ynS7LsHbgHpAQu3KF7AuUmvh8QLhCf
 9f/uoD67xO7/KM1JoLeXmZz9IImJN/ltiZsO/abLxYbKU4wi/E/LdHkrNOaJB9Wxiri6
 IP1POFUqlFOhO0wYJCpq81mPYIKs5mUiFfprDyySt1lxLhVSfU8z0YZmAyNAQZUsjRjU
 /WlA==
X-Gm-Message-State: APjAAAXDWpxNwP7fUv9OSnXYPNbYCect9s891vSoLci0cFfBye6JZmJL
 nURr2cs7h+765xOO5En+pc7VIoK51OFkiTYlOuLzcA==
X-Google-Smtp-Source: APXvYqznkISjUcXtLp+VkfjA6pxHi4B1lny+rN+Akp/yO+kT7twW3hkaC0kEiE9XwLmGt3T5jChCJ0NAh9DVMIZAEd4=
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr4897335wmk.124.1576583027108; 
 Tue, 17 Dec 2019 03:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20191217040704.91995-1-olof@lixom.net>
In-Reply-To: <20191217040704.91995-1-olof@lixom.net>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 17 Dec 2019 17:13:35 +0530
Message-ID: <CAAhSdy03Y7Xj5K-c2-ubBxb2Z=UXnifCSPaUDpAiLewMo6s43w@mail.gmail.com>
Subject: Re: [PATCH] riscv: export flush_icache_all to modules
To: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_034349_219156_617A2D9F 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 17, 2019 at 9:37 AM Olof Johansson <olof@lixom.net> wrote:
>
> This is needed by LKDTM (crash dump test module), it calls
> flush_icache_range(), which on RISC-V turns into flush_icache_all(). On
> other architectures, the actual implementation is exported, so follow
> that precedence and export it here too.
>
> Fixes build of CONFIG_LKDTM that fails with:
> ERROR: "flush_icache_all" [drivers/misc/lkdtm/lkdtm.ko] undefined!
>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  arch/riscv/mm/cacheflush.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 8f19006866405..8930ab7278e6d 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -22,6 +22,7 @@ void flush_icache_all(void)
>         else
>                 on_each_cpu(ipi_remote_fence_i, NULL, 1);
>  }
> +EXPORT_SYMBOL(flush_icache_all);
>
>  /*
>   * Performs an icache flush for the given MM context.  RISC-V has no direct
> --
> 2.11.0
>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

