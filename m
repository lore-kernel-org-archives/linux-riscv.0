Return-Path: <SRS0=M4pA=O5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3512C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 20:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CD76218FE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 20:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kq6Bbj3O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CD76218FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsxPy6GHkkaYbvExdE9NgFO+c73hoSPWPNMfRBJaodM=; b=kq6Bbj3OqO9phV
	TNfwo6eiaxAtZKpzeMV2pCLa1IyZUnyIdu/EIumAXkiS1VjQe3eCH/kjDJhNQr4FzY0467hCt/Xyi
	kbzr+O8pFOUrDe9/fhR/nWNy94RzmWYF/jjIo+eryTPdMkvxkW2ovUK0iaGXwwN+ZJ+uORUem2qaM
	7FLNwfwxfLoYo3W43IQRj8OwGvkxXf5YTBRHZLbQfPzc4J/i6eMM0zi619o56BlX9p0L+rnSyhDqr
	i8F3B7K3Lv+9OTiQZ/EW9UJ2ROo2SMY3ZX3blB3zDZ2grqHAIG/5PZghNKCFRoBx5uy0iBkQ3KTJJ
	Ele8LkB0Q7DJC6XbuozQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga5O3-0001u4-S3; Thu, 20 Dec 2018 20:57:43 +0000
Received: from mail-it1-f196.google.com ([209.85.166.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga5Nw-0001sK-34
 for linux-riscv@lists.infradead.org; Thu, 20 Dec 2018 20:57:39 +0000
Received: by mail-it1-f196.google.com with SMTP id b5so3740653iti.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Dec 2018 12:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rTeIc8r8cSutS4ORvHntsXYGF2soEDoZph4eBu+yZLs=;
 b=k19ubgdeAWLOV6tUl8E9nUsfHxFeSoCJSPehg4W+gjwVEc4J2xHF5H0G4kTjl12x4d
 RE4DV5pDhgC3rorNjMMcwjMn84wV8oD8AVxnbk/DfWJRwNWbak7AsdtEOwQHFJMLJvNg
 S3BVrHmKCf4XFPkiTTM+O9XXVFuPP5AUhO5Z7jJkRgx4zfdxUvi4X08hVscz1oy3czWW
 SjGjOnW8nFJmsa2UD+h/QItR3TZMviSG3eNJlYvt8OlB/jkyZ6/C25cQaCitKy8MuJxP
 sA/7Y5/JkJg9INuqkiEg1Z/8ZZQovUJM8tnS6kt2R4UspbPwPmvjfEBP0llnZ5NQPDUL
 SLoA==
X-Gm-Message-State: AA+aEWalzEvGpe1NN4Q7tdfBy6vATclIB+vwS5fJN0PPEOiwaTObpFu+
 yawvMEqwKf/aoQBg0n00Xw==
X-Google-Smtp-Source: AFSGD/XEcTZXNDZLfJRKCiFlEbVfvwKOHvZTmRUYOzNkiUr7EvBJQYN7XCipwj85eRYdUO+lSGyodg==
X-Received: by 2002:a05:660c:6cc:: with SMTP id
 z12mr201724itk.65.1545339445033; 
 Thu, 20 Dec 2018 12:57:25 -0800 (PST)
Received: from localhost ([2607:fb90:20d2:a5e2:49af:e73e:5a36:3b50])
 by smtp.gmail.com with ESMTPSA id k2sm5242586itk.35.2018.12.20.12.57.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Dec 2018 12:57:24 -0800 (PST)
Date: Thu, 20 Dec 2018 14:57:22 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/7] dt-bindings: riscv: sifive: add documentation for
 the SiFive FU540
Message-ID: <20181220205722.GA2072@bogus>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
 <20181215052154.24347-3-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181215052154.24347-3-paul.walmsley@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181220_125736_131236_CF218127 
X-CRM114-Status: GOOD (  12.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 14, 2018 at 09:21:49PM -0800, Paul Walmsley wrote:
> Add DT binding documentation for the SiFive FU540 SoC.  This
> SoC is documented at:
> 
> https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> 
> This file is originally based on
> Documentation/devicetree/bindings/arm/ti/k3.txt.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>  .../devicetree/bindings/riscv/sifive/fu540.txt     | 14 ++++++++++++++
>  MAINTAINERS                                        |  9 +++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive/fu540.txt

Reviewed-by: Rob Herring <robh@kernel.org>

However, with 4.21 we're starting to use json-schema and top-level 
SoC/board bindings. Not requiring it yet, but feel free to convert to 
that if you want. Then we don't have to do it later.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
