Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ACBFD8779
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 01:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Si0q9s3GrypQ9SWTb9LnQBLfuRsRlKpXUYWjoNl6mA=; b=x53xcNW/yyXP0o
	sXzevhy7JGvj4TFW8lhIOOG6F9dczprgm5oB5YYicqV46LBlgDvJUod4TPS5KaLqU689Zu5sUfw63
	LyQZKjKM9nWu0dn6M811TICxoxGNWfi01oEf3S6zyc8MjaOi3InTIqh4a6nZ9jrbI+Xf9SnnaEAe3
	2xB7i3WHcbadoq7eLO8YQpuVBrMPuxLaKub7qDCr4f/DVdQCwym47flhdl9M9NHgnlCvY176GAiKo
	DzSa10jz2qa2wkLHr78ePgZcT1J4BmZaAB4paZCD24i/phjeubrrkH9Myl7N/AM/6OS3dbczX8fou
	si+arqdMM55aYpEzL7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2fbg-00000007YXm-2EOg;
	Wed, 18 Mar 2026 01:21:56 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2fbc-00000007YWp-37LH
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 01:21:54 +0000
X-QQ-mid: zesmtpsz6t1773796828t7674c2f5
X-QQ-Originating-IP: XGrnTJCOaFuSy4Yn+uq7yfZ5iBiB1PzfNYs6aC/FxCo=
Received: from = ( [183.48.244.61])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Mar 2026 09:20:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7463833201967995197
EX-QQ-RecipientCnt: 9
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Mime-Version: 1.0
Date: Wed, 18 Mar 2026 09:20:22 +0800
Message-Id: <DH5IHUPU8UCD.3L2AVV6BORNOZ@linux.dev>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317-v7-0-rc1-rv-dis-int-before-restart-v2-1-0ecc85fbb7ff@linux.dev>
In-Reply-To: <20260317-v7-0-rc1-rv-dis-int-before-restart-v2-1-0ecc85fbb7ff@linux.dev>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N4ZILu3POr3O2E6+g98QFYBq9HlF3IYVwAcS36tvnSaEfFvve8Dptwxn
	Z1toS9YfHIrQQsxfT0tf0oosA2qmi8rANW05M2QBcdj4GBcTxtZxPOYW+7DjqciMVeYhFiz
	H3z2vfZMaGuTWklQ/oZzzrmv92ml0tP63vsHM2Cz5GggeW7vdugR2bYoxprWAcRdHzBN+6W
	N2LnArC64BjWVQuGpv30J1IWJbatLUpyK5b2Uqu3oVTHkk/V2C7wJjrpB5fg3b3azP3/iCB
	qdjR6fdd49l/kxN9/u5Kt9mhp03v4Hygq8EmJH1HdbSiK6yKYJR4LXwFKuXLR4qC5FrewMw
	RaEhhwCkrQehZ450l93bwhhK7OA5CGJNec6/ERd5OLLaUAmM7rG7vAKrVZqxxjiyozqHmrX
	Yu4QO1+G4vY25J/31zImEK8viJiy6kJ/6g18V+Ljoadu1GNRs0o60aT/rgecz9Pw0NZx/La
	KCGwmL3oK/9XaVTgvQOybA7x895zCP8stVu8UeJ2Y7m8V2kmhifaXb9yXKuLiWc9ES5TYgx
	hqns4AYVrruPk6r4Wr/RKQNWP8kF/71lkQUBhYfkVn5LJI4JT9gJsmFlY7ey4NLLN0WbJYZ
	JjjvpmBq9/I2qxfUKx/MhJ4wXwYhJfsD9Z8RydDzqvavLYD7V4SpX5kwOTBDzO04ENZ43yT
	v0TAMTsb7/cRhS2AYuVO3bLXsT6KfSUE8lNFy42EsU2HhVLnlvwuxxeQmEQTx0vSf0yoARv
	axrENsIqcetedR0+As/NxaPlmV1c/3dJuuP7EleSR5gS8aU1qNqCICNyGJNDBuycLnlvhqp
	ho3zfh0wRpWI841ZC8x3d8Oi4fbwbUk6VYEBzYgGNqBr5sWrXAfvXPXNVQCjYUp+hM6m+H/
	NR7I6y8iVICORDGA4Z35ik4ovjWlQZqc+OMvIEibifivXmC1tb1BR9RqA24OBBbL6dRbnTl
	2sdt88sjMFdRzvftAaahfU8ufTCZUkHvzMfM06jsj7D+rtRgim0v6iKrWqIEQDEGNqjk7rx
	EHbqEHlkjk7cr2y/U3O7imn6ie2rh0NORKp384/P/ENd7p1y0azwicnB9uLeNLtm5r2aagt
	F/yRe8XOiF9
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_182153_161915_3F715CE6 
X-CRM114-Status: GOOD (  10.95  )
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

On Tue Mar 17, 2026 at 4:48 PM CST, Troy Mitchell wrote:
> Currently, the RISC-V implementation of machine_restart(), machine_halt(),
> and machine_power_off() invokes the kernel teardown chains (e.g.,
> do_kernel_restart()) with local interrupts enabled and other CPUs still
> running.
>
> This implementation fails to provide a deterministic execution environment
> for registered handlers in the restart or power-off notifier chains. These
> chains are intended to be executed in a strict atomic and single-threaded
> context.
>
> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increment
> the preempt_count. If local interrupts remain enabled, the environment
> is not guaranteed to be atomic. This can lead to a context misidentification
> within generic kernel teardown code, causing it to incorrectly enter
> non-atomic paths (such as attempting to acquire sleeping locks), which
> results in fatal "scheduling while atomic" splats or system hangs.
>
> Additionally, stopping other CPUs ensures the primary CPU has exclusive
> access to the hardware state during the final teardown phase, preventing
> unpredictable interference from other active cores.
>
> Align RISC-V with other major architectures by disabling local interrupts
> and stopping other CPUs at the beginning of the shutdown sequences. This
> guarantees the architectural expectations of the kernel's restart and
> power-off handlers are met.
>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
Sry I forgot to add Aurelien's tag [1]

Link: https://lore.kernel.org/all/abEP80FoCn4S4-WG@aurel32.net/ [1]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
