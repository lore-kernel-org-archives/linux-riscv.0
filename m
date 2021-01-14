Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD43C433E6
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:17:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C6A238E7
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5C6A238E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=xuEA2FJFAIWXN7ZKgxd8M6q4s9e6ZBKXIVEP/hnTggo=; b=p9PO0KteBnz/IxZEtcy0ItzG7
	XRR4vmYvOXScGiyaJFJFGc+1vvdFpfxtbM/GOuKLNpkJ2F6M+4AS8IkKc1jAX1mXGYuzQsN4Bl72Z
	G7ip0xGmEtG4beToWHB+d5Bkm2+5I/OiMMvFfjBquO7z5mMXgvPTvgPSeQroktJSr4qeeOdP+xhWr
	vPq+dnTOQLljGY64tAA6qynkDYyKeGjOuUxkWAq8NvAfiAihPbxCcLG7sKOaSt0ArratJBKlxJDEz
	iRuYxEA4wDaqr7HAUh36579ZL12wmhkm5MN79OxGBNDMfEbf9WFGeKxJrHN0fYLfk33hgRmSs8h8r
	doL+CF1KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzv0Z-0003UP-OD; Thu, 14 Jan 2021 05:17:19 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzv0X-0003U2-Sp
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 05:17:18 +0000
Received: by mail-pg1-x52b.google.com with SMTP id i7so2986058pgc.8
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 21:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MyWZDv+ecMX1dThN4riMBwplvQMF5YnQ2EO6OXEySwo=;
 b=XVQ2VnN+DxPAf7X8dIbSCKBElySEv7VDgbM6jxUwnFnd2AokzS3GK2VugRW0OvSxSv
 /P4n8xzHfcdc2RFQjexh0QGMEAm9NsOx7pTREQeHXY/ziw9hLCdngoj0/V+VAQ867RoI
 DzWSlP3M9LVwbd1bLXe+bVen0s/dphWKNK7qS2MhFhuEDZkNYoUMmhwOV/fbsuxs6nVA
 uULGkntlyNYHYvuufRq4YrAoUaYqt1HkxbUlPHqIlYHezVfIYiTVU8TpR0BAxiPKvw9r
 5cmjiHXt1TPeLNP1G/FEvGZa2gvuWFTs9icb2smQArIJyWGFeVeMBhd6nkfotTD6RgVL
 7qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MyWZDv+ecMX1dThN4riMBwplvQMF5YnQ2EO6OXEySwo=;
 b=ekfwCNZq7KRxgbgMiLvvFe4tKKXFbD6aRSdmdmDwlpdTadQX1xdsXbvPzUmAjPKCoo
 GnPqjLAo1ERiVokhn5nli2gkvtylLOX7L0r38s8TEuh+HSKs/juAngVU0vCqOurQN3G5
 IkO/BGNMwvmYtJEHcCST+XSley9HN9RImRxlggq87fEXSoc1zmd7oU/O/oP3Cv6tHXab
 ia+LoMYf2qMS/Qe44WSHPhRUDmpGKWA9Schy0yWzXg8F0IsERhEJqrs09Gdgz3oUzqYK
 5memnR516QIZbBGsp0NhgpWQ2ElSkhvscxKqFdAxr3jpjSwkasOz9q+zG+SpRak2opRn
 KwLg==
X-Gm-Message-State: AOAM530Hj22OZsIhfIUeOqzUR1e1QK9lNLYHDxNBKI/IBK4cAJhrB7B+
 454/sw10TQjyBWCZvohbNzsEGqRuWGeG9A==
X-Google-Smtp-Source: ABdhPJwe2b6WekvzuW1tMPk77QkkHAj7sMy8C76UEea2sIdLrANjbKAyzgGf0CDm6CfHO49gfqkqKA==
X-Received: by 2002:a63:7503:: with SMTP id q3mr5670595pgc.318.1610601435590; 
 Wed, 13 Jan 2021 21:17:15 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h17sm4010594pfc.119.2021.01.13.21.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 21:17:14 -0800 (PST)
Date: Wed, 13 Jan 2021 21:17:14 -0800 (PST)
X-Google-Original-Date: Wed, 13 Jan 2021 21:16:55 PST (-0800)
Subject: Re: [PATCH RESEND 0/3] riscv: improve the stacktrace report
In-Reply-To: <20210111124014.182957-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-4703f94a-bcba-4e41-a2aa-6e05af5391ed@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_001717_949018_D8991F46 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 wangkefeng.wang@huawei.com, chenhuang5@huawei.com,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 11 Jan 2021 04:40:11 PST (-0800), wangkefeng.wang@huawei.com wrote:
> Make show_regs() to dump the stack to improve riscv crash report,
> and also fix the wrong value when stack unwind if FRAME_POINTER
> enabled.
>
> Chen Huang (1):
>   riscv/stacktrace: Fix stack output without ra on the stack top
>
> Kefeng Wang (2):
>   riscv: Add dump stack in show_regs
>   riscv: Improve __show_regs
>
>  arch/riscv/include/asm/bug.h        |  1 +
>  arch/riscv/include/asm/stacktrace.h |  2 ++
>  arch/riscv/kernel/process.c         | 16 ++++++++++++++--
>  arch/riscv/kernel/stacktrace.c      | 22 +++++++++++++++++-----
>  arch/riscv/kernel/traps.c           |  3 ++-
>  5 files changed, 36 insertions(+), 8 deletions(-)

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
