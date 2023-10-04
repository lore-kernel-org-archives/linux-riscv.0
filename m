Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36871E8FDCB
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 05:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oo45XZMSJ9R3+LAjhOhV7523ZDp1SGTND4urbwjpFUQ=; b=JRVjM5jvYIi28V
	qNcH3t39xa0PBvUfxKIHa6uRetpb+QfikyEgOogmzBYMJX9l6rCrNcVMIBgD5fXqWWaYbj/48EAAo
	hDJt1NxFlRGjKlzs1Q3Tr5rYkfzDJhyNgNnd6kXZm/2Yn+WX78bkkPCyfimZmNan5FnXbDzlJGKcR
	X8DpeXEAYTzuB3ztAVwJxfvWnbN1jViPaB9kQotdAVSjnLMS/oDM7D0Kt6/33C1jNppBXqYlIDq+g
	azfGkzhNQ09E77PRS6I9rtAFi/KMzHscOY1f2ArUDMMr7xDcPaE6I3RZxdFzN64u7AiKU9x+8/lcj
	f6hhstC0YNmPoHL945Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnumx-00GJvi-2w;
	Wed, 04 Oct 2023 05:51:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnumu-00GJvL-2j
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 05:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2B1961454;
	Wed,  4 Oct 2023 05:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC103C433C7;
	Wed,  4 Oct 2023 05:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696398671;
	bh=iCuHgBPuubAVdQm7QbXMcIphSaPSVtN9vw7j0BuXv7Y=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=IQ62F9x+o5F1qpPjc+2LK5/Fg0/iJgbyPXCKKIl99oGB6E3h+13uStR+cNVVZnfXM
	 KdEmOw2g6DSf+N+fDSoaaeneEi6YRUhXYSGrf1PwjCV6n8B7jVxSg0PxZvJioqluyH
	 BYfAxdT2czzbOymGEzK7X7GVk4MVAMaDn+fiCAGqaXRKZUsZhG4SmtKYigFperCNZk
	 oZuL6QEwFMi7MgGNAblLveIwaKbKTgV35pDd+IHV1YfGRKxywaXpA51QkYLPwe+UGm
	 femEYGr4Q/Eek+3iHho1E00g0+7E4UOEeMWbevRE6AZ6lx2tbcEeJWYTlgOvZZ/tks
	 kcJVAHD3D/Ctw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook
 <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Conor
 Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH -fixes] riscv: Fix ftrace syscall handling which are now
 prefixed with __riscv_
In-Reply-To: <CAHVXubgTkoWYEybsbXVbCMO4JaMAChaSq4BgqZZO9ih7OxwUyA@mail.gmail.com>
References: <20231003182407.32198-1-alexghiti@rivosinc.com>
 <CAHVXubgTkoWYEybsbXVbCMO4JaMAChaSq4BgqZZO9ih7OxwUyA@mail.gmail.com>
Date: Wed, 04 Oct 2023 07:51:08 +0200
Message-ID: <87v8bn3pgz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_225112_948397_E6F9EE6B 
X-CRM114-Status: UNSURE (   4.43  )
X-CRM114-Notice: Please train this message.
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

Alexandre Ghiti <alexghiti@rivosinc.com> writes:

> @Conor Dooley This fails checkpatch but the documentation here states
> that this is how to do:
> https://elixir.bootlin.com/linux/latest/source/Documentation/trace/ftrace-design.rst#L246

FWIW, I'll relax the PW CI checkpatch test going forward. It's way too
strict...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
