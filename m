Return-Path: <SRS0=uNJT=B7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19483C433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 03:32:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBDF52076E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 03:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t9SiB8GU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="VKyMt5TT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBDF52076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5fNtzYGZcgI2mqjBBG1YQmcRQSmbBOgd4p59ppUn68s=; b=t9SiB8GU8LbiSmqbCViA1uRo5
	6zLdTzyUtdCm9JhVwOrxxmLtzKc+17wTFKSbAqVITIaRqUNKr+4+xrHk/3nr2fHVd/wbNaMPECoNX
	xK9y5jZguXnWIluaF76VBej4y+q5rBiYOZinjlQ6zYYZFqFLtUXhARjcozk+GrE8ypnpqgy+uOM7p
	Bui3TMAdZ7XKEDKflw6/L/miu9y9/prPWnZ7JUeqzQsEtvcS6cSMqvz2kSzKZsFz9gEqjIoJlN2t8
	NO7tbUf+qUXpagZiIuWqYyVgnkCU6GnlWCWOKPQzsGOjTWT6sxBozOnqDauwFIuYXfp94sfTd6MO5
	UCtQlKO8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8xmw-0007BB-DK; Fri, 21 Aug 2020 03:32:22 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8xmt-0007An-Fc
 for linux-riscv@lists.infradead.org; Fri, 21 Aug 2020 03:32:20 +0000
Received: by mail-pl1-x643.google.com with SMTP id r4so273902pls.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2020 20:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=toF/5DBbTF6P/bVnU3i7TXkYnGIcfshhfFVXEEBSCFs=;
 b=VKyMt5TTm+3JKwxET9vCuJUGFhBsP1HJf2j9cVXX5vyz5r+uGjKeXz61HX/O5iKNvg
 1IOKbWYJDHAVy7ur3kHqZa2kS7UjZC8RfpY/+fMiAQXSwPkfkmrh+dE7hzNA0JU70uRF
 nykLcmf6ZE7csacDwDePPzIsig/qPjomUSZcYruWnbQhliMby+ys60wNEeiVShtpEyrn
 COs6oLwv7VHYAxLxnbUNlGQJpF9xfTRmcYQDPI8tk6ZxV/zLcRJtk0ouqTQ2LB9AqhVc
 5ZmgXOfxS8MLDAFUu+KbyLMWTMV65KNdS1d6QEIOIotAL3pq3tg7zKY3waiMsZU2eR3K
 jayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=toF/5DBbTF6P/bVnU3i7TXkYnGIcfshhfFVXEEBSCFs=;
 b=Jii/58yllAJVk0Xqz0h+7Z3BD6yzugD9RLQ6+Vxq/Oyn3T8cAg0owCwSwb0parsBJT
 lA6SCh4YAbkY/OCXvmkHx1wjxOZQM/cLyNK3uMK6E0fGzCh+ys/95mXZVM/1hCTf6Rs+
 FBUHqGzbe4f7D3iwmkVEoRKkfnICN1Me7OqAYodpezgl0AGMIwmo+w2dWCU98nOYeVk/
 FUnbnZXto+prXhp1J5Tn8U0M9i+M+NaVBfy8oPgk0l6K2WRhW+SHfBpHxzZNP25or/7I
 z4IYQzYUtZo7AZwU2BcXbyCbU/6IOAT6ZvxTpF1uxx8KAPDr7YzvH4UWjiQjkzcP3JJp
 veYQ==
X-Gm-Message-State: AOAM532MaojWkpSQmTDUtzV2YV+x4rg00yaOHz8Q5MUCIEhIHQTz8D3M
 CwRN7SLue2AwU0q0bJ+3MnTQ1nsgqnD4/g==
X-Google-Smtp-Source: ABdhPJxlIpUzHWWIKIJJgH8OEhrOsz+dy7uZgi2ltNEUOOoKvejnjdWbzKPUylnQ8bLsDDeaCBhFKg==
X-Received: by 2002:a17:902:c1d1:: with SMTP id
 c17mr731210plc.165.1597980736648; 
 Thu, 20 Aug 2020 20:32:16 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u21sm332294pjn.27.2020.08.20.20.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:32:15 -0700 (PDT)
Date: Thu, 20 Aug 2020 20:32:15 -0700 (PDT)
X-Google-Original-Date: Thu, 20 Aug 2020 20:32:13 PDT (-0700)
Subject: Re: [PATCH] riscv/mm: Simplify retry logic in do_page_fault()
In-Reply-To: <20200819141011.1904770-1-penberg@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: penberg@gmail.com
Message-ID: <mhng-22936729-fb29-44c8-bb2d-7aeb31c4e686@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_233219_675831_353C1DA8 
X-CRM114-Status: GOOD (  19.35  )
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
Cc: penberg@kernel.org, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 19 Aug 2020 07:10:11 PDT (-0700), penberg@gmail.com wrote:
> From: Pekka Enberg <penberg@kernel.org>
>
> Let's combine the two retry logic if statements in do_page_fault() to
> simplify the code.
> ---
>  arch/riscv/mm/fault.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 716d64e36f83..f5c2e4a249eb 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -127,17 +127,15 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>  		BUG();
>  	}
>
> -	if (flags & FAULT_FLAG_ALLOW_RETRY) {
> -		if (fault & VM_FAULT_RETRY) {
> -			flags |= FAULT_FLAG_TRIED;
> -
> -			/*
> -			 * No need to mmap_read_unlock(mm) as we would
> -			 * have already released it in __lock_page_or_retry
> -			 * in mm/filemap.c.
> -			 */
> -			goto retry;
> -		}
> +	if (unlikely((fault & VM_FAULT_RETRY) && (flags & FAULT_FLAG_ALLOW_RETRY))) {
> +		flags |= FAULT_FLAG_TRIED;
> +
> +		/*
> +		 * No need to mmap_read_unlock(mm) as we would
> +		 * have already released it in __lock_page_or_retry
> +		 * in mm/filemap.c.
> +		 */
> +		goto retry;
>  	}
>
>  	mmap_read_unlock(mm);

This is missing your Signed-off-by, and while it's a bit pedantic I can't add
it myself.  Otherwise

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
