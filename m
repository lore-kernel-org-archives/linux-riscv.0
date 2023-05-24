Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE8FC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 20:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3viwJtJaBKgHfMEMYq9mxLGoplwlOxQaEsWsbXpcxg4=; b=SXFJ53KqxBhpzs
	n49P6v6f1nVzClhp1nO1s2cGhaBp+ikzObCwya+GpDQaiBVBtu4yLz7e9KnQ4u10M5OX3nQFdydJ3
	nXQyBm8YCDyYHrQl7dTx+FxaxgAgL0GyOWP4RGTOow6774dSicqC4uqK6f5hROvMATGcbmbZOPksJ
	/px73FJEbcVYhIUR2XeOFX/Z6VX6L5+TdyNQNuIeJ7VCzjYtWF3H/Hi9CnhZN8AKYoEvewTLQDYBT
	Qt/u/81VMjMc8LFPUTPoyhqWKLWr23Fz4DY/0eiezvXZZxRPCzv8kr5N8bkag8r3kjZjlHs7iMpZf
	gi1PY7R6jk+GNZv1hsOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1v0C-00EbR0-0q;
	Wed, 24 May 2023 20:22:32 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1v08-00EbPh-1N
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 20:22:30 +0000
Date: Wed, 24 May 2023 22:22:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1684959744; bh=EZ62Sf3mRrrPLSec0HPbs+OLV5rrKu4uVLhKELY8M5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QjChkd239g3RKukdNJOfd4jriqUOjWg6EsxNpjJouusbCRUq1ohoACpbDzB4CYPJE
	 /b2S1nQ5oF+NE0YA7lESkIYRuHZYf0jazv61JOm7P1ro1uzDo7b+fcjAL3aPLEzrwg
	 1CTfm7DDfvwSbUeJ9IPSeVj1Hns6GkOTyJ5Csi8M=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com
Subject: Re: [PATCH 11/13] tools/nolibc: sys_select: riscv: use
 __NR_pselect6_time64 for rv32
Message-ID: <83339ea6-6653-41fe-af75-e0d51a4fa920@t-8ch.de>
References: <cover.1684949267.git.falcon@tinylab.org>
 <9359ab11b52ef7c1799337f475e1e27c0cb00e3b.1684949268.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9359ab11b52ef7c1799337f475e1e27c0cb00e3b.1684949268.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_132228_624585_C8A86C4E 
X-CRM114-Status: GOOD (  12.80  )
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

On 2023-05-25 01:59:55+0800, Zhangjin Wu wrote:
> rv32 uses the generic include/uapi/asm-generic/unistd.h and it has no
> __NR_pselect6 after kernel commit d4c08b9776b3 ("riscv: Use latest
> system call ABI"), use __NR_pselect6_time64 instead.
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/include/nolibc/sys.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> index c0335a84f880..00c7197dcd50 100644
> --- a/tools/include/nolibc/sys.h
> +++ b/tools/include/nolibc/sys.h
> @@ -1041,8 +1041,13 @@ int sys_select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeva
>  		struct timeval *t;
>  	} arg = { .n = nfds, .r = rfds, .w = wfds, .e = efds, .t = timeout };
>  	return my_syscall1(__NR_select, &arg);
> -#elif defined(__ARCH_WANT_SYS_PSELECT6) && defined(__NR_pselect6)
> +#elif defined(__ARCH_WANT_SYS_PSELECT6) && (defined(__NR_pselect6) || defined(__NR_pselect6_time64))
> +#ifdef __NR_pselect6
>  	struct timespec t;
> +#else
> +	struct timespec64 t;
> +#define __NR_pselect6 __NR_pselect6_time64

Wouldn't this #define leak to the users of nolibc and lead to calls to
pselect6_time64 with the ABI of the __NR_pselect6 if userspace is doing
its own raw syscalls?

> +#endif
>  
>  	if (timeout) {
>  		t.tv_sec  = timeout->tv_sec;
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
