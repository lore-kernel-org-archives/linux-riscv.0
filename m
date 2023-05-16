Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21570C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJtxwweEQ3QsQPP5kIHnQ/TTYPyc342Ghrt67qqQSHE=; b=xs3uUWDOPGAYFC
	ZlSwrk/yTd2D7J8vSrIbZVVMx29K1VPsYLofCciZ2YFqErderNhQ359SOVmg9+yAzswB8pzW5Nlrc
	IVfOAeyRTlYtbg2OlMJ0kTV6mNIH2pd+auNkRfKa68Layfif3mn9xISLM8wiGn0DhS6CqNZY4jzU7
	WVSpJT0wJTtRvkLfHESNp5w0GuwEstqAApGn/pEYJw1qIeRuA5JbeOTPNoOSLdD7sekjbP/vPL66Y
	gzpkHKaaFEamx3GEsaFLx5b4un8Shr9AwrV7/eWsD9DFpxbreP7vb4f61uzzE5dvv2CxTAyV53+Qc
	GMa23gvQrKB4Jf4Bpe8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqmy-0051BA-1X;
	Tue, 16 May 2023 09:16:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqmw-00519x-1M
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 May 2023 09:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OBCPnu+BGgk3Cuo/WyqzF95R9vjNP+oDEXn6EOL1COY=; b=lcr10CU58+Jlc6aMR4VdoWQDzU
	gfmE+pQ0R2xS9GUIF3mYGcJolDhMlwgK+pyi4K47xEFvl8zzXP2LsKocJQRnvsUqEaBGg8DIJFtYe
	tB8AfT8e3/r1pfkeX77oiVWDWfTzLeYwA8mkfMpgo9FqvsEkKFutAaTP4C0iQym+AtcgP+uiP6aA4
	RrlILmh7I5FHd203lw31XCkm+ljoMJb8uZh0ccyaTu42TaOPqNV09hU7GImexwdwEn4r2OQVnMbpm
	paN7hUtaAtOMbUyOkTaWhz64qNT4rzhooZIdDBINYUJbVklaZKGe/IdQZYtFGp2HAMDJTwG/rwt65
	lhhGPQyA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pyqmf-00482M-RS; Tue, 16 May 2023 09:15:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 63E8630008D;
	Tue, 16 May 2023 11:15:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id E722C20118D79; Tue, 16 May 2023 11:15:48 +0200 (CEST)
Date: Tue, 16 May 2023 11:15:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ze Gao <zegao2021@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>,
	Ze Gao <zegao@tencent.com>
Subject: Re: [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion free
Message-ID: <20230516091548.GA2587705@hirez.programming.kicks-ass.net>
References: <20230516071830.8190-1-zegao@tencent.com>
 <20230516071830.8190-3-zegao@tencent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230516071830.8190-3-zegao@tencent.com>
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

On Tue, May 16, 2023 at 03:18:28PM +0800, Ze Gao wrote:

> +static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
> +		struct ftrace_ops *ops, struct ftrace_regs *fregs)
> +{
> +	struct fprobe *fp;
> +	int bit;
> +
> +	fp = container_of(ops, struct fprobe, ops);
> +	if (fprobe_disabled(fp))
> +		return;
> +
> +	/* recursion detection has to go before any traceable function and
> +	 * all functions before this point should be marked as notrace
> +	 */
> +	bit = ftrace_test_recursion_trylock(ip, parent_ip);
> +	if (bit < 0) {
> +		fp->nmissed++;
> +		return;
> +	}
> +	__fprobe_handler(ip, parent_ip, ops, fregs);
>  	ftrace_test_recursion_unlock(bit);
> +
>  }
>  NOKPROBE_SYMBOL(fprobe_handler);
>  
>  static void fprobe_kprobe_handler(unsigned long ip, unsigned long parent_ip,
>  				  struct ftrace_ops *ops, struct ftrace_regs *fregs)
>  {
> -	struct fprobe *fp = container_of(ops, struct fprobe, ops);
> +	struct fprobe *fp;
> +	int bit;
> +
> +	fp = container_of(ops, struct fprobe, ops);
> +	if (fprobe_disabled(fp))
> +		return;
> +
> +	/* recursion detection has to go before any traceable function and
> +	 * all functions called before this point should be marked as notrace
> +	 */
> +	bit = ftrace_test_recursion_trylock(ip, parent_ip);
> +	if (bit < 0) {
> +		fp->nmissed++;
> +		return;
> +	}

Please don't use this comment style; multi line comments go like:

	/*
	 * Multi line comment ...
	 *                    ... is symmetric.
	 */

Same for your next patch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
