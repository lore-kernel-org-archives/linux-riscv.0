Return-Path: <SRS0=ZPlh=HX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B09C433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Feb 2021 13:42:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 742A964E92
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Feb 2021 13:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 742A964E92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KkhArguRcVy6gaMEAtoQCUsowcJxZq2fUU48Vl/SmI4=; b=sbP8lL/apODd2d7+YJGchUBRS
	8lqeHJU8YBUsmTmcH278v4z8GC4K+FZhv+NK9xxPayhaFmctBb8JHqIrS8sfS3o2mWY/Q/6JCuP9o
	OkUhSjTFji15dFhSANr3XvDcU86x1WDsHtfCNqhrtW2yoAg4gERi1YQS3BWbCLIRd8Vm8BmNZtncn
	Q5o1nJSvtFIjB96WND0KMiR01DRnQSjTaJQe1zDYLiPBneFI4IYbDGEtFXLn/zjt4Tzqf+/DHKkac
	gK0HDhckE6WoO1Qw6skF0P9e551bNKcAS5/VUm2TJ+dyN4sJqSpr1p/vDgfp6Lt6pTbu/INrLYuPn
	aFcRBVMYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDp09-0001z8-Hy; Sun, 21 Feb 2021 13:42:21 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDp06-0001yR-6q
 for linux-riscv@lists.infradead.org; Sun, 21 Feb 2021 13:42:20 +0000
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C7EE1100002;
 Sun, 21 Feb 2021 13:42:09 +0000 (UTC)
Subject: Re: [PATCH 0/4] Kasan improvements and fixes
To: Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210208193017.30904-1-alex@ghiti.fr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <24d45989-4f4e-281c-3f58-d492f0b582e9@ghiti.fr>
Date: Sun, 21 Feb 2021 08:42:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210208193017.30904-1-alex@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_084218_395437_DAD32228 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Le 2/8/21 =E0 2:30 PM, Alexandre Ghiti a =E9crit=A0:
> This small series contains some improvements for the riscv KASAN code:
> =

> - it brings a better readability of the code (patch 1/2)
> - it fixes oversight regarding page table population which I uncovered
>    while working on my sv48 patchset (patch 3)
> - it helps to have better performance by using hugepages when possible
>    (patch 4)
> =

> Alexandre Ghiti (4):
>    riscv: Improve kasan definitions
>    riscv: Use KASAN_SHADOW_INIT define for kasan memory initialization
>    riscv: Improve kasan population function
>    riscv: Improve kasan population by using hugepages when possible
> =

>   arch/riscv/include/asm/kasan.h |  22 +++++-
>   arch/riscv/mm/kasan_init.c     | 119 ++++++++++++++++++++++++---------
>   2 files changed, 108 insertions(+), 33 deletions(-)
> =


I'm cc-ing linux-arch and linux-mm to get more chance to have reviewers =

on this series.

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
