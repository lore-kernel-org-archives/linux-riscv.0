Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C0BEB64D0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=enJ91ERKw17cVvL0ViF5GBLUF4M6PFjbTuW7hyfXG4Q=; b=t2Nc1tSN55elW+
	KtmgEvqNXz8rqfGShNhK+UOPikemISRnRootrBUK8FniIZQaHbbLpeSDEENm291SBF/wSDuA0QtDr
	GHcDBQMEFkMK6D4daCZbXFQssC8dSTrm55HG3soliAlrOBmR8PV0BE/6s2iYsIRqrr9Xcqwn1s/uw
	ykc4P1RbQnuDAc6tavdj7NsGJ1YY8rYxk1hN9Zj1OgJuWqXDjU8ox3BtiwFKtsiVBg/3n9r0W+8Ub
	M/SKuTllNJHLs35LY6jxXQFBl6TtzGOnQJNlAyjkSH7UTXv/TwzyEi14eCW7yOiom7Xg+dEm90BuI
	f/Al6DOdYNV28z96kA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q98AO-008lhH-34;
	Tue, 13 Jun 2023 17:50:52 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q98AK-008lgS-0l
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 17:50:51 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-652d76be8c2so6174599b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 10:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686678644; x=1689270644;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30g+5RTvWxZ/POtOT0u4s+KENg3XA8TnYdOsSrtCeKI=;
        b=FWXr+Cm5r81iCSl5BxYMSlF9tfk9VoeaRpbTFzR4doi2ef/uTL2wFwBdBf35pjrBSv
         pR2P5xk2mw8AEec72rXNNmZXFfkW27QY5nbS7VZg42XHDd/jyhwTfriPnBBmFCY6iv6l
         4bgW224/lTE9SA1KXzHwsCCTO0pxguv2daZXvWM+ZZqaSGzv1LkbopNtkgf2+eh7ZBJS
         /VCH3l6sHN4eg0bDgEjO0+AwjdJ06hojdzO1+1nUzNhouW9+gcEz/UiJ4dMi2hGPCa8L
         liQqxM8R6TQ5RkgwxlgFNuZACWPS7eYB/aubDu1FBQQywKkrZCVKYhqoGkyldT3hRcsj
         oWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686678644; x=1689270644;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30g+5RTvWxZ/POtOT0u4s+KENg3XA8TnYdOsSrtCeKI=;
        b=Q4PXvrBDzVJ3LqbfjFtkKqkfGPBR4HtyG980LhxmnEJ1BiuNjQYFqMZYs/GegZtzHq
         7MEisgCi2tQ3PPKLdXEdKR8O8Fnnw1UYPLCam0QpqDOvJDOF3cXFm9IhFwXSfVHv8zHh
         3lfXPOselbLjYM88ob0XOWYKIS+xMoqQF+TPACZFHy8RMG93H4WDyOMrX4WozCsf40HQ
         IgZ4RGsEb9NKxTM8Hey0f/RJP/5HtjJiSBwfnPuz7TWRV1KbeEdcf7bd/UpzsSma73nZ
         ZIir0RAYNVaDXaOnjL68sXRVsprn193OuArx82QYGTYMQ2XmcLjcSWgaxBzrOS/rs8yM
         YjDQ==
X-Gm-Message-State: AC+VfDxcM/t2mq3iTh/fYJ4Yt6IyPMuxqFLwsKXBf5vNX98FhijIB/Fq
	0WrBp9kL2/0ohmbRbJo2JyWBYmoENiF7HeVn7hs=
X-Google-Smtp-Source: ACHHUZ4vZSFn1tmwHCtCy2ep7HRRqOCwT29eUWxVgrK1nI/ZHPdnBYjjzh6e4pLsprVDqT1KWhC9Kg==
X-Received: by 2002:a17:90a:8044:b0:25b:f88f:5348 with SMTP id e4-20020a17090a804400b0025bf88f5348mr4786217pjw.17.1686678644253;
        Tue, 13 Jun 2023 10:50:44 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 28-20020a17090a031c00b0025c02ef91f6sm2670106pje.22.2023.06.13.10.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 10:50:43 -0700 (PDT)
In-Reply-To: <tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com>
References: <tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com>
Subject: Re: [PATCH v3 0/2] riscv: allow case-insensitive ISA string
 parsing
Message-Id: <168609537703.11035.4463826338484666822.b4-ty@rivosinc.com>
Date: Tue, 06 Jun 2023 16:49:37 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Andrew Jones <ajones@ventanamicro.com>, Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>,
  Hongren Zheng <i@zenithal.me>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_105048_493905_FB435608 
X-CRM114-Status: GOOD (  10.85  )
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


On Tue, 02 May 2023 00:10:19 +0800, Yangyu Chen wrote:
> This patchset allows case-insensitive ISA string parsing, which is
> needed in the ACPI environment. As the RISC-V Hart Capabilities Table
> (RHCT) description in UEFI Forum ECR[1] shows the format of the ISA
> string is defined in the RISC-V unprivileged specification[2]. However,
> the RISC-V unprivileged specification defines the ISA naming strings are
> case-insensitive while the current ISA string parser in the kernel only
> accepts lowercase letters. In this case, the kernel should allow
> case-insensitive ISA string parsing. Moreover, this reason has been
> discussed in Conor's patch[3]. And I have also checked the current ISA
> string parsing in the recent ACPI support patch[4] will also call
> `riscv_fill_hwcap` function as DT we use now.
> 
> [...]

Applied, thanks!

[1/2] riscv: allow case-insensitive ISA string parsing
      https://git.kernel.org/palmer/c/255b34d799dd
[2/2] dt-bindings: riscv: drop invalid comment about riscv,isa lower-case reasoning
      https://git.kernel.org/palmer/c/9e320d7ca46a

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
