Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60AEC25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxNCX6A988EPJmG+Xv1YZMdD3TTWPO3KFKg+Sul7g08=; b=BR0s2JJPnzRFrk
	+jszSOBDkn4jV6HT0DLchv1kjlLvx5ZRQVVSAruLK/arfxxGVDe9NEHdlMw6BUzI/nKAL6XU2QB5x
	OHI4NEaW4vsmGzCQFMx56ADthQ+Nl6EqX3cpJj8AEvgEjLh20corFviDYJLXAuI6oDNqT2EoVOMU8
	tudbt/ulRXUKj18ib7EuqWowxPJw5zfxldXrqLQd7SKMzB64DZsfOUmT93ohPLWmbQvxwaAuH53gc
	t1yiPitiXJI7tMXZvAOKNpi3lAPdPVhEhN9RLpH4TcUwS5AyNe9gzxmdpx1trnbpz4MrKdBxgWYOG
	ZsNpTVlPW+tW2WPCEQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Hox-00000002Agu-0iZf;
	Wed, 15 May 2024 16:49:39 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Hos-00000002AeA-3nzq
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 16:49:37 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6f44b5e7f07so5832134b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 09:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715791767; x=1716396567; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HoV7cV0JwbbBn7RhWLNEmVN8lGKUwH4R+jX2T3SF4lM=;
        b=MhJSWnz+eQikDSCdPEChMb13L9mZ0tLwRQRt051ItpjO21p5GZp7kS7QftAtULLTR7
         NSDhrTxtGA50HavpEEJCu1IT/sNiMO6XjRWuxMsdl4UyMWgKBBtM4qfaV57dvsWcuHJd
         lUpjxIbiTGPmKn94MJo+ntG2xLkRsHeGW++6EHTx4CvrnfZP+uqgsQQWFpYwrks7BpEY
         V4SYvfHncOzPBqIfmxq4FvZmrpo7agJJEmVnh2hL6NrdmOnD9otqvgeUfCyV3r/TG0Ez
         VeWwJ74qMUbjNXQfmo1zot+li/w0azD1rua5P/zOG+sqiWpzTvTnokyw9K8r65m4zJvc
         bFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715791767; x=1716396567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoV7cV0JwbbBn7RhWLNEmVN8lGKUwH4R+jX2T3SF4lM=;
        b=TEg9Ngu5KLpGqXY5O8Snz52sZkRdPXzBs6ZcLA9PMWKyX6KC/tSCDal2wYTG02lU6K
         kYg5TfyvAiSOZNNu8KKLi1hXgqSdcTe7wIk1Jm+rJ1N2et4T855BGBS/amJCzeSwkB8t
         2YStdmxIabZRqsJWn/MixJSML9oqj0tlGUE0pycSwotkX/CK8kZ9DrykGXVVT/H4eqNS
         mSOeQi5OtWcJtoqBjG81YsVaNQDsDJB5Z7PYSAuwKbMze4UwU+s4sXWGog/0cOURlzJM
         UbIfH703gbLNU1KAqQY3DordrwFsJOfzudiQ4dNl3ihav0ABw/M5adYe9RgNxWi41cs1
         DI1g==
X-Gm-Message-State: AOJu0YxJus44MLJBtIlzOksLgdv3hc6SttmgOVPisekCsxhgZHdCfmzw
	XbnFAvi+j2TTwdQk2Gj7z6Xi4SaVOvcSsx6/HalRDmDkTUCKFo5ystQIxs5XWVo=
X-Google-Smtp-Source: AGHT+IGe3OBD6jM1gbubyykp+cGQaPSezSszLGkivme8anrlqDizpz6IK5FP+bm6bslTX2/dsmigLg==
X-Received: by 2002:a05:6a00:1144:b0:6ec:d972:c3d8 with SMTP id d2e1a72fcca58-6f4e02c6598mr16188054b3a.10.1715791766742;
        Wed, 15 May 2024 09:49:26 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:144c:7973:ee0f:85cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ae0d88sm11315503b3a.122.2024.05.15.09.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 09:49:26 -0700 (PDT)
Date: Wed, 15 May 2024 09:49:24 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: fix Andes errata build issues
Message-ID: <ZkTnlEnoFFrQdXi2@ghost>
References: <20240515-comic-sketch-3b40e6676f55@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240515-comic-sketch-3b40e6676f55@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_094934_992582_DD64FF5B 
X-CRM114-Status: GOOD (  19.45  )
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

On Wed, May 15, 2024 at 05:09:34PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Commit e47c37c24024 ("riscv: Introduce vendor variants of extension
> helpers") added includes for the new vendor_extensions.h header in
> the T-Head and SiFive errata handling code but didn't do so for Andes,
> resulting in allmodconfig build issues when commit 589e2fc85850
> ("riscv: Convert xandespmu to use the vendor extension framework")
> added a user of a macro defined there.
> 
> Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor extension framework")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v2: Fixup commit references in the commit message
> 
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Charlie Jenkins <charlie@rivosinc.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/errata/andes/errata.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
> index a5d96a7a4682..fc1a34faa5f3 100644
> --- a/arch/riscv/errata/andes/errata.c
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -17,6 +17,7 @@
>  #include <asm/processor.h>
>  #include <asm/sbi.h>
>  #include <asm/vendorid_list.h>
> +#include <asm/vendor_extensions.h>
>  
>  #define ANDES_AX45MP_MARCHID		0x8000000000008a45UL
>  #define ANDES_AX45MP_MIMPID		0x500UL
> -- 
> 2.43.0
> 

I was going to fix this in my next version but was waiting for the
reviews on the thead stuff. I wasn't anticipating these patches to be
able to jump the queue :)

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
