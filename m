Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C9FCCFA16
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 18:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UttR38/RNTKN7XRuuli+6z2FbomhNR2rPbqLLZjnjrg=; b=2NapFALahr5LsC
	tYy42MFpfJQzjY4e/kPPdHOOqqxou6xlcxfDAZlfpLRtH+GhXbGutzYNd4gMnU6+6aUvZaF1hmoa5
	INhlReqEq7VQpbb2PCJEbUaY431kXUBj2qeWo2J53iOk6lIx83I0wbNW7WOWc7EThug34LkozBgJh
	7M06Be9H8tLrCjis955YF2gq864W6gQ0Xe+F1+M/gpTymCyPSoThmdIu35k6Pu131xjci+ijehhWf
	L9e1f1WGzl3heZmyeFczAYbAESC+BoAXKp8VM4xMRneN+86UcU9KZYy9aFnIaijf66GdnR+ssfrw1
	U2PfM9l0qB8fhoDPunXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svLUY-00000000Z9o-39KV;
	Mon, 30 Sep 2024 18:51:30 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svLSZ-00000000YpI-0Fyc
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 18:49:31 +0000
Date: Mon, 30 Sep 2024 20:49:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727722163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c7AAxiOEhyu5e/1DUPmIOTyp81qWXAG4oUsFN+Oio24=;
	b=yuZwlS3sPoHFJ+2hTFpyde1A+HsoirGLBrEcDPyl5w2Z79zs/lj/I4wYmsEOrihI7HqO6e
	iTw4/17/D4dp/tVNlJXTL0QQI0UIlihWW2IMcgZrksxnjVSRtzyXBMEczJmjIRPvWwdnDW
	6feqpRsjM0pGoOssRJgk8VW/hOWVMsKXWNyoNytvTk6SPI3o+cH8R60aBVYxD6slzznO5C
	1Gk037DVx2lwimsbw4/v9E6k8z8ITNISS0l7fkg1cGc7MaQDoam70HPtVdXRUFxIEQE5Qv
	JwpoEwth6uDYGA2dscz1JbIUHL1jDXbUb9JyBIPCBkgP2o2Y35Q1uxlN4kgRFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727722163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c7AAxiOEhyu5e/1DUPmIOTyp81qWXAG4oUsFN+Oio24=;
	b=VfZ7E+oz3kV51WXN26q0oGFgwD/VUbH98UU2auREQA+xODa1DiNqVufbDKJ8zrzCEp6P9J
	p4wP4PsrpKxyDJBg==
From: Nam Cao <namcao@linutronix.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Fix typo MIMPLID -> MIMPID
Message-ID: <20240930184915.vFs7xT1l@linutronix.de>
References: <20240925142532.31808-1-namcao@linutronix.de>
 <87h6a3fw74.fsf@trenco.lwn.net>
 <20240929153305.m8IHY_7l@linutronix.de>
 <87ldzab8np.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ldzab8np.fsf@trenco.lwn.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_114927_265356_9DF6C800 
X-CRM114-Status: GOOD (  26.11  )
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

On Sun, Sep 29, 2024 at 12:46:02PM -0600, Jonathan Corbet wrote:
> Nam Cao <namcao@linutronix.de> writes:
> 
> > On Wed, Sep 25, 2024 at 12:02:39PM -0600, Jonathan Corbet wrote:
> >> Nam Cao <namcao@linutronix.de> writes:
> >> 
> >> > The macro that is really defined is RISCV_HWPROBE_KEY_MIMPID, not
> >> > RISCV_HWPROBE_KEY_MIMPLID (difference is the 'L').
> >> >
> >> > Also, the riscv privileged specification names the register "mimpid", not
> >> > "mimplid".
> >> >
> >> > Correct these typos.
> >> >
> >> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> >> > ---
> >> > ask me how I found out..
> >> >
> >> >  Documentation/arch/riscv/hwprobe.rst | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> >> > index 85b709257918..fb0affa61eb9 100644
> >> > --- a/Documentation/arch/riscv/hwprobe.rst
> >> > +++ b/Documentation/arch/riscv/hwprobe.rst
> >> > @@ -51,7 +51,7 @@ The following keys are defined:
> >> >  * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
> >> >    defined by the RISC-V privileged architecture specification.
> >> >  
> >> > -* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
> >> > +* :c:macro:`RISCV_HWPROBE_KEY_MIMPID`: Contains the value of ``mimpid``, as
> >> >    defined by the RISC-V privileged architecture specification.
> >> 
> >> You should be able to just say RISCV_HWPROBE_KEY_MIMPID() without the
> >> :c:macro: markup and have the right thing happen.
> >
> > My .rst knowledge is limited, so I probably miss something obvious, but I
> > couldn't get that to work.
> 
> It's not RST as such, it's an extension that we've added for th ekernel
> build. 
> 
> > Do you mean something like below? The brackets do not seem to do anything
> > and get treated as plain text.
> >
> > Sorry but you probably need to show me what to do exactly :(
> >
> > Best regards,
> > Nam
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> > index 85b709257918..4b4b4ef0e0f9 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -51,7 +51,7 @@ The following keys are defined:
> >  * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
> >    defined by the RISC-V privileged architecture specification.
> >  
> > -* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
> > +* `RISCV_HWPROBE_KEY_MIMPID()`: Contains the value of ``mimpid``, as
> >    defined by the RISC-V privileged architecture specification.
> 
> Try it without the `backquotes`.

Also doesn't work :(

I digged around a bit, and I think for the thing you mentioned to work,
parse_headers.pl needs to be use on the header file (hwprobe.h in this
case), right? And only Documentation/userspace-api/media/ supports that
script at the moment.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
