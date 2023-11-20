Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE44C197A0
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WaaM41NmUo0W+DmwnvJqtIEfXpNweZsJCApdZsqsYxI=; b=LQx67qJu/q9UB6
	xOpfs+7SI16U1+8xXap8p9AIdpKIQ7U3W+bj0c4qwVj9U8HDWvg40PZ5DK2Ldxg+E6/e5q1Jp6yfw
	wr4GPDwSwt//DFVOAurjPpaxrnWAGFcV+GTXXGK4KrVVcqYye4gdsmUdCtXwstHFSaVnpPShgHzhP
	FqGvxozAR6BDQkLnaC4/Ytfr0vF/Zu49aR/qDaid124oZu4zlk6j7iClkQrrRoJqGP8EATd1aa8gE
	l/wMSuZBsUKmJSKdabLCy4T3UhEbLfPdfRS/7uPiKUeEQHb529wsnAvc/oW/nx2BwF/8U765CbAn1
	abEyKYEy8TD+FQEAN+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r56gX-00CxWr-0e;
	Mon, 20 Nov 2023 15:59:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r56gV-00CxVY-2o
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Nov 2023 15:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oGHosGSu29j4EnbPxYYEuFvEX0yrbNZzWjtFhlk/JMQ=; b=i9gIV6rVlwloPazJ+Gh33k97ew
	0wPexOGHhjKWYUEwEjw1POG5MXviv3p2Dkvb2qeyXjSmlnnhHgHlBH+E7R8wKUCIzo2/zvmWBMwaJ
	fnXYE9gSYCylpexiN4VQRb9khJeYh02DF7L3xvwuLFQIekfP8h0jfeyN7yOA24TMykQrnAtO1dxjT
	w8fLibW3mVqjCwfQgrygjUGG+Ox1dfH2SY75SrJll27kTkmzlprK0V4r78PEDoQzaXMa8t/reXbqC
	zEO66Gkhz80gnyn6hUOT5Nvx3XJIyrBd1wGclGsUZ3VFpdhb8EaNx3A4tJXn7nb8jf8SBgd0f0YpF
	lkG7cDbw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r56gS-004iwW-P0; Mon, 20 Nov 2023 15:59:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6677D300419; Mon, 20 Nov 2023 16:59:36 +0100 (CET)
Date: Mon, 20 Nov 2023 16:59:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
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
Message-ID: <20231120155936.GY8262@noisy.programming.kicks-ass.net>
References: <20231120144642.591358648@infradead.org>
 <20231120154948.708762225@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231120154948.708762225@infradead.org>
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

On Mon, Nov 20, 2023 at 03:46:44PM +0100, Peter Zijlstra wrote:

> @@ -2935,9 +3009,9 @@ struct bpf_prog *bpf_int_jit_compile(str
>  			jit_data->header = header;
>  			jit_data->rw_header = rw_header;
>  		}
> -		prog->bpf_func = (void *)image;
> +		prog->bpf_func = (void *)image + ctx.prog_offset;
>  		prog->jited = 1;
> -		prog->jited_len = proglen;
> +		prog->jited_len = proglen - ctx.prog_offset; // XXX?
>  	} else {
>  		prog = orig_prog;
>  	}


Note the XXX there, I wasn't sure what the desired semantics of proglen
was. As implemented it is the length from where bpf_func points to the
end, not including the pre-preamble -- as indicated by offset.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
