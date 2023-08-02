Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81511C00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 20:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUc58Yp/ZHpzOFJrkf7v9yMFbttIwNttcjwuCA4H3ZM=; b=xZczxUYa3gzDwV
	s5vJWdeexDBhKYl5JFgtHILkueb+90XTSSTH+zGs9Rhcm4/aIZHBMahqS9vKqWYfFYHOHTStk1Mol
	IGRsiybvNgQU7ldRyvwJjvuU3LYFJ7Bx6ebq4ROBIpjb26M0CY4sotBES009a2rJJ+eKiBMMr6uew
	1lgfW3TVSPXUOhGygOTEHd/0okd4062OfbTBNkI+oQjpYYKprJ/3An/KaG5vcU/I0i0sX3/WM2JYU
	FvLtGsbgzutH4QcDcvHzPngfc8a/sJ/LyrBBcln3GZ5Nor02PYr8+bWYKtX8/O3jaz2R4FH9PBbYG
	8bZQtaUA+t+9rd4irKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIZn-005qKr-25;
	Wed, 02 Aug 2023 20:36:11 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRIZi-005qKC-1r
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 20:36:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bb775625e2so1894625ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 13:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691008564; x=1691613364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bWr3jcRSEU+gA9r0PBD80WJbMi+ArPrQmYYMKJHmB6U=;
        b=nzPAChC03qv+JjeCfHD3Xsgh7kOt1lPa9r4xyzDxMcstE90i2vukMw/8sXH/02aje3
         2otS1qRbhNkAjWyhIbAU++WUZ6yCQqFvvwE0SM4I+99qUJEqDvwnleDRCjb4+gIWskpm
         kT/uFCmzfT6YzJ6Qh64mXRXv8r01SRYwdq9n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691008564; x=1691613364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWr3jcRSEU+gA9r0PBD80WJbMi+ArPrQmYYMKJHmB6U=;
        b=DfGixJxZWya1RaS1VapUvr1DvaljOgB40Fh6DD7oRT5U3AD7NX+f9HHKMB5Ve8aXdv
         AunWh3LBneGCrjHQbvzH950TgTYHTVcjVx7/nbf+HrZGrJGdM0T0vlOFBOi5N+iSoVtg
         up1AFRYpqkr4Mf0eZFe2KKgMN8S6b4CUI/gED80OxdSov0BanIPYcvx55GW3KldmYSb8
         X3GTGy0LrJJfO2rGU2BBS0x4j1Hzl/x0nPYxAxucYLI6+LgN9CFrOhsbtGh6fPQFdn9x
         OrZqelZYrtwTDbG8X4mIIhqFL4lYAdT06ZBtDm13NvvtizUYffwtVPvsfgN0rcELq1G4
         +mRQ==
X-Gm-Message-State: ABy/qLYEVuRcyPOUj7IGbNG81YKwDmU3BLr5kEY05nLkfOAXaJAOmsyn
	fQ5wpEd0RS0nfzXXTAPEZgWzQQ==
X-Google-Smtp-Source: APBJJlHH8aWxfFwHQY80htCurxfVMh/0WroGpPj2sjy9e7ql/D3TXKv/ojhEZ6OgabqItgbTCA1eOA==
X-Received: by 2002:a17:902:c404:b0:1b9:c61c:4c01 with SMTP id k4-20020a170902c40400b001b9c61c4c01mr23391628plk.9.1691008564550;
        Wed, 02 Aug 2023 13:36:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jn13-20020a170903050d00b001b895a18472sm12772104plb.117.2023.08.02.13.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 13:36:04 -0700 (PDT)
Date: Wed, 2 Aug 2023 13:36:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: cpu: refactor deprecated strncpy
Message-ID: <202308021335.8010D08B@keescook>
References: <20230802-arch-riscv-kernel-v2-1-24266e85bc96@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802-arch-riscv-kernel-v2-1-24266e85bc96@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_133606_651644_777E33FB 
X-CRM114-Status: UNSURE (   8.97  )
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

On Wed, Aug 02, 2023 at 12:21:58AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> Favor not copying strings onto stack and instead use strings directly.
> This avoids hard-coding sizes and buffer lengths all together.
> 
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

I like it! ;)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
