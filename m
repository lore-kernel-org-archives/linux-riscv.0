Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C73EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qD4ZrnCvnqo7L44AigvkNCIyWZxRrSa+MWHUz8TExrc=; b=ZFrAzK2KI3UTcy
	3DGbDSqbUIOfgL2ctXX5snQs1eUtnrkd5Kv3sTL5LyNvIyGAEkKCK/SdqFevOxPgxnoIzlG5A6bMT
	eyF8GyO3mmszOrPmI1bs/5IJgGtB4EBTW8iOaT9Ey30qQ/jCh5IwwlIc12pQypivHy97LYNR35o10
	3VGkeES+kUXwGD5s7QiQ8Zc7fzwcZudoxCPXg9igFmWTDV0HQm8eIc0QCZxyxZjIjyEo6a4UZcCB6
	eEWgUdYHGdXeMLUYFtNRdae58y/uTBzZo8IxfGXD7+4YYvzctR7jkHoaH4AKNvzbl5FuduEF+5KCZ
	Cyjbkv//0nTIimylYm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGtt-00AGTo-2E;
	Mon, 03 Jul 2023 10:35:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGtq-00AGTH-3A
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:35:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3112f5ab0b1so4735828f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 03:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688380517; x=1690972517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J40dAHLBYs+6jNCvPXKQ8FET9CwOYOul2uRlAFchtyg=;
        b=iGOVDqd76rhLjh7X2a6Q5e0e8jd+GHtjYscGqSI8MLzWyvjZoePaP2A1WEYG8adQ5K
         QxIfBaITzYX1tF6MwCgpTUIDhadocJCWdYhlCEXGPG43pk/9zUFbB8CFNVQ2jh5n/xX2
         Sg+bS/ZJQloKuMnl+xskng+XdAUec+zzWjKiFM2XhFPjmckmvQ2Hjd1h1L7nL4pmEBOt
         aSznGCfKbFUqwn/8I3i0A+NhF0AObLwA5eARKLjWPXiDcIFVEqjy1FKQtPnk07rsRRzz
         J4Eh17PnGcZEd74pJnKyMQKJvZt9FpaJ4ptfL4h2nGmB92o5lF85d6WtULTcZWfUL0AV
         riuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688380517; x=1690972517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J40dAHLBYs+6jNCvPXKQ8FET9CwOYOul2uRlAFchtyg=;
        b=JwjaFC2KYVrh5eZis9VzkzaRRwgItFlZ/1G2xYeYUjYyCaFpp4Gxg1f8zis+zL3uQj
         U4Gf0ojql589wPqJBOkqpIoTL3wxQLIYyHTyQwyBVoxJtnhCtZk64d8kkGo6kraQYaUc
         raovRwHp5KH8uqKs6xVVgzYsPxjQleb2L2bf66Rn66mUv132w9v9JP38pbAaT3hXoohH
         Ni4tcyeaITVGHTEwhtx1yJO8qSzfevDOAjpKj01SbNXexSi69DDKwU10hDnGH9RX+M8l
         Vh99ZqC+G0ep4kKWYjFP4O5nB93CpS/uXydWqufvLLVt7+hZPsDiG7boxNbS9ie8XbDV
         Knzg==
X-Gm-Message-State: ABy/qLYs5+AhBps0vZxBd9vRAYFmQEXdzBhNvXiQYYofrom2d31xhHdu
	z91KIOQyFQgyFEbNGEabjzP1wg==
X-Google-Smtp-Source: APBJJlGeBmzt5GDmk1m6+um4Vg0XHzEHow2LQZ3z3s3wvCCqvafdIhSFB1GZm3Ai6rWjn4XoMZmD7A==
X-Received: by 2002:a5d:554d:0:b0:314:824:3777 with SMTP id g13-20020a5d554d000000b0031408243777mr7601315wrw.48.1688380516742;
        Mon, 03 Jul 2023 03:35:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u18-20020adfeb52000000b003113943bb66sm25177829wrn.110.2023.07.03.03.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 03:35:16 -0700 (PDT)
Date: Mon, 3 Jul 2023 12:35:15 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Amma Lee <lixiaoyun@binary-semi.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	xiezx@binary-semi.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: optimize ELF relocation function in riscv
Message-ID: <20230703-8fe42edab5ff83cea01db4f9@orel>
References: <1688355132-62933-1-git-send-email-lixiaoyun@binary-semi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1688355132-62933-1-git-send-email-lixiaoyun@binary-semi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_033519_021327_7A05437B 
X-CRM114-Status: GOOD (  17.04  )
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

On Mon, Jul 03, 2023 at 11:32:12AM +0800, Amma Lee wrote:
> The patch can optimize the running times of insmod command by modify ELF
> relocation function.
> In the 5.10 and latest kernel, when install the riscv ELF drivers which
> contains multiple symbol table items to be relocated, kernel takes a lot
> of time to execute the relocation. For example, we install a 3+MB driver
> need 180+s.
> We focus on the riscv architecture handle R_RISCV_HI20 and R_RISCV_LO20
> type items relocation function in the arch\riscv\kernel\module.c and
> find that there are two-loops in the function. If we modify the begin
> number in the second for-loops iteration, we could save significant time
> for installation. We install the same 3+MB driver could just need 2s.
> 
> Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>
> ---
>  arch/riscv/kernel/module.c | 67 +++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 64 insertions(+), 3 deletions(-)
>

I guess this is a v3 of [1]? But there's no change log here to know
what's different.

[1] 1683881513-18730-1-git-send-email-lixiaoyun@binary-semi.com

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
