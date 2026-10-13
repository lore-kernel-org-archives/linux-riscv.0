Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F31FCC6B08
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B65o4PdLOFXNv4ZhqWFxdry/0zXKIQLfhzUFfG4Okg0=; b=op8Bt9aEQEqAl5
	/sP+mF03Q//CDqVj3tYgBnNgI3ORzWFJHFYnygsyd5EyHFKav68gkbyunl8bQIfEaR803PK+mhQ24
	UQONwkgCEg+FJqXBnhmIr38Wlwdvyu/e5ya7vxGAXDKblOIcrmK406alGQQmLmwDtsuo1zi08SS69
	1AYx8oEj3Lnt2i7j/GF12sVXKa1DyrLm8YRD4JhmFrhOqNQLN3QguvY3n6+jg7PO4q4qM38udjP5z
	nqAcIexgPezjK6F8lzn5s5teQs9eBbCp32UrgLe4JoZQZedCHzNLAQEFDW2yF5Qm0KUQiQAIqoRzb
	WgsUETLJNuQVn556us8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdiS-0000000D9tD-2G9v;
	Tue, 13 Oct 2026 14:42:56 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdiP-0000000D9rl-1fY1
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 14:42:55 +0000
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 4DECF40D31;
	Tue, 13 Oct 2026 14:42:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 06F0918;
	Tue, 13 Oct 2026 14:42:41 +0000 (UTC)
Date: Tue, 13 Oct 2026 10:42:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Rui Qi" <qirui.001@bytedance.com>
Cc: "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, "Chunyan Zhang"
 <zhangchunyan@iscas.ac.cn>, "Guo Ren" <guoren@kernel.org>, "Jiakai Xu"
 <xujiakai2025@iscas.ac.cn>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-trace-kernel@vger.kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Masami Hiramatsu"
 <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <pjw@kernel.org>, "Song Shuai" <suagrfillet@gmail.com>
Subject: Re: [PATCH 1/2] ftrace: Clarify function graph retp identity
Message-ID: <20261013104241.5b0aa99c@gandalf.local.home>
In-Reply-To: <20260919033726.1361382-2-qirui.001@bytedance.com>
References: <20260919033726.1361382-1-qirui.001@bytedance.com>
	<20260919033726.1361382-2-qirui.001@bytedance.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Stat-Signature: p5xit8ukshspj59ek51dtfti7jox1g5x
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 06F0918
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/QeSNBNV/6H5dKjjhMIcdNqu8bChqKUg8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=mltuhNxTOsPaUjOxKrzrfLEp+rt2GoNa49+Mp4vfRhI=; b=0q/7tzPcSlSbmrx8OyuWlHFfevPxc0X+DStGm+x4p/yCV422QRLw/JEnPpvMFYgH01dB1bThSeWn9Zjm6bjvlAa1TkdWCcLzS9IXkhlJB3wEVs0wsUqAc80KPD/MS2TcTCDJFf4/BfgW2yVaQM9hEIhPpt4/fcPDkGduGUv9P4k=
X-HE-Tag: 1791902561-405228
X-HE-Meta: U2FsdGVkX18eIcc7Z73jyVQ2i3HW7Dg6gCWGyoMpLeogyQEUGJCQT4chYT1g+HGdfnyjHjPv4nDJBAu1Ovm6wFsx+jaKGxjkiOEM5qdemCx8/9hZAsvmLTxU2IhnsDtXQG/W3VU28Rlk26WeZaItFsOefY13cXOtUq9SPgRqsbZKUVhFxMfReoh1Lcw1ov9qqvet94KGjZNPeip9B1W7XsvsONfHFFWBiNt3G/cBmz+5JH8gz9mz0BEfuFSUYN7+0FxB8xjx6NrFsAZY2JAETx36rvoUVG1GGl2wLci0b+z0kXSLeAvMgRUE2WH1MtH9P4j9MouWjHlWrx2tuoCvrOvUhdrpISQuQi0tjw1Nm415tTtGHT4tXNl8JdG0DOCfwOFXKm4GtWQz2+QuLJHT9Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_074253_622978_0C18C6ED 
X-CRM114-Status: UNSURE (   9.33  )
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


Sorry for the way late reply. I stopped being an upstream maintainer while
traveling. I'm just catching up now.

On Sat, 19 Sep 2026 11:37:25 +0800
"Rui Qi" <qirui.001@bytedance.com> wrote:

> ftrace_graph_ret_addr() does not dereference retp. It compares the value
> against the retp saved by function_graph_enter*() to find the matching
> graph return entry.
> 
> Update the documentation to describe retp as a return location identity.
> Most architectures use the stack return address slot, but an architecture
> may use another stable frame identity as long as its graph entry path and
> unwinder use the same value.
> 
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

LGTM, This can go through the RISCV tree.

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
