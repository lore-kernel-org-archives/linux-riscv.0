Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AF9C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7tOP/lS8qspHepNPZTg3KpA5xyJs1icSaYVQSiwfVM=; b=Oml6PI+E+K/r9h
	hZx0tfxPoxtq1edCpwl53iZKmcwcLpyoA0sS/ui1Tz5H1PNfLqrXXvHPOeCvRAiuoVMRghsrPFFyl
	xk7tOkCzbT00YIECExDa+dIPgzAY2pvhuIKKqnX9YVlvEaGuOb3EJ4fRtI3gK1B2YwHK5TgQahHGZ
	oY/znT3Sofy/kq1fiICyHdi2mF/hwI+4TOrfNLTbsfjHz9j1bIAbS9DWteY93MhomDes59cvZt/5k
	yLrcZwcevImDoLAMlKQ7YAtUoNIo3Rl9KHHe3+g4DTa5wuV9KHGvwLUYhNFOsOnfZQWMt0xxj9v8V
	dRVxTgOos5BbK6TschjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGIJ-009oEn-28;
	Wed, 17 May 2023 12:30:15 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGIG-009oCa-1P
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 12:30:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so1066373a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684326605; x=1686918605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zG7OAtWW1ntr+yw/2O/iG28G8+bEDuvHfZ1bydZEJAA=;
        b=WxpIe5pMxx0VA25leALbaHV7URbrgAZQgUBOO+Dm/oEU4zI7xovBGNR0Fqdj3S0U5D
         +wX/5bbik+VhVwaVqkhO/m/bAJfyUm6S98KhIjZNjJmORqxyH79So3CJNh8nGmLwlmzz
         0gEEtIchHsxOUZ+D/QMa8VshbsujBhVWd+NHfczwXI7dwfKp3Ud2ghErffmsQNPHs3QT
         3SC5awUHHfdaGU5KKUxQh4cPlmsVI8rB9OtER/noYauADAGyKyMVc8GF2mViI2dv+f9X
         nQofY16nsB6wxSSeolmYXUVITJPW4DgOomnU4IAy50pVTuxZt0MURD8TkOrG9H68lWX2
         mDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684326605; x=1686918605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG7OAtWW1ntr+yw/2O/iG28G8+bEDuvHfZ1bydZEJAA=;
        b=iTSU7LGLHdaOOg1G12O/cZMffBMHRETrT0MsirlfggHlOc8kTJJd2h38bXL7+4niuJ
         xK0PsZN7ozyQihVRYi5yjDtT4KV3Xrxpgoa3XcF4I1OOdmBhqfRQFeRI/ciBk21kp0jb
         zry8P976nl2m3DixTr3f1BRrCuBG4loLF1OLnGoM6gMuV6nH7bC9EQqP5oEQX4G7iyG6
         NGpaCN5jjzGn6i64uwYHyeOsQRDab+NSIinvMNwDccr96WLRJSFUiiBjvb6CkGlfKyOF
         Og74UrxVyK1fxVY2dJHSwEiiqdhkiHSQqNxQFQ95RGLenmIrALOA/cy+QhmkTRl5841F
         mbkQ==
X-Gm-Message-State: AC+VfDxczqmz9lQ2M2Zyv5ws17yvelwuq6fr6OQzMlNk3XEWh81FFmrc
	EZ0AndXdPC89ND8+ut22nYQ=
X-Google-Smtp-Source: ACHHUZ5fZJXdzpqMUilN3IDYmrxIKIW+aD2uyjM+ZYcZgxAxMpplHCS3A36ogwRDUcF+oXUh5RDHSA==
X-Received: by 2002:aa7:d1c5:0:b0:510:d075:9e13 with SMTP id g5-20020aa7d1c5000000b00510d0759e13mr1374346edp.22.1684326605340;
        Wed, 17 May 2023 05:30:05 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7db8f000000b0050bc863d32asm9472513edt.27.2023.05.17.05.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 05:30:05 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 17 May 2023 14:30:02 +0200
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Ze Gao <zegao2021@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
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
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Yonghong Song <yhs@fb.com>, Ze Gao <zegao@tencent.com>
Subject: Re: [PATCH v3 2/4] fprobe: make fprobe_kprobe_handler recursion free
Message-ID: <ZGTIyrPXkCiwFPBo@krava>
References: <20230517034510.15639-1-zegao@tencent.com>
 <20230517034510.15639-3-zegao@tencent.com>
 <ZGSwzuM8oHgKaaga@krava>
 <20230517204236.e0f579399e5a69505a4ec7ef@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517204236.e0f579399e5a69505a4ec7ef@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_053012_478439_26DC4CCC 
