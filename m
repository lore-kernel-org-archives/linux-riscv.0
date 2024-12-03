Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A92E74AC8
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ym74WY9Fu478VKy/TIb3wjufq/vIYyOXFtq3GGUyQCk=; b=o3kn8gZ0quaoF0
	QghATmXDIiPdeYro96c8cXdGPIMQ2KUPujj0xjdjCgUC/3HuevY+LNRGq5zyxVSjL82RtWSEuHiyI
	owDcxR77eK1ZdrU1CqUYg2s0IqQf87SgHq/I+Xe9oRKANjKewDmv1zLOIGLoXdKdwbPyYX1A4FDsn
	JTchH0udv5IIvCUNOirb0fFWbsgLGtMxJY9OefukPecper9NOjFlGaonUsTD5cRsgIHfWERa1E9q6
	Rq8znqXxxTYatf8TUgN+YRHpYvobcw6ElhRGzJcIV5QBU5XMrTDUa1NiG2e9HETJyRPs2YCgSOtxD
	iTZqRUcWS+5Br79o224w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIXtb-0000000AOx2-2ztA;
	Tue, 03 Dec 2024 18:45:15 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIXtY-0000000AOw8-2KBk
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 18:45:13 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee990ba9d5so2457154a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Dec 2024 10:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733251511; x=1733856311; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DX1q4LbNfnO54nY1P9OjyEL2atntmm2otrVNiRk5aiw=;
        b=uhn0ANTG+VsqyEpAEGS1dOjMjOKn49hZk3peM5OL9FXTHjVmFZq1I1VcwGkLUOqT4b
         8gaVfCMeoKFwlO9pL3HzuZ4qTBrH7WTcvH8MpfLyaNrf4CTHIy6I6kVUrl/EuJcbpOys
         J578Rn/1wAlB0YpsEzCbTOb9d9ZlSFcgCKb8/p+k1hgrUaE4AW6q4cjcZkhe8p/4v+Pr
         8C+PifjM6q8wIeGx6NE6RsdGwhpSSpqkxsjkzyR+O/cXie2oThBwiqkxLhmNj1HS8Fpe
         f9vy2o+79sHrzB9pjz5Kn+7vIaJPfp5XWHEMiLzPL0bawMNh0cbPbrgLwMJ3POnqAfHM
         VFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733251511; x=1733856311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DX1q4LbNfnO54nY1P9OjyEL2atntmm2otrVNiRk5aiw=;
        b=u3EamVzFfF8oWQqvK6RsoJwKXGhpzhEz78fIWGAbY/+tkuYzUPlHjXt77eur3p1hg5
         iamLYK/Kg93lswmsoZrppFnX95WN/5aKlA1QzO77QPwcwLz7WzY3jyzCwS42v/+VYY/C
         E2q3NCOmhjm3pikvTb3dpXoVlikVigA42adrVMS+6pnL/G539UYrp4DUAUd8812FY1sB
         MG0/AzQmRzbVv46GAcS8HSvqQbs3vE01LyICBsXVBd2ZDy0aV8yKNC40/M0ippZS1Gfj
         xDnnVI6KXOunp87Bfn1XXkfYJW/6TIWXbG5SJPMOqlzG9wO+YQLdYVBRs11xcPs+Sp3c
         dyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfeYNJ7z9YiCae0wt2CcCYrs5nLBjaP3THLn1iHUKvFfItOXXk6Q+cyb+VSFOuPEJSQkX/GxXKD1htwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSLKuhWxfWFLrg74OjegkjOwgnRtY5cWyr1rEGXFm/nNysSfMy
	kt7Ow4QR+XXD4noNfL7nQk33GzoBH1DFgYbw5PIUMqgz02XmLNZTsVGKKn39kBg=
X-Gm-Gg: ASbGncsUSgDWJQzC6zeDYGEnmfrbrwfeovUy7iO3UB1iqdWXmeTsw7LPFzTZLhRKPge
	dVB2jbmNm/kp7avUzslw1wu3sRX1T/dlw/q8GSR+R6UW/PN9M5qGq79eIV+hW7RbNoeLi+obO/9
	oNsKPKIQz3ZvLuwRy4FvO/V/8TL2eWxbNWiSAPKQ8hTVEEULknpPb3zffxh0cYNSl3beu7dBENu
	Lbi+W+uoLNYou7ryAdE2UEZvk6zPbpxmLxQxW3yaA1jHA==
