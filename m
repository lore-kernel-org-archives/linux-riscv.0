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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2320C433C1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 23:37:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E3E61A21
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 23:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54E3E61A21
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sb/Q6r388kjDbgCw1T499Rh93pkiBJFolWwsmNE2HGQ=; b=WQiOK8QUGL0v+IyM6n+EXd941
	psqMcHvQ5tVFnmnTkoNv5QrDprylscg/Y63iXx01dal41AtmWmgzxvbACzBYye48CqwM2TPm1TzkQ
	ruQh6j7xr3w1lQOKpWKrU0wWByOemhzIbNbPk9PsjLQwrLHpjTmgmzD5aCGnyzxQ+amX5IgxwbWdR
	YxAxuZPCm+GL48UbOzF/Zuboz5n80pJO5foBi+T0k8S8E6G8gRu7VlKW/JEYECcu0FAPlNGFbNjjs
	aWfiUrOyMr5e4ciSiIqvFYQgupNvRJ0nTmQRSmFPhz16Mfg+N58e5h5JbMs86dBVsxDQ6qOo7eUOE
	iRUTvhxGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPZX1-002NBX-I9; Thu, 25 Mar 2021 23:36:51 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPZWx-002NB5-7D
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 23:36:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id c204so3655544pfc.4
 for <linux-riscv@lists.infradead.org>; Thu, 25 Mar 2021 16:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8ub3+KaVHR67U2QACzlICSww+btiIMyI8S4cGZM+QbM=;
 b=YNP3csUtke1uWeppGyLz3d/mgtKAW3dwkcruzfL+2fTZ9nCh9raBIGfyKTsPQgdbdd
 RNO3cYBsYF4/4yjZ7h+dF05qxq6/lb7hjDmm1od/dg7dmW9SUazvNNUWdtSarZhh4oMR
 bhf2VaYwkD+R02AHCM41L9lJSqs+Ha24dbFD2A3iTZjx/hNHeYjXQ5vdY5crbT+w8cu9
 N//W8D8jy2WtBCkYL9naqXhCCF+dCQxR/lKsQtMnq4Ml38nim+7M7y8QzDZ5NmgdwDKa
 l+jMnJE3i38tUeQfjk4F7KAMwYzbtIqpLpwqLlCLrkzo1p+9Mlk2SEAZqwbiuok83yQy
 RF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8ub3+KaVHR67U2QACzlICSww+btiIMyI8S4cGZM+QbM=;
 b=Sy7FGulx9vRhn3vlC19/peT5qzvIfDK90D2t5LUMF/zCjAIj2bKMNKP5OlLc8gzsoo
 ExvrV76qIHKKjxS9z4VU7I9hGkfJgdjm5UlMpFbJm4fQiaGW4cCqSbtJqNa+yAX24jqs
 nkP2/g7RJcnOOanGlhN39eO+HM+qK8zTglzlI6df+FfMo7OWeJnCSqtu7hcC/rspZEho
 sojZERgxu+1P97dRg1BijlU+S11cAryYTP3Ii3ra6pFp8usdI09kUzmg8VNpZQmhG7/b
 IgixgTaJ0RmqYuFJHhxqBoqEtVRCOXxyXgLdz4tazomwZnDlRT7iKWBXb14EsGm9ZQt9
 MhvQ==
X-Gm-Message-State: AOAM531Meu2dq9sJaxNkeIJT5114FPNFDpxdU8K8n0AUoXTFBqb5JaHW
 8q7IeQjYM9JmiE9roKHesF5YeA==
X-Google-Smtp-Source: ABdhPJxeSjRgYZMHzSWbNBum6+QgRSNLMUeyLP99yS84q++2Qmz+Pr18oxx1VuVkVBZwVk53X4csDg==
X-Received: by 2002:aa7:942d:0:b029:1f2:cbc6:8491 with SMTP id
 y13-20020aa7942d0000b02901f2cbc68491mr10125053pfo.53.1616715404666; 
 Thu, 25 Mar 2021 16:36:44 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:1532:a374:78cc:c35c])
 by smtp.gmail.com with ESMTPSA id j3sm6263561pjf.36.2021.03.25.16.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 16:36:44 -0700 (PDT)
Date: Thu, 25 Mar 2021 16:36:40 -0700
From: Fangrui Song <maskray@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/3] scripts/recordmcount.pl: Fix RISC-V regex for clang
Message-ID: <20210325233640.jzi7uvaohvqwixiu@google.com>
References: <20210325223807.2423265-1-nathan@kernel.org>
 <20210325223807.2423265-2-nathan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325223807.2423265-2-nathan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_233647_520885_63A52433 
X-CRM114-Status: GOOD (  12.20  )
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
>Clang can generate R_RISCV_CALL_PLT relocations to _mcount:
>
>$ llvm-objdump -dr build/riscv/init/main.o | rg mcount
>                000000000000000e:  R_RISCV_CALL_PLT     _mcount
>                000000000000004e:  R_RISCV_CALL_PLT     _mcount
>
>After this, the __start_mcount_loc section is properly generated and
>function tracing still works.
>

R_RISCV_CALL_PLT can replace R_RISCV_CALL in all use cases.
R_RISCV_CALL can/may be deprecated:
https://github.com/ClangBuiltLinux/linux/issues/1331#issuecomment-802468296

Reviewed-by: Fangrui Song <maskray@google.com>


>Cc: stable@vger.kernel.org
>Link: https://github.com/ClangBuiltLinux/linux/issues/1331
>Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>---
> scripts/recordmcount.pl | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
>index 867860ea57da..a36df04cfa09 100755
>--- a/scripts/recordmcount.pl
>+++ b/scripts/recordmcount.pl
>@@ -392,7 +392,7 @@ if ($arch eq "x86_64") {
>     $mcount_regex = "^\\s*([0-9a-fA-F]+):.*\\s_mcount\$";
> } elsif ($arch eq "riscv") {
>     $function_regex = "^([0-9a-fA-F]+)\\s+<([^.0-9][0-9a-zA-Z_\\.]+)>:";
>-    $mcount_regex = "^\\s*([0-9a-fA-F]+):\\sR_RISCV_CALL\\s_mcount\$";
>+    $mcount_regex = "^\\s*([0-9a-fA-F]+):\\sR_RISCV_CALL(_PLT)?\\s_mcount\$";
>     $type = ".quad";
>     $alignment = 2;
> } elsif ($arch eq "nds32") {
>-- 
>2.31.0
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210325223807.2423265-2-nathan%40kernel.org.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
