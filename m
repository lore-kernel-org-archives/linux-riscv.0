Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0959C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hd5kXurFh307kBSsfAGGlM/GBvyjOyGyP6xWLeOvmc=; b=z5wv91HPGZJHOO
	T9rSQF2SkZHYmjHFiAi8TNdUm5P2omeBmVKTPl4qCtgdqpgCbLKJMt/5xL/PgruvTfPgDbBwDTiPO
	4p9dcYMbKRavUyjnoGJSvgpOdWz9wooekcONun55ZpR7gu8T/OKKbmHy0YW7RCvPicgs6UXBilogS
	q+qRTl3lC3aAZ11oxUjLiVUs3YErBnHQ1/Kb/mgWK1dEUI7GKwdENK9mKiOEwstSAa1IzVsRprnE+
	HGMRGFE2QPpBZtuz1AS70E3kEn/shnBb2iiKOCQVSjrPTnOBo3OVP8EoRZaHG9CCd6VYhaEwfN4i9
	yhD/zZAF45IgYNjf2oEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qypTX-00Ayak-0i;
	Fri, 03 Nov 2023 08:24:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qypTS-00AyaF-1C
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 08:24:18 +0000
Date: Fri, 3 Nov 2023 09:24:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698999852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KLYp/YjUyNDhjZTCYnhpNaQBgYYzsOafrESIpFIhprk=;
	b=SQDMjvZkfu2VDSApg810j2hNg84zGOnRjxsZSWgYjmFGBfGAe0g4y9ts3zGH0iuwX9zvI6
	ERad0qyGPF+LOsTpnYC+n3QySQsqbY0tT3yXjlsXm+u5ByJTB6BLMhZQTHIZvqvI9dVbi4
	Ca/vZNEHrLYIhqRrZtpFgkSoQBAKCa3JUUWiGAv+FZBEWtupXMkXmI/dOydFlz7EweFOiW
	oQByov2qsu/1KZEMGcPJ3buZNtVDT3llqL0FqwOPK7deYrUW89YPLRD5omLfWZ8k1p0C8K
	U1ZipmSqUiiAYTkls/GSB5Ev0ODdFX5kJHHuwYlOGoGe2AL2n9zqQhxmr4hWSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698999852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KLYp/YjUyNDhjZTCYnhpNaQBgYYzsOafrESIpFIhprk=;
	b=frCSluB9u3q9wyWJjleru+7disehc3Dg6ANXy3F123Lv8guXKoZFiHrweycSkwQMoy55lS
	nx0dD0Q9tZ+pWCBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231103082411.f_ZU1E7V@linutronix.de>
References: <20231031143521.441-1-jszhang@kernel.org>
 <20231031153242.k9tLdSby@linutronix.de>
 <ZUEiCUxcd11inlRP@xhacker>
 <20231031164411.9YRGasL-@linutronix.de>
 <ZUI5h6eIhTlPAmGh@xhacker>
 <20231102-spearman-overcrowd-a86bfb958609@wendy>
 <20231102155423.SyuAibSe@linutronix.de>
 <20231103-army-gloater-af710df04628@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231103-army-gloater-af710df04628@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_012414_555191_C94FDD90 
X-CRM114-Status: UNSURE (   5.06  )
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

On 2023-11-03 08:14:01 [+0000], Conor Dooley wrote:
> I'm don't think that problems are restricted to a tree containing Evan's
> patch for parallel checks. For example:

I saw check_unaligned_access() being invoked from arch_initcall()/
check_unaligned_access_boot_cpu() which is fine. The other invocation
from smp_callin() (secondary bring up). This is not. Evan's patch makes
them all happen from SMP-function call which happens always with
disabled interrupts.

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
