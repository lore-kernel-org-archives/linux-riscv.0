Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96C5CF6498
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bY38n6/bsvSF7B/3GkmFsDGVe+UasCY1sJJkCbpT/c=; b=TOLM9WO5lk4ovZ
	Je7ThW+nipY4qhjVmrG8soK1leslSfPIqLZMVM92+sYth9D66LdWcrChA/2X6Vdc0lNNmXGe/KbSN
	+I15lAFs9E0Gev1aDCaoaZowjbgj7KkK6ul8BkGxTStObU6b0jJL7dqNv0TApxSbSISh7yaWv8DP3
	h5NdRfdjcHkiimHcW2BwMxRvIsRf5wYE23J/eKVtoC6diPm4bkvhJ1YvAPDPygw5nGNoFih8JqDVZ
	AfrvuC4/bFR82kYpRoR8hLDJVyI3aN7+LxDfO1rGujNiucupEGf7In+GeFCcVQFgIxsyK/XD6vnO6
	ND7W9FC7LQ7NDpwCwsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suvvE-0000000ExII-13OF;
	Sun, 29 Sep 2024 15:33:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suvv9-0000000ExHT-0C8o
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 15:33:18 +0000
Date: Sun, 29 Sep 2024 17:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727623991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9gsGi8fTdkDcmJzk7dV7d8IvixwZDjA6Zah8Vb/3I30=;
	b=M859z1DefwlRKGAU4Q3SEdJZgXQh3ow+SoL9Fivllc9WBMzZErU+cQFJ97VsvpmBuaZsSf
	IjIqY5lp7/lDseQ5eykOII4yiSyrCKzctUpEzYzXpVM2qhhoMGzN6SSYHjCy2G/TsLGJQ/
	0tNKULx7gdnAPWDae7TERI8clJshFBVTd5G9vmeQfIygFTqfqv+5GGxIr2qgSKXr++MJIa
	NaoxjGN3svxh1UpNbsaMALdZ8xaWRujbQtixUnQpbKAP/TMRrrkLUUNnS/Aufp30+x7R1O
	6MXpY33o/VU8UHjNLtknE7YNC9l/OQ0q/oDAurAzUugJvfwwbwFFpSFH7b5kbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727623991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9gsGi8fTdkDcmJzk7dV7d8IvixwZDjA6Zah8Vb/3I30=;
	b=VOLfd/bQWzYYXYJ82FqiyEZH/lMqD5rWjq63zTJ/aRHrUcHy5MpK/fSJJL03O7tpRiZ/s4
	nHEJm9E3zWx2lNCg==
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
Message-ID: <20240929153305.m8IHY_7l@linutronix.de>
References: <20240925142532.31808-1-namcao@linutronix.de>
 <87h6a3fw74.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6a3fw74.fsf@trenco.lwn.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_083315_253870_AC94BC0E 
X-CRM114-Status: GOOD (  18.68  )
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

On Wed, Sep 25, 2024 at 12:02:39PM -0600, Jonathan Corbet wrote:
> Nam Cao <namcao@linutronix.de> writes:
> 
> > The macro that is really defined is RISCV_HWPROBE_KEY_MIMPID, not
> > RISCV_HWPROBE_KEY_MIMPLID (difference is the 'L').
> >
> > Also, the riscv privileged specification names the register "mimpid", not
> > "mimplid".
> >
> > Correct these typos.
> >
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > ---
> > ask me how I found out..
> >
> >  Documentation/arch/riscv/hwprobe.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> > index 85b709257918..fb0affa61eb9 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -51,7 +51,7 @@ The following keys are defined:
> >  * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
> >    defined by the RISC-V privileged architecture specification.
> >  
> > -* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
> > +* :c:macro:`RISCV_HWPROBE_KEY_MIMPID`: Contains the value of ``mimpid``, as
> >    defined by the RISC-V privileged architecture specification.
> 
> You should be able to just say RISCV_HWPROBE_KEY_MIMPID() without the
> :c:macro: markup and have the right thing happen.

My .rst knowledge is limited, so I probably miss something obvious, but I
couldn't get that to work.

Do you mean something like below? The brackets do not seem to do anything
and get treated as plain text.

Sorry but you probably need to show me what to do exactly :(

Best regards,
Nam

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 85b709257918..4b4b4ef0e0f9 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -51,7 +51,7 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
   defined by the RISC-V privileged architecture specification.
 
-* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
+* `RISCV_HWPROBE_KEY_MIMPID()`: Contains the value of ``mimpid``, as
   defined by the RISC-V privileged architecture specification.
 
 * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
