Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56266CE7B02
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P8fSo6c1S5Wqq9inXAYOCaXQU1EZwtUOG5CUgXd9yJk=; b=TGJhCzj4NljsOo
	En2vZbQtnyRJuJnAMJSsleB8kJTv5ys4onCxFUP0WZ79kXFL5LTWvbfFRBYdMexU3aEIMFlc0tgUV
	QEfKhej4aUFnTvDEbw24Kl0JwrkLb5W0wd7J5/mE5ovh1NysA6kSZPrWahpwZodXp/KHeQaRhRNg7
	VqZZWlm78TqoKOq4uJ+vApF9nDsGd2ONiHvDERXe6DSmePNGUfIwpxd1x4lXBkpPHFoDJSEK5rUWj
	awWTVV3bMTRCfEaVMh1Swt3/cVc7PKkmIhtey6UOnSvTQ7DpcwnEkPoHr3DOMgzMtpn7ZmQHNAFSQ
	Is2mZV7O+wQ7ax9LxnzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smXBX-0000000BzbC-3Ipg;
	Fri, 06 Sep 2024 11:31:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWzM-0000000BwHh-0bbd;
	Fri, 06 Sep 2024 11:19:02 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725621527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HEP2lp2UMK+97IqGCmgYal4fO7wnNYZc3qCTmzndaog=;
	b=cPERfHJ4Tj2syRS4X5vjMKijkIyRTwEw9huXhX9ScPLCS0xD+UUfqUaFqNU7HN81DP+lms
	FCbf+Om+VF0i75oYNFOg/X2Mk0PkXhJeNbIshIc7TdWBM29Heg/58FfdaaVNnKbUql8sIF
	5E8xkD3wqFvc2OGbJCzCQFEZVUNjlfs7Qq08SQ3RvXsjRsRh29ajYXz00ETMQcW/L6HZ1p
	715/QF7D7Qy9nUF6DcbeU1cXpBBgeSo3O9OcZy/BhYtfZJfhiKWSb7qrJjIR3wtEX+f7/F
	ZYRMv5y+Ai8LOB8AtcG8/sN5Zipm+pA2TIhhhh1Yw/tm4x+VsxopQtkGSCV26Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725621527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HEP2lp2UMK+97IqGCmgYal4fO7wnNYZc3qCTmzndaog=;
	b=1Zo+jdnBuun2+Zt18Bs7uRsHBtWFLpAlPrv1lIh0pP2m77SRND7ZqSK2NhuFslp4lFSirE
	8K5jxNV6h5G6rnAw==
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
	Steven Rostedt <rostedt@goodmis.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 0/3] Allow to enable PREEMPT_RT.
Date: Fri,  6 Sep 2024 12:59:03 +0200
Message-ID: <20240906111841.562402-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_041852_375232_AC40D129 
X-CRM114-Status: UNSURE (   4.93  )
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

The printk bits required for PREEMPT_RT are sitting in linux-next. This
was the last known roadblock for PREEMPT_RT. The RT queue has
additionally the "atomic console" for the 8250 UART which is not yet in
linux-next. This means "legacy console" behaviour as in no printing from
atomic context in emergency cases. The 8250 UART driver is the only one
providing "atomic console" support as of today.

With the printk bits merged, PREEMPT_RT could be enabled on X86, ARM64
and Risc-V. These three architectures merged required changes over the
years leaving me in a position where I have no essential changes in the
queue that would affect them.
ARM and POWERPC have a few essential patches left and I lost track of
MIPS.

Sebastian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
