Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2381EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 18:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NfodyQSO6LJCeeN5FKiQZytapeHYGRh5EpDDwAklNk=; b=IEl/Nex+aIMaOQ
	/8AGgtMfQTdwDGTrCuXplfo/vg5oLfabqclEWA1otHKfH2ZMg+kpfYkDO2y5oTOQY8MUkANLZb2PD
	Efz2raHm9v2gti/4o2UeRRUJeA9r1YBDWlK8kLB2doTdUaDveCEn0qKsHSB3+AQPanARNEvLb4aiS
	uljJDk/TQEA4nydwBMLWtEhSN9CJf+jZ47AXkM4ziJYCMYyTvXKr/bljYaem27egHnb1t3WzwgyId
	r75nP4NBjh4zxe2v+x4u4rYuyzwSy/v3r5jYDHOv54xIoNPCPs9SiC8Z2+37a87x10czpLJMcdKZw
	LoZJha83NJzBPqUP2eBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIsA-004JCl-22;
	Fri, 30 Jun 2023 18:29:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIs8-004JC4-1u
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 18:29:33 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2632a72f289so1146126a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149771; x=1690741771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZJJetuBbyHmtx8DbYztgxxDQeL5eYQA+7KCOoIY7rU=;
        b=NTgXSX4MGPhVE5xJegfe7GAIBLJ+GvIVJ7Wml0XsL2a75vwQmUVfExZ2I06bGaGF9O
         v//z0xnkr0vWAc3fDGEBV2jow7KGwqiMkqB9Z5Qa2Cdj/3nTEJaIu1Z1a9ivXbaXXeyF
         U+vxM2e9YP/FAcJMJJwc0PXgLXrCdFk62i3/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149771; x=1690741771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZJJetuBbyHmtx8DbYztgxxDQeL5eYQA+7KCOoIY7rU=;
        b=cHhHgud+d8pzwXUMJIA0Yp85SFFHGa1HU77EfGXkUIg8uLabioaCfGSlkWyHN0fHOa
         T688bKyKleLFCZc6ZgS2o8xSHcUSDkAR7JOZJV3QQfdUlHN9TjbrL0z/nhZVzusGb85v
         7Poah/jnAqrkbwHvpOBA3tuBdm4jxENAcderfrgvz4NUxQF1XZdh2XmsiDC/pz9Aefvf
         hzLChGNAaKPHuQcp9AfKztsPX+ClapoIbZ7+0+sKU2KM2cZ8md/B48HFiT6GghDTEnaH
         Qv36swHEDcNz1GhbIh3pUwcCavgAP/XB8Gj04rxG0uRvhewJgksdU77zpJUCMXOsrufS
         eMGg==
X-Gm-Message-State: ABy/qLYPyjGIZBhypLPozz3Rf4fXJye/vN5GZKe6eOpT0NFBeIziIqhj
	2q5C0IOKGGV6pDQjAkV3NjNjBg==
X-Google-Smtp-Source: APBJJlHRIfSrA0ELcRqMElCfSir9t+tI7qwmR8a7LbQqmrfHbBBuUV5GDWvDH/xmKUXnXt5EqKOncw==
X-Received: by 2002:a17:90a:f484:b0:262:c414:e0af with SMTP id bx4-20020a17090af48400b00262c414e0afmr2635720pjb.31.1688149771151;
        Fri, 30 Jun 2023 11:29:31 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o6-20020a17090a744600b00262d9b4b527sm9935978pjk.52.2023.06.30.11.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:29:30 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:29:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] riscv: Implement syscall wrappers
Message-ID: <202306301128.E8B5E51B5@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-9-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-9-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_112932_629860_AD146425 
X-CRM114-Status: GOOD (  13.12  )
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

On Thu, Jun 29, 2023 at 11:42:46PM +0000, Sami Tolvanen wrote:
> Commit f0bddf50586d ("riscv: entry: Convert to generic entry") moved
> syscall handling to C code, which exposed function pointer type
> mismatches that trip fine-grained forward-edge Control-Flow Integrity
> (CFI) checks as syscall handlers are all called through the same
> syscall_t pointer type. To fix the type mismatches, implement pt_regs
> based syscall wrappers similarly to x86 and arm64.
> 
> This patch is based on arm64 syscall wrappers added in commit
> 4378a7d4be30 ("arm64: implement syscall wrappers"), where the main goal
> was to minimize the risk of userspace-controlled values being used
> under speculation. This may be a concern for riscv in future as well.
> 
> Following other architectures, the syscall wrappers generate three
> functions for each syscall; __riscv_<compat_>sys_<name> takes a pt_regs
> pointer and extracts arguments from registers, __se_<compat_>sys_<name>
> is a sign-extension wrapper that casts the long arguments to the
> correct types for the real syscall implementation, which is named
> __do_<compat_>sys_<name>.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

This all looks correct to me; though I have not run tested it. I'm glad
to see another arch using this style.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
