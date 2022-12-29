Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A36C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 17:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JpuaH36KiNRxXMrEtjMWO6Ts2qk8IAKwtuFWrGlCax0=; b=jGk3mqAqTvHu+67CXYc293SW+w
	pCXujDDpxwnDLFkm2hGqwib8Q0YemcJGIzG5+pqC3b+d7R+PFr+BLAqt53eoqIC821ZdUUEom1Z59
	USY4pI01Cezj3YrYT/fR6TajMzMNcZEzCWujnG+l9PoJBzuMz9Cxf7veOjyW3cAiV9MwA0P1Vn1wU
	PAuYufwJt029jgqKSnD4zKypzRUJwi+TfVlY/KZwvm9iuqH37qw8q9oyekSKa/AUOFUQdsXWchLqX
	xQ3lA+wSoA4HZs3+2ITUr6gztq2eQvIxR47FSHSEMAvj5r8XHZ1D1EBYREshddh5sJAkskYW85IqD
	U6OS8+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAwkg-000Mj5-EB; Thu, 29 Dec 2022 17:31:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAwkd-000Mep-DR
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 17:31:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id jn22so19504371plb.13
        for <linux-riscv@lists.infradead.org>; Thu, 29 Dec 2022 09:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVJacmndrR3SXF4pgI7oq7jigbBGB7nMmK3ZJ4uErFg=;
        b=sLDUvYVARgK48hM4ztw89h3d9Pa2+0WTyT7T5Ud9zRoin3WUKukse7kiiDZK/VqpLy
         TTV8avCc4fhG2Q4R4ek5ySBKdx9iZ9VUoBkgSVttyKy+QT7h6f7rsNNr5APjsuJ036QY
         bvRIrXiGnJ4encNQ85H3NcxikMAaZgZXmx+2WbHUfO4YvZJc8cQK3u7CGNMAKkvMgviE
         qPg4A5cB8ZgArCQSwb4L9pFxEBj/rBwNe3P9/d2Klt0PAKvxbQaXXnxCkAkxni2bxWnZ
         4ph22vu4DS5S7CwJenUcWlx2fGHqIA3NHkf6DcE46OxlcnThLbDf6M7u0v8qLZuaaBvy
         B+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVJacmndrR3SXF4pgI7oq7jigbBGB7nMmK3ZJ4uErFg=;
        b=vrYVwAP/Jts0acnT7paxvf2bv5MT7JS/ST02iw8lO0xS3n0OgACRZE8uWDUKeul9gd
         /gY+MLVlc4mbREw7LNgDuj9N592Aurozrjv4TtHcgy1soT2l/fO+uJHH6AwGzEY9Y2DE
         OhqDBXD6l3N1PpdbPP5JZzLkHnvLODn0UIT7V46nmUZUqBkfHLt1o+AnCzPxpTjiLVTj
         mwCv5uU2bzksdz6GoVxZNo+RaNNj4Jbn28D7zu0gIBmf+5oxTkdD0WwQoLokhZFWcfpC
         ZUxYZ4193sQ+WJ9Dmnzsk3rnYQ5KtQUF+Y6FLoE9uWNNWvRoC4r0OtjdZPAH+4rPNEfP
         PSQQ==
X-Gm-Message-State: AFqh2ko5WldB6Q/Hky06sahfibQ7obzN6Mr11DVW570TY+Qt6GO9djL0
	REz8BAwrpr0YiKHU/n5d1QvE7DHLjzp7lSiFlsw=
X-Google-Smtp-Source: AMrXdXv0mxJh49+wrAsaFTyEAENNSxXzOQUalYVKurBjgXyeUd3pmwBkvxXy4JCbjCFBxoRUdIpJ8Q==
X-Received: by 2002:a05:6a20:c78d:b0:a3:878d:c126 with SMTP id hk13-20020a056a20c78d00b000a3878dc126mr39597273pzb.42.1672335087597;
        Thu, 29 Dec 2022 09:31:27 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id 27-20020a63115b000000b00477bdc1d5d5sm11199985pgr.6.2022.12.29.09.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 09:31:27 -0800 (PST)
Date: Thu, 29 Dec 2022 09:31:27 -0800 (PST)
X-Google-Original-Date: Thu, 29 Dec 2022 09:31:18 PST (-0800)
Subject: Re: [PATCH] riscv: uaccess: fix type of 0 variable on error in get_user()
In-Reply-To: <20221229170545.718264-1-ben-linux@fluff.org>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, ben-linux@fluff.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben-linux@fluff.org
Message-ID: <mhng-33b9aafc-448a-4400-9a06-cb222724363a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_093131_707953_F82DD86A 
X-CRM114-Status: GOOD (  19.32  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 29 Dec 2022 09:05:45 PST (-0800), ben-linux@fluff.org wrote:
> If the get_user(x, ptr) has x as a pointer, then the setting
> of (x) = 0 is going to produce the following sparse warning,
> so fix this by forcing the type of 'x' when access_ok() fails.
>
> fs/aio.c:2073:21: warning: Using plain integer as NULL pointer
>
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
>  arch/riscv/include/asm/uaccess.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 855450bed9f5..ec0cab9fbddd 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -165,7 +165,7 @@ do {								\
>  	might_fault();						\
>  	access_ok(__p, sizeof(*__p)) ?		\
>  		__get_user((x), __p) :				\
> -		((x) = 0, -EFAULT);				\
> +		((x) = (__force __typeof__(x))0, -EFAULT);	\
>  })
>
>  #define __put_user_asm(insn, x, ptr, err)			\

Looks like arm64 has a pretty similar pattern.  They've got the __force 
__typeof__ already, but given the similarity it might be worth 
refactoring these to share the error checking code.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

I'll give this a bit of time like usual, unless anyone's opposed I'll 
put it on fixes.  I wasn't planning on sending a PR this week anyway due 
to the holidays.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
