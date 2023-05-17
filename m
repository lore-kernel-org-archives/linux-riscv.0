Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC86C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0e5eMYiyFHfXeUOne8/uYoyKntKMDt6P0YNoYdLi0Ro=; b=mSHD57WpWlmCK+
	TsytjE7boaVNwQ3jgdL2qjub+Vy4Whs9s+OOxypT1QecgqDJedvbqfjfZITsmDEz+/gaTWEELoT0t
	QLyXDqQcOqyM+/FUP2OYa0ckAP4anqyVbMbGDfq3n6jRFuHsgPa79bp/kF1bcQqwW5/uH/15NIVf1
	NG6DcekBwqCvY1FDR1pdBG6XClovoywCJoAwM2KwlM5q4yHShyha2gN0EPr4lJPRbgFB0ywFSZIKJ
	GcDjNOIxcIej+pHmgttnSTlQjrifYxPzcl/UYgtyXhPswoC2/XiwI6hwfAa41hgCAli66D33FVCk0
	9ZV9i6zP4ILbBBvHniMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFYO-009eXg-2Q;
	Wed, 17 May 2023 11:42:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFYL-009eW2-0O
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 11:42:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7660638AE;
	Wed, 17 May 2023 11:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E92BC433EF;
	Wed, 17 May 2023 11:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684323763;
	bh=gZs8PTPaOModQRmxiev/yHAiJdEHjNnngGNAI1ylIV4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b/3r14rFZqH/pXFAXD7yN1fUGpho601/AbF5SCUVKAY7mqrUjDZO7Rixiz4k6K5x0
	 5q09YQPLznIfUq4yn68RWcj3BGQQ3aKnDl3WYcNOGi/KnuoxI1obWx9g6baBPRC8hQ
	 DPJ1pg6mhBVu4bmIqVmp7NVDSQHYU9z1z/L1Pfx5fdDZo10PVer0ENUX2qSrWJey20
	 bTU0BrjRBfbX7dQrwZj50fYI9xjlXnWbSGbHvh+cTmdq+GyPhyKGVzyQf3AwVfmXEH
	 jBoY5OKrX9VIjyXOQUq5bBISYZopB+wmnIcTPubjjaUAbZk92IXmEWbTKZp2qjQ3Zl
	 Ft/OepS5JIE1Q==
Date: Wed, 17 May 2023 20:42:36 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Ze Gao <zegao2021@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens
 <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar
 <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 x86@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Yonghong Song <yhs@fb.com>, Ze Gao <zegao@tencent.com>
Subject: Re: [PATCH v3 2/4] fprobe: make fprobe_kprobe_handler recursion
 free
Message-Id: <20230517204236.e0f579399e5a69505a4ec7ef@kernel.org>
In-Reply-To: <ZGSwzuM8oHgKaaga@krava>
References: <20230517034510.15639-1-zegao@tencent.com>
	<20230517034510.15639-3-zegao@tencent.com>
	<ZGSwzuM8oHgKaaga@krava>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_044245_261498_D1C3BCF0 
X-CRM114-Status: GOOD (  28.94  )
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

On Wed, 17 May 2023 12:47:42 +0200
Jiri Olsa <olsajiri@gmail.com> wrote:

> On Wed, May 17, 2023 at 11:45:07AM +0800, Ze Gao wrote:
> > Current implementation calls kprobe related functions before doing
> > ftrace recursion check in fprobe_kprobe_handler, which opens door
> > to kernel crash due to stack recursion if preempt_count_{add, sub}
> > is traceable in kprobe_busy_{begin, end}.
> > 
> > Things goes like this without this patch quoted from Steven:
> > "
> > fprobe_kprobe_handler() {
> >    kprobe_busy_begin() {
> >       preempt_disable() {
> >          preempt_count_add() {  <-- trace
> >             fprobe_kprobe_handler() {
> > 		[ wash, rinse, repeat, CRASH!!! ]
> > "
> > 
> > By refactoring the common part out of fprobe_kprobe_handler and
> > fprobe_handler and call ftrace recursion detection at the very beginning,
> > the whole fprobe_kprobe_handler is free from recursion.
> > 
> > Signed-off-by: Ze Gao <zegao@tencent.com>
> > Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > Link: https://lore.kernel.org/linux-trace-kernel/20230516071830.8190-3-zegao@tencent.com
> > ---
> >  kernel/trace/fprobe.c | 59 ++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 44 insertions(+), 15 deletions(-)
> > 
> > diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
> > index 9abb3905bc8e..097c740799ba 100644
> > --- a/kernel/trace/fprobe.c
> > +++ b/kernel/trace/fprobe.c
> > @@ -20,30 +20,22 @@ struct fprobe_rethook_node {
> >  	char data[];
> >  };
> >  
> > -static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
> > -			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
> > +static inline void __fprobe_handler(unsigned long ip, unsigned long
> > +		parent_ip, struct ftrace_ops *ops, struct ftrace_regs *fregs)
> >  {
> >  	struct fprobe_rethook_node *fpr;
> >  	struct rethook_node *rh = NULL;
> >  	struct fprobe *fp;
> >  	void *entry_data = NULL;
> > -	int bit, ret;
> > +	int ret;
> >  
> 
> this change uncovered bug for me introduced by [1]
> 
> the bpf's kprobe multi uses either fprobe's entry_handler or exit_handler,
> so the 'ret' value is undefined for return probe path and occasionally we
> won't setup rethook and miss the return probe

Oops, I missed to push my fix.

https://lore.kernel.org/all/168100731160.79534.374827110083836722.stgit@devnote2/

> 
> we can either squash this change into your patch or I can make separate
> patch for that.. but given that [1] is quite recent we could just silently
> fix that ;-)

Jiri, I think the above will fix the issue, right?

> 
> jirka
> 
> 
> [1] 39d954200bf6 fprobe: Skip exit_handler if entry_handler returns !0
> 
> ---
> diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
> index 9abb3905bc8e..293184227394 100644
> --- a/kernel/trace/fprobe.c
> +++ b/kernel/trace/fprobe.c
> @@ -27,7 +27,7 @@ static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
>  	struct rethook_node *rh = NULL;
>  	struct fprobe *fp;
>  	void *entry_data = NULL;
> -	int bit, ret;
> +	int bit, ret = 0;
>  
>  	fp = container_of(ops, struct fprobe, ops);
>  	if (fprobe_disabled(fp))
> 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
