Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86453EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 18:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyAibJxZGKfYrBzO2uRKOy89fADZC8oZkvDVOxdjWTg=; b=QQS5kDDBbtMucR
	GP+rS6gWuBaWGdhVWFJeaI3alDNaFdsJiyvS//NIhftfjY5bUdAR0FzJ0cO7NHLGMB7o3sgym/MC3
	GPdSDrn7Lio0pVS/lRC7yqtWhJMRAnRQbZU+T8BESZihUf3GOlBLbvBxjAidxK4QB4g5mdDnD01J8
	A/oYetj/KvZpM3sSxXSHB6xduRnnDD55Dv/NdzGh8ghE8pgB6RY/2gTDMol5H+9havx/XRAJp+ddL
	QdttyRQBE+XEriPD73zi7tndPf3/olnG8q9qXhY5X2Oo1gguKpEDrzGP3snAuMy3o4DGoogLRTp6O
	oKCTEm16P2wcvkqhWu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIoC-004IVU-05;
	Fri, 30 Jun 2023 18:25:28 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIo9-004IUe-06
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 18:25:26 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-543c692db30so1615490a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149524; x=1690741524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=THzb2mxWSB498SbTKEigAG3BbQmUyfPai6SPDufuYVQ=;
        b=fwgdBLRw/OL24yIe9DR1DbDq0ls1En8ub+t31vUJPas+cneMdfjhphEdaVvHMtIfQp
         Z4KwZyofbAGkDREK40sNwJ1hl3USv7l72P7sea5BRSS6KXuXklxGzctZ2/AuuVvjhYkT
         3LinGnv99CoMpoHT6PSreXbOM+aSwZ75RfenE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149524; x=1690741524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THzb2mxWSB498SbTKEigAG3BbQmUyfPai6SPDufuYVQ=;
        b=aaiYeCE5vgjfwfRQHcQUdqbW9ljxuopiEFrYooCt6GYKHVUQuOqHWIC/P7BiaSB9Js
         qSGkrLgIR4bMj4hzc/dOBKIbb4V0Mir+vdestFrZQND3fxIf7S/HuJKBqheNxd4q+DVF
         wlfVQdcFrE13Sq/lV4O2wiN/TYj3uXrEnLqBbRw0ASx8DHTz3RtSTJWv0V3+wwTmMj1a
         Hz/fBh+eSRcN4FD+fyYVZhqviUPEuuwuv5sY0KGPENuYz4ZY5jqiWu0SBNEsAlX9WxHu
         SnydWrTj9nfZeEKLx2q2hDGuBK2t67PK3XsRyXQUIxX59q2wQTmL97v79OeED6kXwHdW
         RLkA==
X-Gm-Message-State: AC+VfDwp8eHG4qAL9Zv4CMxnlRvHpstSnUJioQDZLDeS83D2UxwCMrJA
	FeEBnGKsJlKdABbltLYa4hB1m7TzR3zKFhKu8kQ=
X-Google-Smtp-Source: ACHHUZ4BxNqg0tDxcmJLzFG13UXanJEtBxUPHSlYkDyRPNnGGdkF2s45tYBqApFjvkyqxE9iTc+X8A==
X-Received: by 2002:a05:6a21:998f:b0:111:1bd6:2723 with SMTP id ve15-20020a056a21998f00b001111bd62723mr4289059pzb.3.1688149524129;
        Fri, 30 Jun 2023 11:25:24 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709028c8700b001b03842ab78sm11096926plo.89.2023.06.30.11.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:25:23 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:25:22 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] riscv: Add ftrace_stub_graph
Message-ID: <202306301125.5E2EE84@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-11-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-11-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_112525_064258_566865ED 
X-CRM114-Status: UNSURE (   7.95  )
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

On Thu, Jun 29, 2023 at 11:42:48PM +0000, Sami Tolvanen wrote:
> Commit 883bbbffa5a4 ("ftrace,kcfi: Separate ftrace_stub() and
> ftrace_stub_graph()") added a separate ftrace_stub_graph function for
> CFI_CLANG. Add the stub to fix FUNCTION_GRAPH_TRACER compatibility
> with CFI.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
