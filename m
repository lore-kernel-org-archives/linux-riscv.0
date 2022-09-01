Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C38ECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 07:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+w13ikqz+oVaQ4ksDivrrjX3NiN3ux597yMSmjDodE=; b=0KT3ccjw5S/Fvt
	EGbCW/rdUDcSRLFagPGKF7snCaqY4d0K9d1rLdl003xpNjuWUsv2LoYFxouIZPEwu/oEyKgD7zCaa
	HW3owdTVxmFa8fl/V59OvftiZ7rl7jlciwuy5nM+bCNpmT1/spKME3iVNm7B8ZU7Dy9tT9dKZpWDf
	tEgnAsB43q54g7CAHDJlgYQkZCmzbBf+U7d4yb6Smcx2ISkEXa2QxBNPfE77iQu4LIheh3CnMdH7s
	96DhXEzOJKtU8Lw8i63QVWVctWpiljKKfyLys3/kX1fvkm/qwGbOWF5zybPl0i0+/0e3G6fdvlocO
	J1VV+tQLYOAuowB2zmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTeFL-00AAvw-4N; Thu, 01 Sep 2022 07:04:15 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTeFI-00AAu3-Kb; Thu, 01 Sep 2022 07:04:13 +0000
Date: Thu, 1 Sep 2022 09:04:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1662015847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6TS55y82TYJlsjJwC1/zBEVFCDtqxUms69ssI0wGGA=;
	b=3RxOlbonJl5WFm8YJXSc0uAQRFGPk+DSXUCw++ela5eCvo5xJkEVEUbMFxjkRyt19MarwZ
	DNPfLMrc24rrP9cADg9WhtlDUH6D5/PLLhdIz0NBges7lyBseRZRYTfcJvMhwU5BukTgcj
	Qkk+/yYaiT1ncZcPjrLdFt457h+D1Q6GEFoPPsoEmThVEozsGEjuWS+sS3soDzXHd1a43A
	dgejUhFMJAQ3RGqwdu3fieeFS22nB1+g+aMmCins0gGqPEumNbs5hm3ZU3rb4FW6BLdtIK
	rfO0argpb218v1MWsH+roKH4nSfLKhYboE/AEt+Wjj88GouOyYLDeNyhzyd4LQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1662015847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6TS55y82TYJlsjJwC1/zBEVFCDtqxUms69ssI0wGGA=;
	b=0lKMXKwZ85CHlGzucCsfuA1C4+BIzcDZjLS7nOki0RRQQtjslBtagCDNvKZIOeW3XCncam
	fnw0X6HxbUgwxXAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Message-ID: <YxBZZWopVftK/WBk@linutronix.de>
References: <20220831175920.2806-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220831175920.2806-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_000412_857903_0D0E98E9 
X-CRM114-Status: UNSURE (   5.17  )
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

On 2022-09-01 01:59:15 [+0800], Jisheng Zhang wrote:
> I assume patch1, patch2 and patch3 can be reviewed and merged for
> riscv-next, patch4 and patch5 can be reviewed and maintained in rt tree,
> and finally merged once the remaining patches in rt tree are all
> mainlined.

I would say so, yes.

What about JUMP_LABEL support? Do you halt all CPUs while patching the
code?

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
