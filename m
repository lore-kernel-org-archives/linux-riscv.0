Return-Path: <SRS0=yqZG=DL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9506DC4363C
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 23:20:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4961E20665
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2020 23:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UO7zQ8sN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="ksGLoj1i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4961E20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=WVt2J4QIji4XkDfXVMTxHvsCpi7vCDrFylO5SWdVrnM=; b=UO7zQ8sN5HYRcrUTNzdW2XiFG
	iEJE0xKIoi7JHfbdfTKf0+Ic0CGRSxINF3vB5joFrb9YDXvfMfqvnUHz/hR2F/ZELIkS6BjLau1So
	2OSdT3XimomHSxaea4P9dyzOxMyb1oAFc9A0Paz/4DFSebcRpVcMhFobcL6OJ0EvnDSRK+WglGLKw
	mHlnv6/N01i5gUvVpe9wJ7UHVhXgdXq+c153wYu+biN47RB/qPl2UPQtOoXUgA51BrvVABBl0uEMV
	YUoP5HPIAeH0MUFgXhjyA1JGkOGCj+mgDNWo0NgeS/26Dp/wmFhMXeWONjetiVitW9rsmEfqLVxQ8
	e+3WYwCAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPDJ7-0006kM-Oi; Sun, 04 Oct 2020 23:20:45 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPDJ5-0006js-21
 for linux-riscv@lists.infradead.org; Sun, 04 Oct 2020 23:20:44 +0000
Received: by mail-pj1-x1041.google.com with SMTP id x2so4272028pjk.0
 for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2020 16:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jcJgO6uXgL0y2gYnRqgUThvhgsEJ1n5wWS6ZD66anDU=;
 b=ksGLoj1il+Ym3SZtJ22Ri9Ps5d/OGXKo8qz5gf0hgrnOG1fgBwXXUaJuNvn1vPDKKG
 lMwHm5P3XbMeyLZXIit9GOGwWV7gJ3+QFGBrtuJ+2D38ZE/f7bQgPdBDvnqXD5AdqnWv
 QnDMxUP9gC6DdIw8eqvqoG/V1r9tlwvsl8Pl+dt2YumkQ3fyxlQTCRHUKWSxLNoS4zvS
 Yw0BwDztZW4cjVn686I9JBLRLBDpj+b/uehU7dV5QqWm9Po5Nuc89DTnKRW+NE5FCysz
 nZJ+2ZbtNp4FcA1SPGUOEIr65K6nt4/OsEHJ5ZcZLBEBSaoYSEy0qcRL16QPKuoNZsPC
 vG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jcJgO6uXgL0y2gYnRqgUThvhgsEJ1n5wWS6ZD66anDU=;
 b=H+UJJxN/aeGLKk7/loeIAuysbA0YD0eTR1/1xpjI4kXkK5mahsej7c4MwtN6LpFBKK
 BPdONgFoYiEiK7gYFVw16dMDzLQ3bwWHLD1oDkCQs0PWKszBWC+UdtGyQVpt6Qs7F0m9
 UPtfcr66V+DfZ6v4RPiALZ7/W51DABcSyHlWcTpfmCMib5yVObE4nhi32RA8iRIW7SMm
 aQ+5EL6kEJ7k/2CiHrahBQRZEQl60kXU1+AXEaV5Dvmkv6lTlCkhsPBJABqbSUkdgWCE
 sKZTrOYp4icqYF1M8R6ebRy7DtmU5+Cno0NNbIEX4W6tWTW6cqoZsm86LZ6ff4P9qYi4
 ZmcQ==
X-Gm-Message-State: AOAM532IhTn/LvkAB0/cgFOrCC0HPZYx03cwnA4H2NFUUnA3aqdHqjst
 tVGK7umRzkjUtUySqH8w7t0Xuw==
X-Google-Smtp-Source: ABdhPJxnItVYLJO4Qv3u+Vya1S62lhz6G9wsZCmXGoKkDuzMmnMswIJOzjkNw3l1yq8j54+Fmlxivg==
X-Received: by 2002:a17:90a:3984:: with SMTP id
 z4mr13391873pjb.131.1601853640498; 
 Sun, 04 Oct 2020 16:20:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h9sm9460508pfc.28.2020.10.04.16.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 16:20:40 -0700 (PDT)
Date: Sun, 04 Oct 2020 16:20:40 -0700 (PDT)
X-Google-Original-Date: Sun, 04 Oct 2020 16:20:36 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Make sure memblock reserves the memory containing
 DT
In-Reply-To: <20201001190456.2860155-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-b6639b2b-fb32-4522-b5ec-63ccb8886dfe@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_192043_265897_75C3B387 
X-CRM114-Status: GOOD (  22.24  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, aou@eecs.berkeley.edu,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 01 Oct 2020 12:04:56 PDT (-0700), Atish Patra wrote:
> Currently, the memory containing DT is not reserved. Thus, that region
> of memory can be reallocated or reused for other purposes. This may result
> in  corrupted DT for nommu virt board in Qemu. We may not face any issue
> in kendryte as DT is embedded in the kernel image for that.
>
> Fixes: 6bd33e1ece52 ("riscv: add nommu support")
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>
> ---
> @Palmer This patch is applicable for v5.9 & before. This fix is already
> part of the "RISC-V: Move DT mapping outof fixmap" patch from UEFI support
> series. That's why, this patch doesn't need to go into for-next.
> ---
>  arch/riscv/mm/init.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 564e0be677b7..cabf1697e748 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -510,6 +510,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  #else
>  	dtb_early_va = (void *)dtb_pa;
>  #endif
> +	dtb_early_pa = dtb_pa;
>  }
>
>  static inline void setup_vm_final(void)

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
