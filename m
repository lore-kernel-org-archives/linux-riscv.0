Return-Path: <SRS0=W22O=LV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3974C49EA6
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jun 2021 03:44:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D4261A36
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jun 2021 03:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78D4261A36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWhyYhnARpvoau4CiCwRZWGHiAsrtzvJkbiu3v7bLRc=; b=kD98PHxv/yN6Le
	3xb12OdIpc4HmPqplbGpGqSyYA0ZsMhrqHj17RowCm9jj+Jq+ye35PJlWE7ZTB5E2HCXG1sGyZBWb
	DNKsZFiomSw7btrn28cM8JDtwvqXDyJn1kTIbXP9rttiluhJst4JI3bDi2hxCjcs/C3/i7qw7OXTP
	Dh0yOhBZeXmu6kWafRBogG09YxHad201AJj3U8JAfk5opSTWYi0/OWhNzsLxZS46XEHL/2Zn6SkSM
	LIj12XxHScK2ph4SmwRr0c9Vf9L6B6wXCYCke4wZ2kDoztvzBhCyBcbzmyaWaRQgtXhzNzfUXRWe5
	+VwT/gJeaV3vDk7UjPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxLil-0054rv-Qh; Sun, 27 Jun 2021 03:44:35 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxLii-0054rd-UY
 for linux-riscv@lists.infradead.org; Sun, 27 Jun 2021 03:44:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso8043591pjb.4
 for <linux-riscv@lists.infradead.org>; Sat, 26 Jun 2021 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:organization:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VG8S046SmOK6XAcmQMtK1F0n3FEUbqWr84n7cjWYyUU=;
 b=DGNttt4tcvVtIhc0NKCshka7OiKtnQzfOFY2MCTjzPsGwB66pO2UzDbxDn+JNhMyMc
 1V5CHUzaE14aZyEalra0HbRsMxDshQSBAw2+fV+TaVf9G8p/h+N8EDyxZ/iMAZbspD5j
 c7xhLNWQhL4+Af2uK97KQFdXD99UcEmB2k0mtokocyGQJFwU+TX78FMKa5rM15woVr/Q
 Pn3oe3j0lcW8GJ7Ze3r+qVb55Av9VqLw5UC6DJ083UjUBDUydvbV/y7m0VwlZuWWJW73
 7tx3fgLkSUx8Ab/RftQnwQ4bc5bQFlvmYTFFwFXC1zCjs+4zlZUlvr8MiuOb39JbyOO+
 mMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:organization
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VG8S046SmOK6XAcmQMtK1F0n3FEUbqWr84n7cjWYyUU=;
 b=meql8G9FYA9JeaLXgDfFGhKbLHk2Kgnj9qLbidhPHEjrF/Suw+jVxG0sBe464hznUG
 gKr8ccLur7HIdiRXPqMLi1EjDD5/baHHR89ZNrWwkg7CVDJPMtqsfRwaCbm2y3bDtL1w
 /KSsDx+kbczaodOZqSMaI2+x4NZApZrXPO0gw8HGDS73a7L3kNctgUyg5C75LTssXq1Z
 hE+cFod/3C8twd+Jlcn2eNYI5re0y5Yv1n0oV0D6ubV71ij0APtnNAF1upmIx4+ehi1l
 DPHap00BiibU2FD3YKJWFwC5vmwgz5/kaXdSu/VAf/EjachAtPdTEV61xjiG+s2I8lT2
 U9Ag==
X-Gm-Message-State: AOAM530p+2v1s/NGwFsAf8lnY7NS9+/XlmWCPvk5Mo21ArYuZHLENYo3
 XSErFYk/TlKtnEWpV3YqGN840/+EnnSBLA==
X-Google-Smtp-Source: ABdhPJz6Bqdjt7zeRSJlRmj/IOvQDURasPuJJPRLQaGCXZdTrOsayKJyAVXqDsqyQi8dxIBFW8Twjg==
X-Received: by 2002:a17:90b:1102:: with SMTP id
 gi2mr30170290pjb.75.1624765471825; 
 Sat, 26 Jun 2021 20:44:31 -0700 (PDT)
Received: from rata.localnet (fred.taniwha.com. [203.86.204.69])
 by smtp.gmail.com with ESMTPSA id z3sm9808890pfa.67.2021.06.26.20.44.30
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jun 2021 20:44:31 -0700 (PDT)
From: Paul Campbell <taniwha@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: Re: prefetchw()
Date: Sun, 27 Jun 2021 15:44:28 +1200
Message-ID: <2035172.PIDvDuAF1L@rata>
Organization: Moonbase Otago
In-Reply-To: <2623321.7s5MMGUR32@rata>
References: <2623321.7s5MMGUR32@rata>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_204433_053562_BB76485D 
X-CRM114-Status: UNSURE (   8.96  )
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

On Sunday, 27 June 2021 3:31:18 PM NZST Paul Campbell wrote:
> i noticed today that __builtin_prefetch() emits nothing (at least in my gcc)
> 
> i wonder if it makes sense to do this for riscv linux?
> 
> static inline void prefetchw( volatile void  *addr)
> {
>         asm volatile("lb x0, 0(%0)" : : "r" (addr));
> }

I should add that gcc  __builtin_prefetch()  promises not to fault while the 
kernel prefetchw(), from my quick look through the code doesn't seem to depend 
on that (in fact loops get unrolled in places to make sure) 

	Paul



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
