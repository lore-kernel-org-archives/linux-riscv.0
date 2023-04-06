Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D45C76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 17:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUZEodmA/X10ANW8Aj2W+swzpgqzxau/L7sa1fRDBCE=; b=RCWijcK1bMmGxd
	Al4pPDYOobn/IqqggW9nGCR+NZvYUpcMMGZrhUnN53TLcjjcV2BFYrHaZ4ssAVkKr6xBRIVfvH4pR
	Oy2//6cWTc0jV7jr4JMitNXkddkkQV5BWTqk6xs18zJW/b41aWZHNodZ69O4YQaC5uvnLIztYPeig
	FqfFc2mfz5oMaiEu3EtsvdLvr3GL4hlXdEIsm+/8czRBTg35cyy+xSEKrWVc1xGYoThyUMvMpFyiG
	qSKW4UixeUkHcmoNM8UFC0CHAgjQZFlvFjgepfvQIUt0pvRa9hTGM0XbeK4J2K49gme+uxJQPvfeL
	1v713nAMkXK1T3r0YZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkTHN-0086sA-1w;
	Thu, 06 Apr 2023 17:20:09 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkTHL-0086pD-0W
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 17:20:08 +0000
Received: by mail-ej1-x634.google.com with SMTP id cw23so3107829ejb.12
        for <linux-riscv@lists.infradead.org>; Thu, 06 Apr 2023 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680801600; x=1683393600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M3uUKW6dzuBcxiv7wPFPlh8AowQu6NgUDOohsGPsRqc=;
        b=ZNnjoRSA8C4ZUWBDwwSK4LmnYcrDpdogkx9nP+8KF6c320nxYGztaz6TDB6Dsjqkm4
         ccgfzCvbaHMmAlRxMUCr3xuShpm9/QKykpwAE8ROW51UabKnTIILVt8qX6ZcJno0lxky
         9xeVAP6ecNVK8VGVUTMQNedb3VD/43s+jiKnBRv6QWB8PlWCBxn2cfGCCCIb5KgvpuSp
         6LBraGJa64PNgHiOZ9L34rxVwUklDh/2DRL9P0K0PEGLWRSSv26etIsV7SQYzAmESvDf
         rZoemeliwLysUhEIt5RCsQd/m1XHZ4fAV6t9CDyKsuNJgpNpEYya0sfAMs6ASP1ItCZQ
         H9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680801600; x=1683393600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3uUKW6dzuBcxiv7wPFPlh8AowQu6NgUDOohsGPsRqc=;
        b=I0qA/xWlSTCZJ2U86TREl+WEQnl5JIMipBkUNCJ/gtIBNJtG3AjUmBGprMcGvxgEli
         axxY4/aNNue+EtUTStbqhIA+vRawbDULd1LuwVGQabiMYisuvQnh/T9ntSTtjLYoBrng
         n1qOakHD0pAjh9JNNHvguUYADzIrYBpe2DB3pR34UNmFdbTPTnq3ebzl65uckbXu/NCD
         akmw/eTRETRyZnYT5voTLtPxuM4p4ceRL8F+xn5rYmwyNLBgeommh792s6mfSTmkzi8w
         SRyRJwVEVveUMMwkxnUb35IiqGX+na44YVit1w9GRjal5GlF9bmDtJvgOdNipWE0Af0u
         B7qw==
X-Gm-Message-State: AAQBX9cL2dyONixwjLQXNCGIQh7Lib1/XevGzlrH0gcjm7/7MI0JiYsu
	SqoNTbB0AtRmMEg3CrO3hPs=
X-Google-Smtp-Source: AKy350ZCfyM5SOtfesc+qhalcrjMtsxx6jFR13Rhm/qVNJRtMoNKH+wOa0M+HbZUj7qNsLdXb0nIHQ==
X-Received: by 2002:a17:906:4555:b0:932:3d1b:b69d with SMTP id s21-20020a170906455500b009323d1bb69dmr6836311ejq.47.1680801600276;
        Thu, 06 Apr 2023 10:20:00 -0700 (PDT)
Received: from andrea (host-79-22-3-90.retail.telecomitalia.it. [79.22.3.90])
        by smtp.gmail.com with ESMTPSA id mf21-20020a170906cb9500b009495cfe446esm1050570ejb.223.2023.04.06.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 10:19:59 -0700 (PDT)
Date: Thu, 6 Apr 2023 19:19:43 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/2] Deduplicating RISCV cmpxchg.h macros
Message-ID: <ZC7/LzV53KsZ/cSn@andrea>
References: <20230406082018.70367-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230406082018.70367-1-leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_102007_207029_FC1D9F3E 
X-CRM114-Status: GOOD (  14.40  )
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

On Thu, Apr 06, 2023 at 05:20:17AM -0300, Leonardo Bras wrote:
> While studying riscv's cmpxchg.h file, I got really interested in
> understanding how RISCV asm implemented the different versions of
> {cmp,}xchg.
> 
> When I understood the pattern, it made sense for me to remove the
> duplications and create macros to make it easier to understand what exactly
> changes between the versions: Instruction sufixes & barriers.
> 
> Thanks!
> Leo
> 
> Changes since RFCv3:
> - Squashed the 6 original patches in 2: one for cmpxchg and one for xchg
> https://lore.kernel.org/all/20230404163741.2762165-1-leobras@redhat.com/
> 
> Changes since RFCv2:
> - Fixed  macros that depend on having a local variable with a magic name
> - Previous cast to (long) is now only applied on 4-bytes cmpxchg
> https://lore.kernel.org/all/20230321074249.2221674-1-leobras@redhat.com/
> 
> Changes since RFCv1:
> - Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error
> https://lore.kernel.org/all/20230318080059.1109286-1-leobras@redhat.com/
> 
> Leonardo Bras (2):
>   riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
>   riscv/cmpxchg: Deduplicate xchg() asm functions
> 
>  arch/riscv/include/asm/cmpxchg.h | 319 +++++++------------------------
>  1 file changed, 67 insertions(+), 252 deletions(-)

LGTM.  AFAICT, this would need to be rebased, cf. e.g.

  a8596dda1fbf7e ("arch: rename all internal names __xchg to __arch_xchg")

from the tip tree.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