X-CRM114-Status: GOOD (  28.96  )
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

On Wed, May 17, 2023 at 08:42:36PM +0900, Masami Hiramatsu wrote:
> On Wed, 17 May 2023 12:47:42 +0200
> Jiri Olsa <olsajiri@gmail.com> wrote:
> 
> > On Wed, May 17, 2023 at 11:45:07AM +0800, Ze Gao wrote:
> > > Current implementation calls kprobe related functions before doing
> > > ftrace recursion check in fprobe_kprobe_handler, which opens door
> > > to kernel crash due to stack recursion if preempt_count_{add, sub}
> > > is traceable in kprobe_busy_{begin, end}.
> > > 
> > > Things goes like this without this patch quoted from Steven:
> > > "
> > > fprobe_kprobe_handler() {
> > >    kprobe_busy_begin() {
> > >       preempt_disable() {
> > >          preempt_count_add() {  <-- trace
> > >             fprobe_kprobe_handler() {
> > > 		[ wash, rinse, repeat, CRASH!!! ]
> > > "
> > > 
> > > By refactoring the common part out of fprobe_kprobe_handler and
> > > fprobe_handler and call ftrace recursion detection at the very beginning,
> > > the whole fprobe_kprobe_handler is free from recursion.
> > > 
> > > Signed-off-by: Ze Gao <zegao@tencent.com>
> > > Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > > Link: https://lore.kernel.org/linux-trace-kernel/20230516071830.8190-3-zegao@tencent.com
> > > ---
> > >  kernel/trace/fprobe.c | 59 ++++++++++++++++++++++++++++++++-----------
> > >  1 file changed, 44 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
> > > index 9abb3905bc8e..097c740799ba 100644
> > > --- a/kernel/trace/fprobe.c
> > > +++ b/kernel/trace/fprobe.c
> > > @@ -20,30 +20,22 @@ struct fprobe_rethook_node {
> > >  	char data[];
> > >  };
> > >  
> > > -static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
> > > -			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
> > > +static inline void __fprobe_handler(unsigned long ip, unsigned long
> > > +		parent_ip, struct ftrace_ops *ops, struct ftrace_regs *fregs)
> > >  {
> > >  	struct fprobe_rethook_node *fpr;
> > >  	struct rethook_node *rh = NULL;
> > >  	struct fprobe *fp;
> > >  	void *entry_data = NULL;
> > > -	int bit, ret;
> > > +	int ret;
> > >  
> > 
> > this change uncovered bug for me introduced by [1]
> > 
> > the bpf's kprobe multi uses either fprobe's entry_handler or exit_handler,
> > so the 'ret' value is undefined for return probe path and occasionally we
> > won't setup rethook and miss the return probe
> 
> Oops, I missed to push my fix.
> 
> https://lore.kernel.org/all/168100731160.79534.374827110083836722.stgit@devnote2/
> 
> > 
> > we can either squash this change into your patch or I can make separate
> > patch for that.. but given that [1] is quite recent we could just silently
> > fix that ;-)
> 
> Jiri, I think the above will fix the issue, right?

yes, it's the same fix, great, thanks

jirka

> 
> > 
> > jirka
> > 
> > 
> > [1] 39d954200bf6 fprobe: Skip exit_handler if entry_handler returns !0
> > 
> > ---
> > diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
> > index 9abb3905bc8e..293184227394 100644
> > --- a/kernel/trace/fprobe.c
> > +++ b/kernel/trace/fprobe.c
> > @@ -27,7 +27,7 @@ static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
> >  	struct rethook_node *rh = NULL;
> >  	struct fprobe *fp;
> >  	void *entry_data = NULL;
> > -	int bit, ret;
> > +	int bit, ret = 0;
> >  
> >  	fp = container_of(ops, struct fprobe, ops);
> >  	if (fprobe_disabled(fp))
> > 
> > 
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
