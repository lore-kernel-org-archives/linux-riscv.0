Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F14CD98C6
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 06:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZV5ovBx4ptowCyBImNMC77ndTa2RSv7keho/C/zAV4=; b=3FMf5owQidoeC8
	fkEwsTGggE5Ec0CWTbZ4cTLdyKzyJDkTsGXJ33a9MJL6v5576AbSG07K7XvSqxOIp2Qvs5KV6bkjn
	CdYgbR4K4wFoAZKgwQwdUFSegV65cSGYMr1TQoLEz+Au/mOcuFslZU1pf0UxxvcQenj4bgFHF/hzy
	2kvHKJvme5PoYx323j7M+WUKQI1yX7Ll0dg+Zkxk8d7S8fqNzDPaNdub5VVyt4H5Lx/6jngM2GaEO
	wIBnoScaNi3Zt1c2z8oqqxbFvZ0dIWJ89oYNLTweSlTbrryg/OTobo6oHhIzlIqKINuZGOd5YkmTn
	QiXMp1ZryppNLry1IGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYoR-00000008nmR-3KNc;
	Thu, 11 Jun 2026 06:22:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYoP-00000008nlF-23tJ;
	Thu, 11 Jun 2026 06:22:46 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781158962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCD04A3kDNsbHUnULOtASEJUFl9RiA8on+HC7R/jRyg=;
	b=z9pfJawaBkLSUhDuqX1UedY73W4K0tp7NE1CP5qtt1uFFLlKUwL2EN7HppbMYVud6EWtfy
	npDVpizE5MJvIHhQcrNHGXhOQZke7kNCOAKxc9hCbryOIe81uaHrNE6tbHyBiFOtc6zQrI
	vb7bZf6jYKs47h6j/Ftoie59q0BdsvDKbFYSLV9s+AdGyVGzV4n+JqnXzPt/UBcnlsG9vy
	5RCAQwDo9TBGIP+7WU4gA+gVxieEntO/qSlnnwRTqOkHLU0bgQXSI+/cm7EfHCYQO8HcMI
	Ql3e/CJDXptWreo0mvCeJ5j1UBamm77E3AaYKeLtDqy7T3/ITJVLi/yIRhQNoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781158962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCD04A3kDNsbHUnULOtASEJUFl9RiA8on+HC7R/jRyg=;
	b=KBdiPdwLWY386ytcuhMI3mc2McYCUiAiriNQM+zUkg6uWLlRikL+bLoF6xds8BUWhD8tjQ
	+3JqSJELNBGPXnAg==
To: Charlie Jenkins via B4 Relay
 <devnull+thecharlesjenkins.gmail.com@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 04/16] riscv: kprobes: Use generated instruction headers
In-Reply-To: <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
Date: Thu, 11 Jun 2026 08:22:41 +0200
Message-ID: <87jys5egum.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_232245_671243_BF5B0D5F 
X-CRM114-Status: UNSURE (   3.18  )
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

Charlie Jenkins via B4 Relay
<devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> This was again verified by checking all 32-bit values for each of these
> functions and checking that the two version have the same behavior.

Your checking is missing some cases. branch instructions and c.jr are
broken.

Btw, any chance that check can be added as a new kunit test case? I
wrote the CONFIG_RISCV_KPROBES_KUNIT, but that only tests some values.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
