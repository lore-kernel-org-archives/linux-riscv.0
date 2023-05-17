Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0371C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 03:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLn/IWmJw1LEgpsw+g7DASMujZTjIHUU2fncDLHeqpk=; b=X9nECp02NUJEGS
	d/F+UrVEaVtzpnsluhPSNoHbkBv/IxWqPDtTaH2dgFcuooHzayCh3EG120HkmancfCmeqtcd7cxUX
	4GQchfd0pJ3fvSAkMEwy3v8k9O4SnTsgp3tBWUM8iV61wwrTwNQ2uXtc5POQ1zFTzj4OZAgl6r5V6
	05hnYQALfW7BAfLjl70jVKy7ESfdcGfP6XQw8KnKcgkOer26Etsu5JycXvrha78D3MPt6hQrWYHgr
	wlFKTF5usLy027fmB7GLFT4Q5LfHtqDm7v4w3mjTUmFueT72h1DfCp7y9CX62bH546OL1g6afPrN5
	GNyLYmKTFQLukKs08VOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz8Cl-0081lW-1H;
	Wed, 17 May 2023 03:51:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz8Ci-0081iO-2l
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 03:51:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A04D63ED8;
	Wed, 17 May 2023 03:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA41C433EF;
	Wed, 17 May 2023 03:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684295511;
	bh=ujQm08tAstsBcSTC4djTVJKYZbnMD4JeakcC0SNda2Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TSkAnW3Tw7IFtikLGLu+GPWBvxuXEM5m65QAoEvCrtsO/iSmOETdJEiAUqaMrleII
	 zeTeMmaEQTm6FpcM/KIk9TO4oKxg96lYeHLh/rTFzJCKCtFjXf8P/ve8+aqQcFw0py
	 ZxJnT7Oyek0HGYBY8ZtQYTSc9qzOPYbYtNts8W2SDG9L0QEeOjsPJDT4KRtBegTYNN
	 IAKH0xnEKfpnt0cSPV5GYah+YvOlSxSSPIY0fYMj2Zs7P7v/pdLWr/zyIvf+reeAGH
	 uJ0yTaME660KgFSlPIjx8QlAJbysaP2KvTzEtkhMRuSYEQxxgZfoOsEuXjtxTJu4iT
	 nu6ZMWm+E+gDA==
Date: Wed, 17 May 2023 12:51:42 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ze Gao <zegao2021@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Alexei Starovoitov
 <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo
 Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, Conor Dooley
 <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song
 <yhs@fb.com>, Ze Gao <zegao@tencent.com>
Subject: Re: [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion
 free
Message-Id: <20230517125142.b5fa0d958ccfa5c309c650af@kernel.org>
In-Reply-To: <20230516232545.4f6c7805@rorschach.local.home>
References: <20230516071830.8190-1-zegao@tencent.com>
	<20230516071830.8190-3-zegao@tencent.com>
	<20230516091820.GB2587705@hirez.programming.kicks-ass.net>
	<CAD8CoPDFp2_+D6nykj6mu_Pr57iN+8jO-kgA_FRrcxD8C7YU+Q@mail.gmail.com>
	<20230517010311.f46db3f78b11cf9d92193527@kernel.org>
	<CAD8CoPAw_nKsm4vUJ_=aSwzLc5zo8D5pY6A7-grXENxpMYz9og@mail.gmail.com>
	<20230517115432.94a65364e53cbd5b40c54e82@kernel.org>
	<CAD8CoPC0BXB2ER_Oaixm5XgMk8TTqKVVF7Po0t4gBPOLhw_xwQ@mail.gmail.com>
	<20230516232545.4f6c7805@rorschach.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_205156_941314_F25FA7BD 
X-CRM114-Status: GOOD (  16.31  )
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

On Tue, 16 May 2023 23:25:45 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 17 May 2023 11:10:21 +0800
> Ze Gao <zegao2021@gmail.com> wrote:
> 
> > Got it! :)
> > 
> > I will improve the commit message and send v3 ASAP.
> > 
> > BTW, which tree should I rebase those patches onto? Is that the
> > for-next branch of
> > git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git. I saw
> > Jiri had troubles
> > applying those since these works are based on v6.4.0.
> > 
> 
> You can submit against 6.4-rc1. We haven't updated the for-next branch
> yet. Which will be rebased off of one of the 6.4 rc's.

Yeah, I would like to pick it to probes/fixes for 6.4 and stable branches.

Thank you,


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
