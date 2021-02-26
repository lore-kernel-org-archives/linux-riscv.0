Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD9EC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 16:37:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C549164F0D
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 16:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C549164F0D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xXd53fiBGOKOxk7IqSuEdBsGCgZrZLfVO04Z+5DrXi0=; b=1CVgdkEqdsFpQCjAn3o+8wdoD
	bAUUlAdjjJwxnXaLq3hnuwnP5qd1Uil+SN7yrqjDUguwBlJvp70fHfW0pQ9vuhdTV3QfaZUICaYwS
	bIY6T6rn5u4Jlq4lU/ACkG7mLQjUJ5XcTnWN5/u581UQVvJf0a5v3AYxFR9P7GEj/lY912161QhHB
	4scEuA5r/B9eKgTLSADDV8YVFMxK/3VM+jI0f4pq9qJORfR3CQqloGZaD0qdaZ3AY/xqBgdH6PS65
	lsQ9pb5qaHo5LpqClpH9gpLXB1mKBHaAX5+7nYdeXculnxmf8D13mNPRR4YRTmi1z9paC4ELGbJi5
	y0eUP+zOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFg7Z-0004Bv-8L; Fri, 26 Feb 2021 16:37:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFg7X-0004BE-63
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 16:37:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id w1so15891789ejf.11
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 08:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KMT1d1Gs8BZ9utr+GYuVKfNILn5qh+CRx49B4cHumdg=;
 b=ifH+WRoVDCq7KD0/hRxdhkyVlkjwcLAgzep2Rkx2WPSYpla3PHPRxxkVx2i1m4onFR
 Qu5bA6//9R1+62IPc4K4EeUb7aEAZUfe3xtXQcc1Gt5kggS0VsrITKQXGrBtsmhGSI4M
 j1Z3dNOpDaDHvSywSFOrR0Jhuu+Nt5eB49arcRM51hQxO629xa7tCHhJouIfYVnfi5cQ
 jzROWH+L/B/+jWkMiSh7GjqPCc9KDj81cn2m4TgpWgSLOkxdqEmtQOTYJo7D7KlyZdGW
 Aqi3dQSBUKOljFQLCc67tYRvL/f+0LSNOR9Myq4saHf+7SgEwdKQk/XkhhHk9TONunp7
 DeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KMT1d1Gs8BZ9utr+GYuVKfNILn5qh+CRx49B4cHumdg=;
 b=OFa7VwJDJR0HcTy50pyYznwOfEmMhop97HcHaWJsD+i+J9Yi9SRI7IoF9YPoczbkyT
 c3AZCYAbKSkhyWNcSXckvDawJP9SX9LqW+BNINWAvc+Mr5VHwuysSz90D0pYbnBjLU7Z
 ckI4K6DVlmNKhIXTi1henTm3+FhT/EZ3cXvbggFyZ0YnX93QQmdqU0/wOtcFY8r2z7Qw
 sWL03v8U/6h38KO5pexp1sBBnzOQj3qinUpm0iKMs4BD3nutFxFDrDmE7/mKs/ESKsGi
 KSOPGNi/VuKnK76ThD+MFGbppiMVzSW53NLxbfS2hMSXEoT7LmUeBjE4Z0uZpxyzcTOq
 SJ+A==
X-Gm-Message-State: AOAM533uzatxL2h0Kzbd2cBsfRGNaS2cbgFduH0Ctkd4dTzjo2oop4ic
 A08m1aXnhIGmdHjkeGPOFTM=
X-Google-Smtp-Source: ABdhPJw67rlPCl8cTfCkX5Bl7e62XoaFKe8iFWv2hpDqnNWTNfIT4TN/iXzQ+BnJP1FtmF07xkkc+g==
X-Received: by 2002:a17:906:5797:: with SMTP id
 k23mr4142769ejq.489.1614357458064; 
 Fri, 26 Feb 2021 08:37:38 -0800 (PST)
Received: from mail ([2a02:a03f:b7fe:f700:a502:29ea:4ea3:1c47])
 by smtp.gmail.com with ESMTPSA id f5sm662940ejb.64.2021.02.26.08.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:37:37 -0800 (PST)
Date: Fri, 26 Feb 2021 17:37:34 +0100
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [v2] linux/compiler-clang.h: define HAVE_BUILTIN_BSWAP*
Message-ID: <20210226163734.hjfhzwbqzedqjapy@mail>
References: <20210226161151.2629097-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210226161151.2629097-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_113739_338914_87EB440D 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
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
Cc: Arvind Sankar <nivedita@alum.mit.edu>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-csky@vger.kernel.org,
 clang-built-linux@googlegroups.com, Sami Tolvanen <samitolvanen@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Marco Elver <elver@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Hu <nickhu@andestech.com>, Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Acked-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Thanks,
-- Luc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
