Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734BEC433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 22:39:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC7120768
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 22:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kRJ/h6+Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="qX/gU7Xo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC7120768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=sdsUpC2ScGI0Oz47hlowXuh0TMA1nRiNMeC4PABkxgc=; b=kRJ/h6+Z8ESUvzadT5sDW+jjh
	l4jJCv+8H3pK+4evkKVw2T3564gl++cpmQsFkZVb+cIt51RNjYPhWslu0DQEIXFukEMcBdZ7VckF+
	7a+qTAx9MonFWr4SLFI1vh+bby5kEJEc9ilXyLOaNOzP0UZB5soz0WGqvZPjrdCxv0pr1oc91K0gF
	ktsv4E6S3EE/3+D2uzFTpIS+GvnpBRC4/20vH7CHkbLtFXvTDWwauagzGlzbvaRqcqqdHKRVvaRZr
	tuVArD3W0INDREFtulLcpDH7kivuubabmJ3g61AJbmtqPbBlFcC49MI9U45WLanJFQgek/3z8/I8V
	4MaL23hpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6iLk-0003TN-Bk; Fri, 14 Aug 2020 22:39:00 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6iLg-0003Sf-TM
 for linux-riscv@lists.infradead.org; Fri, 14 Aug 2020 22:38:58 +0000
Received: by mail-pf1-x444.google.com with SMTP id d188so5238925pfd.2
 for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2020 15:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kL5n12ePtcvvUroFRzudNinNlHLnJCdYH1ARxqbbr4E=;
 b=qX/gU7Xo60JX46P0E12reWeabUoE7BULrX9T76F5L0LiGO+jwIk0+5TrRq1+ErafIN
 JY3stz+WftSExNQFpVKu2ShSnuZfaWn+yjB3qbT5dadACzEVItoZhctLuM2CV+XUqvYO
 g+ZiXGnom2klOzW8jITzGPV94/GxrAu/EdHg3kvKFpkNLR7TFcQ8nDfNKfKI3M3HIo39
 4i95wh1EETZV4nzjW91vMdSFr0h7gLOxaW8KObtMGZwdnW0ViTzuiNpKygn+HvZ5cCFZ
 ZEGdjH7thDNaVDF6TU6nXjQ9drahGTJ/nAf37WPIFwhnPwtgRIxHV8k5JtQ88Z4h8h/C
 XC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kL5n12ePtcvvUroFRzudNinNlHLnJCdYH1ARxqbbr4E=;
 b=uB/nHYTin3Fqzt1YODW2MhAHkBWO4sSpLXa1NVZPJlMhOnNZXwTg5NqjHgHwI3xcxq
 jIwU3FvGS1LtPa8lXkzWgG5OP4EHXisecg9F63/q9eCpZe0zYdyyAnOS9Wq2irzXjHxW
 iKNW1x8jx3PirrD3uqvAKH8/IOf/BQFWUvDy1XiH39KoYWUUPN4JkhcOm/10OzgUzm3/
 oAacM/maEH5YG+9LJSfm5W5j5FFvSOC+HJRjEJoRyN59qqPteRiIuI4lf5ujRISkAM2F
 GF8K9iCGf8zOIHtzJM3G6mPAYLLYU/HboZUvr+AIke4EHwwFkGXwcMOc/28xojzbE6aD
 od8Q==
X-Gm-Message-State: AOAM533Mi9e6hlgFy/bspK2OChahbecXhnzvCDqkjShSEI7SFUX7ZdNa
 pP+a8RQtlQgKfCgzK3qtXrmFmg==
X-Google-Smtp-Source: ABdhPJyUWKai0g2QrbS+Kka8E+ZrIxKx1yZG37WRdArPL1R3DwDv5COnURwPPZTtpC5p20pRF1OyEA==
X-Received: by 2002:a63:ef0c:: with SMTP id u12mr3055188pgh.327.1597444732855; 
 Fri, 14 Aug 2020 15:38:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id kb2sm9071044pjb.34.2020.08.14.15.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 15:38:52 -0700 (PDT)
Date: Fri, 14 Aug 2020 15:38:52 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Aug 2020 15:38:01 PDT (-0700)
Subject: Re: [PATCH] Documentation/features: refresh RISC-V arch support files
In-Reply-To: <20200810095000.32092-1-tklauser@distanz.ch>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch
Message-ID: <mhng-3c3382c2-de41-4ccc-aeb7-7663915b2889@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_183856_973797_CAE9E4B3 
X-CRM114-Status: GOOD (  15.99  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-doc@vger.kernel.org, aou@eecs.berkeley.edu, corbet@lwn.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 10 Aug 2020 02:50:00 PDT (-0700), tklauser@distanz.ch wrote:
> Support for these was added by the following commits:
>
>   f2c9699f6555 ("riscv: Add STACKPROTECTOR supported")
>   3c4697982982 ("riscv: Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT").
>   ed48b297fe21 ("riscv: Enable context tracking")
>   cbb3d91d3bcf ("riscv: Add kmemleak support")
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  Documentation/features/debug/kmemleak/arch-support.txt        | 2 +-
>  Documentation/features/debug/stackprotector/arch-support.txt  | 2 +-
>  Documentation/features/locking/lockdep/arch-support.txt       | 2 +-
>  Documentation/features/time/context-tracking/arch-support.txt | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/features/debug/kmemleak/arch-support.txt b/Documentation/features/debug/kmemleak/arch-support.txt
> index b7e4f3608838..2db76807ec6f 100644
> --- a/Documentation/features/debug/kmemleak/arch-support.txt
> +++ b/Documentation/features/debug/kmemleak/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/debug/stackprotector/arch-support.txt b/Documentation/features/debug/stackprotector/arch-support.txt
> index 3db4763aa3f5..3329559c8207 100644
> --- a/Documentation/features/debug/stackprotector/arch-support.txt
> +++ b/Documentation/features/debug/stackprotector/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: | TODO |
>      |          sh: |  ok  |
>      |       sparc: | TODO |
> diff --git a/Documentation/features/locking/lockdep/arch-support.txt b/Documentation/features/locking/lockdep/arch-support.txt
> index 4f844ecd0680..940b0bd02957 100644
> --- a/Documentation/features/locking/lockdep/arch-support.txt
> +++ b/Documentation/features/locking/lockdep/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: |  ok  |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/time/context-tracking/arch-support.txt b/Documentation/features/time/context-tracking/arch-support.txt
> index a71f3a945285..266c81e8a721 100644
> --- a/Documentation/features/time/context-tracking/arch-support.txt
> +++ b/Documentation/features/time/context-tracking/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: | TODO |
>      |          sh: | TODO |
>      |       sparc: |  ok  |

Thanks.  I've put this on fixes.  Unless there are any issues I'll be sending
out a PR tomorrow.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
