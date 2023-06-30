Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2051EEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRqSbB+FJcd+LpBXXy0Wui5v7STNuSWJcCt8MZO0bQ4=; b=wKhK8rbARfmL24
	OMrYv6ZANViqj3Eb3CcrY9GqIfIWPac7W6r0TzWCSl5MrU+s7fsau2sCBvSqSAUNa3jnRjakDyMML
	iznF/A2TAH4KyiggcbVPfyPvdGqx8JtMfEPw3oKUChKydBVNSc+VRzF89fDSxSCmv1KzwJZ8AIWNq
	2hVfq0JP1BrCBXVZONSOYlxgiT+zRsxj5WgFBSJLLLa9XvgmtkWLPcoxpUMKcHE22fIn28pq++dNf
	DAGDxhQtU15nbcCTUuSDKwg58xuiRKgaumY3t7hSZSY4G2hqoaphkNJWN1VXHG2ip/XatdM6lR8lB
	AhvPSboWARX29MOK54aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIpu-004Im5-2P;
	Fri, 30 Jun 2023 18:27:14 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIpr-004Iju-2p
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 18:27:13 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-55767141512so1200966a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149628; x=1690741628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5t/XCescOSH3WrNyDablW8O75mx4NM5DVxxt7h12xmA=;
        b=LXTFdVugLTfGdcztpl1w2i9zg6mOiIcldrFYXDwHLgZCmp/TrhXKsJ02A6K+EML7zA
         cQfqy8eoBYrQGKV8bk7qFhFFyMS3PlCs0enpW1ivslO0K0HawB/c7SqpufuZd3aIm6Fb
         71Yk+FVuiiqRdEousZgGpKXlzwT/s9JQh6A1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149628; x=1690741628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t/XCescOSH3WrNyDablW8O75mx4NM5DVxxt7h12xmA=;
        b=ej8mmvKL+Y8Lv82S0EaiLBrUBkljx+PLFMJANc3/oQevFAf7q9T10wDxXdWMttUyzf
         JeqlEnqmiHG1mxBilhj+sNL8kG0JTzsQYAwxh3dk5jiV5zm+tq9gWfA6nhE0dE5/L+Tz
         pFWHxpnnz3L4xoH02T9VaeD2NzLJwt4lYpbEf/bKcuc99OI1kpWntuvfm3lAMUfcBn7B
         0JQOcE6pVJ2BpkfCdhZO07jZqRLCxqHhbxlM2uXCFgTjX8a7tWgHIWDYKkcD+yj+3WCe
         LOiG2eEK61CqqwXHW53XbMo+ay/bTmcBq6EGsoq9luBxZIbuKKY2LO/isKw3g1PdfLvD
         0dWg==
X-Gm-Message-State: AC+VfDyiAcxfqhEd5Unn8tJffVU1xlDbgadzWe6Id2seAMyET5nouBbM
	ZiwrpsQDigXCYZXWTBUSW6814A==
X-Google-Smtp-Source: ACHHUZ7ErgW8c42xZjlrONwyIDX0fbYZnPFTbXDgs2IWbzVwX2JCviMz9xGbIQ4Z/aYlsMj05YSgdQ==
X-Received: by 2002:a05:6a20:6aa2:b0:10a:ef63:4c33 with SMTP id bi34-20020a056a206aa200b0010aef634c33mr2672145pzb.47.1688149628100;
        Fri, 30 Jun 2023 11:27:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jm15-20020a17090304cf00b001b016313b1dsm11094410plb.86.2023.06.30.11.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:27:07 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:27:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] riscv/purgatory: Disable CFI
Message-ID: <202306301127.9730BE4@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-13-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-13-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_112711_913834_18515555 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jun 29, 2023 at 11:42:50PM +0000, Sami Tolvanen wrote:
> Filter out CC_FLAGS_CFI when CONFIG_CFI_CLANG.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
