Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98000C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 05:47:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBFFF61401
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 05:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBFFF61401
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=LA/3r8r2+teYtOWnCRpu0ulIOA3tyKyYEjTuBLKeAfk=; b=ixlxl4oeY0dX6ghc6xiqd52W0
	fPzid15FDndc39mepFFQcZ2LhsOC6RRO8gkErNaHnZbihUkVqvqJ4q+jI4F5QEyB9Vc3LQLnYzd1O
	CngVF4TB4mP5fWOEjhlogJS0jyI/9Snuj5hFC1RAfCpIO/rGHBV8bcrgwTgaxQdYsq5CeRUu9T76n
	KP9MZstZ5H4g4n7SfwpIckfvzmsXgFyu9Sqr4NjBLfkLP4J8zyybdJ8jIM5hOCxrUiLN5VHxW4dMo
	t+TtQKICde+jt32mbiQ8hkkLiJprwfu+I6orRaVc/JZXhgGxbFVwvn9+xlgvmfax4AqBRtmu4QPEU
	h6JrLulJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWupw-00Ex3j-2o; Thu, 15 Apr 2021 05:46:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWupt-00Ex3B-8g
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 05:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=odtA6/PSChT0uGFQNTrylzoG32yU7iwO1L8rlXDU+Kg=; b=W3XKcN/LiPXbaNOhQN7VP11iHr
 RT5fZOYt33ppQTdt8zHUWM0vTLw8Q5jw8eTCsA0cX+JesmP8CQurZLQQxMayzmv7gYaQ85orsYQ4W
 jIiW5TB8oSbwlYnwt3rjjOfZ8asHUASlI6x9bK2qeKS6KHw10ct+kgNEQF+NERPXGzeOXm/YAvJ59
 HT96X6ABs+Ay0UcmyHo0dErCc4bI0PDsZy4uQsbUSCAEx1m9Ijb78Pf+5PKY/aidd1S9hFDQ7obA7
 3kJJ2UgFROOs9CEO4eqrAfBQJo3F5rdYYV4b3gZpSOVVqmT5Nm9BGgrncxG33smYhlJvB1r72TUyj
 bLCEXkwQ==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWupq-008Hu3-F2
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 05:46:40 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 kb13-20020a17090ae7cdb02901503d67f0beso848479pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 14 Apr 2021 22:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=odtA6/PSChT0uGFQNTrylzoG32yU7iwO1L8rlXDU+Kg=;
 b=wVat44suuVOOiYBcJdrS4W77UzKRozTS87Zbdly9Fe7wjrxxiaw8MN9zgK5yBbOqGI
 hAUlPf8o2wRZaAiZUKRpqSmw9qSP543AO+x8r5aVZ5xG8F6kMcpJFqhK4/S5GyPTSnSw
 CoGJy7SN60HrFIrj0erSQvRRX/vImpKlIgc+y5TFPa0kjXC+WuYP6p/zYWQ+aspYjCjt
 z0uk0tqbjks/GjmVtTwUh8gyZ6XOCuIEBb0UkE0H1gICsNGIAPdtv82XhmqY733DCuYx
 ByQO00TvBCsatGAzdCQ5JPpgGbADbXCE2mhrHicuGVSOCGCaE0j8AqqFmkDVA362Eqhj
 BHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=odtA6/PSChT0uGFQNTrylzoG32yU7iwO1L8rlXDU+Kg=;
 b=h4j+OMc0gU+3SusA8A5ViaZsYsfhjQgXewUDqDdK8o3q3QyMzYw8ae5EDPRAza+FDo
 CtybeqRvms5yURn77aYwhkdSbhJXgxAueq+cucS9fk5ZMUmpF2BEv33jn9tKM6Lak2CT
 Tb+bLFbOu3tKkbfVDXzbh5gAhrp0i55lzf1bLN70X5GNUb9MYy66Wh4kPKEk3NsxoHIY
 P3VWlRgO6TNhkG+lEgr7dYR4tLqPNjBvOFgkaD92OUC7Kgie7aQydNIOV447WuArXXz4
 xf3xbfzhQIRHUVLtl7XCbS/nf8XwwtQGocQqepSBeySjR9eH8XID+Hvi8MLUwI0gC267
 uM0A==
X-Gm-Message-State: AOAM5306h2QwfML5n0MJsWQA6xbVeWGhOq3PBZL0hRWqnv8Y488rNUOH
 Sh6fzd+5hAcMS0LFw3nxlJ12qrkEOeJF0w==
X-Google-Smtp-Source: ABdhPJzKHnsrQ8HiVMdQ2cja6QFAJ2/GpULn8bWVER7rZ1/afC5lqauqcQkkWfrNoXcy7Q6iVr9YFQ==
X-Received: by 2002:a17:90b:389:: with SMTP id
 ga9mr1921481pjb.195.1618465597193; 
 Wed, 14 Apr 2021 22:46:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e190sm984165pfe.3.2021.04.14.22.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 22:46:36 -0700 (PDT)
Date: Wed, 14 Apr 2021 22:46:36 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Apr 2021 22:46:34 PDT (-0700)
Subject: Re: [PATCH v2 0/2] Fix binfmt_flat loader for RISC-V
In-Reply-To: <BL0PR04MB65148D80C819A7E3B8365242E74D9@BL0PR04MB6514.namprd04.prod.outlook.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jcmvbkbc@gmail.com, gerg@linux-m68k.org, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, viro@zeniv.linux.org.uk
Message-ID: <mhng-61cff5f4-32a0-417d-9a2f-eb6d052cf802@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_224638_598846_CDE2C124 
X-CRM114-Status: GOOD (  20.69  )
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

On Wed, 14 Apr 2021 17:32:10 PDT (-0700), Damien Le Moal wrote:
>> On 2021/04/08 0:49, Damien Le Moal wrote:
>> RISC-V NOMMU flat binaries cannot tolerate a gap between the text and
>> data section as the toolchain fully resolves at compile time the PC
>> relative global pointer (__global_pointer$ value loaded in gp register).
>> Without a relocation entry provided, the flat bin loader cannot fix the
>> value if a gap is introduced and executables fail to run.
>> 
>> This series fixes this problem by allowing an architecture to request
>> the flat loader to suppress the gap between the text and data sections.
>> The first patch fixes binfmt_flat flat_load_file() using the new
>> configuration option CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP. The second
>> patch enables this option for RISCV NOMMU builds.
>> 
>> These patches do not change the binfmt_flat loader behavior for other
>> architectures.
>> 
>> Changes from v1:
>> * Replace FLAT_TEXT_DATA_NO_GAP macro with
>>   CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP config option (patch 1).
>> * Remove the addition of riscv/include/asm/flat.h and set
>>   CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP for RISCV and !MMU
>> 
>> Damien Le Moal (2):
>>   binfmt_flat: allow not offsetting data start
>>   riscv: Disable text-data gap in flat binaries
>> 
>>  arch/riscv/Kconfig |  1 +
>>  fs/Kconfig.binfmt  |  3 +++
>>  fs/binfmt_flat.c   | 21 +++++++++++++++------
>>  3 files changed, 19 insertions(+), 6 deletions(-)
>> 
>
> Ping ?
>
> Any comment on these patches ?
>
> Without them, RISC-V NOMMU user space does not run... I would really like to get
> these in this cycle if possible.

This LGTM, but it's pretty far out of my area of expertise.  I'm happy 
to take them via my tree, but I'd prefer to get an Ack from someone.

Al, get_maintainer suggests you?

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