X-Google-Smtp-Source: AGHT+IEhsEsYF/DSzp4oikyjn6fRzE2euETCh9znl9SEgHM1n6BH2uIgHofOP2OdcmmDuTYZp1vciQ==
X-Received: by 2002:a17:90b:4b06:b0:2ee:bf84:4fe8 with SMTP id 98e67ed59e1d1-2ef01262060mr4728642a91.30.1733251511178;
        Tue, 03 Dec 2024 10:45:11 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:eb46:d11e:11bc:ffc5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee488af41dsm9151463a91.28.2024.12.03.10.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 10:45:10 -0800 (PST)
Date: Tue, 3 Dec 2024 10:45:06 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Celeste Liu <uwu@coelacanthus.name>, Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrea Bolognani <abologna@redhat.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
	Quan Zhou <zhouquan@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] riscv/ptrace: add new regset to get original a0 register
Message-ID: <Z09RshGMxW3q6JpA@ghost>
References: <20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name>
 <Z06ZAP-_4J4-6aK_@ghost>
 <20241203121948.GA18179@strace.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241203121948.GA18179@strace.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_104512_590817_7237B9F5 
X-CRM114-Status: GOOD (  20.94  )
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

On Tue, Dec 03, 2024 at 02:19:48PM +0200, Dmitry V. Levin wrote:
> On Mon, Dec 02, 2024 at 09:37:04PM -0800, Charlie Jenkins wrote:
> [...]
> > +static void ptrace_test(int opt, int *result)
> > +{
> > +	int status;
> > +	pid_t pid;
> > +	struct user_regs_struct regs;
> > +	struct iovec iov = {
> > +		.iov_base = &regs,
> > +		.iov_len = sizeof(regs),
> > +	};
> > +
> > +	unsigned long orig_a0;
> > +	struct iovec a0_iov = {
> > +		.iov_base = &orig_a0,
> > +		.iov_len = sizeof(orig_a0),
> > +	};
> > +
> > +	pid = fork();
> > +	if (pid == 0) {
> > +		/* Mark oneself being traced */
> > +		long val = ptrace(PTRACE_TRACEME, 0, 0, 0);
> > +		if (val)
> > +			perr_and_exit("failed to request for tracer to trace me: %ld\n", val);
> > +
> > +		kill(getpid(), SIGSTOP);
> > +
> > +		/* Perform exit syscall that will be intercepted */
> > +		exit(A0_OLD);
> > +	}
> > +
> > +	if (pid < 0)
> > +		exit(1);
> > +
> > +	if (waitpid(pid, &status, 0) != pid)
> > +		perr_and_exit("failed to wait for the tracee %d\n", pid);
> > +
> > +	/* Stop at the entry point of the syscall */
> > +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
> > +
> > +	/* Check tracee regs before the syscall */
> > +	if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
> > +		perr_and_exit("failed to get tracee registers\n");
> > +	if (ptrace(PTRACE_GETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> > +		perr_and_exit("failed to get tracee registers\n");
> > +	if (orig_a0 != A0_OLD)
> > +		perr_and_exit("unexpected orig_a0: 0x%lx\n", orig_a0);
> > +
> > +	/* Modify a0/orig_a0 for the syscall */
> > +	switch (opt) {
> > +	case A0_MODIFY:
> > +		regs.a0 = A0_NEW;
> > +		break;
> 
> Did you mean applying the modified user_regs_struct using PTRACE_SETREGSET?
> If yes, then there should be an appropriate PTRACE_SETREGSET NT_PRSTATUS call.
> If no, then regs is ignored, so why would you change it in the first place?
> 

Yes you are correct, there should be another PTRACE_SETREGSET. That was
a mistake in modifying the previous test case for this new patch.

- Charlie

> > +	case ORIG_A0_MODIFY:
> > +		orig_a0 = A0_NEW;
> > +		break;
> > +	}
> > +
> > +	if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> > +		perr_and_exit("failed to set tracee registers\n");
> > +
> > +	/* Resume the tracee */
> > +	ptrace(PTRACE_CONT, pid, 0, 0);
> > +	if (waitpid(pid, &status, 0) != pid)
> > +		perr_and_exit("failed to wait for the tracee\n");
> > +
> > +	*result = WEXITSTATUS(status);
> > +}
> 
> -- 
> ldv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
