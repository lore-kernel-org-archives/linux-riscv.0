Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3092AE6FE2B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 15:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zGJwnjnthopcXXQpwGfqFqFk9FHfqnddNkdpDuuf8Q=; b=1g6bUm9ESPha/J
	J+mLvIzKG63oMcQc30PKFLpmKzoozSm0Dl2BjgYPQtVMpeH0tLJB7intFNHd4iFZ4MrSQY44HVMmJ
	QIl1n5ATQNg1qqMJB9acbWcrBsf2ybZYf6pcsYSf1wovxMeNkSKPHsRnu4Wk+9thpVNmZDlI/vrR+
	mipEaP6UBBmQbA+iTezrGtM1u2snczkD2pkEvZL6TyhEnXvdV8ewCqgosJYFYNLUhI9BWNmRlLzm2
	GwRmtC9QyqJEzdcpEsguHl/+ITG1fyPT4Dgb+qF6HA9U9Zk9REC4cvR9G1he8c3ciX/8cEJHMI6e8
	a5u2Xfx1z0izRQqxqDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smar6-0000000ClXd-3rfd;
	Fri, 06 Sep 2024 15:26:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaeQ-0000000Cigh-3opa;
	Fri, 06 Sep 2024 15:13:34 +0000
Date: Fri, 6 Sep 2024 17:13:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725635609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/D0LcQBjxhJJ1AT5w4YUeZZjy397PwHo7bQDfurXH4c=;
	b=PsmzuHSPPsXBekPPcoob60zTYBqoqXnp6kmaOnMKt4TwqcREqNE6+mpTA+r4u/cXnlHA5E
	oZgW6zAkKY1prDkhkmJ6hWmNwsk8pDem1qIsE1ibbOMHE5Q5GReB0qxaIVpwxnF1DsUJOD
	0hZYo6rMa0C6VzAwYoyQq+m9I24+bjPOYylpbnK7wJ256+IUS1kzOZUnJ4qEa6Vurpczo5
	OeIpl7tggkVXKV1kHGoYQ+xBv9yxCIZYNr2RhanugHWT33r2GV2dtKKUz9n9+w+skZixBi
	hT6XpUyX96yDzN6kereU1WQkJ0kj2Y9c82/lEptC1d/gkWkw5kAh3SOVURdwTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725635609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/D0LcQBjxhJJ1AT5w4YUeZZjy397PwHo7bQDfurXH4c=;
	b=c8xPMN/Fu00bImPX7/GwPpKS8scd2dkJ8KjZbFkePnrWay14CKKulnP8Gz7AvDVmKT5ual
	zWEjfEHm5bHAIECQ==
From: Nam Cao <namcao@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Clark Williams <williams@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 3/3] riscv: Allow to enable PREEMPT_RT.
Message-ID: <20240906151324.tVwX6lFy@linutronix.de>
References: <20240906111841.562402-1-bigeasy@linutronix.de>
 <20240906111841.562402-4-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906111841.562402-4-bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_081331_137884_4E6DCC69 
X-CRM114-Status: UNSURE (   8.22  )
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

On Fri, Sep 06, 2024 at 12:59:06PM +0200, Sebastian Andrzej Siewior wrote:
> It is really time.
> 
> riscv has all the required architecture related changes, that have been
> identified over time, in order to enable PREEMPT_RT. With the recent
> printk changes, the last known road block has been addressed.
> 
> Allow to enable PREEMPT_RT on riscv.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

With the printk patches applied:

Tested-by: Nam Cao <namcao@linutronix.de> # Visionfive 2

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
