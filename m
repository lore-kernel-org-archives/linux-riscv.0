Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22FFC4706F
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 04:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+SB7FzYOwxpDz5Wfmq1qwSEjVaYVt6uzoyh5YkSZQD0=; b=d2Af5E6udU/8Mz
	zRpeF3mEbSeaGmaUmCZzdtGBoExUD8h0KXcmKiKpC149gFXyBlC0L8tmEwNr5RoTuP8v66JJAly4r
	dbKeyZDWhgeX2rO5OGwnsalsnZSEZhOFcQPtN4d+ErL/62Dc1cNXDYiG5Wp4hVFyq8728yQGmSkv1
	aU2BHb/Uhez0vMcfQnwxA1MAAVtHMK2nctU26Hvg2kff+Orojinw52w5WDWaRfMbMMlWCKUD0xCnI
	fmeaiS1oyVZr1RNMkXSlpetpVckYyyEqR0U9aEt6SpwCVOmgJXd/2O43M/myguEdt1Xd4j05YYB6+
	0VZVqHKOCWvRqUcsg9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLEuO-00Cn7p-34;
	Thu, 04 Jan 2024 04:00:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLEuE-00Cn78-30
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 04:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704340828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBYuqGL01aH65sRzp3Rsp7NBWvcHS/OIZjseRKkmKSE=;
	b=dWrhb35AcrgXyVv7VgnMwoTb9XXRUfy+XmuNN111TPs0fjuVSd51UGeahaZdvo4qkGEXRm
	cVH57vH5PYjPA0e9k9C3NX3VYbfDHpjk2ecb+9aDpcw6y48M/h8noXFQqVNnuzU+nK7b/d
	aV9ASXMgfkj4Egk0K6/n7Yub+zF/3Jo=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-q6omgmDXNO2bTbYTTszdTg-1; Wed, 03 Jan 2024 23:00:26 -0500
X-MC-Unique: q6omgmDXNO2bTbYTTszdTg-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6dc3178ae1bso152277a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 20:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704340826; x=1704945626;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBYuqGL01aH65sRzp3Rsp7NBWvcHS/OIZjseRKkmKSE=;
        b=Kjn7bvl1GhoRCdaNexVRYY3+HYC6hvuAntq1Xqy2YEk4tC7NTUjsLXczHhPXHPvL8V
         Y7JXJomwSJ4j1QHBy1ordr1ENSNKK2nphWc6LdfBygui94Q7ePCbanyp9BONyKjLgVaI
         nt0DtvSgLxpKCQfYaHU14vjGFB4cuSYDL28JUeEQdDbGbj2MpwzJK67wXbphmP1HkZZL
         +UmHS6TmYHJpctr8RCwIPtjPLGMTzmreI4DjXZna+VrMbch2yO+3EiMaKRVwXKJmchJP
         eKdEr5gzvJei1QBeWxml0VncQVgebfkBrqLuD2QTEqj2PtiAy679PRNTJEOWTEY7Lkwn
         cWaw==
X-Gm-Message-State: AOJu0Yz2vKydid4Fmh+h/RIkW7HnmdhwPTV2E4D51tpc7hcGvC5L0lGs
	MrXAdogfbdMJnks2FCHp1X9muteXUcrZih6JDjWtiafb5yzn9AsiTByE5Cg3O2PmFxP0IjJJ2ey
	i90w96Q2lljz86OnaDS4X+yaAPqAATaN9QcIH
X-Received: by 2002:a9d:6195:0:b0:6dc:386:a236 with SMTP id g21-20020a9d6195000000b006dc0386a236mr82616otk.47.1704340826221;
        Wed, 03 Jan 2024 20:00:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYCFaNNcVbXHq19hlObccAYpVr3fPXzM+NW7eJa+gC+TOtT2xTCMbEvFLXeyLlWyifJIETXg==
