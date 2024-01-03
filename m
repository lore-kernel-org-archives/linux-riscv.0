Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1FBC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 19:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lc7ARLkaNqxbg0MQbwXPaeYYW8Z5pkiGv5cMhm23UTM=; b=AQp5I8qykLTU42
	8caL5fjUmCooYzwtVDSeXFSsFkZu/ncimmPMfxweVjNDL6xdOFl7uSNXq728cHjcMgOeVDQGIiEHP
	GysT9s4mp/9iCbwY6dFN22Gz18CGgQfNvCOPO8GN0EfNE6QbfJsGbb7PfgS8jIi9EB5+Uj7YdFCK7
	6Kfnm7uFuegGLFnO/90R1IBmCqJCk6f3jo43kKdyiXahqr9YtdoLHIYWQlru1/qjplfIi3SEoHL3O
	KAMc7Fuq9JsBR8rfS950ZwD8X3T1Q3NF5DQGwfJ5R4DyN4wM6YiGAWGDSqC3I4wQ4XlviLokLgNyH
	LdYQZD5MyxSMxoJM7L5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7Dw-00Bxb6-1P;
	Wed, 03 Jan 2024 19:48:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7Dt-00Bxa8-0C
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 19:48:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40d3ae326f6so114194325e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 11:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704311293; x=1704916093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs7YK65vsgCJhyJ8cxRJlQYt/xebK4dr15ogDzD3qOs=;
        b=Qr1Fab6Y2m/468VghllQBIXQVV4qPuGWX7SbfZWjLqVhZycqBMMwxU/OGqgG38ZNDy
         FB6FiG1vTRk1Sm3idLKvk+VAcvfjMZ+QF116rax76T3An1WFlxfn9Kx1Wie5I4guSMHB
         NThylOsWNaVPaSDzUeFlEDwhPYimEoLVTnYXIP+Z2xWvLBnNUCjPpRdxrFOMz/vCom08
         WGwHLZIg2EQqpBAVfBKqnR+H9nMwumtnRKw5MALx2aWA6wcPsCciy6dO9M/+NBOq+bzw
         3N0gBQRGg/eEIvxjrFbgbX7trUoc20YzGs+LU6l1u+qkW5Rc6lV2Ci6B/QuSiRyMoSV1
         YVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704311293; x=1704916093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zs7YK65vsgCJhyJ8cxRJlQYt/xebK4dr15ogDzD3qOs=;
        b=uiZj2lZ2SBlXpiJBdeM4ynRDRHa26jCRUdwXf+JC3mZCTKtd8CtWSnnDZWqA3mYAjp
         dG99JReb59R92kUaT6wPP+STh1ZKfUfJ8cwB4iFjlA6BOZ8mmbZMrefa0E1YHC3d+OsG
         v7R66FH9hmLNjUvIcs8vRczu1q0xFdjdxuJIRQKRcH/pVZCXcQNDHWWsFLHmq/0nYhna
         pTKWpH7xiy9k0aM9eDvQy+C4R6eKbO066Xas2qrcW2xWY6exKwThKdvKU8vwMg+qxLT3
         DOGgERPAbiZM9l2G4+2TpwNM86bIPCHyjpEvM/5a5WybrkN5Z+zcoS47VRnnAPDsNNn9
         n3Jg==
X-Gm-Message-State: AOJu0YyzKeqbh/5kzp+vk/e0PRDsFUbhd5SxgYKSJRjcV8DwRqKY9aRB
	vNYFY1QFrkMYKOBRNwN2Xn4o0mXD5pn1UQ==
X-Google-Smtp-Source: AGHT+IGPKgforDJAQaqV1A5QN2T0jJs2gRNZTWT+QgU4y55oKFqLDC2gqwiPp88YH4GAEVXueke8qg==
X-Received: by 2002:a05:600c:2296:b0:40d:71f3:1597 with SMTP id 22-20020a05600c229600b0040d71f31597mr4615711wmf.172.1704311293257;
        Wed, 03 Jan 2024 11:48:13 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id je2-20020a05600c1f8200b0040d5a9d6b68sm3284877wmb.6.2024.01.03.11.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 11:48:12 -0800 (PST)
Date: Wed, 3 Jan 2024 20:48:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Subject: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions &
 cpufeature
Message-ID: <20240103-4f92e1f7290975300ecc64ce@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231231082955.16516-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_114817_103028_672D3234 
X-CRM114-Status: UNSURE (   7.07  )
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
Cc: wefu@redhat.com, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 31, 2023 at 03:29:51AM -0500, guoren@kernel.org wrote:
...
> +#define CBO_PREFETCH_I(base, offset)				\
> +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(0),		\
> +	       SIMM12(offset), RS1(base))
> +
> +#define CBO_PREFETCH_R(base, offset)				\
> +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(1),		\
> +	       SIMM12(offset), RS1(base))
> +
> +#define CBO_PREFETCH_W(base, offset)				\
> +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
> +	       SIMM12(offset), RS1(base))

These should just be named

 PREFETCH_I
 PREFETCH_R
 PREFETCH_W

without the CBO_ prefix. The other CMO instructions we've added have the
CBO_ prefix because their actual instruction names are e.g. cbo.zero,
but the prefix instructions are not named that way.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
