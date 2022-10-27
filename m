Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B12FFA373D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 23:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GIPicaZ8lRS7GrOepeyPgDeySVpe2QDA4LscS6KBgE=; b=NFyo4DxOm+AzsH
	WvLFMfdKFyrcp6ONZvOqx+qGcRCJ8STMjHIfGEP76dUXUJbgfhsdqZgvMnkGklk3Vobh8VzHiUrbg
	Y6/Navx5VSI7tP5lfNAQ3T5VcgVbFQv/aFw0Sv0XMEdCk56F6XQ9ZsmWTpX02yFo1D4G+qlLqDdiX
	kENP0cdFeM6vRWvgrQUgqpv3DFLaylSYOnoIRwEPHqqD/FaXnXa+QA0Fi6ny1M9PXRCIBiAI3cWwG
	EGJ5BHa94N4szR9PAMPA0Gu9nll9TptMwSZqRnh/I09ldqC/Op0UMSL3NU0zObAHZRugJn8zacVCy
	D6dNULSLP7MRWqDmSpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooByO-00FAwT-Ua; Thu, 27 Oct 2022 23:07:40 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooByE-00FAqm-7P
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 23:07:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id 192so3252120pfx.5
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 16:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGIOOj3+qzuziQHt4I3vJ0yhwP9i2B2Blb/XTHKGMxA=;
        b=DQ12Roa/JCXk48lRfZQvcdCR5DKamBLnfsA/y+WP0VhsBcphWICeeOvOJAHZFSBoUn
         gl0Tsxd+qmgZ90G5FiKpBF4SELi4PtDFKah+kk9F201OOfc3lFcfGZmV63Gvr+q6s6+m
         AbIHcTHOuBjGXnUCqQzepYO8FPcpxVB1PNMgbybic+rmtKj4iTN1N0z2t2p9u1JbLb2E
         WJpGxg1w1wg9Ih0R1E0wlkSdOJM2JZ+6tENLD8t+jhFBqKJNq/vvTzZErfS9S+becMJW
         ob4mFbQrFaNrbt8NugT98wmIV5d/LCfe7Wi//gcNJBm2/Ye8qT9eQholmoulgMFnGk4s
         rZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGIOOj3+qzuziQHt4I3vJ0yhwP9i2B2Blb/XTHKGMxA=;
        b=XlwIOL0DigTYwIInGCsDljMTDpVDrRe0xEQSU0PpVsX37RvTPLw/gIZSoYGtfuFvhz
         30fpBmGtkozZOLOUH6sxduzpPDLAbpiquuwb9HwzlUgzriHUCJqhKFAUlqHi4TZvnp7B
         cOJPqvxd/tPgFnD7ni0yUzxnfQJQfX0hSgUiJ1faBPbagkSQmtADgwMoQRLW7B7mgHrB
         EdlpLwUcWITB0ue++4m8ORKAv/N8GBUDO/TZmnk4tB9/WTgsv55ovZDfXD1xC1TS8ZlI
         LuMopTSUzxaY3kOt4LJNl5jF539UnbosSWuq0pz8BKk5qeH7jWckgeQfNiwwfUfoYMLj
         BzYg==
X-Gm-Message-State: ACrzQf1NY1oe1VeTWRzWyEB/cZBcJmn73eP4NglULZ8hV6jeVeYc+XUx
	cgD9imtSC/9DYttJxoBodhxmQWyMyfW4ZQ==
X-Google-Smtp-Source: AMsMyM4pGfab/Lu9otcgknoFf3QkCWBb4tRNWzqL/utHiVbszNKEX0k0wNujQ0wmYp9Ebm9yoeQFDQ==
X-Received: by 2002:aa7:88d4:0:b0:56c:ae9d:6fdf with SMTP id k20-20020aa788d4000000b0056cae9d6fdfmr3713215pff.41.1666912048006;
        Thu, 27 Oct 2022 16:07:28 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w3-20020a63d743000000b0046f03254c9csm1542392pgi.23.2022.10.27.16.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 16:07:27 -0700 (PDT)
In-Reply-To: <20221018141200.1040-1-jszhang@kernel.org>
References: <20221018141200.1040-1-jszhang@kernel.org>
Subject: Re: [PATCH] riscv: remove special treatment for the link order of head.o
Message-Id: <166691074225.22464.6806069295219492474.b4-ty@rivosinc.com>
Date: Thu, 27 Oct 2022 15:45:42 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
  Masahiro Yamada <masahiroy@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
  Nicolas Schier <nicolas@fjasle.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_160730_298841_723A4DDA 
X-CRM114-Status: UNSURE (   8.80  )
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

On Tue, 18 Oct 2022 22:12:00 +0800, Jisheng Zhang wrote:
> arch/riscv/kernel/head.o does not need any special treatment - the only
> requirement is the ".head.text" section must be placed before the
> normal ".text" section.
> 
> The linker script does the right thing to do. The build system does
> not need to manipulate the link order of head.o.
> 
> [...]

Applied, thanks!

[1/1] riscv: remove special treatment for the link order of head.o
      https://git.kernel.org/palmer/c/2348e6bf4421

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
