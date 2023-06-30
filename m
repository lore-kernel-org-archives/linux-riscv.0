Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E03EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03narax9/z9+KP8xJXyx1MGSf+7pFpOvbGQYyHmWZ+4=; b=Xna9PzKEXoAll8
	eS0HZuhoFp+eaiBOBRkQHM84S4IE8Hk6Pwxywa6y/Wvmo/PXuS4llLqOckVT8NdwwLGtmbhTyM9+Y
	60v0SED+NQ+PMcEkZc4gdm8megNmmJFSSBXfIu/DaGOq95eeRmKZV0+xNke1HNFswTyo72NKbpjVT
	8AyMbjfyPFY/kLFCmtiwbDqANYRQNx/6rhNqSFhK9yxqFm3e1HPcUB2VYFwKQDcBGG6u5LgcaR1ei
	zQ8hI89bWU5Q1QJoG52mmAcBsB+81Qy6eOxT+32FeGpaqDQLIht99SstlIM+jrP9ptHBYYCwXL2By
	ib55XGhZuH+KmbX8C2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIo2-004ITM-0n;
	Fri, 30 Jun 2023 18:25:18 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFInz-004ISd-2e
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 18:25:17 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-39cc64e4a44so1325675b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149513; x=1690741513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kyMHPqgFkqrCLjrfJwzZAICfyuA66R9v5BF7rbPVGX0=;
        b=MI6CfwF1+eJVWXjXK7CR+OIYgxY+N1GRO+e/xgPwtHEJQyPVUhxTk4Y9C54iU8f0+z
         ay/X77swuw7F68CSZe5aL5aiwPsTPwx6br1922syGJNYPEN5svfu2HZEuxh00cN7w1Zw
         pJ3JDDUxLmza1gMe7we3AVEIN1nIvxAnZhTDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149513; x=1690741513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyMHPqgFkqrCLjrfJwzZAICfyuA66R9v5BF7rbPVGX0=;
        b=AGi4+4VudAB+AKc73PRtRZknwsNFVWWHTYYa+M6ebQuKX+3rmWALYHT9LwKLS/n7mH
         ou4MQ4WgYh3uyISNVg2w29MAzf9NdGMTZkxheFolvLMKoGZXv9/HtDl4ytrQOlwFiHfB
         GqPG4lIIDboFx163rQ6djVSplbhvcqhBqI0NFyaVTw84IyjsLF5BGTfBcqkrp3GpHwPD
         v2lDuY+7MZZjX2jGY3JtulT4uR4d6ulr1OHCDxT/kH1LuPd72wyqeKRs5+dSJ+5ezAEC
         1BwO8kivovDApGKestXwjLAFPiNiEjNfyOWfkauoTPhxJU8UGFPwtm5qmgzK3bxtAJHa
         2bxw==
X-Gm-Message-State: AC+VfDwvZ1ZZUqwcWwv4wRf0zWl2Wn9iBlT6ZcRCBNez4s77o55bqKBh
	K96yPwj3h2zkpT5Svpb7W5q+wQTEyvfraavT+Wk=
X-Google-Smtp-Source: ACHHUZ4eIjI6ILzn5IHdnhn6/8uGaeOlIGsrOXUs9ILUhXM6HRgK78y9vpFuktGOCts3Mvge7PXhPg==
X-Received: by 2002:a05:6808:1b23:b0:3a3:6113:ce79 with SMTP id bx35-20020a0568081b2300b003a36113ce79mr3297214oib.40.1688149513722;
        Fri, 30 Jun 2023 11:25:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fe21-20020a056a002f1500b0066ebaeb149dsm9530556pfb.88.2023.06.30.11.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:25:13 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:25:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] riscv: Add types to indirectly called assembly
 functions
Message-ID: <202306301125.B58257BE4B@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-10-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-10-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_112515_890284_320C9738 
X-CRM114-Status: UNSURE (   8.41  )
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

On Thu, Jun 29, 2023 at 11:42:47PM +0000, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, assembly functions indirectly called
> from C code must be annotated with type identifiers to pass CFI
> checking. Use the SYM_TYPED_START macro to add types to the
> relevant functions.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
