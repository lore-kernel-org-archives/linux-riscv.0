Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E94C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTn8+sZykTqEXad18bIds28CccmlxAnwdEV2FcCZuwA=; b=mG0Ylj3yrYIYCJ
	T+uNOS02rd7//rmDvApl8N3j3GHHtcG0f5fhDQosFuHLjMfYUJTeL2U1Nl/ctU5iPNIT8AKbOOCEl
	8EHQNy+PogoHeFjaBFSK/jO2WKujO+ruV+VqfzPsPWkAFtxWkfqjv4fgNeJ63WEyJ4XwWJzDgAMMG
	93Rkhlche9dkhQUdL7OJcyi2gzSKGqtJEdc1LxZd8hcG+Ayu2HBgqY98/lyi2zo/vEW9mW451TbG2
	dSnu7nTQ9ZJKB1JtCCjAkyRbFCPl4iDS/tcpNxEimZrMgLtjjC2T8HpzUU5PTU+sT+o83UO6D6hV4
	dh+jB5MAnJG8kyOoYl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXTc-004svd-0c;
	Fri, 22 Dec 2023 04:49:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXTZ-004suu-2q
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 04:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703220572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9vfCqZrbXnu5yi8/YqW3EBsQpMR0fcCm9TF9vlDRItY=;
	b=LOEhZqliUqAswVrCHzKvCeyf5R2W7zv1SfoqRDRU2CSHo3FzGOdgkjnw1IL9NPo9VEhksR
	brGXRVvdMO5eT3F/a4V00hSsv+3lpVapTzwOEmr9Uxz3gc3HMTWxmclvoH15EKB8S6ttrj
	DXmuPLO8okys7tvqfysHEO0wuhKTqB8=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-5X4_J6DwN7as85VisnMAoA-1; Thu, 21 Dec 2023 23:49:31 -0500
X-MC-Unique: 5X4_J6DwN7as85VisnMAoA-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5919dd8f9a5so1542069eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 20:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703220570; x=1703825370;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vfCqZrbXnu5yi8/YqW3EBsQpMR0fcCm9TF9vlDRItY=;
        b=GlwcAZolf75vaPogVe6wJBA3FGGUGBEsZRd6DA84MjzGmrKLWKPE9NwtAkaA5VuqVv
         oxlfz+wEcTZvMiAxXbrZBu2lWu4ggmPXrzFcMZXRFGFAvqP/5nTvYwRDAyuAAnZJ/xkg
         4PMK6SbMdrDIXdHOjURkGySBvmVQ4oLLsKcTLxvrJgHMBDGtO9+4xePNJesr3UUHIOvp
         mijWbFNmfhZsXvMEDXOAREmnSjPNOhsP1F1nvVn1B7pHxI2UswQuzb8GlZZAvq1yKp4v
         wMEjcCLzQGpeHbxo33EaxEZ/4ojmAxVQFGguZ9SiFp42a2QOFJWJoEx5bR09npPrfhE2
         75Mg==
X-Gm-Message-State: AOJu0YxwpQx2C/bEm74QpLgEfdHr4v9vehdoxfvHvTWyvIjrQnPJvEt3
	pYygWdvyNBYkON5oDZGUIy4xY1qQxPImvUOBS5sM+rjt3gOONC7DAIqE1SwFX7AgYWOnzDefVkb
	igQeV9E+XGTn9fu6HzD6wK9tv7D843XZyRc/8
X-Received: by 2002:a05:6358:948c:b0:172:d79f:1841 with SMTP id i12-20020a056358948c00b00172d79f1841mr837810rwb.7.1703220570271;
        Thu, 21 Dec 2023 20:49:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY7uMU6tQ6yQZ0W8K7Tvw7mp7kvFSDzkp8X9G+PFkXwA4djJ44RpOkZdZf4Xn0yD0J+O6flA==
X-Received: by 2002:a05:6358:948c:b0:172:d79f:1841 with SMTP id i12-20020a056358948c00b00172d79f1841mr837796rwb.7.1703220569870;
        Thu, 21 Dec 2023 20:49:29 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id n15-20020aa7984f000000b006d539fad917sm2425917pfq.65.2023.12.21.20.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 20:49:29 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: Leonardo Bras <leobras@redhat.com>,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2 3/4] riscv: mm: Remove unused TASK_SIZE_MIN
Date: Fri, 22 Dec 2023 01:49:16 -0300
Message-ID: <ZYUVTFqvIIqv7D9O@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221154702.2267684-4-guoren@kernel.org>
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-4-guoren@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_204933_994335_11142AB5 
X-CRM114-Status: GOOD (  13.50  )
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

On Thu, Dec 21, 2023 at 10:47:00AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Remove TASK_SIZE_MIN because it's not used anymore.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/pgtable.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 74ffb2178f54..e415582276ec 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -878,7 +878,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>   */
>  #ifdef CONFIG_64BIT
>  #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
> -#define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
>  
>  #ifdef CONFIG_COMPAT
>  #define TASK_SIZE_32	(_AC(0x80000000, UL))
> @@ -890,7 +889,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  
>  #else
>  #define TASK_SIZE	FIXADDR_START
> -#define TASK_SIZE_MIN	TASK_SIZE
>  #endif
>  
>  #else /* CONFIG_MMU */
> -- 
> 2.40.1
> 

On torvalds/master:

$git grep TASK_SIZE_MIN
arch/loongarch/include/asm/processor.h:23:#define TASK_SIZE_MIN TASK_SIZE
arch/loongarch/include/asm/processor.h:36:#define TASK_SIZE_MIN TASK_SIZE32
arch/riscv/include/asm/pgtable.h:881:#define TASK_SIZE_MIN      (PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
arch/riscv/include/asm/pgtable.h:893:#define TASK_SIZE_MIN      TASK_SIZE

I can only see definitions, without any usage, so agreed on removing them.

FWIW:
Reviewed-by: Leonardo Bras <leobras@redhat.com>

I would also send a patch for loongarch, since they are in the same boat :)

Thanks!
Leo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
