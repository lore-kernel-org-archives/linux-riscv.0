Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51D2C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OolspsqTOk1BLTIoxV7khqF01xUqBi6eky2tQwwGfeI=; b=WtyBw/hhdQcyxR
	XYBSLG8oX3vvx30Ir/wLhIu/yMk8EVelU8Y85SqE6kHzxQ7SaeJiNiBi8B0ZTEfLEuVmiD6AuxSZw
	Ai87jOHp7tqsz/LsjKouT7+ZEZSYUvAX7uB3tta4h+S34fC+sZMrAkjDLFktRMF2OVA0+uevOfHIr
	eEk1penHnSdpWqP/ExRlLrdpQ0qCauDtOQpf8TEAkZBC10ToOSXaFSr2gK+4UTWzukYtPNQKeBjW/
	8hkPBAMYeLaXQiw3M4H7lPTOgD4A7Q7aliOOUL1q0j/nWnJf3tEPwUNh7vFDQXiKi8zh0qcMgENwj
	NmvpEx3c91atty/akmNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMxC-00Dz0Q-2l;
	Thu, 04 Jan 2024 12:36:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMx9-00Dyzl-1l
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 12:36:05 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a28e31563ebso51971566b.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 04:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704371759; x=1704976559; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wA8tdLBKnR1x8I35Fv0XH19oWXShs3g89QU/QFpxadM=;
        b=jM8MWXww0Yk3e7hP/fT7gPeusIOVDlmnjHp2iHHMJoU22CCaOi10HZxR9iQC10UkI3
         25RRT9uOJ2VOLXEYAphzT1ZdTJpRI7vpe7xSV2/98RuK+5mnliiCJWN53WpFPBSJg0Kj
         4Ws+P2jm3auUn9iijT4NUZ+WApLKAeHTUJXAc7yD8jBwjESTL/sQgGubXPd3bOxIFP4e
         TMEJTBD2TsDyom+h0qMSsxOa0uuTAFenIlPyizOS86S0jvduQPBgd0Jlbi3pKoZhenoT
         l6E2nKU0Tcd1q7GMEaV7xmMMfdRxTmmLDRmZo0RAKCnXvFoLZgR+c912fiL7CDuboH+O
         WbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371759; x=1704976559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA8tdLBKnR1x8I35Fv0XH19oWXShs3g89QU/QFpxadM=;
        b=QK7tVPCtfSFKaQA1/f4wN4M67HAl1lg1rsI5ciQyTuj7wtur8jgnkSTi1JJF4j5GVY
         PBsEcqbJZCwiNtpVS0GTSujS5pNvppn3yxNt1jYRXU/YV+PpSyl9MUdlTL3uC483kUqS
         zEvEJjNFLtuVvI2N6e8CgvGry6XFfdp9RZkVJMkO9N90Fj4wyiQYapZ/9bjZjpvK4xzA
         G5zLpYxoBZYplOkKd/RqrQ0mRCIZQj8Ru/YOB65EtJPTdoD62DH+H+8hiek1XS8KyDG8
         JYs1A6oelFU+TAL6XnJQ7DmGzp1IxCbDImDu0TzOYSgw0fN5lKMTPF3qL5Va7yLPIrac
         xNhg==
X-Gm-Message-State: AOJu0YzN7duwoqJKzgjXc+vOB1079aUGTeOonBObO33HfqjL0EzBHhU6
	kDOYvqg/DNdJO7UMr64grMcoFlf36sZR9w==
X-Google-Smtp-Source: AGHT+IGEsf/5+Eq93O64/3AUioi3tODLzSGliLS5eYTKrhpMxJDu9nQZTe6WatVkiHprqqTI7tEpDQ==
X-Received: by 2002:a17:906:4:b0:a28:9d4e:f065 with SMTP id 4-20020a170906000400b00a289d4ef065mr215474eja.13.1704371759375;
        Thu, 04 Jan 2024 04:35:59 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id l2-20020a170907914200b00a269b4692a9sm13804758ejs.84.2024.01.04.04.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:35:59 -0800 (PST)
Date: Thu, 4 Jan 2024 15:35:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: Convert relocation iterator to do-while
Message-ID: <39727434-a265-484b-9ee6-da6611487b47@moroto.mountain>
References: <20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com>
 <20240103-module_loading_fix-v2-4-292b160552c9@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103-module_loading_fix-v2-4-292b160552c9@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_043603_605576_E4938724 
X-CRM114-Status: GOOD (  23.24  )
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

On Wed, Jan 03, 2024 at 12:22:03PM -0800, Charlie Jenkins wrote:
> Use a do-while loop to iterate through relocation entries to prevent
> curr_type from being marked as uninitialized.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: d8792a5734b0 ("riscv: Safely remove entries from relocation list")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202312130859.wnkuzVWY-lkp@intel.com/
> ---
>  arch/riscv/kernel/module.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index ceb0adb38715..581e425686ab 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -633,15 +633,31 @@ process_accumulated_relocations(struct module *me,
>  					  bucket_iter->bucket, node) {
>  			buffer = 0;
>  			location = rel_head_iter->location;
> -			list_for_each_entry_safe(rel_entry_iter,
> -						 rel_entry_iter_tmp,
> -						 rel_head_iter->rel_entry,
> -						 head) {
> +			rel_entry_iter =
> +				list_first_entry(rel_head_iter->rel_entry,
> +						 typeof(*rel_entry_iter), head);
> +			rel_entry_iter_tmp =
> +				list_next_entry(rel_entry_iter, head);
> +
> +			/*
> +			 * Iterate through all relocation entries that share
> +			 * this location. This uses a do-while loop instead of
> +			 * list_for_each_entry_safe since it is known that there
> +			 * is at least one entry and curr_type needs to be the
> +			 * value of the last entry when the loop exits.
> +			 */

I know that I reported this static checker and all, but actually after
reading this comment, I think we should stay with original code.  So
long as we know the list has "least one entry" which we do then the
original code worked fine.

To be honest, I probably would not have even reported this static
checker warning except that I saw there were some other issues and
thought "Eh, why not throw this warning in as well, in case the list
can be empty."

The other three patches look good.

regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
