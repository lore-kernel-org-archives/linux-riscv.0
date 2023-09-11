Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C26EE7FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJpebsuxfKzWMaMSkIoq8s4k4weYg+hudx2e8DXxvUo=; b=PH0L+1uUO76OGH
	2Y3/2/pGyrZwsaHGUyDWNu6IGDZzj3/pDQqrAAf+gAV0r4qGHJAbZusGlJUAfhhnNht2I51MOwW7j
	CR6k0XCRzTnNNe4H5WoVU5mNpiT426aZ00yXCwhtCDMv2hudUYiAO8wBXZBAMXqYiLo2GtWgtnP43
	KsXKNdm0jgcD9q6koHH0npsSOBQtR8mRkrtPrTjz/USCOZ6SwN/kDjfqGjFGx6rE9jlVH8AKFonSC
	UWYVJILSzq+FRIy9jsPudVtJhHjv7l7Y4KW516zdZNyHFiac2K2qFYo6LGu5Adt0EsvF+bcyi/0Qo
	aDBvMnZy7AVszN2WfIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfik9-000rph-1l;
	Mon, 11 Sep 2023 15:22:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfik6-000rp0-3D
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 15:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694445745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m6+UTvfQcsvDPdhGXSi2AAvjsiLi7Cpcaa64YOiSPW8=;
	b=ZSn02oZqfCrXtbm5EJ1KsZV+OVYS6tiewgF/BTV11oDKNEmxiBfCOllFMg5TlqsvBF3mJK
	9ZCoL1P+CaFgIv9XJSkQHjFnifsV4x3gOHwjtmC9tPTskPcy+qSPujyh61uLFFztGN0ACO
	qDMuCE0Sg4sKI9PBq7M2ioJhVFlcpIg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-lqKOgAgdOfK27hptzaDxOw-1; Mon, 11 Sep 2023 11:22:20 -0400
X-MC-Unique: lqKOgAgdOfK27hptzaDxOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79C873C1ACE8;
	Mon, 11 Sep 2023 15:22:18 +0000 (UTC)
Received: from [10.22.32.237] (unknown [10.22.32.237])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CB4040C200B;
	Mon, 11 Sep 2023 15:22:16 +0000 (UTC)
Message-ID: <11f2a7a5-5219-a46e-5d16-4bdd400f5d9b@redhat.com>
Date: Mon, 11 Sep 2023 11:22:16 -0400
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_082227_111748_09ECF2DA 
X-CRM114-Status: GOOD (  16.71  )
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

Your patch series is still based on top of numa-aware qspinlock patchset 
which isn't upstream yet. Please rebase it without that as that will 
cause merge conflict during upstream merge.

Cheers,
Longman


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
