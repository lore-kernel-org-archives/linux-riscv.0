Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF809C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 19:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t39aLewgX9xPVX77ojP6AGVNi0GRE3HTiTX+eWIhfTY=; b=WpCAo14i3qriXK
	RMX46qyLOK3hKwU/b2MBRKVeue10ifRNf61Im4TByG1dJ6CNR7BbmN+pWCqK3autLgp1O1UMj2M38
	cq0yX1tWcR5qRpN1TgPU1CERHf/sXf4bMCOClrBhZmIy4GfRwamr7NpZeqbIdk4q8Nd9AMzG1+dQ6
	4y9WU2SM6bqiIuIzHFsvGcBRn0b7FMl9sZlPTLSTMQuB3DZL3C6nZcOOaM0GMgH4FalhXBMtK5SQw
	Szt8nOql3EFt1hj9yFCdEVnDUfqDn6FEQx5Wtt3jyD5H5q2oT6GG9t6yr3kjKnGi741UYrmcgQTIi
	8CD7r5P9J5sSilqZZgUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTW3-00F6N4-2x;
	Thu, 04 Jan 2024 19:36:31 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTW0-00F6KS-1c
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 19:36:30 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6da9c834646so588505b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 11:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704396985; x=1705001785; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5jyLPzGlkBzpMC1Ie2DgS7N7g7HFIfbpKPqTLTs2R68=;
        b=sLSVf7iRCsm/+hO9SzfV6w+8Id9eNoIxTMWDP67uyUV69jXNT/tY1+e1mFJuFrxD41
         2ym5dqJKsAWeXLkIWeFKOiyKPPzQqtv7IqGOcxJf7x1n7cZmA4AV2nhWhDhyIFEsWcSL
         LgsmH5P8x7b4IpCFndi8pj/N/1J1L3DzA2GM5LUIu91WMhDFm9raUb1XEdAmxMh6+Aal
         54t5KWZmHTxLfG1sCxfnS3R4PrbWW18S1pjVr96yzNmeyhnMyQeT/Tg9bsvYZcz1g4PF
         eQYhPjRba+cVtSvabI52Ji7KrDgxnWWtUaG0ccUbnVtT/tUXyXmiKOuqxK4FZ5Zxo6Ow
         0eqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704396985; x=1705001785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jyLPzGlkBzpMC1Ie2DgS7N7g7HFIfbpKPqTLTs2R68=;
        b=P9kiULlUo+RTTGFlHi+rjQAOvhAjP3f7chGbVmWjrsXXHHWlFrorM6+OhuINXrLFXp
         w8FYlxxzBiGhZl0cTNhL251+2a4m6yGOhc5bovC61AbTXt+hmxYDJSMSI9fFt1+sNVpU
         k+ArHDWYd1y2ftVcVpA+4chKy0yk1TGaT9r74NkDinZ2Lo0bF585veX+rWVsNp2kS2G/
         vqMAqmJIy1X6Lu29nrkvk/RJEWbY1H9UHIs5riKqjh1EThnD+M11c0pM8bwyW6wnSwkC
         0AXqkdz1uqTqxLpf7tv9/O6zjFQ/Bdly9eeQiq9gI847QiY3YWKxYzJ1WQaVEC0nEJ8s
         lh4A==
X-Gm-Message-State: AOJu0YxUdxWoYCzMNFpz26UMDh+hSgikuW0Iclz4bNwzAUtZh090ORo8
	t8rnsKvUQHYEa6nC0i1/aSuXu0O4mxHlxg==
X-Google-Smtp-Source: AGHT+IG/iL6sTjfq2ya9QGl5wDoK7MD1hL09Yv8G/ovDwT5oWVUmHs7UgRl9PtyO8HocqpDkSoN/6g==
X-Received: by 2002:a05:6a20:8415:b0:197:5be1:262b with SMTP id c21-20020a056a20841500b001975be1262bmr1108314pzd.83.1704396984958;
        Thu, 04 Jan 2024 11:36:24 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:bd91:d703:f34:7cf7])
        by smtp.gmail.com with ESMTPSA id ko7-20020a056a00460700b006d9a0694f93sm23013pfb.205.2024.01.04.11.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 11:36:24 -0800 (PST)
Date: Thu, 4 Jan 2024 11:36:22 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: Convert relocation iterator to do-while
Message-ID: <ZZcIthn20O1l1DDL@ghost>
References: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
 <20240103-module_loading_fix-v2-4-292b160552c9@rivosinc.com>
 <39727434-a265-484b-9ee6-da6611487b47@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39727434-a265-484b-9ee6-da6611487b47@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_113628_766250_009B7AE5 
X-CRM114-Status: GOOD (  28.23  )
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

On Thu, Jan 04, 2024 at 03:35:55PM +0300, Dan Carpenter wrote:
> On Wed, Jan 03, 2024 at 12:22:03PM -0800, Charlie Jenkins wrote:
> > Use a do-while loop to iterate through relocation entries to prevent
> > curr_type from being marked as uninitialized.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Fixes: d8792a5734b0 ("riscv: Safely remove entries from relocation list")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Closes: https://lore.kernel.org/r/202312130859.wnkuzVWY-lkp@intel.com/
> > ---
> >  arch/riscv/kernel/module.c | 26 +++++++++++++++++++++-----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> > index ceb0adb38715..581e425686ab 100644
> > --- a/arch/riscv/kernel/module.c
> > +++ b/arch/riscv/kernel/module.c
> > @@ -633,15 +633,31 @@ process_accumulated_relocations(struct module *me,
> >  					  bucket_iter->bucket, node) {
> >  			buffer = 0;
> >  			location = rel_head_iter->location;
> > -			list_for_each_entry_safe(rel_entry_iter,
> > -						 rel_entry_iter_tmp,
> > -						 rel_head_iter->rel_entry,
> > -						 head) {
> > +			rel_entry_iter =
> > +				list_first_entry(rel_head_iter->rel_entry,
> > +						 typeof(*rel_entry_iter), head);
> > +			rel_entry_iter_tmp =
> > +				list_next_entry(rel_entry_iter, head);
> > +
> > +			/*
> > +			 * Iterate through all relocation entries that share
> > +			 * this location. This uses a do-while loop instead of
> > +			 * list_for_each_entry_safe since it is known that there
> > +			 * is at least one entry and curr_type needs to be the
> > +			 * value of the last entry when the loop exits.
> > +			 */
> 
> I know that I reported this static checker and all, but actually after
> reading this comment, I think we should stay with original code.  So
> long as we know the list has "least one entry" which we do then the
> original code worked fine.
> 
> To be honest, I probably would not have even reported this static
> checker warning except that I saw there were some other issues and
> thought "Eh, why not throw this warning in as well, in case the list
> can be empty."

That makes sense, I will drop that patch.

- Charlie

> 
> The other three patches look good.
> 
> regards,
> dan carpenter
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
