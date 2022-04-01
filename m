Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D215C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 00:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=CMNAo6S18Zu1lKx9sVnmtI7x8NuACH9jHNxPiyiA8N4=; b=1Kr7/4DMdhrmLttAICucuD5Dvq
	SQbUp86UaGF36j+Ry/6ethSuIjHEUn2zYeg5084MDZUhDGqFfETWVYqtE51DqP6e2b7z/yIWs7YZI
	4S2vBTlldqgKPanVZV0NRjzIjV9cwT0B1jma4ug0+VCPe9LdrKJOlRUlGbMGa/j8phdRsTi7Hqizt
	2Gh2tfJsiTJnOL/42grz3nX2LDBcqOxvnLGRIeqKI5xF2NM8P1ZRaIq01PAvh/i/I0JWcAUy53A+l
	1fb6jFCpTsx+SRziz4IBWXQB5nRLTtVLO37g4SchtiOwWfREVXrtMhpeyQuQ4oqqBv7pfBPMeYAgo
	kQXegzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na4n6-00404C-W6; Fri, 01 Apr 2022 00:05:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na4n2-00402o-Rg
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 00:05:22 +0000
Received: by mail-pl1-x62a.google.com with SMTP id x2so1026037plm.7
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 17:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=p1Kk4asKnMlrLdFRP7KKaRA1SmfSqVpzna8bIJo/9fM=;
 b=Fo+F2q273Jom1d6+49Kn4y8sS3JIWP9Hm5KfaGS7UuL7ZN/g1Qc65G1IUtU+Txwf3t
 NpieS75qeiyyqlsPakJVqEqZrH89XLxR3qd1c1Y5WDMAbmFNR6W6Fy9HGIJo62QbdoKC
 hJFWcH09JN4eisXcydwjq+0r9v2qwE9hNm7ONJIgQZYak8OJhNvsYeHj6Gey41Nqb8+C
 xdmR2Ag69ccHTmG3MpBKMewdek8eWwewZnpEJNMv6SsjQg1CY8B5FCc4iQzz19t6u7et
 btanDcsTBRfl/tQFniC6gpNnfUEIbGZFNd4n55V5agn4e0QFPklp56aqROGoZLBrCsa4
 njZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=p1Kk4asKnMlrLdFRP7KKaRA1SmfSqVpzna8bIJo/9fM=;
 b=LStGx9j7xKLljaIhRA2w1JV2+IRHkNTS0rtiSrchXLi5LhC0Y53cTfwZ1ZNX6cgaCB
 t733qT9o+n5rVx8hvjvrMe3ynE3mncGSGsKKCqxj01y1VaKFCsvFr8e8p4yXgzO69mqp
 hxIjhDF1hkpcgg1iqfCSswNuj2c+wXmACApIDafmlzUnctcw29bSv+jWMiJSeGzY9g0i
 rRT2SBRMtY+CyuGXpqoC2XLVE43OVY+36fiJeT5V2RyvN3rZ52YiN2MuR1pTcLH3g5FN
 T7YJDEOhiQM5hdOHJSUr5KG8AJjMb8uuHwrykOt58YhK2kH4sRguMa/WMq4hYL9hDc8M
 e+Ag==
X-Gm-Message-State: AOAM532Yz35xyGw+kGJqCB6w+JMXBqI9bvPK+OSImIQpk3uk6GGtlcrt
 rqZ3mAmmg3MHQXo9wLjzihQdSw==
X-Google-Smtp-Source: ABdhPJxe1BJPhMA/qe+O/I1I6VTtI0vPk9DRXRO2Bb5f18M5jyRjbCnZzywP9UowAOFfgdvjVyYn/w==
X-Received: by 2002:a17:902:d3c5:b0:154:a3b5:d918 with SMTP id
 w5-20020a170902d3c500b00154a3b5d918mr7696913plb.91.1648771519308; 
 Thu, 31 Mar 2022 17:05:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 123-20020a620681000000b004fa7c20d732sm593121pfg.133.2022.03.31.17.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 17:05:18 -0700 (PDT)
Date: Thu, 31 Mar 2022 17:05:18 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 16:19:20 PDT (-0700)
Subject: Re: [PATCH] Documentation: riscv: remove non-existent document from
 table of contents
In-Reply-To: <20220329084428.376003-1-bagasdotme@gmail.com>
CC: linux-doc@vger.kernel.org, bagasdotme@gmail.com,
 Paul Walmsley <paul@pwsan.com>, 
 Atish Patra <atishp@rivosinc.com>, atishp@atishpatra.org,
 Atish Patra <atishp@rivosinc.com>, 
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 linux-riscv@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bagasdotme@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Message-ID: <mhng-cda2a9b2-2e3a-41a8-8df9-ee3d05d47a1a@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_170521_140389_B74F573A 
X-CRM114-Status: GOOD (  18.87  )
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

On Tue, 29 Mar 2022 01:44:28 PDT (-0700), bagasdotme@gmail.com wrote:
> Remove reference to non-existent pmu.rst from table of contents tree
> in Documentation/riscv/index.rst.
>
> Fixes: 23b1f18326ec ("Documentation: riscv: Remove the old
> documentation")
> Link: https://lore.kernel.org/linux-next/20220329133412.591d6882@canb.auug.org.au/
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul@pwsan.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Atish Patra <atishp@atishpatra.org>
> Cc: Atish Patra <atishp@rivosinc.com>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
> Cc: linux-riscv@lists.infradead.org
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/riscv/index.rst | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
> index ea915c1960488a..e23b876ad6ebb6 100644
> --- a/Documentation/riscv/index.rst
> +++ b/Documentation/riscv/index.rst
> @@ -7,7 +7,6 @@ RISC-V architecture
>
>      boot-image-header
>      vm-layout
> -    pmu
>      patch-acceptance
>
>      features
>
> base-commit: 1930a6e739c4b4a654a69164dbe39e554d228915

Adding the doc folks.

I'm going to go ahead and just take this via the RISC-V tree, as I just 
broke things.  I'd usually wait for longer for an ack/review, but IMO 
it's saner to just get this into rc1 so builds don't break.  My version 
[1] was sent at the same time and was CC'd to the right place, but I'm 
going to take this one instead.

[1]: https://lore.kernel.org/lkml/20220329164544.29367-1-palmer@rivosinc.com/

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
