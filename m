Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3DEC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HP9GqHQ1P5s1yWG51l4KGvm6G9h2irTvi5j5io0tn4=; b=pdO44c1XxpWE8o
	ELhy/cg6f76qIrptjFmPLdLThbfvhnyYiJ3Uov7Moe22a9q4OZXS+JXxAL7WIAmDndgyTO83TAj6e
	tkPfe1KGH9/3kQARJi+mUiyclkrzPfP/ELd/DhM9kTeTRxTo1mP8E7dsPo29jbV2sjop1zs6QOqKq
	frRI8KW0954/LELneIzkvR52h18mqvl3U0knB6HIeVzvaotTP3s82uWhE7MNL3TB7QCeZHN053vgO
	xeAC+Rvx9ivS1FDKn4nxrCGzinj+Nsk4C2d8WbSxdwu65DHkITXBY0onAfy5ZiF+jHz38KfWQG8tj
	zeeYPYHU/S8dtdRaxcRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqpG-0051vP-0M;
	Tue, 16 May 2023 09:18:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqpF-0051uR-0f
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 May 2023 09:18:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T4Sl1ooBMpb0KanF1wJIqGZiESG+DyDGWDVl3K8WeZc=; b=thpq6ZmH4G9fdo7dFMIuaCShJn
	vKgsEXcb3N7S96cxM34TNZ0/2ZeXZ+/8JQ+/2rYIVRdvI3/0EAMO3H14GOFLlVQBmFluRR0qCrYtd
	sO9vJz5Ibq0vbeWMngbnNu/YT13I0sIvRpOcrHkDIzsB18UYTCFt7ZC03H2ly1MDx98Y76sbEgkAb
	+badUdO52UmI9I7EB4CdAY3MgGbok5FHWffCtRCGhWICUEeA4njesY3PqrW5UKvhU5b1FQ7Z2MAqK
	a1eW3FfI/q+76vBbtLDD6a8befQtUWBPfkxkUtPTLm9+pTABNLs8p5nxOeE+ruY1IWLV2YKdyrZtC
	vgDNLtaQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pyqp2-0048AC-U4; Tue, 16 May 2023 09:18:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7BE8330008D;
	Tue, 16 May 2023 11:18:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 60A632011856F; Tue, 16 May 2023 11:18:20 +0200 (CEST)
Date: Tue, 16 May 2023 11:18:20 +0200
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
Message-ID: <20230516091820.GB2587705@hirez.programming.kicks-ass.net>
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
> Current implementation calls kprobe related functions before doing
> ftrace recursion check in fprobe_kprobe_handler, which opens door
> to kernel crash due to stack recursion if preempt_count_{add, sub}
> is traceable.

Which preempt_count*() are you referring to? The ones you just made
_notrace in the previous patch?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
