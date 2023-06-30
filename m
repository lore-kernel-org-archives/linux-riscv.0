Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FE1EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQpgGv5yCC/bGDvl3kSj6xjgCOOPqXqbNpc0g9mRyS0=; b=nWrlOtO9RG6PBJ
	mPznA9WPLYi8nymln+/aJ+0ZfDmghlf1mTi4xE11LVh5o73VRogg8Is4yD1H2SS76cDlcTFD7HnpZ
	zVdOO3cqgm1LjCEVz/JTb9K23NdpVPO+0fNlI7JpbAiaELz5jam+Uuay7W9ehT9csQeiypUZXeGDM
	CpcTJnuiadwOLnpwT3PfPgRcXRQ7f3bqLLqTig6eXGbyu2tzNES05gBSE/H2ZhibERdKUBkqQxxJn
	8C/0woZ8TG7NoMCfsbtTL7hPSHe2Sg7YLPHZHPjGZ95gnh3hSlazJHefa2ts8hmkvKNPwxTm+ZXTM
	mVN3cwaO+GIh5OyxDlxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIpy-004InS-1g;
	Fri, 30 Jun 2023 18:27:18 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIpv-004ImX-1W
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 18:27:17 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1434744a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688149635; x=1690741635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BCaYu7xdiD6BYe4W0cxKoMr/LaGK6LhgIOaIA+QBb3Q=;
        b=nWBu4aSpwIzbfoKGCfhgKgbCs6gDjEv/fnSx1CZ7ic42Qqt1/WL8TD+UVwGZETfDwV
         QQjyRZ4dCdNb2q1kRyMCOxZDVEIeJBBXl3s1lSTBfxu9RMPdQBTcm2qwPHx2yOX+FF3f
         SrPrpOqomzg/3qgcVlXGzRn6taGxmQw1uUQZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688149635; x=1690741635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCaYu7xdiD6BYe4W0cxKoMr/LaGK6LhgIOaIA+QBb3Q=;
        b=CBFWY0SzbdJJVy/lHAZX1XFpgOE5wf5Ho+cjYhrJz0LlGYZOy5PNfrTGVGTFQA3Kzn
         sW+1Vipr/N9dg5JHv+40Kq2aqSJFCs2I6D6aVkGQJnb33WOIQ2uM+sX+KOQIKHB9pV9d
         MZfnftF8HJXxokvlabtwairRrKEhqytS7GaObdWthG0bHd+vM8cYW5W73J+Pf/cqjuW8
         rxd+0xrgH+oj3s2dc9D0Xq4Vm1et3irDiPPHlhHorDRIrrhcXh4afuHLLOsQaHhoPq+G
         /93cYKgUg7moWo+pdZwirurT5SGPzEirUzndZi8jA2qmYpITxrG8fbiU1eUJeQc6SmkR
         4mjw==
X-Gm-Message-State: AC+VfDy7hjHuNHFba4JwqTBAnOWQwzzgcJKsh9Ujb7g8CTNyD6544+Vq
	k7IsAgXHawhS4xc17v1xj+Skog==
X-Google-Smtp-Source: ACHHUZ4xu3/wYm9bZWhQyjBCDCie8wDoJAWUFLnjI06jhYBKyFPIxuphb53h3EEDqEvg7aT4BsmD0Q==
X-Received: by 2002:a05:6a20:96c6:b0:11d:4c79:90ee with SMTP id hq6-20020a056a2096c600b0011d4c7990eemr3081600pzc.25.1688149635037;
        Fri, 30 Jun 2023 11:27:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u23-20020a62ed17000000b0064d74808738sm10138390pfh.214.2023.06.30.11.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:27:14 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:27:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
Message-ID: <202306301127.4EEB06A4@keescook>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-14-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629234244.1752366-14-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_112715_511959_4FFE1C0A 
X-CRM114-Status: UNSURE (   7.25  )
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

On Thu, Jun 29, 2023 at 11:42:51PM +0000, Sami Tolvanen wrote:
> Select ARCH_SUPPORTS_CFI_CLANG to allow CFI_CLANG to be selected
> on riscv.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
