Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DE1C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 19:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vthq1MeefuMcitn7TcoYFsb0F7YLhbXvWAGWZt2YRzA=; b=cPV/vNiDvK1UmG
	IAITf5ogGypBbS8AWKUjfuO3aBD3J86FJQhNKxxPiE2GFwNQo0DhJcYgZBFJBX/XuvEdm4lVDyhMw
	i2RJQdNvAX8VDDPQfAp4p4w+NELQlnL9oNSDIumHL0IpcVvO6H6kHXQuW2dnp+/igQqQqwiMRltk8
	kH9iXm5DF4fG5MTEq/XyG/tEG0cLs6SkQUx132rkk9lSJ2f91IK9da082ZlFaIOL8D86KsSz8VuFZ
	J9G5xeCbnjnFRRolAktRjCWq/PL/1fTY6X7R7/Gej5O38pLrhzcveTQ6uEVB51bw9xHZhFn5FgPqW
	LJfjUbx11/beifc+L3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUXuD-00BTHW-0v;
	Fri, 11 Aug 2023 19:34:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUXuB-00BTGk-07
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 19:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691782478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4ViBLckjSjhNPhrCupJ24JN3joY3lkNEYQ4wLCKCu0=;
	b=OZSFs1B2KzPe5/6CvQvoQuUkYLz+xqd4UgMkMjsljAoidEORbyQ5FyYY26S0QqthZcb9PO
	AJ/h0JACTGS7zZAATiI7jVwWw+fMG9tr7FuB+f4ks+CIe5ETCZlUrXGRCW1jVNfHDbE038
	eYy78BNMoLpcqFDoqoIh6w2Ih5Bhet4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-Rl9t6dKwP9qAeaYIUQeYSA-1; Fri, 11 Aug 2023 15:34:28 -0400
X-MC-Unique: Rl9t6dKwP9qAeaYIUQeYSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3FF685C6F4;
	Fri, 11 Aug 2023 19:34:23 +0000 (UTC)
Received: from [10.22.17.82] (unknown [10.22.17.82])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4ACD11121314;
	Fri, 11 Aug 2023 19:34:20 +0000 (UTC)
Message-ID: <ec070d3b-80fb-b625-cde1-80ead49c6227@redhat.com>
Date: Fri, 11 Aug 2023 15:34:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V10 04/19] riscv: qspinlock: Add basic queued_spinlock
 support
Content-Language: en-US
To: guoren@kernel.org, paul.walmsley@sifive.com, anup@brainfault.org,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 palmer@rivosinc.com, boqun.feng@gmail.com, tglx@linutronix.de,
 paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
 catalin.marinas@arm.com, conor.dooley@microchip.com,
 xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com,
 keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com,
 jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20230802164701.192791-1-guoren@kernel.org>
 <20230802164701.192791-5-guoren@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20230802164701.192791-5-guoren@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_123439_142659_4FDE56DF 
X-CRM114-Status: GOOD (  12.44  )
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


On 8/2/23 12:46, guoren@kernel.org wrote:
> 	\
> diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> new file mode 100644
> index 000000000000..c644a92d4548
> --- /dev/null
> +++ b/arch/riscv/include/asm/spinlock.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __ASM_RISCV_SPINLOCK_H
> +#define __ASM_RISCV_SPINLOCK_H
> +
> +#ifdef CONFIG_QUEUED_SPINLOCKS
> +#define _Q_PENDING_LOOPS	(1 << 9)
> +#endif
> +
> +#ifdef CONFIG_QUEUED_SPINLOCKS

You can merge the two "#ifdef CONFIG_QUEUED_SPINLOCKS" into single one 
to avoid the duplication.

Cheers,
Longman

> +#include <asm/qspinlock.h>
> +#include <asm/qrwlock.h>
> +#else
> +#include <asm-generic/spinlock.h>
> +#endif
> +
> +#endif /* __ASM_RISCV_SPINLOCK_H */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
