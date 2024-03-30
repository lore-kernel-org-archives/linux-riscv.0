Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EA6CD1288
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2024 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDsnkv8Yi2PKLEz6kJKvdf1rM3u9Q6NPTzSFYZL841Q=; b=dJE2M5DMl2I/95
	/H/zG3K+sxC17afObqvGJDKFOF6wbaiW4oX0hxt6lEUaydesH0oIyIpohZvv5B4PQi1u0GOeyZJYT
	zOOjmpE7jgtHHo0sBpWKp7IPMK5qfCMAENzW9aaLKiZh14bkUTU/be+LAmldbG9ptz++FxbHf5YVq
	V8QUs5UiPf3F/9IK+mg5U3uzaTFJKlu/y3LlrTzAL6dTq3lJvvre9f0+OV1o6OJ1c5ZCzs8ax0PJK
	XPbndiydDD/Un5Q9GjXKCdL9a7J3xSbNRpq/FZ/Qn5HlD2ZRs4bBrwNLXe80UB7+Ssw4ap+uTMAmM
	81C+DfzLa1teSSW+eGeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqXog-00000003TFW-06Wu;
	Sat, 30 Mar 2024 12:28:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqXob-00000003TDm-3QJe;
	Sat, 30 Mar 2024 12:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1642ECE0A2A;
	Sat, 30 Mar 2024 12:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0898C433F1;
	Sat, 30 Mar 2024 12:27:56 +0000 (UTC)
Date: Sat, 30 Mar 2024 08:27:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>, Alexei
 Starovoitov <alexei.starovoitov@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "David S.
 Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet
 <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 linux-trace-kernel@vger.kernel.org, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add
 support to record and check the accessed args
Message-ID: <20240330082755.1cbeb8c6@rorschach.local.home>
In-Reply-To: <CAEf4BzYgzOti+Hfdn3SUCjuofGedXRSGApVDD+K2TdG6oNE-pw@mail.gmail.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
	<20240311093526.1010158-2-dongmenglong.8@bytedance.com>
	<CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
	<CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
	<CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
	<CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
	<CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
	<CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
	<CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
	<CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
	<CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
	<20240328111330.194dcbe5@gandalf.local.home>
	<CAEf4BzYgzOti+Hfdn3SUCjuofGedXRSGApVDD+K2TdG6oNE-pw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_052806_041665_26EE04D6 
X-CRM114-Status: GOOD (  11.64  )
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

On Fri, 29 Mar 2024 16:28:33 -0700
Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:

> I thought I'll just ask instead of digging through code, sorry for
> being lazy :) Is there any way to pass pt_regs/ftrace_regs captured
> before function execution to a return probe (fexit/kretprobe)? I.e.,
> how hard is it to pass input function arguments to a kretprobe? That's
> the biggest advantage of fexit over kretprobe, and if we can make
> these original pt_regs/ftrace_regs available to kretprobe, then
> multi-kretprobe will effectively be this multi-fexit.

This should be possible with the updates that Masami is doing with the
fgraph code.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
