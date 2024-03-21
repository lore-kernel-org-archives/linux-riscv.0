Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A780AC54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fE0qAQpwWrWyCjPTSG6hdmLrdIkWzdJ3pFY7lYzdZN8=; b=OAuViG/qt8D/HR
	gAba8ic3kI/cBU4sojiY21Et+d+OtrpPZrbei4/uxP66Fzu8kKa2SvPdi8WYS/WU36L2u5g9rjALh
	RNT0ZncN6QJ+3/TCt4eRvbsV8kxPU94I9u8lh6UZSuY8DmktsSym8UTtYlTgCxFkPSyEkBIsKH2Ul
	HH6PK5/Zulf+XDKnEsHM7s/Bs9JIpRa+IJQLl5xgxaIcQXpf4tbU36B14rIsZ1ih2CgSOsSJ8eeK8
	lzPKFE9g2YHBde+aNu99D0B/EfXV/aeeQHW46g+Z5yEGkuHeTJgSXkN8dTA4rn10Fo6AXVpqUSFTf
	nBeLmZ9AtsftpUTj/gtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnJhR-00000003LCc-1Eyq;
	Thu, 21 Mar 2024 14:47:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnJhN-00000003L9l-2sMA
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 14:47:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CAF2ECE1381;
	Thu, 21 Mar 2024 14:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E16C43394;
	Thu, 21 Mar 2024 14:47:12 +0000 (UTC)
Date: Thu, 21 Mar 2024 10:49:39 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: "Bj\"orn T\"opel" <bjorn@kernel.org>, Puranjay Mohan
 <puranjay12@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Masami
 Hiramatsu <mhiramat@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Guo Ren <guoren@kernel.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Deepak Gupta <debug@rivosinc.com>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, "Bj\"orn T\"opel" <bjorn@rivosinc.com>,
 Song Shuai <suagrfillet@gmail.com>, Cl'ement L'eger <cleger@rivosinc.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
Message-ID: <20240321104939.60c54560@gandalf.local.home>
In-Reply-To: <ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
References: <20240306165904.108141-1-puranjay12@gmail.com>
	<87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
	<ZfBbxPDd0rz6FN2T@FVFF77S0Q05N>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_074717_972031_C275F2C8 
X-CRM114-Status: GOOD (  12.26  )
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

On Tue, 12 Mar 2024 13:42:28 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> > It would be interesting to see how the per-call performance would
> > improve on x86 with CALL_OPS! ;-)  
> 
> Heh. ;)

But this would require adding -fpatchable-function-entry on x86, which
would increase the size of text, which could possibly have a performance
regression when tracing is disabled.

I'd have no problem if someone were to implement it, but there's a strict
requirement that it does not slow down the system when tracing is disabled.
As tracing is a second class citizen compared to the rest of the kernel.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
