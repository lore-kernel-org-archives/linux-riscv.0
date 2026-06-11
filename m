Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09413CD98CE
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 05:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KmI7CR3t0g55SHNqG4w02bGIS6kwcrZynsmkjhxiR8=; b=urla8hIDf2dnul
	kY7CIn3vvoGOjOMjLVCPKakBffURooKzvenzr6bkP3VUijvx2bxtQMPpbqoAuy/4RTmzDtRkcRESg
	xtko0AqboI8jxcIzpzAD05+sZ3DAymz/vpenXgLUMMl6prLO/fuMCwj+52JTQPzPtJOccTzrSTL0W
	9Ff+Nbfb0iTRSNc2qj6yqJUxuGgr+kbVPdi3TLSMx6aVwT+D5KNuW1ls/qYviMSHrxj9n8F9mBp7Q
	78X0X/xRNj37HF95WvnGiB8rUwTVxcBswYB8YbPFDAgbTFvkwKHRAU+FjYVnpTCnpfREWnVLflpGv
	twFTxntC1HsQrvpTFYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXrO-00000008ion-3NI9;
	Thu, 11 Jun 2026 05:21:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXrM-00000008ioN-18mP;
	Thu, 11 Jun 2026 05:21:45 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781155298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pxZrj3HZL3fhz45xiVff8+rxIRxk0wNsp5NDbhPArlI=;
	b=aQzCTui0vIILvBLiJ6c+wEedWOf1pg+UetUx3mJQd/3OCbhPCyC/7p99cIGbjKgoJbxeMJ
	RvZqYgQwQFmC5CqTD+p42o+nd8/IV56U9kBsGlgsljW4/EmiHlyE08zJwlpzKtucjsQTH2
	rEJEjOzYg4y7RDE+33fQm7bKo99nmPtAfJtfGnHRx8CfIAXiBKPibOszPxJ5R9VMvrAzqv
	cRKzAmPGIbpXjmJYkNqeuRTchJRuKCXXrSf/oOJdgegFvGyzXK6jp82DFjbqWEtEXJ4e+C
	Ed5pEg0YR/GG/tIVoc+km7DO9PUvOfGDB+PARYYG7MGDLtyslxaUlED8pLbDSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781155298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pxZrj3HZL3fhz45xiVff8+rxIRxk0wNsp5NDbhPArlI=;
	b=fHWDIlZdzOiLKfXOL42qehPTjVZemfYb8XJAOT676l7OxGd2A/3JPDZzKUvv/Wqp1V95b2
	AtIF3KGM8zBcLRBw==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Charlie Jenkins via B4 Relay
 <devnull+thecharlesjenkins.gmail.com@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 01/16] riscv: Introduce instruction table generation
In-Reply-To: <aioJ_5SIXdGQg55R@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-1-54b4736a1e77@gmail.com>
 <878q8m1j9y.fsf@yellow.woof> <aioJ_5SIXdGQg55R@blinky>
Date: Thu, 11 Jun 2026 07:21:37 +0200
Message-ID: <87se6tejoe.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_222144_479110_88492435 
X-CRM114-Status: UNSURE (   9.49  )
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> This is a weird one. The Ziclsd extension introduces it for RV32[1]. All
> of the data is generated from the riscv-unified-db and because it is in
> the Ziclsd extension, c.ld is included for 32-bit in the c.ld
> description [2]. 

Oh :( We probably should amend the base spec to mention that.

>> > +        compressed_name=${name##c.*}
>> 	   ^^^^^^^^^^^^^^^
>> 	   this name is misleading
>
> That's fair, I can rename it to be something like "compressed_inst"?

My issue is that "compressed_name" indicates that it holds the
compressed variant of the name. But it actually is empty if the
instruction is compressed, otherwise it is the original instruction name.

I am not sure what is a better name. Perhaps just inline this to the
usage below.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
