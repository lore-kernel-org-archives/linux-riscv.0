Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC133C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SI323ehoRvudqz3TvseAMq741CtFty4jhHatjhkGik=; b=feYatS3fB3tUkP
	pMcGk0MXcK8c32NUNRNtOJCcP6CvBGHpmVzYijIKTYudgXKfy0zo74FiUW1rDNBDuUN4VDta/Y/ex
	YAuqC0tH4Zf48FI7vbZ+kbVgwutXf0yKbJlKO5rMe/IBLYp0y8TlDz2zPocgFpoulKt2cyJ5gGTj3
	LbuOipWeoOalYzJGioatrEeUhPlYJuFhHY9uEbxeoGp6MCXJv6+KKiqeXTuxY7jjxSm0H0qucXkeZ
	Y9a2VsQ4XNrOkeMmg8Qfpn6sgXce9Bzz58/X4ppVh1y/KgFOwMlqvguCW7K6biITsCIJnhkCPloZv
	ERYcuP9o9KISJFnprXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Pgz-000KgO-3E; Wed, 30 Nov 2022 16:12:13 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Pgv-000KdU-Ru
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 16:12:11 +0000
Received: by mail-ed1-x52a.google.com with SMTP id m19so23490831edj.8
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 08:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zoShQ67l+QfvAIgoGtCOn+uIbXUSrT2FaEuvPUmtKQE=;
        b=alOh1LZxCFL2IpfUB8271bwYaP5GZ+sj6zZ5Ku906djE/ac7vaGyrWotZTeMiagUSV
         kRnpVTNFlqUNwI5Vcr6e/QW2NWQV9zinUOQDRlSGIwUVTc+YHGlBf/BNO0aMsE1c0+WM
         UQhJWxFWwDSsUbPI+dFdo54qEmdEmCkQeB0CKM9VbN5OsI3NYpgUwI7OWuiOy7Q1mD97
         tirTKasnYAuX+PT/kChJd2JYkNZbSFxjbalP6vvA7ml7Tx30QWeIZ2GyIq5Nda4sUz3s
         NLkKM5lRlDeQrHEk8JYqFqGYA1CMcd4a0UxygVZAf8yDGTW33F36J6UKM3AGDciBTo47
         SaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoShQ67l+QfvAIgoGtCOn+uIbXUSrT2FaEuvPUmtKQE=;
        b=vdHqQM+1T4MnW3TcdwlaRTsQnPXpXmrjaB1vIEDNWBAJdOh2cepM9lGwkBMx01a9M4
         mvA47zATfJ9K24GCHR9DKnOJ6r6nu2iFD5DqMxZ9EsNUqWl7vlOSWGoUSYc/NLH+fnac
         YjAsqOoeFs/llek0hfkUJFsRAyQUfKknTKCeHFfIxiTNiKi2Ni+VKhvx6M/OeCuKGtLF
         7b4fwrcFjqp+SoQWDoH2UfDlSMIX2CtSFs0ENp3HxTZsCl7cYByFgCtCKAwmbUtHZXCW
         b1ksKZ2GVKHW3p2BLCpIn5Kmkw/ZVA5c5TYO5wHnIq0IYDW9Pyq22vGlH3VrfffDRVgD
         lbAw==
X-Gm-Message-State: ANoB5pnbETESKeds8hvfalbrpPVX7iBEELJciwa2lLgUIPcrgyfvTIa0
	QV1fs8S9R4BEke+Ii5RyARRl1A==
X-Google-Smtp-Source: AA0mqf6IqqStFqEo62mGs5aAgtGf4ZSSi+Pf71ArdgOACPeViy7Z+57/jGnMhMZrTLDIZal2iIHW9g==
X-Received: by 2002:aa7:d659:0:b0:46b:1687:2e5d with SMTP id v25-20020aa7d659000000b0046b16872e5dmr15381442edr.136.1669824726930;
        Wed, 30 Nov 2022 08:12:06 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id r9-20020a1709061ba900b007aec1b39478sm782861ejg.188.2022.11.30.08.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 08:12:06 -0800 (PST)
Date: Wed, 30 Nov 2022 17:12:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 09/13] RISC-V: add rd reg parsing to parse_asm header
Message-ID: <20221130161205.uo5f5q7ezkbbjnqe@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-10-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-10-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_081209_918547_2C4B6B06 
X-CRM114-Status: GOOD (  10.43  )
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

On Mon, Nov 28, 2022 at 11:26:28AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Add a macro to allow parsing of the rd register from an instruction.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 5 +++++
>  1 file changed, 5 insertions(+)

With Conor's $SUBJECT correction,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
