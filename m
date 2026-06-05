Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3580CD6E75
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 00:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKMWJRqoTnDLnxXYwIpu+nenkAta8MS+/B/G9tgKkdQ=; b=NhPhuUu/JnbpLO
	OBsOAepidpVFiJwdX5B9m8YmVh/BiZSPb3+2ZpsnerpBDiKVUNFUT+q/8hc4vaFQsvr9EeIP9LvWD
	ZoDw5VudaQ62fJi1nJgrdA+a99VWn5vjmhVVYtoCHqoKBjc8aHoKflW2yOObSr3aiX8ail7x8ifYJ
	BxsF6MObGT3co1HMHJuh48MfPnmdC+e6FbMkFZOBmAapLLqJuSnz1y7yk1o2UxzSPR7oXcVyOmdsS
	+67lXhoQvZ2JH55txjEl0pU7t8QpXKXnP++3zOr4gYgibee+JTXL4KslAxzZXg3mXLb6cqrIGiLGm
	/27hGrOClusaWsbjby1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIUv-0000000HSbm-078v;
	Fri, 05 Jun 2026 00:33:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIUt-0000000HSbg-42kf
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 00:33:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C3C342BA5;
	Fri,  5 Jun 2026 00:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838FA1F00898;
	Fri,  5 Jun 2026 00:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780619595;
	bh=6+s6KKycAc/Fz4BlySEdjg1gmHZM9RQ7tU/fSP165RI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=DBpud2Pmz1y58gOVXeNF2uN3wXyqmI5XJQg+hfI9/Psi1QoVBdDDN0VnS/8EhUbez
	 yyorZVIPp/ITDIumR0qvVQoSR4EnXy634/iNf4RyC3ThOCRg4Fanvio2xZVyRtCBCJ
	 iZG+rTfqXt9DcqFufOIEHIn34kkJliQ2k5TS5sxsfs8pMGLooDjEfNqv7kEDlqyriH
	 ZTKHXg7hMn5ezOXwbVW0Q0aesUfsSizeVYHTCECZTzFei+fPj88sHnZ2z8MhFJKX+y
	 ujNA+RbhuxTnhQ3ADmkluOrL+jnsM10towz2olLa+ssXUlcN/Is53MTWedpzQ99/B/
	 hibSVTzsg+QjA==
Date: Thu, 4 Jun 2026 18:33:13 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Rui Qi <qirui.001@bytedance.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] riscv: stacktrace: Use %pB for backtrace
 display
In-Reply-To: <20260603115329.791603-3-qirui.001@bytedance.com>
Message-ID: <4197ee54-6c69-cb72-5966-c60ba321a6fa@kernel.org>
References: <20260603115329.791603-1-qirui.001@bytedance.com> <20260603115329.791603-3-qirui.001@bytedance.com>
MIME-Version: 1.0
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

On Wed, 3 Jun 2026, Rui Qi wrote:

> The print_trace_address callback uses print_ip_sym which formats
> addresses with %pS. This does not adjust the address before symbol
> lookup, so when a noreturn function (e.g. panic, do_exit) is the last
> call in a function, the saved return address can point to the start of
> the next function, and kallsyms resolves it to the wrong symbol.
> 
> The kernel provides %pB (sprint_backtrace) specifically for this
> purpose: it subtracts 1 from the address before symbol lookup, which
> is sufficient to fall back into the calling function range. x86 uses
> %pB in its printk_stack_address for the same reason.
> 
> Replace print_ip_sym with a direct printk using %pB, matching the
> pattern used by x86.
> 
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

The Sashiko review mentions that the x86 backtrace code uses %pS for exact 
instruction pointers coming from registers (show_regs_if_on_stack()), vs. 
%pB for return addresses on the stack (printk_stack_address()):

    https://sashiko.dev/#/patchset/20260603115329.791603-1-qirui.001%40bytedance.com

Do we need to incorporate similar logic?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
