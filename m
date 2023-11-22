Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147CAC61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDKzTToOyNqv3OAtis9tgH6hzCTc+kQpQ6EGmu7qZNg=; b=YfrCP8FmqYo/YO
	2VAI9J4JipodNOJ0ND5AHPDyciw3i2sWVjjvaDhoCbHIa9yRIexOLy4X2UTkBBGvXadO4GJYpLVCm
	e0xUU8CJjTU7K1BJy7XrsVBD/pnil5aup84d0x0MUsg7FzxbViDZCVtckZASgcCa9RJCqqhVpJgPm
	3I7Nodj+sCXjOUPl17JozZU2h1znZr/3zvPVCy4XKWuE7PFbzFhaJewTmLt00nkwTRVoeUykFpsR6
	Yy0GQk5CMtVA7sDZ9AltLkXz7TrPLJqknbDZL6RuHQXLz4jKjq6bXsAN2a+Xqqw1MLlaVQb5MTnOG
	IL1C9574QtrSW8tJ/jyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mkL-001s2W-1k;
	Wed, 22 Nov 2023 12:54:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mkJ-001s1o-25
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 Nov 2023 12:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/en2W2qMe4bf5PACMrPIed21n2y033al9A4KjOp1ZRc=; b=JSwHG4187m66WrnPv9kNpkVMPD
	Sym152JF+R5/hBZyAAp1AyC10pEMz4aE2ATrtXnvZgiPiiEY+n6BY7nTHkUjGdvSwVIAbR/6F14bG
	KKqHXdBD4fsKMfGMg8t4egIiJYL0jz8rLBq3jU+eAYBLsnfj/QtdR18nj9JrrTNHLaxPhOiuC4opj
	YvVI+0Kf0QTpQyj5sMzQW7DCQWb/qOiWRjYNAuy+W7llU654ad+poP94iEQKDJCEWIV6O6MDrKc8J
	vd49pv1GmXLttKG4qaa5oREul29VepXM2nXtq09A7BxziDTS88Bo18WrGBSLXO1yCwCb9fMHvX0/N
	MoDpoXiw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mk9-00CJRO-2X;
	Wed, 22 Nov 2023 12:54:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 322BF3005AA; Wed, 22 Nov 2023 13:54:13 +0100 (CET)
Date: Wed, 22 Nov 2023 13:54:13 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	davem@davemloft.net, dsahern@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	samitolvanen@google.com, keescook@chromium.org, nathan@kernel.org,
	ndesaulniers@google.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, jpoimboe@kernel.org, joao@overdrivepizza.com,
	mark.rutland@arm.com
Subject: Re: [PATCH 2/2] x86/cfi,bpf: Fix BPF JIT call
Message-ID: <20231122125413.GQ4779@noisy.programming.kicks-ass.net>
References: <20231120144642.591358648@infradead.org>
 <20231120154948.708762225@infradead.org>
 <20231122021817.ggym3biyfeksiplo@macbook-pro-49.dhcp.thefacebook.com>
 <20231122111517.GR8262@noisy.programming.kicks-ass.net>
 <20231122124134.GP4779@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122124134.GP4779@noisy.programming.kicks-ass.net>
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

On Wed, Nov 22, 2023 at 01:41:34PM +0100, Peter Zijlstra wrote:
> +#ifdef CONFIG_FINEIBT
> +	/*
> +	 * When FineIBT, code in the __cfi_foo() symbols can get executed
> +	 * and hence unwinder needs help.
> +	 */
> +	if (cfi_mode != CFI_FINEIBT)
> +		return;
> +
> +	snprintf(fp->aux->ksym_prefix.name, KSYM_NAME_LEN,
> +		 "__cfi_%s", fp->aux->ksym.name);
> +
> +	prog->aux->ksym_prefix.start = (unsigned long) prog->bpf_func - 16;
> +	prog->aux->ksym_prefix.end   = (unsigned long) prog->bpf_func;
> +
> +	bpf_ksym_add(&fp->aux->ksym_prefix);
> +#endif
>  }

s/prog/fp/ makes compiler happier

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
