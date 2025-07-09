Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8913AC83F17
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 21:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tpt+PEIAiFGmKMTB6dr9ASJXrWKbiF+XEJ4Z8r0W1b0=; b=zJ/u/B3ogOKO/2
	qI/jNjr3f/2N0x/sAGpLKXY3fBcl0fqb9y+bxVM8ZQzDt7i4ovL5Onk/SEaken50A60hhAPQY3VF2
	g5PmB63/USiMIXb/tvnKF821l5hAP9Y8aW0caNmaDctPGqpAdqt3A1FtAzXskgQ0O9TOQ2J5mlRvm
	HkklvTDgkmD/gFRtAe0dxw3n201i8gGx28ZCibGUQGV9je1P2uJSbPbGJSKJzrbBDMQbPSLrizlx8
	7PE8Em0LdErLLoJYteqF+iq71LRZ+LxGBmViTkD/sawWIe+Vo4APrv2S+cPJKZdAWYwHFfgpVJEGX
	a/aZ6XmxVnBm3BOSn6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcog-00000009yJT-3vJJ;
	Wed, 09 Jul 2025 21:59:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZZf5-00000009ZA7-3pMs
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 18:36:57 +0000
Date: Wed, 9 Jul 2025 20:36:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752086214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YA0RYj+SqjdQ0NF6AXC9+gTGB1RXO4+dpLi7zGFrlOo=;
	b=fA8tmS48Cs0Iabw+qtrI7DLH02e7QBsB5ZaKK0G9KzNK3g0m8ZXzrSv+312x6LUsvu1f9q
	CAt4BGlx5GE5piE9feCWhiZfe4kQ0Fj3lg/Qu+NQ6u9fqGIwmCCVjX2b+NfNZgfY2XgiIQ
	+mNxRuoeYvgCeb0xiUfnKt6x+VlwKVIZxrANgJ2Sw67tbrqccK1MS5BTrOGgPjYzSvr6c1
	de57TcmPrDf/E86/NMartKExuLT+QF24PLgb9Mqhm9hSvnkkAa26p16MyE6FlCdjGBgY+x
	xewrKV3YfT9UkIKH8HOtzTMyWXwvCHxIXMQfZb7jYglrrkBi8Hpe3GYcekW+/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752086214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YA0RYj+SqjdQ0NF6AXC9+gTGB1RXO4+dpLi7zGFrlOo=;
	b=W+lySQyn8xxB3c14eOgOInlvGBZ0F3HR2dUZ1bGMw//bq2zUmU4JFCfVc27S0ad1/dJI2b
	F5ypJLDtYDXVexAg==
From: Nam Cao <namcao@linutronix.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 00/12] RV: Linear temporal logic monitors for RT
 application
Message-ID: <20250709183652.Vjv2xgMx@linutronix.de>
References: <cover.1752082806.git.namcao@linutronix.de>
 <20250709140245.555f5fd6@batman.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250709140245.555f5fd6@batman.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_113656_085781_4D51D14C 
X-CRM114-Status: UNSURE (   7.44  )
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

On Wed, Jul 09, 2025 at 02:02:45PM -0400, Steven Rostedt wrote:
> On Wed,  9 Jul 2025 19:56:17 +0200
> Nam Cao <namcao@linutronix.de> wrote:
> 
> > v11->v12 https://lore.kernel.org/linux-trace-kernel/cover.1751634289.git.namcao@linutronix.de
> >   - drop the applied patches
> >   - fixup build failure when CONFIG_PRINTK=n
> 
> Bah, I didn't see this. I was actually testing this series, but the
> tests are having issues.

Sorry, I also didn't see this build error before :(

> Anyway, I'll apply these instead and restart the tests.

Thanks!

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
