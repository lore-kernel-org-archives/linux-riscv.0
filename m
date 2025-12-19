Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860A0D78763
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 12:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJ6rOEDB7mlYIDzCQbIXSj+wGVbNy+PJZPQjzk1yG1g=; b=4jwmO1c2CeIBJD
	PEvTUB3N6Ovtwvoj6UIPzs0ZnnaMyr4EvbilQOeZ20Ts4IicwWehH2cZ3uU5Ih2VENGbFZivXyNB8
	it88v5u1yIDWLPsRzLR853LjMySk55SCw11GunMqiSAs+ETO8g3kGgy9lAkQ1f+ZoYPVkw8GlpMce
	aEWvK33SVgsN/1r9BvqC3/E174lLaQAXqhqo8Ro3vIHn1DF4AbT9xX8Fcid5Kr90A7czstJkG4J3X
	qyfA8pIVaqowuihqdmpt9IlAahCBQAcM9cZuRVdad6Acp/dG/fcdpJ23m6wDsGHZVZsNykBnNqyHB
	URdgvou0hKErskbAIOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZaq-0000000AI6e-2NHv;
	Fri, 19 Dec 2025 12:28:24 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZan-0000000AI5z-0fsp
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 12:28:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766147297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qJlRhz4EpTERncBnrOiB8jIiNe7UFsfDD9FRMuJEcU=;
	b=VTyhYmTH2MlImfb3hCc/m8y1Xce3/ZY87nHvHksc4abkjCtPOfv6kClwnR+Q8FU2AV4j7D
	VK3IonRR0TBimdWLYzE/ay22Y9TObAUlkSNxC+fhmKAD90MXUL+JwDz3uzpirfyhWm3q0T
	v1KxDBomw6As7XtXyL0ERwsYfQopkXg=
From: Menglong Dong <menglong.dong@linux.dev>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Menglong Dong <menglong8.dong@gmail.com>, ast@kernel.org,
 rostedt@goodmis.org, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, mhiramat@kernel.org,
 mark.rutland@arm.com, mathieu.desnoyers@efficios.com, jiang.biao@linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf-next v3 3/6] bpf: fix the usage of BPF_TRAMP_F_SKIP_FRAME
Date: Fri, 19 Dec 2025 20:27:37 +0800
Message-ID: <5070743.31r3eYUQgx@7950hx>
In-Reply-To: <875xa2g0m0.fsf@igel.home>
References: <20251118123639.688444-1-dongml2@chinatelecom.cn> <3730454.R56niFO833@7940hx>
 <875xa2g0m0.fsf@igel.home>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_042821_492065_C5C54056 
X-CRM114-Status: UNSURE (   5.99  )
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

On 2025/12/19 19:41, Andreas Schwab wrote:
> On Dez 19 2025, Menglong Dong wrote:
> 
> > BPF_TRAMP_F_ORIG_STACK
> 
> How can that ever be set?

Oops, my bad! It should be BPF_TRAMP_F_CALL_ORIG here. I think
it is some kind of copy-paste mistake. I'll send a fix for it.

Thanks!
Menglong Dong

> 
> 	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
> 		return -ENOTSUPP;
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