X-Received: by 2002:a9d:6195:0:b0:6dc:386:a236 with SMTP id g21-20020a9d6195000000b006dc0386a236mr82593otk.47.1704340825954;
        Wed, 03 Jan 2024 20:00:25 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id x9-20020a63db49000000b005ccf10e73b8sm23041671pgi.91.2024.01.03.20.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 20:00:25 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Subject: Re: [PATCH V12 03/14] riscv: errata: Move errata vendor func-id into vendorid_list.h
Date: Thu,  4 Jan 2024 01:00:14 -0300
Message-ID: <ZZYtTryGpoMk7Gt8@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231225125847.2778638-4-guoren@kernel.org>
References: <20231225125847.2778638-1-guoren@kernel.org> <20231225125847.2778638-4-guoren@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_200031_044356_B1A8BB08 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, kvm@vger.kernel.org, peterz@infradead.org, paul.walmsley@sifive.com, bjorn@rivosinc.com, virtualization@lists.linux-foundation.org, conor.dooley@microchip.com, jszhang@kernel.org, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, anup@brainfault.org, unicorn_wang@outlook.com, xiaoguang.xing@sophgo.com, wuwei2016@iscas.ac.cn, keescook@chromium.org, atishp@atishpatra.org, chao.wei@sophgo.com, linux-kernel@vger.kernel.org, Leonardo Bras <leobras@redhat.com>, palmer@dabbelt.com, wefu@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 25, 2023 at 07:58:36AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Move errata vendor func-id definitions from errata_list into
> vendorid_list.h. Unifying these definitions is also for following
> rwonce errata implementation.
> 
> Suggested-by: Leonardo Bras <leobras@redhat.com>
> Link: https://lore.kernel.org/linux-riscv/ZQLFJ1cmQ8PAoMHm@redhat.com/
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/errata_list.h   | 18 ------------------
>  arch/riscv/include/asm/vendorid_list.h | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 83ed25e43553..31bbd9840e97 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -11,24 +11,6 @@
>  #include <asm/hwcap.h>
>  #include <asm/vendorid_list.h>
>  
> -#ifdef CONFIG_ERRATA_ANDES
> -#define ERRATA_ANDESTECH_NO_IOCP	0
> -#define ERRATA_ANDESTECH_NUMBER		1
> -#endif
> -
> -#ifdef CONFIG_ERRATA_SIFIVE
> -#define	ERRATA_SIFIVE_CIP_453 0
> -#define	ERRATA_SIFIVE_CIP_1200 1
> -#define	ERRATA_SIFIVE_NUMBER 2
> -#endif
> -
> -#ifdef CONFIG_ERRATA_THEAD
> -#define	ERRATA_THEAD_PBMT 0
> -#define	ERRATA_THEAD_CMO 1
> -#define	ERRATA_THEAD_PMU 2
> -#define	ERRATA_THEAD_NUMBER 3
> -#endif
> -
>  #ifdef __ASSEMBLY__
>  
>  #define ALT_INSN_FAULT(x)						\
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
> index e55407ace0c3..c503373193d2 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -9,4 +9,22 @@
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
>  
> +#ifdef CONFIG_ERRATA_ANDES
> +#define ERRATA_ANDESTECH_NO_IOCP	0
> +#define ERRATA_ANDESTECH_NUMBER		1
> +#endif
> +
> +#ifdef CONFIG_ERRATA_SIFIVE
> +#define	ERRATA_SIFIVE_CIP_453 0
> +#define	ERRATA_SIFIVE_CIP_1200 1
> +#define	ERRATA_SIFIVE_NUMBER 2
> +#endif
> +
> +#ifdef CONFIG_ERRATA_THEAD
> +#define	ERRATA_THEAD_PBMT 0
> +#define	ERRATA_THEAD_CMO 1
> +#define	ERRATA_THEAD_PMU 2
> +#define	ERRATA_THEAD_NUMBER 3
> +#endif
> +
>  #endif
> -- 
> 2.40.1
> 

LGTM:
Reviewed-by: Leonardo Bras <leobras@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
