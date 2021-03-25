Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CC2C433C1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 23:39:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BCD161A1D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 23:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BCD161A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bchSGS8DL+dccbusN87HRynm9yOBfO8g53sZjRDSy4Q=; b=PkwtimFxnhjmTFjwcFCNaEzss
	hwMS3G+/RNCxf7FaSi4hiXI4AxSjdwXZS1GrhzNJy+TkYepkfdS6w7EySqoH8FG+p3CJXtgX4cHCf
	UT75OWl/VwgmCg2ToME8VM9fvuEq3gm1Q83NUmtRNc6FiytnrCPIElEZuSJB0p2E4r7GPoW6bbyGj
	YEs0cW1Dg6lBMehNO6rod0FEwLjcmn/ugbSoYcHpuziskJ7KUuOl4l+yjwSuZSnJF9ozODES3eNSm
	RnMzsSufrFB23sAY2ovADbE0MqAImWRiKRCoNuyye3VLhdXY1Gmx8o8YDNpAxl5q8u0pK0CljqpmQ
	VV1OP1LeQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPZYt-002NIY-Tv; Thu, 25 Mar 2021 23:38:48 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPZYo-002NHq-GQ
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 23:38:44 +0000
Received: by mail-pg1-x530.google.com with SMTP id v3so3401391pgq.2
 for <linux-riscv@lists.infradead.org>; Thu, 25 Mar 2021 16:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SsGNl6TxEdcsmrF4tAO/a5SQ7vMBXF6HcqOFeBkJZaA=;
 b=YBLkudSekC9YH98hJgA55FU7IVE5MZyUpALZY2o1J7Ngkh3ltuqb6Q6nznhniFA6Ao
 XPcnjxjr7qgTEb6B5BKrm4bKQBczRRcN03o9gKVyoQiDHB2dK2CxZclZSUtr6BefjxYd
 kN+yz4Nb7d/P1Bdsh9TjfgLHmzOKg+FMCyvXIrMTsRFDl5t/1hbtq8B8RhuG1Tn2KM5V
 /Olo8HuVLcgcDQ7z7Vu/yivH3aLbfP/Ig0Dk4TIy0Cm34zZKS44XPCT8lLWr3WSOlbcR
 cxyjrcJz88D9/rK3grLohcxlIP/moznFZRwalZT5q7LXlWrBKJgrhcoGGw6E8mgc2oeo
 vtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SsGNl6TxEdcsmrF4tAO/a5SQ7vMBXF6HcqOFeBkJZaA=;
 b=iTnWyHX01e/FDhzCOTTJGW6dNf0hBlF2LOqKI32l+PPtynJaF02sE5EjmTWs86DawH
 yrrqKQXpYkRQbUKYUF1Y+LzpWP43rrkHVvZmyOwet1zYuuGn8t2M6kt8rrE0CisDowVK
 n7Vdm3Lv3uW+nv6bQ3Rs/h0NdEiKFC/BT5aPo2+B72V/YrMSgVXydjQRHqYCYrpjZIwQ
 hupyreo9VTM9lQcHVHqtJWGFGR6vmdtFG9XSfWA2TXW0n1GsAF6i3OJafR4V031zAkSc
 hn035p5oUnTQnrH/sDBA9d0e2OTtuJtDNs/U+zZruvVNAf/N8POSbRDBLLo3hDyMw+vm
 nMEg==
X-Gm-Message-State: AOAM530qSrUW6OOEckABEXwy6N2B+ZxjJRNpyMQQzY+WBKHzY6rNeSTd
 mFDicI8iUatul+OaGWOqkW8efQ==
X-Google-Smtp-Source: ABdhPJxyTNoi8awCicMlBT95i1RKLe5xI0PRp4lZMCjKGQIf+tw1BENbvhG4yY4os4qQO6hZgb7uTQ==
X-Received: by 2002:a62:2a07:0:b029:214:fd95:7f7 with SMTP id
 q7-20020a622a070000b0290214fd9507f7mr10221639pfq.60.1616715520895; 
 Thu, 25 Mar 2021 16:38:40 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:1532:a374:78cc:c35c])
 by smtp.gmail.com with ESMTPSA id l25sm7030314pgu.72.2021.03.25.16.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 16:38:40 -0700 (PDT)
Date: Thu, 25 Mar 2021 16:38:35 -0700
From: Fangrui Song <maskray@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] riscv: Select HAVE_DYNAMIC_FTRACE when
 -fpatchable-function-entry is available
Message-ID: <20210325233835.ytcstqdcwtorzkhw@google.com>
References: <20210325223807.2423265-1-nathan@kernel.org>
 <20210325223807.2423265-4-nathan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325223807.2423265-4-nathan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_233842_707408_88EF12D9 
X-CRM114-Status: GOOD (  14.14  )
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

On 2021-03-25, Nathan Chancellor wrote:
>clang prior to 13.0.0 does not support -fpatchable-function-entry for
>RISC-V.
>
>clang: error: unsupported option '-fpatchable-function-entry=8' for target 'riscv64-unknown-linux-gnu'
>
>To avoid this error, only select HAVE_DYNAMIC_FTRACE when this option is
>not available.

If clang -fpatchable-function-entry=8 does not error "unsupported
option" for one target, it means the backend feature is supported on
this target.

Reviewed-by: Fangrui Song <maskray@google.com>

>Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
>Link: https://github.com/ClangBuiltLinux/linux/issues/1268
>Reported-by: kernel test robot <lkp@intel.com>
>Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>---
> arch/riscv/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>index 87d7b52f278f..ba1d07640b66 100644
>--- a/arch/riscv/Kconfig
>+++ b/arch/riscv/Kconfig
>@@ -227,7 +227,7 @@ config ARCH_RV64I
> 	bool "RV64I"
> 	select 64BIT
> 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
>-	select HAVE_DYNAMIC_FTRACE if MMU
>+	select HAVE_DYNAMIC_FTRACE if MMU && $(cc-option,-fpatchable-function-entry=8)
> 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> 	select HAVE_FTRACE_MCOUNT_RECORD
> 	select HAVE_FUNCTION_GRAPH_TRACER
>-- 
>2.31.0
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210325223807.2423265-4-nathan%40kernel.org.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
