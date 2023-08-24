Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9027C6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 20:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaro4Jf+LE/76Aybqy9o7G6t2HYBS+HIw5/FjMGMiUg=; b=R9X4Ss6VUVTrb1
	+lUNzKrw8c59tlcaE2IjWQOXo48TeTyJcx8CpzU5ncZucGBOzSSYKT7pbiA+gIQwoXmz0CRJjmtpi
	TZ7PhJyOCy01GQegZW7MwxOCNGKioGJYNKx1EIr/EnAuF1v3jrM3BLBU+DpsdSPV5YzHooGEpnMw4
	x+TX6DnL8snZsSCiYBBV4wzoL/u4F/kDDtL6KxHwTGdyStbL79JMlNuitOuIA8xrAzZrXgnzWFGjd
	czi56kmCbkJc7S3lvRjDjkqBNTcxpzJmh9ysQ+DlfgoCWUWNaIzBgmsMRDBZvJqBj0mEe4nS+SDck
	0o21PeOoqTdAbkU4EheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZGdv-003igF-0z;
	Thu, 24 Aug 2023 20:09:23 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZGdr-003ifL-1o
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 20:09:21 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3a7ca8720a0so167781b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 13:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692907757; x=1693512557;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMOVw9zI4qUYS4/6mGHk8c1zHfKQdWpaVAIEoa2cllQ=;
        b=1XdooHZArcSFuXTmOh9sPZwYlp4kCWdYOT7vO6LoqbY2xXDlTCUlu8qGoOksq147rC
         OJboyJqgCpMCDVuq1YDhZMDdoIAZI4cXwm9JRcqLdNOjsn2WFfgtBBsqGlk1ahVdSoMZ
         HNp7FaHppKxZU/4HTfXlRQgXtMTlHslUvujpvDY7qGyAhi/ZsW959L1eNGGijch8COA3
         seuj98d4zcUhMc+Prz+bm0MvnYtf+Mzmmn9xYj6wMyIMzskM585qT9SAKoqkrpQGOn6Q
         ztTATodcjPkppXE+CmcraIJFsuWXUq2klhRwnCbRBYecjnbwfqGW8FB+EWsOp7H+k7k1
         Q5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692907757; x=1693512557;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMOVw9zI4qUYS4/6mGHk8c1zHfKQdWpaVAIEoa2cllQ=;
        b=FBHdv9VtdVg0TgAAcSzRJKLgQ27S/TkCNLOO4SzDpU4s+xr/GCMLye/vyhI5ANpz+6
         MU390bamKQnpgJ4QixBA7TAoTb5tFhEJPJY7tetBOD2pfRf1EBNC/xcEM8NO1tsKSQKi
         RWEQ9l95GSyp4eMtTYDoLP194SMrnAxWdpIPw8/9ofuVxHvuLQsK1nr0+EKoR6M5JDBC
         tOltp1MHu/fXZ6u/kZEf3uGo7BXDsQfEWPNlDjG1fegi8Rnw46t+D5MOIoSuGRlAzleK
         Es3sx52mHVEsE/vzBnFgYtFiDp8IZy4ayMx05vD4JwvyAv42vKRbfpuZ4+BvtNSF1k/x
         sX+w==
X-Gm-Message-State: AOJu0Yzo6TwxKXVjfJeJNRxwmp3v6kxhWXaOe30YFHVL9AFCqwTvrGGU
	uGAdIqU/UWzshEl7DHOZVc/qKQ==
X-Google-Smtp-Source: AGHT+IEXyd6Sd46IHd8WavbuIIHBZ5eX52cYSJmHLAQktkD6fWkrurbC+JmD+MlbPobmbuWKGaPQrg==
X-Received: by 2002:a05:6808:1a92:b0:3a3:6cb2:d5bf with SMTP id bm18-20020a0568081a9200b003a36cb2d5bfmr746696oib.4.1692907756760;
        Thu, 24 Aug 2023 13:09:16 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s9-20020a639e09000000b005657495b03bsm11637pgd.38.2023.08.24.13.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 13:09:16 -0700 (PDT)
In-Reply-To: <20230824190852.45470-1-xingmingzheng@iscas.ac.cn>
References: <20230824190852.45470-1-xingmingzheng@iscas.ac.cn>
Subject: Re: [PATCH] riscv: Fix build errors using binutils2.37 toolchains
Message-Id: <169290773187.26503.887642526521895016.b4-ty@rivosinc.com>
Date: Thu, 24 Aug 2023 13:08:51 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Bin Meng <bmeng@tinylab.org>, Guo Ren <guoren@kernel.org>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>,
  Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Mingzheng Xing <xingmingzheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_130919_779227_4BF6C6D4 
X-CRM114-Status: UNSURE (   6.89  )
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


On Fri, 25 Aug 2023 03:08:52 +0800, Mingzheng Xing wrote:
> When building the kernel with binutils 2.37 and GCC-11.1.0/GCC-11.2.0,
> the following error occurs:
> 
>   Assembler messages:
>   Error: cannot find default versions of the ISA extension `zicsr'
>   Error: cannot find default versions of the ISA extension `zifencei'
> 
> [...]

Applied, thanks!

[1/1] riscv: Fix build errors using binutils2.37 toolchains
      https://git.kernel.org/palmer/c/ef21fa7c198e

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
