Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC0DEE57DF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuGfHFSbIcOvyfckWIbtDYE7UXp/g/wMWowI0N+igAs=; b=sLia6e7ZtUOtU5
	pDh3u61Pi3hOQ/tGiSY31or7u+o6IrD6X+Bbl8EZhoSewWpeFpS/2tyGCCqu2A1TNpxkGWWDLTAzg
	O71e7SbHXUeOzXRwjoxNrthjqKmYCUfp9QoPoTZxso5rC5KGMq9XkA8HQBraOjAEwyQSFyIt+42sY
	muiVcoEdGVsf84f/CiLgDwgCuBSogiIDZYoZoBm5/k99+tGJeBqaVkcDuhzUxQhzMUOR02V5U3E8Q
	ar6s1jN6Kz2ua9gtVU0hvxC20WFKvQsnYxnE7B/zn3mdVcyk999qfVqspL5FHkUtJAyhamXWnuowp
	FY12NDCDJS7YFQuNHKMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfivd-000uUN-1U;
	Mon, 11 Sep 2023 15:34:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiva-000uTP-1s
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 15:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694446457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0hlG5FAGp8RmPoZ3E3s3/+3No0cdG4KvSkd6VNEwic=;
	b=IHhM6Qem/3nEfzc4yLTanbBi3Jb08wowb/QR1r7En9iZNL/lfzuslNyQR+vns4tG5kX/6z
	i1m4laUtBpIVvdC3iQ3rflOnxXBKmQu2X69sV74cKTe4cpVJRX8abOrIP2SeC+hqnm00Eu
	7ZYGfonNtfd3vm8n8tLjxkoNipYSZ2s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-7swe91uhPdmELgDadpzMYA-1; Mon, 11 Sep 2023 11:34:13 -0400
X-MC-Unique: 7swe91uhPdmELgDadpzMYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D615183689B;
	Mon, 11 Sep 2023 15:34:11 +0000 (UTC)
Received: from [10.22.32.237] (unknown [10.22.32.237])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D391140C6EBF;
	Mon, 11 Sep 2023 15:34:09 +0000 (UTC)
Message-ID: <5ba0b8f3-f8f5-3a25-e9b7-f29a1abe654a@redhat.com>
Date: Mon, 11 Sep 2023 11:34:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V11 07/17] riscv: qspinlock: Introduce qspinlock param for
 command line
Content-Language: en-US
To: guoren@kernel.org, paul.walmsley@sifive.com, anup@brainfault.org,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 palmer@rivosinc.com, boqun.feng@gmail.com, tglx@linutronix.de,
 paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
 catalin.marinas@arm.com, conor.dooley@microchip.com,
 xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com,
 keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com,
 jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
 leobras@redhat.com
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-8-guoren@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20230910082911.3378782-8-guoren@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_083418_702720_256B4C27 
X-CRM114-Status: GOOD (  18.20  )
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

On 9/10/23 04:29, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Allow cmdline to force the kernel to use queued_spinlock when
> CONFIG_RISCV_COMBO_SPINLOCKS=y.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   Documentation/admin-guide/kernel-parameters.txt |  2 ++
>   arch/riscv/kernel/setup.c                       | 16 +++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 7dfb540c4f6c..61cacb8dfd0e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4693,6 +4693,8 @@
>   			[KNL] Number of legacy pty's. Overwrites compiled-in
>   			default number.
>   
> +	qspinlock	[RISCV] Force to use qspinlock or auto-detect spinlock.
> +
>   	qspinlock.numa_spinlock_threshold_ns=	[NUMA, PV_OPS]
>   			Set the time threshold in nanoseconds for the
>   			number of intra-node lock hand-offs before the
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index a447cf360a18..0f084f037651 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -270,6 +270,15 @@ static void __init parse_dtb(void)
>   }
>   
>   #ifdef CONFIG_RISCV_COMBO_SPINLOCKS
> +bool enable_qspinlock_key = false;

You can use __ro_after_init qualifier for enable_qspinlock_key. BTW, 
this is not a static key, just a simple flag. So what is the point of 
the _key suffix?

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
