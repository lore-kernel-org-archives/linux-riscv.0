Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFC9C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 02:35:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EABFC22AED
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 02:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EABFC22AED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=w4NWjxDW5264SWn+AB+9DXrHpbItq6o13gGqinLSaFc=; b=owRAhmfHwT9CZL+phKAxtFCGW
	sKJ2tpefwfknV+kFfW3DorHFoc2PXHFOx+CksU9R0pLADSeXJ1w9WNy+Yic4w8EdKWRv5j72dYuff
	9xPAM+2WrEuu3orIwItiS/vOJ94Tlgq1GnL7Sjkyblm4CWUm0TPy7MAL+H4k0jjIRjtteB+Fx5Qhb
	r3mvNxlFwCi/QZeVwxPJlydkepE9qCT/uMuM8I2s8Q0am0m3qdthKsErfN+Rja3KsMO6Vi0KSl2yh
	cBaBl6Zt6ns4XlypkTd+oEHKosXJIzWqSnTmcSIadWmgqARK0REAiM4aHRoBrBzrWuEng4nelzkZA
	uEhrTyiyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krXWM-0007Jt-8q; Tue, 22 Dec 2020 02:35:30 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krXWF-0007Iw-G1
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 02:35:28 +0000
Received: by mail-pj1-x102b.google.com with SMTP id m5so521834pjv.5
 for <linux-riscv@lists.infradead.org>; Mon, 21 Dec 2020 18:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hafxKqysiR3I961R1mf7Aw6KU3LHI/+guwcGTRcJboU=;
 b=rVI0A1zP4lfAmPzZaMaNKYyv9AixsDH+PTcUQ0prVoLxY0fTITnAKMsmy55LCk7+im
 WK8PVx6kkOUxMf9mFyA1Ylf52Di7wENvuP2PPr0/ktCK+Rn1l165JdCqsJCdix4USY6+
 Wd6gI9dMor/u8KS49yWE+wF0NEaXeacyh9WIJqDegAeoHfC5kGztSqRMTwfwGlToMIkz
 lRCuWi70ZdPFPflF64EBu1asfK/GBqJUu7JSmsl1rKCS7T7ZZEk97+h1QhcOPXPYeD2/
 1WPaLuqt4dztFwxiTU7glU/bZSdxJPL13+LgrrrwLCr95cR7UFKJbX5kI3OZr5lbkbps
 Kbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hafxKqysiR3I961R1mf7Aw6KU3LHI/+guwcGTRcJboU=;
 b=PlgfRTb1jaQ7OgM5Di5Oqxj78LjIBswTiKFnQsd/9QqmdCJnBzBEjPaRh/DdB9ArTP
 OpKeMyBiEfrT2gvtla9LoH1t35JoB02UqeZIrG1KvClvQoZgO16d9eg6lk0ATzqFlJFE
 x0d+NZteqz6wtTTMHwZEwPxvN8+SJlrJH8Z+b8VR/o0tq4/5FCnZf//hGOOUZa04bQqy
 qcJW8hnOw6i4l6Glzl9kDLiPZcwrFkPmeiB1IJBU/KtOFtomVh/RYjY2cfpMRoR8HTmW
 H3n+LTYbpbIeLmVrwWwctRCyoPKrwfEBLwqeF1ofDVr3NL+DjTJ5uxey2gJ9AbxCsrYl
 EMFg==
X-Gm-Message-State: AOAM531n/3oSwMjoUpIPhN6Wg+rUGUKX68j2uwa/PPPRTjTDgBYCFn+F
 a0vygygRVP0htH0ZV7Dv/CnAwzYQflTBhkTQ
X-Google-Smtp-Source: ABdhPJwV1isrIXyDoJHEfGX/hFpX6VWTnUX91ySgc/dsRR6v3XJER0DjquL5iqzflTnjQ9Q4rUnEuw==
X-Received: by 2002:a17:902:9302:b029:da:f6b0:643a with SMTP id
 bc2-20020a1709029302b02900daf6b0643amr18917320plb.33.1608604515183; 
 Mon, 21 Dec 2020 18:35:15 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gz2sm17574838pjb.2.2020.12.21.18.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 18:35:14 -0800 (PST)
Date: Mon, 21 Dec 2020 18:35:14 -0800 (PST)
X-Google-Original-Date: Mon, 21 Dec 2020 18:35:12 PST (-0800)
Subject: Re: [PATCH v3 0/2] Let illegal access to user-space memory die
In-Reply-To: <20201204054259.32684-1-tesheng@andestech.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tesheng@andestech.com
Message-ID: <mhng-607cbd62-adc5-45a7-adde-476741f9d63b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_213524_321519_6A6DEE17 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, peterx@redhat.com,
 penberg@kernel.org, tesheng@andestech.com,
 Paul Walmsley <paul.walmsley@sifive.com>, akpm@linux-foundation.org,
 walken@google.com, linux-riscv@lists.infradead.org, vbabka@suse.cz
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 03 Dec 2020 21:42:57 PST (-0800), tesheng@andestech.com wrote:
> Accesses to user-space memory without calling uaccess routine
> leads to hanging in page fault handler. Like arm64, we let it
> die earlier in page fault handler.
>
> Changes in v3:
> 	-Let no_context() use die_kernel_fault() helper
>
> Changes in v2:
>     -Add a die_kernel_fault() helper
>     -Split one long line code into two
>
> Eric Lin (2):
>   riscv/mm: Introduce a die_kernel_fault() helper function
>   riscv/mm: Prevent kernel module to access user memory without uaccess
>     routines
>
>  arch/riscv/mm/fault.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)

Thanks, these will be on for-next when the merge window ends.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
