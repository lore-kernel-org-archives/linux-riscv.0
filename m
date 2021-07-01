Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AAFC11F66
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:59:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 856C7613F8
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 02:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 856C7613F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vvKnHvcTkaucYBcnZer4yDqkSAA+iSl98EUGlkQbOF4=; b=23gSdM63Yjz38UbsRiwUWvmLJL
	bDCVAWL9Y5HEuaRp7FZ7Ntiezyfp7juOtvbawNaFpoWFYuIhVfyL4dxp3srmPo3jmiJS89L/aEZKK
	NaM2U6fkakdd7pToVhgt19MbluIr8sbvDnVBZqaaxPf6kCDHJdLg66yPZGmwFsUDzCNEYQO6ygTc/
	UDZObRPBus7ukLt8StSPCcTolOOu9rNe9WOUA9Di1E3uUrki1IFNjZfuy7t6fXESsDoCAD46XYGKe
	SjH1Jxb0escNY/9/rVAnOEkdYOf/Af2JmydYqQ6KMD8ppszHfpiPVmr3g/IU7x7L2BTGTL9TpMNT4
	+m3vm6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lymv3-00FwtI-KF; Thu, 01 Jul 2021 02:59:13 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lymv1-00FwsJ-4s
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 02:59:12 +0000
Received: by mail-pg1-x531.google.com with SMTP id a2so4795716pgi.6
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 19:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HD7nLLZFahFZKeQRkjIKTsUXoINqr80+ydWGPG7amAY=;
 b=JipM+EK81ndjv8XjmzmAJdM7nmoKLbmYH/ud029YPFjEHHQVbB/Fo5LE4SsvNyIO5b
 gERHOXdwhdz+t4OYKRRGVblLlhzuS2lo8OTBXlqDDB0W3KY1OYKqL2l7xHrFG7ZJZqT1
 2JILMRYYp/3JlubEa9F1YPhupMcEzRTqegorrJ69vvLNZa1nUc73hpMvkdtg6ExOKhMB
 6TW+ug59UI0zGXJIMD+Uwx+OaiPvQJfixASfK6Z6NwsPqS94k0+oxoyeypiZqaB8HbTY
 8u7xBcQnv1L1RfxoZlY5EqoU8jbUVaZcMnqRE676a6M3yTjeHnp4nf5/Y0qYTqURgZLH
 Yzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HD7nLLZFahFZKeQRkjIKTsUXoINqr80+ydWGPG7amAY=;
 b=WZaRQUym/BqK/sbAxv8zdgLrjW65I9WfDSV49j/9w8pQaK/OUlSEpScMInOrFp4Bhu
 Dje9i5VWkb9rAFEDItRCqHsw9v/K3oypGuy/K1sSYtZboJUaUspiQk8+XTLiqTX3QEkk
 C+JDlPUbszqzkFFDlkODxEWynfMAEpuzEABV9az93uWD04po3YEfXvr83P4aep2Dgzyt
 I2XWECE6rHCbhg4x8LriJvxCN8H6S0FxB6rpcIWBqNsINKzYdTaLIX69hPWpkBE3/d77
 jl0sKSoYjp0cKLjdf96lD4JsVjAwo2wHozqqAK5MGzVwKjDwu3pUeGrJpncVEJsDBT2w
 B5tA==
X-Gm-Message-State: AOAM5317amDCw5ZyhXmVBySulcDe7dXlUqBIuYfUUrmOW+4KtORHNjfV
 78BcwNU/1Z+pFi9pNlLo/AiDwg==
X-Google-Smtp-Source: ABdhPJz2BHWOJV3UUYXKeWeaBZ/AB8h/54zHJj9UpIKDhfF3sYh79IHmRjAQOd7jI6yIM/InDUUhmw==
X-Received: by 2002:a63:4c5e:: with SMTP id m30mr37239105pgl.153.1625108350026; 
 Wed, 30 Jun 2021 19:59:10 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k8sm14831808pfa.142.2021.06.30.19.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 19:59:09 -0700 (PDT)
Date: Wed, 30 Jun 2021 19:59:09 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Jun 2021 19:58:58 PDT (-0700)
Subject: Re: [PATCH v5 1/3] riscv: Move kernel mapping outside of linear
 mapping
In-Reply-To: <87czskonsn.fsf@igel.home>
CC: linux@roeck-us.net, alex@ghiti.fr, corbet@lwn.net,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, aryabinin@virtuozzo.com, 
 glider@google.com, dvyukov@google.com, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-99340121-50f8-49ca-ae6e-0f737fc4d736@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_195911_229700_4BE91B5B 
X-CRM114-Status: GOOD (  13.12  )
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

On Thu, 17 Jun 2021 02:14:48 PDT (-0700), schwab@linux-m68k.org wrote:
> On Jun 16 2021, Palmer Dabbelt wrote:
>
>> This seems a long way off from defconfig.  It's entirly possible I'm
>> missing something, but at least CONFIG_SOC_VIRT is jumping out as
>> something that's disabled in the SUSE config but enabled upstream.
>
> None of the SOC configs are really needed, they are just convenience.
> They can even be harmful, if they force a config to y if m is actually
> wanted.  Which is what happens with SOC_VIRT, which forces
> RTC_DRV_GOLDFISH to y.

Ya, in retrospect the SOC configs were really just a bad idea.  I think 
we've talked about removing them before as they break stuff, I just 
haven't gotten around to doing it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
